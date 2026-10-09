#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""二进制通道协议判据：帧结构 / 分片重组 / CRC 校验 / ack / 坏帧丢弃 / 落盘为可验证图片。

判据：全部通过 exit 0。
"""
import asyncio
import base64
import binascii
import io
import json
import os
import struct
import subprocess
import sys
import time
import urllib.error
import urllib.request
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, 'protocol'))
import binary_proto as bp  # noqa: E402

HOST, PORT = '127.0.0.1', 8806
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
DEV = 'binproto%08d' % 7


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


def ws_handshake(path):
    import socket
    s = socket.create_connection((HOST, PORT), timeout=10)
    key = base64.b64encode(os.urandom(16)).decode()
    s.sendall(('GET %s HTTP/1.1\r\nHost: %s:%d\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n'
               'Sec-WebSocket-Key: %s\r\nSec-WebSocket-Version: 13\r\n\r\n'
               % (path, HOST, PORT, key)).encode())
    head = b''
    while b'\r\n\r\n' not in head:
        head += s.recv(4096)
    assert b'101' in head.split(b'\r\n')[0], head[:120]
    return s


def ws_send_binary(s, payload):
    mask = os.urandom(4)
    masked = bytes(b ^ mask[i % 4] for i, b in enumerate(payload))
    n = len(masked)
    if n < 126:
        hdr = struct.pack('!BB', 0x82, 0x80 | n)
    elif n < 65536:
        hdr = struct.pack('!BBH', 0x82, 0x80 | 126, n)
    else:
        hdr = struct.pack('!BBQ', 0x82, 0x80 | 127, n)
    s.sendall(hdr + mask + masked)


def ws_recv(s, timeout=5):
    s.settimeout(timeout)
    h = s.recv(2)
    if len(h) < 2:
        return None, b''
    op = h[0] & 0x0f
    ln = h[1] & 0x7f
    if ln == 126:
        ln = struct.unpack('>H', s.recv(2))[0]
    elif ln == 127:
        ln = struct.unpack('>Q', s.recv(8))[0]
    data = b''
    while len(data) < ln:
        data += s.recv(ln - len(data))
    return op, data


def webp_bytes(w=1080, h=1920):
    """生成一张"像截图"的 WebP（带内容与噪声），确保体积超过单帧分片阈值"""
    from PIL import Image, ImageDraw
    import random as _r
    rnd = _r.Random(7)
    img = Image.new('RGB', (w, h), (240, 244, 250))
    d = ImageDraw.Draw(img)
    d.rectangle([0, 0, w, 180], fill=(20, 33, 61))
    for i in range(24):
        y = 240 + i * 66
        d.rectangle([40, y, w - 40, y + 48], outline=(110, 130, 200), width=2)
        d.text((56, y + 16), 'row %02d  account ****%04d' % (i, rnd.randint(0, 9999)),
               fill=(60, 70, 90))
    for _ in range(9000):                      # 噪声：把体积顶上去，逼近真实截图
        x, y = rnd.randint(0, w - 1), rnd.randint(0, h - 1)
        img.putpixel((x, y), (rnd.randint(0, 255), rnd.randint(0, 255), rnd.randint(0, 255)))
    buf = io.BytesIO()
    img.save(buf, format='WEBP', quality=80)
    return buf.getvalue()


def main():
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:160]})
        if not ok:
            fails.append(name)
        print('%-44s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:70]))

    # ---------- 纯协议单测（不需要服务端）----------
    payload = webp_bytes()
    frames = bp.chunkify(bp.T_SCREEN, payload, seq0=100)
    ck('大帧被切成多片（16KB/片）', len(frames) > 1, '%d 片 / %d B' % (len(frames), len(payload)))
    r = bp.Reassembler()
    got = None
    for f in frames:
        got = r.feed(bp.parse(f)) or got
    ck('分片重组出原负载', got == payload, '%d B vs %d B' % (len(got or b''), len(payload)))
    ck('重组器统计完成数', r.completed == 1, 'completed=%d dropped=%d' % (r.completed, r.dropped))

    bad = bytearray(frames[0])
    bad[-1] ^= 0xFF
    fr = bp.parse(bytes(bad))
    ck('CRC 损坏帧被识别为坏帧', fr is not None and not fr['ok'] and fr.get('reason') == 'crc',
       str(fr)[:60])

    lone = bp.parse(bp.pack(bp.T_SCREEN, b'x' * 10, seq=999, flags=bp.F_END, total=10))
    r2 = bp.Reassembler()
    ck('缺首片的分片被丢弃并计数', r2.feed(lone) is None and r2.dropped >= 1,
       'dropped=%d' % r2.dropped)
    ck('ack 帧带 seq', bp.parse(bp.ack_for(42))['seq'] == 42)

    # ---------- 端到端（服务端 + 二进制通道）----------
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=io.open(os.path.join(HERE, 'evidence',
                                                       '150_server.log'), 'w', encoding='utf-8'),
                           stderr=subprocess.STDOUT, env=env)
    try:
        for _ in range(60):
            try:
                if call('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1]['token']

        s = ws_handshake('/ws/binary-device?deviceId=%s' % DEV)
        # 心跳
        ws_send_binary(s, bp.pack(bp.T_HEARTBEAT, b'ping', seq=1))
        op, data = ws_recv(s)
        hb = bp.parse(data) if op == 2 else None
        ck('心跳帧被接受并回 ack', bool(hb and hb['ok'] and hb['type'] == bp.T_ACK),
           str((hb or {}).get('type')))
        # 屏幕帧（分片）
        n = 0
        for f in bp.chunkify(bp.T_SCREEN, payload, seq0=10):
            ws_send_binary(s, f)
            n += 1
        # 服务端在重组完成（末片）后回 ack；给足时间并记录收到的 op 序列
        got_ack, ops = None, []
        for _ in range(20):
            try:
                op, data = ws_recv(s, timeout=1.5)
            except Exception:
                break
            ops.append(op)
            if op == 2:
                got_ack = bp.parse(data)
                break
        ck('末片到达后回 ack', bool(got_ack and got_ack['ok']),
           'seq=%s ops=%s' % ((got_ack or {}).get('seq'), ops))
        # 坏帧：故意改 CRC
        c2 = bytearray(bp.pack(bp.T_SCREEN, b'y' * 64, seq=77, flags=bp.F_START | bp.F_END, total=64))
        c2[-1] ^= 0x5A
        ws_send_binary(s, bytes(c2))
        time.sleep(0.6)
        st = call('/api/binary_stats?deviceId=%s' % DEV, tok=tok)[1]
        b = st.get('binary', {})
        ck('服务端记录坏帧计数', int(b.get('bad') or 0) >= 1, 'bad=%s' % b.get('bad'))
        ck('服务端统计分片重组完成', int(b.get('reassembled') or 0) >= 1,
           'reassembled=%s frames=%s' % (b.get('reassembled'), b.get('frames')))
        ck('类型计数含 screen/heartbeat',
           'screen' in (b.get('types') or {}) and 'heartbeat' in (b.get('types') or {}),
           str(b.get('types')))

        shots = st.get('shots') or []
        ck('屏幕帧落盘为文件', bool(shots) and shots[-1].get('ext') in ('webp', 'png'),
           str(shots[-1] if shots else None))
        if shots:
            fp = os.path.join(HERE, 'state', 'bin_frames', DEV, shots[-1]['file'])
            raw = open(fp, 'rb').read()
            ok = raw[:4] == b'RIFF' and raw[8:12] == b'WEBP'
            ck('落盘文件是完整 WebP（魔数 + 尺寸一致）',
               ok and len(raw) == int(shots[-1]['bytes']), '%d B %s' % (len(raw), raw[:12]))
        s.close()

        print('\n二进制通道协议：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
        out = os.path.join(HERE, 'evidence', '150_binary_proto_e2e.json')
        json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
                  io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('->', os.path.normpath(out))
        return 0 if not fails else 1
    finally:
        srv.terminate()


if __name__ == '__main__':
    sys.exit(main())
