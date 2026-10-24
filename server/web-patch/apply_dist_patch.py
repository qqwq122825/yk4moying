#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""给面板构建产物（dist bundle）加上「保活」路由与菜单项，可重复执行（幂等）。

面板前端没有源码工程，仓库里只有构建好的 dist：
    web/panel/assets/index-dvi-*.js
因此新增页面只能改这份产物。面板换新 dist 后，重跑本脚本即可把补丁打回去。

用法：
    python3 server/web-patch/apply_dist_patch.py /path/to/web/panel

做了两件事（都插在既有项之后，结构与原生项完全一致）：
  1) 路由：  { path:"/oem", element:<div id="tb-oem-mount"> }
  2) 菜单：  { to:"/oem", label:"保活", icon:<盾牌 svg> }
页面内容由 web/panel/assets/tb-oem.js 渲染进 #tb-oem-mount。
"""
import glob
import os
import shutil
import sys
import time

ROUTE_ANCHOR = '(0,It.jsx)(Oe,{path:"/devices",element:(0,It.jsx)(VP,{search:t})}),'
ROUTE_ADD = '(0,It.jsx)(Oe,{path:"/oem",element:(0,It.jsx)("div",{id:"tb-oem-mount"})}),'
NAV_KEY = '{to:"/translate",label:"翻译"'
NAV_ADD = (',{to:"/oem",label:"保活",icon:(0,It.jsxs)("svg",{viewBox:"0 0 24 24",fill:"none",'
           'stroke:"currentColor",strokeWidth:"2",children:[(0,It.jsx)("path",'
           '{d:"M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"})]})}')


def object_end(s, start):
    """从 start 处的 '{' 开始做括号配平，返回对象结束后的下标。"""
    depth, i, instr = 0, start, None
    while i < len(s):
        c = s[i]
        if instr:
            if c == '\\':
                i += 2
                continue
            if c == instr:
                instr = None
        elif c in '"\'':
            instr = c
        elif c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    raise RuntimeError('括号未闭合：对象结构异常')


def patch_file(path):
    s = open(path, encoding='utf-8', errors='ignore').read()
    changed = []

    if '/oem' in s and 'label:"保活"' in s:
        return []

    if ROUTE_ADD not in s:
        if ROUTE_ANCHOR not in s:
            raise RuntimeError('找不到 /devices 路由锚点，dist 结构可能已变')
        s = s.replace(ROUTE_ANCHOR, ROUTE_ANCHOR + ROUTE_ADD, 1)
        changed.append('route:/oem')

    if 'label:"保活"' not in s:
        i = s.find(NAV_KEY)
        if i < 0:
            raise RuntimeError('找不到「翻译」菜单项锚点，dist 结构可能已变')
        end = object_end(s, i)
        s = s[:end] + NAV_ADD + s[end:]
        changed.append('nav:保活')

    if changed:
        bak = '%s.bak-%s' % (path, time.strftime('%Y%m%d%H%M%S'))
        shutil.copy2(path, bak)
        open(path, 'w', encoding='utf-8').write(s)
        print('patched %s → %s（备份 %s）' % (os.path.basename(path), ', '.join(changed), os.path.basename(bak)))
    return changed


def main():
    root = sys.argv[1] if len(sys.argv) > 1 else 'web/panel'
    bundles = sorted(glob.glob(os.path.join(root, 'assets', 'index-*.js')))
    if not bundles:
        print('没找到 assets/index-*.js，检查路径：%s' % root)
        return 1
    for b in bundles:
        patch_file(b)
    print('完成。记得把 index.html 里的 ?v= 改一下，强制浏览器更新缓存。')
    return 0


if __name__ == '__main__':
    sys.exit(main())
