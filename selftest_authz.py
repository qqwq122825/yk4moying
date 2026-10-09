#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""权限与边界闸门：认证、角色隔离、参数校验、方法匹配、对象不存在时的行为。

这些是 F-68 挖出来的问题（伪造 token 可读管理数据、子账号登不上、参数无校验、
方法未注册时静默回落到 GET）。判据：全部通过 exit 0。
"""
import io
import json
import os
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8812
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
        with urllib.request.urlopen(req, timeout=15) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {'_raw': 'unparsable'}
    except Exception as e:
        return 0, {'error': str(e)[:100]}


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:180]})
        if not ok:
            fails.append(name)
        print('%-50s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        for _ in range(60):
            try:
                urllib.request.urlopen(BASE + '/api/health', timeout=5)
                break
            except Exception:
                time.sleep(0.25)

        # ---------- 认证 ----------
        ck('无 token 访问受保护端点 -> 401', call('/api/devices')[0] == 401)
        ck('错误 token -> 401', call('/api/devices', tok='bogus-token')[0] == 401)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        ck('正确凭据 -> 200 且带角色',
           bool(tok) and call('/api/devices', tok=tok)[1].get('ok'), 'role=%s'
           % call('/api/devices', tok=tok)[1].get('role'))
        ck('错误口令 -> 401',
           call('/api/login', 'POST', {'username': USER, 'password': 'wrong'})[0] == 401)

        # ---------- 子账号：能登录、只读、写被拒 ----------
        uname = 'authz_%s' % RND
        add = call('/api/users', 'POST', {'username': uname, 'password': 'Sub-Pass-11',
                                          'role': 'user', 'apkId': '10020'}, tok)
        ck('管理端可创建子账号', add[1].get('ok'), str(add[1])[:60])
        sub = call('/api/login', 'POST', {'username': uname, 'password': 'Sub-Pass-11'})
        ck('子账号能用该密码登录', sub[0] == 200 and sub[1].get('token'), str(sub[1])[:60])
        stok = sub[1].get('token')
        ck('子账号角色为 user', sub[1].get('role') == 'user', sub[1].get('role'))
        if stok:
            ck('子账号读设备 -> 放行', call('/api/devices', tok=stok)[0] == 200)
            for path, method, body in (('/api/blacklist', 'POST', {'deviceIds': ['x'], 'enable': True}),
                                       ('/api/build', 'POST', {'apkId': '10020'}),
                                       ('/api/users', 'POST', {'username': 'x', 'password': 'yyyyyy'}),
                                       ('/api/note', 'POST', {'deviceId': 'd', 'note': 'n'})):
                st, _b = call(path, method, body, stok)
                ck('子账号写操作被拒 %s %s' % (method, path), st == 403, 'status=%s' % st)
        ck('子账号弱口令被拒',
           call('/api/users', 'POST', {'username': 'weak_%s' % RND, 'password': '123'},
                tok)[1].get('ok') is False)
        ck('重复账号被拒',
           call('/api/users', 'POST', {'username': uname, 'password': 'Sub-Pass-11'},
                tok)[1].get('ok') is False)
        du = call('/api/users', 'DELETE', {'username': uname}, tok)
        ck('删除子账号生效', du[1].get('ok'), str(du[1])[:50])
        ck('删除后子账号无法登录',
           call('/api/login', 'POST', {'username': uname, 'password': 'Sub-Pass-11'})[0] == 401)

        # ---------- 方法匹配：不许静默回落到 GET ----------
        st, b = call('/api/keylogs', 'DELETE', {'id': 'x'}, tok)
        ck('未注册的方法 -> 405（不回落到 GET）', st == 405, 'status=%s %s' % (st, str(b)[:50]))

        # ---------- 未注册路径：必须 404，且不返回业务 JSON（避免"看着像有接口"）----------
        st, b = call('/api/nope-%s' % RND)
        ck('未注册路径 -> 404', st == 404, 'status=%s %s' % (st, str(b)[:40]))
        st, b = call('/api/nope-%s' % RND, 'POST', {'x': 1}, tok)
        ck('未注册路径（带令牌 POST）-> 404', st == 404, 'status=%s %s' % (st, str(b)[:40]))
        st, b = call('/api/devices')          # 已知路径、无令牌
        ck('已知路径无令牌 -> 401（不回数据）', st == 401 and not b.get('devices'),
           'status=%s %s' % (st, str(b)[:40]))

        # ---------- 参数与边界 ----------
        st, b = call('/api/inject-settings/add', 'POST', {}, tok)
        ck('注入配置缺包名 -> 被拒', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/inject-settings/add', 'POST',
                     {'packageName': 'x' * 200, 'appName': 'y'}, tok)
        ck('包名超长 -> 被拒', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/note', 'POST', {'deviceId': 'd' * 5000, 'note': 'n'}, tok)
        ck('deviceId 超长 -> 被拒', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/note', 'POST', {'deviceId': 'dev-ok', 'note': 'n' * 5000}, tok)
        ck('备注超长 -> 被拒', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/device-memos/add', 'POST', {'deviceId': None, 'content': None}, tok)
        ck('备忘录空参数 -> 被拒', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/device-memos/delete', 'POST', {'id': 'no-such-%s' % RND}, tok)
        ck('删不存在的备忘录 -> 明确失败', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/device-groups', 'PUT',
                     {'id': 'no-such-%s' % RND, 'name': 'x'}, tok)
        ck('改不存在的分组 -> 明确失败', b.get('ok') is False, str(b.get('error'))[:50])
        st, b = call('/api/device-groups', 'DELETE', {'id': 'no-such-%s' % RND}, tok)
        ck('删不存在的分组 -> 明确失败', b.get('ok') is False, str(b.get('error'))[:50])

        # ---------- 中继通道：token 校验与分页 clamp ----------
        dlogin = call('/api/EaodLogin.php', 'POST',
                      {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1]
        dtok = dlogin.get('token')
        ck('中继通道登录拿到 token', bool(dtok), str(dtok)[:10])
        for path in ('/api/EaodAllDevices.php', '/api/EaodAccountManage.php',
                     '/api/BuildProgress.php', '/api/DeletePhoneById.php'):
            st, _b = call(path, 'POST', {'token': 'bogus', 'page': 1})
            ck('中继通道伪造 token 被拒 %s' % path.replace('/api/', ''), st == 401, 'status=%s' % st)
        st, b = call('/api/EaodAllDevices.php', 'POST',
                     {'token': dtok, 'page': '0', 'pageSize': '0'})
        ck('分页 page=0/pageSize=0 被 clamp',
           int(b.get('page') or 0) >= 1 and int(b.get('pageSize') or 0) >= 1,
           'page=%s size=%s' % (b.get('page'), b.get('pageSize')))
        st, b = call('/api/EaodAllDevices.php', 'POST',
                     {'token': dtok, 'page': '-5', 'pageSize': '99999'})
        ck('负数页与超大页长被 clamp',
           int(b.get('page') or 0) >= 1 and 1 <= int(b.get('pageSize') or 0) <= 1000,
           'page=%s size=%s' % (b.get('page'), b.get('pageSize')))

        # ---------- 中继通道子账号：面板建号后必须能登录（否则账号管理形同虚设，见 F-69）----------
        dsub = 'authz_d_%s' % RND
        add = call('/api/EaodAccountManage.php', 'POST',
                   {'token': dtok, 'action': 'add', 'usrname': dsub,
                    'email': dsub + '@local', 'password': 'DSub-Pass-77', 'authorty': 'user'})
        ck('中继通道面板可建子账号', add[1].get('code') == 200, str(add[1].get('msg'))[:40])
        lg = call('/api/EaodLogin.php', 'POST',
                  {'usrname': dsub, 'password': 'DSub-Pass-77', 'captcha': '0000'})
        ck('中继通道子账号能登录', bool((lg[1] or {}).get('token')),
           'usrname=%s authorty=%s' % ((lg[1] or {}).get('usrname'), (lg[1] or {}).get('authorty')))
        ck('中继通道子账号角色为 user', (lg[1] or {}).get('authorty') == 'user',
           str((lg[1] or {}).get('authorty')))
        bad = call('/api/EaodLogin.php', 'POST',
                   {'usrname': dsub, 'password': 'wrong-pass', 'captcha': '0000'})
        ck('中继通道子账号错密码 -> 401', bad[0] == 401, 'status=%s' % bad[0])
        # 密码哈希必须落库（否则服务端重启后子账号就登不进去了）
        import sqlite3
        dbf = os.path.join(HERE, 'state', 'refc2.db')
        stored = None
        try:
            con = sqlite3.connect(dbf)
            row = con.execute("SELECT v FROM kv WHERE k=?", ('pw_%s' % dsub,)).fetchone()
            stored = row[0] if row else None
            con.close()
        except Exception:
            pass
        ck('子账号密码哈希已落库（重启仍可登录）',
           bool(stored) and '$' in str(stored), 'len=%s' % (len(str(stored)) if stored else 0))

        print('\n权限与边界：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '153_authz_boundary_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
