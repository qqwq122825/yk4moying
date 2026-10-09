#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""离线契约闸门：163 条指令的**帧名与字段**逐条校验（不需要手机）。

为什么要它：`selftest_actions.py` 要活的服务端 + 真机（那是"真机口径"，是最终判据），
但设备不在时我改 `actions.py` 就没法立刻知道有没有把某条指令的帧名/字段改坏。
这个闸门用同一份契约（`contracts/agent_action_spec.json` 的 `frame_dictionary`）
在本机逐条调 `actions.execute()`，断言：
  ① 返回 (帧名, 帧内容)；
  ② 帧名在契约的帧字典里；
  ③ 帧内容含该帧的全部必需字段；
  ④ 不抛异常、不返回 None。
口径明确写着"契约口径"，不冒充真机实测。
"""
import io
import json
import os
import re
import sys

sys.path.insert(0, r'agent')
os.chdir(r'agent')
import actions  # noqa: E402
import dispatch  # noqa: E402
import frames  # noqa: E402

SPEC = json.load(io.open(r'contracts\agent_action_spec.json',
                         encoding='utf-8'))
FRAME_DICT = SPEC.get('frame_dictionary') or {}
# 本实现自己的帧表（含文档化的扩展帧，如 action_result）
IMPL_FRAMES = set(frames.FRAME_FIELDS.keys()) | {frames.ACK_FRAME}
ACTION_SPEC = {a['action']: a for a in SPEC.get('actions', [])}

# 与 selftest 一致的取参方式（没有样例数据的就给空 dict，走语义层）
VAL = {'x': 540, 'y': 1200, 'x1': 540, 'y1': 1600, 'x2': 540, 'y2': 800, 'duration': 200,
       'pagesize': 3, 'curpage': 1, 'maxWidth': 240, 'pkg': 'com.icbc', 'perm': 'CAMERA',
       'text': 'REF-PROBE', 'cmd': 'id', 'url': 'https://example.invalid/x', 'key': '3',
       'elem': {'name': 'IMG_0001.jpg'}, 'level': 128, 'points': [[1, 2], [3, 4]]}


def data_for(act):
    out = {}
    for name in (ACTION_SPEC.get(act, {}).get('params') or []):
        if name in VAL:
            out[name] = VAL[name]
    return out


def static_frame_scan():
    """静态扫描：把源码里 `frames.build('<帧名>'` 用到的帧名逐个对表。

    必要性：有些帧只在**真机路径**才发（例如 WebRTC 的 answer），本机调用不到，
    只靠逐条 execute() 是看不见它们的。
    """
    here = os.path.dirname(os.path.abspath(actions.__file__))
    names = set()
    for fn in sorted(os.listdir(here)):
        if not fn.endswith('.py'):
            continue
        src = io.open(os.path.join(here, fn), encoding='utf-8', errors='replace').read()
        names |= set(re.findall(r"frames\.build\(\s*'([A-Za-z_][A-Za-z0-9_]*)'", src))
        names |= set(re.findall(r"frames\.build\(\s*\"([A-Za-z_][A-Za-z0-9_]*)\"", src))
    unknown = sorted(n for n in names if n not in FRAME_DICT and n not in IMPL_FRAMES)
    print('静态扫描：源码里用到 %d 个帧名，两张表外的：%s' % (len(names), ', '.join(unknown) or '无'))
    for n in sorted(names):
        if n not in FRAME_DICT:
            print('   （扩展帧）%s' % n)
    return unknown


def main():
    acts = sorted(dispatch.ACTION_CATEGORY)
    bad = []
    ext_used = set()
    for act in acts:
        try:
            out = actions.execute(act, data_for(act), 'contract-probe')
        except Exception as e:
            bad.append((act, '抛异常 %s: %s' % (type(e).__name__, e)))
            continue
        if not out:
            bad.append((act, '返回 None'))
            continue
        name, payload = out[0], out[1] if len(out) > 1 else {}
        if name not in FRAME_DICT and name not in IMPL_FRAMES:
            bad.append((act, '帧名 %s 两张表里都没有（凭空造帧）' % name))
            continue
        if name in FRAME_DICT:
            need = set(FRAME_DICT.get(name) or [])
        else:
            ext_used.add(name)
            need = set(frames.FRAME_FIELDS.get(name) or []) | set(
                frames.ACK_FIELDS if name == frames.ACK_FRAME else [])
        miss = sorted(need - set((payload or {}).keys()))
        if miss:
            bad.append((act, '帧 %s 缺字段 %s' % (name, ','.join(miss))))

    print('契约口径：%d 条指令逐条校验（帧名 + 必需字段）' % len(acts))
    print('契约帧字典：%d 类（来自协议分析 上行帧构造器）｜实现帧表：%d 类'
          % (len(FRAME_DICT), len(IMPL_FRAMES)))
    print('用到的扩展帧（本实现约定，已文档化）：%s' % (', '.join(sorted(ext_used)) or '无'))
    if bad:
        print('\n不合规 %d 条：' % len(bad))
        for act, why in bad:
            print('  %-24s %s' % (act, why))
        print('\n（口径说明：这是本机契约校验，不等于真机实测；真机口径见 selftest_actions.py）')
        return 1
    unknown = static_frame_scan()
    if unknown:
        print('\n静态扫描发现两张表外的帧名：%s' % ', '.join(unknown))
        return 1
    print('\n通过：163 条全部给出契约内的帧名，且含该帧全部必需字段')
    print('      静态扫描也通过：源码里的帧名都在契约表或实现表里')
    return 0


if __name__ == '__main__':
    sys.exit(main())
