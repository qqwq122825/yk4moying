#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把面板「A 包」步骤写死的模板版本从 1.3.1 换成 1.3.2（幂等）。

面板 A 步骤是硬编码的：
  - 展示卡片文案  v1.3.1 · A 包安装器 / VPN 隔离安装动画引导
  - 提交参数      templateId:"installer-1.3.1", apkVersion:"1.3.1"
改 dist 时这三处要一起换，否则面板还是会构建旧版 A 包。
"""
import glob
import sys

PAIRS = [
    ('templateId:"installer-1.3.1"', 'templateId:"installer-1.3.2"'),
    ('apkVersion:"1.3.1"', 'apkVersion:"1.3.2"'),
    ('"v1.3.1 · A 包安装器', '"v1.3.2 · A 包安装器'),
]


def main(root):
    changed = 0
    for f in sorted(glob.glob(root.rstrip('/') + '/index-*.js')):
        s = open(f, encoding='utf-8', errors='ignore').read()
        n = 0
        for a, b in PAIRS:
            if a in s:
                s = s.replace(a, b)
                n += 1
        if n:
            open(f, 'w', encoding='utf-8').write(s)
            print('patched %d 处 -> %s' % (n, f))
            changed += 1
    if not changed:
        print('无需修改（已是 1.3.2 或结构变化）')


if __name__ == '__main__':
    main(sys.argv[1] if len(sys.argv) > 1 else '.')
