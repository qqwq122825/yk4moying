#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""一条命令把整套栈拉起来并把**全部闸门**跑一遍（手机解锁后直接跑这个）。

顺序（每一步失败都停在那一步并说清为什么，不产生后续误导性结果）：
  0) 前置体检：boot / CE 是否解锁 / agent 目录 / 能力桥
  1) adb reverse（设备端 → 本机 lab 的通道）
  2) 起设备端 Python agent（/data/local/tmp/run3.sh）
  3) 重装能力 APK 并叫醒（pm enable + --include-stopped-packages 起服务 + 挂无障碍 + 桥自检）
  4) phone_deploy 部署与验收（23/23）
  5) selftest_actions（163/163 + 11/11）
  6) functional_matrix（30/30）
  7) health_now（14/14）
  8) phone_sweep_163（逐条真机实测，落 docs_phone_sweep.json）
最后写一份总账到 docs_resume.json。

用法：python tools/resume_stack.py            （默认全跑）
      python tools/resume_stack.py --from 5   （从第 5 步开始）
"""
import argparse
import io
import json
import os
import re
import subprocess
import sys
import time

ADB = r'adb'
REPRO = r'repro'
WORK = r'work'
EVID = r'evidence'
SNAP = r'selftests/_snapshots'


def sh(cmd, t=180, cwd=None, env=None):
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8',
                       errors='replace', timeout=t, cwd=cwd, env=env, shell=isinstance(cmd, str))
    return ((r.stdout or '') + (r.stderr or '')).strip(), r.returncode


def adb(*a, t=120):
    try:
        r = subprocess.run([ADB, *a], capture_output=True, text=True, encoding='utf-8',
                           errors='replace', timeout=t)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return 'ERR %s' % e


def su(cmd, t=180):
    return adb('shell', "su -c '%s'" % cmd.replace("'", "'\\''"), t=t)


RESULTS = []


def step(name, ok, detail=''):
    RESULTS.append({'step': name, 'ok': bool(ok), 'detail': str(detail)[:300]})
    print('%-28s %s  %s' % (name, 'OK  ' if ok else 'FAIL', str(detail)[:150]), flush=True)
    return ok


def preflight():
    """必需条件：CE 已解锁 + agent 目录在（boot_completed/bootanim 只作参考 —— 本机 MIUI 上
    它们要等解锁才变，写死"必须 ==1"会让流程永远不触发）。"""
    boot = adb('shell', 'getprop', 'sys.boot_completed')
    anim = adb('shell', 'getprop', 'init.svc.bootanim')
    ce = adb('shell', 'getprop', 'sys.user.0.ce_available')
    if ce == '':
        return False, ('手机还在加密锁状态（ce_available 空；boot_completed=%r bootanim=%r）—— '
                       '**请在手机上解锁一次（输 PIN）**，CE 存储解锁后 /data/data 才可见' %
                       (boot, anim))
    home = su('ls -d /data/data/com.termux/files/home/agent 2>&1')
    if 'No such file' in home:
        adb('shell', 'am start --include-stopped-packages -n '
                     'com.termux/com.termux.app.TermuxActivity')
        time.sleep(6)
        home = su('ls -d /data/data/com.termux/files/home/agent 2>&1')
        if 'No such file' in home:
            return False, 'CE 已解锁，但设备端 agent 目录不在（Termux 起不来）：%s' % home[:60]
    return True, 'ce=ok agent=ok（boot_completed=%r bootanim=%r）' % (boot, anim)


def port_listening(host='127.0.0.1', port=8793, timeout=2):
    import socket
    s = socket.socket()
    s.settimeout(timeout)
    try:
        s.connect((host, port))
        return True
    except Exception:
        return False
    finally:
        try:
            s.close()
        except Exception:
            pass


def ensure_server():
    """lab 服务端没在监听就拉起来（否则后面的验收全挂）"""
    if port_listening():
        return True, '已在监听 8793'
    srv = os.path.join(REPRO, 'server', 'refc2.py')
    env = dict(os.environ, REFC2_USER='admin',
               REFC2_PASS=os.environ.get('REFC2_PASS', ''))
    logf = io.open(os.path.join(EVID, 'resume_server.log'), 'a', encoding='utf-8')
    try:
        subprocess.Popen([sys.executable, '-u', '-X', 'utf8', srv,
                          '--host', '0.0.0.0', '--port', '8793',
                          '--tls-cert', os.path.join(REPRO, 'state', 'tls', 'cert_san.pem'),
                          '--tls-key', os.path.join(REPRO, 'state', 'tls', 'key_san.pem')],
                         cwd=REPRO, env=env, stdout=logf, stderr=subprocess.STDOUT)
    except Exception as e:
        return False, '拉起失败 %s' % e
    for _ in range(20):
        time.sleep(1.5)
        if port_listening():
            return True, '已拉起并监听 8793'
    return False, '30s 内没起来'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--from', dest='start', type=int, default=0)
    a = ap.parse_args()
    pw = os.environ.get('REFC2_PASS', '')
    env = dict(os.environ, REFC2_PASS=pw)

    print('=== 0) 前置体检 ===', flush=True)
    ok, why = preflight()
    if not step('前置体检', ok, why):
        io.open(os.path.join(EVID, '183_resume.json'), 'w', encoding='utf-8').write(
            json.dumps({'ok': False, 'stopped_at': 'preflight', 'why': why}, ensure_ascii=False, indent=2))
        print('\n停在体检：%s' % why)
        return 2

    step('本机 lab 服务端', *ensure_server())
    for label, script in (('actions_selfcheck', os.path.join(WORK, 'actions_selfcheck.py')),
                          ('no_fake_data_check', os.path.join(WORK, 'no_fake_data_check.py')),
                          ('contract_163', os.path.join(WORK, 'contract_163.py')),
                          ('hide_guard_check', os.path.join(WORK, 'hide_guard_check.py'))):
        run_script(label, script, r'通过|必需符号', cwd=WORK, timeout=300)

    def run_script(label, script, patterns, cwd=REPRO, timeout=1800):
        out, rc = sh([sys.executable, '-X', 'utf8', script], t=timeout, cwd=cwd, env=env)
        m = re.search(patterns, out)
        detail = m.group(0)[:200] if m else out.strip().splitlines()[-1][:200] if out.strip() else ''
        ok = rc == 0 and bool(m)
        return step(label, ok, detail)

    steps = []
    if a.start <= 1:
        steps.append(('adb reverse', lambda: step('adb reverse',
                                                  'tcp:8793' in adb('reverse', '--list'),
                                                  adb('reverse', 'tcp:8793', 'tcp:8793'))))
    if a.start <= 2:
        steps.append(('起设备端 agent',
                      lambda: step('起设备端 agent',
                                   bool(re.search(r'[1-9]', su('pgrep -f "[r]efagent.py" | wc -l'))),
                                   su('sh /data/local/tmp/run3.sh')[-160:])))
    if a.start <= 3:
        steps.append(('装能力 APK 并叫醒',
                      lambda: run_script('装能力 APK 并叫醒', r'tools\apk_build.py',
                                         r'叫醒包:\s*\S+', timeout=1200)))
    if a.start <= 4:
        steps.append(('phone_deploy 部署验收',
                      lambda: run_script('phone_deploy 部署验收', r'tools\phone_deploy.py',
                                         r'=== \d+/\d+ 通过', timeout=1800)))
    if a.start <= 5:
        steps.append(('selftest_actions', lambda: run_script(
            'selftest_actions', 'selftest_actions.py', r'被控端指令端到端：\d+/\d+ 通过', timeout=1800)))
    if a.start <= 6:
        steps.append(('functional_matrix', lambda: run_script(
            'functional_matrix', os.path.join(WORK, 'functional_matrix.py'),
            r'功能矩阵：\d+ 项，通过 \d+', cwd=WORK, timeout=1800)))
    if a.start <= 7:
        steps.append(('health_now', lambda: run_script(
            'health_now', os.path.join(WORK, 'health_now.py'),
            r'现状体检：\d+ 项，通过 \d+', cwd=WORK, timeout=1800)))
    if a.start <= 7:
        run_script('构建探针 APK', r'tools\probe_apk.py', r'探针 APK', timeout=300)
    if a.start <= 8:
        steps.append(('真机全量扫 164 条', lambda: run_script(
            '真机全量扫 164 条', os.path.join(WORK, 'phone_sweep_163.py'),
            r'真机生效 \d+', cwd=WORK, timeout=3600)))
        steps.append(('同步覆盖率到文档', lambda: run_script(
            '同步覆盖率到文档', r'tools\sync_coverage.py', r'已写入|已是最新', timeout=300)))

    for label, fn in steps:
        try:
            if not fn():
                print('\n在「%s」停下 —— 先修这一环再看后面（后面的数字没有意义）' % label)
                break
        except Exception as e:
            step(label, False, '异常 %s: %s' % (type(e).__name__, e))
            break

    print('\n=== 总账 ===')
    for r in RESULTS:
        print('  %-28s %s  %s' % (r['step'], 'OK  ' if r['ok'] else 'FAIL', r['detail'][:110]))
    io.open(os.path.join(EVID, '183_resume.json'), 'w', encoding='utf-8').write(
        json.dumps({'ok': all(r['ok'] for r in RESULTS), 'results': RESULTS},
                   ensure_ascii=False, indent=2))
    print('\n写好 %s' % os.path.join(EVID, '183_resume.json'))
    return 0 if all(r['ok'] for r in RESULTS) else 1


if __name__ == '__main__':
    sys.exit(main())
