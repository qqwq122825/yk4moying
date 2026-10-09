#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""给 lab 证书加上厂商域名的 SAN，并把 CA 转成 Android 系统信任库格式（<hash>.0）。

用途：网络层接管方案 —— 手机侧把被控端的出站流量重定向到我们的 lab 时，
lab 必须用**这些域名**的证书完成 TLS，否则被控端（OkHttp）会直接握手失败。
"""
import hashlib
import io
import ipaddress
import os
import sys

from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.x509.oid import NameOID

OUT = r'state\tls'
DOMAINS = ['example.com', 'www.example.com', 'whh6666.com', 'www.whh6666.com',
           'relay.example.org', 'example.cn', 'localhost']


def main():
    os.makedirs(OUT, exist_ok=True)
    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    subject = x509.Name([
        x509.NameAttribute(NameOID.COUNTRY_NAME, 'CN'),
        x509.NameAttribute(NameOID.ORGANIZATION_NAME, 'REF C2 Lab'),
        x509.NameAttribute(NameOID.COMMON_NAME, DOMAINS[0]),
    ])
    import datetime
    now = datetime.datetime.utcnow()
    builder = (x509.CertificateBuilder()
               .subject_name(subject).issuer_name(subject)
               .public_key(key.public_key())
               .serial_number(x509.random_serial_number())
               .not_valid_before(now - datetime.timedelta(days=1))
               .not_valid_after(now + datetime.timedelta(days=3650))
               .add_extension(x509.SubjectAlternativeName(
                   [x509.DNSName(d) for d in DOMAINS] +
                   [x509.IPAddress(ipaddress.ip_address('127.0.0.1')),
                    x509.IPAddress(ipaddress.ip_address('172.16.0.2'))]), critical=False)
               .add_extension(x509.BasicConstraints(ca=True, path_length=None), critical=True))
    cert = builder.sign(key, hashes.SHA256())
    cert_pem = cert.public_bytes(serialization.Encoding.PEM)
    key_pem = key.private_bytes(serialization.Encoding.PEM,
                                serialization.PrivateFormat.TraditionalOpenSSL,
                                serialization.NoEncryption())
    io.open(os.path.join(OUT, 'cert_san.pem'), 'wb').write(cert_pem)
    io.open(os.path.join(OUT, 'key_san.pem'), 'wb').write(key_pem)

    # Android 系统信任库文件名 = openssl subject_hash_old（MD5 前 4 字节小端十六进制）
    md5 = hashlib.md5(cert.subject.rfc4514_string().encode()).digest()   # 占位：真实 hash 用下面的 openssl
    name = None
    import subprocess
    try:
        r = subprocess.run(['openssl', 'x509', '-inform', 'PEM', '-subject_hash_old',
                            '-in', os.path.join(OUT, 'cert_san.pem')],
                           capture_output=True, text=True)
        name = (r.stdout.strip().splitlines() or [''])[0]
    except Exception:
        pass
    if not name:
        name = md5[:4][::-1].hex()
    cacerts = os.path.join(OUT, 'cacerts')
    os.makedirs(cacerts, exist_ok=True)
    dst = os.path.join(cacerts, name + '.0')
    io.open(dst, 'wb').write(cert_pem)
    print('证书：%s' % os.path.join(OUT, 'cert_san.pem'))
    print('私钥：%s' % os.path.join(OUT, 'key_san.pem'))
    print('Android 系统 CA 文件名：%s' % os.path.basename(dst))
    print('SAN：%s' % ', '.join(DOMAINS))
    return 0


if __name__ == '__main__':
    sys.exit(main())
