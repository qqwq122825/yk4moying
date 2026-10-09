#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""**首启动（干净环境）验收**：把整套源码复制到临时目录、**不带任何运行时状态**，验证系统能从零自举。

为什么用复制而不是原地挪 state：
  · 原地挪会和"正在跑的演示实例"抢 state/refc2.db（Windows 文件锁，实测 PermissionError）；
  · 复制出来的目录是真正的"新机器"：没有 store.json、没有 refc2.db、没有证书 —— 更接近首次交付。
流程：
  1. 复制源码树到临时目录（排除 state*、__pycache__、大图）
  2. 在该目录起服务端（端口 8798）+ 两台被控端
  3. 断言：服务健康 / 两套控端可登录 / 两台被控端可注册上线 / 能下发命令收帧 /
     state/store.json 与 state/refc2.db **被自动创建** / 注入页与假锁屏模板可用
  4. 停实例并清理临时目录（失败时保留现场并打印路径）
退出码：0 = 从零可自举；1 = 任一步失败
"""
import io
import json
import os
import shutil
import socket
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8798
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
IGNORE = shutil.ignore_patterns('state', '_tmp', '_tmp_*', 'state_prev_*', 'state_bak*', '__pycache__',
                                '*.pyc', '*.png', '*.log')


def http(path, method='GET', body=None, tok=None, timeout=12):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            raw = r.read()
            try:
                return r.status, json.loads(raw.decode('utf-8', 'replace') or '{}')
            except Exception:
                return r.status, {'_raw_len': len(raw)}
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:90]}


def port_busy(host, port):
    s = socket.socket()
    s.settimeout(0.5)
    try:
        return s.connect_ex((host, port)) == 0
    finally:
        s.close()


def main():
    if port_busy(HOST, PORT):
        print('[first-run] 端口 %d 被占用，先停掉占用者再跑' % PORT)
        return 1
    # 临时目录放在工作区里（系统 temp 在本沙箱可能不可写；工作区一定可写）
    workroot = os.path.join(HERE, '_tmp')
    if os.environ.get('REF_FIRSTRUN_CHILD') == '1':
        print('[first-run] 子副本：跳过自复制（防止递归嵌套）'); sys.exit(0)
    os.makedirs(workroot, exist_ok=True)
    root = os.path.join(workroot, 'firstrun_' + time.strftime('%Y%m%d_%H%M%S'))
    dst = os.path.join(root, 'repro')
    os.makedirs(root, exist_ok=True)
    shutil.copytree(HERE, dst, ignore=IGNORE)
    _env = dict(os.environ); _env['REF_FIRSTRUN_CHILD'] = '1'
    has_state = os.path.exists(os.path.join(dst, 'state'))
    print('[first-run] 干净副本：%s（含 state 目录：%s）' % (dst, has_state))

    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    # 本闸门测的就是"干净环境自举"，必须**甩掉**外层闸门注入的 REFC2_STORE
    # （否则服务端会把状态写到闸门库，副本里当然看不到 store.json —— 这正是它第一次在总闸门里挂掉的原因）
    env.pop('REFC2_STORE', None)
    srv = subprocess.Popen([sys.executable, os.path.join(dst, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
    ag_m = ag_d = None
    checks = []

    def ck(name, ok, detail=''):
        checks.append((name, bool(ok), str(detail)[:120]))
        print('   %-42s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        ready = False
        for _ in range(120):
            if http('/api/health')[0] == 200:
                ready = True
                break
            if srv.poll() is not None:
                break
            time.sleep(0.25)
        ck('干净环境（无状态库/无证书）服务端能起来', ready, 'health=%s' % http('/api/health')[0])
        if not ready:
            raise SystemExit(1)

        tok = http('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        ck('主通道控端可登录', bool(tok))
        dtok = http('/api/EaodLogin.php', 'POST',
                    {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
        ck('中继通道控端可登录', bool(dtok))
        st, _ = http('/api/lockscreen/template?id=2')
        ck('假锁屏模板可用（读素材目录）', st == 200, 'status=%s' % st)
        st, body = http('/api/health')
        ck('路由表已挂载（116 条）', body.get('routes') == 116, 'routes=%s' % body.get('routes'))

        ag_m = subprocess.Popen([sys.executable, os.path.join(dst, 'agent', 'refagent.py'),
                                 '--url', BASE, '--device', 'firstrun-primary-1', '--retry', '2'],
                                stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
        ag_d = subprocess.Popen([sys.executable, os.path.join(dst, 'agent', 'relay_agent.py'),
                                 '--url', BASE, '--device', 'firstrun-relay-1', '--lang', 'zh-CN'],
                                stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)

        ok_m = ok_d = False
        for _ in range(60):
            dv = http('/api/devices', tok=tok)[1].get('devices', [])
            ok_m = any(d.get('deviceId') == 'firstrun-primary-1' and d.get('online') for d in dv)
            rows = http('/api/EaodAllDevices.php', 'POST',
                        {'token': dtok, 'page': 1, 'pageSize': 50})[1].get('data', [])
            ok_d = any(r.get('phone_id') == 'firstrun-relay-1'
                       and str(r.get('isonline')) == '1' for r in rows)
            if ok_m and ok_d:
                break
            time.sleep(0.5)
        ck('主通道被控端在空库上注册上线', ok_m)
        ck('中继通道被控端在空库上注册上线', ok_d)

        t0 = int(time.time())
        http('/api/relay_command', 'POST', {'deviceId': 'firstrun-relay-1', 'subc': 'getdev'}, tok=tok)
        ack = None
        for _ in range(40):
            frames = http('/api/device_frames?deviceId=firstrun-relay-1&since_ts=%d' % t0,
                          tok=tok)[1].get('frames', [])
            for f in frames:
                if f.get('action') == 'ack':
                    ack = f
            if ack:
                break
            time.sleep(0.25)
        ck('空库下能下发命令并收到回帧', ack is not None, str((ack or {}).get('data'))[:70])

        # 持久化自举：DB 在第一次访问时建、JSON 状态在第一次写入时落盘。
        # 所以这两条断言必须放在"已经发生过写入"之后（放在最前面会误报 —— 自查脚本踩过）
        ck('空库上自动建 state/refc2.db', os.path.exists(os.path.join(dst, 'state', 'refc2.db')))
        http('/api/device-pin', 'POST', {'deviceId': 'firstrun-primary-1', 'pinned': True}, tok=tok)
        store_p = os.path.join(dst, 'state', 'store.json')
        ck('首次写入后落盘 state/store.json', os.path.exists(store_p))
        try:
            S = json.load(io.open(store_p, encoding='utf-8'))
            ck('落盘的状态是合法 JSON 且记住了写入', S.get('pins', {}).get('firstrun-primary-1') is True,
               'pins=%s' % (S.get('pins'),))
        except Exception as e:
            ck('落盘的状态是合法 JSON', False, str(e))
    finally:
        for p in (ag_m, ag_d, srv):
            if p is None:
                continue
            try:
                p.terminate()
                p.wait(timeout=8)
            except Exception:
                try:
                    p.kill()
                except Exception:
                    pass

    bad = [c for c in checks if not c[1]]
    print('\n首启动验收：%d/%d 通过' % (len(checks) - len(bad), len(checks)))
    out = os.path.join(HERE, 'evidence', '164_first_run_e2e.json')
    json.dump({'passed': len(checks) - len(bad), 'total': len(checks),
               'checks': [{'check': n, 'ok': o, 'detail': d} for n, o, d in checks],
               'clean_copy': dst if bad else ''},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    if bad:
        print('（失败现场保留在 %s，便于排查）' % dst)
    else:
        shutil.rmtree(root, ignore_errors=True)
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
