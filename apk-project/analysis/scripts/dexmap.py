#!/usr/bin/env python3
"""Dependency-free DEX parser: classes, methods, and per-method const-string refs.

Usage:
  python dexmap.py <classes.dex> [--filter SUBSTR] [--strings-of STRING] [--json out.json]
"""
import struct, sys, json, argparse

# ------------------------------------------------------------------ opcode sizes
SZ = {}
def _set(rng, n):
    for op in rng:
        SZ[op] = n

_set(range(0x00, 0x01), 1)          # nop (payload pseudo-ops handled specially)
_set(range(0x01, 0x04), None)
SZ[0x01] = 1; SZ[0x02] = 2; SZ[0x03] = 3
SZ[0x04] = 1; SZ[0x05] = 2; SZ[0x06] = 3
SZ[0x07] = 1; SZ[0x08] = 2; SZ[0x09] = 3
for op in range(0x0a, 0x0e): SZ[op] = 1
for op in range(0x0e, 0x12): SZ[op] = 1
SZ[0x12] = 1   # const/4
SZ[0x13] = 2; SZ[0x14] = 3; SZ[0x15] = 2
SZ[0x16] = 2; SZ[0x17] = 3; SZ[0x18] = 5; SZ[0x19] = 2
SZ[0x1a] = 2; SZ[0x1b] = 3; SZ[0x1c] = 2
SZ[0x1d] = 1; SZ[0x1e] = 1
SZ[0x1f] = 2; SZ[0x20] = 2; SZ[0x21] = 1; SZ[0x22] = 2; SZ[0x23] = 2
SZ[0x24] = 3; SZ[0x25] = 3
SZ[0x26] = 3; SZ[0x27] = 1
SZ[0x28] = 1; SZ[0x29] = 2; SZ[0x2a] = 3
SZ[0x2b] = 3; SZ[0x2c] = 3
for op in range(0x2d, 0x32): SZ[op] = 2
for op in range(0x32, 0x38): SZ[op] = 2
for op in range(0x38, 0x3e): SZ[op] = 2
for op in range(0x3e, 0x44): SZ[op] = 1
for op in range(0x44, 0x52): SZ[op] = 2
for op in range(0x52, 0x60): SZ[op] = 2
for op in range(0x60, 0x6e): SZ[op] = 2
for op in range(0x6e, 0x73): SZ[op] = 3
SZ[0x73] = 1
for op in range(0x74, 0x79): SZ[op] = 3
SZ[0x79] = 1; SZ[0x7a] = 1
for op in range(0x7b, 0x90): SZ[op] = 1
for op in range(0x90, 0xb0): SZ[op] = 2
for op in range(0xb0, 0xd0): SZ[op] = 1
for op in range(0xd0, 0xd8): SZ[op] = 2
for op in range(0xd8, 0xe3): SZ[op] = 2
for op in range(0xe3, 0xfa): SZ[op] = 1
SZ[0xfa] = 4; SZ[0xfb] = 4; SZ[0xfc] = 3; SZ[0xfd] = 3
SZ[0xfe] = 2; SZ[0xff] = 2


def u16(b, o): return struct.unpack_from('<H', b, o)[0]
def u32(b, o): return struct.unpack_from('<I', b, o)[0]


def uleb(b, o):
    result = 0; shift = 0
    while True:
        x = b[o]; o += 1
        result |= (x & 0x7f) << shift
        if not x & 0x80:
            return result, o
        shift += 7


def sleb(b, o):
    result = 0; shift = 0
    while True:
        x = b[o]; o += 1
        result |= (x & 0x7f) << shift
        shift += 7
        if not x & 0x80:
            if x & 0x40 and shift < 64:
                result |= -(1 << shift)
            return result, o


class Dex:
    def __init__(self, data):
        self.d = data
        self.strings = []
        n, off = struct.unpack_from('<II', data, 0x38)
        for i in range(n):
            so = u32(data, off + 4 * i)
            _, p = uleb(data, so)
            self.strings.append(data[p:data.index(b'\x00', p)].decode('utf-8', 'replace'))
        # types
        tn, toff = struct.unpack_from('<II', data, 0x40)
        self.types = [self.strings[u32(data, toff + 4 * i)] for i in range(tn)]
        # proto ids
        pn, poff = struct.unpack_from('<II', data, 0x48)
        self.protos = []
        for i in range(pn):
            base = poff + 12 * i
            shorty, ret_t, params_off = u32(data, base), u32(data, base + 4), u32(data, base + 8)
            params = []
            if params_off:
                cnt = u32(data, params_off)
                params = [self.types[u16(data, params_off + 4 + 2 * k)] for k in range(cnt)]
            self.protos.append((self.types[ret_t], params))
        # field ids
        fn, foff = struct.unpack_from('<II', data, 0x50)
        self.fields = []
        for i in range(fn):
            b = foff + 8 * i
            self.fields.append((self.types[u16(self.d, b)],
                                self.strings[u32(self.d, b + 4)],
                                self.types[u16(self.d, b + 2)]))
        # method ids
        mn, moff = struct.unpack_from('<II', data, 0x58)
        self.methods = []
        for i in range(mn):
            b = moff + 8 * i
            cls = self.types[u16(data, b)]
            proto = self.protos[u16(data, b + 2)]
            name = self.strings[u32(data, b + 4)]
            self.methods.append((cls, name, proto))

    def code_strings(self, code_off):
        """Return (list of const-string refs, list of invoked method indexes)."""
        if not code_off:
            return [], []
        d = self.d
        insns_size = u32(d, code_off + 12)
        pc = code_off + 16
        end = pc + insns_size * 2
        strs, calls = [], []
        while pc + 2 <= end:
            unit = u16(d, pc)
            op = unit & 0xff
            if op == 0x00 and unit in (0x0100, 0x0200, 0x0300):
                # payload pseudo-instructions
                ident = unit
                if ident == 0x0100:      # packed-switch payload
                    size = u16(d, pc + 2)
                    pc += (size * 2 + 4) * 2
                elif ident == 0x0200:    # sparse-switch payload
                    size = u16(d, pc + 2)
                    pc += (size * 4 + 2) * 2
                else:                    # fill-array-data payload
                    width = u16(d, pc + 2)
                    size = u32(d, pc + 4)
                    n = (size * width + 1) // 2
                    pc += (4 + n) * 2
                continue
            if op == 0x1a:
                idx = u16(d, pc + 2)
                if idx < len(self.strings):
                    strs.append(idx)
                pc += 4
                continue
            if op == 0x1b:
                idx = u32(d, pc + 2)
                if idx < len(self.strings):
                    strs.append(idx)
                pc += 6
                continue
            if 0x6e <= op <= 0x72 or op == 0xfc:
                idx = u16(d, pc + 2)
                if idx < len(self.methods):
                    calls.append(idx)
            n = SZ.get(op, 1) or 1
            pc += n * 2
        return strs, calls

    def classes(self):
        d = self.d
        cn, coff = struct.unpack_from('<II', d, 0x60)
        out = []
        for i in range(cn):
            b = coff + 32 * i
            cls_idx = u32(d, b)
            access = u32(d, b + 4)
            super_idx = u32(d, b + 8)
            ifaces_off = u32(d, b + 12)
            class_data_off = u32(d, b + 24)
            ifaces = []
            if ifaces_off:
                cnt = u32(d, ifaces_off)
                ifaces = [self.types[u16(d, ifaces_off + 4 + 2 * k)] for k in range(cnt)]
            info = {
                'name': self.types[cls_idx] if cls_idx < len(self.types) else '?',
                'access': access,
                'super': self.types[super_idx] if super_idx and super_idx < len(self.types) else None,
                'interfaces': ifaces,
                'methods': [],
                'fields': [],
            }
            if class_data_off:
                p = class_data_off
                sf, p = uleb(d, p); inf, p = uleb(d, p)
                dm, p = uleb(d, p); vm, p = uleb(d, p)
                acc = 0
                for _ in range(sf + inf):
                    diff, p = uleb(d, p); acc += diff
                    _, p = uleb(d, p)
                for group, count in ((0, dm), (1, vm)):
                    acc = 0
                    for _ in range(count):
                        diff, p = uleb(d, p); acc += diff
                        midx = acc
                        flags, p = uleb(d, p)
                        code_off, p = uleb(d, p)
                        if midx >= len(self.methods):
                            continue
                        cls, name, proto = self.methods[midx]
                    srefs, crefs = self.code_strings(code_off)
                    info['methods'].append({
                        'name': name,
                        'proto': {'ret': proto[0], 'params': proto[1]},
                        'access': flags,
                        'strings': sorted({self.strings[s] for s in srefs}),
                        'calls': sorted({'%s->%s' % (self.methods[c][0], self.methods[c][1])
                                         for c in crefs}),
                    })
            out.append(info)
        return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('dex')
    ap.add_argument('--filter', default=None, help='only classes containing this substring')
    ap.add_argument('--strings-of', default=None, help='classes whose methods reference this string')
    ap.add_argument('--json', default=None)
    ap.add_argument('--list-classes', action='store_true')
    a = ap.parse_args()
    dex = Dex(open(a.dex, 'rb').read())
    classes = dex.classes()
    if a.json:
        json.dump(classes, open(a.json, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
        print('json ->', a.json, len(classes), 'classes')
        return
    if a.strings_of:
        for c in classes:
            for m in c['methods']:
                if a.strings_of in m['strings']:
                    print(f"{c['name']}->{m['name']}{m['proto']}")
                    print('   strings:', [s for s in m['strings']][:40])
        return
    if a.list_classes:
        for c in classes:
            print(c['name'], len(c['methods']))
        return
    needle = (a.filter or '').lower()
    for c in classes:
        if needle and needle not in c['name'].lower():
            continue
        print('=' * 100)
        print(c['name'], 'extends', c['super'], c['interfaces'])
        for m in c['methods']:
            print(f"  {m['name']}({', '.join(m['proto']['params'])}) -> {m['proto']['ret']}")
            if m['strings']:
                print('     S:', m['strings'])


if __name__ == '__main__':
    main()
