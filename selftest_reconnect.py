#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""**断线自愈闸门**（整机可用性判据，此前没有）：

  1) 起服务端 + 两台被控端 → 两端在线
  2) **杀掉服务端**（模拟重启/崩溃）→ 被控端应自行重连，而不是退出等人手动重起
  3) 重新起服务端（同一端口、同一状态库）→ 不碰被控端进程，断言：
       · 主通道设备自动回到在线
       · 中继通道设备自动回到在线
       · 服务端重启后仍能下发命令并收到回帧（`getdev` → ack）
  4) 面板订阅计数在设备掉线/上线过程中不残留（`/api/_debug_device` 的 panel_subs）

判据：全部通过 exit 0。实测踩过的点：`refagent.py` 原先**没有重连循环**，服务端一重启它就退出了 —— 这条闸门就是防回退。
"""
import io
import json
import os
import socket
import ssl
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8819
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
DEV_M = 'reconn-primary-01'
DEV_D = 'reconn-relay-01'


def call(path, method='GET', body=None, tok=None, timeout=10):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:80]}


def start_server(env):
    p = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                          '--host', HOST, '--port', str(PORT)],
                         stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
    for _ in range(120):
        if call('/api/health')[0] == 200:
            return p
        if p.poll() is not None:
            return None
        time.sleep(0.25)
    return None


def port_free(host, port, timeout=8):
    end = time.time() + timeout
    while time.time() < end:
        s = socket.socket()
        s.settimeout(0.5)
        busy = s.connect_ex((host, port)) == 0
        s.close()
        if not busy:
            return True
        time.sleep(0.3)
    return False


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    checks = []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:160]})
        print('%-46s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:85]))
        return ok

    srv = start_server(env)
    if not srv:
        ck('服务端首次启动', False, 'health 未通')
        return 1
    ck('服务端首次启动', True, 'health 200')

    ag_m = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'refagent.py'),
                             '--url', BASE, '--device', DEV_M, '--retry', '2'],
                            stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
    ag_d = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'relay_agent.py'),
                             '--url', BASE, '--device', DEV_D, '--lang', 'zh-CN'],
                            stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)

    def both_online():
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        m = any(d.get('deviceId') == DEV_M and d.get('online')
                for d in call('/api/devices', tok=tok)[1].get('devices', []))
        dt = call('/api/EaodLogin.php', 'POST',
                  {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
        rows = call('/api/EaodAllDevices.php', 'POST',
                    {'token': dt, 'page': 1, 'pageSize': 50})[1].get('data', [])
        d = any(r.get('phone_id') == DEV_D and str(r.get('isonline')) == '1' for r in rows)
        return m, d, tok

    ok_m = ok_d = False
    for _ in range(40):
        ok_m, ok_d, _t = both_online()
        if ok_m and ok_d:
            break
        time.sleep(0.5)
    ck('两端被控端初次上线', ok_m and ok_d, 'primary=%s relay=%s' % (ok_m, ok_d))

    # ---- 杀服务端（模拟崩溃/重启）----
    srv.terminate()
    try:
        srv.wait(timeout=10)
    except Exception:
        srv.kill()
    port_free(HOST, PORT)
    ck('服务端已停止（端口释放）', call('/api/health')[0] != 200, 'health 不再响应')

    # 被控端**不应退出**（重连循环里等重连）
    time.sleep(3)
    ck('停止期间两端被控端进程仍存活（自己等重连）',
       ag_m.poll() is None and ag_d.poll() is None,
       'primary rc=%s relay rc=%s' % (ag_m.poll(), ag_d.poll()))

    # ---- 重新起服务端（同一端口/同一状态库）----
    srv2 = start_server(env)
    ck('服务端重启成功', bool(srv2), 'health 200')
    if not srv2:
        return 1

    ok_m = ok_d = False
    for _ in range(60):
        ok_m, ok_d, tok = both_online()
        if ok_m and ok_d:
            break
        time.sleep(0.5)
    ck('**未重起被控端**：主通道设备自动回到在线', ok_m)
    ck('**未重起被控端**：中继通道设备自动回到在线', ok_d)

    # 重启后链路仍可用：下发命令 → 收到回帧（按**时间**取帧，避免长跑实例里下标越过 200 帧窗口）
    t0 = int(time.time())   # 帧时间戳是**整秒**，用 float 会让同秒内的回帧被 >= 过滤掉
    st, _ = call('/api/relay_command', 'POST', {'deviceId': DEV_D, 'subc': 'getdev'}, tok=tok)
    ack = None
    for _ in range(40):
        frames = call('/api/device_frames?deviceId=%s&since_ts=%s' % (DEV_D, t0),
                      tok=tok)[1].get('frames', [])
        for f in frames:
            if f.get('action') == 'ack':
                ack = f
        if ack:
            break
        time.sleep(0.25)
    ck('重启后仍可下发 getdev 并收到 ack', ack is not None, str((ack or {}).get('data'))[:70])

    st, dbg = call('/api/_debug_device?deviceId=%s' % DEV_D, tok=tok)
    ck('订阅表无残留（panel_subs=0）', dbg.get('panel_subs') == 0, 'panel_subs=%s' % dbg.get('panel_subs'))

    # ---- 收尾 ----
    for p in (ag_m, ag_d):
        p.terminate()
    for p in (ag_m, ag_d):
        try:
            p.wait(timeout=8)
        except Exception:
            p.kill()
    srv2.terminate()
    try:
        srv2.wait(timeout=10)
    except Exception:
        srv2.kill()

    bad = [c for c in checks if not c['ok']]
    print('\n断线自愈闸门：%d/%d 通过' % (len(checks) - len(bad), len(checks)))
    out = os.path.join(HERE, 'evidence', '162_reconnect_e2e.json')
    json.dump({'passed': len(checks) - len(bad), 'total': len(checks), 'checks': checks},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
