#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把最近一次真机全量扫的失败项拉平打印（只读，不碰设备）。

用法:
    python F:\\dps\\bench\\work\\show_sweep_fails.py            # 默认读 canonical 182_phone_sweep.json
    python F:\\dps\\bench\\work\\show_sweep_fails.py --json      # 连完整 effect JSON 一起打
    python F:\\dps\\bench\\work\\show_sweep_fails.py <某次带时间戳的 json>
"""
import io
import json
import os
import sys


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    json_mode = '--json' in sys.argv
    p = args[0] if args else r'docs_phone_sweep.json'
    d = json.load(io.open(p, encoding='utf-8'))
    print('文件: %s   ts=%s   device_locked=%s' %
          (os.path.basename(p), d.get('ts_human'), d.get('device_locked')))
    print('total=%s ok=%s env_skip=%s real_fail=%s no_real=%s no_reply=%s' %
          (d.get('total'), d.get('ok'), d.get('env_skip'), d.get('real_fail'),
           d.get('no_real'), d.get('no_reply')))
    rows = d.get('rows') or d.get('actions') or []
    bad = [r for r in rows if not (r.get('ok') and r.get('real') and r.get('success') is not False)]
    print('\n未生效 %d 条：' % len(bad))
    for r in bad:
        eff = r.get('effect') or {}
        print('\n— %-22s [%s]' % (r.get('action'), r.get('category') or '-'))
        print('   ok=%s real=%s success=%s%s' % (r.get('ok'), r.get('real'), r.get('success'),
                                                 '' if not r.get('frame') else
                                                 '  frame=%s' % r.get('frame')))
        if r.get('error'):
            print('   error  : %s' % str(r['error'])[:220])
        if r.get('why'):
            print('   why    : %s' % str(r['why'])[:220])
        if eff:
            print('   effect : %s' % (json.dumps(eff, ensure_ascii=False, indent=2)[:1800]
                                      if json_mode else
                                      json.dumps(eff, ensure_ascii=False)[:420]))
        if r.get('fallback') is not None or r.get('source'):
            print('   source : fallback=%s source=%s' % (r.get('fallback'), r.get('source')))
    return 0


if __name__ == '__main__':
    sys.exit(main())
