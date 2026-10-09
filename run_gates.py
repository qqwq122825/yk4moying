#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""一把跑完全部机械闸门（16 个），退出码即判据：0 = 全绿。

设计要点：
  1. 逐个顺序执行（每个脚本自己起服务、自己用独立端口 8801-8815），互不抢端口；
  2. **闸门状态与演示状态隔离**：整轮把 `REFC2_STORE` 指向 `state/_gates/store.json`（每轮清空重建），
     闸门往状态里打的脏值与测试数据**不再污染演示库** `state/store.json`
     （这正是 F-73 那类"闸门跑完把演示状态弄脏"的根因；隔离后闸门自身也变成确定性的）；
  3. `selftest_robustness.py` 是"畸形输入压力"型闸门，会把脏值打进行为状态，
     因此固定放在最后跑 —— 别的闸门的"默认值"断言不该被它污染；
  4. 任何一个非 0 退出 → 总退出码 1，并打印失败名单，方便直接定位。
用法：python run_gates.py            （全部）
      python run_gates.py --list     （只列清单）
      python run_gates.py --shared   （不隔离，直接用演示库跑，默认关闭）
"""
import os
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
GATE_STORE = os.path.join(HERE, 'state', '_gates', 'store.json')

GATES = [
    ('selftest.py', '核心自检'),
    ('verify_db.py', '数据库一致性'),
    ('verify_surface.py', '接口面完整（占位=0）'),
    ('coverage_report.py', '能力覆盖率'),
    ('selftest_actions.py', '主通道 163 动作'),
    ('selftest_relay_actions.py', '中继通道 69 指令'),
    ('selftest_panel_ws.py', '控制台实时通道（/api/ws/ 面板侧）'),
    ('selftest_relay_private.py', '中继通道 隐藏面'),
    ('selftest_builder_artifact.py', '构建产物结构（真 AXML/真 DEX/真签名）'),
    ('selftest_inject.py', '注入页资产'),
    ('selftest_binary_proto.py', '二进制帧协议'),
    ('verify_frontend_surface.py', '前端界面面'),
    ('verify_delivery.py', '交付面只读体检（SPA 深链/静态/状态）'),
    ('selftest_relay_closure.py', '中继通道闭环'),
    ('selftest_primary_closure.py', '主通道闭环'),
    ('selftest_authz.py', '鉴权与越权'),
    ('selftest_consistency.py', '状态一致性'),
    ('selftest_state_hygiene.py', '状态卫生（独立临时库，F-73 家族）'),
    ('selftest_lifecycle.py', '生命周期/重启恢复'),
    ('selftest_reconnect.py', '断线自愈（服务端重启→被控端自动回来）'),
    ('selftest_first_run.py', '首启动验收（干净副本从零自举）'),
    ('selftest_robustness.py', '畸形输入压力（含状态污染，固定最后）'),
]


def main():
    if '--list' in sys.argv:
        for f, d in GATES:
            print('%-32s %s' % (f, d))
        return 0
    env = dict(os.environ, PYTHONIOENCODING='utf-8', PYTHONUTF8='1')
    if '--shared' not in sys.argv:
        # 隔离状态：整轮用独立库，且每轮从零开始（闸门之间不再互相"继承"脏值）
        os.makedirs(os.path.dirname(GATE_STORE), exist_ok=True)
        try:
            shutil.rmtree(os.path.dirname(GATE_STORE), ignore_errors=True)
        except Exception:
            pass
        os.makedirs(os.path.dirname(GATE_STORE), exist_ok=True)
        env['REFC2_STORE'] = GATE_STORE
        print('闸门状态：%s（隔离，演示库 state/store.json 不受影响）' % GATE_STORE)
    else:
        print('闸门状态：共享演示库（--shared）')
    failed = []
    t_all = time.time()
    for name, desc in GATES:
        p = os.path.join(HERE, name)
        if not os.path.exists(p):
            print('!! 缺脚本 %s' % name)
            failed.append((name, 'missing'))
            continue
        t0 = time.time()
        print('=' * 78)
        print('>>> %-30s %s' % (name, desc))
        sys.stdout.flush()
        r = subprocess.run([sys.executable, '-u', p], cwd=HERE, env=env,
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        out = r.stdout.decode('utf-8', 'replace')
        tail = [ln for ln in out.strip().splitlines() if ln.strip()][-4:]
        for ln in tail:
            print('    ' + ln)
        ok = (r.returncode == 0)
        print('    -> %s  退出码=%d  用时 %.1fs' % ('OK' if ok else 'FAIL', r.returncode,
                                                   time.time() - t0))
        if not ok:
            failed.append((name, r.returncode))
        sys.stdout.flush()
    print('=' * 78)
    print('闸门总计 %d 个，失败 %d 个，总用时 %.1fs' % (len(GATES), len(failed), time.time() - t_all))
    for name, rc in failed:
        print('  FAIL %s (rc=%s)' % (name, rc))
    return 1 if failed else 0


if __name__ == '__main__':
    sys.exit(main())
