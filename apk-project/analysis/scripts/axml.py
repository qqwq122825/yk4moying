#!/usr/bin/env python3
"""Minimal Android binary XML (AXML) parser -> text XML."""
import struct, sys, io

RES_STRING_POOL = 0x0001
RES_XML = 0x0003
RES_XML_START_NAMESPACE = 0x0100
RES_XML_END_NAMESPACE = 0x0101
RES_XML_START_ELEMENT = 0x0102
RES_XML_END_ELEMENT = 0x0103
RES_XML_RESOURCE_MAP = 0x0180

TYPE_REFERENCE = 0x01
TYPE_STRING = 0x03
TYPE_FLOAT = 0x04
TYPE_INT_DEC = 0x10
TYPE_INT_HEX = 0x11
TYPE_INT_BOOLEAN = 0x12

ATTR_MAP = {
    0x01010003: 'name',
    0x01010024: 'value',
    0x0101021b: 'versionCode',
    0x0101021c: 'versionName',
    0x0101020c: 'minSdkVersion',
    0x01010270: 'targetSdkVersion',
    0x01010271: 'maxSdkVersion',
    0x0101000f: 'debuggable',
    0x01010010: 'exported',
    0x010103af: 'roundIcon',
    0x0101000e: 'enabled',
    0x01010001: 'label',
    0x01010002: 'icon',
    0x01010000: 'theme',
    0x010102c1: 'requestLegacyExternalStorage',
    0x0101026f: 'usesCleartextTraffic',
    0x01010004: 'permission',
    0x0101000b: 'resource',
    0x01010006: 'authorities',
    0x01010018: 'grantUriPermissions',
    0x01010211: 'process',
    0x01010281: 'uses-permission-sdk-23',
    0x01010020: 'description',
    0x0101020e: 'allowBackup',
}


def u16(b, o): return struct.unpack_from('<H', b, o)[0]
def u32(b, o): return struct.unpack_from('<I', b, o)[0]


def parse_string_pool(data, off):
    typ, hsize, size = u16(data, off), u16(data, off + 2), u32(data, off + 4)
    count, style_count, flags, strings_start, styles_start = (
        u32(data, off + 8), u32(data, off + 12), u32(data, off + 16),
        u32(data, off + 20), u32(data, off + 24))
    utf8 = bool(flags & (1 << 8))
    offsets = [u32(data, off + 28 + 4 * i) for i in range(count)]
    base = off + strings_start
    out = []
    for so in offsets:
        p = base + so
        if utf8:
            # utf16 len (1-2 bytes), utf8 len (1-2 bytes), bytes
            n = data[p]
            p += 2 if (n & 0x80) else 1
            ln = data[p]
            if ln & 0x80:
                ln = ((ln & 0x7f) << 8) | data[p + 1]
                p += 2
            else:
                p += 1
            out.append(data[p:p + ln].decode('utf-8', 'replace'))
        else:
            ln = u16(data, p)
            p += 2
            if ln & 0x8000:
                ln = ((ln & 0x7fff) << 16) | u16(data, p)
                p += 2
            out.append(data[p:p + ln * 2].decode('utf-16-le', 'replace'))
    return out, size


class Parser:
    def __init__(self, data):
        self.data = data
        self.strings = []
        self.ns = {}
        self.out = io.StringIO()
        self.depth = 0

    def fmt_value(self, raw_idx, typ, data_val):
        if typ == TYPE_STRING:
            return self.strings[raw_idx] if raw_idx < len(self.strings) else '?'
        if typ == TYPE_INT_BOOLEAN:
            return 'true' if data_val else 'false'
        if typ == TYPE_INT_HEX:
            return hex(data_val)
        if typ == TYPE_REFERENCE:
            return f'@{data_val:#010x}'
        if typ == TYPE_FLOAT:
            return repr(struct.unpack('<f', struct.pack('<I', data_val))[0])
        return str(data_val if data_val < 0x80000000 else data_val - 0x100000000)

    def run(self):
        data = self.data
        off = u16(data, 2)
        if off < 8:
            off = 8
        first = True
        while off < len(data):
            typ = u16(data, off)
            hsize = u16(data, off + 2)
            size = u32(data, off + 4)
            if size == 0:
                break
            if typ == RES_STRING_POOL:
                self.strings, _ = parse_string_pool(data, off)
            elif typ == RES_XML_START_NAMESPACE:
                prefix_i, uri_i = u32(data, off + hsize), u32(data, off + hsize + 4)
                self.ns[uri_i] = self.strings[prefix_i]
            elif typ == RES_XML_START_ELEMENT:
                self.start_element(off, hsize)
            elif typ == RES_XML_END_ELEMENT:
                self.end_element(off, hsize)
            off += size
        return self.out.getvalue()

    def start_element(self, off, hsize):
        ext = off + hsize
        ns_i, name_i, attr_start, attr_size, attr_count = (
            u32(self.data, ext), u32(self.data, ext + 4), u16(self.data, ext + 8),
            u16(self.data, ext + 10), u16(self.data, ext + 12))
        name = self.strings[name_i]
        attrs = []
        p = ext + attr_start
        for _ in range(attr_count):
            a_ns, a_name, a_raw, a_typ, a_data = (
                u32(self.data, p), u32(self.data, p + 4), u32(self.data, p + 8),
                self.data[p + 15], u32(self.data, p + 16))
            p += attr_size
            aname = self.strings[a_name]
            if a_name in ATTR_MAP and not self.strings[a_name]:
                aname = ATTR_MAP[a_name]
            attrs.append((aname, self.fmt_value(a_raw, a_typ, a_data)))
        self.out.write('  ' * self.depth + '<' + name)
        for k, v in attrs:
            vv = v.replace('&', '&amp;').replace('"', '&quot;').replace('<', '&lt;')
            self.out.write(f' {k}="{vv}"')
        self.out.write('>\n')
        self.depth += 1

    def end_element(self, off, hsize):
        self.depth = max(0, self.depth - 1)


if __name__ == '__main__':
    path = sys.argv[1]
    with open(path, 'rb') as f:
        data = f.read()
    txt = Parser(data).run()
    out = sys.argv[2] if len(sys.argv) > 2 else None
    if out:
        with open(out, 'w', encoding='utf-8') as f:
            f.write(txt)
        print(f'wrote {out} ({len(txt)} chars)')
    else:
        print(txt)
