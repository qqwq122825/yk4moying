#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""机械闸门：**隐藏类动作不许再把手伸到系统关键包 / 前台包**（F-104 事故的回归测试）。

背景（真机实测事故）：`pm hide` 的目标包曾经回落到"当前前台包"，某次扫描时前台正是 SystemUI，
于是 `pm hide com.android.systemui` 被执行 → 系统界面被藏 → 没有锁屏可输 PIN → CE 解不开 → 手机
看起来"卡死在加密锁"整整 10 轮。本闸门把两条防线钉死：

  ① 不给 pkg → 必须回 `pkg-required`，且**不得**执行任何 pm hide；
  ② 给系统关键包（SystemUI/桌面/设置/安全中心/电话/输入法…）→ 必须回 `protected-package`。

判据是"调用的返回值"，不是读代码。
"""
import io
import os
import sys

sys.path.insert(0, r'agent')
os.chdir(r'agent')
import actions  # noqa: E402

HIDE_ACTS = ('hideMyMainActivity', 'hideShortcuts', 'setHideMode', 'transparent')
DENY = ('com.android.systemui', 'com.miui.home', 'com.android.settings', 'com.miui.securitycenter',
        'com.android.phone', 'com.android.providers.settings')


def run(act, data):
    out = actions.execute(act, data, 'guard-probe')
    if not out:
        return None, {}
    return out[0], (out[1] or {})


def main():
    bad = []
    print('== ① 不给 pkg：必须 pkg-required ==')
    for act in HIDE_ACTS:
        name, d = run(act, {})
        eff = d.get('effect') or {}
        ok = eff.get('error') == 'pkg-required' and d.get('success') is False
        print('  %-22s frame=%-14s error=%-18s %s' % (act, name, eff.get('error'), 'OK' if ok else 'FAIL'))
        if not ok:
            bad.append((act, '未给 pkg 时没有回 pkg-required', eff))

    print('== ② 系统关键包：必须 protected-package ==')
    for pkg in DENY:
        name, d = run('hideShortcuts', {'pkg': pkg})
        eff = d.get('effect') or {}
        ok = eff.get('error') == 'protected-package' and d.get('success') is False
        print('  %-32s error=%-20s %s' % (pkg, eff.get('error'), 'OK' if ok else 'FAIL'))
        if not ok:
            bad.append((pkg, '系统关键包没被拦', eff))

    print('== ③ 黑名单本身覆盖了 SystemUI/桌面/设置 ==')
    for p in ('com.android.systemui', 'com.miui.home', 'com.android.settings'):
        ok = p in actions._HIDE_DENY
        print('  %-32s in _HIDE_DENY=%s %s' % (p, ok, 'OK' if ok else 'FAIL'))
        if not ok:
            bad.append((p, '不在 _HIDE_DENY', None))

    print('== ④ 普通第三方包不被误伤（应当走到真机层，而不是被拦） ==')
    name, d = run('hideShortcuts', {'pkg': 'com.miui.notes'})
    eff = d.get('effect') or {}
    ok = eff.get('error') not in ('pkg-required', 'protected-package')
    print('  %-32s error=%s %s' % ('com.miui.notes', eff.get('error'), 'OK' if ok else 'FAIL'))
    if not ok:
        bad.append(('com.miui.notes', '普通包被误拦', eff))

    if bad:
        print('\n违规 %d 处：' % len(bad))
        for a, why, eff in bad:
            print('  %-34s %s %s' % (a, why, eff or ''))
        return 1
    print('\n通过：隐藏类动作既不回落前台包，也拦得住系统关键包，且不误伤普通包')
    return 0


if __name__ == '__main__':
    sys.exit(main())
