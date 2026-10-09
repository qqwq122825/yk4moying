#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把能力 APK 设成 **device owner**（只为让"生物识别策略"这类动作真的生效）。

为什么需要它：`disableBiometric` / `enableBiometric` 走的
`DevicePolicyManager.setKeyguardDisabledFeatures` 在**只有普通 admin** 的手机上必定抛
`SecurityException`（实测，扫里如实回 success=false）。要真生效只有一条路：让我们的
应用成为 **device owner**。

代价与边界（**这是一次改变设备归属形态的操作，默认不执行**）：
  · device owner 只能由应用自己清（`admin.clearOwner`），`dpm remove-active-admin` 清不掉；
  · 成为 device owner 后普通方式（设置里"卸载"）**卸载不掉**，要先 `--clear`；
  · 需要设备**没有已登录账号**（小米账号/Google 账号等），且数据分区已解锁（先解锁一次）；
    否则 `dpm set-device-owner` 会回 `Not allowed to set the device owner ...`。

用法（在你确认要用时执行）：
  python tools/dev_owner.py --status              # 看现在是不是 owner / 有哪些 admin
  python tools/dev_owner.py --set                 # 设成 device owner
  python tools/dev_owner.py --biometric disable   # 设策略（需已是 owner）
  python tools/dev_owner.py --clear               # 清掉 device owner（回滚）
"""
import argparse
import os
import subprocess
import sys
import time

ADB = r'adb'
PKG = 'com.ref.labagent'
COMP = PKG + '/.AdminReceiver'


def sh(*a, t=120):
    try:
        r = subprocess.run([ADB, *a], capture_output=True, text=True,
                           encoding='utf-8', errors='replace', timeout=t)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return 'ERR %s' % e


def su(cmd, t=120):
    return sh('shell', "su -c '%s'" % cmd.replace("'", "'\\''"), t=t)


def bridge(cmd, **kw):
    import json
    payload = json.dumps(dict(cmd=cmd, **kw)).replace('"', '\\"')
    return su('echo "\\{%s\\}" | nc 127.0.0.1 8788 | head -c 300'
              % ', '.join('"%s": %s' % (k, v if not isinstance(v, str) else '"%s"' % v)
                          for k, v in dict(cmd=cmd, **kw).items()))


def status():
    print('== 包与管理员 ==')
    print('  pm path        :', sh('shell', 'pm', 'path', PKG).splitlines()[:1])
    print('  dpm list-owners:', su('dpm list-owners')[:160])
    print('  Active Admins  :', su("dumpsys device_policy | grep -A4 'Active Admins'")[:200])
    print('== 能力桥 ==')
    p = su('echo \\{"cmd": "ping"\\} | nc 127.0.0.1 8788 | head -c 200')
    print('  ping           :', p[:200])
    a = su('echo \\{"cmd": "admin.active"\\} | nc 127.0.0.1 8788 | head -c 200')
    print('  admin.active   :', a[:200])
    print('== 账号（device owner 要求没有已登录账号）==')
    print('  accounts       :', su('dumpsys account | grep -c "Account {"') or '?')


def set_owner():
    print('设置 device owner（需要：无账号 + 数据已解锁）。这一步改变设备归属形态。')
    out = su('dpm set-device-owner %s' % COMP, t=180)
    print('  dpm set-device-owner ->', out[:200])
    time.sleep(1)
    a = su('echo \\{"cmd": "admin.active"\\} | nc 127.0.0.1 8788 | head -c 300')
    print('  桥 admin.active ->', a[:300])
    return 'Success' in out or '"owner":true' in a


def clear_owner():
    print('清掉 device owner（由应用自己调 clearDeviceOwnerApp）')
    out = su('echo \\{"cmd": "admin.clearOwner"\\} | nc 127.0.0.1 8788 | head -c 200')
    print('  桥 admin.clearOwner ->', out[:200])
    return 'cleared' in out


def biometric(mode):
    disabled = (mode == 'disable')
    out = su('echo \\{"cmd": "admin.biometric", "disabled": %s\\} | nc 127.0.0.1 8788 | head -c 300'
             % ('true' if disabled else 'false'))
    print('  admin.biometric(disabled=%s) ->' % disabled, out[:300])
    return 'ok' in out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--status', action='store_true')
    ap.add_argument('--set', action='store_true')
    ap.add_argument('--clear', action='store_true')
    ap.add_argument('--biometric', choices=['disable', 'enable'])
    a = ap.parse_args()
    if a.status or not (a.set or a.clear or a.biometric):
        status()
        return 0
    if a.set:
        return 0 if set_owner() else 1
    if a.biometric:
        return 0 if biometric(a.biometric) else 1
    if a.clear:
        return 0 if clear_owner() else 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
