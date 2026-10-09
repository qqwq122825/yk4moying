#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""端到端自证：起服务端 -> 起设备端 -> 运营侧下发 takeScreen -> 断言收到截图
判据：退出码 0 = 协议实现可跑通（全链路在同一台机上，不涉任何外部目标）
"""
import asyncio, json, os, random, subprocess, sys, time
import urllib.request

HOST, PORT = '127.0.0.1', 8799
BASE = 'http://%s:%d' % (HOST, PORT)
HERE = os.path.dirname(os.path.abspath(__file__))
USER, PASS = 'admin', 'selftest-' + ''.join(random.choice('abcdef0123456789') for _ in range(6))


def post(path, body, token=None):
    req = urllib.request.Request(BASE + path, data=json.dumps(body).encode(),
                                 headers={'Content-Type': 'application/json'})
    if token:
        req.add_header('Authorization', 'Bearer ' + token)
    with urllib.request.urlopen(req, timeout=15) as r:
        return json.loads(r.read().decode())


def get(path, token=None):
    req = urllib.request.Request(BASE + path)
    if token:
        req.add_header('Authorization', 'Bearer ' + token)
    with urllib.request.urlopen(req, timeout=15) as r:
        return json.loads(r.read().decode())


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS)
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env)
    dev = ''.join(random.choice('0123456789abcdef') for _ in range(16))
    ag = None
    try:
        # 等服务端起
        for _ in range(40):
            try:
                if get('/api/health')['ok']:
                    break
            except Exception:
                time.sleep(0.25)
        else:
            print('[FAIL] 服务端未就绪'); return 1
        print('[selftest] 服务端就绪')

        ag = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'refagent.py'),
                               '--url', BASE, '--device', dev],
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        # 等设备上线
        online = False
        for _ in range(60):
            time.sleep(0.25)
            if ag.poll() is not None:
                out = ag.stdout.read().decode('utf-8', 'replace')
                print('[FAIL] agent 提前退出:\n%s' % out[-1500:]); return 1
            try:
                d = get('/api/devices', token=post('/api/login', {'username': USER, 'password': PASS})['token'])
                if any(x['deviceId'] == dev and x['online'] for x in d['devices']):
                    online = True
                    break
            except Exception:
                pass
        if not online:
            print('[FAIL] 设备未上线'); return 1
        print('[selftest] 设备已上线 %s' % dev)

        tok = post('/api/login', {'username': USER, 'password': PASS})['token']
        r = post('/api/command', {'deviceId': dev, 'action': 'takeScreen'}, token=tok)
        print('[selftest] 下发 takeScreen -> %s' % r)

        shots = 0
        for _ in range(40):
            time.sleep(0.25)
            tr = get('/api/device_trace?deviceId=%s' % dev, token=tok)
            shots = len(tr['shots'])
            if shots:
                break
        if not shots:
            print('[FAIL] 未收到 screenshot 回帧'); return 1
        print('[selftest] 收到 screenshot 回帧 %d 张' % shots)

        # 再验一条数据类指令（帧名按源码字典：readSmsList -> smsList，见 docs/agent_protocol.md）
        post('/api/command', {'deviceId': dev, 'action': 'readSmsList',
                              'data': {'pagesize': 50, 'curpage': 1, 'fromAdmin': 'admin'}}, token=tok)
        ok_sms = False
        for _ in range(40):
            time.sleep(0.25)
            tr = get('/api/device_trace?deviceId=%s' % dev, token=tok)
            if any(m.get('action') == 'smsList' for m in tr['msgs']):
                ok_sms = True
                break
        if not ok_sms:
            print('[FAIL] 未收到 smsList 回帧'); return 1
        print('[selftest] 收到 smsList 回帧')
        print('\n=== PASS：协议实现端到端跑通（注册 / 通道 / 指令下发 / 数据回传）===')
        return 0
    finally:
        for p in (ag, srv):
            if p and p.poll() is None:
                p.terminate()


if __name__ == '__main__':
    sys.exit(main())
