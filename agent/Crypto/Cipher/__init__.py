"""纯 Python AES-128/192/256（ECB/CBC），提供 pycryptodome 的最小子集：
    from Crypto.Cipher import AES
    c = AES.new(key, AES.MODE_ECB)             # 也支持 AES.new(key, AES.MODE_CBC, iv)
    c.encrypt(data) / c.decrypt(data)
只依赖标准库，可直接在手机端 Termux 的 python 里跑（连不上 pypi 时的替身）。

状态按标准列主序存放：st[4*c + r]，r=行、c=列。
自检向量（AES-128-ECB，key=b'0623U25KTT3YO8P9'，明文 b'0123456789abcdef'）：
    e582d748a500663b6a8cd5fa6887939e
"""
import struct

SBOX = [
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16,
]
INV_SBOX = [0] * 256
for _i, _v in enumerate(SBOX):
    INV_SBOX[_v] = _i
RCON = [0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d]

MODE_ECB = 1
MODE_CBC = 2


def _xtime(a):
    a <<= 1
    if a & 0x100:
        a = (a ^ 0x1b) & 0xff
    return a


def _mul(a, b):
    """GF(2^8) 乘法（AES 多项式 0x11b）"""
    r = 0
    while b:
        if b & 1:
            r ^= a
        a = _xtime(a)
        b >>= 1
    return r & 0xff


def _expand(key):
    """密钥扩展 -> (轮密钥列表（每轮 16 字节，列主序） + 轮数)"""
    key = bytes(key)
    nk = len(key) // 4
    if nk not in (4, 6, 8):
        raise ValueError('密钥长度必须是 16/24/32 字节')
    nr = {4: 10, 6: 12, 8: 14}[nk]
    w = [list(key[4 * i:4 * i + 4]) for i in range(nk)]
    for i in range(nk, 4 * (nr + 1)):
        t = list(w[i - 1])
        if i % nk == 0:
            t = t[1:] + t[:1]                       # RotWord
            t = [SBOX[b] for b in t]                # SubWord
            t[0] ^= RCON[i // nk - 1]
        elif nk > 6 and i % nk == 4:
            t = [SBOX[b] for b in t]
        w.append([w[i - nk][j] ^ t[j] for j in range(4)])
    # 每轮的 16 字节轮密钥：列 c 的 4 字节 = w[4*round + c]
    rk = []
    for r in range(nr + 1):
        rk.append(bytes(sum((w[4 * r + c] for c in range(4)), [])))
    return rk, nr


def _add_round_key(st, rk):
    for i in range(16):
        st[i] ^= rk[i]


def _shift_rows(st):
    """第 r 行左循环移位 r（st 列主序：行 r 的四个字节在 4c+r, c=0..3）"""
    for r in range(1, 4):
        row = [st[4 * c + r] for c in range(4)]
        row = row[r:] + row[:r]
        for c in range(4):
            st[4 * c + r] = row[c]


def _inv_shift_rows(st):
    for r in range(1, 4):
        row = [st[4 * c + r] for c in range(4)]
        row = row[-r:] + row[:-r]
        for c in range(4):
            st[4 * c + r] = row[c]


def _mix_columns(st):
    for c in range(4):
        a = st[4 * c:4 * c + 4]
        st[4 * c + 0] = _mul(a[0], 2) ^ _mul(a[1], 3) ^ a[2] ^ a[3]
        st[4 * c + 1] = a[0] ^ _mul(a[1], 2) ^ _mul(a[2], 3) ^ a[3]
        st[4 * c + 2] = a[0] ^ a[1] ^ _mul(a[2], 2) ^ _mul(a[3], 3)
        st[4 * c + 3] = _mul(a[0], 3) ^ a[1] ^ a[2] ^ _mul(a[3], 2)


def _inv_mix_columns(st):
    for c in range(4):
        a = st[4 * c:4 * c + 4]
        st[4 * c + 0] = _mul(a[0], 14) ^ _mul(a[1], 11) ^ _mul(a[2], 13) ^ _mul(a[3], 9)
        st[4 * c + 1] = _mul(a[0], 9) ^ _mul(a[1], 14) ^ _mul(a[2], 11) ^ _mul(a[3], 13)
        st[4 * c + 2] = _mul(a[0], 13) ^ _mul(a[1], 9) ^ _mul(a[2], 14) ^ _mul(a[3], 11)
        st[4 * c + 3] = _mul(a[0], 11) ^ _mul(a[1], 13) ^ _mul(a[2], 9) ^ _mul(a[3], 14)


class _AES(object):
    def __init__(self, key, mode=MODE_ECB, iv=None):
        self.rk, self.nr = _expand(key)
        self.mode = mode
        self.iv = bytes(iv) if iv else None
        if mode == MODE_CBC and (self.iv is None or len(self.iv) != 16):
            raise ValueError('CBC 需要 16 字节 iv')

    def _enc_block(self, b):
        st = list(b)
        _add_round_key(st, self.rk[0])
        for rnd in range(1, self.nr):
            st = [SBOX[x] for x in st]
            _shift_rows(st)
            _mix_columns(st)
            _add_round_key(st, self.rk[rnd])
        st = [SBOX[x] for x in st]
        _shift_rows(st)
        _add_round_key(st, self.rk[self.nr])
        return bytes(st)

    def _dec_block(self, b):
        st = list(b)
        _add_round_key(st, self.rk[self.nr])
        for rnd in range(self.nr - 1, 0, -1):
            _inv_shift_rows(st)
            st = [INV_SBOX[x] for x in st]
            _add_round_key(st, self.rk[rnd])
            _inv_mix_columns(st)
        _inv_shift_rows(st)
        st = [INV_SBOX[x] for x in st]
        _add_round_key(st, self.rk[0])
        return bytes(st)

    def encrypt(self, data):
        data = bytes(data)
        if len(data) % 16:
            raise ValueError('数据长度必须是 16 的倍数')
        if self.mode == MODE_ECB:
            return b''.join(self._enc_block(data[i:i + 16]) for i in range(0, len(data), 16))
        prev = self.iv
        out = bytearray()
        for i in range(0, len(data), 16):
            prev = self._enc_block(bytes(a ^ b for a, b in zip(data[i:i + 16], prev)))
            out += prev
        return bytes(out)

    def decrypt(self, data):
        data = bytes(data)
        if len(data) % 16:
            raise ValueError('数据长度必须是 16 的倍数')
        if self.mode == MODE_ECB:
            return b''.join(self._dec_block(data[i:i + 16]) for i in range(0, len(data), 16))
        prev = self.iv
        out = bytearray()
        for i in range(0, len(data), 16):
            blk = data[i:i + 16]
            out += bytes(a ^ b for a, b in zip(self._dec_block(blk), prev))
            prev = blk
        return bytes(out)


def new(key, mode=MODE_ECB, iv=None, **kw):
    return _AES(key, mode, iv)


class _AESModule(object):
    MODE_ECB = MODE_ECB
    MODE_CBC = MODE_CBC

    def new(self, key, mode=MODE_ECB, iv=None, **kw):
        return new(key, mode, iv, **kw)


AES = _AESModule()
