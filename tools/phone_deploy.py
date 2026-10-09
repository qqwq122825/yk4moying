#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""手机被控端一键上线（全自动）。

一条命令做完：USB 通道转发 -> 推送设备端代码 -> 后台常驻启动 -> 对着服务端自证上线。

     python tools/phone_deploy.py                  # 部署 + 启动 + 验收
     python tools/phone_deploy.py --verify-only    # 只验收（不推送、不重启）
     python tools/phone_deploy.py --no-start       # 只推送，不启动

退出码 = 未通过的检查项数量（0 = 全部通过）。
"""
import argparse
import json
import os
import ssl
import subprocess
import sys
import time
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
AGENT_DIR = os.path.join(REPRO, 'agent')
PROTO_DIR = os.path.join(REPRO, 'protocol')

TERMUX_HOME = '/data/data/com.termux/files/home'
TERMUX_PY = '/data/data/com.termux/files/usr/bin/python'
PHONE_AGENT = TERMUX_HOME + '/agent'
PHONE_PROTO = TERMUX_HOME + '/protocol'
LOG = TERMUX_HOME + '/agent.log'

DEFAULT_ADB = [r'adb', 'adb']

PUSH = [  # (本地, /data/local/tmp 中转名, 手机目标目录, 显示名)
    (os.path.join(AGENT_DIR, 'refagent.py'), 'refagent.py', PHONE_AGENT, 'agent/refagent.py'),
    (os.path.join(AGENT_DIR, 'actions.py'), 'actions.py', PHONE_AGENT, 'agent/actions.py'),
    (os.path.join(AGENT_DIR, 'frames.py'), 'frames.py', PHONE_AGENT, 'agent/frames.py'),
    (os.path.join(AGENT_DIR, 'dispatch.py'), 'dispatch.py', PHONE_AGENT, 'agent/dispatch.py'),
    (os.path.join(AGENT_DIR, 'Crypto', '__init__.py'), 'crypto_init.py', PHONE_AGENT + '/Crypto',
     'agent/Crypto/__init__.py'),
    (os.path.join(AGENT_DIR, 'Crypto', 'Cipher', '__init__.py'), 'cipher_init.py',
     PHONE_AGENT + '/Crypto/Cipher', 'agent/Crypto/Cipher/__init__.py'),
    (os.path.join(PROTO_DIR, 'binary_proto.py'), 'binary_proto.py', PHONE_PROTO,
     'protocol/binary_proto.py'),
]

RESULTS = []


def check(name, ok, detail=''):
    RESULTS.append((name, bool(ok), detail))
    print('  %-4s %-28s %s' % ('OK' if ok else 'FAIL', name, detail))
    return ok


def find_adb(explicit=None):
    cands = ([explicit] if explicit else []) + DEFAULT_ADB
    for c in cands:
        if c and (os.path.sep in c or '/' in c):
            if os.path.isfile(c):
                return c
        else:
            from shutil import which
            p = which(c)
            if p:
                return p
    return None


def adb_run(adb, *args, timeout=120):
    r = subprocess.run([adb] + [str(a) for a in args], capture_output=True,
                       text=True, encoding='utf-8', errors='replace', timeout=timeout)
    return ((r.stdout or '') + (r.stderr or '')).strip()


def su(adb, cmd, timeout=180):
    return adb_run(adb, 'shell', "su -c '%s'" % cmd.replace("'", "'\\''"), timeout=timeout)


def api(base, path, method='GET', body=None, tok=None, timeout=25):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(base + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE
    try:
        with urllib.request.urlopen(req, context=ctx, timeout=timeout) as r:
            return json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except Exception as e:
        return {'_err': '%s: %s' % (type(e).__name__, str(e)[:90])}


def agent_alive(adb):
    return bool(su(adb, 'pgrep -f refagent.py').strip())


def resolve_device_id(adb, explicit=''):
    """设备号取一次就固定下来（换号会让设备列表越积越多）。"""
    did = explicit or su(adb, 'cat %s/.device_id 2>/dev/null' % PHONE_AGENT).strip()
    if not did:
        ps = su(adb, "ps -A -o ARGS 2>/dev/null | grep refagent.py | head -1")
        if '--device' in ps:
            did = ps.split('--device')[1].strip().split()[0]
    if not did:
        raw = su(adb, 'settings get secure android_id').strip()
        did = (raw * 2)[:16] if 0 < len(raw) < 16 else (raw or 'lab-phone-000001')[:32]
    su(adb, 'echo %s > %s/.device_id' % (did, PHONE_AGENT))
    return did


def start_agent(adb, url, did):
    su(adb, 'pkill -f refagent.py 2>/dev/null; sleep 1; rm -f %s' % LOG)
    cmd = ('export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib; '
           'export PATH=/data/data/com.termux/files/usr/bin:$PATH; '
           'export HOME=%s; export PYTHONUNBUFFERED=1; cd %s; '
           'setsid %s -u refagent.py --url %s --device %s > %s 2>&1 &'
           % (TERMUX_HOME, PHONE_AGENT, TERMUX_PY, url, did, LOG))
    return su(adb, cmd)


def watch(adb, a):
    """常驻看护：USB 插拔会掉 adb reverse，进程也可能被系统杀掉 —— 这里替人盯着。

    每 `--watch` 秒：重建转发 + 进程没了就拉起 + 只在状态变化时打印（不刷屏）。
    """
    did = resolve_device_id(adb, a.device_id)
    print('\n  看护模式：每 %ss 检查一次（Ctrl+C 退出）；设备号 %s -> %s' % (a.watch, did, a.url))
    state = None
    while True:
        try:
            devs = [l.split('\t')[0] for l in adb_run(adb, 'devices', timeout=30).splitlines()[1:]
                    if '\tdevice' in l]
            if not devs:
                if state != ('nousb',):
                    print('  [%s] 没检测到 USB 设备，等它回来…' % time.strftime('%H:%M:%S'))
                    state = ('nousb',)
                time.sleep(a.watch)
                continue
            for port in ('8793', '443', '80'):
                adb_run(adb, 'reverse', 'tcp:%s' % port, 'tcp:8793', timeout=30)
            alive = agent_alive(adb)
            if not alive:
                start_agent(adb, a.url, did)
                alive = True
            now = (True, alive)
            if now != state:
                t = time.strftime('%H:%M:%S')
                print('  [%s] 转发已建 / 设备端%s' % (t, '在跑' if alive else '已重启'))
                if not state or not state[1]:
                    for line in su(adb, 'tail -6 %s' % LOG).splitlines():
                        print('      | %s' % line)
                state = now
        except KeyboardInterrupt:
            print('\n  看护停止')
            return 0
        except Exception as e:
            print('  [%s] 看护循环异常：%s: %s' % (time.strftime('%H:%M:%S'), type(e).__name__, str(e)[:80]))
        time.sleep(a.watch)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--adb', default=None)
    ap.add_argument('--device-id', default='')
    ap.add_argument('--url', default='https://127.0.0.1:8793',
                    help='被控端要连的通道地址（经 adb reverse 落到本机 lab）')
    ap.add_argument('--base', default='https://127.0.0.1:8793', help='lab API 基址（验收用）')
    ap.add_argument('--user', default=os.environ.get('REFC2_USER', 'admin'))
    ap.add_argument('--password', default=os.environ.get('REFC2_PASS', ''))
    ap.add_argument('--verify-only', action='store_true')
    ap.add_argument('--no-start', action='store_true')
    ap.add_argument('--watch', type=int, default=0, metavar='SEC',
                    help='验收后进入常驻看护：每 SEC 秒重建转发、拉起掉线的设备端')
    a = ap.parse_args()

    adb = find_adb(a.adb)
    if not check('adb 可用', bool(adb), adb or '未找到 adb（--adb 指定或装 platform-tools）'):
        return sum(1 for _, ok, _ in RESULTS if not ok)

    out = adb_run(adb, 'devices')
    devs = [l.split('\t')[0] for l in out.splitlines()[1:] if '\tdevice' in l]
    if not check('USB 已连接设备', bool(devs), ','.join(devs) or out.replace('\n', ' ')[:80]):
        return sum(1 for _, ok, _ in RESULTS if not ok)

    if not a.verify_only:
        for port in ('8793', '443', '80'):
            r = adb_run(adb, 'reverse', 'tcp:%s' % port, 'tcp:8793')
            # 80 在部分机型 <1024 端口受限，失败不算错
            check('reverse tcp:%s' % port, (not r) or 'cannot bind' in r or 'Permission denied' in r,
                  r or 'ok')
        ver = su(adb, '%s -V 2>&1' % TERMUX_PY).splitlines()
        check('手机端 python 可用', bool(ver) and 'Python' in ver[0], ver[0] if ver else '未安装')

        for local, remote, dest, label in PUSH:
            if not os.path.isfile(local):
                check('推送 %s' % label, False, '缺文件 %s' % local)
                continue
            r = adb_run(adb, 'push', local, '/data/local/tmp/' + remote)
            ok = '1 file pushed' in r or 'file pushed' in r
            if ok:
                # 中转名与目标名可以不同：两个 __init__.py 会被中转目录撞名
                su(adb, 'mkdir -p %s && cp /data/local/tmp/%s %s/%s'
                   % (dest, remote, dest, os.path.basename(local)))
            check('推送 %s' % label, ok, r.splitlines()[-1][:70] if r else '')

        su(adb, 'rm -rf %s/__pycache__ %s/__pycache__ %s/Crypto/__pycache__ '
                '%s/Crypto/Cipher/__pycache__' % (PHONE_AGENT, PHONE_PROTO, PHONE_AGENT, PHONE_AGENT))

        if not a.no_start:
            did = resolve_device_id(adb, a.device_id)
            start_agent(adb, a.url, did)
            print('\n  设备号 %s -> %s（后台常驻，断线每 5s 自动重连）' % (did, a.url))
            time.sleep(12)
            lg = su(adb, 'tail -12 %s' % LOG)
            for line in lg.splitlines():
                print('    | %s' % line)
            check('设备端进程在跑', agent_alive(adb), '')
            check('注册/通道已建立', '注册成功' in lg and 'WS 已连接' in lg, '')

    if a.watch:
        return watch(adb, a)

    # ---------------- 服务端自证 ----------------
    print('\n  服务端验收（%s）' % a.base)
    tok = api(a.base, '/api/login', 'POST', {'username': a.user, 'password': a.password}).get('token')
    if not check('控制台登录', bool(tok), '用 REFC2_PASS 或 --password 传口令'):
        return sum(1 for _, ok, _ in RESULTS if not ok)
    h = api(a.base, '/api/health')
    check('服务端在跑', bool(h.get('ok')), 'routes=%s' % h.get('routes'))
    ds = api(a.base, '/api/devices', tok=tok).get('devices', [])
    on = [d for d in ds if d.get('online')]
    if not check('设备在线', bool(on), '%d 台在线 / %d 台已登记' % (len(on), len(ds))):
        return sum(1 for _, ok, _ in RESULTS if not ok)

    dev = on[0]['deviceId']
    # 用 since_ts 按时间取，而不是比较"帧总数"：实时通道在跑时帧数一直在涨，
    # 而 /api/device_frames 只回最后 200 帧 —— 总数早就饱和了，比长度会假失败（踩过）
    t0 = int(time.time())
    api(a.base, '/api/command', 'POST', {'deviceId': dev, 'action': 'deviceInfo', 'data': {}}, tok=tok)
    time.sleep(2)
    api(a.base, '/api/command', 'POST', {'deviceId': dev, 'action': 'screenshot', 'data': {}}, tok=tok)
    time.sleep(3)
    fresh = api(a.base, '/api/device_frames?deviceId=%s&since_ts=%d' % (dev, t0), tok=tok)
    got = fresh.get('frames', [])
    names = sorted({f.get('action') for f in got})
    check('指令下发得到回帧', bool(got), '%d 条（%s）' % (len(got), ','.join(names)[:60]))
    frames_with_source = [f for f in got if (f.get('data') or {}).get('source') == 'screencap']

    print('  等二进制通道投递（心跳 + 屏幕帧，10s 一轮）…')
    bs = {}
    for _ in range(6):
        time.sleep(10)
        bs = api(a.base, '/api/binary_stats?deviceId=%s' % dev, tok=tok)
        if (bs.get('binary') or {}).get('reassembled'):
            break
    b = bs.get('binary') or {}
    check('二进制通道连上', b.get('conn') is True, json.dumps(b, ensure_ascii=False)[:100])
    check('分片帧重组成功', bool(b.get('reassembled')), '帧=%s 重组=%s 坏帧=%s'
          % (b.get('frames'), b.get('reassembled'), b.get('bad')))
    shots = bs.get('shots') or []
    check('画面已落盘', bool(shots), (shots or [{}])[-1].get('file', ''))
    # 判据用**帧来源**（`source == 'screencap'`），不用字节数：
    # 深色/锁屏界面截下来本来就小（实测 5.8 KB），按大小判会把真的真机画面判成占位图。
    sc = frames_with_source or []
    last_bytes = (shots or [{}])[-1].get('bytes', 0)
    check('画面来自真机截屏', bool(sc), 'source=screencap 最新一帧 %s B' % last_bytes)

    fails = sum(1 for _, ok, _ in RESULTS if not ok)
    print('\n=== %d/%d 通过%s ===' % (len(RESULTS) - fails, len(RESULTS),
                                  '' if not fails else '（%d 项未通过）' % fails))
    if fails:
        print('未通过：', ', '.join(n for n, ok, _ in RESULTS if not ok))
    return fails


if __name__ == '__main__':
    sys.exit(main())
