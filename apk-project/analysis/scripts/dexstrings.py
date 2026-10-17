#!/usr/bin/env python3
"""Extract the string_id table from a DEX file (no deps)."""
import struct, sys, io


def uleb128(b, o):
    result = 0
    shift = 0
    while True:
        byte = b[o]
        o += 1
        result |= (byte & 0x7f) << shift
        if not (byte & 0x80):
            break
        shift += 7
    return result, o


def parse_dex_strings(data):
    if data[:4] not in (b'dex\n', b'dey\n'):
        raise SystemExit('not a dex')
    string_ids_size, string_ids_off = struct.unpack_from('<II', data, 0x38)
    strings = []
    for i in range(string_ids_size):
        off = struct.unpack_from('<I', data, string_ids_off + 4 * i)[0]
        _, p = uleb128(data, off)          # utf16 length
        end = data.index(b'\x00', p)
        raw = data[p:end]
        try:
            s = raw.decode('utf-8')
        except UnicodeDecodeError:
            s = raw.decode('utf-8', 'replace')
        strings.append(s)
    return strings


if __name__ == '__main__':
    path, out = sys.argv[1], sys.argv[2]
    with open(path, 'rb') as f:
        data = f.read()
    ss = parse_dex_strings(data)
    with open(out, 'w', encoding='utf-8', errors='replace') as f:
        for s in ss:
            f.write(s.replace('\n', '\\n').replace('\r', '\\r') + '\n')
    print(f'{len(ss)} strings -> {out}')
