#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道控制台**实时通道**闸门（/api/ws/ 面板侧）。

判据来源：控制台前端（web/relay/index.html）实际发的消息序列，逐条对齐：
  1) 设备详情页轮询：`{itype:'slr_panel', subc:'checkphone', token, email, usrname, page, pageSize}`
     → 期望回 `{type:'checkphone', list:[...]}`（列表含在线设备）
  2) 各子页面（录屏/注入/人脸/投屏）在 checkphone 之后只发 `{itype:'slr_panel', subc:'join', pid, usercheck}`
     —— **不带 token**；期望回 `{type:'ok', action:'join'}`（此前只认 token，控制台被自己挡在门外 → 页面一直"连接重试中"，见 F-77）
  3) 订阅后设备侧的 recseg 帧要**实时推给面板**（`{type:'recseg', ...}`）—— 控制台"收到新录屏片段"靠它
  4) 命令下发送/订阅都不带 token：`{itype:'slr_panelsend', subc:'screen', comand:'snap', pid, usercheck}`
     也要能通过并真的把命令送到设备
  5) 反例：usercheck 指向不存在的账号 + 无 token → 必须回 `未授权操作`（不能因为放宽就变成谁都能进）
  6) 断开后订阅表要清干净（`/api/_debug_device` 的 panel_subs 归零），否则每次推帧都对着死连接发
判据：全部通过 exit 0。
"""
import asyncio
import base64
import io
import json
import os
import struct
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8818
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
DEV = 'panelwsdev000001'


def call(path, method='GET', body=None, tok=None):
    req = urllib.request.Request(BASE + path, method=method)
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    data = None
    if body is not None:
        data = json.dumps(body).encode()
        req.add_header('Content-Type', 'application/json')
    try:
        with urllib.request.urlopen(req, data, timeout=15) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        return e.code, {'raw': e.read(300).decode('utf-8', 'replace')}
    except Exception as e:
        return 0, {'error': str(e)[:80]}


class WsPanel(object):
    """/api/ws/ 的最小 WS 客户端（控制台用的就是裸 WebSocket，消息模型与之一致）"""

    def __init__(self):
        self.reader = None
        self.writer = None

    async def connect(self):
        self.reader, self.writer = await asyncio.open_connection(HOST, PORT)
        key = base64.b64encode(os.urandom(16)).decode()
        self.writer.write(('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
                           'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\n'
                           'Sec-WebSocket-Version: 13\r\n\r\n'
                           % (HOST, PORT, key)).encode())
        await self.writer.drain()
        head = b''
        while b'\r\n\r\n' not in head:
            head += await self.reader.read(4096)
        return head.startswith(b'HTTP/1.1 101')

    async def send(self, msg):
        payload = json.dumps(msg, ensure_ascii=False).encode()
        mask = os.urandom(4)
        masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
        n = len(masked)
        if n < 126:
            head = struct.pack('!BB', 0x81, 0x80 | n)
        elif n < 65536:
            head = struct.pack('!BBH', 0x81, 0x80 | 126, n)
        else:
            head = struct.pack('!BBQ', 0x81, 0x80 | 127, n)
        self.writer.write(head + mask + masked)
        await self.writer.drain()

    async def recv(self, timeout=12):
        try:
            h = await asyncio.wait_for(self.reader.readexactly(2), timeout=timeout)
        except Exception:
            return None
        ln = h[1] & 0x7f
        if ln == 126:
            ln = struct.unpack('>H', await self.reader.readexactly(2))[0]
        elif ln == 127:
            ln = struct.unpack('>Q', await self.reader.readexactly(8))[0]
        body = await asyncio.wait_for(self.reader.readexactly(ln), timeout=timeout)
        try:
            return json.loads(body.decode('utf-8', 'replace'))
        except Exception:
            return {'raw': body[:60].decode('utf-8', 'replace')}

    async def recv_until(self, kind, timeout=15):
        """收到 type == kind 的消息（跳过中间的其它推送）"""
        end = time.time() + timeout
        while time.time() < end:
            m = await self.recv(timeout=max(1, end - time.time()))
            if m is None:
                return None
            if m.get('type') == kind:
                return m
        return None

    async def close(self):
        # 必须 await wait_closed()：只 close() 只是"请求关闭"，事件循环不跑的话 FIN 发不出去，
        # 服务端根本感知不到断开（F-71 踩过同一个坑）
        try:
            self.writer.close()
            await asyncio.wait_for(self.writer.wait_closed(), timeout=5)
        except Exception:
            pass


async def scenario(checks):
    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:180]})
        print('%-52s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:90]))

    dtok = call('/api/EaodLogin.php', 'POST',
                {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
    ptok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')

    # 1) checkphone（带 token）
    p1 = WsPanel()
    await p1.connect()
    await p1.send({'itype': 'slr_panel', 'subc': 'checkphone', 'token': dtok,
                   'email': 'admin@local', 'usrname': USER, 'page': 1, 'pageSize': 1000,
                   'filters': {}})
    m = await p1.recv_until('checkphone')
    ids = [d.get('phone_id') for d in (m or {}).get('list', [])]
    ck('checkphone 带 token → 返回设备列表（含本设备）', m is not None and DEV in ids,
       'ids=%s' % (ids[:4],))

    # 2) join **不带 token**（控制台实际行为）
    await p1.send({'itype': 'slr_panel', 'subc': 'join', 'pid': DEV, 'usercheck': USER})
    j = await p1.recv_until('ok')
    ck('join 不带 token（只带 usercheck）→ 被接受', j is not None and j.get('action') == 'join',
       str(j)[:90])
    st, dbg = call('/api/_debug_device?deviceId=%s' % DEV, tok=ptok)
    ck('join 后订阅计数为 1', dbg.get('panel_subs') == 1, 'panel_subs=%s' % dbg.get('panel_subs'))

    # 3) 订阅后设备帧实时推给面板
    st, r = call('/api/relay_command', 'POST', {'deviceId': DEV, 'subc': 'Record'}, tok=ptok)
    pushed = await p1.recv_until('recseg', timeout=20)
    ck('订阅后收到设备 recseg 实时推送', pushed is not None,
       str((pushed or {}).get('seg') or (pushed or {}).get('type')))
    ck('推送里带设备 id 与帧数据', bool(pushed) and pushed.get('pid') == DEV and 'b64' in pushed,
       'keys=%s' % (sorted((pushed or {}).keys())[:6],))

    # 4) slr_panelsend 不带 token 也能下发
    await p1.send({'itype': 'slr_panelsend', 'subc': 'screen', 'comand': 'snap',
                   'stype': '1', 'pid': DEV, 'usercheck': USER})
    r = await p1.recv_until('ok')
    ck('slr_panelsend 不带 token → 被接受并下发', r is not None and r.get('type') == 'ok',
       str(r)[:90])

    # 5) 反例：不存在的账号 + 无 token → 必须拒绝
    p2 = WsPanel()
    await p2.connect()
    await p2.send({'itype': 'slr_panel', 'subc': 'join', 'pid': DEV, 'usercheck': 'no-such-user-x'})
    r = await p2.recv_until('error')
    ck('未知 usercheck 且无 token → 拒绝（未授权操作）',
       r is not None and '未授权' in str(r.get('msg')), str(r)[:80])
    await p2.close()

    # 6) 断开后订阅表清理
    await p1.close()
    for _ in range(20):
        st, dbg = call('/api/_debug_device?deviceId=%s' % DEV, tok=ptok)
        if dbg.get('panel_subs') == 0:
            break
        time.sleep(0.25)
    ck('面板断开后订阅计数归零（不留死连接）', dbg.get('panel_subs') == 0,
       'panel_subs=%s' % dbg.get('panel_subs'))


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
    ag = None
    checks = []
    try:
        for _ in range(240):
            if call('/api/health')[0] == 200:
                break
            time.sleep(0.25)
        ag = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'relay_agent.py'),
                               '--url', BASE, '--device', DEV, '--lang', 'zh-CN'],
                              stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
        for _ in range(120):
            st, dbg = call('/api/_debug_device?deviceId=%s' % DEV, tok=None)
            if call('/api/_debug_device?deviceId=%s' % DEV,
                    tok=call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
                    )[1].get('relay_ws_is_none') is False:
                break
            time.sleep(0.25)
        loop = asyncio.new_event_loop()
        try:
            loop.run_until_complete(scenario(checks))
        finally:
            loop.close()
    finally:
        if ag:
            ag.terminate()
            try:
                ag.wait(timeout=10)
            except Exception:
                ag.kill()
        srv.terminate()
        try:
            srv.wait(timeout=10)
        except Exception:
            srv.kill()

    bad = [c for c in checks if not c['ok']]
    print('\n控制台实时通道闸门：%d/%d 通过' % (len(checks) - len(bad), len(checks)))
    out = os.path.join(HERE, 'evidence', '159_panel_ws_e2e.json')
    json.dump({'passed': len(checks) - len(bad), 'total': len(checks), 'checks': checks},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
