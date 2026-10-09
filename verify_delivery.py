#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""交付前只读体检（不写任何东西）：
  A) SPA 深层路由：/panel/* 必须回主通道壳、/* 必须回中继通道壳、/api/* 未知必须 404
  B) 静态资源面子（panel bundle / relay assets / favicon）
  C) 共享状态里的结构性异常（只读统计，不改数据）
判据：异常数为 0 → exit 0。
"""
import io
import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8794
BASE = 'http://%s:%d' % (HOST, PORT)
STORE = os.path.join(HERE, 'state', 'store.json')
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')


def call(path):
    req = urllib.request.Request(BASE + path)
    try:
        with urllib.request.urlopen(req, timeout=15) as r:
            return r.status, r.headers.get('Content-Type', ''), r.read(400000)
    except urllib.error.HTTPError as e:
        return e.code, e.headers.get('Content-Type', ''), e.read(2000)
    except Exception as e:
        return 0, '', str(e).encode()


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT, env=env)
    bad = []
    try:
        for _ in range(240):
            if call('/api/health')[0] == 200:
                break
            time.sleep(0.25)

        # A) SPA 深层路由
        for p, kind in (('/', 'relay'), ('/login', 'relay'), ('/devices', 'relay'),
                        ('/panel/', 'panel'), ('/panel/devices', 'panel'),
                        ('/panel/users', 'panel'), ('/panel/ai', 'panel')):
            st, ct, body = call(p)
            text = body.decode('utf-8', 'replace')
            marker = ('panel/assets/' in text or '<div id="root">' in text or '主通道' in text) if kind == 'panel' else ('/relay/assets/' in text or '<div id="app">' in text or 'Slr' in text or '中继通道' in text)
            ok = st == 200 and 'text/html' in ct and marker
            print('%-18s %-6s %-4s %-22s %s' % (p, kind, st, ct.split(';')[0], 'OK' if ok else 'FAIL'))
            if not ok:
                bad.append('SPA %s -> %s %s' % (p, st, ct))
        for p in ('/api/nope-x', '/api/panel/whatever', '/ws/nothing'):
            st, ct, _ = call(p)
            ok = st == 404
            print('%-18s %-6s %-4s %-22s %s' % ('(未注册)', '', st, ct.split(';')[0], 'OK' if ok else 'FAIL'))
            if not ok:
                bad.append('未注册路径 %s -> %s' % (p, st))
        st, ct, body = call('/api/health')
        if not (st == 200 and 'json' in ct):
            bad.append('/api/health -> %s %s' % (st, ct))

        # B) 静态资源
        for p in ('/panel/assets/index-dvi-972c.js', '/panel/assets/index-DTncntn-.css',
                  '/panel/favicon.svg', '/relay/assets/devices.module.js'):
            st, ct, body = call(p)
            ok = st == 200 and len(body) > 100
            print('%-42s %-4s %-10s %s' % (p, st, len(body), 'OK' if ok else 'FAIL'))
            if not ok:
                bad.append('静态 %s -> %s len=%d' % (p, st, len(body)))
    finally:
        srv.terminate()
        try:
            srv.wait(timeout=10)
        except Exception:
            srv.kill()

    # C) 状态结构性异常（只读）
    try:
        if not os.path.exists(STORE):
            print('  （首次运行前尚无 state/store.json，跳过状态一致性检查）')
            S = {}
        else:
            S = json.load(io.open(STORE, encoding='utf-8'))
    except Exception as e:
        print('状态读取失败：%s' % e)
        S = {}
    issues = []
    for name in ('lockscreen', 'push_config', 'translate_config', 'ai_config',
                 'list_load_settings', 'tg'):
        cfg = S.get(name)
        if isinstance(cfg, dict):
            for k, v in cfg.items():
                if k in ('enabled', 'auto', 'bound', 'has_key') and not isinstance(v, bool):
                    issues.append('%s.%s 非布尔：%r' % (name, k, v))
    for g in (S.get('groups') or []):
        if not isinstance(g.get('deviceIds'), list):
            issues.append('分组 %s.deviceIds 非列表：%r' % (g.get('id'), g.get('deviceIds')))
    for x in (S.get('banners') or []):
        if not isinstance(x.get('targets'), list):
            issues.append('公告 targets 非列表：%r' % (x.get('targets'),))
    for d in (S.get('blacklist') or []):
        if not isinstance(d, str) or len(d) < 4:
            issues.append('黑名单脏条目：%r' % (d,))
    print('\n状态结构性异常：%d' % len(issues))
    for i in issues[:20]:
        print('  -', i)
    bad.extend(issues)

    print('\n只读体检：%d 项异常' % len(bad))
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main())
