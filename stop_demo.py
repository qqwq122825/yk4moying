#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""停掉 start_demo.py 启动的三个进程（**只按登记的 PID**，不动别的 python 进程）。

实现要点（踩过两次）：
  · `taskkill /F` 在本沙箱里对"脱离父进程启动"的子进程会返回 **Access denied**，
    而 `powershell Stop-Process -Force` 能成功 —— 所以两种都试，先 PS 后 taskkill；
  · 每杀一个都**回读进程是否真的没了**（不能只看命令返回码就说"已停止"）；
  · **只有全部停掉才删 pids.json**：否则用户下次想停连 PID 都找不到了（第一版就删了，属于自伤）。
"""
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PIDS = os.path.join(HERE, 'state', 'logs', 'pids.json')
ORDER = ('agent_relay', 'agent_primary', 'server')     # 先停被控端，最后停服务端


def alive(pid):
    r = subprocess.run(['powershell', '-NoProfile', '-Command',
                        'if (Get-Process -Id %d -ErrorAction SilentlyContinue) { "1" } else { "0" }'
                        % int(pid)],
                       capture_output=True, text=True)
    return r.stdout.strip() == '1'


def kill(pid):
    pid = int(pid)
    r1 = subprocess.run(['powershell', '-NoProfile', '-Command',
                         'Stop-Process -Id %d -Force -ErrorAction SilentlyContinue' % pid],
                        capture_output=True, text=True)
    if not alive(pid):
        return True, 'powershell Stop-Process'
    r2 = subprocess.run(['taskkill', '/PID', str(pid), '/F'], capture_output=True, text=True)
    if not alive(pid):
        return True, 'taskkill'
    return False, ('powershell rc=%s / taskkill rc=%s %s'
                   % (r1.returncode, r2.returncode, (r2.stderr or '').strip()[:60]))


def main():
    if not os.path.exists(PIDS):
        print('[stop-demo] 没有 %s —— 说明不是本脚本启动的，未动任何进程' % PIDS)
        return 0
    try:
        info = json.load(open(PIDS, encoding='utf-8'))
    except Exception as e:
        print('[stop-demo] pid 文件读取失败：%s' % e)
        return 1

    ok_all, lines = True, []
    for name in ORDER:
        pid = info.get(name)
        if not pid:
            continue
        if not alive(pid):
            lines.append('%-14s PID %-7s 已不在运行' % (name, pid))
            continue
        done, how = kill(pid)
        lines.append('%-14s PID %-7s %s%s' % (name, pid, '已停止（%s）' % how if done else '停止失败：', '' if done else how))
        ok_all = ok_all and done

    print('[stop-demo] %s' % info.get('base', ''))
    for ln in lines:
        print('   ' + ln)
    if ok_all:
        try:
            os.remove(PIDS)
        except Exception:
            pass
        print('[stop-demo] 三个进程都已停止（pid 文件已清除）')
        return 0
    print('[stop-demo] 有进程没停掉 —— **保留 pid 文件**（%s），可再跑一次或用管理员终端执行：' % PIDS)
    for name in ORDER:
        if info.get(name):
            print('   taskkill /PID %s /F' % info[name])
    return 1


if __name__ == '__main__':
    sys.exit(main())
