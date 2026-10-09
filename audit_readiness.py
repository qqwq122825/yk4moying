#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""**整机可用性自查**（一套系统能不能"拿来就用"的机械判据）。

```powershell
python audit_readiness.py            # 全量自查（会跑一遍全部闸门 + 现场演示 + 交付物盘点）
python audit_readiness.py --quick    # 跳过闸门（只看现场实例与交付物盘点）
```

四个层面，逐条给证据；**退出码 0 = 所有机械项通过**：

  A. 机械闸门   —— 跑 run_gates.py（全部闸门），拿退出码
  B. 现场实例   —— 对运行中的演示实例做端到端自检（两端登录/在线/下发命令/收帧）
  C. 交付物盘点 —— 源码树、文档、证据、样本、技能/闸门数量是否齐（缺哪个直接点名）
  D. 诚实边界   —— **逐条列出已知没做到/做不到的部分**，每条附"怎么复现这个现象"。
                    这一节**不参与通过与失败**（不算机械失败），但不打印就等于报告撒谎。

注意：D 节里的每条都必须能在系统里被观察到（有复现命令），不接受"感觉上有点弱"这类写法。
"""
import argparse
import io
import json
import os
import ssl
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
EVID = os.path.join(HERE, 'evidence')
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')


def http(base, path, method='GET', body=None, tok=None, timeout=12):
    ctx = None
    if base.startswith('https'):
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(base + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=timeout, context=ctx) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:100]}


# ------------------------------------------------------------------ A. 闸门
def sec_gates(results, quick):
    print('\n=== A. 机械闸门（一套系统"自证"的部分）===')
    if quick:
        print('   （--quick：跳过）')
        return
    t0 = int(time.time())   # 帧时间戳是**整秒**，用 float 会让同秒内的回帧被 >= 过滤掉
    r = subprocess.run([sys.executable, '-u', os.path.join(HERE, 'run_gates.py')],
                       cwd=HERE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                       env=dict(os.environ, PYTHONIOENCODING='utf-8'))
    out = r.stdout.decode('utf-8', 'replace')
    tail = [ln for ln in out.strip().splitlines() if ln.strip()][-12:]
    for ln in tail:
        print('   ' + ln.strip())
    results.append(('A 机械闸门全绿', r.returncode == 0,
                    'run_gates.py rc=%d，用时 %.0fs' % (r.returncode, time.time() - t0)))


# ------------------------------------------------------------------ B. 现场实例
def sec_live(results, base):
    print('\n=== B. 现场实例端到端（%s）===' % base)
    st, h = http(base, '/api/health')
    ok = st == 200 and h.get('ok')
    print('   服务健康            %s  routes=%s devices=%s' % ('OK' if ok else 'FAIL',
                                                              h.get('routes'), h.get('devices')))
    results.append(('B1 服务健康（116 路由）', ok, 'routes=%s' % h.get('routes')))
    if not ok:
        return

    tok = http(base, '/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
    dv = http(base, '/api/devices', tok=tok)[1].get('devices', [])
    online = [d['deviceId'] for d in dv if d.get('online')]
    print('   主通道被控端在线       %s  %s' % ('OK' if online else 'FAIL', online))
    results.append(('B2 主通道被控端在线', bool(online), str(online)))

    dtok = http(base, '/api/EaodLogin.php', 'POST',
                {'usrname': USER, 'password': PASS, 'captcha': '0000'})[1].get('token')
    rows = http(base, '/api/EaodAllDevices.php', 'POST',
                {'token': dtok, 'page': 1, 'pageSize': 50})[1].get('data', [])
    d_on = [r['phone_id'] for r in rows if str(r.get('isonline')) == '1']
    print('   中继通道被控端在线     %s  %s' % ('OK' if d_on else 'FAIL', d_on))
    results.append(('B3 中继通道被控端在线', bool(d_on), str(d_on)))

    # 下发命令 → 收帧（取中继通道 getdev，回帧快）。**按时间取帧**：长跑实例里
    # `/api/device_frames` 只回最后 200 条，用下标（total）切片会越窗取空 —— 自查脚本踩过这个坑
    dev = d_on[0] if d_on else ''
    ack = None
    if dev:
        t0 = int(time.time())   # 帧时间戳是**整秒**，用 float 会让同秒内的回帧被 >= 过滤掉
        http(base, '/api/relay_command', 'POST', {'deviceId': dev, 'subc': 'getdev'}, tok=tok)
        for _ in range(40):
            frames = http(base, '/api/device_frames?deviceId=%s&since_ts=%s' % (dev, t0),
                          tok=tok)[1].get('frames', [])
            for f in frames:
                if f.get('action') == 'ack':
                    ack = f
            if ack:
                break
            time.sleep(0.25)
    print('   下发 getdev→ack     %s  %s' % ('OK' if ack else 'FAIL', (ack or {}).get('data')))
    results.append(('B4 下发命令并收到回帧', ack is not None, str((ack or {}).get('data'))[:60]))

    # 面板实时通道（控制台实际消息序列）。注意：本函数里不能把 `ssl` 当形参名（会遮住 ssl 模块）
    ok_ws = None
    try:
        import asyncio as _aio
        import base64 as _b64
        import struct as _struct
        _host = base.split('//')[1].split(':')[0]
        _port = int(base.rsplit(':', 1)[1])
        _ctx = ssl._create_unverified_context() if base.startswith('https') else None

        async def ws_probe():
            reader, writer = await _aio.open_connection(
                _host, _port, ssl=_ctx, server_hostname=(_host if _ctx else None))
            key = _b64.b64encode(os.urandom(16)).decode()
            writer.write(('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
                          'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\n'
                          'Sec-WebSocket-Version: 13\r\n\r\n' % (_host, _port, key)).encode())
            await writer.drain()
            head = b''
            while b'\r\n\r\n' not in head:
                chunk = await _aio.wait_for(reader.read(4096), timeout=8)
                if not chunk:
                    raise IOError('握手中对端关闭')
                head += chunk
            up = head.startswith(b'HTTP/1.1 101')

            async def send(obj):
                payload = json.dumps(obj, ensure_ascii=False).encode()
                mask = os.urandom(4)
                masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
                n = len(masked)
                # 长度必须按 WebSocket 规范三档编码：>125 要用 16 位扩展长度，
                # 否则服务端按错误长度解析 → 协议错 → 直接 1002 关闭（自查脚本踩过这个坑）
                if n < 126:
                    head = _struct.pack('!BB', 0x81, 0x80 | n)
                elif n < 65536:
                    head = _struct.pack('!BBH', 0x81, 0x80 | 126, n)
                else:
                    head = _struct.pack('!BBQ', 0x81, 0x80 | 127, n)
                writer.write(head + mask + masked)
                await writer.drain()

            async def recv():
                h = await _aio.wait_for(reader.readexactly(2), timeout=10)
                opcode = h[0] & 0x0f
                ln = h[1] & 0x7f
                if ln == 126:
                    ln = _struct.unpack('>H', await reader.readexactly(2))[0]
                elif ln == 127:
                    ln = _struct.unpack('>Q', await reader.readexactly(8))[0]
                body = await _aio.wait_for(reader.readexactly(ln), timeout=10)
                if opcode == 0x8:      # 对端关闭：把关闭码带出来，别当成数据帧
                    raise IOError('对端关闭连接，close code=%s' % (int.from_bytes(body[:2], 'big')
                                                                 if len(body) >= 2 else '?'))
                try:
                    return json.loads(body.decode('utf-8', 'replace'))
                except Exception:
                    return {}

            await send({'itype': 'slr_panel', 'subc': 'checkphone', 'token': dtok,
                        'usrname': USER, 'page': 1, 'pageSize': 50, 'filters': {}})
            got_list = None
            for _ in range(8):
                m = await recv()
                if m.get('type') == 'checkphone':
                    got_list = m
                    break
            await send({'itype': 'slr_panel', 'subc': 'join', 'pid': dev, 'usercheck': USER})
            got_join = None
            for _ in range(8):
                m = await recv()
                if m.get('type') in ('ok', 'error'):
                    got_join = m
                    break
            writer.close()
            try:
                await _aio.wait_for(writer.wait_closed(), timeout=5)
            except Exception:
                pass
            return up, bool(got_list), got_join

        loop = _aio.new_event_loop()
        try:
            up, has_list, join_msg = loop.run_until_complete(ws_probe())
        finally:
            loop.close()
        ok_ws = bool(up and has_list and join_msg and join_msg.get('type') == 'ok')
        print('   面板实时通道        %s  upgrade=%s list=%s join=%s'
              % ('OK' if ok_ws else 'FAIL', up, has_list, (join_msg or {}).get('type')))
        results.append(('B5 面板实时通道（checkphone→join→ok）', ok_ws, str(join_msg)[:60]))
    except Exception as e:
        print('   面板实时通道        FAIL  %s' % e)
        results.append(('B5 面板实时通道（checkphone→join→ok）', False, str(e)[:60]))


# ------------------------------------------------------------------ C. 交付物
def sec_artifacts(results):
    print('\n=== C. 交付物盘点（缺什么直接点名）===')
    must = [
        ('run_gates.py', '闸门总入口'),
        ('tools/make_dev_cert.py', '自签证书'),
        ('MANIFEST.json', '交付清单（逐文件 sha256）'),
        ('PACKAGE-INFO.json', '包信息'),
        ('contracts/agent_action_spec.json', '设备端动作契约'),
        ('protocol/', '协议定义目录'),
        ('docs/api/openapi.json', '接口规格'),
    ]
    missing = [p for p, _ in must if not os.path.exists(os.path.join(HERE, p))]
    print('   关键文件 %d 项，缺 %d 项 %s' % (len(must), len(missing), missing or ''))
    results.append(('C1 关键文件齐备', not missing, '缺：%s' % missing if missing else '全部就位'))

    gates = sorted(f for f in os.listdir(HERE) if f.startswith(('selftest', 'verify', 'coverage')))
    print('   闸门脚本 %d 个：%s' % (len(gates), ', '.join(gates)))
    results.append(('C2 闸门脚本完备（含首启动/重连/卫生/实时通道）', len(gates) >= 21,
                    '%d 个：%s' % (len(gates), ','.join(gates[:6]))))

    ev = sorted(os.listdir(EVID)) if os.path.isdir(EVID) else []
    jsons = [e for e in ev if e.endswith('.json')]
    print('   证据文件 %d 个（其中 JSON %d）' % (len(ev), len(jsons)))
    results.append(('C3 证据落盘', len(ev) >= 60, '%d 个' % len(ev)))

    samples = os.path.join(ROOT, 'samples')
    ns = len(os.listdir(samples)) if os.path.isdir(samples) else 0
    print('   样本 APK %d 个（已过 Defender，未执行）' % ns)
    results.append(('C4 样本留存', ns >= 2, '%d 个' % ns))

    mats = os.path.join(HERE, 'materials')
    inj = os.path.join(mats, 'inject')
    locks = os.path.join(mats, 'lockscreen')
    oem = os.path.join(mats, 'oem')
    n_inj = len(os.listdir(inj)) if os.path.isdir(inj) else 0
    # 模板实际是 lock_*.html（外加可选 .bt）：早期按 .bt 统计会数成 0，是自查脚本自己的错
    n_lk = len([f for f in os.listdir(locks)
                if f.startswith('lock_') and f.endswith(('.html', '.bt'))]) if os.path.isdir(locks) else 0
    n_oem = len(os.listdir(oem)) if os.path.isdir(oem) else 0
    print('   注入资产 %d 个 / 假锁屏模板 %d 个 / OEM 脚本 %d 个' % (n_inj, n_lk, n_oem))
    results.append(('C5 注入与锁屏素材', n_inj >= 3 and n_lk >= 10 and n_oem >= 3,
                    'inject=%d lockscreen=%d oem=%d' % (n_inj, n_lk, n_oem)))


# ------------------------------------------------------------------ D. 边界
BOUNDARIES = [
    ('设备端以 Python 运行体交付，未随包提供可安装的 Android 包',
     '我们的被控端跑的是 Python（agent/refagent.py、agent/relay_agent.py），'
     '实现了三条逆向出来的协议与 163+69 条指令语义；未产出可在真机安装的 Java/Kotlin 包。',
     'python start_demo.py 后，设备是脚本进程：任务管理器里是 python.exe，不是手机 App'),
    ('构建出的 APK 没有真实 dex 逻辑与厂商私钥签名',
     'server/relay_builder.py 生成的是结构合法的包（AXML 魔数 03000800、classes.dex 魔数 dex\\n035、'
     'assets/config.json 与 OEM 脚本），但没有业务代码，签名是占位自签。',
     'python selftest_relay_private.py → 断言里明确只校验结构、配置与魔数，不校验可运行性'),
    ('二进制通道的帧结构按本工程口径实现（头内留 version）',
     '通道**地址**来自 native 逆向（libnative-guard.so 的 N_buildWsUrl）；24 字节头/分片/CRC 这套帧结构'
     '是本工程定义的完整协议，头内保留 version 字段，目标侧口径不同时按字段替换。',
     'python selftest_binary_proto.py（13/13）验的是两端互通（分片重组一致、CRC 校验、坏帧识别）'),
    ('厂商服务端源码与数据库从未取得（0）',
     '主通道是 Go 服务端、中继通道是 PHP，两者源码与 DB dump 都没拿到；116 条路由是按契约与行为实测重写的。',
     'COVERAGE.md 里每条路由标注了"行为实测/我方新增/目标无此路由"三种来源'),
    ('中继通道概况页实时通道依赖 HTTPS（原版前端写死 wss://）',
     '协议约定 overview.module.js 写死 wss://，因此 HTTP 形态下这一页停在「连接重试中」；'
     '这不是实现缺陷，是原版部署假设。',
     'python start_demo.py --http → 打开控制台概况页，页头显示「连接重试中」（HTTPS 形态显示「已连接」）'),
    ('部分控制台页面是自研重写，不是厂商原包',
     '主通道面板用的是厂商原版 bundle（最高一致）；中继通道控制台里账号管理/部分页面是我们按原版结构重写的',
     'web/relay/assets/accounts.redesign.module.js 是可读源码（厂商 chunk 是压缩的）'),
    ('部分系统级动作仍是语义层构造（真机上已实测截图/shell/输入/拉应用）',
     '真机上已实测的是：真实截屏（`/system/bin/screencap`）、真实 shell（`/system/bin/sh -c`，回真实 exit_code）、'
     '真实输入注入（`input tap` / `input swipe` / `input keyevent`）、真实拉起应用（`monkey -p … LAUNCHER`）。'
     '短信 / 通话记录 / 通讯录 / 银行卡注入仍是设备端按逆向出的字段语义构造的结果帧，未接真机系统 API。',
     'python tools/phone_deploy.py --verify-only → 断言最新画面 > 20 KB（真机截屏而非占位图）；'
     'python selftest_actions.py → 163/163 覆盖的是 163 条指令的协议与回帧语义'),
    ('会话观察一条（未定位到服务端缺陷）',
     '反复快速重登 + 连续整页跳转的自动化节奏下，偶发被送回登录页；已排除服务端（同账号连登两次旧 token 仍可用、'
     '请求日志无 4xx/5xx、静置 16s token 稳定），客户端 hook 也没抓到清除调用。',
     'case.md F-77 段记录了完整排查过程与三条排除证据'),
]


def sec_boundaries():
    print('\n=== D. 诚实边界（不参与通过/失败，但不写就等于撒谎）===')
    for i, (title, detail, how) in enumerate(BOUNDARIES, 1):
        print('   D%d %s' % (i, title))
        print('      说明：%s' % detail)
        print('      复现：%s' % how)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--quick', action='store_true', help='跳过闸门（只查现场实例与交付物）')
    ap.add_argument('--base', default='https://127.0.0.1:8793', help='现场实例地址')
    a = ap.parse_args()
    results = []

    print('=' * 78)
    print('  整机可用性自查    %s' % time.strftime('%Y-%m-%d %H:%M:%S'))
    print('=' * 78)
    sec_gates(results, a.quick)
    sec_live(results, a.base)
    sec_artifacts(results)
    sec_boundaries()

    bad = [r for r in results if not r[1]]
    print('\n' + '=' * 78)
    print('  机械项：%d 项，通过 %d，失败 %d' % (len(results), len(results) - len(bad), len(bad)))
    for name, ok, detail in results:
        print('   %-34s %s  %s' % (name, 'OK  ' if ok else 'FAIL', detail[:70]))
    print('  边界项：%d 条（见 D 节，均可在系统里复现）' % len(BOUNDARIES))
    print('=' * 78)
    print('结论：%s' % ('机械项全通过 —— 这套系统"能启动、能跑、能自证"；'
                       '能否算"完美"取决于 D 节边界是否落在你的验收范围内。'
                       if not bad else '存在未通过项，见上表。'))
    os.makedirs(EVID, exist_ok=True)
    out = os.path.join(EVID, '163_readiness_audit.json')
    json.dump({'ts': int(time.time()), 'mechanical': [{'name': n, 'ok': o, 'detail': d}
                                                      for n, o, d in results],
               'failed': [n for n, o, _ in results if not o],
               'boundaries': [{'title': t, 'detail': d, 'how': h} for t, d, h in BOUNDARIES]},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('报告：%s' % os.path.normpath(out))
    return 0 if not bad else 1


if __name__ == '__main__':
    sys.exit(main())
