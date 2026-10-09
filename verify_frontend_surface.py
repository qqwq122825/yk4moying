#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""控端前端实际调用面逐条实测（比"契约路由"更严的真判据）。

覆盖**两套**控件端：
  · 主通道  web/panel/assets/index-dvi-972c.js        -> /api/*
  · 中继通道 web/relay/assets/*.js + index.html      -> /api/*.php、/private/*.php、/user/storage/*
做法：抽全部接口字面量 -> 按前端实际用的方法发请求 -> 断言无 404/不可达。
产出 docs_frontend_surface.json ；退出码 0 = 全部可达。
"""
import io, json, os, re, subprocess, sys, time, urllib.error, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
PANEL_BUNDLE = os.path.join(HERE, 'web', 'panel', 'assets', 'index-dvi-972c.js')
RELAY_DIR = os.path.join(HERE, 'web', 'relay')
EVID = os.path.join(HERE, 'evidence')
HOST, PORT = '127.0.0.1', 8802
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', 'CHANGE_ME'
DEVICE_ID = 'a1b2c3d4e5f60718'      # 走查时上线的设备 id（占位符替换用）

# 目标面板本身就没有的路由（实测 404，前端保留调用属原样行为）
ABSENT_ON_TARGET = {'/api/cmd', '/api/build2'}
# GET 404 属正确行为（只接受 POST 的端点）
POST_ONLY = {'/api/login'}
# 不是 HTTP 接口、不能用 HTTP 探的路径（已由 WS 类闸门单独覆盖）：
#   /api/ws/     中继通道面板的 WebSocket 入口（devices/overview/session 等模块均用它推状态）
#   /api/ws-ticket 主通道取 WS 票据（POST，本表里由 967 行的 /api/ws-ticket 单独测）
# 注：这两个必须**保留结尾斜杠**再判断 —— 早期把它们 rstrip('/') 成 /api/ws 后当 HTTP POST 探，
# 探出 404 是"自己造出来的错误结论"（见 F-74）
WS_PATHS = {'/api/ws', '/api/ws/'}


def call(path, method='GET', body=None, tok=None):
    req = urllib.request.Request(BASE + path, method=method)
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    data = None
    if body is not None:
        data = json.dumps(body).encode()
        req.add_header('Content-Type', 'application/json')
    try:
        with urllib.request.urlopen(req, data, timeout=10) as r:
            # 读满：某些接口（如构建列表）响应远大于 300B，截断会让后续 json.loads 崩（踩过两次）
            return r.status, r.read(400000).decode('utf-8', 'replace')
    except urllib.error.HTTPError as e:
        return e.code, e.read(4000).decode('utf-8', 'replace')
    except Exception as e:
        return 0, str(e)[:120]


def collect_calls():
    """两套前端的接口字面量：{调用: 来源}"""
    srcs = {}
    try:
        srcs['panel'] = io.open(PANEL_BUNDLE, encoding='utf-8', errors='replace').read()
    except Exception:
        pass
    try:
        srcs['relay:index'] = io.open(os.path.join(RELAY_DIR, 'index.html'),
                                       encoding='utf-8', errors='replace').read()
    except Exception:
        pass
    adir = os.path.join(RELAY_DIR, 'assets')
    if os.path.isdir(adir):
        for fn in sorted(os.listdir(adir)):
            if fn.endswith('.js'):
                try:
                    srcs['relay:' + fn] = io.open(os.path.join(adir, fn),
                                                   encoding='utf-8', errors='replace').read()
                except Exception:
                    pass
    PAT = re.compile(r'/(?:api|private|user)/(?:[A-Za-z0-9_\-/\.\$\{\}\?=&]*[A-Za-z0-9_\-/\}\?])?')
    calls = {}
    for who, s in srcs.items():
        for m in PAT.finditer(s):
            raw = m.group(0).rstrip('"\'`')
            if len(raw) < 5:
                continue
            # 模板串里可能跟了 JS 表达式（如 ${i.replace(...)}）—— 截到 ${ 之前，并记下"是模板"
            templated = '${' in raw
            c = raw.split('${')[0]
            # 结尾斜杠要区分处理：/api/ws/ 是中继通道面板的 WS 入口，rstrip 成 /api/ws 后
            # 当 HTTP 探会得出"404"这种自己造出来的结论（见 F-74）；其余路径 rstrip 只为去重
            if c.rstrip('/') in WS_PATHS:
                c = c.rstrip('/')
            else:
                c = c.rstrip('/') or c
            if len(c) < 5:
                continue
            ent = calls.setdefault(c, {'who': set(), 'templated': False})
            ent['who'].add(who)
            ent['templated'] = ent['templated'] or templated
    return calls, srcs


def main():
    calls, srcs = collect_calls()
    print('前端接口字面量：%d（主通道 %d / 中继通道 %d）' % (
        len(calls),
        sum(1 for v in calls.values() if 'panel' in v['who']),
        sum(1 for v in calls.values() if any(k.startswith('relay') for k in v['who']))))

    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
    try:
        for _ in range(60):
            try:
                if call('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        st, b = call('/api/login', 'POST', {'username': USER, 'password': PASS})
        tok = json.loads(b)['token']
        # 生成一件构建产物，供 /user/storage 类的路径实测
        call('/private/Eaod36921.php', 'POST',
             {'email': 'admin@local', 'token': 'probe', 'appid': 'com.probe.surface',
              'appversion': '1.0.0', 'icoid': 'uploads/ico/x.png'})
        for _ in range(8):
            r = json.loads(call('/private/Eaod91328.php', 'POST',
                                {'email': 'admin@local', 'token': 'probe', 'subcom': 'load'})[1] or '[]')
            if any(x.get('build_state') == 'finished' for x in (r if isinstance(r, list) else [])):
                break
            time.sleep(1)

        rows, bad, skipped = [], [], []
        for c in sorted(calls):
            who = sorted(calls[c]['who'])
            base0 = c.split('?')[0]
            # WebSocket 入口不是 HTTP 接口：不能用 HTTP POST 探（探出来的 404 是无意义的），
            # 由 WS 类闸门覆盖（selftest_lifecycle / *_closure 会真的建连推帧），这里只登记不判定
            if base0 in WS_PATHS:
                skipped.append({'call': c, 'who': who, 'reason': 'WS 入口，由 WS 闸门覆盖'})
                continue
            if c.rstrip('/') in ('/user/storage', '/user'):
                # `/user/<rel>` 与 `/user/storage/<rel>` 都指向同一套产物文件（builder.module.js:586/596）
                path = c.rstrip('/') + '/com.probe.surface.apk'
            elif c.rstrip('/') == '/api/wallpaper':
                path = '/api/wallpaper/%s' % DEVICE_ID
            else:
                path = re.sub(r'\$\{[^}]*\}', 'x', c)
            base = path.split('?')[0]
            method = 'GET'
            # 文件类路径（/user/… 、/user/storage/…）永远是 GET：附近的 `.post(` 属于别处的调用，
            # 用"邻域里出现过 POST"来推断方法在这里会误判（实测把 /user 判成 POST → 假 404，见 F-74）
            file_like = base.startswith('/user/')
            for src in (() if file_like else srcs.values()):
                for m in re.finditer(re.escape(base0), src):
                    seg = src[max(0, m.start() - 300):m.start() + 500]
                    if (re.search(r'method\s*:\s*[\'"]POST[\'"]', seg, re.I)
                            or re.search(r'\.post\(', seg, re.I)):
                        method = 'POST'
                        break
                if method == 'POST':
                    break
            st, body = call(path if method == 'GET' else base, method,
                            None if method == 'GET' else {}, tok)
            ok = st not in (404, 0)
            row = {'call': c, 'who': who, 'method': method, 'status': st,
                   'body': body[:120], 'ok': ok}
            rows.append(row)
            if not ok and base not in ABSENT_ON_TARGET and base0 not in POST_ONLY:
                bad.append(row)

        from collections import Counter
        print('实测：%d 条（按前端实际方法），404/不可达 %d 条；跳过 %d 条'
              % (len(rows), len(bad), len(skipped)))
        print('来源分布：', dict(Counter(('panel' if 'panel' in r['who'] else 'relay') for r in rows)))
        for s in skipped:
            print('  [跳过] %-30s %s' % (s['call'], s['reason']))
        for r in bad[:40]:
            print('  %-42s %-5s %s  %s' % (r['call'], r['method'], r['status'], r['body'][:60]))
        out = os.path.join(EVID, '140_frontend_surface.json')
        json.dump({'total': len(rows), 'unreachable': len(bad), 'skipped': skipped, 'rows': rows},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', out)
        return 0 if not bad else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
