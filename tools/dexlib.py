#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""最小 Android 逆向工具箱（纯 Python，不依赖 apktool/dex2jar）：
  · AxmlReader —— 解析二进制 AndroidManifest.xml（字符串池 + 起止元素 + 属性值）
  · DexReader  —— 解析 DEX 头/字符串表/方法表/类表，并能按 **字符串引用** 反查使用它的方法
                   （扫 code_item 里的 const-string / const-string/jumbo）

用途（本项目的真实需要）：
  1. 打补丁前先看清清单属性（包名 / targetSdk / 是否允许明文 HTTP）
  2. 找"谁在用被逆向出来的 URL 与 /ws/binary-device 通道"，据此对齐协议或原地改字符串
"""
import struct


# --------------------------------------------------------------------------- AXML
AXML_MAGIC = 0x00080003


class AxmlReader(object):
    def __init__(self, data):
        self.d = data
        magic, self.size = struct.unpack_from('<II', data, 0)
        if magic != AXML_MAGIC:
            raise ValueError('不是 AXML（magic=%08x）' % magic)
        self.strings = []
        self.elements = []      # [(tag, attrs_dict, depth)]
        self._parse()

    # -- 字符串池
    def _parse_string_pool(self, off):
        (typ, hsize, size, cnt, style_cnt, flags, s_start, style_start) = struct.unpack_from(
            '<HHI I I I I I'.replace(' ', ''), self.d, off)
        utf8 = bool(flags & 0x100)
        offs = struct.unpack_from('<%dI' % cnt, self.d, off + hsize)
        base = off + s_start
        for o in offs:
            p = base + o
            if utf8:
                # UTF-8 池：**两个**长度字段（字符数、字节数），各自可能是 1 或 2 字节
                def _l():
                    nonlocal p
                    b0 = self.d[p]
                    p += 1
                    if b0 & 0x80:
                        v = ((b0 & 0x7f) << 8) | self.d[p]
                        p += 1
                        return v
                    return b0
                _chars = _l()
                blen = _l()
                s = self.d[p:p + blen].decode('utf-8', 'replace')
            else:
                n = struct.unpack_from('<H', self.d, p)[0]
                p += 2
                if n & 0x8000:
                    n = ((n & 0x7fff) << 16) | struct.unpack_from('<H', self.d, p)[0]
                    p += 2
                s = self.d[p:p + n * 2].decode('utf-16-le', 'replace')
            self.strings.append(s)

    def s(self, i):
        return self.strings[i] if 0 <= i < len(self.strings) else ''

    def _parse(self):
        off = 8
        stack = []
        while off + 8 <= len(self.d):
            typ, hsize, size = struct.unpack_from('<HHI', self.d, off)
            if size == 0:
                break
            if typ == 0x0001:
                self._parse_string_pool(off)
            elif typ == 0x0102:                      # START_ELEMENT
                _l, _c, ns, name, attr_start, attr_size, attr_count, _i, _cl, _st = \
                    struct.unpack_from('<IIIIHHHHHH', self.d, off + 8)
                attrs = {}
                # 属性起点 = chunk 起点 + 16（node 头：type/headerSize/size/line/comment）+ attributeStart
                # （attrExt 结构体自己占 20 字节，attributeStart 就是它的长度；早先写成 +8 会整体错 8 字节，
                #   结果所有属性值都读成 None —— 这是自查时用真实 APK 对照才发现的）
                p = off + 16 + attr_start
                for _ in range(attr_count):
                    if p + 20 > len(self.d):
                        break
                    ans, aname, araw, avsize, ares0, atype, adata = struct.unpack_from(
                        '<IIIHBBI', self.d, p)
                    key = self.s(aname)
                    # 字符串型属性：rawValue 与 typedValue.data 都是**字符串池下标**
                    if atype == 0x03:
                        idx = araw if araw != 0xFFFFFFFF else adata
                        val = self.s(idx)
                    elif atype == 0x12:
                        val = bool(adata)
                    elif atype == 0x10:
                        val = adata
                    elif atype == 0x01:
                        val = '@0x%08x' % adata
                    else:
                        val = 'type=0x%02x data=0x%x' % (atype, adata)
                    attrs[key] = val
                    p += max(avsize, 20)
                self.elements.append((self.s(name), attrs, len(stack)))
                stack.append(self.s(name))
            elif typ == 0x0103:                      # END_ELEMENT
                if stack:
                    stack.pop()
            off += size

    def find(self, tag):
        return [(t, a, d) for (t, a, d) in self.elements if t == tag]

    def manifest_summary(self):
        out = {}
        for t, a, _d in self.elements:
            if t == 'manifest':
                out['package'] = a.get('package')
                out['versionName'] = a.get('versionName')
                out['versionCode'] = a.get('versionCode')
            if t == 'uses-sdk':
                out['minSdk'] = a.get('minSdkVersion')
                out['targetSdk'] = a.get('targetSdkVersion')
            if t == 'application':
                out['label'] = a.get('label')
                out['cleartext'] = a.get('usesCleartextTraffic')
                out['netSecConfig'] = a.get('networkSecurityConfig')
                out['debuggable'] = a.get('debuggable')
        return out


# --------------------------------------------------------------------------- DEX
class DexReader(object):
    def __init__(self, data):
        self.d = data
        if not data[:4] == b'dex\n':
            raise ValueError('不是 DEX')
        self.version = data[4:8].decode('latin1')
        (self.string_ids_size, self.string_ids_off,
         self.type_ids_size, self.type_ids_off,
         self.proto_ids_size, self.proto_ids_off,
         self.field_ids_size, self.field_ids_off,
         self.method_ids_size, self.method_ids_off,
         self.class_defs_size, self.class_defs_off) = struct.unpack_from('<12I', data, 0x38)
        self.strings = []
        for i in range(self.string_ids_size):
            off = struct.unpack_from('<I', data, self.string_ids_off + 4 * i)[0]
            self.strings.append(self._read_string(off))
        self.types = []
        for i in range(self.type_ids_size):
            idx = struct.unpack_from('<I', data, self.type_ids_off + 4 * i)[0]
            self.types.append(self.s(idx))
        self.methods = []
        for i in range(self.method_ids_size):
            cls, proto, name = struct.unpack_from('<HHI', data, self.method_ids_off + 8 * i)
            self.methods.append((self.types[cls] if cls < len(self.types) else '?', self.s(name)))
        self.classes = []
        for i in range(self.class_defs_size):
            base = self.class_defs_off + 32 * i
            cls_idx, _acc, _sup, _if, _src, _anno, cls_data_off, _st = struct.unpack_from(
                '<IIIIIIII', data, base)
            self.classes.append((self.types[cls_idx] if cls_idx < len(self.types) else '?',
                                 cls_data_off))

    def _read_string(self, off):
        """DEX 字符串 = uleb128(utf16 长度) + MUTF-8 字节（以 NUL 结尾）。
        注意与 AXML 的 UTF-8 字符串池不同（那边是**两个**长度字段）；
        早先把两者混为一谈，读出来的"字符串"其实是 122 字节的糊块，
        只是里面恰好含目标子串，所以 find_strings 看着像命中（自查时用真 dex 对照才发现）。"""
        p = off
        while True:                      # 跳过 uleb128 的 utf16 长度
            b = self.d[p]
            p += 1
            if not (b & 0x80):
                break
        end = self.d.index(b'\x00', p)
        return self.d[p:end].decode('utf-8', 'replace')

    def s(self, i):
        return self.strings[i] if 0 <= i < len(self.strings) else '?'

    def find_strings(self, needle):
        return [i for i, s in enumerate(self.strings) if needle in s]

    # -- 一次遍历建立"字符串 → 使用它的方法"索引（比逐字符串扫全库快一个量级）
    def usage_map(self, wanted, only_clinit=True):
        """wanted: 关心的字符串下标集合；返回 {idx: [(class, method), ...]}

        only_clinit=True 时只扫静态初始化器 —— URL/密钥这类常量基本都在 `<clinit>` 里赋值，
        扫全部 4 万+方法在纯 Python 里要几分钟，只扫 <clinit> 是秒级（够用且可解释）。
        """
        out = {i: [] for i in wanted}
        n = len(self.d)
        want = set(wanted)
        for cls_name, cls_data_off in self.classes:
            if not cls_data_off:
                continue
            for mname, code_off in self._methods_of(cls_data_off):
                if only_clinit and mname != '<clinit>':
                    continue
                if not code_off or code_off + 16 > n:
                    continue
                insns_size = struct.unpack_from('<I', self.d, code_off + 12)[0]
                insns = code_off + 16
                if insns + 2 * insns_size > n:
                    insns_size = max(0, (n - insns) // 2)
                i = 0
                while i < insns_size:
                    w = struct.unpack_from('<H', self.d, insns + 2 * i)[0]
                    op = w & 0xff
                    if op == 0x1a and i + 1 < insns_size:
                        ref = (w >> 8) | (struct.unpack_from('<H', self.d, insns + 2 * (i + 1))[0] << 8)
                        if ref in want:
                            out[ref].append((cls_name, mname))
                        i += 2
                        continue
                    if op == 0x1b and i + 2 < insns_size:
                        ref = struct.unpack_from('<I', self.d, insns + 2 * (i + 1))[0]
                        if ref in want:
                            out[ref].append((cls_name, mname))
                        i += 3
                        continue
                    i += self._insn_len(op, insns, i)
        return out

    # -- 扫所有 code_item 的 const-string，反查使用某字符串的方法
    def users_of_string(self, target_idx, limit=40):
        hits = []
        n = len(self.d)
        for cls_name, cls_data_off in self.classes:
            if not cls_data_off:
                continue
            for mname, code_off in self._methods_of(cls_data_off):
                if not code_off or code_off + 16 > n:
                    continue
                insns_size = struct.unpack_from('<I', self.d, code_off + 12)[0]
                insns = code_off + 16
                if insns + 2 * insns_size > n:      # 越界保护：坏条目直接跳过，不让扫描崩
                    insns_size = max(0, (n - insns) // 2)
                i = 0
                while i < insns_size:
                    w = struct.unpack_from('<H', self.d, insns + 2 * i)[0]
                    op = w & 0xff
                    if op == 0x1a:                       # const-string
                        if i + 1 >= insns_size:
                            break
                        ref = (w >> 8) | (struct.unpack_from('<H', self.d, insns + 2 * (i + 1))[0] << 8)
                        if ref == target_idx:
                            hits.append((cls_name, mname))
                            break
                        i += 2
                        continue
                    if op == 0x1b:                       # const-string/jumbo
                        if i + 2 >= insns_size:
                            break
                        ref = struct.unpack_from('<I', self.d, insns + 2 * (i + 1))[0]
                        if ref == target_idx:
                            hits.append((cls_name, mname))
                            break
                        i += 3
                        continue
                    i += self._insn_len(op, insns, i)
                    if len(hits) >= limit:
                        return hits
        return hits

    def _methods_of(self, cls_data_off):
        p = cls_data_off

        def uleb():
            nonlocal p
            n = 0
            shift = 0
            while True:
                b = self.d[p]
                p += 1
                n |= (b & 0x7f) << shift
                shift += 7
                if not (b & 0x80):
                    return n
        uleb(); uleb()                       # static_fields_size, instance_fields_size
        uleb(); uleb()                       # direct_methods_size, virtual_methods_size
        uleb(); uleb()                       # 跳过 static fields
        uleb(); uleb()                       # 跳过 instance fields
        out = []
        for _ in range(2):                   # direct then virtual
            cnt = uleb()
            for _ in range(cnt):
                _mi = uleb()
                _acc = uleb()
                code_off = uleb()
                out.append((self.methods[_mi][1] if _mi < len(self.methods) else '?', code_off))
        return out

    # 指令长度表（只覆盖常见 opcode；未知按 2 字节保守前进）
    _LEN = {0x00: 2, 0x01: 2, 0x02: 2, 0x03: 2, 0x04: 2, 0x05: 2, 0x06: 2, 0x07: 2, 0x08: 2,
            0x09: 2, 0x0a: 2, 0x0b: 2, 0x0c: 2, 0x0d: 2, 0x0e: 2, 0x0f: 2, 0x10: 2, 0x11: 2,
            0x12: 2, 0x13: 4, 0x14: 4, 0x15: 4, 0x16: 4, 0x17: 4, 0x18: 6, 0x19: 6, 0x1a: 4,
            0x1b: 6, 0x1c: 4, 0x1d: 2, 0x1e: 2, 0x1f: 2, 0x20: 2, 0x21: 2, 0x22: 4, 0x23: 4,
            0x24: 6, 0x25: 6, 0x26: 6, 0x27: 2, 0x28: 2, 0x29: 2, 0x2a: 6, 0x2b: 6, 0x2c: 6,
            0x2d: 4, 0x2e: 4, 0x2f: 4, 0x30: 4, 0x31: 4, 0x32: 4, 0x33: 4, 0x34: 4, 0x35: 4,
            0x36: 4, 0x37: 4, 0x38: 4, 0x39: 4, 0x3a: 4, 0x3b: 4, 0x3c: 4, 0x3d: 4, 0x3e: 4,
            0x3f: 4, 0x40: 4, 0x41: 4, 0x42: 4, 0x43: 4, 0x44: 6, 0x45: 6, 0x46: 6, 0x47: 6,
            0x48: 6, 0x49: 6, 0x4a: 6, 0x4b: 6, 0x4c: 6, 0x4d: 6, 0x4e: 6, 0x4f: 6, 0x50: 6,
            0x51: 6, 0x52: 6, 0x53: 6, 0x54: 6, 0x55: 6, 0x56: 6, 0x57: 6, 0x58: 6, 0x59: 6,
            0x5a: 6, 0x5b: 6, 0x5c: 6, 0x5d: 6, 0x5e: 6, 0x5f: 6, 0x60: 6, 0x61: 6, 0x62: 6,
            0x63: 6, 0x64: 6, 0x65: 6, 0x66: 6, 0x67: 6, 0x68: 6, 0x69: 6, 0x6a: 6, 0x6b: 6,
            0x6c: 6, 0x6d: 6, 0x6e: 6, 0x6f: 6, 0x70: 6, 0x71: 6, 0x72: 6, 0x73: 2, 0x74: 2,
            0x75: 2, 0x76: 2, 0x77: 2, 0x78: 4, 0x79: 2, 0x7a: 2, 0x7b: 2, 0x7c: 2, 0x7d: 2,
            0x7e: 2, 0x7f: 2, 0x80: 2, 0x81: 2, 0x82: 2, 0x83: 2, 0x84: 2, 0x85: 2, 0x86: 2,
            0x87: 2, 0x88: 2, 0x89: 2, 0x8a: 2, 0x8b: 2, 0x8c: 2, 0x8d: 2, 0x8e: 2, 0x8f: 2,
            0x90: 2, 0x91: 2, 0x92: 2, 0x93: 2, 0x94: 2, 0x95: 2, 0x96: 2, 0x97: 2, 0x98: 2,
            0x99: 2, 0x9a: 2, 0x9b: 2, 0x9c: 2, 0x9d: 2, 0x9e: 2, 0x9f: 2, 0xa0: 2, 0xa1: 2,
            0xa2: 2, 0xa3: 2, 0xa4: 2, 0xa5: 2, 0xa6: 2, 0xa7: 2, 0xa8: 2, 0xa9: 2, 0xaa: 2,
            0xab: 2, 0xac: 2, 0xad: 2, 0xae: 2, 0xaf: 2, 0xb0: 2,
            0xd0: 4, 0xd1: 4, 0xd2: 4, 0xd3: 4, 0xd4: 4, 0xd5: 4, 0xd6: 4, 0xd7: 4, 0xd8: 4,
            0xd9: 4, 0xda: 4, 0xdb: 4, 0xdc: 4, 0xdd: 4, 0xde: 4, 0xdf: 4, 0xe0: 4, 0xe1: 4,
            0xe2: 4, 0xe3: 4, 0xe4: 4, 0xe5: 4, 0xe6: 4, 0xe7: 4, 0xe8: 4, 0xe9: 4, 0xea: 4,
            0xeb: 4, 0xec: 4, 0xed: 4, 0xee: 4, 0xef: 4, 0xf0: 4, 0xf1: 4, 0xf2: 4, 0xf3: 4,
            0xf4: 4, 0xf5: 4, 0xf6: 4, 0xf7: 4, 0xf8: 4, 0xf9: 4, 0xfa: 4, 0xfb: 4, 0xfc: 4,
            0xfd: 4, 0xfe: 4, 0xff: 4}

    def _insn_len(self, op, insns, i):
        return self._LEN.get(op, 2)
