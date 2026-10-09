#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道被控端 69 条命令端到端机械判据。

做法：起服务端 + relay_agent -> 逐条下发 69 条命令 -> 读回帧留档 -> 断言有回帧且帧名符合预期。
判据：全部通过 exit 0。
"""
import io, json, os, subprocess, sys, time, urllib.error, urllib.request
import asyncio, base64, struct

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, 'agent'))
import relay_agent  # noqa: E402  复用命令表（单一真源）

HOST, PORT = '127.0.0.1', 8803
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', 'CHANGE_ME'
DEV = 'relayref%08d' % 1

# 期望回帧（按源码语义）：屏幕类 -> recseg；adb -> adb；数据类 -> 对应帧；其余 -> recseg diag 或 ack
EXPECT = {}
for c in relay_agent.SCREEN_CMDS:
    EXPECT[c] = {'recseg'}
EXPECT.update({'adb': {'adb'}, 'sms': {'sms'}, 'SMSSEND': {'sms'}, 'perms': {'perms'}})
for c, (frame, _f) in relay_agent.DATA_CMDS.items():
    EXPECT[c] = {frame}
for c in relay_agent.ALL_CMDS:
    EXPECT.setdefault(c, {'recseg', 'ack'})


async def _panel_send(token, msg):
    """以面板身份连 /api/ws/ 并发一条消息，读回第一条响应（用于验证面板下发链路）"""
    reader, writer = await asyncio.open_connection(HOST, PORT)
    key = base64.b64encode(os.urandom(16)).decode()
    writer.write(('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
                  'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n'
                  % (HOST, PORT, key)).encode())
    await writer.drain()
    head = b''
    while b'\r\n\r\n' not in head:
        head += await reader.read(4096)
    payload = json.dumps(dict(msg, token=token), ensure_ascii=False).encode()
    mask = os.urandom(4)
    masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
    writer.write(struct.pack('!BB', 0x81, 0x80 | len(masked)) + mask + masked)
    await writer.drain()
    h = await asyncio.wait_for(reader.readexactly(2), timeout=10)
    ln = h[1] & 0x7f
    if ln == 126:
        ln = struct.unpack('>H', await reader.readexactly(2))[0]
    body = await asyncio.wait_for(reader.readexactly(ln), timeout=10)
    writer.close()
    try:
        return json.loads(body.decode())
    except Exception:
        return {'raw': body[:80].decode('utf-8', 'replace')}


def call(path, method='GET', body=None, tok=None):
    req = urllib.request.Request(BASE + path, method=method)
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    data = None
    if body is not None:
        data = json.dumps(body).encode()
        req.add_header('Content-Type', 'application/json')
    try:
        with urllib.request.urlopen(req, data, timeout=15) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        return e.code, {'raw': e.read(300).decode('utf-8', 'replace')}


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
    ag = None
    try:
        for _ in range(60):
            try:
                if call('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1]['token']

        ag = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'relay_agent.py'),
                               '--url', BASE, '--device', DEV],
                              stdout=io.open(os.path.join(HERE, 'evidence',
                                                          '145_relay_agent_stdout.log'),
                                             'w', encoding='utf-8'),
                              stderr=subprocess.STDOUT, env=env)
        # 等设备上线（通过 hello/perms/diag 帧出现）
        online = False
        for _ in range(60):
            r = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1]
            if r.get('frames'):
                online = True
                break
            time.sleep(0.25)
        if not online:
            print('[FAIL] 被控端未上线'); return 1
        print('被控端已上线：%s' % DEV)

        results, bad = [], []
        for cmd in relay_agent.ALL_CMDS:
            before = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('total', 0)
            st, b = call('/api/relay_command', 'POST', {'deviceId': DEV, 'subc': cmd,
                                                         'pkg': 'com.icbc', 'text': 'id'}, tok=tok)
            if not b.get('ok'):
                results.append({'cmd': cmd, 'ok': False, 'why': '下发失败 %s' % b})
                bad.append(results[-1])
                continue
            got = None
            for _ in range(30):
                r = call('/api/device_frames?deviceId=%s&since=%d' % (DEV, before), tok=tok)[1]
                for f in r.get('frames', []):
                    if f['action'] != 'hello':
                        got = f
                if got:
                    break
                time.sleep(0.12)
            if not got:
                results.append({'cmd': cmd, 'ok': False, 'why': '无回帧'})
                bad.append(results[-1])
                continue
            want = EXPECT.get(cmd, set())
            ok = (not want) or (got['action'] in want)
            row = {'cmd': cmd, 'ok': ok, 'frame': got['action'], 'keys': got.get('keys'),
                   'why': '' if ok else '帧 %s 不在期望 %s' % (got['action'], sorted(want))}
            results.append(row)
            if not ok:
                bad.append(row)

        from collections import Counter
        print('中继通道被控端命令端到端：%d/%d 通过' % (len(results) - len(bad), len(results)))
        print('回帧分布：', dict(Counter(r.get('frame', '-') for r in results)))
        for r in bad[:20]:
            print('  %-14s %s' % (r['cmd'], r.get('why')))

        # ---------- 追加：**面板通道下发**（与中继通道面板同一条路：/api/ws/ + slr_panelsend）----------
        panel_checks = []
        try:
            login = call('/api/EaodLogin.php', 'POST',
                         {'usrname': USER, 'password': PASS, 'captcha': '0000'}, tok=None)[1]
            ptok = login.get('token')
            before = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('total', 0)
            _loop = asyncio.new_event_loop()
            try:
                got = _loop.run_until_complete(
                    _panel_send(ptok, {'itype': 'slr_panelsend', 'subc': 'screen', 'pid': DEV}))
            finally:
                _loop.close()
            ck_ok = bool(got and got.get('type') == 'ok')
            panel_checks.append(('面板 slr_panelsend 被接受', ck_ok, str(got)[:90]))
            frame = None
            for _ in range(30):
                rr = call('/api/device_frames?deviceId=%s&since=%d' % (DEV, before), tok=tok)[1]
                for f in rr.get('frames', []):
                    if f['action'] in ('Screen', 'recseg'):
                        frame = f
                if frame:
                    break
                time.sleep(0.12)
            panel_checks.append(('中继通道设备收到面板下发的命令', frame is not None,
                                 str((frame or {}).get('action'))))
        except Exception as e:
            panel_checks.append(('面板通道下发', False, '异常 %s' % e))

        for name, okk, det in panel_checks:
            print('  %-34s %s  %s' % (name, 'OK' if okk else 'FAIL', det))
        pbad = [c for c in panel_checks if not c[1]]

        # ---------- 追加：recseg 帧是否符合 FrameWorker 规格（session=毫秒戳, seg=_f<seq>, WebP q80, size 相符）----------
        import base64 as _b64, re as _re
        spec_checks = []
        frames = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('frames', [])
        segs = [f for f in frames if f['action'] == 'recseg']
        shot = [f for f in segs if _re.match(r'^\d+_f\d+$', str((f.get('data') or {}).get('seg', '')))]
        spec_checks.append(('seg 命名 <毫秒时间戳>_f<序号>', bool(shot),
                            (shot[-1]['data'].get('seg') if shot else 'n/a')))
        if shot:
            d0 = shot[-1]['data']
            raw_txt = str(d0.get('b64') or '')
            truncated = '[trunc' in raw_txt
            # 留档会截断 b64（大帧只保留前缀与 size），截断时用 size 判断"真有大画面"
            if truncated:
                spec_checks.append(('b64 为大帧（size>1000）', int(d0.get('size') or 0) > 1000,
                                    'size=%s' % d0.get('size')))
                head = _re.sub(r'[^A-Za-z0-9+/]', '', raw_txt)[:160]
                head += '=' * ((4 - len(head) % 4) % 4)
                magic = _b64.b64decode(head)[:12]
            else:
                raw = _b64.b64decode(raw_txt)
                spec_checks.append(('b64 长度与 size 字段一致', int(d0.get('size') or -1) == len(raw),
                                    'size=%s 实际=%d' % (d0.get('size'), len(raw))))
                magic = raw[:12]
            spec_checks.append(('画面为 WebP（RIFF/WEBP 魔数）',
                                magic[:4] == b'RIFF' and magic[8:12] == b'WEBP', repr(magic)))
            spec_checks.append(('trigger=auto', d0.get('trigger') == 'auto', str(d0.get('trigger'))))
        diag = [f for f in segs if str((f.get('data') or {}).get('seg', '')).startswith('diag_')]
        spec_checks.append(('diag 段存在（start/shot/stop）',
                            any('start' in str((f.get('data') or {}).get('seg')) for f in diag),
                            str([ (f.get('data') or {}).get('seg') for f in diag ][:4])))
        ends = [f for f in segs if str((f.get('data') or {}).get('seg', '')).endswith('_end')]
        end_size = (ends[-1]['data'] or {}).get('size', None) if ends else None
        spec_checks.append(('结束段 <session>_end 且 size=0',
                            bool(ends) and end_size is not None and int(end_size) == 0,
                            '%s size=%s' % ((ends[-1]['data'] or {}).get('seg') if ends else 'n/a',
                                            end_size)))

        for name, okk, det in spec_checks:
            print('  %-34s %s  %s' % (name, 'OK' if okk else 'FAIL', det))
        pbad += [c for c in spec_checks if not c[1]]

        # ---------- 追加：假锁屏（.bt 模板 -> 占位符渲染 -> 被控端弹出并上报）----------
        lock_checks = []
        st, b, _ = (0, None, '')
        lst = None
        try:
            with urllib.request.urlopen(BASE + '/api/lockscreen/template?list=1', timeout=10) as r:
                lst = json.loads(r.read().decode())
        except Exception as e:
            lock_checks.append(('模板清单可取', False, str(e)[:60]))
        if lst:
            lock_checks.append(('模板清单含 11 个假锁屏模板', lst.get('count') == 11,
                                'count=%s' % lst.get('count')))
            try:
                req = urllib.request.Request(
                    BASE + '/api/lockscreen/template?id=2&title=' + urllib.parse.quote('身份验证') +
                    '&sub=' + urllib.parse.quote('请重新输入密码'))
                with urllib.request.urlopen(req, timeout=10) as r:
                    html = r.read().decode('utf-8', 'replace')
                    kind = r.headers.get('X-Lock-Kind', '')
                import re as _re2
                left = _re2.findall(r'\[(TITLE|DIS|PASSWOR|LNG)\]', html)
                lock_checks.append(('占位符全部被替换且类型正确',
                                    not left and kind == 'pin' and '身份验证' in html,
                                    'left=%s kind=%s' % (left, kind)))
            except Exception as e:
                lock_checks.append(('模板渲染', False, str(e)[:60]))
        # 面板/服务端下发 phonepass -> 被控端拉模板、弹层、上报
        before = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('total', 0)
        call('/api/relay_command', 'POST',
             {'deviceId': DEV, 'subc': 'phonepass', 'text': '账户安全验证',
              'pkg': '请重新输入您的登录密码'}, tok=tok)
        lock_frame = None
        for _ in range(30):
            rr = call('/api/device_frames?deviceId=%s&since=%d' % (DEV, before), tok=tok)[1]
            for f in rr.get('frames', []):
                if 'lock' in str((f.get('data') or {}).get('seg', '')):
                    lock_frame = f
            if lock_frame:
                break
            time.sleep(0.15)
        msg = str(((lock_frame or {}).get('data') or {}).get('msg', ''))
        lock_checks.append(('被控端弹出假锁屏并回报模板信息',
                            bool(lock_frame) and 'template=' in msg, msg[:70]))

        for name, okk, det in lock_checks:
            print('  %-34s %s  %s' % (name, 'OK' if okk else 'FAIL', det))
        pbad += [c for c in lock_checks if not c[1]]

        out = os.path.join(HERE, 'evidence', '146_relay_actions_e2e.json')
        json.dump({'passed': len(results) - len(bad), 'total': len(results), 'results': results,
                   'panel_checks': [{'check': n, 'ok': bool(o), 'detail': d}
                                    for n, o, d in panel_checks],
                   'recseg_spec_checks': [{'check': n, 'ok': bool(o), 'detail': d}
                                          for n, o, d in spec_checks]},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if (not bad and not pbad) else 1
    finally:
        for p in (ag, srv):
            if p:
                p.terminate()


if __name__ == '__main__':
    sys.exit(main())
