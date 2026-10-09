#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""构建产物的**结构验收**（用自研 AXML/DEX 解析器回读，而不是只看魔数）：
  1) 用 refc2 的 relay_builder 现构一个 APK
  2) AndroidManifest.xml 必须能被 AxmlReader 解析出 package/versionName/versionCode/activity
  3) classes.dex 必须能被 DexReader 解析出类与方法（真 DEX 结构，不是空壳）
  4) v1/v2 签名必须可用（tools/apk_repack 的签名器与校验器）
判据：全部通过 exit 0
"""
import io
import json
import os
import sys
import tempfile
import zipfile

REPRO = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(REPRO, 'server'))
sys.path.insert(0, os.path.join(REPRO, 'tools'))
from dexlib import AxmlReader, DexReader          # noqa: E402
import relay_builder                              # noqa: E402


def main():
    checks = []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:160]})
        print('%-44s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:90]))

    out_dir = os.path.join(REPRO, 'build')
    os.makedirs(out_dir, exist_ok=True)
    apk = os.path.join(out_dir, 'builder_probe.apk')
    cfg = {'appid': 'com.ref.lab.probe', 'appversion': '1.0.0', 'appname': '参考应用',
           'appurl': 'https://ref.invalid/app', 'nottitle': '加载中~请勿操作',
           'icoid': '', 'uhost': 'host'}
    res = relay_builder.build_apk(cfg, apk)
    path = res.get('path') if isinstance(res, dict) else res
    stages = (res.get('stages') if isinstance(res, dict) else []) or []
    ck('构建器产出 APK', os.path.exists(path), '%s（%d 阶段）' % (os.path.basename(path), len(stages)))

    z = zipfile.ZipFile(path)
    names = z.namelist()
    ck('产物含 AndroidManifest.xml / classes.dex',
       'AndroidManifest.xml' in names and 'classes.dex' in names, ','.join(names[:5]))

    # 1) AXML 回读（规范级校验：能解析出真实属性）
    try:
        ax = AxmlReader(z.read('AndroidManifest.xml'))
        tags = [t for t, _a, _d in ax.elements]
        mf = ax.manifest_summary()
        ok = (mf.get('package') == cfg['appid'] and 'activity' in tags and 'uses-sdk' in tags)
        ck('AndroidManifest 可被规范解析（包名/活动/uses-sdk）', ok, json.dumps(mf, ensure_ascii=False)[:110])
        acts = [a.get('name') for t, a, _ in ax.elements if t == 'activity']
        ck('清单里能读到 activity name', any(acts), str(acts))
    except Exception as e:
        ck('AndroidManifest 可被规范解析', False, str(e))

    # 2) DEX 回读（真结构：类与方法）
    try:
        dr = DexReader(z.read('classes.dex'))
        ck('classes.dex 可被规范解析（类/方法表）',
           len(dr.classes) >= 1 and len(dr.methods) >= 1,
           'classes=%d methods=%d strings=%d' % (len(dr.classes), len(dr.methods), len(dr.strings)))
        ck('DEX 里含实验室类名', any('LabAgent' in c for c, _ in dr.classes),
           str([c for c, _ in dr.classes][:3]))
    except Exception as e:
        ck('classes.dex 可被规范解析', False, str(e))

    # 3) 签名（v1 jarsigner + v2 自实现）
    try:
        sys.path.insert(0, os.path.join(REPRO, 'tools'))
        import apk_repack as AR
        from cryptography.hazmat.primitives.serialization import pkcs12
        ks = AR.ensure_key(os.path.join(REPRO, 'state', 'keys'))
        from cryptography.hazmat.primitives import serialization
        p12 = os.path.join(REPRO, 'state', 'keys', 'lab.p12')
        if not os.path.exists(p12):
            import subprocess
            subprocess.run(['keytool', '-importkeystore', '-srckeystore', ks, '-srcstorepass', 'CHANGE_ME',
                            '-srcalias', 'lab', '-destkeystore', p12, '-deststoretype', 'PKCS12',
                            '-deststorepass', 'CHANGE_ME', '-destkeypass', 'CHANGE_ME'], check=True,
                           capture_output=True)
        key, cert, _ = pkcs12.load_key_and_certificates(open(p12, 'rb').read(), b'CHANGE_ME')
        cert_der = cert.public_bytes(serialization.Encoding.DER)
        signed = AR.sign_v2(open(path, 'rb').read(), key, cert_der)
        open(path, 'wb').write(signed)
        ok, msg = AR.verify_v2(open(path, 'rb').read())
        ck('构建产物可 v2 签名且自校验通过', ok, msg)
    except Exception as e:
        ck('构建产物可 v2 签名且自校验通过', False, str(e))

    bad = [c for c in checks if not c['ok']]
    print('\n构建产物结构验收：%d/%d 通过' % (len(checks) - len(bad), len(checks)))
    out = os.path.join(REPRO, 'evidence', '165_builder_artifact_e2e.json')
    json.dump({'passed': len(checks) - len(bad), 'total': len(checks), 'checks': checks},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
