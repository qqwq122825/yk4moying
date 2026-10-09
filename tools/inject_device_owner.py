#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把能力 APK 设成 **device owner**（不删任何账号）—— 只为让"指纹/生物识别策略"这类 DO 专属指令真生效。

## 为什么需要（实测）
`disableBiometric` / `enableBiometric` 走的 `DevicePolicyManager.setKeyguardDisabledFeatures`
是 **DO/PO 专属 API**；普通 admin 调用必回 `SecurityException`。而标准路径都被"账号"挡住：

```
$ dpm set-device-owner  com.ref.labagent/.AdminReceiver
    Not allowed to set the device owner because there are already some accounts on the device
$ dpm set-profile-owner com.ref.labagent/.AdminReceiver
    Not allowed to set the profile owner because there are already some accounts on the profile
```

这台机器 user 0 上有 8 个用户自己的第三方账号 → 标准路径要**删账号**。本工具走**设备策略 XML 注入**，
一个账号都不动。

## XML 格式怎么来的（不是猜的）
协议分析服务端 `services.jar` 的 `DevicePolicyManagerService$Owners$OwnerInfo.readFromXml`
（`dexdump -d` 反汇编，行 4b1076 起）：

```
getAttributeValue(null, "package")   → 包名
getAttributeValue(null, "name")      → 人类可读名（不是类名！）
getAttributeValue(null, "component") → ComponentName.unflattenFromString(...)   ← 类名在这里
     解析失败 → "Error parsing owner file. Bad component name"
userRestrictionsMigrated / canAccessDeviceIds / isPoOrganizationOwnedDevice
<device-owner-context userId="0"/>
```

`component` 必须是**扁平形式**（`pkg/.Receiver`）—— 用全限定名或 `class`/`component-name` 都会得到
`ComponentInfo{com.ref.labagent/}`（空类名，DO 形同虚设、`no-admin`）。**这一条踩了 4 轮才定位**。

## 写入路径（也踩过）
* magisk 域的 root **不能新建** `system_data_file`（`cp` → Permission denied，`setenforce 0` 也不行）；
* **以 uid 1000(system) 运行就能写**：`su 1000 -c 'cp ...'` —— 这是可用路径；
* 覆盖已存在的文件也会被拒 → **先 `rm` 再 `cp`**；
* 写完 `chmod 644` + `restorecon -F`（标签 `u:object_r:system_data_file:s0` 才对，system_server 才读得到）。

## 用法
    python tools/inject_device_owner.py --status        # 看现在是不是 owner / 管理员是否激活
    python tools/inject_device_owner.py --install       # 注入 XML（会重启手机）
    python tools/inject_device_owner.py --post-reboot   # 重启后：解锁 + 激活管理员 + 验证
    python tools/inject_device_owner.py --remove        # 回滚：删 XML（下次重启后回到无 owner）

凭据：PIN 只从环境变量 `REF_PIN` 取，**不落盘**。
"""
import argparse
import os
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
REPRO = os.path.dirname(HERE)
ADB = r'adb'
SER = ''
PKG = 'com.ref.labagent'
COMP = PKG + '/.AdminReceiver'
XML = 'device_owner_2.xml'
STAGE = os.path.join(REPRO, 'state', 'do')

XML_BODY = """<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<root>
<device-owner package="%s" name="LabAgent" component="%s" userRestrictionsMigrated="true" canAccessDeviceIds="false" />
<device-owner-context userId="0" />
</root>
""" % (PKG, COMP)


def sh(cmd, su=False, uid=None, t=60):
    """su=True 走 root；uid=1000 走 system 身份（写 /data/system 的关键）。"""
    if uid:
        full = "su %d -c '%s'" % (uid, cmd.replace("'", "'\\''"))
    elif su:
        full = "su -c '%s'" % cmd.replace("'", "'\\''")
    else:
        full = cmd
    try:
        r = subprocess.run([ADB, '-s', SER, 'shell', full], capture_output=True, text=True,
                           encoding='utf-8', errors='replace', timeout=t)
        return ((r.stdout or '') + (r.stderr or '')).strip()
    except Exception as e:
        return 'ERR %s' % e


def bridge(cmd, **kw):
    import json
    payload = json.dumps(dict(cmd=cmd, **kw))
    return sh("echo '%s' | nc 127.0.0.1 8788" % payload, su=True, t=30)


def status():
    print('== 包 ==')
    print('  pm path        :', sh('pm path %s' % PKG).splitlines()[:1])
    print('== owners ==')
    print(sh('dpm list-owners', su=True))
    print('== 桥（admin.active）==')
    print(' ', bridge('admin.active')[:200])


def install():
    os.makedirs(STAGE, exist_ok=True)
    local = os.path.join(STAGE, XML)
    with open(local, 'w', encoding='utf-8') as f:
        f.write(XML_BODY)
    print('已写模板:', local)
    sh('push "%s" /data/local/tmp/do.xml' % local) if False else None
    r = subprocess.run([ADB, '-s', SER, 'push', local, '/data/local/tmp/do.xml'],
                       capture_output=True, text=True, encoding='utf-8', errors='replace')
    print('push:', (r.stdout or r.stderr or '').strip()[:80])
    print('xml2abx:', sh('xml2abx /data/local/tmp/do.xml /data/local/tmp/do.abx', su=True)[:80])
    print('rm 旧文件:', sh('rm -f /data/system/%s' % XML, su=True)[:60] or 'ok')
    print('以 system 身份写入:', sh('cp /data/local/tmp/do.abx /data/system/%s' % XML,
                                  uid=1000)[:80] or 'ok')
    print('权限/标签:', sh('chmod 644 /data/system/%s; restorecon -F /data/system/%s; '
                          'ls -lZ /data/system/%s' % (XML, XML, XML), su=True)[:160])
    print('\n下一步：重启手机（DPMS 只在开机时读这个文件），然后跑 --post-reboot')


def post_reboot():
    """重启后：用 PIN 解锁 → 激活管理员 → 验证（PIN 只从 REF_PIN 取）。"""
    pin = os.environ.get('REF_PIN')
    if not pin:
        print('缺 REF_PIN（口令不落盘，从环境变量传）'); return 2
    for i in range(3):
        sh('input keyevent 224', su=True); time.sleep(2)
        sh('input swipe 540 2000 540 600 300', su=True); time.sleep(2)
        sh('input text %s' % pin, su=True); time.sleep(1)
        sh('input keyevent 66', su=True); time.sleep(3)
        if 'false' in sh('dumpsys window | grep -m1 isKeyguardShowing').lower():
            print('解锁成功（第 %d 次）' % (i + 1)); break
    else:
        print('没能解锁（keyguard 仍在）—— 需要人工解锁一次'); return 1
    print('激活管理员:', sh('dpm set-active-admin %s' % COMP, su=True)[:120])
    sh('monkey -p %s -c android.intent.category.LAUNCHER 1' % PKG, su=False)
    sh('monkey -p %s -c android.intent.category.LAUNCHER 1' % PKG, su=True)
    time.sleep(4)
    # 重启/装机/策略变更后 MIUI 会撤掉悬浮窗权限，一并对齐
    sh('appops set %s SYSTEM_ALERT_WINDOW allow' % PKG, su=True)
    print('admin.active:', bridge('admin.active')[:200])
    print('biometric 试调:', bridge('admin.biometric', disabled=False)[:200])
    return 0


def remove():
    print('删 XML（重启后回「无 owner」）:', sh('rm -f /data/system/%s' % XML, su=True)[:60] or 'ok')
    print('或由应用自己清:', bridge('admin.clearOwner')[:160])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--status', action='store_true')
    ap.add_argument('--install', action='store_true')
    ap.add_argument('--post-reboot', action='store_true')
    ap.add_argument('--remove', action='store_true')
    a = ap.parse_args()
    if a.install:
        install(); return 0
    if a.post_reboot:
        return post_reboot()
    if a.remove:
        remove(); return 0
    status(); return 0


if __name__ == '__main__':
    sys.exit(main())
