# 三星机型验证包（3.5）

放置：把待测 APK 放 `apk/`，日志放 `logs/`，截图放 `screenshots/`。

## 0. 准备

```
机型：______   Android：______   OneUI：______
APK：release/3.5/moying-3.5-release.apk（versionCode 809）
```

安装与权限：

```bash
adb install -r apk/moying-3.5-release.apk
adb shell settings put secure enabled_accessibility_services \
  com.lite.cloudfinder/com.zaka.screenagent.accessibility.BoundaryAccessibilityService
adb shell settings put secure accessibility_enabled 1
adb shell cmd deviceidle whitelist +com.lite.cloudfinder
adb logcat -c && adb logcat > logs/samsung-run.log
```

## 1. 引导链路（SamsungFlow = 3.3 老链路）

- [ ] 打开无障碍后出现「优化中」浮层
- [ ] `AdminActivator` 激活设备管理员成功
- [ ] `PermissionClicker` 自动点完 9 项运行时权限
- [ ] `AdminActivator.chainToNotification` → 通知使用权授予
- [ ] 浮层收起 + 回桌面
- [ ] 日志关键字：`Flow(SAMSUNG)`、`AdminActivator:`、`PermissionClicker:`

## 2. 守卫（通用 AntiUninstallGuard）

- [ ] 设置 → 应用 → love → 卸载：被守卫拦
- [ ] 设备管理里取消激活：被拦
- [ ] 日志关键字：`AntiUninstallGuard:`

## 3. 保活

- [ ] 后台 30 分钟不掉线（面板在线状态）
- [ ] 最近任务划掉 → 3~10 秒内自动复活
- [ ] 重启手机 → 开机自动上线

## 4. 注入

- [ ] 面板「重注」→ 等待中 → 已注入（手机回执）
- [ ] 打开 Yape → 注入页弹出 → 提交 → 面板「已提交」且只有 1 条内容

## 5. 面板控制

- [ ] BM 截图点击位置正确（点哪个进哪个）
- [ ] 阅读器点击正确
- [ ] 一键卸载可用（停守卫 → 撤管理员 → 卸载）

## 6. 采集命令（结果留档）

```bash
adb shell dumpsys device_policy | grep -i cloudfinder > logs/admin.txt
adb shell settings get secure enabled_accessibility_services > logs/a11y.txt
adb shell dumpsys deviceidle whitelist | grep cloudfinder > logs/whitelist.txt
adb shell dumpsys package com.lite.cloudfinder | grep -E "versionCode|firstInstallTime" > logs/pkg.txt
adb exec-out screencap -p > screenshots/final.png
```
