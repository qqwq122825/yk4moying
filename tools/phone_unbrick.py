#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""手机"变砖"自愈：**桌面被 hide → 系统没有 HOME 活动 → 启动永不完成 → 输入分发关闭 → 触摸全失效**。

事故现场（2026-09-30，用户原话「手机卡死了吗 动都动不了」）：
    resolve-activity -c HOME        → No activity found          # 桌面被 pm hide
    dumpsys window policy           → mSystemBooted=false        # 启动流程没走完
    dumpsys input                   → DispatchEnabled: false     # 输入分发整个关着
                                      FocusedWindows: <none>
    logcat -b events                → 有 boot_progress_ams_ready，
                                      但**没有 boot_progress_enable_screen**
    getprop sys.boot_completed      → 空
结果：屏幕亮着（还显示息屏/锁屏），但**任何触摸、任何按键注入都被丢弃** —— 表现就是"卡死"。

根因：`pm hide` 曾经落到桌面包（`com.miui.home`）上，系统找不到 HOME 活动，
AMS 的 resumeHomeActivity 卡住 → 启动流程不完成 → WMS 不启用输入分发。

修法（需要 root，本机 `su` = Magisk）：
    su -c 'pm unhide <pkg>'                      # 直接走 adb shell 会因缺 MANAGE_USERS 被拒
    am start -a android.intent.action.MAIN -c android.intent.category.HOME   # 把启动流程推完

用法：
    python tools/phone_unbrick.py --check            # 只诊断，不改任何东西
    python tools/phone_unbrick.py --fix              # 诊断 + 修复 + 复验（默认）
    python tools/phone_unbrick.py --fix --only com.miui.home
    python tools/phone_unbrick.py --check --json docs_phone_unbrick.json
"""
import argparse
import json
import os
import re
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
ADB = r'adb'
EVID = os.path.join(os.path.dirname(REPRO), 'evidence')

# 已知的"没有它系统就走不完启动"的包：桌面/设置/系统界面
BOOT_CRITICAL = ('com.miui.home', 'com.android.launcher3', 'com.android.settings',
                 'com.android.systemui', 'com.miui.securitycenter', 'com.android.providers.settings')

# 桌面候选（被 hide 后 resolve-activity 直接失败，只能按名字找回来）
LAUNCHER_CANDIDATES = ('com.miui.home', 'com.android.launcher3',
                       'com.google.android.apps.nexuslauncher', 'com.android.launcher')


def sh(cmd, serial=None, su=False, timeout=60):
    """跑一条设备端命令。su=True 时经 `su -c`（特权 pm 命令必须走这条）。"""
    full = "su -c '%s'" % cmd.replace("'", "'\\''") if su else cmd
    argv = [ADB] + (['-s', serial] if serial else []) + ['shell', full]
    try:
        r = subprocess.run(argv, capture_output=True, text=True, encoding='utf-8',
                           errors='replace', timeout=timeout)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except subprocess.TimeoutExpired:
        return '[timeout] %s' % cmd


def pick_device():
    out = subprocess.run([ADB, 'devices'], capture_output=True, text=True,
                         encoding='utf-8', errors='replace').stdout or ''
    for line in out.splitlines()[1:]:
        parts = line.split()
        if len(parts) >= 2 and parts[1] == 'device':
            return parts[0]
    return None


def hidden_packages(serial):
    """列出 user 0 上 hidden=true 的包（按 Package 段解析，不做跨段 grep —— 那种写法会串行误判）。"""
    dump = sh('dumpsys package', serial, timeout=120)
    out, cur = [], None
    for line in dump.splitlines():
        m = re.match(r'\s*Package \[([^\]]+)\]', line)
        if m:
            cur = m.group(1)
            continue
        if cur and 'User 0:' in line and 'ceDataInode' in line and 'hidden=true' in line:
            out.append(cur)
            cur = None
    return out


def diagnose(serial):
    d = {}
    d['device'] = serial
    d['root'] = sh('id', serial, su=True).split('context=')[0].strip()
    d['su_ok'] = d['root'].startswith('uid=0')
    home = sh('cmd package resolve-activity --brief -a android.intent.action.MAIN '
              '-c android.intent.category.HOME', serial)
    d['home_resolve'] = home.splitlines()[-1].strip() if home else ''
    if d['home_resolve'] and not d['home_resolve'].startswith('package:'):
        pass
    d['home_resolved'] = bool(re.search(r'^[\w.]+\/', d['home_resolve'], re.M))
    d['hidden_pkgs'] = hidden_packages(serial)
    d['mSystemBooted'] = 'true' in sh('dumpsys window policy 2>/dev/null | grep -m1 mSystemBooted',
                                      serial)
    dispatch = sh('dumpsys input 2>/dev/null | grep -m1 DispatchEnabled', serial)
    d['dispatch_enabled'] = 'true' in dispatch.lower()
    d['boot_completed'] = sh('getprop sys.boot_completed', serial)
    d['bootanim'] = sh('getprop init.svc.bootanim', serial)
    d['user0'] = ''
    for line in sh('dumpsys user 2>/dev/null | grep "Started users state"', serial).splitlines():
        d['user0'] = line.strip()
    d['broken'] = (not d['home_resolved']) or (not d['dispatch_enabled']) \
                  or (not d['mSystemBooted'])
    return d


def launcher_pkg(serial):
    """被 hide 后 resolve-activity 失败，按候选名 + pm list 找回落日桌面包。"""
    listed = sh('pm list packages -u', serial)
    for c in LAUNCHER_CANDIDATES:
        if 'package:%s' % c in listed:
            return c
    m = sh('pm list packages -u | grep -iE "launcher|home"', serial)
    for line in m.splitlines():
        p = line.strip().replace('package:', '')
        if p and 'smarthome' not in p and 'newhome' not in p and 'athome' not in p:
            return p
    return None


def fix(serial, only=None, keep=()):
    """按顺序做三件事：清 hidden → 推完启动流程 → 复验。返回改动清单。"""
    changes = []

    targets = list(only) if only else None
    if targets is None:
        targets = []
        lp = launcher_pkg(serial)
        if lp:
            targets.append(lp)
        for p in hidden_packages(serial):
            if p not in targets:
                targets.append(p)
    targets = [p for p in targets if p not in keep]

    for p in targets:
        out = sh('pm unhide %s' % p, serial, su=True)
        if 'new hidden state: false' in out or not out:
            changes.append({'action': 'pm unhide', 'pkg': p, 'su': True, 'result': out or 'ok'})
        else:
            changes.append({'action': 'pm unhide', 'pkg': p, 'su': True, 'error': out[:200]})

    # 开机动画没退场时先让它退场（F-106 同源故障，root 下可以直设属性）
    if sh('getprop init.svc.bootanim', serial).strip() == 'running':
        sh('setprop service.bootanim.exit 1', serial, su=True)
        changes.append({'action': 'setprop service.bootanim.exit=1', 'su': True})
        time.sleep(2)

    # 把启动流程推完：AMS 有了可解析的 HOME 活动才会 resumeHomeActivity → finishBooting
    out = sh('am start -a android.intent.action.MAIN -c android.intent.category.HOME', serial)
    changes.append({'action': 'am start HOME', 'result': out.splitlines()[0] if out else ''})
    time.sleep(8)
    return changes


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--serial')
    ap.add_argument('--check', action='store_true', help='只诊断')
    ap.add_argument('--fix', action='store_true', help='诊断 + 修复（默认动作）')
    ap.add_argument('--only', nargs='*', help='只处理这些包')
    ap.add_argument('--keep-hidden', nargs='*', default=[], help='这些包不要动')
    ap.add_argument('--json', help='把结果写到 JSON（默认 docs/<ts>_phone_unbrick.json）')
    ap.add_argument('--quiet', action='store_true')
    a = ap.parse_args()

    global flags_serial
    serial = a.serial or pick_device()
    if not serial:
        print('没有在线设备（adb devices 为空）'); return 2

    before = diagnose(serial)
    print('=' * 66)
    print('设备 %s   root=%s' % (serial, before['root'][:40]))
    print('HOME 活动           : %s' % (before['home_resolve'] or '(空)'))
    print('hidden 包(user0)    : %s' % (before['hidden_pkgs'] or '(无)'))
    print('mSystemBooted       : %s' % before['mSystemBooted'])
    print('DispatchEnabled     : %s' % before['dispatch_enabled'])
    print('sys.boot_completed  : %s' % (before['boot_completed'] or '(空)'))
    print('bootanim            : %s' % before['bootanim'])
    print('用户状态            : %s' % before['user0'])
    print('-' * 66)
    print('判定: %s' % ('**砖**（桌面缺失/启动未完成/输入分发关闭）' if before['broken']
                       else '正常（可交互）'))

    result = {'before': before, 'changes': [], 'after': None}
    if before['broken'] and not a.check:
        if not before['su_ok']:
            print('!! 没有 root（su 不可用）：pm unhide 走不通，只能走"装一个 HOME 桩 APK"的路子')
        print('修复中 ...')
        result['changes'] = fix(serial, a.only, tuple(a.keep_hidden or ()))
        for c in result['changes']:
            print('   ', json.dumps(c, ensure_ascii=False)[:160])
        after = diagnose(serial)
        result['after'] = after
        print('-' * 66)
        print('修复后: HOME=%s  mSystemBooted=%s  DispatchEnabled=%s  boot_completed=%s'
              % (after['home_resolve'] or '(空)', after['mSystemBooted'],
                 after['dispatch_enabled'], after['boot_completed'] or '(空)'))
        print('说明：解锁前用户 0 必须是 RUNNING_LOCKED（等 PIN）；' 
              '出现 PIN 键盘后屏幕上应显示「请输入您的数字密码」')
    elif before['broken']:
        print('（--check：只诊断，不改动）')

    path = a.json
    if not path:
        os.makedirs(EVID, exist_ok=True)
        path = os.path.join(EVID, '186_phone_unbrick.json')
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    if not a.quiet:
        print('证据: %s' % path)
    return 0 if (result['after'] and not result['after']['broken']) or not before['broken'] else 1


if __name__ == '__main__':
    sys.exit(main())
