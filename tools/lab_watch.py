#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""lab 看护：把"整套演示栈"维持在活着 —— 服务端 / 主通道真机被控端 / 中继通道被控端 / adb 转发。

为什么需要它：这一轮用户反馈"很多都不生效"，第一条原因就是**整套栈死了没人知道** ——
服务端进程没了，控制台、接口、面板全都不响应，看起来像"功能没做"。
判据全部来自"能不能连上/能不能拿到状态"，不看进程名。

    python tools/lab_watch.py --password <口令>          # 前台看护（Ctrl+C 退出）
    python tools/lab_watch.py --interval 20 --once       # 只体检一轮
"""
import argparse
import io
import json
import os
import ssl
import subprocess
import sys
import time
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
PORT = 8793
BASE = 'https://127.0.0.1:%d' % PORT
TLS_CERT = os.path.join(REPRO, 'state', 'tls', 'cert_san.pem')
TLS_KEY = os.path.join(REPRO, 'state', 'tls', 'key_san.pem')
LOGS = os.path.join(REPRO, 'state', 'logs')
DEV_PRIMARY = 'refprimary0000001'
DEV_RELAY = 'relay-demo-0001'
ADB_CANDS = [r'adb', 'adb']

CTX = ssl.create_default_context()
CTX.check_hostname = False
CTX.verify_mode = ssl.CERT_NONE


def api(path, method='GET', body=None, tok=None, timeout=8):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, context=CTX, timeout=timeout) as r:
            return json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except Exception:
        return {}


def find_adb():
    from shutil import which
    for c in ADB_CANDS:
        if os.path.sep in c:
            if os.path.isfile(c):
                return c
        elif which(c):
            return which(c)
    return None


DEPS = ('aiohttp', 'yarl', 'multidict', 'frozenlist', 'propcache', 'attrs', 'aiosignal',
        'aiohappyeyeballs', 'idna',
        # 本项目的其他关键依赖：缺一个就会有一条闸门变红
        'cryptography', 'Crypto', 'PIL', 'websockets')


def deps_check():
    """依赖自检：返回坏掉的依赖列表。

    为什么要它：本次实测 site-packages 里 aiohttp/yarl 等包的 .py 被清掉、只剩 .pyd，
    `import aiohttp` 变成"命名空间包"→ 服务端起不来。看护如果只会"重启"，会陷入
    重启→失败→再重启的死循环，而人看到的只是"东西没反应"。
    """
    import importlib
    bad = []
    for m in DEPS:
        try:
            mod = importlib.import_module(m)
            if getattr(mod, '__file__', None) is None:      # 命名空间包 = 被掏空
                bad.append('%s(空壳)' % m)
        except Exception as e:
            bad.append('%s(%s)' % (m, str(e)[:40]))
    return bad


def server_alive():
    return bool(api('/api/health').get('ok'))


def start_server(password):
    os.makedirs(LOGS, exist_ok=True)
    env = dict(os.environ)
    env['REFC2_USER'] = 'admin'
    env['REFC2_PASS'] = password
    env['PYTHONIOENCODING'] = 'utf-8'
    args = [sys.executable, '-u', '-X', 'utf8', 'server/refc2.py', '--host', '0.0.0.0',
            '--port', str(PORT)]
    if os.path.exists(TLS_CERT) and os.path.exists(TLS_KEY):
        args += ['--tls-cert', 'state/tls/cert_san.pem', '--tls-key', 'state/tls/key_san.pem']
    log = open(os.path.join(LOGS, 'srv.log'), 'ab')
    p = subprocess.Popen(args, cwd=REPRO, env=env, stdout=log, stderr=subprocess.STDOUT,
                         creationflags=getattr(subprocess, 'CREATE_NEW_PROCESS_GROUP', 0))
    for _ in range(30):
        time.sleep(1)
        if server_alive():
            return p
    return None


def start_agent(script, dev, extra=None, retry=False):
    os.makedirs(LOGS, exist_ok=True)
    name = os.path.basename(script).replace('.py', '')
    log = open(os.path.join(LOGS, 'agent_%s.log' % name), 'ab')
    args = [sys.executable, '-u', '-X', 'utf8', script, '--url', BASE, '--device', dev]
    if retry:
        # 只有 refagent 有 --retry（relay_agent 没有；给它传会直接 argparse 报错退出）
        args += ['--retry', '3']
    args += (extra or [])
    return subprocess.Popen(args, cwd=REPRO, stdout=log, stderr=subprocess.STDOUT,
                            creationflags=getattr(subprocess, 'CREATE_NEW_PROCESS_GROUP', 0))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--password', default=os.environ.get('REFC2_PASS', ''))
    ap.add_argument('--interval', type=int, default=20)
    ap.add_argument('--once', action='store_true')
    ap.add_argument('--no-phone', action='store_true', help='不管手机被控端')
    a = ap.parse_args()
    if not a.password:
        print('需要口令：--password 或环境变量 REFC2_PASS'); return 2

    srv = None
    ag_d = None
    state = {}

    def note(key, val, msg):
        if state.get(key) != val:
            state[key] = val
            print('  [%s] %s' % (time.strftime('%H:%M:%S'), msg), flush=True)

    bad = deps_check()
    if bad:
        print('  [%s] !! 依赖坏了：%s' % (time.strftime('%H:%M:%S'), ', '.join(bad)), flush=True)
        print('        修法：python -m pip install --force-reinstall --no-cache-dir '
              'yarl multidict frozenlist propcache aiohttp cryptography', flush=True)
        print('        （site-packages 里的 .py 被清掉、只剩 .pyd 时，import 会变成空壳包）',
              flush=True)

    while True:
        # 1) 服务端
        if not server_alive():
            note('srv', False, '服务端不在，拉起…')
            srv = start_server(a.password)
            up = server_alive()
            note('srv', up, '服务端 %s' % ('已起' if up else '起不来'))
            if not up:
                tail = ''
                try:
                    with io.open(os.path.join(LOGS, 'srv.err'), encoding='utf-8',
                                 errors='replace') as fh:
                        tail = ''.join(fh.readlines()[-4:]).strip()[-300:]
                except Exception:
                    pass
                if tail:
                    print('        起不来的原因（srv.err 末尾）: %s' % tail.replace('\n', ' | '),
                          flush=True)
        else:
            note('srv', True, '服务端正常')

        tok = api('/api/login', 'POST', {'username': 'admin', 'password': a.password}).get('token')

        # 2) 两台被控端在线情况（用设备/号码表判，不看进程名）
        devs = api('/api/devices', tok=tok).get('devices', []) if tok else []
        online = {d.get('deviceId') for d in devs if d.get('online')}
        note('phone', DEV_PRIMARY, '主通道侧设备 %d 台在线' % len(online))
        # 中继通道被控端不在 /api/devices 里，走它自己的号码表
        dtok = api('/api/EaodLogin.php', 'POST',
                   {'usrname': 'admin', 'password': a.password, 'captcha': '0000'}).get('token')
        drows = api('/api/EaodAllDevices.php', 'POST',
                    {'token': dtok, 'page': 1, 'pageSize': 50}).get('data', []) if dtok else []
        d_on = [r.get('phone_id') for r in drows if str(r.get('isonline')) == '1']
        note('relay', bool(d_on), '中继通道被控端 %s' % ('在线 %s' % d_on if d_on else '不在线'))
        if not d_on:
            ag_d = start_agent('agent/relay_agent.py', DEV_RELAY, ['--lang', 'zh-CN'])
            time.sleep(6)

        # 3) 手机被控端 + adb 转发
        if not a.no_phone:
            adb = find_adb()
            if adb:
                subprocess.run([adb, 'reverse', 'tcp:8793', 'tcp:8793'],
                               capture_output=True, timeout=30)
                h = subprocess.run([adb, 'shell', "su -c 'pgrep -f refagent.py'"],
                                   capture_output=True, text=True, encoding='utf-8',
                                   errors='replace', timeout=30).stdout.strip()
                if not h:
                    note('phone', False, '手机被控端不在，重推重起…')
                    subprocess.run([sys.executable, '-X', 'utf8', 'tools/phone_deploy.py',
                                    '--password', a.password, '--base', BASE],
                                   cwd=REPRO, capture_output=True, timeout=300)
                    note('phone', True, '已重新拉起手机被控端')
                else:
                    note('phone', True, '手机被控端在跑')

        if a.once:
            print('体检完成：服务端=%s 主通道在线=%d 台 中继通道在线=%s'
                  % (server_alive(), len(online), d_on or '无'))
            return 0 if server_alive() else 1
        try:
            time.sleep(a.interval)
        except KeyboardInterrupt:
            print('\n看护停止')
            return 0


if __name__ == '__main__':
    sys.exit(main())
