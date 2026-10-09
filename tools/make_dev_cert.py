#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""为本机演示实例签发一张自签证书（state/tls/），供 refc2 --tls-cert/--tls-key 使用。

用途：原版中继通道前端把实时通道写死成 wss://，只有 HTTPS 部署下才连得上；
本地要复现"和线上一样的形态"就得起 TLS。证书只落在 repro/state/tls/ 下，只用于本机 127.0.0.1。
"""
import datetime
import io
import ipaddress
import os

from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.x509.oid import NameOID

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'state', 'tls')


def main():
    os.makedirs(OUT, exist_ok=True)
    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    subject = issuer = x509.Name([
        x509.NameAttribute(NameOID.COUNTRY_NAME, 'CN'),
        x509.NameAttribute(NameOID.ORGANIZATION_NAME, 'REF C2 Local Demo'),
        x509.NameAttribute(NameOID.COMMON_NAME, '127.0.0.1'),
    ])
    now = datetime.datetime.utcnow()
    cert = (x509.CertificateBuilder()
            .subject_name(subject).issuer_name(issuer)
            .public_key(key.public_key())
            .serial_number(x509.random_serial_number())
            .not_valid_before(now - datetime.timedelta(days=1))
            .not_valid_after(now + datetime.timedelta(days=3650))
            .add_extension(x509.SubjectAlternativeName([
                x509.DNSName('localhost'),
                x509.IPAddress(ipaddress.ip_address('127.0.0.1')),
            ]), critical=False)
            .sign(key, hashes.SHA256()))
    key_p = os.path.join(OUT, 'key.pem')
    crt_p = os.path.join(OUT, 'cert.pem')
    with io.open(key_p, 'wb') as fh:
        fh.write(key.private_bytes(serialization.Encoding.PEM,
                                   serialization.PrivateFormat.TraditionalOpenSSL,
                                   serialization.NoEncryption()))
    with io.open(crt_p, 'wb') as fh:
        fh.write(cert.public_bytes(serialization.Encoding.PEM))
    print('证书：%s' % crt_p)
    print('私钥：%s' % key_p)
    print('用法：python server\\refc2.py --port 8793 --tls-cert "%s" --tls-key "%s"' % (crt_p, key_p))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
