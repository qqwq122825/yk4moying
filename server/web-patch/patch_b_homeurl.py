#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""给面板 B 包步骤加回「首页地址」输入（直接改 dist bundle，幂等）。

背景：新版面板删掉了 B 包的首页输入（只留 A 包的），但第三方 A 包需要从 B 包里
读首页地址，所以 B 构建时必须能填。

做三件事：
  1. 在 B 组件里加 homeUrl 状态
  2. 在「批次」和「包名」之间插入「首页地址（选填）」输入框
  3. 提交 /api/build 的 body 里带上 homeUrl

用法：python3 server/web-patch/patch_b_homeurl.py <web/panel/assets/index-*.js>
改完记得把 index.html 的 ?v= 改一下强制刷新缓存。
"""
import glob
import os
import sys


def patch(path):
    s = open(path, encoding='utf-8', errors='ignore').read()
    if 'setHomeUrl' in s and 'homeUrl:homeUrl.trim()' in s:
        print('already patched:', os.path.basename(path))
        return False
    a1 = 'const [packageName,setPackageName]=(0,b.useState)("");'
    if a1 not in s:
        raise SystemExit('找不到 packageName 状态声明，dist 结构已变')
    s = s.replace(a1, a1 + '\nconst [homeUrl,setHomeUrl]=(0,b.useState)("");', 1)

    j = s.find('field("包名（留空自动生成）"', s.find('field("批次（选填）"'))
    if j < 0:
        raise SystemExit('找不到包名字段，dist 结构已变')
    s = (s[:j] +
         'field("首页地址（选填）",input({value:homeUrl,onChange:event=>setHomeUrl(event.target.value),'
         'required:false,placeholder:"https://example.com/"})),' + s[j:])

    a3 = 'body:JSON.stringify({appName:appName.trim(),packageName,'
    if a3 not in s:
        raise SystemExit('找不到 B 包提交体，dist 结构已变')
    s = s.replace(a3, 'body:JSON.stringify({appName:appName.trim(),packageName,homeUrl:homeUrl.trim(),', 1)
    open(path, 'w', encoding='utf-8').write(s)
    print('patched:', os.path.basename(path))
    return True


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else '.'
    files = sorted(glob.glob(os.path.join(root, 'index-*.js')))
    if not files:
        raise SystemExit('没找到 index-*.js：%s' % root)
    for f in files:
        patch(f)


if __name__ == '__main__':
    main()
