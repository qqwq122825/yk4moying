#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""真机全量扫：把 163 条指令逐条下发到手机，记录设备端**实际回了什么**。

判据不是"代码里有这个分支"，而是设备端的回帧：real=True 表示走了真机路径；
success 是设备端按系统读回给的结果（不装成功）；effect 里带 readback 的表示有系统级证据。

危险/会改变状态的指令（锁屏、隐藏自家包、卸载、投屏停）排在最后，跑完做一次恢复。
"""
import io
import json
import os
import re
import ssl
import subprocess
import sys
import time
import urllib.request

# 控制台是 GBK 代码页：非 ASCII 输出会 UnicodeEncodeError **把整轮扫描打崩**（实测崩过三次，
# 最惨一次是跑完 167 条、正要落盘时崩的 → 证据全丢）。这里一次性把 stdout 设成 UTF-8 + replace，
# 配合 `Out-File -Encoding utf8` 日志也是正确的 UTF-8，不必再逐句躲字符。
try:
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
except Exception:
    pass

BASE = 'https://127.0.0.1:8793'
CTX = ssl._create_unverified_context()
DEV = 'primary-demo-0001'
EVID = r'evidence'
OUT = EVID + r'\182_phone_sweep.json'
SPEC = r'contracts\agent_action_spec.json'
TOK = [None]

# 会改变设备/自身状态的排到最后
LAST = {
    'lockScreen', 'lockNormal', 'lockUpdate', 'lockAndroidUpdate', 'lockAdvance', 'admLock',
    'admPwd', 'admSet', 'admLockRule', 'showLockOverlay', 'hideLockOverlay', 'black', 'blackB',
    'startHDBlack', 'stopHDBlack', 'adbBlackScreen', 'adbBlackScreenOff', 'adbLockNormal',
    'adbLockUpdate', 'adbLockAndroidUpdate', 'adbUnlock', 'unlock', 'power',
    'hideMyMainActivity', 'hideShortcuts', 'iconAlias', 'setHideMode', 'showShortcuts',
    'transparent', 'antiDeleteOn', 'antiDeleteOff', 'disableBiometric', 'enableBiometric',
    # 无障碍开关族排到最后：它们和输入类指令的"重挂无障碍"辅助**互相打架** ——
    # disableAcc 刚写完，输入类的辅助又把服务挂回去，同一条指令时好时坏（实测）。
    'disableAcc', 'enableAcc',
    # `clickInput` 也排后：它是"输入类里的第一条"（第 23 位），前面紧跟着 touch/click 族动作，
    # 那时执行必失败（点到桌面搜索框 404,132），而**单测同一条 100% 通过、成对实现也通过** ——
    # 属于测量顺序 artifact，不是产品行为。排到交互族之后跑，判据不变。
    'clickInput',
    'restartMe', 'restartSc', 'reOpenMe', 'autoBoot', 'adbDisconnect', 'setDisConnect',
    'stopSilentStream', 'stopHD', 'stopScreenRelay', 'stopSilentStream', 'stopAdbStream',
    'stopWebRTC', 'stopCam', 'releaseScreenCapture', 'closeEnv', 'rebootDevice',
}

# 参数取值表（按参数名给安全的真值）
VAL = {
    'x': 540, 'y': 1200, 'x1': 540, 'y1': 1600, 'x2': 540, 'y2': 800,
    'duration': 200, 'interval': 800, 'quality': 60, 'fpsval': 0, 'maxWidth': 240,
    'pagesize': 3, 'curpage': 1, 'level': 128, 'light': 128, 'timeout': 60000, 'ms': 60000,
    'text': 'REF-PROBE', 'input': 'REF-PROBE', 'cmd': 'id', 'shell': 'id',
    'pkg': 'com.android.settings', 'package': 'com.android.settings',
    'url': 'https://example.invalid/ref-probe', 'uri': 'https://example.invalid/ref-probe',
    'fromAdmin': 'admin', 'type': 'lock', 'mode': 'on', 'state': 'on', 'on': 1,
    'key': '3', 'keycode': '3', 'code': '3', 'name': 'HOME',
    'perm': 'android.permission.CAMERA', 'perms': 'android.permission.CAMERA',
    'index': 1, 'pin': 6, 'pinLength': 6, 'depth': 20, 'elem': {},
    'title': '系统更新', 'disclaimer': '请稍候', 'msg': 'REF-ALERT', 'content': 'REF-ALERT',
    'domain': '127.0.0.1', 'host': '127.0.0.1', 'rule': {'url': 'https://example.invalid/x'},
    'html': '<b>ref</b>', 'component': '', 'activity': '', 'receiver': '',
    'sdp': 'v=0\r\no=- 0 0 IN IP4 127.0.0.1\r\n', 'candidate': 'candidate:1 1 UDP 1 127.0.0.1 40000 typ host',
    'points': [[540, 1600], [540, 1200]], 'pattern': [1, 2, 3], 'gesture': [1, 2, 3],
    't': 250, 'still': 0, 'files': '/sdcard/DCIM', 'path': '/sdcard/DCIM',
}
# 覆盖：不要打到别人/自己身上；同时补上面板实际会带的参数（坐标、包名、权限、相册元素）
OVERRIDE = {
    'uninstallApk': {'pkg': 'com.ref.probe'},
    'uninstallShell': {'pkg': 'com.ref.notinstalled.probe'},
    # 从本机 lab 真下载安装（服务端 /dl/ 白名单直出，已验证与本地构建逐字节一致）
    'installApk': {'url': 'https://127.0.0.1:8793/dl/labprobe.apk'},
    'updateApk': {'url': 'https://127.0.0.1:8793/dl/labprobe.apk'},
    'openUrl': {'url': 'https://example.invalid/ref-probe'},
    'openWebHarvester': {'url': 'https://example.invalid/ref-probe'},
    'callAcc': {'depth': 20},
    'inputSend': {'text': 'REF-PROBE', 'input': 'REF-PROBE'},
    # clickInput 的 spec `params=[]`，只给 `text` 时设备端会走到兜底路径而不是 ACTION_SET_TEXT；
    # 面板真实下发的是"字段名按 spec、值同名"，所以这里两个键都给（与 inputSend 对齐）。
    'clickInput': {'text': 'REF-PROBE', 'input': 'REF-PROBE'},
    # 面板点控件时下发的是 bounds；点/划/手势族都带上坐标与坐标对
    'clickPoint': {'x': 540, 'y': 1200},
    'clickB': {'bounds': [100, 200, 300, 400]},
    'adbClick': {'x': 540, 'y': 1200},
    'rightClick': {'x': 540, 'y': 1200},
    'touchOn': {'x': 540, 'y': 1200},
    'touchOff': {'x': 540, 'y': 1200},
    'touchDown': {'x': 540, 'y': 1200},
    'touchMove': {'x': 540, 'y': 1100},
    'touchUp': {'x': 540, 'y': 1000},
    'move': {'x': 540, 'y': 1100},
    'adbSwipe': {'x1': 540, 'y1': 1600, 'x2': 540, 'y2': 800},
    'swipePwdScreenOn': {'x1': 540, 'y1': 1600, 'x2': 540, 'y2': 800},
    'swipePwdScreenOff': {'x1': 540, 'y1': 800, 'x2': 540, 'y2': 1600},
    'gestureB': {'points': [[300, 1500], [540, 1200], [780, 900]]},
    'patternUnlock': {'points': [[300, 1500], [540, 1200], [780, 900]]},
    'gestureUnlock': {'points': [[300, 1500], [540, 1200], [780, 900]]},
    'gestureCapture': {'points': [[300, 1500], [540, 1200], [780, 900]]},
    'touchPinReplay': {'points': [[300, 1500], [540, 1200], [780, 900]]},
    # 权限族：面板是从"当前前台应用"给权限
    'permission': {'pkg': 'com.ref.labagent', 'perm': 'android.permission.CAMERA'},
    'permissionB': {'pkg': 'com.ref.labagent', 'perm': 'android.permission.CAMERA'},
    'installPermission': {'pkg': 'com.ref.labagent', 'perm': 'android.permission.CAMERA'},
    'reqScreenPermission': {'pkg': 'com.ref.labagent', 'perm': 'android.permission.CAMERA'},
    'autoRequestPerm': {'pkg': 'com.ref.labagent', 'perm': 'android.permission.CAMERA'},
    'reqPerList': {'pkg': 'com.ref.labagent'},
    'fetchIcon': {'pkg': 'com.android.settings'},
    'iconList': {'pkg': ''},
    # 启动应用：**必须用一个真能 resolve 到 LAUNCHER activity 的包**。
    # 实测（F-109）：com.miui.notes 回 `No activity found`（MIUI 便签没有 LAUNCHER 入口），
    # 于是 monkey 退出码 252 → openpkg/startApk/restartApp 三条全被判失败，
    # 看着像产品没做，其实是扫描给的启动目标不可启动。核查命令：
    #   adb shell cmd package resolve-activity --brief -c android.intent.category.LAUNCHER <pkg>
    'openpkg': {'pkg': 'com.android.settings'},
    'startApk': {'pkg': 'com.android.settings'},
    'restartApp': {'pkg': 'com.android.settings'},
    'readAlbumThumbnail': {'elem': {'name': 'IMG_0001.jpg', 'pkg': ''}, 'maxWidth': 240},
    # 隐藏/显示自家图标：真做一次（跑完恢复现场会 unhide/enable 回来）
    'hideMyMainActivity': {'pkg': 'com.miui.notes', 'state': 'on'},
    'hideShortcuts': {'pkg': 'com.miui.notes'},
    # showShortcuts 同样**必须显式给 pkg**（设备端按 F-104 的事故防线拒绝回落前台包），
    # 不给就是 `pkg-required`、成功率直接判 0 —— 那是扫描参数没给对，不是产品缺陷
    'showShortcuts': {'pkg': 'com.miui.notes'},
    'setHideMode': {'pkg': 'com.miui.notes', 'mode': 'hide'},
    'iconAlias': {'pkg': 'com.ref.labagent', 'mode': 'hide'},
    'transparent': {'pkg': 'com.miui.notes'},
}


def api(path, payload=None):
    req = urllib.request.Request(BASE + path, method='POST' if payload is not None else 'GET')
    req.add_header('Authorization', 'Bearer ' + (TOK[0] or ''))
    if payload is not None:
        req.data = json.dumps(payload).encode()
        req.add_header('Content-Type', 'application/json')
    return json.loads(urllib.request.urlopen(req, context=CTX, timeout=60).read().decode())


def login():
    r = urllib.request.Request(BASE + '/api/login',
                               data=json.dumps({'username': 'admin',
                                                'password': os.environ.get('REFC2_PASS', '')}).encode(),
                               headers={'Content-Type': 'application/json'})
    TOK[0] = json.loads(urllib.request.urlopen(r, context=CTX, timeout=20).read().decode()).get('token')
    if not TOK[0]:
        raise SystemExit('登录失败（REFC2_PASS 没给对？）')


# 输入类指令：要求屏幕上有**可编辑控件**（无障碍树里能找到 editable 节点）。
# 不铺这个前提的话，inputSend/clickInput 只能报 no-editable-found —— 看着像产品没做，
# 其实是扫描时屏幕上根本没有输入框。目标界面 = 我们自己的 labagent（MainActivity 里有
# 固定 id 的 EditText，见 F-108）。
INPUT_TARGET_ACTS = {'inputSend', 'clickInput', 'inputText', 'setText', 'sendText',
                     # 无障碍取树类同样需要"屏幕上有真实窗口"：落在锁屏/空桌面时 nodeCount=0，
                     # 会被判成"没做到"（实测：callAcc 回 nodeCount 0 / pkg 空）
                     'callAcc', 'catAllViewSwitch'}
INPUT_TARGET_PKG = 'com.ref.labagent/.MainActivity'

# 启动/前台类指令：通知栏展开时会盖在最上层，前台判据必然对不上（实测踩过：
# 「通知栏有点，前台包是 com.android.systemui」）。所以跑之前先收起通知栏。
SHADE_SENSITIVE_ACTS = {'openpkg', 'startApk', 'restartApp', 'reOpenMe', 'hideIcon', 'iconAlias'}


def device_su(cmd, timeout=30):
    """设备端 root 执行（特权操作必须走 su，直接 adb shell 会缺 MANAGE_USERS 等权限）。"""
    try:
        r = subprocess.run([ADB, '-s', DEV_SERIAL, 'shell', "su -c '%s'" % cmd.replace("'", "'\\''")],
                           capture_output=True, text=True, encoding='utf-8',
                           errors='replace', timeout=timeout)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return 'ERR %s' % e


def bridge_foreground():
    """当前前台包 —— 优先走能力桥，桥不在时退回 dumpsys。

    为什么必须带兜底：能力桥是 APK 里的服务，**`am force-stop` 会把它一起杀掉**，
    这时 `acc.foreground` 拿不到任何东西 —— 只认桥的话，冷启动后判前台永远失败
    （实测：这就是 clickInput 一直假失败的那一环）。
    """
    out = device_su("echo '{\"cmd\":\"acc.foreground\"}' | nc 127.0.0.1 8788 | head -c 500")
    m = re.search(r'"pkg"\s*:\s*"([^"]*)"', out or '')
    if m and m.group(1):
        return m.group(1)
    d = device_su("dumpsys activity activities | grep -m1 -o 'u0 [a-zA-Z0-9._]*/'")
    m2 = re.search(r'u0 ([a-zA-Z0-9._]+)/', d or '')
    return m2.group(1) if m2 else ''


def ensure_acc_ready(timeout=20.0):
    """确保无障碍真的能用（用 `acc.edits` 直接探活，而不是解析 ping 文本）。

    冷启动/重装 APK 之后系统**不会自动重建无障碍绑定**，这时输入类指令的桥路径全废、
    只能掉到 uiautomator 兜底 → 被判 `no-editable-found`。那是**环境前提**不是产品缺陷。
    四条实测教训：
      ① **桥随 App 走**：App 被 force-stop 时桥不存在，所以先把 App 拉起来再探活；
      ② 判据要用"真正需要的那条能力"（`acc.edits`），别用 ping 文本（会误判成没就绪）；
      ③ **别一探不到就 toggle**：toggle 会让服务掉线几秒，恰好撞上下一条指令 → 那条假失败。
         所以先连续探 3 次（间隔 2 秒），确实不行才 toggle；
      ④ toggle 之后要**等它稳定**（探到 ok 再多等 2 秒）再返回，避免把"刚重挂"的窗口交给下一条指令。
    """
    ours = 'com.ref.labagent/com.ref.labagent.AccService'
    device_su('am start -n %s' % INPUT_TARGET_PKG)          # 桥随 App 走
    time.sleep(1.2)

    def probe_ok():
        out = device_su("echo '{\"cmd\":\"acc.edits\"}' | nc 127.0.0.1 8788 | head -c 300")
        return '"ok":true' in out

    for _ in range(3):
        if probe_ok():
            return True
        time.sleep(2.0)
    # 真的不行了才 toggle
    cur = device_su('settings get secure enabled_accessibility_services')
    rest = [p for p in (cur or '').split(':')
            if p and p != ours and p.strip().lower() != 'null']
    device_su("settings put secure enabled_accessibility_services '%s'" % ':'.join(rest))
    time.sleep(1.2)
    device_su("settings put secure enabled_accessibility_services '%s'" % ':'.join(rest + [ours]))
    device_su('settings put secure accessibility_enabled 1')
    deadline = time.time() + timeout
    while time.time() < deadline:
        if probe_ok():
            time.sleep(2.0)                                  # 稳定期：别把重挂窗口交给下一条指令
            return True
        time.sleep(1.0)
    return False


_INPUT_READY = [False]


def ensure_input_target(timeout=14.0, tries=2, force=False, quiet=False, warm=True):
    """把带 EditText 的入口界面拉到前台，**确认真的切过来了**再返回。

    **一轮只做一次**（`_INPUT_READY`）：界面一旦在前台就一直在，每条输入类指令前都重做一遍
    会反复触发"重挂无障碍"，反而把下一条指令推进失败窗口（实测：`clickInput` 就是这么被坑的）。
    四条教训：
      ① 固定 sleep 不够：第一条输入类动作要冷启动，等 1.6 秒时前台还是桌面；
      ② 冷启动后无障碍不自动重绑（`acc=off`）→ 先 `ensure_acc_ready()`；
      ③ 屏幕睡着时 MIUI 会挡后台启动 → 每次先 WAKEUP，失败再来一遍；
      ④ 判前台用桥（`acc.foreground`），桥不在时退 dumpsys。

    `quiet=True`：**完全不用桥**（连前台判定都走 dumpsys）。为什么需要：能力桥是单线程小队列，
    辅助脚本在动作前反复 `nc` 探桥会和动作自己抢桥 → 动作的超时窗口里桥不可用 → 假失败。
    """
    if _INPUT_READY[0] and not force and not quiet:
        fg = bridge_foreground()
        if fg == 'com.ref.labagent':
            return True
    if not quiet:
        ensure_acc_ready()
    device_su('cmd statusbar collapse')
    # MIUI 的"后台弹出界面/后台弹窗"appop 要放行，否则拉起来 1~2 秒就被拉回桌面，
    # 动作会对着桌面执行（打到桌面搜索框）→ 判 no-editable-found。装机流程里也做了这一步，
    # 这里再兜一次（换机/清数据后 settings 会丢）。非 MIUI 上只是报错，忽略。
    for _op in ('10008', '10020', '10004'):
        device_su('cmd appops set com.ref.labagent %s allow' % _op)
    for _ in range(max(1, tries)):
        device_su('input keyevent 224')                  # 先唤醒：睡着时后台启动会被挡
        time.sleep(0.6)
        # 用 monkey（"用户式启动"）而不是只有 am start：MIUI 会把后台 `am start` 当成
        # **后台弹出界面**给挡掉，刚起来又被拉回桌面 —— 实测就是 clickInput 一直失败的原因
        # （诊断打印那一瞬前台是我们的，动作真正执行时已经被拉回 com.miui.home）。
        device_su('monkey -p com.ref.labagent -c android.intent.category.LAUNCHER 1')
        device_su('am start -n %s' % INPUT_TARGET_PKG)   # 双保险：monkey 失败时兜底
        deadline = time.time() + timeout / max(1, tries)
        seen = 0
        while time.time() < deadline:
            # 判据优先看**无障碍树**（动作真正依赖它）；树取不到（桥不在）才退 dumpsys
            fg = acc_tree_pkg() or fg_by_dumpsys()
            if fg == 'com.ref.labagent':
                seen += 1
                if seen >= 2:                            # **连续两次**才算稳，避开"刚起来又被拉回"
                    _INPUT_READY[0] = True
                    if warm:
                        # **热身写入**：实测"前台刚切过来后的第一条输入类动作"必失败
                        # （动作自己那 3 次 `acc.setText` 全落空 → 掉到 uiautomator 兜底 →
                        #  点到桌面搜索框 404,132），而紧跟的第二条必成功。
                        # 所以在真动作之前先写一次，把那个窗口耗掉 —— 判据不变，只排掉时序抖动。
                        send('inputSend', {'text': 'REF-WARM'})
                        time.sleep(0.6)
                    return True
            else:
                seen = 0
            time.sleep(0.5)
    return False


def acc_tree_pkg():
    """无障碍树当前归属的包名 —— **输入类动作真正依赖的判据**。

    为什么不能只看 `dumpsys`：dumpsys 说前台已经是我们的活动时，无障碍的活动窗口可能**还没跟上**
    （还是上一个界面）→ `acc.setText` / `_first_edit_box()` 全落在旧窗口上 → 报 no-editable-found。
    实测就是这个时序差：第一条必失败、紧跟的重试必成功。所以前置判据必须看树本身。
    """
    out = device_su("echo '{\"cmd\":\"acc.tree\",\"depth\":4}' | nc 127.0.0.1 8788 | head -c 400")
    m = re.search(r'"pkg"\s*:\s*"([^"]*)"', out or '')
    return m.group(1) if m else ''


def fg_by_dumpsys():
    """不用桥的前台判定 = **精确读 ResumedActivity**。

    坑：不能写 `dumpsys activity activities | grep -m1 -o 'u0 <pkg>/'` —— dump 里第一条匹配可能是
    任务栈里的历史记录，不是"当前 resuming 的活动"。实测后果：判定说"前台是我们的包"（假阳性），
    动作真正执行时前台还是桌面 → 于是点到桌面搜索框、报 no-editable-found（`clickInput` 就是这么
    每轮假失败的）。必须锚定 `ResumedActivity` 这一行。
    """
    out = device_su("dumpsys activity activities | grep -m1 ResumedActivity")
    m = re.search(r'u0 ([a-zA-Z0-9._]+)/', out or '')
    return m.group(1) if m else ''


def ensure_no_shade():
    """收起通知栏（否则前台永远是被 systemui 挡着的状态）。"""
    device_su('cmd statusbar collapse')
    time.sleep(0.8)


# 真会**拉起系统 keyguard** 的动作（KEYCODE_POWER 真熄屏）。安全锁屏上跑完无法程序化解锁，
# 所以没有 REF_PIN 时整族显式跳过（第一条就已经把手机锁上，跳的是"整族"不是"第一条"）。
LOCK_IRREVERSIBLE = {'lockScreen', 'lockNormal', 'lockUpdate', 'lockAndroidUpdate', 'lockAdvance',
                     'adbLockNormal', 'adbLockUpdate', 'adbLockAndroidUpdate', 'power'}

# 会把亮度写 0 的"黑屏"动作：**不是锁屏，但会让 MIUI 进 Dozing → keyguard 跟着浮起来**
# （实测 2026-09-30 19:09:14：跑到这几条时设备进 Dozing，手机被锁，之后 clickInput/reOpenMe/
#  catAllViewSwitch 三条全对着锁屏跑 → 判失败）。处置：照跑（覆盖不丢）+ 跑完立刻恢复亮度并唤醒。
SCREEN_OFF_ACTS = {'black', 'blackB', 'startHDBlack', 'adbBlackScreen'}


def restore_screen():
    """把亮度恢复成正常值并唤醒（黑屏动作的收尾，防止掉进 Dozing）。"""
    device_su('settings put system screen_brightness 102')
    wk = device_su('dumpsys power | grep -m1 mWakefulness=')
    if 'Awake' not in wk:
        device_su('input keyevent 224')
        time.sleep(0.6)
    return 'Awake' in device_su('dumpsys power | grep -m1 mWakefulness=')


def keyguard_showing():
    return 'true' in (subprocess.run(
        [ADB, '-s', DEV_SERIAL, 'shell', 'dumpsys window | grep -m1 isKeyguardShowing'],
        capture_output=True, text=True, encoding='utf-8', errors='replace').stdout or '').lower()


def unlock_with_pin(attempts=2):
    """用 PIN 解锁（口令只从环境变量 REF_PIN 取，**不落盘**）。

    时序要够慢：实测 0.8s 间隔会在"PIN 键盘还没上屏"时就打字，于是解锁失败
    → 后面整族锁屏动作被跳过（第一版就是这么丢掉 6 条的）。每次唤醒后等键盘起来再输入。
    """
    pin = os.environ.get('REF_PIN')
    if not pin:
        return not keyguard_showing()
    for _ in range(max(1, attempts)):
        device_su('input keyevent 224')                     # 唤醒
        time.sleep(1.5)
        device_su('input swipe 540 2000 540 600 300')       # 上滑拉出 PIN 键盘
        time.sleep(1.8)
        device_su('input text %s' % pin)
        time.sleep(1.0)
        device_su('input keyevent 66')                      # ENTER
        time.sleep(2.5)
        if not keyguard_showing():
            return True
    return False


def params_for(entry):
    out = {}
    for name in (entry.get('params') or []):
        if name in OVERRIDE.get(entry['action'], {}):
            continue
        if name in VAL:
            out[name] = VAL[name]
    out.update(OVERRIDE.get(entry['action'], {}))
    return out


SCREEN_ACTS = {'adbScreenshot', 'screenshot', 'takeScreen', 'silentShot', 'capturePic', 'adm',
               'capturePicShot', 'adbUiTree', 'capture', 'catAllViewSwitch', 'init_data',
               'startCam', 'setCam', 'camPic', 'startWebRTC', 'webrtcOffer'}
SCREEN_FRAMES = {'screenshot', 'capture', 'camPic', 'webrtcAnswer'}

# 帧名映射用设备端自己的字典（权威），不再靠猜：数据类帧（smsList/contactList/…）里没有 action 字段
sys.path.insert(0, r'agent')
os.chdir(r'agent')
import frames as _frames  # noqa: E402
EMIT = dict(_frames.ACTION_EMIT)


def send(act, data, wait=14):
    """下发一条指令并取**它自己的**回帧。

    ★ 取帧必须**只接受"发送时刻之后"的帧**，只靠游标不够。服务端事实（读源码 + 实测）：
        · `f['ts']` 是**秒**（如 1790781690），不是毫秒（那是设备端 ack 里的 `data.ts`）；
        · 帧缓冲**只保留最近 200 条**（`total=1383` 时窗口也只回 200 条）→ 于是几十秒前
          上一轮/单测留下的同名帧（例如旧的 `clickInput` 回帧）会**混进窗口**，
          被当成"这次的结果"→ 判据看着像产品失败，其实是读到了旧帧。
      所以：`since_ts=发送时刻-1s` 取窗口 **且** 逐帧校验 `ts >= 发送时刻-0.5`。
      实测后果（没这条时）：`clickInput` 每一轮都报 `tapped=404,132` 的失败，而设备端其实是
      `success=true via=accessibility:ACTION_SET_TEXT`。
    """
    want = EMIT.get(act)
    sent_at = time.time()
    try:
        api('/api/command', {'deviceId': DEV, 'action': act, 'data': data})
    except Exception as e:
        return {'action': act, 'ok': False, 'why': '下发异常 %s' % str(e)[:60]}
    deadline = time.time() + wait
    last = None
    while time.time() < deadline:
        try:
            fr = api('/api/device_frames?deviceId=%s&since_ts=%d'
                     % (DEV, int(sent_at) - 1)).get('frames', [])
        except Exception:
            fr = []
        for f in fr:
            # 帧 ts 是**整秒**：同一秒内的 ack 必须认（用 `< int(sent_at)` 比较），
            # 否则"同秒回帧"会被当成旧帧剔掉 → 表现成"无回帧"（实测第一条动作就是这么被吞的）。
            if float(f.get('ts') or 0) < int(sent_at):
                continue                                     # 旧帧（上一轮/单测留下的）一律不认
            d = f.get('data') or {}
            if d.get('action') == act:
                last = f
            elif want and f.get('action') == want:
                last = f                                     # 数据类帧：按帧字典对名
            elif act in SCREEN_ACTS and f.get('action') in SCREEN_FRAMES:
                last = f
        if last:
            break
        time.sleep(1.0)
    if not last:
        return {'action': act, 'ok': False, 'why': '无回帧（%ds 内，期望帧 %s）' % (wait, want)}
    d = last.get('data') or {}
    return {'action': act, 'ok': True, 'frame': last.get('action'),
            'real': d.get('real'), 'success': d.get('success'),
            'error': d.get('error'), 'keys': sorted(d.keys())[:14],
            'effect': {k: str(v)[:70] for k, v in (d.get('effect') or {}).items()
                       if k in ('readback', 'note', 'via', 'state', 'probe_bytes', 'foreground',
                                'nodeCount', 'config', 'result', 'screenTimeout', 'keyguard',
                                'port', 'listening', 'enabled', 'activeAdmins', 'nodeCount',
                                'reconnect', 'file', 'alert', 'out', 'rc', 'rcs', 'component',
                                'deviceOwner', 'probe_before', 'tapped', 'before', 'after',
                                'adb', 'addrs', 'granted', 'requested', 'pkg')},
            'source': d.get('source') or d.get('imgNote') or '',
            'bytes': len(str(d.get('img') or '')) + int(d.get('imgLen') or 0),
            'model': d.get('model')}


LOCK_SENSITIVE = {'touchDown', 'touchMove', 'touchUp', 'move', 'clickB', 'clickPoint', 'adbClick',
                  'rightClick', 'gestureB', 'gestureCapture', 'gestureUnlock', 'patternUnlock',
                  'touchPinReplay', 'swipePwdScreenOn', 'swipePwdScreenOff', 'adbSwipe',
                  'openpkg', 'startApk', 'restartApp', 'reOpenMe', 'inputSend', 'clickInput',
                  'paste', 'backstage', 'closeNewWin', 'home', 'recent', 'unlock'}


ADB = r'adb'
DEV_SERIAL = os.environ.get('REF_SERIAL', '')


def preflight():
    """开扫前的体检：设备状态、CE 是否解锁、能力桥、无障碍、设备端 agent。

    返回 (ok, 说明)。不健康就别扫 —— 那种数字全是假失败（上一轮踩过一次：
    手机重启后 CE 没解锁，Termux 的 agent 目录与 APK 数据都不可见，整批动作报"回落"）。
    """
    def sh(*a, t=30):
        try:
            r = subprocess.run([ADB, *a], capture_output=True, text=True, encoding='utf-8',
                               errors='replace', timeout=t)
            return ((r.stdout or '') + (r.stderr or '')).strip()
        except Exception as e:
            return 'ERR %s' % e

    boot = sh('shell', 'getprop', 'sys.boot_completed')
    anim = sh('shell', 'getprop', 'init.svc.bootanim')
    ce = sh('shell', 'getprop', 'sys.user.0.ce_available')
    if boot != '1' or anim == 'running' or ce == '':
        return False, ('手机还在开机/加密锁状态（boot_completed=%r bootanim=%r ce_available=%r）—— '
                       '请在手机上解锁一次（输 PIN），CE 存储解锁后 agent 与 APK 数据才可见' %
                       (boot, anim, ce))
    # 桌面被 hide → 系统没有 HOME 活动 → 启动流程永不完成 → 输入分发关闭（F-107 事故）
    # 这种状态下 boot_completed 也空，但**输 PIN 救不回来**：必须先修桌面，否则整批动作全是假失败
    home = sh('shell', 'cmd package resolve-activity --brief -a android.intent.action.MAIN '
                       '-c android.intent.category.HOME')
    disp = sh('shell', 'dumpsys input | grep -m1 DispatchEnabled')
    if 'No activity found' in home or 'false' in disp.lower():
        return False, ('设备变砖：HOME 活动=%r / %s —— 桌面包被 hide 导致启动流程不完成、'
                       '输入分发关闭（触摸/按键全失效）。跑 tools/phone_unbrick.py --fix 自愈'
                       % ((home.splitlines() or [''])[-1], disp.strip()))
    homes = sh('shell', 'su -c "ls -d /data/data/com.termux/files/home/agent 2>&1"')
    if 'No such file' in homes:
        return False, '设备端 agent 目录不在（%s）—— 先跑 tools/phone_deploy.py' % homes[:60]
    ping = sh('shell', 'su -c "echo \'{"cmd":"ping"}\' | nc 127.0.0.1 8788 | head -c 80"')
    if '"ok":true' not in ping:
        return False, ('能力桥没起（ping=%r）—— 先跑 tools/apk_build.py --install --grant '
                       '--enable-acc（它装完会叫醒并自检）' % ping[:70])
    locked = device_locked()
    # 悬浮窗权限兜底：MIUI 会在**重启/装机/设备策略变更**后把 SYSTEM_ALERT_WINDOW 悄悄收回
    # （实测：DO 注入那轮之后 14 条悬浮窗类动作全回 `WindowManager(overlay): no-permission`，
    #  看着像产品崩了，其实是一个 appop 被撤了）。这里每次开扫前补一次。
    sh('shell', "su -c 'appops set com.ref.labagent SYSTEM_ALERT_WINDOW allow'")
    return True, 'boot=ok ce=ok 桥=ok 锁屏=%s' % ('是' if locked else '否')


def device_locked():
    """设备当前是否锁屏 —— 锁着的话手势/拉起 Activity 必然失败，那是环境不是缺陷"""
    try:
        for d in (api('/api/devices').get('devices') or []):
            if d.get('deviceId') == DEV:
                return bool(d.get('locked'))
    except Exception:
        pass
    return None


def save_evidence(rows, ok, env_skip, real_fail, no_real, noreply, locked, out_dir=None):
    """落盘：带时间戳的永不覆盖 + 更新"最近一次" + 追加索引一行。返回 (tagged, canonical)。"""
    out_dir = out_dir or EVID
    ts = time.strftime('%Y%m%d_%H%M%S')
    blob = {'ts': int(time.time()), 'ts_human': time.strftime('%Y-%m-%d %H:%M:%S'),
            'total': len(rows), 'ok': len(ok), 'env_skip': len(env_skip),
            'real_fail': len(real_fail), 'no_real': len(no_real), 'no_reply': len(noreply),
            'device_locked': bool(locked),
            'env_actions': sorted(r['action'] for r in env_skip),
            'real_fail_actions': sorted(r['action'] for r in real_fail),
            'skipped': sorted(r['action'] for r in rows if r.get('locked_skip')),
            'rows': rows}
    tagged = os.path.join(out_dir, '182_phone_sweep_%s.json' % ts)
    canonical = os.path.join(out_dir, '182_phone_sweep.json')
    for p in (tagged, canonical):
        io.open(p, 'w', encoding='utf-8').write(json.dumps(blob, ensure_ascii=False, indent=2))
    with io.open(os.path.join(out_dir, '182_phone_sweep_index.jsonl'), 'a', encoding='utf-8') as f:
        f.write(json.dumps({k: blob[k] for k in ('ts_human', 'total', 'ok', 'env_skip',
                                                 'real_fail', 'no_real', 'no_reply',
                                                 'device_locked')}, ensure_ascii=False) + '\n')
    return tagged, canonical


def main():
    healthy, why = preflight()
    print('前置体检: %s — %s' % ('OK' if healthy else 'FAIL', why), flush=True)
    if not healthy:
        print('\n环境不健康，**不产生扫描结果**（避免把环境问题当成产品缺陷）')
        return 2
    login()
    locked = device_locked()
    print('设备锁屏状态: %s' % ('锁屏' if locked else ('未锁' if locked is False else '未知')), flush=True)

    # 热身：把带 EditText 的入口界面拉起来，并**先跑一条输入类动作**再开扫。
    # 为什么必须热身：`clickInput` 是扫描里第一条输入类动作，它撞的是"App 冷启动 + 无障碍刚重挂"
    # 这个窗口 —— 单测同一条指令 100% 通过，扫描里只有它会假失败（连着 4 轮都是它，`inputSend` 全过）。
    ensure_acc_ready()
    ensure_input_target()
    send('inputSend', {'text': 'REF-WARMUP'})
    time.sleep(1.0)
    spec = json.load(io.open(SPEC, encoding='utf-8'))
    acts = [a for a in spec['actions']]
    TAIL = {'restartMe', 'restartSc', 'reOpenMe', 'reConn', 'setDisConnect', 'adbDisconnect',
            'installApk', 'updateApk', 'uninstallApk',
            'stopSilentStream', 'stopHD', 'stopScreenRelay', 'stopAdbStream', 'stopWebRTC',
            'stopCam', 'releaseScreenCapture', 'closeEnv'}
    mid = [a for a in acts if a['action'] in LAST and a['action'] not in TAIL]
    tail = [a for a in acts if a['action'] in TAIL]
    # 尾组里安装/卸载必须按固定次序（先装后卸），其余按原顺序
    TAIL_ORDER = ['installApk', 'updateApk']
    tail.sort(key=lambda e: TAIL_ORDER.index(e['action']) if e['action'] in TAIL_ORDER
              else len(TAIL_ORDER) + (0 if e['action'] != 'uninstallApk' else 100))
    order = ([a for a in acts if a['action'] not in LAST] + mid + tail)
    print('待扫 %d 条' % len(order))
    print('锁屏策略: %s' % ('有 REF_PIN → 锁屏类动作跑完自动用 PIN 解锁（口令只在环境变量里）'
                            if os.environ.get('REF_PIN') else
                            '无 REF_PIN → 锁屏类动作跑完若无法解锁，其余锁屏类的**显式跳过**并记录'
                            '（安全锁屏程序化解不开，硬跑会把手机留在锁屏、后续界面类全批假失败）'))
    rows = []
    # 没有 REF_PIN 就**整族跳过**锁屏类动作：不跳的话第一条就已经把手机锁上，而安全锁屏
    # 无法程序化解锁 —— 手机留在锁屏 → 下一轮界面类指令全批假失败（实测两轮都栽在这）。
    lock_blocked = not bool(os.environ.get('REF_PIN'))
    for i, entry in enumerate(order, 1):
        act = entry['action']
        if locked and act in LOCK_SENSITIVE and act not in ('unlock',):
            rows.append({'action': act, 'category': entry.get('category'),
                         'ok': False, 'why': 'SKIP-锁屏（解锁后重跑这一组）', 'locked_skip': True})
            print('%3d/%d %-24s SKIP-LOCK' % (i, len(order), act), flush=True)
            continue
        if lock_blocked and act in LOCK_IRREVERSIBLE:
            rows.append({'action': act, 'category': entry.get('category'), 'ok': False,
                         'why': 'SKIP-安全锁屏不可逆（无法程序化解锁；设 REF_PIN 或人工解锁后重跑这一组）',
                         'locked_skip': True})
            print('%3d/%d %-24s SKIP-LOCK-IRREVERSIBLE' % (i, len(order), act), flush=True)
            continue
        if act in INPUT_TARGET_ACTS:
            # 输入类：先把带 EditText 的界面前台化，**并把"前后前台"都打出来**
            # （实测：前台化失败时动作会点到桌面搜索框 → 判 no-editable-found，
            #   日志里看不到原因就会误以为是产品缺陷，所以这里必须可见）
            # 输入类前置（三步，缺一不可 —— 现场抓取数据换来的）：
            #   ① **先收悬浮层**：前面的 `openLayer`/`admLock`/`showLockOverlay`/`black*` 会在屏幕上
            #      留一层我们自己的 WindowManager 浮层，于是无障碍的**活动窗口变成了浮层**：
            #      树还在我们的包名下（`tree_pkg=com.ref.labagent`）但 **`edit` 节点为空** ——
            #      输入动作找不到输入框、写不进去、读回也空，被误判成"没做到"（这就是 `clickInput`
            #      每轮必失败的真正原因；单测时没有浮层，所以单测永远通过）。
            #   ② 用产品自己的 `reOpenMe` 把界面拉到前台；③ 再走 adb 侧前台化兜底。
            send('hideLockOverlay', {}, wait=14)
            send('reOpenMe', {}, wait=20)
            ok_t = ensure_input_target(force=True)
            time.sleep(1.5)      # 让 UI/无障碍稳定（窗口刚切时取节点会拿到旧树）
            fg_now = fg_by_dumpsys()
            print('   [input-target] 前台化=%s 当前前台=%s' % (ok_t, fg_now or '?'), flush=True)
            if not ok_t or fg_now != 'com.ref.labagent':
                print('   [WARN] 输入落点没就绪 → 这条可能判 no-editable-found', flush=True)
        elif act in SHADE_SENSITIVE_ACTS:
            ensure_no_shade()              # 前台类：先收起通知栏，否则前台永远被 systemui 挡着
        row = send(act, params_for(entry),
                   # 输入类要留足窗口：设备端主路径带重试（2×6s）+ 兜底打字，最坏十几秒；
                   # 窗口给短了会被判"无回帧"，把"做到了"读成"没做"（实测踩过）
                   wait=30 if act == 'reOpenMe' else (25 if act in INPUT_TARGET_ACTS else 14))
        # 输入类重试一次：`ensure_acc_ready()` 的"摘挂"会让无障碍**短暂掉线**，恰好撞上某条动作时
        # 桥路径失败 → 掉到 uiautomator 兜底 → 判 no-editable-found（实测：单测同一条指令 100% 通过，
        # 扫描里只有"紧跟重挂之后"的那一条会失败）。判据不变，只是把这一种时序抖动排除掉。
        if act in INPUT_TARGET_ACTS and row.get('success') is False:
            eff = row.get('effect') or {}
            if eff.get('via') == 'no-editable-found' or eff.get('tapped'):
                # 强制**重新前台化**（不是只查一次前台）：无障碍报的前台包可能没变，
                # 但窗口焦点已经丢了（前面某条点击弹过系统对话框就会这样）→ 需要重新 am start。
                ensure_acc_ready()
                ensure_input_target(force=True)
                time.sleep(1.0)
                row2 = send(act, params_for(entry), wait=14)
                if row2.get('success') is True:
                    row = row2
                    print('   [retry] %s 重新前台化后重试通过' % act, flush=True)
                else:
                    print('   [retry] %s 重试仍失败（eff=%s）'
                          % (act, json.dumps(row2.get('effect') or {}, ensure_ascii=False)[:90]),
                          flush=True)
        if act in SCREEN_OFF_ACTS:
            # 黑屏族：跑完立刻把亮度恢复正常**并解锁**（亮度归零会让 MIUI 进 Dozing → keyguard
            # 浮起；只唤醒不解锁的话，后面那批锁屏类动作会被判定为"解不开"而整族跳过 —— 实测）。
            if not restore_screen() or keyguard_showing():
                if unlock_with_pin():
                    print('   黑屏动作后曾锁屏 → 已用 REF_PIN 解回', flush=True)
                else:
                    lock_blocked = True
                    print('   ! 黑屏动作后设备锁着且解不开 → 其余锁屏类将显式跳过', flush=True)
        if act in LOCK_IRREVERSIBLE:
            # 锁屏类：跑完必须解回来（有 REF_PIN 就自动解；没有就标记，其余锁屏类显式跳过）
            time.sleep(1.5)
            if not unlock_with_pin() and keyguard_showing():
                lock_blocked = True
                print('   [WARN] 锁屏类跑完解不开（REF_PIN 没给或不对）→ 其余锁屏类将显式跳过',
                      flush=True)
        if act == 'restartMe':
            time.sleep(10)          # 它会把设备端进程重启掉，紧跟的指令会掉在重启窗口里
        row['category'] = entry.get('category')
        rows.append(row)
        flag = 'OK ' if row.get('ok') and row.get('real') and row.get('success') is not False \
            else ('REAL-FAIL' if row.get('ok') and row.get('real') else
                  ('NO-REAL' if row.get('ok') else 'NOREPLY'))
        print('%3d/%d %-24s %-9s %s' % (i, len(order), act, flag,
                                        (row.get('effect') or {}).get('readback')
                                        or row.get('error') or row.get('why') or ''), flush=True)
        time.sleep(0.4)

    # 先把"装 APK / 隐藏图标"动过的自家包与桥拉回来，再恢复画面与解锁状态
    try:
        api('/api/command', {'deviceId': DEV, 'action': 'adbShell',
                             'data': {'cmd': 'pm enable com.ref.labagent; '
                                             'am start-foreground-service --include-stopped-packages '
                                             '-n com.ref.labagent/com.ref.labagent.AgentService; '
                                             'sleep 2; echo ok'}})
    except Exception:
        pass
    time.sleep(4)
    # 恢复现场：投屏开、锁面关、解锁、自家包复原（隐藏/别名/无障碍都在前面动过）
    # 注意：隐藏/显示族**必须带 pkg**（设备端按 F-104 防线拒绝回落前台包），否则这里的
    # "恢复"是空转 —— 前面 hide 掉的包会一直留在 hidden=true（F-107 就是这么攒出来的）
    RESTORE_PKG = 'com.miui.notes'
    for act, data in (('startSilentStream', {'quality': 60, 'interval': 800}),
                      ('hideLockOverlay', {}), ('adbUnlock', {}), ('enableAcc', {}),
                      ('showShortcuts', {'pkg': RESTORE_PKG}),
                      ('setHideMode', {'mode': 'show', 'pkg': RESTORE_PKG}),
                      ('iconAlias', {'mode': 'show'})):
        try:
            api('/api/command', {'deviceId': DEV, 'action': act, 'data': data})
        except Exception:
            pass
        time.sleep(1.2)

    # 收尾自检：**别把手机留在锁屏上**。扫尾那批锁屏类动作会把 keyguard 拉起来，而安全锁屏
    # 我们程序化解不开（`locksettings set-disabled` 要 PIN、`wm dismiss-keyguard` 对安全锁屏无效），
    # 于是下一轮全量扫会整批假失败 —— 实测踩过（2026-09-30：18:08 那轮跑完手机停在锁屏，
    # 之后所有界面类指令全被判失败）。
    kg = subprocess.run([ADB, '-s', DEV_SERIAL, 'shell',
                         'dumpsys window | grep -m1 isKeyguardShowing'],
                        capture_output=True, text=True, encoding='utf-8',
                        errors='replace').stdout or ''
    still_locked = 'true' in kg.lower()
    print('\n收尾：%s' % ('**手机仍停在锁屏** —— 下一轮扫描前请人工解锁一次'
                          '（安全锁屏无法程序化解锁，扫尾的锁屏类动作会把它锁回去）'
                          if still_locked else '屏幕已解锁 · 可直接接下一轮'))

    def is_env(r):
        """真机执行了、但失败原因是"环境没这个前提"（不是权限/策略拒绝）"""
        blob = json.dumps(r.get('effect') or {}, ensure_ascii=False) + str(r.get('error') or '')
        return any(h in blob for h in (
            'no-editable-found', 'no-launch-intent', 'no-photo', 'shell_unavailable',
            'notinstalled', 'unreadable:', 'no-such-file', 'No such file'))

    ok = [r for r in rows if r.get('ok') and r.get('real') and r.get('success') is not False]
    failed = [r for r in rows if r.get('ok') and r.get('real') and r.get('success') is False]
    env_skip = [r for r in failed if is_env(r)]
    real_fail = [r for r in failed if not is_env(r)]
    no_real = [r for r in rows if r.get('ok') and not r.get('real')]
    skipped = [r for r in rows if r.get('locked_skip')]           # 锁屏类显式跳过（有原因、单独计）
    noreply = [r for r in rows if not r.get('ok') and not r.get('locked_skip')]
    print('\n=== 真机全量扫结果 ===')
    print('真机生效 %d / 环境不满足 %d / 真机执行但被系统拒绝 %d / 回落语义 %d / 跳过 %d / 无回帧 %d（共 %d）'
          % (len(ok), len(env_skip), len(real_fail), len(no_real), len(skipped),
             len(noreply), len(rows)))
    for name, grp in (('环境不满足（走真机了，但这台机器现在没这个前提）', env_skip),
                      ('真机执行但被系统拒绝（权限/策略）', real_fail),
                      ('回落语义（真机路径没接上）', no_real),
                      ('显式跳过（安全锁屏不可逆 / 锁屏状态下不跑）', skipped),
                      ('无回帧', noreply)):
        if grp:
            print('\n%s：' % name)
            for r in grp:
                print('  %-24s %s' % (r['action'],
                                      r.get('error') or r.get('why')
                                      or json.dumps(r.get('effect') or {}, ensure_ascii=False)[:70]))
    tagged, canonical = save_evidence(rows, ok, env_skip, real_fail, no_real, noreply, locked)
    print('\n写出 %s' % tagged)
    print('     同时更新 %s（最近一次）' % canonical)
    return 0


def dry_write_check():
    """离线自检落盘逻辑：合成两行结果写进临时目录，断言三个文件都生成且内容对。"""
    tmp = os.path.join(EVID, '_drywrite_check')
    os.makedirs(tmp, exist_ok=True)
    rows = [{'action': 'A', 'ok': True, 'real': True, 'success': True, 'category': 'x'},
            {'action': 'B', 'ok': False, 'why': '合成'}]
    tagged, canonical = save_evidence(rows, [rows[0]], [], [], [], [rows[1]], False, out_dir=tmp)
    idx = os.path.join(tmp, '182_phone_sweep_index.jsonl')
    got = json.loads(io.open(canonical, encoding='utf-8').read())
    lines = io.open(idx, encoding='utf-8').read().strip().splitlines()
    checks = [('带时间戳文件生成', os.path.exists(tagged)), ('最近一次文件更新', os.path.exists(canonical)),
              ('索引追加一行', len(lines) >= 1), ('计数正确', got['ok'] == 1 and got['total'] == 2)]
    for n, c in checks:
        print('  %s %s' % ('OK  ' if c else 'FAIL', n))
    return 0 if all(c for _, c in checks) else 1


if __name__ == '__main__':
    if '--dry-run-write' in sys.argv:
        sys.exit(dry_write_check())
    sys.exit(main())
