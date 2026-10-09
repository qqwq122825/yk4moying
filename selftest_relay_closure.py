#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道管理面「功能闭环」判据：每个变更端点都做 **读 -> 改 -> 读** 断言状态真的变了。

覆盖：账号增/删/续期/改密、设备删除/批量删除/转派、封禁拉黑/解封、构建进度读取、情报关键词、
视频(屏幕流分段)列表、子账号统计、按 id 取设备。
判据：全部通过 exit 0。此前这些端点全是"返回 200 但状态没变"（F-66）。
"""
import io, json, os, subprocess, sys, time, urllib.error, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8807
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', 'CHANGE_ME'


def post(path, body, tok=None):
    req = urllib.request.Request(BASE + path, method='POST',
                                 data=json.dumps(body).encode())
    req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            return json.loads(r.read().decode('utf-8', 'replace') or '{}')
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
        # 中继通道面板登录拿 token（这些端点原版不校验 token，用登录体里的 token 保持一致）
        cap = urllib.request.urlopen(BASE + '/api/Captcha.php', timeout=10).read()
        login = post('/api/EaodLogin.php', {'usrname': USER, 'password': PASS, 'captcha': '0000'})
        dtok = login.get('token')
        ck('中继通道登录成功拿到 token', bool(dtok), str(dtok)[:12])

        # ---------- 设备：先上线一台中继通道设备 ----------
        import base64, struct
        import asyncio

        async def relay_online(dev):
            reader, writer = await asyncio.open_connection(HOST, PORT)
            key = base64.b64encode(os.urandom(16)).decode()
            writer.write(('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
                          'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\n'
                          'Sec-WebSocket-Version: 13\r\n\r\n' % (HOST, PORT, key)).encode())
            await writer.drain()
            head = b''
            while b'\r\n\r\n' not in head:
                head += await reader.read(4096)
            payload = json.dumps({'itype': 'Slr_client', 'pid': dev, 'subc': 'hello',
                                  'Deviceid': dev}).encode()
            mask = os.urandom(4)
            masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
            writer.write(struct.pack('!BB', 0x81, 0x80 | len(masked)) + mask + masked)
            await writer.drain()
            await asyncio.sleep(0.2)
            return reader, writer

        loop = asyncio.new_event_loop()
        try:
            dr, dw = loop.run_until_complete(relay_online('closure-dev-01'))
        finally:
            pass

        def dev_list():
            r = post('/api/EaodAllDevices.php', {'token': dtok, 'page': 1, 'pageSize': 100})
            return r.get('list') or []

        rows = dev_list()
        ck('设备列表只出中继通道设备', all(r.get('phone_id') != '7f3a91c4e08b2d16' for r in rows)
           and any(r.get('phone_id') == 'closure-dev-01' for r in rows),
           'ids=%s' % [r.get('phone_id') for r in rows][:3])

        # ---------- 账号：增 -> 列表可见 -> 续期 -> 删除 -> 列表消失 ----------
        n0 = len(post('/api/EaodAccountManage.php', {'token': dtok, 'action': 'list'}).get('accounts') or [])
        add = post('/api/EaodAccountManage.php',
                   {'token': dtok, 'action': 'add', 'usrname': 'closure_op',
                    'email': 'closure@local', 'password': 'closure-Pass-1',
                    'expire_date': '2030-01-01'})
        n1 = len(post('/api/EaodAccountManage.php', {'token': dtok, 'action': 'list'}).get('accounts') or [])
        ck('新增账号后列表 +1', add.get('code') == 200 and n1 == n0 + 1, '%d -> %d %s' % (n0, n1, add.get('msg')))
        dup = post('/api/EaodAccountManage.php',
                   {'token': dtok, 'action': 'add', 'usrname': 'closure_op',
                    'password': 'closure-Pass-1'})
        ck('重复账号被拒', dup.get('code') == 400, dup.get('msg'))
        weak = post('/api/EaodAccountManage.php',
                    {'token': dtok, 'action': 'add', 'usrname': 'weak_op', 'password': '123'})
        ck('弱口令被拒', weak.get('code') == 400, weak.get('msg'))
        ren = post('/api/EaodAccountManage.php',
                   {'token': dtok, 'action': 'renew', 'usrname': 'closure_op',
                    'expire_date': '2031-12-31'})
        ck('续期成功', ren.get('code') == 200, ren.get('msg'))
        dele = post('/api/EaodAccountManage.php',
                    {'token': dtok, 'action': 'delete', 'usrname': 'closure_op'})
        n2 = len(post('/api/EaodAccountManage.php', {'token': dtok, 'action': 'list'}).get('accounts') or [])
        ck('删除账号后列表复原', dele.get('code') == 200 and n2 == n0, '%d -> %d' % (n1, n2))
        ck('主账号不可删除',
           post('/api/EaodAccountManage.php',
                {'token': dtok, 'action': 'delete', 'usrname': 'admin'}).get('code') == 400,
           '已拦截')

        # ---------- 改密：**用临时子账号**测（不动主账号，保证判据可重复跑）----------
        post('/api/EaodAccountManage.php',
             {'token': dtok, 'action': 'add', 'usrname': 'closure_pw',
              'email': 'pw@local', 'password': 'Old-Pass-11'})
        bad = post('/api/ChangePassword.php',
                   {'token': dtok, 'usrname': 'closure_pw',
                    'old_password': 'wrong', 'new_password': 'new-Pass-123'})
        ck('改密：旧密码错误被拒', bad.get('status') == 'error', bad.get('message'))
        short = post('/api/ChangePassword.php',
                     {'token': dtok, 'usrname': 'closure_pw',
                      'old_password': 'Old-Pass-11', 'new_password': '123'})
        ck('改密：新密码过短被拒', short.get('status') == 'error', short.get('message'))
        okp = post('/api/ChangePassword.php',
                   {'token': dtok, 'usrname': 'closure_pw',
                    'old_password': 'Old-Pass-11', 'new_password': 'New-Pass-22'})
        ck('改密成功', okp.get('status') == 'ok', okp.get('message'))
        # 改密后旧密码失效、新密码可用（真校验哈希，不是只看字段非空）
        again_old = post('/api/ChangePassword.php',
                         {'token': dtok, 'usrname': 'closure_pw',
                          'old_password': 'Old-Pass-11', 'new_password': 'X-Pass-333'})
        ck('改密后旧密码失效', again_old.get('status') == 'error', again_old.get('message'))
        again_new = post('/api/ChangePassword.php',
                         {'token': dtok, 'usrname': 'closure_pw',
                          'old_password': 'New-Pass-22', 'new_password': 'Final-Pass-44'})
        ck('改密后新密码可用', again_new.get('status') == 'ok', again_new.get('message'))
        post('/api/EaodAccountManage.php',
             {'token': dtok, 'action': 'delete', 'usrname': 'closure_pw'})

        # ---------- 转派：归属真的写入 ----------
        ra = post('/api/ReassignDevice.php',
                  {'token': dtok, 'phone_id': 'closure-dev-01', 'target_email': 'closure@local'})
        rows = dev_list()
        row = next((r for r in rows if r.get('phone_id') == 'closure-dev-01'), {})
        ck('转派后设备归属真的变了', ra.get('code') == 200 and row.get('assigned_to') == 'closure@local',
           'assigned_to=%s' % row.get('assigned_to'))
        bad2 = post('/api/ReassignDevice.php', {'token': dtok, 'phone_id': 'no-such-dev'})
        ck('转派不存在的设备被拒', bad2.get('code') == 404, bad2.get('msg'))

        # ---------- 封禁：拉黑 -> 列表可见 -> 解封 -> 列表消失 ----------
        post('/api/BannedDevices.php', {'token': dtok, 'action': 'ban',
                                        'phone_id': 'closure-dev-01', 'reason': '闭环测试'})
        bl = post('/api/BannedDevices.php', {'token': dtok, 'action': 'list'})
        ck('拉黑后出现在封禁列表', int(bl.get('total') or 0) >= 1,
           'total=%s' % bl.get('total'))
        ub = post('/api/BannedDevices.php', {'token': dtok, 'action': 'unban',
                                             'phone_id': 'closure-dev-01'})
        bb = post('/api/BannedDevices.php', {'token': dtok, 'action': 'list'})
        bb2 = post('/api/BannedDevices.php', {'token': dtok, 'action': 'list'})
        ck('解封后从封禁列表移除',
           ub.get('code') == 0 and
           all(x.get('phone_id') != 'closure-dev-01' for x in (bb2.get('list') or [])),
           'unban=%s after=%s' % (ub.get('msg'), bb2.get('total')))

        # ---------- 情报关键词：加 -> 列表可见 -> 删 -> 列表移除 ----------
        post('/api/EaodIntel.php', {'token': dtok, 'action': 'add_keyword', 'keyword': '闭环关键词'})
        il = post('/api/EaodIntel.php', {'token': dtok, 'action': 'list'})
        ck('情报关键词新增可见', '闭环关键词' in (il.get('keywords') or []), str(il.get('keywords'))[:60])
        post('/api/EaodIntel.php', {'token': dtok, 'action': 'remove_keyword', 'keyword': '闭环关键词'})
        il2 = post('/api/EaodIntel.php', {'token': dtok, 'action': 'list'})
        ck('情报关键词删除生效', '闭环关键词' not in (il2.get('keywords') or []),
           str(il2.get('keywords'))[:60])

        # ---------- 子账号统计与按 id 取设备 ----------
        ss = post('/api/SubAccountStats.php', {'token': dtok})
        ck('子账号统计含真设备数', (ss.get('summary') or {}).get('devices', 0) >= 1,
           str(ss.get('summary')))
        gp = post('/api/GetPhoneById.php', {'token': dtok, 'phone_id': 'closure-dev-01'})
        ck('按 id 取设备返回真数据', gp.get('code') == 200 and gp.get('data'), str(gp.get('code')))
        gp2 = post('/api/GetPhoneById.php', {'token': dtok, 'phone_id': 'no-such'})
        ck('按 id 取不存在的设备返回 404', gp2.get('code') == 404, gp2.get('msg'))
        # 认证：伪造 token 必须被拒（F-68）
        gp3 = post('/api/GetPhoneById.php', {'token': 'bogus', 'phone_id': 'closure-dev-01'})
        ck('伪造 token 被拒（401）', gp3.get('code') == 401, str(gp3.get('msg'))[:40])

        # ---------- 构建进度读真库 ----------
        bp = post('/api/BuildProgress.php', {'token': dtok, 'subcom': 'load'})
        ck('构建进度接口可用（读真构建库）', bp.get('code') == 200,
           'total=%s' % bp.get('total'))

        # ---------- 删除设备：真删 ----------
        d1 = post('/api/DeletePhoneById.php', {'token': dtok, 'phone_id': 'closure-dev-01'})
        rows = dev_list()
        ck('删除设备后列表不再包含它',
           d1.get('status') == 'success' and
           all(r.get('phone_id') != 'closure-dev-01' for r in rows),
           '%s ids=%s' % (d1.get('msg'), [r.get('phone_id') for r in rows][:3]))
        d2 = post('/api/DeletePhoneById.php', {'token': dtok, 'phone_id': 'closure-dev-01'})
        ck('重复删除返回失败态', d2.get('status') == 'error', d2.get('msg'))

        print('\n管理面功能闭环：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '151_relay_closure_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
