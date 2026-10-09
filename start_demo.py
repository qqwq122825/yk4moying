#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""一键启动本地演示实例（控端 + 两端被控端）并自检。

```powershell
python start_demo.py                 # 默认 HTTPS + 前台守护（推荐：控制台实时通道完整）
python start_demo.py --detach        # 后台起好就返回（某些宿主/沙箱会连带杀子进程，不确定时用前台）
python start_demo.py --http          # 纯 HTTP（中继通道概况页实时通道会停在「连接重试中」，其余照常）
python start_demo.py --port 8899     # 换端口
python start_demo.py --check         # 只对已在跑的实例做自检，不启动任何东西
python stop_demo.py                  # 停掉本脚本启动的三个进程（只按登记的 PID，不动别的 python）
```

做什么：
  1. 端口占用检查（被占用直接报错退出，不误杀别人的进程）
  2. 缺证书就用 make_dev_cert.py 自签一张（只服务 127.0.0.1）
  3. 起 refc2 控制台服务 → 等 /api/health 通
  4. 起两台被控端（主通道 AES 通道 / 中继通道 WS 通道）
  5. 自检：两端各自登录 → 设备在线 → 中继通道下发 getdev → 被控端 ack 回帧
  6. 前台模式：守着三个进程打印状态，Ctrl+C 一次全停
退出码：0 = 启动且自检全通；1 = 任一步失败（并打印失败点）
"""
import argparse
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
STATE = os.path.join(HERE, 'state')
LOGS = os.path.join(STATE, 'logs')
CERT = os.path.join(STATE, 'tls', 'cert.pem')
KEY = os.path.join(STATE, 'tls', 'key.pem')
PIDS = os.path.join(LOGS, 'pids.json')

USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
DEV_PRIMARY = '7f3a91c4e08b2d16'
DEV_RELAY = 'relay-demo-0001'


def log(msg):
    print('[start-demo] %s' % msg, flush=True)


def port_busy(host, port):
    s = socket.socket()
    s.settimeout(1.0)
    try:
        return s.connect_ex((host, port)) == 0
    finally:
        s.close()


def spawn(args, logfile, extra_env=None):
    """脱离父进程启动（父进程退出后子进程继续跑），输出写日志文件"""
    fh = io.open(logfile, 'ab', buffering=0)
    flags = 0
    if os.name == 'nt':
        flags = getattr(subprocess, 'CREATE_NEW_PROCESS_GROUP', 0) | getattr(subprocess, 'DETACHED_PROCESS', 0)
    env = dict(os.environ, PYTHONIOENCODING='utf-8')
    env.update(extra_env or {})
    return subprocess.Popen([sys.executable, '-u'] + args, cwd=HERE, stdout=fh,
                            stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL,
                            creationflags=flags, env=env)


def http(base, path, method='GET', body=None, tok=None, timeout=15):
    ctx = None
    if base.startswith('https'):
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(base + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=timeout, context=ctx) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:100]}


def check(base, verbose=True):
    """对运行中的实例做自检，返回 (ok, 明细)"""
    rows = []

    def ck(name, ok, detail=''):
        rows.append((name, bool(ok), str(detail)[:110]))
        if verbose:
            print('   %-34s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))
        return ok

    st, h = http(base, '/api/health')
    ck('控制台服务健康', st == 200 and h.get('ok'), 'routes=%s devices=%s' % (h.get('routes'), h.get('devices')))
    tok = http(base, '/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
    ck('主通道登录拿到令牌', bool(tok))
    st, dv = http(base, '/api/devices', tok=tok)
    moy_online = any(d.get('deviceId') == DEV_PRIMARY and d.get('online') for d in dv.get('devices', []))
    ck('主通道被控端在线', moy_online, [d.get('deviceId') for d in dv.get('devices', [])])

    dtok = http(base, '/api/EaodLogin.php', 'POST',
                {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
    ck('中继通道登录拿到令牌', bool(dtok))
    st, allrows = http(base, '/api/EaodAllDevices.php', 'POST',
                       {'token': dtok, 'page': 1, 'pageSize': 50})
    relay_online = any(r.get('phone_id') == DEV_RELAY and str(r.get('isonline')) == '1'
                        for r in (allrows.get('data') or []))
    ck('中继通道被控端在线', relay_online, 'total=%s' % allrows.get('total'))

    t0 = int(time.time())   # 帧时间戳是**整秒**，用 float 会让同秒内的回帧被 >= 过滤掉
    st, cmd = http(base, '/api/relay_command', 'POST',
                   {'deviceId': DEV_RELAY, 'subc': 'getdev'}, tok=tok)
    ack = None
    for _ in range(40):
        frames = http(base, '/api/device_frames?deviceId=%s&since_ts=%s' % (DEV_RELAY, t0),
                      tok=tok)[1].get('frames', [])
        for f in frames:
            if f.get('action') == 'ack':
                ack = f
        if ack:
            break
        time.sleep(0.25)
    ck('中继通道下发 getdev -> 收到 ack 回帧', ack is not None,
       str((ack or {}).get('data'))[:80])
    bad = [r for r in rows if not r[1]]
    return (not bad), rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--host', default='127.0.0.1')
    ap.add_argument('--port', type=int, default=8793)
    ap.add_argument('--http', action='store_true', help='不起 TLS（中继通道概况页实时通道会停留在「连接重试中」）')
    ap.add_argument('--check', action='store_true', help='只对已运行实例做自检')
    ap.add_argument('--detach', action='store_true',
                    help='后台启动后立即返回（默认前台守护：守着三个进程，Ctrl+C 全停）')
    ap.add_argument('--yes', action='store_true', help='端口被占用时也继续（默认直接报错退出）')
    a = ap.parse_args()

    scheme = 'http' if a.http else 'https'
    base = '%s://%s:%d' % (scheme, a.host, a.port)
    os.makedirs(LOGS, exist_ok=True)

    if a.check:
        log('只做自检：%s' % base)
        ok, _ = check(base)
        log('自检结果：%s' % ('全部通过' if ok else '有失败项'))
        return 0 if ok else 1

    if port_busy(a.host, a.port) and not a.yes:
        log('端口 %d 已被占用 —— 先跑 python stop_demo.py，或 --port 换端口（不误杀别人的进程）' % a.port)
        return 1

    if not a.http and not (os.path.exists(CERT) and os.path.exists(KEY)):
        log('缺证书，自签一张（只服务 127.0.0.1）')
        r = subprocess.run([sys.executable, os.path.join(HERE, 'make_dev_cert.py')], cwd=HERE)
        if r.returncode != 0 or not os.path.exists(CERT):
            log('证书生成失败，改用 --http 或检查 make_dev_cert.py')
            return 1

    srv_args = ['server/refc2.py', '--host', a.host, '--port', str(a.port)]
    if not a.http:
        srv_args += ['--tls-cert', CERT, '--tls-key', KEY]
    log('启动控制台服务：%s' % base)
    # 账号口令随服务进程注入（不落盘；服务端没收到就用随机口令，自检会失败 —— 这里显式给）
    srv = spawn(srv_args, os.path.join(LOGS, 'server.log'),
                {'REFC2_USER': USER, 'REFC2_PASS': PASS})

    for _ in range(120):
        if http(base, '/api/health')[0] == 200:
            break
        if srv.poll() is not None:
            log('服务进程已退出，日志尾部：')
            print(io.open(os.path.join(LOGS, 'server.log'), encoding='utf-8', errors='replace')
                  .read()[-800:])
            return 1
        time.sleep(0.25)
    else:
        log('服务在 30s 内没起来，看 %s' % os.path.join(LOGS, 'server.log'))
        return 1
    log('服务已就绪')

    log('启动被控端：主通道 %s' % DEV_PRIMARY)
    ag1 = spawn(['agent/refagent.py', '--url', base, '--device', DEV_PRIMARY],
                os.path.join(LOGS, 'agent_primary.log'))
    log('启动被控端：中继通道 %s' % DEV_RELAY)
    ag2 = spawn(['agent/relay_agent.py', '--url', base, '--device', DEV_RELAY, '--lang', 'zh-CN'],
                os.path.join(LOGS, 'agent_relay.log'))

    json.dump({'server': srv.pid, 'agent_primary': ag1.pid, 'agent_relay': ag2.pid,
               'base': base, 'ts': int(time.time())},
              io.open(PIDS, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)

    log('等被控端上线…')
    ok_end = False
    for _ in range(40):
        time.sleep(0.5)
        tok = http(base, '/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        dv = http(base, '/api/devices', tok=tok)[1].get('devices', [])
        dtok = http(base, '/api/EaodLogin.php', 'POST',
                    {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
        dg = http(base, '/api/EaodAllDevices.php', 'POST',
                  {'token': dtok, 'page': 1, 'pageSize': 50})[1].get('data', [])
        if any(d.get('online') for d in dv) and any(str(r.get('isonline')) == '1' for r in dg):
            ok_end = True
            break

    print()
    log('自检：')
    ok, _ = check(base)
    print()
    print('=' * 74)
    print('  控端（主通道）   %s/panel/        admin / %s' % (base, PASS))
    print('  控端（中继通道） %s/             admin / %s' % (base, PASS))
    print('  样例设备       %s（主通道）  %s（中继通道）' % (DEV_PRIMARY, DEV_RELAY))
    print('  日志           %s' % LOGS)
    print('  停止           python stop_demo.py')
    if not a.http:
        print('  浏览器首次访问会提示证书不受信任（自签）→ 选「继续访问」')
    else:
        print('  注意：HTTP 模式下中继通道控制台概况页会停在「连接重试中」（前端写死 wss://）')
    print('=' * 74)
    if ok and ok_end:
        print('启动完成，自检全部通过。')
        rc = 0
    else:
        print('启动完成，但自检有失败项（见上）。')
        rc = 1

    if a.detach:
        return rc

    # 前台守护：父进程活着，子进程才活得久（某些宿主/沙箱会在父进程退出时连带清理子进程树）
    print('前台守护中（Ctrl+C 停止三个进程）… 日志：%s' % LOGS)
    try:
        while True:
            time.sleep(2)
            dead = [n for n, p in (('服务', srv), ('主通道被控端', ag1), ('中继通道被控端', ag2))
                    if p.poll() is not None]
            if dead:
                print('！以下进程已退出：%s —— 停止其余进程' % '、'.join(dead))
                for p in (srv, ag1, ag2):
                    if p.poll() is None:
                        p.terminate()
                return 1
    except KeyboardInterrupt:
        print('\n收到中断，停止三个进程…')
        for p in (srv, ag1, ag2):
            try:
                p.terminate()
            except Exception:
                pass
        for p in (srv, ag1, ag2):
            try:
                p.wait(timeout=8)
            except Exception:
                try:
                    p.kill()
                except Exception:
                    pass
        try:
            os.remove(PIDS)
        except Exception:
            pass
        return rc


if __name__ == '__main__':
    sys.exit(main())
