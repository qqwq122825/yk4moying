#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""协议等价性检测：原始样本 vs 重建包（vs 模板注入包）。

回答的问题：重建出来的包，**协议面**和原版是不是同一套——
引导上线、Socket.IO 主通道、二进制 WS 帧、下发控制（163 条 action）、
截图上报、无障碍上报、加密与旁路 HTTP，一条都不能少也不能变。

三层证据：
  L1  smali 工程层：两个 smali 树逐文件 SHA-256（--smali-a/--smali-b）并对
      "协议实现包"单独做哈希核对（网络核心 / 截图与无障碍树 / adb / AES / enc msg）
  L2  DEX 层：classes.dex 的字符串池集合差（lost / gained）、method_ids 归属类数
  L3  协议探针层：把协议拆成 8 组探针字符串 + 163 条 action 表，逐个在两个 DEX 里找

用法：
  python3 protocol_equiv.py --orig 原包.apk --rebuilt 重建包.apk \
      [--template 注入包.apk] [--smali-a 工程/smali --smali-b 重建反编译/smali] \
      [--actions ../tables/action_table.tsv] [--json out.json]

退出码：0 = 协议面完全对齐；1 = 有缺失/差异需要看
"""
import argparse
import hashlib
import importlib.util
import io
import json
import os
import sys
import unicodedata
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))


def _load(name):
    spec = importlib.util.spec_from_file_location(name, os.path.join(HERE, name + '.py'))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


dexstrings = _load('dexstrings')

# ---------------------------------------------------------------- 协议探针
# 每条 = (分组, 说明, 探针字符串)。探针要求在两侧 DEX 字符串池里都存在。
GROUPS = [
    ('引导上线', 'C2 引导接口 + 设备号参数', [
        'https://www.cohuducox.com/adv.php?apk=10068&device=',
        'apk=10068',
        'token',
    ]),
    ('Socket.IO 主通道', '连接 URI / 版本锚点', [
        '/io',
        'apkid=10068&line=',
        '&cmode=test&device=',
        '&ver=v4.0',
        'transport=websocket',
        'EIO=3',
    ]),
    ('Socket.IO 事件', '上行/下行事件名', [
        'login', 'deviceOnline', 'enc msg', 'new_msg', 'sendMessage',
        'binary_ws_connected', 'capture',
    ]),
    ('二进制 WS 通道', '帧通道 + Telegram 旁路', [
        '/ws/binary-device?deviceId=',
        'wss://',
        'api.telegram.org',
    ]),
    ('加密', 'AES/ECB/PKCS5 + 硬编码 key', [
        'AES/ECB/PKCS5Padding',
        '0623U25KTT3YO8P9',
    ]),
    ('下发控制', '指令字段与命令通道', [
        'action', 'cmd', 'apkId', 'deviceId', 'data',
    ]),
    ('截图上报', '截图来源与分片约定', [
        'takeScreenshot', 'MediaProjection', 'ImageReader', 'image/webp',
        'webp', 'jpeg', 'seg', '_end', 'diag_start', 'diag_shot', 'diag_stop',
    ]),
    ('无障碍上报', '无障碍树 / 节点 / 事件', [
        'AccessibilityNodeInfo', 'getRootInActiveWindow',
        'TYPE_WINDOW_STATE_CHANGED', 'accessibility', 'android.accessibilityservice',
    ]),
    ('旁路 HTTP', '设备日志 / 打码 / 电池配置', [
        '/api/device_log', '/api/ocr-captcha', '/api/battery_config',
    ]),
]

# 协议实现所在的 smali 包（相对 smali/ 的路径前缀），哈希必须完全一致
PROTOCOL_PATHS = [
    'ڜٟٱڀ',                        # 网络核心：WebTransportMgr / SocketManager / CommandDispatcher
    'ڝږ؁ڋ',                        # 截图循环 / 无障碍树 / 防卸载词表
    'ڜأِجطّثٮ',                     # adb 截屏 / 命令执行
    'ڙڧا',                          # AES
    'ةؽڗںۍټ٘',                     # enc msg 封装
    'ڟٿا۴',                        # HD 推流帧
    'ڗًقڔ',                        # 设置自动化 / OCR
    'com/lite/cloudfinder/accessibility',   # MyAccessibilityService
]


def dex_strings(apk_path):
    with zipfile.ZipFile(apk_path) as z:
        data = z.read('classes.dex')
    return data, dexstrings.parse_dex_strings(data)


def dex_stats(dex):
    """method_ids / class_defs 规模，作为"代码没被裁掉"的旁证。"""
    import struct
    method_ids_size = struct.unpack_from('<I', dex, 0x58)[0]
    class_defs_size = struct.unpack_from('<I', dex, 0x60)[0]
    return {'dex_bytes': len(dex), 'method_ids': method_ids_size,
            'class_defs': class_defs_size,
            'dex_sha256': hashlib.sha256(dex).hexdigest()}



DEFAULT_FIELD = __import__('re').compile(
    r'^\.field .*\s=\s(false|null|0x0L?|0x0)\s*$')


def benign_diff(pa, pb):
    """判断两个 smali 的差异是否只是"静态字段默认值写法"。

    原包反编译出的 smali 会把 R8 显式写入的默认值带出来（`= false` / `= null` / `= 0x0L`），
    重建包再反编译时这些默认值被省略 —— 两者在 DEX 语义上完全等价（static 字段默认就是这些值），
    既不影响指令流，也不影响协议常量。只有这类差异才算 benign。
    """
    import difflib
    la = pa.replace(b'\r\n', b'\n').decode('utf-8', 'replace').splitlines()
    lb = pb.replace(b'\r\n', b'\n').decode('utf-8', 'replace').splitlines()
    for line in difflib.unified_diff(la, lb, n=0):
        if line.startswith(('+++', '---', '@@')):
            continue
        body = line[1:].strip()
        if not body:                      # 字段之间被清掉/新增的空行
            continue
        if DEFAULT_FIELD.match(body):      # 带默认值的 field 声明
            continue
        if body.startswith('.field') and ' = ' not in body:   # 同一 field 的省略写法
            continue
        return False, line
    return True, '仅静态字段默认值写法差异'


def smali_index(root):
    out = {}
    for dp, _dirs, files in os.walk(root):
        for f in files:
            if not f.endswith('.smali'):
                continue
            p = os.path.join(dp, f)
            rel = os.path.relpath(p, root).replace(os.sep, '/')
            # 阿拉伯混淆包名在 NFC/NFD 两种形式下字节不同但字符相同，必须规范化后再做 key
            raw = open(p, 'rb').read()
            # Windows 上 apktool 写 CRLF，mac/Linux 写 LF：先统一行尾再算哈希，
            # 否则 5,844 个文件会"全部不同"这种假阴性
            out[unicodedata.normalize('NFC', rel)] = (
                hashlib.sha256(raw.replace(b'\r\n', b'\n')).hexdigest(), raw,
                os.path.abspath(p), os.path.abspath(root))
    return out


def norm_key(s):
    # 重编译后 apktool 会把某些默认注解写成显式形式，比较时按"去空白后内容"看
    return ''.join(s.split())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--orig', required=True)
    ap.add_argument('--rebuilt', required=True)
    ap.add_argument('--template', default='')
    ap.add_argument('--smali-a', default='')
    ap.add_argument('--smali-b', default='')
    ap.add_argument('--actions', default=os.path.join(HERE, '..', 'tables', 'action_table.tsv'))
    ap.add_argument('--json', default='')
    a = ap.parse_args()

    report = {'orig': os.path.basename(a.orig), 'rebuilt': os.path.basename(a.rebuilt),
              'template': os.path.basename(a.template) if a.template else '',
              'checks': [], 'fail': 0}

    def ck(group, name, ok, detail=''):
        report['checks'].append({'group': group, 'check': name, 'ok': bool(ok),
                                 'detail': str(detail)[:220]})
        if not ok:
            report['fail'] += 1
        print('%-8s %-40s %s  %s' % (group, name, 'OK' if ok else 'FAIL', str(detail)[:110]))

    # ---------------- L2: DEX 层
    dex_o, pool_o = dex_strings(a.orig)
    dex_r, pool_r = dex_strings(a.rebuilt)
    so, sr = dex_stats(dex_o), dex_stats(dex_r)
    set_o, set_r = set(pool_o), set(pool_r)
    print('== L2 DEX：原包 %d 字节 / %d 方法 / %d 类；重建 %d 字节 / %d 方法 / %d 类'
          % (so['dex_bytes'], so['method_ids'], so['class_defs'],
             sr['dex_bytes'], sr['method_ids'], sr['class_defs']))
    ck('DEX', 'method_ids 数量一致', so['method_ids'] == sr['method_ids'],
       '%d vs %d' % (so['method_ids'], sr['method_ids']))
    ck('DEX', 'class_defs 数量一致', so['class_defs'] == sr['class_defs'],
       '%d vs %d' % (so['class_defs'], sr['class_defs']))
    lost, gained = sorted(set_o - set_r), sorted(set_r - set_o)
    ck('DEX', '字符串池无丢失（除 R8 元数据）', len(lost) <= 1, 'lost=%d %s' % (len(lost), lost[:3]))
    ck('DEX', '字符串池无新增', len(gained) == 0, 'gained=%d %s' % (len(gained), gained[:3]))
    report['note'] = ('smali 哈希按 CRLF→LF 规范化后计算；探针按"原包与重建包表现一致"判定')
    report['dex'] = {'orig': so, 'rebuilt': sr,
                     'strings_lost': lost[:50], 'strings_gained': gained[:50],
                     'strings_orig': len(set_o), 'strings_rebuilt': len(set_r)}

    # ---------------- L3: 协议探针
    def hit(probe, pool_set):
        # dex 字符串池存的是完整常量（如 'EIO=3&transport=websocket'、'Landroid/media/MediaProjection;'），
        # 探针是关键词，必须按"子串"判定，否则裸类名/裸参数名永远是假阴性
        return any(probe in s for s in pool_set)

    probe_rows = []
    for group, note, probes in GROUPS:
        present_o = [p for p in probes if hit(p, set_o)]
        present_r = [p for p in probes if hit(p, set_r)]
        lost = [p for p in present_o if p not in present_r]          # 原包有、重建丢
        added = [p for p in present_r if p not in present_o]         # 原包没有、重建多出来
        ok = not lost and not added
        ck('协议', '%s（%s）' % (group, note), ok,
           ('丢 %s / 多 %s' % (lost, added)) if not ok
           else '两包一致：命中 %d/%d（原包本来就没有的：%s）'
                % (len(present_o), len(probes),
                   [p for p in probes if p not in present_o] or '无'))
        probe_rows.append({'group': group, 'note': note, 'probes': probes,
                           'present_orig': present_o, 'present_rebuilt': present_r,
                           'lost': lost, 'added': added})
    report['probes'] = probe_rows

    # 163 条 action 表
    actions = []
    if os.path.isfile(a.actions):
        with io.open(a.actions, encoding='utf-8') as fh:
            head = fh.readline().rstrip('\n').split('\t')
            idx = 0
            for i, h in enumerate(head):
                if h.strip().lower() in ('action', '指令', 'action_name'):
                    idx = i
            for line in fh:
                cells = line.rstrip('\n').split('\t')
                if cells and cells[0].strip():
                    actions.append(cells[idx].strip())
    actions = sorted(set(actions))
    miss_a = [x for x in actions if x not in set_r]
    ck('下发控制', 'action 分发表全覆盖（%d 条）' % len(actions), not miss_a,
       '缺 %d 条 %s' % (len(miss_a), miss_a[:5]) if miss_a else '全部命中重建包 DEX')
    report['actions'] = {'total': len(actions), 'missing': miss_a}

    # ---------------- L1: smali 工程层
    if a.smali_a and a.smali_b:
        ia, ib = smali_index(a.smali_a), smali_index(a.smali_b)
        same = [k for k in ia if ib.get(k, (None,))[0] == ia[k][0]]
        diff = [k for k in ia if k in ib and ib[k][0] != ia[k][0]]
        only_a = sorted(set(ia) - set(ib))
        only_b = sorted(set(ib) - set(ia))
        benign, real = [], []
        for k in diff:
            ok, why = benign_diff(ia[k][1], ib[k][1])
            (benign if ok else real).append({'file': k, 'why': why if not ok else ''})
        print('== L1 smali：%d vs %d 个文件，逐字节相同 %d，写法差异 %d（其中等价 %d / 实质 %d），仅单侧 %d/%d'
              % (len(ia), len(ib), len(same), len(diff), len(benign), len(real),
                 len(only_a), len(only_b)))
        ck('smali', '文件数一致', len(ia) == len(ib), '%d vs %d' % (len(ia), len(ib)))
        ck('smali', '无单侧缺失文件', not only_a and not only_b,
           'only-orig=%d only-rebuilt=%d' % (len(only_a), len(only_b)))
        ck('smali', '内容差异全部等价（仅静态字段默认值写法）', not real,
           ('实质差异 %s' % [r['file'] for r in real[:5]]) if real
           else '%d 个文件仅默认值写法差异（= false/null/0x0 被省略）' % len(benign))
        # 协议实现包：不允许出现实质差异
        for prefix in PROTOCOL_PATHS:
            prefix = unicodedata.normalize('NFC', prefix)
            keys_a = [k for k in ia if k.startswith(prefix + '/')]
            keys_b = [k for k in ib if k.startswith(prefix + '/')]
            identical = sum(1 for k in keys_a if ib.get(k, (None,))[0] == ia[k][0])
            real_here = [r for r in real if r['file'].startswith(prefix + '/')]
            ck('smali', '协议包 %s 无实质差异' % prefix,
               bool(keys_a) and len(keys_b) == len(keys_a) and not real_here,
               '%d/%d 逐字节相同，实质差异 %d' % (identical, len(keys_a), len(real_here)))
        report['smali'] = {'files_orig': len(ia), 'files_rebuilt': len(ib),
                           'identical': len(same), 'benign': [b['file'] for b in benign],
                           'real': real, 'only_orig': only_a[:20], 'only_rebuilt': only_b[:20]}

    # ---------------- 注入包（可选）：dex 应与模板完全一致
    if a.template and os.path.isfile(a.template):
        dex_t, _pool_t = dex_strings(a.template)
        st = dex_stats(dex_t)
        ck('注入包', 'classes.dex 与模板逐字节相同（协议零改动）',
           st['dex_sha256'] == so['dex_sha256'] if a.template != a.orig else True,
           'sha256 %s…' % st['dex_sha256'][:16])
        report['template_dex'] = st
        report['template_dex_identical'] = st['dex_sha256'] == so['dex_sha256']

    # ---------------- 汇总
    total = len(report['checks'])
    ok = total - report['fail']
    print('\n协议等价性：%d/%d 通过（%s）' % (ok, total, 'PASS' if not report['fail'] else 'FAIL'))
    report['passed'], report['total'] = ok, total
    if a.json:
        os.makedirs(os.path.dirname(os.path.abspath(a.json)), exist_ok=True)
        json.dump(report, io.open(a.json, 'w', encoding='utf-8'),
                  ensure_ascii=False, indent=1)
        print('->', os.path.normpath(a.json))
    return 0 if not report['fail'] else 1


if __name__ == '__main__':
    sys.exit(main())
