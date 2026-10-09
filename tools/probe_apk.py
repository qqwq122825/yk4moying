#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""造一个**一次性探针 APK**（`com.ref.probe`），用来真正验证安装/卸载两条指令。

为什么需要它：`installApk` / `uninstallApk` 原来只能拿"不存在的包/URL"来测，测出来永远是失败，
分不清是产品没做还是测试没给对东西。有了探针包：
  面板推 APK（`installApk` 带 URL）→ 装上 `com.ref.probe` → `pm list packages` 读回；
  `uninstallApk` 卸掉它 → 再读回为 0。全程不碰我们自己的 agent 包。

复用 `tools/apk_build.py` 的同一套工具链（aapt2 / zipalign / apksigner）与同一把签名库。
用法：python tools/probe_apk.py            # 构建 build/labprobe.apk
"""
import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
SDK = r'%LOCALAPPDATA%\AppData\Local\Android\Sdk'
BT = os.path.join(SDK, 'build-tools', '34.0.0')
ANDROID_JAR = os.path.join(SDK, 'platforms', 'android-34', 'android.jar')
AAPT2 = os.path.join(BT, 'aapt2.exe')
ZIPALIGN = os.path.join(BT, 'zipalign.exe')
APKSIGNER = os.path.join(BT, 'apksigner.bat')
BUILD = os.path.join(REPRO, 'build')
WORK = os.path.join(BUILD, 'probe')
OUT = os.path.join(BUILD, 'labprobe.apk')
KS = os.path.join(REPRO, 'state', 'keys', 'lab.keystore')

MANIFEST = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.ref.probe"
    android:versionCode="1"
    android:versionName="1.0">
    <uses-sdk android:minSdkVersion="26" android:targetSdkVersion="34" />
    <application android:label="LabProbe" android:hasCode="false" />
</manifest>
'''


def run(cmd, cwd=None):
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8',
                       errors='replace', cwd=cwd)
    return r.returncode, ((r.stdout or '') + (r.stderr or ''))


def build():
    for p in (AAPT2, ZIPALIGN, APKSIGNER):
        if not os.path.exists(p):
            return None, '缺少构建工具: %s' % p
    if not os.path.exists(KS):
        return None, '签名库不在: %s（先跑 tools/apk_build.py）' % KS
    shutil.rmtree(WORK, ignore_errors=True)
    os.makedirs(WORK, exist_ok=True)
    mf = os.path.join(WORK, 'AndroidManifest.xml')
    open(mf, 'w', encoding='utf-8').write(MANIFEST)

    unsigned = os.path.join(WORK, 'probe-unsigned.apk')
    rc, out = run([AAPT2, 'link', '-o', unsigned, '-I', ANDROID_JAR,
                   '--manifest', mf, '--min-sdk-version', '26', '--target-sdk-version', '34'])
    if rc != 0 or not os.path.exists(unsigned):
        return None, 'aapt2 link 失败: %s' % out[-300:]

    aligned = os.path.join(WORK, 'probe-aligned.apk')
    rc, out = run([ZIPALIGN, '-f', '4', unsigned, aligned])
    if rc != 0 or not os.path.exists(aligned):
        return None, 'zipalign 失败: %s' % out[-200:]

    rc, out = run([APKSIGNER, 'sign', '--ks', KS, '--ks-pass', 'pass:CHANGE_ME',
                   '--key-pass', 'pass:CHANGE_ME', '--out', OUT, aligned])
    if rc != 0 or not os.path.exists(OUT):
        return None, 'apksigner 失败: %s' % out[-300:]
    rc, vout = run([APKSIGNER, 'verify', '--print-certs', OUT])
    return {'path': OUT, 'size': os.path.getsize(OUT), 'verify': rc == 0,
            'verify_out': [l for l in vout.splitlines() if 'SHA-256' in l or 'Verified' in l or 'DN' in l][:3]}, None


def main():
    info, err = build()
    if err:
        print('构建失败:', err)
        return 1
    print('探针 APK: %s (%d 字节)  签名校验=%s' % (info['path'], info['size'], info['verify']))
    for l in info['verify_out']:
        print('   ', l)
    return 0


if __name__ == '__main__':
    sys.exit(main())
