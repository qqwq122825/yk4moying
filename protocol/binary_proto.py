#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""二进制通道帧协议（实现重写：`/ws/binary-device` 的帧格式当初没从 native 逆向出来，
本模块定义一套**完整可用**的协议并两端共用 —— 通道地址来自 native 逆向，帧格式是本实现定义）。

帧结构（大端）：

    偏移  长度  字段      说明
    0     2    magic     b'MB' (0x4D42)
    2     1    version   1
    3     1    type      1=屏幕帧 2=相机帧 3=心跳 4=文件分片 5=ack 6=控制
    4     4    seq       帧序号（uint32，发送端自增）
    8     4    flags     bit0=分片起始(START) bit1=分片结束(END) bit2=压缩(zlib)
    12    4    total     整帧 payload 总长（分片时用于预分配/校验）
    16    4    len       本片 payload 长度
    20    4    crc32     本片 payload 的 CRC32
    24    len  payload

设计要点：① 分片（16 KB/片）解决 WebSocket 单帧过大；② CRC 逐片校验，坏片丢弃并计数；
③ flags 标记首尾以便重组；④ ack 帧（type=5）回带 seq，发送端可统计投递。
"""
import binascii
import struct
import zlib

MAGIC = b'MB'
VERSION = 1
HEADER_LEN = 24
MAX_CHUNK = 16 * 1024

T_SCREEN = 1
T_CAMERA = 2
T_HEARTBEAT = 3
T_FILE = 4
T_ACK = 5
T_CONTROL = 6

F_START = 0x01
F_END = 0x02
F_ZLIB = 0x04

TYPE_NAMES = {T_SCREEN: 'screen', T_CAMERA: 'camera', T_HEARTBEAT: 'heartbeat',
              T_FILE: 'file', T_ACK: 'ack', T_CONTROL: 'control'}


def pack(ftype, payload=b'', seq=0, flags=0, total=None):
    """打包一帧；payload 超过 MAX_CHUNK 时请用 chunkify()"""
    payload = payload or b''
    if total is None:
        total = len(payload)
    body = struct.pack('>2sBBIIIII', MAGIC, VERSION, ftype, seq, flags, total,
                       len(payload), binascii.crc32(payload) & 0xFFFFFFFF)
    return body + payload


def chunkify(ftype, data, seq0=0, chunk=MAX_CHUNK, compress=False):
    """把一个大 payload 切成多帧：首片带 START、末片带 END，全部带同一 total"""
    raw = data or b''
    if compress:
        raw = zlib.compress(raw, 6)
    total = len(raw)
    out = []
    if not raw:
        return [pack(ftype, b'', seq0, F_START | F_END | (F_ZLIB if compress else 0), 0)]
    for i in range(0, total, chunk):
        piece = raw[i:i + chunk]
        flags = 0
        if i == 0:
            flags |= F_START
        if i + chunk >= total:
            flags |= F_END
        if compress:
            flags |= F_ZLIB
        out.append(pack(ftype, piece, seq0 + len(out), flags, total))
    return out


def parse(buf):
    """解析一帧 -> dict；不合法返回 None（调用方计入坏帧）"""
    if len(buf) < HEADER_LEN:
        return None
    magic, ver, ftype, seq, flags, total, ln, crc = struct.unpack('>2sBBIIIII', buf[:HEADER_LEN])
    if magic != MAGIC or ver != VERSION:
        return None
    if ln > len(buf) - HEADER_LEN:
        return None
    payload = buf[HEADER_LEN:HEADER_LEN + ln]
    if (binascii.crc32(payload) & 0xFFFFFFFF) != crc:
        return {'ok': False, 'reason': 'crc', 'type': ftype, 'seq': seq}
    return {'ok': True, 'type': ftype, 'type_name': TYPE_NAMES.get(ftype, str(ftype)),
            'seq': seq, 'flags': flags, 'total': total, 'len': ln, 'crc': crc,
            'payload': payload}


class Reassembler:
    """按分片聚合：首片(flags&START)的 seq 作为基序号，后续片必须是 base+n（顺序到达）。
    乱序/丢片/超时都会丢弃并计入 dropped。同一时刻只组装一帧（屏幕帧顺序发送）。"""

    def __init__(self, timeout=15.0, max_total=8 * 1024 * 1024):
        self.cur = None
        self.timeout = timeout
        self.max_total = max_total
        self.dropped = 0
        self.completed = 0
        import time as _t
        self._now = _t.time

    def feed(self, fr):
        if not fr or not fr.get('ok'):
            return None
        seq, flags, total = fr['seq'], fr['flags'], fr['total']
        now = self._now()
        # 超时清理
        if self.cur and now - self.cur['t0'] > self.timeout:
            self.cur = None
            self.dropped += 1
        if total > self.max_total:
            self.dropped += 1
            return None
        if flags & F_START:
            self.cur = {'base': seq, 'n': 1, 'buf': bytearray(fr['payload']),
                        'total': total, 't0': now}
        else:
            if not self.cur or seq != self.cur['base'] + self.cur['n']:
                self.dropped += 1
                return None
            self.cur['buf'] += fr['payload']
            self.cur['n'] += 1
        if flags & F_END:
            cur = self.cur
            self.cur = None
            data = bytes(cur['buf'])
            if cur['total'] and len(data) != cur['total']:
                self.dropped += 1
                return None
            if flags & F_ZLIB:
                try:
                    data = zlib.decompress(data)
                except Exception:
                    self.dropped += 1
                    return None
            self.completed += 1
            return data
        return None


def ack_for(seq):
    return pack(T_ACK, seq.to_bytes(4, 'big'), seq=seq)
