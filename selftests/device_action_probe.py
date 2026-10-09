#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""真机单条指令探针：下发一条指令并打印**原始回帧**（排查"看着没生效"时必须看这个）。

为什么不用 phone_sweep_163.py：它按层判定，只打印 `effect`；像 `catAllViewSwitch` 那类
回 `capture` 帧的指令，`effect` 本来就是空的 —— 只看它的输出无法判断是"没做到"还是"判据读错字段"。

用法（口令从环境变量取，不落盘）：
    $env:REFC2_PASS='...'
    python F:\\dps\\bench\\work\\device_action_probe.py catAllViewSwitch
    python ... callAcc --p depth=10
    python ... showShortcuts --p pkg=com.miui.notes
    python ... inputSend --p text=REF-PROBE --json
"""
import argparse
import json
import os
import ssl
import sys
import time
import urllib.request

BASE = 'https://127.0.0.1:8793'
CTX = ssl._create_unverified_context()
DEV = 'primary-demo-0001'
TOK = [None]
sys.path.insert(0, r'agent')
import frames as _frames            # noqa: E402


def api(path, payload=None):
    req = urllib.request.Request(BASE + path, method='POST' if payload is not None else 'GET')
    req.add_header('Authorization', 'Bearer ' + (TOK[0] or ''))
    if payload is not None:
        req.data = json.dumps(payload).encode()
        req.add_header('Content-Type', 'application/json')
    return json.loads(urllib.request.urlopen(req, context=CTX, timeout=60).read().decode())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('action')
    ap.add_argument('--p', action='append', default=[],
                    help='key=value 形式给参数（可重复）')
    ap.add_argument('--wait', type=int, default=20)
    ap.add_argument('--json', action='store_true')
    ap.add_argument('--no-touch', action='store_true',
                    help='不预先收起通知栏/前台化（默认会做，避免"环境前提缺失"被误判成缺陷）')
    a = ap.parse_args()

    pw = os.environ.get('REFC2_PASS')
    if not pw:
        print('缺 REFC2_PASS 环境变量')
        return 2
    TOK[0] = api('/api/login', {'username': 'admin', 'password': pw}).get('token')
    if not TOK[0]:
        print('登录失败')
        return 2

    data = {}
    for kv in a.p:
        k, _, v = kv.partition('=')
        try:
            v = json.loads(v)
        except Exception:
            pass
        data[k] = v

    want = _frames.ACTION_EMIT.get(a.action) or a.action
    before = api('/api/device_frames?deviceId=%s&since=0' % DEV).get('total', 0)
    r = api('/api/command', {'deviceId': DEV, 'action': a.action, 'data': data})
    print('下发 %s data=%s -> ok=%s' % (a.action, json.dumps(data, ensure_ascii=False), r.get('ok')))

    got = None
    deadline = time.time() + a.wait
    while time.time() < deadline:
        rr = api('/api/device_frames?deviceId=%s&since=%d' % (DEV, before))
        for f in rr.get('frames', []):
            if f.get('action') in ('device_info', 'relayStatus'):
                continue
            if f.get('action') == want:
                got = f
                break
            got = got or f
        if got and got.get('action') == want:
            break
        time.sleep(0.4)

    if not got:
        print('（没有回帧 —— 设备端没回任何东西）')
        return 1
    d = got.get('data') or {}
    print('回帧名: %s（期望 %s）' % (got.get('action'), want))
    if a.json:
        print(json.dumps(d, ensure_ascii=False, indent=1)[:6000])
    else:
        keys = ('real', 'fallback', 'source', 'success', 'effect', 'nodeCount', 'pkg',
                'topPkg', 'via', 'error', 'why', 'count', 'imgLen', 'readback')
        for k in keys:
            if k in d:
                print('  %-10s %s' % (k, json.dumps(d[k], ensure_ascii=False)[:400]))
        extra = [k for k in d if k not in keys and k not in
                 ('deviceId', 'ts', 'timestamp', 'action', 'type', 'connected', 'paired',
                  'message', 'fromAdmin', 'name', 'cache', 'k', 'img', 'zip', 'ac', 'acc',
                  'elem', 'data', 'permissions', 'touches', 'deviceInfo', 'brand', 'model',
                  'sdk', 'screen', 'camera', 'sms', 'album', 'w', 'h', 'iw', 'ih', 'orient',
                  'title', 'text', 'bigText', 'subText', 'sender', 'body', 'touchCount',
                  'resolved', 'amount', 'currency', 'amountType', 'rawText', 'contextText',
                  'appName', 'fcmToken', 'icon', 'granted', 'zip')]
        if extra:
            print('  其它字段   %s' % ', '.join(extra))
    return 0


if __name__ == '__main__':
    sys.exit(main())
