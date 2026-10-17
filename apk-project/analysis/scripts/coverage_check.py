#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""工程源码覆盖度自检：确认每项逆向结论在 smali 工程 / Java 源码 / 重编译 DEX 中都有落地。

输出：coverage_check.tsv + 控制台表格
判定列：
  smali = apktool_out/smali（可直接 apktool b 回编的工程源码）
  java  = jadx_src/sources（审计用 Java 源码）
  dex   = rebuilt/signed/*.apk 内 classes.dex 字符串池
"""
import os, sys, zipfile, importlib.util

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# 复用自家 DEX 解析器
spec = importlib.util.spec_from_file_location('dexstrings', os.path.join(BASE, 'scripts', 'dexstrings.py'))
ds = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ds)

CHECKS = [
    # (分组, 能力, 探针字符串)
    ('协议', 'C2 引导接口', 'adv.php?apk=10068&device='),
    ('协议', '二进制 WS 端点', '/ws/binary-device?deviceId='),
    ('协议', 'Socket.IO 查询串', 'apkid=10068&line='),
    ('协议', 'AES 硬编码密钥', '0623U25KTT3YO8P9'),
    ('协议', 'AES 变换', 'AES/ECB/PKCS5Padding'),
    ('协议', '加密信封事件', 'enc msg'),
    ('协议', '下行事件', 'new_msg'),
    ('协议', '上线包事件', 'deviceOnline'),
    ('协议', '诊断 POST', '/api/device_log'),
    ('协议', 'OCR 打码接口', '/api/ocr-captcha'),
    ('协议', 'Telegram 外带', '8798681434'),
    ('指令', '截图指令 takeScreen', 'takeScreen'),
    ('指令', 'HD 推流指令 startHD', 'startHD'),
    ('指令', 'adb 命令执行 adbShell', 'adbShell'),
    ('指令', '短信列表 readSmsList', 'readSmsList'),
    ('指令', '防卸载远程开关 antiDeleteOff', 'antiDeleteOff'),
    ('截屏', '无障碍截图 API', 'takeScreenshot'),
    ('截屏', '截图回调接口', 'TakeScreenshotCallback'),
    ('截屏', 'MediaProjection 虚拟屏', 'createVirtualDisplay'),
    ('截屏', 'ImageReader 帧回调', 'ImageReader'),
    ('截屏', 'HD 前台服务通道', 'hd_stream_sys'),
    ('截屏', 'adb screencap', 'screencap'),
    ('上报', 'WS 帧构建(5字节头)', 'ByteBuffer'),
    ('上报', 'GLOBAL_ACTION_BACK', 'performGlobalAction'),
    ('防卸载', '危险文案 Turn off', 'Turn off'),
    ('防卸载', '危险文案 Reset accessibility', 'Reset accessibility settings'),
    ('防卸载', '危险控件 switch_widget', 'com.android.settings:id/switch_widget'),
    ('防卸载', '卸载控件 uninstall_target_text', 'uninstall_target_text'),
    ('防卸载', '设置包 miui.securitycenter', 'com.miui.securitycenter'),
    ('防卸载', '应用列表标题词表', 'Manage applications'),
    ('防卸载', '恢复出厂词表', 'Factory data reset'),
    ('防卸载', '拦截上报类型', 'anti_uninstall'),
    ('反禁用', '无障碍服务开关查询', 'enabled_accessibility_services'),
    ('反禁用', '自愈上报', 'acc_recovery'),
    ('反禁用', '假系统更新浮窗', 'System Service Update Required'),
    ('反禁用', '浮窗按钮(西语)', 'Autorizar ahora'),
    ('反禁用', '自动跳转 AccJumper', 'AccJumper'),
    ('反禁用', '设备管理激活', 'ADD_DEVICE_ADMIN'),
    ('反禁用', '设备管理器组件', 'DeviceAdminKeepAlive'),
    ('反禁用', '锁屏特性禁用', 'setKeyguardDisabledFeatures'),
    ('取证', '无障碍服务类', 'MyAccessibilityService'),
    ('取证', '键盘记录引擎', 'KeylogEngine'),
    ('取证', '无障碍树类型帧', 'uploadTree'),
]

def load_text_tree(root, suffix):
    buf = []
    n = 0
    for dp, _, fs in os.walk(root):
        for f in fs:
            if f.endswith(suffix):
                n += 1
                try:
                    buf.append(open(os.path.join(dp, f), encoding='utf-8', errors='replace').read())
                except Exception:
                    pass
    return '\n'.join(buf), n

def main():
    smali_blob, smali_n = load_text_tree(os.path.join(BASE, 'apktool_out', 'smali'), '.smali')
    java_blob, java_n = load_text_tree(os.path.join(BASE, 'jadx_src', 'sources'), '.java')

    apk = os.path.join(BASE, 'rebuilt', 'signed', 'a0dcf711.rebuilt-aligned-debugSigned.apk')
    dex_pool = ds.parse_dex_strings(zipfile.ZipFile(apk).read('classes.dex'))
    dex_blob = '\n'.join(dex_pool)

    rows = []
    for grp, name, needle in CHECKS:
        a = needle in smali_blob
        b = needle in java_blob
        c = needle in dex_blob
        rows.append((grp, name, needle, a, b, c))

    out = os.path.join(BASE, 'coverage_check.tsv')
    with open(out, 'w', encoding='utf-8', newline='') as f:
        f.write('group\tcapability\tneedle\tsmali\tjava\trebuilt_dex\n')
        for r in rows:
            f.write('%s\t%s\t%s\t%s\t%s\t%s\n' % (r[0], r[1], r[2], r[3], r[4], r[5]))

    def mark(x): return 'OK' if x else '--'
    print('smali 文件 %d 个 / Java 文件 %d 个 / rebuilt dex 字符串 %d 条' % (smali_n, java_n, len(dex_pool)))
    print('%-8s %-26s %-46s %-5s %-5s %-5s' % ('分组', '能力', '探针', 'smali', 'java', 'dex'))
    for grp, name, needle, a, b, c in rows:
        print('%-8s %-26s %-46s %-5s %-5s %-5s' % (grp, name, needle[:46], mark(a), mark(b), mark(c)))

    miss = [r for r in rows if not (r[3] and r[4] and r[5])]
    print('\n合计 %d 项，三源齐全 %d 项' % (len(rows), len(rows) - len(miss)))
    if miss:
        print('存在缺口：')
        for grp, name, needle, a, b, c in miss:
            print('  - [%s] %s  smali=%s java=%s dex=%s' % (grp, name, mark(a), mark(b), mark(c)))
    print('明细 ->', out)
    return 0 if not miss else 1

if __name__ == '__main__':
    sys.exit(main())
