#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""健壮性扫描：对两端全部写端点灌畸形输入，记录状态码。
判据：不得出现 500（应为 4xx 或明确的业务错误），且服务端在扫描后仍然健康。
"""
import io
import json
import os
import random
import string
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8813
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')


def call(path, method='GET', raw=None, tok=None, ctype='application/json'):
    req = urllib.request.Request(BASE + path, method=method, data=raw)
    if raw is not None:
        req.add_header('Content-Type', ctype)
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=15) as r:
            return r.status, r.read(400).decode('utf-8', 'replace')
    except urllib.error.HTTPError as e:
        return e.code, e.read(400).decode('utf-8', 'replace')
    except Exception as e:
        return 0, str(e)[:120]


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=io.open(os.path.join(HERE, 'evidence',
                                                       '154_robust_server.log'), 'w',
                                          encoding='utf-8'),
                           stderr=subprocess.STDOUT, env=env)
    problems = []
    try:
        for _ in range(60):
            try:
                urllib.request.urlopen(BASE + '/api/health', timeout=5)
                break
            except Exception:
                time.sleep(0.25)
        tok = json.loads(call('/api/login', 'POST',
                              json.dumps({'username': USER, 'password': PASS}).encode())[1])['token']
        dtok = json.loads(call('/api/EaodLogin.php', 'POST', json.dumps(
            {'usrname': USER, 'password': PASS, 'captcha': '0000'}).encode())[1]).get('token')

        # 主通道写端点（从 HANDLERS 取，含方法）
        sys.path.insert(0, os.path.join(HERE, 'server'))
        import api_impl
        primary = []
        for path, methods in api_impl.HANDLERS.items():
            for m in methods:
                if m in ('POST', 'PUT', 'DELETE', 'PATCH'):
                    primary.append((path, m))
        relay = [(p, 'POST') for p in (
            '/api/EaodAllDevices.php', '/api/EaodAccountManage.php', '/api/OperationLog.php',
            '/api/SubAccountStats.php', '/api/DeletePhoneById.php', '/api/BatchDeleteDevices.php',
            '/api/BatchReassignDevice.php', '/api/BannedDevices.php', '/api/BuildProgress.php',
            '/api/ChangePassword.php', '/api/ReassignDevice.php', '/api/GetPhoneById.php',
            '/api/EaodIntel.php', '/api/EaodFaceVerify.php', '/api/EaodVideos.php')]

        BAD_BODIES = [
            ('空对象', b'{}'),
            ('null 体', b'null'),
            ('数组体', b'[]'),
            ('字符串体', b'"str"'),
            ('数字体', b'12345'),
            ('非法 JSON', b'{not json'),
            ('超长字段', json.dumps({k: 'x' * 20000 for k in
                                     ('deviceId', 'id', 'name', 'username', 'packageName',
                                      'content', 'note', 'keyword', 'phone_id')}).encode()),
            ('类型错位', json.dumps({'deviceId': {'a': 1}, 'deviceIds': 'notalist', 'id': [1, 2],
                                     'enabled': 'yes', 'pagesize': 'many',
                                     'username': 42, 'password': [1]}).encode()),
            ('深度嵌套', json.dumps({'a': {'b': {'c': {'d': [1, [2, [3]]]}}}},
                                    ensure_ascii=False).encode()),
            ('空体', b''),
        ]

        print('扫描主通道写端点 %d 个 × %d 种畸形输入' % (len(primary), len(BAD_BODIES)))
        for path, method in primary:
            for name, raw in BAD_BODIES:
                st, body = call(path, method, raw, tok)
                if st >= 500:
                    problems.append({'side': 'primary', 'path': path, 'method': method,
                                     'input': name, 'status': st, 'resp': body[:120]})
        print('扫描中继通道端点 %d 个 × %d 种畸形输入' % (len(relay), len(BAD_BODIES)))
        for path, method in relay:
            for name, raw in BAD_BODIES:
                # 中继通道端点要带 token：畸形体里补 token（保持"已认证但参数畸形"）
                try:
                    payload = json.loads(raw.decode() or '{}')
                    if not isinstance(payload, dict):
                        payload = {}
                except Exception:
                    payload = {}
                payload['token'] = dtok
                st, body = call(path, method, json.dumps(payload, ensure_ascii=False).encode(), tok)
                if st >= 500:
                    problems.append({'side': 'relay', 'path': path, 'method': method,
                                     'input': name, 'status': st, 'resp': body[:120]})

        # 扫描后服务端必须仍健康（没被畸形输入打挂）
        st, health = call('/api/health')
        alive = st == 200 and '"ok": true' in health
        print('\n扫描完成：%d 处 5xx' % len(problems))
        for p in problems[:25]:
            print('  %-9s %-34s %-6s %-10s -> %s %s' % (p['side'], p['path'], p['method'],
                                                        p['input'], p['status'], p['resp'][:60]))
        print('扫描后服务端健康：%s' % alive)
        out = os.path.join(HERE, 'evidence', '154_robustness_scan.json')
        json.dump({'problems': problems, 'alive_after': alive,
                   'endpoints_scanned': len(primary) + len(relay)},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if (not problems and alive) else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
