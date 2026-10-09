#!/usr/bin/env python3
# -*- coding: utf-8 -*-
r"""手机一解锁就**自动**把整套栈拉起来并跑一遍真机验收（不需要人再下指令）。

为什么要有它：手机重启后停在 FBE 加密锁，`/data/data` 未解密 → 设备端 agent、能力桥、
无障碍全都起不来；解 PIN 这件事只能由人做，但"解锁之后的全部动作"没必要也等人。

行为：
  · 每 2 分钟被计划任务叫起来一次；
  · 没解锁（boot 未完成 / CE 不可用）→ 立刻退出，只记一行日志；
  · 一旦就绪 → adb reverse → 起设备端 agent → 装能力 APK 并叫醒 → phone_deploy 验收
    → selftest → functional_matrix → health_now → 逐条真机全量扫；
  · 跑完写 `docs_auto_resume.json` 并留 marker，**不重复跑**（marker 超过 6 小时才算过期）。

日志：`docs/auto_resume.log`
手动跑一次看它当前会做什么：`python tools/auto_resume.py --status`
"""
import argparse
import io
import json
import os
import subprocess
import sys
import time

ADB = r'adb'
REPRO = r'repro'
WORK = r'work'
EVID = r'evidence'
MARKER = os.path.join(EVID, '184_auto_resume.json')
LOG = os.path.join(EVID, 'auto_resume.log')
DONE_TTL = 6 * 3600


def log(msg):
    line = '[%s] %s' % (time.strftime('%m-%d %H:%M:%S'), msg)
    print(line, flush=True)
    try:
        with io.open(LOG, 'a', encoding='utf-8') as f:
            f.write(line + '\n')
    except Exception:
        pass


def adb(*a, t=90):
    try:
        r = subprocess.run([ADB, *a], capture_output=True, text=True, encoding='utf-8',
                           errors='replace', timeout=t)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return 'ERR %s' % e


def su(cmd, t=180):
    return adb('shell', "su -c '%s'" % cmd.replace("'", "'\\''"), t=t)


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
    """lab 服务端没在监听就拉起来（无人值守时这一步不做，后面会整片假失败）"""
    if port_listening():
        return True
    log('服务端没在监听 8793 → 拉起来')
    srv = os.path.join(REPRO, 'server', 'refc2.py')
    cert = os.path.join(REPRO, 'state', 'tls', 'cert_san.pem')
    key = os.path.join(REPRO, 'state', 'tls', 'key_san.pem')
    env = dict(os.environ, REFC2_USER='admin',
               REFC2_PASS=os.environ.get('REFC2_PASS', ''))
    logf = io.open(os.path.join(EVID, 'auto_resume_server.log'), 'a', encoding='utf-8')
    try:
        subprocess.Popen([sys.executable, '-u', '-X', 'utf8', srv,
                          '--host', '0.0.0.0', '--port', '8793',
                          '--tls-cert', cert, '--tls-key', key],
                         cwd=REPRO, env=env, stdout=logf, stderr=subprocess.STDOUT)
    except Exception as e:
        log('拉起服务端失败：%s' % e)
        return False
    for _ in range(20):
        time.sleep(1.5)
        if port_listening():
            log('服务端已监听 8793')
            return True
    log('服务端 30s 内没起来')
    return False


def ensure_adb():
    """确认 adb 能看到设备；看不到就先重启 adb 服务再看一次。

    实测：adb 服务会变成"设备列表空"的僵死状态（`adb devices` 什么都不回），
    而 USB 上设备其实还在 —— 重启服务立刻恢复。计划任务不能指望人工去 kill-server。
    """
    dev = adb('devices')
    if 'device' in dev.replace('List of devices attached', '').strip():
        return dev
    log('adb 看不到设备 → 重启 adb 服务再看一次')
    adb('kill-server')
    time.sleep(1.5)
    adb('start-server')
    time.sleep(2.5)
    dev = adb('devices')
    if 'device' in dev.replace('List of devices attached', '').strip():
        return dev
    # 更顽固的僵死：换一个服务端口起一遍，再切回默认端口（真机实测：USB 侧设备好好的，
    # 但默认端口的 adb server 就是认不到；这招能把它拽回来）
    log('默认端口仍看不到设备 → 换端口起 server 再切回')
    adb('-P', '5039', 'start-server')
    time.sleep(3)
    adb('-P', '5039', 'kill-server')
    time.sleep(1.5)
    adb('kill-server')
    time.sleep(1.5)
    adb('start-server')
    time.sleep(3)
    return adb('devices')


def agent_dir_present():
    out = adb('shell', "su -c 'ls -d /data/data/com.termux/files/home/agent 2>&1'")
    return 'No such file' not in out


def wake_termux():
    """唤起一次 Termux：它启动时才会创建自己的私有目录（CE 解锁后目录不在时用）"""
    adb('shell', 'am start --include-stopped-packages -n com.termux/com.termux.app.TermuxActivity')
    import time as _t
    _t.sleep(6)
    if not agent_dir_present():
        adb('shell', 'monkey -p com.termux -c android.intent.category.LAUNCHER 1')
        _t.sleep(6)
    return agent_dir_present()


def recover_stuck_splash():
    """结束"卡住的开机动画"。

    实测（本轮）：框架其实已经起来（SystemUI 在跑、keyguard 已 bind），但**开机动画进程还活着并盖在最上层**，
    屏幕上是 MIUI Logo —— 于是"看起来卡在开机"，锁屏永远看不见、PIN 也没处输。
    判据：`init.svc.bootanim == running` 且 SystemUI 已在跑。处置：`setprop service.bootanim.exit 1` +
    `ctl.stop bootanim`（这就是让开机动画退场的标准做法，不改任何数据）。
    """
    anim = adb('shell', 'getprop', 'init.svc.bootanim')
    ui = adb('shell', 'pgrep -f com.android.systemui | wc -l').strip()
    if anim == 'running' and ui.isdigit() and int(ui) > 0:
        log('开机动画还盖在屏幕上（框架已起）→ 让它退场')
        su('setprop service.bootanim.exit 1; setprop ctl.stop bootanim')
        time.sleep(2)
        return True
    return False


def readiness():
    """(ready, why)

    必需条件只有两条：CE 已解锁 + 设备端 agent 目录在（真正的执行前提）。
    boot_completed / bootanim 只作参考并写日志 —— 本机 MIUI 上它们要等解锁才变，
    但万一某版永远不设，写死"必须 ==1"会让自动流程永远不触发（本轮的教训）。
    """
    dev = ensure_adb()
    if 'device' not in dev.replace('List of devices attached', '').strip():
        return False, '没有 adb 设备（USB 掉了或手机没插）'
    boot = adb('shell', 'getprop', 'sys.boot_completed')
    anim = adb('shell', 'getprop', 'init.svc.bootanim')
    ce = adb('shell', 'getprop', 'sys.user.0.ce_available')
    ref = 'boot=%r bootanim=%r' % (boot, anim)
    if ce == '':
        showed = recover_stuck_splash()
        return False, '加密锁未解（ce_available 空；%s）—— 等解锁%s' % (
            ref, '（已让开机动画退场，锁屏应可见）' if showed else '')
    if not agent_dir_present():
        log('CE 已解锁但 agent 目录不在 → 唤起 Termux 建目录')
        if not wake_termux():
            return False, 'CE 已解锁，但设备端 agent 目录仍不在（Termux 起不来）'
    return True, 'ce=ok agent=ok（%s）' % ref


def run_script(label, args, cwd, timeout, env):
    log('▶ %s' % label)
    t0 = time.time()
    try:
        r = subprocess.run([sys.executable, '-X', 'utf8', *args], capture_output=True, text=True,
                           encoding='utf-8', errors='replace', timeout=timeout, cwd=cwd, env=env)
        tail = ((r.stdout or '') + (r.stderr or '')).strip().splitlines()[-3:]
        log('  %s rc=%s %.0fs | %s' % (label, r.returncode, time.time() - t0, ' / '.join(tail)[:200]))
        return r.returncode == 0, tail
    except Exception as e:
        log('  %s 异常 %s' % (label, e))
        return False, [str(e)]


def full_pass():
    env = dict(os.environ, REFC2_PASS=os.environ.get('REFC2_PASS', ''))
    ok_all = True
    done = {}
    # 0) 本机 lab 服务端（无人值守时它不在，后面会整片假失败）
    done['server'] = ensure_server()
    ok_all &= done['server']
    # 0.5) 离线闸门（不需要手机，先跑掉）
    for label, script in (('actions_selfcheck', os.path.join(WORK, 'actions_selfcheck.py')),
                          ('no_fake_data_check', os.path.join(WORK, 'no_fake_data_check.py')),
                          ('contract_163', os.path.join(WORK, 'contract_163.py')),
                          ('hide_guard_check', os.path.join(WORK, 'hide_guard_check.py'))):
        ok, _ = run_script(label, [script], WORK, 300, env)
        done[label] = ok
        ok_all &= ok

    # 1) reverse + 设备端 agent
    log('▶ adb reverse / 起设备端 agent')
    adb('reverse', 'tcp:8793', 'tcp:8793')
    su('sh /data/local/tmp/run3.sh')
    time.sleep(6)
    n = su('pgrep -f "[r]efagent.py" | wc -l')
    agent_ok = n.strip().isdigit() and int(n.strip()) > 0
    log('  设备端进程数=%s' % n.strip())
    done['agent'] = agent_ok
    ok_all &= agent_ok

    # 1.5) 探针 APK（真机扫里的安装/卸载用它，缺了就装不上）
    ok, _ = run_script('构建探针 APK', [os.path.join(REPRO, 'tools', 'probe_apk.py')], REPRO, 300, env)
    done['probe_apk'] = ok
    ok_all &= ok

    # 2) 装能力 APK 并叫醒（自带桥自检）
    ok, _ = run_script('装能力 APK 并叫醒', [os.path.join(REPRO, 'tools', 'apk_build.py'),
                                          '--install', '--grant', '--enable-acc'],
                       REPRO, 1200, env)
    done['apk'] = ok
    ok_all &= ok

    # 3) 部署与三条验收
    for label, script, cwd, to in (
            ('phone_deploy 部署验收', [os.path.join(REPRO, 'tools', 'phone_deploy.py')], REPRO, 1800),
            ('selftest_actions', [os.path.join(REPRO, 'selftest_actions.py')], REPRO, 1800),
            ('functional_matrix', [os.path.join(WORK, 'functional_matrix.py')], WORK, 1800),
            ('health_now', [os.path.join(WORK, 'health_now.py')], WORK, 1800)):
        ok, _ = run_script(label, script, cwd, to, env)
        done[label] = ok
        ok_all &= ok

    # 4) 逐条真机全量扫（最重的一步，放最后）
    ok, _ = run_script('真机全量扫 164 条', [os.path.join(WORK, 'phone_sweep_163.py')], WORK, 3600, env)
    done['sweep'] = ok
    ok_all &= ok

    # 5) 把覆盖率数字写进三份文档（case.md / README.md / CAPABILITY.md）
    ok, _ = run_script('同步覆盖率到文档', [os.path.join(REPRO, 'tools', 'sync_coverage.py')],
                       REPRO, 300, env)
    done['sync_coverage'] = ok
    ok_all &= ok

    io.open(MARKER, 'w', encoding='utf-8').write(json.dumps(
        {'ts': int(time.time()), 'ok': ok_all, 'steps': done},
        ensure_ascii=False, indent=2))
    log('全链结束 ok=%s → %s' % (ok_all, MARKER))
    return ok_all


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--status', action='store_true')
    ap.add_argument('--force', action='store_true', help='忽略 marker 强制跑一遍')
    a = ap.parse_args()

    ready, why = readiness()
    if a.status:
        print('就绪: %s — %s' % (ready, why))
        if os.path.exists(MARKER):
            print('上次全链: %s' % io.open(MARKER, encoding='utf-8').read()[:200])
        return 0
    if not ready:
        log('跳过：%s' % why)
        return 0

    if not a.force and os.path.exists(MARKER):
        try:
            d = json.load(io.open(MARKER, encoding='utf-8'))
            if time.time() - d.get('ts', 0) < DONE_TTL:
                log('跳过：%s 内已跑完一遍（ok=%s）' % (DONE_TTL // 3600, d.get('ok')))
                return 0
        except Exception:
            pass

    log('手机已解锁 → 开始全链')
    return 0 if full_pass() else 1


if __name__ == '__main__':
    sys.exit(main())
