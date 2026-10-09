#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""一致性与并发闸门：
  A) 并发创建同名对象 -> 只能成功一次（不能出现重复记录）
  B) 并发删除同一对象 -> 只能成功一次
  C) 重启一致性 -> 改过的状态在服务端重启后仍然一致（内存 / DB / 文件三处不漂移）
判据：全部通过 exit 0。
"""
import io
import json
import os
import subprocess
import sys
import threading
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8814
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


def start_server(env, logname):
    return subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                             '--host', HOST, '--port', str(PORT)],
                            stdout=io.open(os.path.join(HERE, 'evidence', logname), 'w',
                                           encoding='utf-8'),
                            stderr=subprocess.STDOUT, env=env)


def wait_up(timeout=60):
    for _ in range(timeout * 4):
        try:
            if call('/api/health')[0] == 200:
                return True
        except Exception:
            pass
        time.sleep(0.25)
    return False


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = start_server(env, '155_consistency_server.log')
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:180]})
        if not ok:
            fails.append(name)
        print('%-48s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        wait_up()
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        dtok = call('/api/EaodLogin.php', 'POST',
                    {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')

        # ---------- A) 并发建同名账号（主通道）----------
        uname = 'conc_%s' % RND
        res = []
        barrier = threading.Barrier(8)

        def mk():
            barrier.wait()
            res.append(call('/api/users', 'POST',
                            {'username': uname, 'password': 'Conc-Pass-11'}, tok)[1].get('ok'))
        ts = [threading.Thread(target=mk) for _ in range(8)]
        for t in ts:
            t.start()
        for t in ts:
            t.join()
        rows = call('/api/users', tok=tok)[1].get('users') or []
        dup = [r for r in rows if r.get('username') == uname]
        ck('并发建同名账号：只成功一次', sum(1 for x in res if x) == 1,
           '成功 %d / 8' % sum(1 for x in res if x))
        ck('并发建同名账号：列表无重复', len(dup) == 1, 'duplicates=%d' % len(dup))

        # ---------- A2) 并发建同名账号（中继通道）----------
        dname = 'conc_d_%s' % RND
        res2 = []
        barrier2 = threading.Barrier(8)

        def mk2():
            barrier2.wait()
            res2.append(call('/api/EaodAccountManage.php', 'POST',
                             {'token': dtok, 'action': 'add', 'usrname': dname,
                              'email': dname + '@local', 'password': 'Conc-Pass-11'}, tok)[1].get('code'))
        ts2 = [threading.Thread(target=mk2) for _ in range(8)]
        for t in ts2:
            t.start()
        for t in ts2:
            t.join()
        accs = call('/api/EaodAccountManage.php', 'POST',
                    {'token': dtok, 'action': 'list'}, tok)[1].get('accounts') or []
        ddup = [a for a in accs if a.get('usrname') == dname]
        ck('并发建同名账号（中继通道）：只成功一次', sum(1 for x in res2 if x == 200) == 1,
           '成功 %d / 8' % sum(1 for x in res2 if x == 200))
        ck('并发建同名账号（中继通道）：列表无重复', len(ddup) == 1, 'duplicates=%d' % len(ddup))

        # ---------- A3) 并发建分组：id 不冲突 ----------
        gids = []
        barrier3 = threading.Barrier(6)
        lock = threading.Lock()

        def mk3(i):
            barrier3.wait()
            r = call('/api/device-groups', 'POST', {'name': 'conc-g-%s-%d' % (RND, i)}, tok)[1]
            with lock:
                gids.append((r.get('group') or {}).get('id'))
        ts3 = [threading.Thread(target=mk3, args=(i,)) for i in range(6)]
        for t in ts3:
            t.start()
        for t in ts3:
            t.join()
        real = [g for g in gids if g]
        ck('并发建分组：无重复 id', len(real) == len(set(real)) and len(real) == 6,
           'ids=%d unique=%d' % (len(real), len(set(real))))

        # ---------- B) 并发删同一设备 ----------
        import base64, struct, asyncio

        async def online(dev):
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

        dev = 'conc-dev-%s' % RND
        loop = asyncio.new_event_loop()
        dr, dw = loop.run_until_complete(online(dev))
        dels, barrier4 = [], threading.Barrier(6)

        def dl():
            barrier4.wait()
            r = call('/api/DeletePhoneById.php', 'POST',
                     {'token': dtok, 'phone_id': dev}, tok)[1]
            dels.append(r.get('status'))
        ts4 = [threading.Thread(target=dl) for _ in range(6)]
        for t in ts4:
            t.start()
        for t in ts4:
            t.join()
        succ = sum(1 for x in dels if x == 'success')
        ck('并发删同一设备：只成功一次', succ == 1, 'success=%d fails=%d' % (succ, 6 - succ))

        # ---------- C) 重启一致性 ----------
        mkacc = 'persist_%s' % RND
        call('/api/EaodAccountManage.php', 'POST',
             {'token': dtok, 'action': 'add', 'usrname': mkacc, 'email': mkacc + '@local',
              'password': 'Persist-Pass-11', 'authorty': 'user'}, tok)
        g = call('/api/device-groups', 'POST', {'name': 'persist-g-%s' % RND}, tok)[1]
        gid = (g.get('group') or {}).get('id')
        dev2 = 'persist-dev-%s' % RND
        dr2, dw2 = loop.run_until_complete(online(dev2))
        call('/api/ReassignDevice.php', 'POST',
             {'token': dtok, 'phone_id': dev2, 'target_email': 'persist@local'}, tok)
        call('/api/BannedDevices.php', 'POST',
             {'token': dtok, 'action': 'ban', 'phone_id': dev2, 'reason': 'persist'}, tok)

        srv.terminate()
        srv.wait(timeout=15)
        srv = start_server(env, '155_consistency_server2.log')
        wait_up()
        tok2 = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        dtok2 = call('/api/EaodLogin.php', 'POST',
                     {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')

        accs2 = call('/api/EaodAccountManage.php', 'POST',
                     {'token': dtok2, 'action': 'list'}, tok2)[1].get('accounts') or []
        ck('重启后账号仍在', any(a.get('usrname') == mkacc for a in accs2),
           'n=%d' % len(accs2))
        ck('重启后该账号仍能登录（密码持久化）',
           call('/api/EaodLogin.php', 'POST',
                {'usrname': mkacc, 'password': 'Persist-Pass-11', 'captcha': '0000'})[0] == 200)
        gl = call('/api/device-groups', tok=tok2)[1].get('groups') or []
        ck('重启后分组仍在', any(x.get('id') == gid for x in gl), 'n=%d' % len(gl))
        bl = call('/api/BannedDevices.php', 'POST',
                  {'token': dtok2, 'action': 'list'}, tok2)[1]
        ck('重启后封禁记录仍在', any(x.get('phone_id') == dev2 for x in (bl.get('list') or [])),
           'n=%s' % bl.get('total'))
        # 设备重连（真实场景：服务端重启后设备会重连，归属应从持久化状态恢复）
        dr3, dw3 = loop.run_until_complete(online(dev2))
        time.sleep(0.5)
        dl2 = call('/api/EaodAllDevices.php', 'POST',
                   {'token': dtok2, 'page': 1, 'pageSize': 100}, tok2)[1].get('list') or []
        row = next((r for r in dl2 if r.get('phone_id') == dev2), None)
        ck('设备重连后归属从持久化状态恢复',
           bool(row) and row.get('assigned_to') == 'persist@local',
           'assigned_to=%s online=%s' % ((row or {}).get('assigned_to'), (row or {}).get('isonline')))

        try:
            dw2.close()
        except Exception:
            pass
        print('\n一致性与并发：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '155_consistency_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
