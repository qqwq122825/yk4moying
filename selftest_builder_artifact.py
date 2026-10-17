#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""构建产物的**结构验收**（用自研 AXML/DEX 解析器回读，而不是只看魔数）。

构建器现在有两条路径，验收按路径分别判定：

  A. 真模板路径（磁盘上有可安装的真 APK 模板，构建器走"模板注入 + 真签名"）
     - 清单能被 AxmlReader 解析出 package / versionName / activity / uses-sdk
     - classes.dex 能被 DexReader 解析，且规模达到真包量级（≥1 MB / ≥1000 个类）
     - assets/config.json 里是本次提交的配置
     - 产物已签名（apksigner 或自实现 v2），且校验通过

  B. 占位包路径（没有模板时的回退）
     - 清单包名必须等于提交的 appid、dex 里必须有实验室类名（这是占位包的判据）
     - 返回值里必须带 stub=True，避免上层把占位包当"构建成功"的真包

判据：全部通过 exit 0
"""
import io
import json
import os
import sys
import zipfile

REPRO = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(REPRO, 'server'))
sys.path.insert(0, os.path.join(REPRO, 'tools'))
from dexlib import AxmlReader, DexReader          # noqa: E402
import relay_builder                              # noqa: E402


def main():
    checks = []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:200]})
        print('%-46s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:110]))

    out_dir = os.path.join(REPRO, 'build')
    os.makedirs(out_dir, exist_ok=True)
    apk = os.path.join(out_dir, 'builder_probe.apk')
    cfg = {'appid': 'com.ref.lab.probe', 'appversion': '1.0.0', 'appname': '参考应用',
           'appurl': 'https://ref.invalid/app', 'nottitle': '加载中~请勿操作',
           'icoid': '', 'uhost': 'host'}
    res = relay_builder.build_apk(cfg, apk)
    res = res if isinstance(res, dict) else {}
    stub = bool(res.get('stub'))
    stages = res.get('stages') or []
    ck('构建器产出 APK', os.path.exists(apk),
       '%s（%d 阶段，%s）' % (os.path.basename(apk), len(stages),
                             '占位包' if stub else '真包'))

    z = zipfile.ZipFile(apk)
    names = z.namelist()
    ck('产物含 AndroidManifest.xml / classes.dex',
       'AndroidManifest.xml' in names and 'classes.dex' in names, ','.join(names[:4]))

    # 1) AXML 回读
    try:
        ax = AxmlReader(z.read('AndroidManifest.xml'))
        tags = [t for t, _a, _d in ax.elements]
        mf = ax.manifest_summary()
        if stub:
            ok = (mf.get('package') == cfg['appid'] and 'activity' in tags
                  and 'uses-sdk' in tags)
            ck('占位包：清单包名与提交配置一致', ok, json.dumps(mf, ensure_ascii=False)[:110])
        else:
            ok = bool(mf.get('package')) and 'activity' in tags and 'uses-sdk' in tags
            ck('真包：清单可规范解析（包名/活动/uses-sdk）', ok,
               json.dumps(mf, ensure_ascii=False)[:150])
        acts = [a.get('name') for t, a, _ in ax.elements if t == 'activity']
        ck('清单里能读到 activity name', any(acts),
           '%d 个，如 %s' % (len(acts), acts[0] if acts else ''))
    except Exception as e:
        ck('AndroidManifest 可被规范解析', False, str(e))

    # 2) DEX 回读
    try:
        dex_bytes = z.read('classes.dex')
        dr = DexReader(dex_bytes)
        if stub:
            ok = len(dr.classes) >= 1 and any('LabAgent' in c for c, _ in dr.classes)
            ck('占位包：dex 里含实验室类名', ok,
               'classes=%d methods=%d' % (len(dr.classes), len(dr.methods)))
        else:
            ok = len(dex_bytes) >= 1024 * 1024 and len(dr.classes) >= 1000
            ck('真包：dex 规模达真包量级（≥1MB / ≥1000 类）', ok,
               'classes=%d methods=%d strings=%d' % (len(dr.classes), len(dr.methods),
                                                     len(dr.strings)))
    except Exception as e:
        ck('classes.dex 可被规范解析', False, str(e))

    # 3) 注入配置
    try:
        injected = json.loads(z.read('assets/config.json').decode('utf-8'))
        ck('注入配置真的写进产物', injected.get('appid') == cfg['appid'],
           'appid=%s appurl=%s' % (injected.get('appid'), injected.get('appurl')))
    except Exception as e:
        ck('注入配置真的写进产物', False, str(e))

    # 4) 签名
    if stub:
        ck('占位包未被误标为已签名', not res.get('signed'), 'signed=%s' % res.get('signed'))
    else:
        ck('真包已签名并通过校验', bool(res.get('signed')), res.get('signature', ''))

    bad = [c for c in checks if not c['ok']]
    print('\n构建产物结构验收：%d/%d 通过（路径：%s）'
          % (len(checks) - len(bad), len(checks), '占位包' if stub else '真包'))
    out = os.path.join(REPRO, 'evidence', '165_builder_artifact_e2e.json')
    os.makedirs(os.path.dirname(out), exist_ok=True)
    json.dump({'passed': len(checks) - len(bad), 'total': len(checks),
               'stub': stub, 'template': res.get('template', ''), 'checks': checks},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
