#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Android 2.1 客户端使用的二进制 WebSocket 帧协议。

线上 APK 的帧格式来自反编译后的 ``C0793.m1614``：

    [type:1 byte][payload length:uint32 big-endian][payload]

一条 WebSocket binary message 可以包含一帧或多帧；客户端不会分片、不会发送
ACK，也没有 magic/version/CRC 头。屏幕帧 payload 本身就是 JPEG/PNG。
"""
import struct

HEADER_LEN = 5

T_SCREEN = 1
T_A11Y_TREE = 2
T_THUMB = 4
T_HD = 6
T_ADB_TREE = 7
T_COMMAND = 16
T_PONG = 33
T_HELLO = 48

TYPE_NAMES = {
    T_SCREEN: 'screen', T_A11Y_TREE: 'a11y_tree', T_THUMB: 'thumb',
    T_HD: 'hd', T_ADB_TREE: 'adb_tree', T_COMMAND: 'command',
    T_PONG: 'pong', T_HELLO: 'hello',
}


def pack(ftype, payload=b''):
    """按客户端协议组帧；主要用于服务端 type=16 指令或协议自测。"""
    payload = payload or b''
    return bytes((int(ftype) & 0xff,)) + struct.pack('>I', len(payload)) + payload


def parse_many(buf):
    """解析一条 WebSocket binary message，返回所有完整帧。"""
    out = []
    pos = 0
    raw = bytes(buf or b'')
    while pos < len(raw):
        if len(raw) - pos < HEADER_LEN:
            return out, 'short_header'
        ftype = raw[pos]
        length = struct.unpack('>I', raw[pos + 1:pos + 5])[0]
        pos += HEADER_LEN
        if length > len(raw) - pos:
            return out, 'truncated_payload'
        payload = raw[pos:pos + length]
        pos += length
        out.append({'ok': True, 'type': ftype,
                    'type_name': TYPE_NAMES.get(ftype, str(ftype)),
                    'len': length, 'payload': payload})
    return out, None


def parse(buf):
    """兼容单帧调用。"""
    frames, error = parse_many(buf)
    if error or len(frames) != 1:
        return None
    return frames[0]
