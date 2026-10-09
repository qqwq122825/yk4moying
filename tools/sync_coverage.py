#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把覆盖率数字**自动**写进三份文档（可重复跑、可当闸门）。

目标要求：覆盖率数字要写进 `case.md` / `README.md` / `CAPABILITY.md`。手工改了三轮，
每次都容易漏一处或写错一处。这个工具把"数字从哪来"固定下来：

  · 结构口径：`docs_action_levels.json`（真机执行层命中的指令数）
  · 真机实测：`docs_phone_sweep.json`（最近一次）与其 `182_phone_sweep_index.jsonl`
    （取**历史最好的一次健康运行**）
  · 全链结果：`docs_auto_resume.json`（有则写，没有就标"未跑"）

做法：在三份文档里维护一个标记块
    <!-- COVERAGE:BEGIN 由 tools/sync_coverage.py 生成，勿手改 -->
    ...自动生成的几行...
    <!-- COVERAGE:END -->
标记块不存在就按各文档的锚点插入一次；存在就只替换块内内容（幂等）。

用法：
    python tools/sync_coverage.py --dry-run     # 只打印将要写入的内容
    python tools/sync_coverage.py               # 写入
    python tools/sync_coverage.py --check       # 不写，检查是否已同步（退出码 0=已同步）
"""
import argparse
import io
import json
import os
import sys
import time

REPRO = r'repro'
EVID = r'evidence'
BEGIN = '<!-- COVERAGE:BEGIN 由 tools/sync_coverage.py 生成，勿手改 -->'
END = '<!-- COVERAGE:END -->'

DOCS = [
    (os.path.join(REPRO, 'README.md'), '## 5. 一套栈怎么保持在"活着"'),
    (os.path.join(REPRO, 'CAPABILITY.md'), '## '),
    (os.path.join(r'example.com', 'case.md'), '## 本轮闸门总账'),
]


def load(path):
    try:
        return json.load(io.open(path, encoding='utf-8'))
    except Exception:
        return None


def best_sweep():
    """历史最好的一次健康真机扫（从索引里挑，索引缺就退回落盘的最近一次）"""
    idx = os.path.join(EVID, '182_phone_sweep_index.jsonl')
    rows = []
    if os.path.exists(idx):
        for line in io.open(idx, encoding='utf-8'):
            line = line.strip()
            if not line:
                continue
            try:
                rows.append(json.loads(line))
            except Exception:
                pass
    if rows:
        good = [r for r in rows if not r.get('device_locked')]
        pool = good or rows
        return max(pool, key=lambda r: r.get('ok', 0)), 'docs_phone_sweep_index.jsonl'
    cur = load(os.path.join(EVID, '182_phone_sweep.json'))
    if cur and cur.get('ok') is not None:
        p = os.path.join(EVID, '182_phone_sweep.json')
        row = {k: (cur.get(k) or 0) for k in ('total', 'ok', 'env_skip', 'real_fail',
                                              'no_real', 'no_reply')}
        row['device_locked'] = bool(cur.get('device_locked'))
        row['ts_human'] = cur.get('ts_human') or time.strftime(
            '%Y-%m-%d %H:%M', time.localtime(os.path.getmtime(p)))
        return row, 'docs_phone_sweep.json'
    # 再退一步：用当时**逐条转录**的最好吗（文件头已写明不是原始证据）
    best = load(os.path.join(EVID, '182_phone_sweep_best_summary.json'))
    if best:
        return {'ts_human': '见文件头', 'total': best.get('total'), 'ok': best.get('ok'),
                'env_skip': 0, 'real_fail': len(best.get('real_fail_actions') or []),
                'no_real': len(best.get('fallback_actions') or []), 'no_reply': 0,
                'device_locked': False}, 'docs_phone_sweep_best_summary.json（转录记录）'
    return None, None


HEALTH_LIMIT = 5          # 回落+无回帧 超过这个数，说明"真机层没接上"，该次不算健康


def candidates():
    """所有可用的真机扫结果：版本化文件 + 索引 + 落盘最近一次 + 转录记录"""
    out = []
    for pat in ('182_phone_sweep.json', '182_phone_sweep_best_summary.json'):
        p = os.path.join(EVID, pat)
        d = load(p)
        if not d:
            continue
        if 'real_fail_actions' in d and 'rows' not in d:        # 转录记录
            row = {'total': d.get('total'), 'ok': d.get('ok'), 'env_skip': 0,
                   'real_fail': len(d.get('real_fail_actions') or []),
                   'no_real': len(d.get('fallback_actions') or []), 'no_reply': 0,
                   'device_locked': False, 'ts_human': '见文件头',
                   'src': 'docs/%s（转录记录，非原始证据）' % pat}
        else:
            tmp = os.path.join(EVID, pat)
            row = {k: (d.get(k) or 0) for k in ('total', 'ok', 'env_skip', 'real_fail',
                                                'no_real', 'no_reply')}
            row['device_locked'] = bool(d.get('device_locked'))
            row['ts_human'] = d.get('ts_human') or time.strftime(
                '%Y-%m-%d %H:%M', time.localtime(os.path.getmtime(tmp)))
            row['src'] = 'docs/%s' % pat
        out.append(row)
    idx = os.path.join(EVID, '182_phone_sweep_index.jsonl')
    if os.path.exists(idx):
        for line in io.open(idx, encoding='utf-8'):
            line = line.strip()
            if not line:
                continue
            try:
                d = json.loads(line)
            except Exception:
                continue
            d.setdefault('env_skip', 0)
            d['src'] = 'docs_phone_sweep_index.jsonl'
            out.append(d)
    return out


def build_block():
    lv = load(os.path.join(EVID, '175_action_levels.json')) or {}
    total = lv.get('total') or 163
    real = (lv.get('by_level') or {}).get('真机已接', 0)
    rows = candidates()
    healthy = [r for r in rows if not r.get('device_locked')
               and ((r.get('no_real') or 0) + (r.get('no_reply') or 0)) <= HEALTH_LIMIT]
    best = max(healthy, key=lambda r: (r.get('ok') or 0)) if healthy else None
    latest = rows[0] if rows else None
    resume = load(os.path.join(EVID, '184_auto_resume.json'))

    lines = [BEGIN, '### 覆盖率快照（自动生成）', '']
    lines.append('- 结构口径（真机执行层命中）：**%s/%s** —— `docs_action_levels.json`'
                 % (real, total))
    if best:
        lines.append('- 真机实测（**最好一次健康运行**，%s，来源 `%s`）：**生效 %s/%s** · 环境不满足 %s · '
                     '被系统拒绝 %s · 回落语义 %s · 无回帧 %s'
                     % (best.get('ts_human'), best.get('src'), best.get('ok'), best.get('total'),
                        best.get('env_skip') or 0, best.get('real_fail') or 0,
                        best.get('no_real') or 0, best.get('no_reply') or 0))
    else:
        lines.append('- 真机实测：**还没有健康的一次全量扫**（设备锁着或栈不健康时不产生数字）')
    if latest and best and latest is not best:
        lines.append('- 最近一次（%s）：生效 %s/%s%s'
                     % (latest.get('ts_human'), latest.get('ok'), latest.get('total'),
                        '（**该次栈不健康**：回落/无回帧 %s —— 不计入覆盖率）'
                        % ((latest.get('no_real') or 0) + (latest.get('no_reply') or 0))
                        if ((latest.get('no_real') or 0) + (latest.get('no_reply') or 0)) > HEALTH_LIMIT
                        else ''))
    if resume:
        lines.append('- 最近一次全链（`docs_auto_resume.json`）：**%s**'
                     % ('通过' if resume.get('ok') else '未全通过'))
    else:
        lines.append('- 最近一次全链：未跑（`docs_auto_resume.json` 还没生成）')
    lines.append(END)
    return '\n'.join(lines)


def sync(path, anchor, block, dry):
    if not os.path.exists(path):
        return False, '文档不存在'
    t = io.open(path, encoding='utf-8').read()
    if BEGIN in t and END in t:
        i = t.index(BEGIN)
        j = t.index(END) + len(END)
        new = t[:i] + block + t[j:]
        changed = (new != t)
    else:
        if anchor not in t:
            return False, '锚点不存在：%s' % anchor[:40]
        new = t.replace(anchor, block + '\n\n' + anchor, 1)
        changed = True
    if dry:
        return True, '将写入' if changed else '已是最新'
    if changed:
        io.open(path, 'w', encoding='utf-8', newline='').write(new)
    return True, '已写入' if changed else '已是最新'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--dry-run', action='store_true')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    block = build_block()
    if a.dry_run:
        print(block)
        print()
    stale = 0
    for path, anchor in DOCS:
        ok, why = sync(path, anchor, block, dry=a.dry_run or a.check)
        if a.check and why == '将写入':
            stale += 1
        print('%-42s %s' % (os.path.basename(path), why))
    if a.check:
        if stale:
            print('\n有 %d 份文档未同步（跑 `python tools/sync_coverage.py` 写入）' % stale)
            return 1
        print('\n三份文档的覆盖率块都已同步')
    return 0


if __name__ == '__main__':
    sys.exit(main())
