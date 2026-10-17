#!/usr/bin/env python3
"""Compare original vs rebuilt APK: zip entries, dex class/method sets, string sets.

Usage: verify_rebuild.py original.apk rebuilt.apk
"""
import sys, json, zipfile, hashlib, subprocess, os, tempfile
import importlib.util

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
spec = importlib.util.spec_from_file_location('dexmap', os.path.join(BASE, 'scripts', 'dexmap.py'))
dexmap = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dexmap)


def apk_entries(path):
    with zipfile.ZipFile(path) as z:
        return {i.filename: i.file_size for i in z.infolist()}


def dex_of(apk):
    with zipfile.ZipFile(apk) as z:
        return z.read('classes.dex')


def summarize(dex_bytes):
    """Authoritative per-class method inventory straight from method_ids.

    method_id already carries the *defining* class_idx, so this avoids relying on
    class_data parsing/attribution (dexlib2 re-encoding can reorder class_data).
    """
    d = dexmap.Dex(dex_bytes)
    cmap = {}
    for cls, name, proto in d.methods:
        sig = '%s(%s)%s' % (name, ','.join(proto[1]), proto[0])
        cmap.setdefault(cls, set()).add(sig)
    return cmap, set(d.strings)


def main():
    orig, rebuilt = sys.argv[1], sys.argv[2]
    eo, er = apk_entries(orig), apk_entries(rebuilt)
    only_o = sorted(set(eo) - set(er))
    only_r = sorted(set(er) - set(eo))
    print('== ZIP entries: original=%d rebuilt=%d' % (len(eo), len(er)))
    print('   only-in-original:', only_o[:20], '...' if len(only_o) > 20 else '')
    print('   only-in-rebuilt :', only_r[:20], '...' if len(only_r) > 20 else '')

    co, so = summarize(dex_of(orig))
    cr, sr = summarize(dex_of(rebuilt))
    print('== DEX method-owner classes (method_ids authority, incl. external refs): original=%d rebuilt=%d' % (len(co), len(cr)))
    missing = sorted(set(co) - set(cr))
    extra = sorted(set(cr) - set(co))
    print('   classes missing in rebuilt:', len(missing), missing[:5])
    print('   classes extra in rebuilt  :', len(extra), extra[:5])

    sig_diff, same = [], 0
    for name in sorted(set(co) & set(cr)):
        if co[name] == cr[name]:
            same += 1
        else:
            sig_diff.append((name, sorted(co[name] - cr[name])[:5], sorted(cr[name] - co[name])[:5]))
    print('   classes with identical method-reference sets: %d / %d' % (same, len(set(co) & set(cr))))
    print('   classes with method-signature diffs: %d' % len(sig_diff))
    for n, a, b in sig_diff[:10]:
        print('     ', n, 'lost:', a, 'gained:', b)

    print('== string pool: original=%d rebuilt=%d' % (len(so), len(sr)))
    print('   strings lost   :', len(so - sr), sorted(so - sr)[:10])
    print('   strings gained :', len(sr - so), sorted(sr - so)[:10])

    # protocol constant survival check
    constants = [
        'wss://', '/ws/binary-device?deviceId=', '/api/device_log', '/api/ocr-captcha',
        '/api/battery_config?brand=', 'https://www.cohuducox.com/adv.php?apk=10068&device=',
        'https://cohuducox.com/api/ocr-captcha', '0623U25KTT3YO8P9', 'AES/ECB/PKCS5Padding',
        'apkid=10068&line=', '&cmode=test&device=', '&ver=v4.0', 'enc msg', 'new_msg',
        'deviceOnline', 'binary_ws_connected', '/io', 'sendMessage', '8798681434',
        'api.telegram.org', 'action', 'apkId', 'deviceId',
    ]
    print('== protocol constants present in rebuilt dex (substring over string pool):')
    ok = True
    for c in constants:
        present = any(c in s for s in sr)
        ok = ok and present
        print('   %-52s %s' % (c, 'OK' if present else 'MISSING'))
    print('== RESULT:', 'PASS' if (not missing and not sig_diff and ok) else 'DIFFERENCES FOUND')


if __name__ == '__main__':
    main()
