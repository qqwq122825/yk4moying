#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Lifecycle / isolation / stability gate.

A) device up-down state machine: online -> disconnect -> offline(record kept) -> reconnect -> online
B) cross-C2 isolation: a Primary token must not work on Relay endpoints and vice versa
C) 20 reconnect rounds: device record count must not grow (no leak)

Exit 0 means all checks passed.
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
HOST, PORT = '127.0.0.1', 8815
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
RND = str(int(time.time()))[-6:]


def call(path, method='GET', body=None, tok=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:80]}


async def primary_online(dev):
    reader, writer = await asyncio.open_connection(HOST, PORT)
    key = base64.b64encode(os.urandom(16)).decode()
    writer.write(('GET /io/?EIO=3&transport=websocket&apkid=10020&device=%s&ver=v4.0 HTTP/1.1\r\n'
                  'Host: %s:%d\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n'
                  'Sec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n'
                  % (dev, HOST, PORT, key)).encode())
    await writer.drain()
    head = b''
    while b'\r\n\r\n' not in head:
        head += await reader.read(4096)
    assert b'101' in head.split(b'\r\n')[0]
    return reader, writer


async def relay_online(dev):
    reader, writer = await asyncio.open_connection(HOST, PORT)
    key = base64.b64encode(os.urandom(16)).decode()
    writer.write(('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
                  'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\n'
                  'Sec-WebSocket-Version: 13\r\n\r\n' % (HOST, PORT, key)).encode())
    await writer.drain()
    head = b''
    while b'\r\n\r\n' not in head:
        head += await reader.read(4096)
    payload = json.dumps({'itype': 'Slr_client', 'pid': dev, 'subc': 'hello'}).encode()
    mask = os.urandom(4)
    masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
    writer.write(struct.pack('!BB', 0x81, 0x80 | len(masked)) + mask + masked)
    await writer.drain()
    await asyncio.sleep(0.2)
    return reader, writer


def close(w, loop):
    """Really close: close() only requests it; wait_closed() is what sends FIN so the
    server can notice the disconnect."""
    try:
        w.close()
        if loop is not None and not loop.is_closed():
            loop.run_until_complete(w.wait_closed())
    except Exception:
        pass


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, '-u', os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=io.open(os.path.join(HERE, 'evidence',
                                                       '156_lifecycle_server.log'), 'w',
                                          encoding='utf-8'),
                           stderr=subprocess.STDOUT, env=env)
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:180]})
        if not ok:
            fails.append(name)
        print('%-46s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    loop = asyncio.new_event_loop()
    writers = []
    try:
        for _ in range(60):
            try:
                if call('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        dtok = call('/api/EaodLogin.php', 'POST',
                    {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')

        # ---------- A) Primary device state machine ----------
        mdev = 'life-m-%s' % RND
        r, w = loop.run_until_complete(primary_online(mdev))
        writers.append(w)
        time.sleep(0.5)
        row = next((x for x in (call('/api/devices', tok=tok)[1].get('devices') or [])
                    if x.get('deviceId') == mdev), None)
        ck('primary device online after connect', bool(row) and row.get('online') is True,
           str(row)[:50])
        close(w, loop)
        time.sleep(1.5)
        row2 = next((x for x in (call('/api/devices', tok=tok)[1].get('devices') or [])
                     if x.get('deviceId') == mdev), None)
        dbg = call('/api/_debug_device?deviceId=%s' % mdev, tok=tok)[1]
        ck('offline after disconnect, record kept',
           row2 is not None and row2.get('online') is False,
           'online=%r ws_cleared=%s' % ((row2 or {}).get('online'), dbg.get('ws_is_none')))
        r, w = loop.run_until_complete(primary_online(mdev))
        writers.append(w)
        time.sleep(0.6)
        row3 = next((x for x in (call('/api/devices', tok=tok)[1].get('devices') or [])
                     if x.get('deviceId') == mdev), None)
        ck('online again after reconnect', bool(row3) and row3.get('online') is True,
           str(row3)[:50])

        # ---------- A2) Relay device state machine ----------
        ddev = 'life-d-%s' % RND
        r, w = loop.run_until_complete(relay_online(ddev))
        writers.append(w)
        time.sleep(0.5)
        dl = call('/api/EaodAllDevices.php', 'POST',
                  {'token': dtok, 'page': 1, 'pageSize': 100}, tok)[1].get('list') or []
        drow = next((x for x in dl if x.get('phone_id') == ddev), None)
        ck('relay device isonline=1 after connect', bool(drow) and drow.get('isonline') == '1',
           str(drow)[:50])
        close(w, loop)
        time.sleep(1.5)
        dl2 = call('/api/EaodAllDevices.php', 'POST',
                   {'token': dtok, 'page': 1, 'pageSize': 100}, tok)[1].get('list') or []
        drow2 = next((x for x in dl2 if x.get('phone_id') == ddev), None)
        ddbg = call('/api/_debug_device?deviceId=%s' % ddev, tok=tok)[1]
        ck('relay device isonline=0 after disconnect, record kept',
           drow2 is not None and drow2.get('isonline') == '0',
           'isonline=%r ws_cleared=%s' % ((drow2 or {}).get('isonline'),
                                          ddbg.get('relay_ws_is_none')))

        # ---------- B) cross-C2 isolation ----------
        st, _b = call('/api/EaodAllDevices.php', 'POST', {'token': dtok, 'page': 1}, tok)
        ck('relay token works on relay endpoints', st == 200, 'status=%s' % st)
        st, _b = call('/api/devices', tok=dtok)
        ck('relay token rejected on primary endpoints', st == 401, 'status=%s' % st)
        st, _b = call('/api/EaodAccountManage.php', 'POST', {'token': tok, 'action': 'list'})
        ck('primary token rejected on relay endpoints', st == 401, 'status=%s' % st)

        # ---------- C) 20 reconnect rounds: no record growth ----------
        def dev_count():
            return len(call('/api/devices', tok=tok)[1].get('devices') or [])
        n0 = dev_count()
        for _i in range(20):
            rr, ww = loop.run_until_complete(primary_online(mdev))
            time.sleep(0.03)
            close(ww, loop)
        time.sleep(1.2)
        n1 = dev_count()
        ck('20 reconnect rounds: record count stable', n1 == n0, '%d -> %d' % (n0, n1))

        # ---------- cleanup offline ----------
        rows_before = call('/api/devices', tok=tok)[1].get('devices') or []
        off_ids_before = {x.get('deviceId') for x in rows_before if not x.get('online')}
        st, resp = call('/api/cleanup-offline', 'POST', {'confirm': True}, tok)
        rows_after = call('/api/devices', tok=tok)[1].get('devices') or []
        off_ids_after = {x.get('deviceId') for x in rows_after if not x.get('online')}
        gone = off_ids_before - off_ids_after
        removed = int((resp or {}).get('removed') or 0)
        ck('cleanup-offline actually removes offline devices',
           len(gone) == len(off_ids_before) and removed >= len(gone),
           'removed=%s gone=%d offline_before=%d' % (removed, len(gone), len(off_ids_before)))
        ck('cleanup-offline keeps online devices',
           all(x.get('online') for x in rows_after if x.get('deviceId') in
               {y.get('deviceId') for y in rows_before if y.get('online')}),
           'online_after=%d' % len([x for x in rows_after if x.get('online')]))

        print('\nlifecycle/isolation/stability: %d/%d passed' % (len(checks) - len(fails),
                                                                len(checks)))
        out = os.path.join(HERE, 'evidence', '156_lifecycle_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        for w in writers:
            close(w, loop)
        try:
            loop.close()
        except Exception:
            pass
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
