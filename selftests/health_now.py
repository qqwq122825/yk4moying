#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""一眼体检：现在这一刻，整套东西到底是不是活着、能不能用。

只打现状，不打历史结论 —— 用户问"搞定了吗"，就用这一条命令回答。
"""
import asyncio
import json
import os
import ssl
import subprocess
import sys
import time
import urllib.request

import aiohttp

B = 'https://127.0.0.1:8793'
DEV = 'primary-demo-0001'
RELAY = 'relay-demo-0001'
ADB = r'adb'
CTX = ssl.create_default_context()
CTX.check_hostname = False
CTX.verify_mode = ssl.CERT_NONE
R = []


def ck(name, ok, detail=''):
    R.append((name, bool(ok), detail))
    print('  %-4s %-26s %s' % ('OK' if ok else 'FAIL', name, detail))


def api(p, m='GET', b=None, tok=None, timeout=15):
    d = json.dumps(b).encode() if b is not None else None
    r = urllib.request.Request(B + p, method=m, data=d)
    if d:
        r.add_header('Content-Type', 'application/json')
    if tok:
        r.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(r, context=CTX, timeout=timeout) as x:
            return json.loads(x.read().decode('utf-8', 'replace') or '{}')
    except Exception as e:
        return {'_err': str(e)[:60]}


def sh(cmd, timeout=30):
    try:
        r = subprocess.run([ADB, 'shell', "su -c '%s'" % cmd.replace("'", "'\\''")],
                           capture_output=True, text=True, encoding='utf-8',
                           errors='replace', timeout=timeout)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return '_err %s' % e


PW = os.environ.get('REFC2_PASS', '')
print('=== 1. 栈本身 ===')
h = api('/api/health')
ck('服务端在跑', h.get('ok') is True, 'routes=%s devices=%s online=%s'
   % (h.get('routes'), h.get('devices'), h.get('online')))
tv = subprocess.run(['powershell', '-NoProfile', '-Command',
                     "(Get-Process python -ErrorAction SilentlyContinue | "
                     "Where-Object {$_.Path -like '*python*'}) | Measure-Object | "
                     "Select-Object -ExpandProperty Count"],
                    capture_output=True, text=True).stdout.strip()

tok = api('/api/login', 'POST', {'username': 'admin', 'password': PW}).get('token')
ck('控制台登录', bool(tok), '')

print('\n=== 2. 两台被控端 ===')
devs = api('/api/devices', tok=tok).get('devices', [])
mine = [d for d in devs if d.get('deviceId') == DEV]
ck('主通道·真机在线', bool(mine and mine[0].get('online')),
   json.dumps({k: mine[0].get(k) for k in ('deviceId', 'brand', 'model', 'online')},
              ensure_ascii=False) if mine else '不在表里')
dt = api('/api/EaodLogin.php', 'POST',
         {'usrname': 'admin', 'password': PW, 'captcha': '0000'}).get('token')
rows = api('/api/EaodAllDevices.php', 'POST', {'token': dt, 'page': 1, 'pageSize': 50}).get('data', [])
d_on = [r.get('phone_id') for r in rows if str(r.get('isonline')) == '1']
ck('中继通道被控端在线', bool(d_on), str(d_on))

def wait_frame(t0, pred, seconds=25):
    """轮询等服务端落帧。

    实测：真机上 `su -c id` 一次要 8~9s（Magisk 起 su 的开销 + 指令排在画面拉流后面），
    固定 sleep(3) 会把**正常**的回帧判成失败 —— 这里改成轮询，判据不变。
    """
    deadline = time.time() + seconds
    while time.time() < deadline:
        fr = api('/api/device_frames?deviceId=%s&since_ts=%d' % (DEV, t0), tok=tok).get('frames', [])
        hit = [f for f in fr if pred(f.get('data') or {})]
        if hit:
            return hit, round(time.time() - t0, 1)
        time.sleep(1.0)
    return [], round(time.time() - t0, 1)


print('\n=== 3. 真机能不能控 ===')
t0 = int(time.time())
api('/api/command', 'POST', {'deviceId': DEV, 'action': 'adbShell',
                             'data': {'cmd': 'id'}}, tok=tok)
hits, dt = wait_frame(t0, lambda d: d.get('action') == 'adbShell')
out = (hits[-1].get('data') or {}).get('output') or '' if hits else ''
ck('adbShell 真命令', 'uid=0' in out, '%s（%.1fs 回帧）' % (out.strip()[:44], dt))

t0 = int(time.time())
api('/api/command', 'POST', {'deviceId': DEV, 'action': 'screenshot', 'data': {}}, tok=tok)
hits, dt = wait_frame(t0, lambda d: d.get('source') == 'screencap')
sc = hits
ck('真机截屏', bool(sc), 'source=screencap %s（%.1fs 回帧）' % (
    ((sc[-1].get('data') or {}).get('count') if sc else '-'), dt))

bs = api('/api/binary_stats?deviceId=%s' % DEV, tok=tok).get('binary') or {}
ck('二进制通道在推画面', bs.get('conn') is True and (bs.get('types') or {}).get('screen', 0) > 0,
   'screen 帧 %s / 重组 %s' % ((bs.get('types') or {}).get('screen'), bs.get('reassembled')))
ck('手机被控端进程在跑', bool(sh('pgrep -f refagent.py')), '')
ck('adb reverse 在', 'tcp:8793' in subprocess.run([ADB, 'reverse', '--list'], capture_output=True,
                                                  text=True, encoding='utf-8',
                                                  errors='replace').stdout, '')


print('\n=== 4. 两条实时通道（面板/控制台看画面用）===')
async def chan(path, binary, seconds=8):
    url = 'wss://127.0.0.1:8793%s?id=%s&token=%s' % (path, DEV, tok)
    n = 0
    async with aiohttp.ClientSession(connector=aiohttp.TCPConnector(ssl=CTX)) as s:
        async with s.ws_connect(url, heartbeat=None, max_msg_size=32 * 1024 * 1024) as ws:
            code = ws._response.status
            t = time.time()
            while time.time() - t < seconds and n < 2:
                try:
                    m = await asyncio.wait_for(ws.receive(), timeout=seconds)
                except asyncio.TimeoutError:
                    break
                if binary and m.type == aiohttp.WSMsgType.BINARY:
                    n += 1
                elif not binary and m.type == aiohttp.WSMsgType.TEXT:
                    n += 1
    return code, n


(s1, n1) = asyncio.run(chan('/api/sl/ws', True))
(s2, n2) = asyncio.run(chan('/api/ut/ws', False))
ck('画面通道 sl/ws', s1 == 101 and n1 > 0, '握手 %s / %d 帧' % (s1, n1))
ck('控件树通道 ut/ws', s2 == 101 and n2 > 0, '握手 %s / %d 帧' % (s2, n2))

print('\n=== 5. 控制台页面 ===')
for p in ('/console', '/panel/', '/'):
    r = urllib.request.Request(B + p)
    try:
        with urllib.request.urlopen(r, context=CTX, timeout=10) as x:
            ck('页面 %-10s' % p, x.status == 200, '%d 字节' % len(x.read()))
    except Exception as e:
        ck('页面 %-10s' % p, False, str(e)[:50])

fails = [r for r in R if not r[1]]
print('\n' + '=' * 66)
print('现状体检：%d 项，通过 %d，未通过 %d' % (len(R), len(R) - len(fails), len(fails)))
for n, _, d in fails:
    print('  FAIL %-26s %s' % (n, d))
sys.exit(1 if fails else 0)
