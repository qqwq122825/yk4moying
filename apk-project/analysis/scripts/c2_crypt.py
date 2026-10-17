#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
c2_crypt.py — 独立实现的 AES-128/ECB/PKCS5 + Base64 编解码器
用于还原并验证样本 (com.lite.cloudfinder) 的 C2 加密信道：

    算法: AES/ECB/PKCS5Padding
    密钥: "0623U25KTT3YO8P9"   (16 字节 ASCII，硬编码于 p081/C0762.java 构造器)
    编码: java.util.Base64 / android.util.Base64
          加密侧 flag=2 (NO_WRAP)，解密侧 flag=0 (DEFAULT，可含换行)

自带 FIPS-197 已知答案测试 (KAT)，可在无第三方库环境下自证实现正确。

用法:
  python c2_crypt.py selftest
  python c2_crypt.py dec <base64字符串>        # 解出明文 JSON
  python c2_crypt.py enc '<json文本>'          # 加密，输出与 App 相同的 base64
"""
import sys, base64, json

KEY = b"0623U25KTT3YO8P9"

SBOX = [
    0x63,0x7c,0x77,0x7b,0xf2,0x6b,0x6f,0xc5,0x30,0x01,0x67,0x2b,0xfe,0xd7,0xab,0x76,
    0xca,0x82,0xc9,0x7d,0xfa,0x59,0x47,0xf0,0xad,0xd4,0xa2,0xaf,0x9c,0xa4,0x72,0xc0,
    0xb7,0xfd,0x93,0x26,0x36,0x3f,0xf7,0xcc,0x34,0xa5,0xe5,0xf1,0x71,0xd8,0x31,0x15,
    0x04,0xc7,0x23,0xc3,0x18,0x96,0x05,0x9a,0x07,0x12,0x80,0xe2,0xeb,0x27,0xb2,0x75,
    0x09,0x83,0x2c,0x1a,0x1b,0x6e,0x5a,0xa0,0x52,0x3b,0xd6,0xb3,0x29,0xe3,0x2f,0x84,
    0x53,0xd1,0x00,0xed,0x20,0xfc,0xb1,0x5b,0x6a,0xcb,0xbe,0x39,0x4a,0x4c,0x58,0xcf,
    0xd0,0xef,0xaa,0xfb,0x43,0x4d,0x33,0x85,0x45,0xf9,0x02,0x7f,0x50,0x3c,0x9f,0xa8,
    0x51,0xa3,0x40,0x8f,0x92,0x9d,0x38,0xf5,0xbc,0xb6,0xda,0x21,0x10,0xff,0xf3,0xd2,
    0xcd,0x0c,0x13,0xec,0x5f,0x97,0x44,0x17,0xc4,0xa7,0x7e,0x3d,0x64,0x5d,0x19,0x73,
    0x60,0x81,0x4f,0xdc,0x22,0x2a,0x90,0x88,0x46,0xee,0xb8,0x14,0xde,0x5e,0x0b,0xdb,
    0xe0,0x32,0x3a,0x0a,0x49,0x06,0x24,0x5c,0xc2,0xd3,0xac,0x62,0x91,0x95,0xe4,0x79,
    0xe7,0xc8,0x37,0x6d,0x8d,0xd5,0x4e,0xa9,0x6c,0x56,0xf4,0xea,0x65,0x7a,0xae,0x08,
    0xba,0x78,0x25,0x2e,0x1c,0xa6,0xb4,0xc6,0xe8,0xdd,0x74,0x1f,0x4b,0xbd,0x8b,0x8a,
    0x70,0x3e,0xb5,0x66,0x48,0x03,0xf6,0x0e,0x61,0x35,0x57,0xb9,0x86,0xc1,0x1d,0x9e,
    0xe1,0xf8,0x98,0x11,0x69,0xd9,0x8e,0x94,0x9b,0x1e,0x87,0xe9,0xce,0x55,0x28,0xdf,
    0x8c,0xa1,0x89,0x0d,0xbf,0xe6,0x42,0x68,0x41,0x99,0x2d,0x0f,0xb0,0x54,0xbb,0x16,
]
INV_SBOX = [0] * 256
for i, v in enumerate(SBOX):
    INV_SBOX[v] = i
RCON = [0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x1b,0x36,
        0x6c,0xd8,0xab,0x4d,0x9a]


def xtime(a):
    a <<= 1
    if a & 0x100:
        a ^= 0x11b
    return a & 0xff


def gmul(a, b):
    p = 0
    for _ in range(8):
        if b & 1:
            p ^= a
        b >>= 1
        a = xtime(a)
    return p & 0xff


def expand_key(key):
    assert len(key) == 16, "AES-128 需要 16 字节密钥"
    w = [list(key[i:i + 4]) for i in range(0, 16, 4)]
    for i in range(4, 44):
        t = list(w[i - 1])
        if i % 4 == 0:
            t = t[1:] + t[:1]
            t = [SBOX[b] for b in t]
            t[0] ^= RCON[i // 4 - 1]
        w.append([w[i - 4][j] ^ t[j] for j in range(4)])
    return [sum(w[4 * r:4 * r + 4], []) for r in range(11)]  # 11 轮密钥，每轮 16 字节


def add_round_key(s, k):
    return [s[i] ^ k[i] for i in range(16)]


def shift_rows(s):
    # 状态按列存放: s[c*4+r]
    out = [0] * 16
    for r in range(4):
        for c in range(4):
            out[c * 4 + r] = s[((c + r) % 4) * 4 + r]
    return out


def inv_shift_rows(s):
    out = [0] * 16
    for r in range(4):
        for c in range(4):
            out[c * 4 + r] = s[((c - r) % 4) * 4 + r]
    return out


def mix_columns(s):
    out = [0] * 16
    for c in range(4):
        a = s[c * 4:c * 4 + 4]
        out[c * 4 + 0] = gmul(a[0], 2) ^ gmul(a[1], 3) ^ a[2] ^ a[3]
        out[c * 4 + 1] = a[0] ^ gmul(a[1], 2) ^ gmul(a[2], 3) ^ a[3]
        out[c * 4 + 2] = a[0] ^ a[1] ^ gmul(a[2], 2) ^ gmul(a[3], 3)
        out[c * 4 + 3] = gmul(a[0], 3) ^ a[1] ^ a[2] ^ gmul(a[3], 2)
    return out


def inv_mix_columns(s):
    out = [0] * 16
    for c in range(4):
        a = s[c * 4:c * 4 + 4]
        out[c * 4 + 0] = gmul(a[0], 14) ^ gmul(a[1], 11) ^ gmul(a[2], 13) ^ gmul(a[3], 9)
        out[c * 4 + 1] = gmul(a[0], 9) ^ gmul(a[1], 14) ^ gmul(a[2], 11) ^ gmul(a[3], 13)
        out[c * 4 + 2] = gmul(a[0], 13) ^ gmul(a[1], 9) ^ gmul(a[2], 14) ^ gmul(a[3], 11)
        out[c * 4 + 3] = gmul(a[0], 11) ^ gmul(a[1], 13) ^ gmul(a[2], 9) ^ gmul(a[3], 14)
    return out


def encrypt_block(block, rk):
    s = add_round_key(list(block), rk[0])
    for r in range(1, 10):
        s = [SBOX[b] for b in s]
        s = shift_rows(s)
        s = mix_columns(s)
        s = add_round_key(s, rk[r])
    s = [SBOX[b] for b in s]
    s = shift_rows(s)
    return bytes(add_round_key(s, rk[10]))


def decrypt_block(block, rk):
    s = add_round_key(list(block), rk[10])
    for r in range(9, 0, -1):
        s = inv_shift_rows(s)
        s = [INV_SBOX[b] for b in s]
        s = add_round_key(s, rk[r])
        s = inv_mix_columns(s)
    s = inv_shift_rows(s)
    s = [INV_SBOX[b] for b in s]
    return bytes(add_round_key(s, rk[0]))


def pkcs5_pad(data):
    pad = 16 - (len(data) % 16)
    return data + bytes([pad]) * pad


def pkcs5_unpad(data):
    if not data or len(data) % 16:
        raise ValueError("bad block length")
    pad = data[-1]
    if pad < 1 or pad > 16 or data[-pad:] != bytes([pad]) * pad:
        raise ValueError("bad PKCS5 padding")
    return data[:-pad]


def encrypt(plaintext, key=KEY):
    rk = expand_key(key)
    raw = plaintext.encode("utf-8") if isinstance(plaintext, str) else plaintext
    data = pkcs5_pad(raw)
    out = b"".join(encrypt_block(data[i:i + 16], rk) for i in range(0, len(data), 16))
    return base64.b64encode(out).decode("ascii")  # 等价 Base64.NO_WRAP


def decrypt(b64, key=KEY):
    rk = expand_key(key)
    data = base64.b64decode("".join(b64.split()))
    if len(data) % 16:
        raise ValueError("ciphertext not multiple of 16")
    out = b"".join(decrypt_block(data[i:i + 16], rk) for i in range(0, len(data), 16))
    return pkcs5_unpad(out).decode("utf-8")


def selftest():
    rk = expand_key(bytes(range(16)))
    pt = bytes.fromhex("00112233445566778899aabbccddeeff")
    ct = encrypt_block(pt, rk).hex()
    expect = "69c4e0d86a7b0430d8cdb78070b4c55a"          # FIPS-197 Appendix C.1
    print("[KAT] AES-128 encrypt known answer:", ct)
    print("[KAT] expected                      :", expect, "->", "PASS" if ct == expect else "FAIL")
    back = decrypt_block(bytes.fromhex(ct), rk).hex()
    print("[KAT] decrypt round-trip            :", back, "->", "PASS" if back == pt.hex() else "FAIL")

    sample = '{"action":"deviceOnline","type":"enc","data":{"deviceId":"abc"}}'
    enc = encrypt(sample)
    dec = decrypt(enc)
    print("[E2E] key      :", KEY.decode())
    print("[E2E] plaintext:", sample)
    print("[E2E] base64   :", enc)
    print("[E2E] decrypt  :", dec, "->", "PASS" if dec == sample else "FAIL")

    # 解密侧必须容忍 App 端 Base64.DEFAULT 可能插入的换行
    wrapped = "\n".join(enc[i:i + 20] for i in range(0, len(enc), 20))
    print("[E2E] wrapped b64 decrypt:", "PASS" if decrypt(wrapped) == sample else "FAIL")
    ok = (ct == expect and back == pt.hex() and dec == sample)
    print("SELFTEST:", "ALL PASS" if ok else "FAILED")
    return 0 if ok else 1


def main(argv):
    if len(argv) < 2 or argv[1] == "selftest":
        return selftest()
    if argv[1] == "dec":
        raw = decrypt(argv[2])
        try:
            print(json.dumps(json.loads(raw), ensure_ascii=False, indent=2))
        except Exception:
            print(raw)
        return 0
    if argv[1] == "enc":
        print(encrypt(argv[2]))
        return 0
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
