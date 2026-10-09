#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把厂商真 APK 重新构建成**指向我们实验室 C2 的可安装 APK**（真 dex + 真签名）。

为什么这么做：交付里的"被控端"必须是**能在真机上装起来、跑原版逻辑**的包，而不是只有结构的空壳。
本工具在**不改变任何文件长度**的前提下原地改字符串（DEX / AXML 都支持），再用
v1（jarsigner）+ v2（自实现 APK Signature Scheme v2）签名，产出可直接 `adb install` 的包。

子命令：
  inspect  <apk>                      看 dex/清单里跟目标相关的字符串与可打补丁点
  build    <apk> --host <h> --port <p> [--prefix /r] --out out.apk [--ks key.pem --cert cert.pem]
  verify   <apk>                      校验 v2 块与签名（自实现校验器）
"""
import argparse
import base64
import hashlib
import io
import os
import re
import struct
import subprocess
import sys
import zipfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__))))
from dexlib import AxmlReader  # noqa: E402

MAGIC = b'APK Sig Block 42'
V2_BLOCK_ID = 0x7109871a


# ------------------------------------------------------------------ ZIP 读写（保序、原样搬运）
def read_zip_entries(path):
    """返回 [(name, data, is_dir)]，保持原始顺序"""
    out = []
    with zipfile.ZipFile(path) as z:
        for info in z.infolist():
            data = b'' if info.is_dir() else z.read(info.filename)
            out.append((info.filename, data, info.is_dir()))
    return out


def write_zip(entries, out_path):
    """按原始顺序重新打包（stored/deflate 自动选择），并做 4 字节对齐（zipalign 等价）"""
    with zipfile.ZipFile(out_path, 'w', zipfile.ZIP_DEFLATED) as z:
        for name, data, is_dir in entries:
            if is_dir:
                z.writestr(zipfile.ZipInfo(name + '/'), b'')
                continue
            zi = zipfile.ZipInfo(name, date_time=(2026, 1, 1, 0, 0, 0))
            zi.compress_type = zipfile.ZIP_STORED if name == 'resources.arsc' else zipfile.ZIP_DEFLATED
            zi.external_attr = 0o644 << 16
            z.writestr(zi, data)


# ------------------------------------------------------------------ 原地字符串补丁（不变长度）
def patch_bytes_same_len(buf, old, new):
    """在同一份字节里把 old 换成 new，**长度必须相同**（DEX/AXML 的偏移才不会整体位移）"""
    if len(old) != len(new):
        raise ValueError('补丁长度不一致：%d → %d' % (len(old), len(new)))
    n = buf.count(old)
    return buf.replace(old, new), n


def _invalid_host_for(length):
    """给任意长度 L 造一个**恰好 L 字符**、且以保留 TLD `.invalid` 结尾的域名（永不解析）"""
    if length <= 8:
        return None
    return ('a' * (length - 8)) + '.invalid'


def neutralize_all_hosts(blob, keep_hosts=('127.0.0.1', 'localhost',
                                          # XML 命名空间不是网络端点，改了反而破坏清单
                                          'schemas.android.com', 'www.w3.org')):
    """把 blob 里**所有** `http(s)://<host>` 第三方主机换成等长的 `.invalid` 域名。

    这是"数据不外发"的技术保证：无论 App 想连 Google/Firebase/Telegram 还是任何厂商域名，
    域名都不存在 → 连 DNS 都出不去，更不会有数据到达第三方。
    只保留 lab 自己的地址（127.0.0.1 / localhost）。
    """
    plan = []
    for m in re.finditer(rb'(https?://)([A-Za-z0-9\.\-]{4,})', blob):
        scheme, host = m.group(1), m.group(2)
        h = host.decode('ascii', 'ignore')
        if h in keep_hosts or h.endswith('.invalid'):
            continue
        repl = _invalid_host_for(len(host))
        if not repl or len(repl) != len(host):
            continue
        plan.append((scheme + host, scheme + repl.encode()))
    # 去重（同一串在包里可能出现多次）
    seen, uniq = set(), []
    for old, new in plan:
        if old not in seen:
            seen.add(old)
            uniq.append((old, new))
    return uniq


def plan_substring_patches(blob, lab_url, vendor_hosts, dummy=b'no-such.host'):
    """在**整块字节**上做等长替换：替换单位是"scheme+host"子串，而不是整条字符串。

    这样做的好处（第一版踩过的坑）：DEX 字符串池里的字符串前面是 uleb128 长度前缀，
    用正则按整条字符串匹配会把前缀字节也吃进来，导致 startswith 判定全部落空、只能退化成无效化。
    换成"只换 scheme+host 这一截"后，长度不变（同长度替换），前缀/后缀原样保留。

    两条硬规则：
      1. **重定向到实验室**：`https://www.<vendor>` → 实验室 URL（长度必须一样，凑不齐才退化成无效化）
      2. **无效化**：其余一律换成**等长的保留域名**（`.invalid` 永不解析）——
         这是"不把数据发给第三方"的技术保证：真机上任何残留端点都打不出去。
    """
    plan = []
    lab = lab_url.encode()
    vhosts = sorted({v if isinstance(v, bytes) else v.encode() for v in vendor_hosts},
                    key=len, reverse=True)
    for v in vhosts:
        # 每个厂商域名配一个**恰好等长**的保留域名（.invalid / .test 永不解析）
        dummies = {11: b'abc.invalid', 12: b'abcd.invalid', 15: b'abcdefg.invalid',
                   16: b'abcdefgh.invalid'}
        for scheme in (b'https://', b'http://'):
            for host_form in (b'www.' + v, v):
                old = scheme + host_form
                if old not in blob:
                    continue
                if len(lab) == len(old):
                    plan.append((old, lab))
                else:
                    d = dummies.get(len(host_form))
                    if d and len(d) == len(host_form):
                        plan.append((old, scheme + d))
        if v in blob:
            d = dummies.get(len(v))
            if d and len(d) == len(v):
                plan.append((v, d))
    return plan


# ------------------------------------------------------------------ APK Signature Scheme v2
def _chunked_digest(data, chunk=1048576):
    """v2 摘要：把 APK 按 1MB 切块，每块前加 0xa5 || uint32 长度 后各自 SHA-256"""
    digests = []
    for off in range(0, len(data), chunk):
        part = data[off:off + chunk]
        h = hashlib.sha256()
        h.update(b'\xa5' + struct.pack('<I', len(part)))
        h.update(part)
        digests.append(h.digest())
    return digests


def _len_prefixed(*parts):
    out = b''
    for p in parts:
        out += struct.pack('<I', len(p)) + p
    return out


def _split_apk_v2(apk):
    """把 APK 分成 (before, signing_block_or_None, central_dir, eocd, cd_offset_from_eocd)"""
    eocd_pos = apk.rfind(b'PK\x05\x06')
    if eocd_pos < 0:
        raise ValueError('找不到 EOCD')
    cd_size, cd_offset = struct.unpack_from('<II', apk, eocd_pos + 12)
    if apk[cd_offset - 16:cd_offset] == MAGIC:
        block_size = struct.unpack_from('<Q', apk, cd_offset - 24)[0]
        start = cd_offset - block_size - 8
        return apk[:start], apk[start:cd_offset], apk[cd_offset:cd_offset + cd_size], apk[eocd_pos:], eocd_pos
    return apk[:cd_offset], None, apk[cd_offset:cd_offset + cd_size], apk[eocd_pos:], eocd_pos


def sign_v2(apk_bytes, key, cert_der, extra_attrs=None):
    """实现 APK Signature Scheme v2（单签名者，RSA PKCS#1 v1.5 + SHA-256）"""
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.primitives.asymmetric import padding

    before, _old, central, eocd, eocd_pos = _split_apk_v2(apk_bytes)
    # 摘要只覆盖：段1（before）+ 段3（central）+ 段4（EOCD，且其 cd offset 需改成去掉签名块后的值）
    cd_offset_new = len(before)
    eocd_fixed = bytearray(eocd)
    struct.pack_into('<I', eocd_fixed, 16, cd_offset_new)
    digests = _chunked_digest(bytes(before) + central + bytes(eocd_fixed))

    certs = _len_prefixed(cert_der)
    digest_part = _len_prefixed(*digests)
    # signed data = digests || certificates || additional attributes
    signed_data = _len_prefixed(digest_part, certs, b'')
    sig = key.sign(signed_data, padding.PKCS1v15(), hashes.SHA256())
    # 签名条目 = 算法 ID（**裸 u32，不能加长度前缀**）+ 长度前缀的签名字节
    # （第一版把算法 ID 也当字节切片套了长度前缀，多出 4 字节 → Android/自校验都验不过）
    signature_part = struct.pack('<I', 0x0103) + _len_prefixed(sig)
    # 签名者公钥（DER/SubjectPublicKeyInfo）——**必填**，之前漏了会被真机判 Invalid apk
    from cryptography.hazmat.primitives import serialization as _ser
    pub = key.public_key().public_bytes(_ser.Encoding.DER,
                                        _ser.PublicFormat.SubjectPublicKeyInfo)
    signer = _len_prefixed(signed_data, signature_part, pub)
    signers = _len_prefixed(signer)
    block_value = signers

    pair = struct.pack('<Q', len(block_value) + 4) + struct.pack('<I', V2_BLOCK_ID) + block_value
    size = len(pair) + 8 + len(MAGIC) - 8      # 见下方组装：块大小字段不含自身
    block = (struct.pack('<Q', len(pair) + 8 + len(MAGIC) - 8 - 8) + pair[8:] +
             struct.pack('<Q', len(pair) + 8 + len(MAGIC) - 8 - 8) + MAGIC)
    # 上面两行是"块长度 = 全部内容 - 8"的标准写法，这里按规范重新组装一次以免歧义：
    body = pair[8:]                                   # 去掉第一个长度字段
    total = len(body) + 8 + len(MAGIC)                # 内容 + 首尾两个 u64 + magic
    block = struct.pack('<Q', total) + body + struct.pack('<Q', total) + MAGIC

    out_central_offset = len(before) + len(block)
    eocd_out = bytearray(eocd)
    struct.pack_into('<I', eocd_out, 16, out_central_offset)
    out = bytes(before) + block + central + bytes(eocd_out)
    return out


def verify_v2(apk_bytes):
    """自实现校验：解析 v2 块、重算摘要、验签（返回 (ok, detail)）"""
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.primitives.asymmetric import padding
    from cryptography import x509

    try:
        before, block, central, eocd, _p = _split_apk_v2(apk_bytes)
        if not block:
            return False, '没有 v2 签名块'
        # 块布局：u64 总长 | u32 块ID | value | u64 总长 | MAGIC(16)
        total = struct.unpack_from('<Q', block, 0)[0]
        bid = struct.unpack_from('<I', block, 8)[0]
        if bid != V2_BLOCK_ID:
            return False, '块 ID 不是 0x7109871a（读到 0x%x）' % bid
        val = block[12:len(block) - 24]
        # signers → 第一个 signer
        signers_len = struct.unpack_from('<I', val, 0)[0]
        signer = val[4:4 + signers_len]
        sd_len = struct.unpack_from('<I', signer, 0)[0]
        signed_data = signer[4:4 + sd_len]
        rest = signer[4 + sd_len:]
        sigs_len = struct.unpack_from('<I', rest, 0)[0]
        sigs = rest[4:4 + sigs_len]
        alg = struct.unpack_from('<I', sigs, 0)[0]
        sig_len = struct.unpack_from('<I', sigs, 4)[0]
        sig = sigs[8:8 + sig_len]
        # 证书
        dg_len = struct.unpack_from('<I', signed_data, 0)[0]
        digests_blob = signed_data[4:4 + dg_len]
        certs_len = struct.unpack_from('<I', signed_data, 4 + dg_len)[0]
        certs_blob = signed_data[8 + dg_len:8 + dg_len + certs_len]
        clen = struct.unpack_from('<I', certs_blob, 0)[0]
        cert_der = certs_blob[4:4 + clen]
        cert = x509.load_der_x509_certificate(cert_der)
        # 解析 signer 末尾的 public key 并断言与证书公钥一致（规范要求存在且匹配）
        pk_len = struct.unpack_from('<I', rest, 4 + sigs_len)[0]
        pk_der = rest[8 + sigs_len:8 + sigs_len + pk_len]
        cert_pub = cert.public_key().public_bytes(serialization.Encoding.DER,
                                                  serialization.PublicFormat.SubjectPublicKeyInfo)
        if pk_der != cert_pub:
            return False, '签名者公钥与证书公钥不一致（或缺 public key）'
        cert.public_key().verify(sig, signed_data, padding.PKCS1v15(), hashes.SHA256())
        # 重算摘要
        eocd_fixed = bytearray(eocd)
        struct.pack_into('<I', eocd_fixed, 16, len(before))
        want = _chunked_digest(before + central + bytes(eocd_fixed))
        got = []
        off = 0
        while off + 4 <= len(digests_blob):
            n = struct.unpack_from('<I', digests_blob, off)[0]
            got.append(digests_blob[off + 4:off + 4 + n])
            off += 4 + n
        if len(got) != len(want):
            return False, '摘要段数不一致 %d/%d' % (len(got), len(want))
        for a, b in zip(got, want):
            if a != b:
                return False, '摘要不匹配（内容被改过）'
        return True, 'v2 签名有效（RSA/SHA-256，算法 id=0x%x，%d 段摘要）' % (alg, len(got))
    except Exception as e:
        import traceback
        return False, '校验异常：%s | %s' % (e, traceback.format_exc().splitlines()[-3:])


# ------------------------------------------------------------------ 密钥与 v1 签名
def ensure_key(ks_dir):
    os.makedirs(ks_dir, exist_ok=True)
    ks = os.path.join(ks_dir, 'lab.keystore')
    if not os.path.exists(ks):
        subprocess.run(['keytool', '-genkeypair', '-keystore', ks, '-alias', 'lab',
                        '-storepass', 'CHANGE_ME', '-keypass', 'CHANGE_ME', '-keyalg', 'RSA',
                        '-keysize', '2048', '-validity', '3650', '-dname',
                        'CN=REF C2 Lab, OU=Lab, O=REF, L=CN, ST=CN, C=CN'],
                       check=True, capture_output=True)
    return ks


def sign_v1(apk_path, ks):
    r = subprocess.run(['jarsigner', '-keystore', ks, '-storepass', 'CHANGE_ME', '-keypass',
                        'CHANGE_ME', '-sigalg', 'SHA256withRSA', '-digestalg', 'SHA-256',
                        apk_path, 'lab'], capture_output=True, text=True)
    return r.returncode == 0, (r.stdout + r.stderr).strip()[:200]


# ------------------------------------------------------------------ 主流程
def cmd_inspect(a):
    z = zipfile.ZipFile(a.apk)
    ax = AxmlReader(z.read('AndroidManifest.xml'))
    print('清单：%s' % ax.manifest_summary())
    for name in z.namelist():
        if name.endswith('.dex'):
            data = z.read(name)
            ss = set(re.findall(rb'[\x20-\x7e]{8,}', data))
            hits = sorted(s.decode() for s in ss if any(v.encode() in s for v in a.vendor))
            print('-- %s：命中厂商域名串 %d 条' % (name, len(hits)))
            for h in hits[:20]:
                print('     %-96s (%d)' % (h[:96], len(h)))
    for name in ('res/xml/network_security_config.xml',):
        if name in z.namelist():
            b = z.read(name)
            doms = sorted({m.group(1).decode() for m in re.finditer(rb'[\x20-\x7e]{6,}', b)})
            print('-- %s 里的串：%s' % (name, [d for d in doms if '.' in d][:14]))
    return 0


def cmd_build(a):
    from cryptography.hazmat.primitives import serialization
    from cryptography import x509

    ks = ensure_key(a.ksdir)
    # 从 keystore 里导出私钥与证书（用 keytool 导出证书，私钥用 PKCS12 转换）
    p12 = os.path.join(a.ksdir, 'lab.p12')
    if not os.path.exists(p12):
        subprocess.run(['keytool', '-importkeystore', '-srckeystore', ks, '-srcstorepass', 'CHANGE_ME',
                        '-srcalias', 'lab', '-destkeystore', p12, '-deststoretype', 'PKCS12',
                        '-deststorepass', 'CHANGE_ME', '-destkeypass', 'CHANGE_ME'],
                       check=True, capture_output=True)
    from cryptography.hazmat.primitives.serialization import pkcs12
    key, cert, _ = pkcs12.load_key_and_certificates(open(p12, 'rb').read(), b'CHANGE_ME')
    cert_der = cert.public_bytes(serialization.Encoding.DER)

    entries = read_zip_entries(a.apk)
    patched = 0
    out_entries = []
    for name, data, is_dir in entries:
        if is_dir:
            out_entries.append((name, data, True))
            continue
        new = data
        if name.endswith('.dex') or name.startswith('res/'):
            lab_url = 'http://%s:%d/rr' % (a.host, a.port)      # /rr 正好 3 字节，凑满 24 字节
            plan = plan_substring_patches(new, lab_url, a.vendor)
            if not a.no_neutralize:
                plan += neutralize_all_hosts(new)
            for old, new_s in plan:
                try:
                    new, n = patch_bytes_same_len(new, old, new_s)
                    patched += n
                    print('   [patch] %-32s → %s' % (old.decode('utf-8', 'replace')[:32],
                                                     new_s.decode('utf-8', 'replace')[:32]))
                except Exception as e:
                    print('   [skip ] %s（%s）' % (old.decode('utf-8', 'replace'), e))
        out_entries.append((name, new, is_dir))

    tmp = a.out + '.tmp.apk'
    os.makedirs(os.path.dirname(os.path.abspath(a.out)) or '.', exist_ok=True)
    write_zip(out_entries, tmp)
    ok1, msg1 = sign_v1(tmp, ks)
    print('   v1 签名：%s %s' % (ok1, msg1[:80]))
    signed = sign_v2(open(tmp, 'rb').read(), key, cert_der)
    open(a.out, 'wb').write(signed)
    os.remove(tmp)
    ok2, msg2 = verify_v2(open(a.out, 'rb').read())
    print('   v2 签名：%s %s' % (ok2, msg2))
    print('   已生成 %s（%.1f MB，替换 %d 处字符串）'
          % (a.out, os.path.getsize(a.out) / 1048576, patched))
    return 0 if (ok1 and ok2) else 1


def cmd_verify(a):
    ok, msg = verify_v2(open(a.apk, 'rb').read())
    print('v2 校验：%s %s' % (ok, msg))
    r = subprocess.run(['jarsigner', '-verify', '-certs', a.apk], capture_output=True, text=True)
    print('v1 校验：%s' % (r.returncode == 0))
    # 「不把数据发给第三方」的机械证据：产物里不能再出现任何厂商域名，
    # 且所有 http(s) 主机只能是 lab（127.0.0.1/localhost）或以保留 TLD .invalid 结尾
    z = zipfile.ZipFile(a.apk)
    leftovers, hosts = [], set()
    for name in z.namelist():
        if not (name.endswith('.dex') or name.startswith('res/') or name == 'AndroidManifest.xml'):
            continue
        blob = z.read(name)
        for v in (a.vendor if isinstance(a.vendor, list) else [a.vendor]):
            if v.encode() in blob:
                leftovers.append((name, v))
        for m in re.finditer(rb'https?://([A-Za-z0-9\.\-]{4,})', blob):
            hosts.add(m.group(1).decode('ascii', 'ignore'))
    # XML 命名空间标识符（schemas.android.com / www.w3.org）只是字符串，从不作为网络端点访问
    NS_ONLY = {'schemas.android.com', 'www.w3.org'}
    bad_hosts = sorted(h for h in hosts
                       if h not in ('127.0.0.1', 'localhost') and h not in NS_ONLY
                       and not h.endswith('.invalid'))
    print('残留厂商域名：%s' % (leftovers or '无（0 处）'))
    print('包里所有 http(s) 主机：%s' % sorted(hosts))
    print('非 lab / 非保留域名的第三方主机：%s' % (bad_hosts or '无（0 处）'))
    return 0 if (ok and not leftovers and not bad_hosts) else 1


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest='cmd', required=True)
    p1 = sub.add_parser('inspect')
    p1.add_argument('apk')
    p1.add_argument('--vendor', nargs='*', default=['example.com'])
    p1.set_defaults(fn=cmd_inspect)

    p2 = sub.add_parser('build')
    p2.add_argument('apk')
    p2.add_argument('--host', required=True)
    p2.add_argument('--port', type=int, default=8793)
    p2.add_argument('--out', required=True)
    p2.add_argument('--vendor', nargs='*', default=['example.com'])
    p2.add_argument('--ksdir', default=os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                                    '..', 'state', 'keys'))
    p2.add_argument('--no-neutralize', action='store_true',
                    help='不做"全量第三方域名无效化"（默认做：所有 http(s) 主机改写成 .invalid）')
    p2.set_defaults(fn=cmd_build)

    p3 = sub.add_parser('verify')
    p3.add_argument('apk')
    p3.add_argument('--vendor', nargs='*', default=['example.com'])
    p3.set_defaults(fn=cmd_verify)
    a = ap.parse_args()
    return a.fn(a)


if __name__ == '__main__':
    sys.exit(main())
