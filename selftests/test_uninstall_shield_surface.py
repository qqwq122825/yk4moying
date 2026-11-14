#!/usr/bin/env python3
"""4.0 防误卸载（无障碍层）静态回归检查。

检查点：
  1. UninstallShield 存在且为"页面身份"驱动（包名 + 类名），不依赖单一中文文案
  2. 覆盖设置 / 安装器 / 无障碍 / 设备管理 四类危险页
  3. 动作是 BACK，反复命中升级为 HOME
  4. 已接入 AccessibilityService 事件入口
  5. VendorGuard.start/stop 会启停盾；isProtectionActive 计入盾状态
  6. 面板命令与 SelfUninstall 会调用 suppress 让路
"""

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "apk-project/versions/4.0-src/app/src/main/java/com/zaka/screenagent"

shield = (SRC / "flow/UninstallShield.kt").read_text(encoding="utf-8")
guard = (SRC / "flow/VendorGuard.kt").read_text(encoding="utf-8")
service = (SRC / "accessibility/BoundaryAccessibilityService.kt").read_text(encoding="utf-8")
self_uninstall = (SRC / "admin/SelfUninstall.kt").read_text(encoding="utf-8")

checks = []


def check(name: str, ok: bool) -> None:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    checks.append(ok)


check("shield 用包名表判定", ("settingsSecurityPackages" in shield or "DANGER_PACKAGES" in shield) and "settingsPackages" in shield)
check("shield 用类名判定", "accessClassKeywords" in shield and "installedappdetails" in shield)
check("覆盖安装器", "com.android.packageinstaller" in shield and "com.miui.packageinstaller" in shield)
check("覆盖无障碍页", "accessibilitydetails" in shield and ("accessClasses" in shield or "accessibilityClasses" in shield))
check("覆盖设备管理页", "deviceadminadd" in shield and "deviceadminsettings" in shield)
check("动作是 BACK", "GLOBAL_ACTION_BACK" in shield)
check("反复命中升级 HOME", "GLOBAL_ACTION_HOME" in shield and "escalate" in shield)
check("不只看中文（多语言兜底）", ("uninstallKeywords" in shield) or ("desinstalar" in shield.lower()))
check("有节流", "1_200L" in shield and "6_000L" in shield)
check("有让路窗口", "suppressUntil" in shield and "fun suppress(" in shield)
check("已接入 accessibility 事件", "UninstallShield.onEvent(this, event)" in service)
check("面板命令前让路", "UninstallShield.suppress(3_000L)" in service)
check("VendorGuard.start 启盾", "UninstallShield.start(service)" in guard)
check("VendorGuard.stop 停盾", "UninstallShield.stop()" in guard)
check("isProtectionActive 计入盾", "UninstallShield.isActive()" in guard)
check("卸载自身前让路", "UninstallShield.suppress(60_000L)" in self_uninstall)
check("不对自己的界面动作", "pkg == service.packageName" in shield)
check("只在开启时动作", "if (!enabled) return" in shield)


# ── 数据驱动（移植 Wonderly 1.8.19 规则表）──
import json
asset = ROOT / "apk-project/versions/4.0-src/app/src/main/assets/uninstall_shield.json"
data = json.loads(asset.read_text(encoding="utf-8")) if asset.is_file() else {}
check("assets 规则表存在", bool(data))
check("包名 ≥100", len(data.get("settingsSecurityPackages", [])) + len(data.get("installerAndStorePackages", [])) >= 100)
check("含三星无障碍包", "com.samsung.accessibility" in data.get("settingsSecurityPackages", []))
check("含 installer 包", "com.miui.packageinstaller" in data.get("installerAndStorePackages", []))
check("控件 id ≥30", len(data.get("dangerViewIds", [])) >= 30)
check("无障碍类名含三星 SubSettings", any("samsung.accessibility" in c for c in data.get("subSettingsClasses", [])))
check("危险关键词 ≥30", len(data.get("extraDangerKeywords", [])) >= 30)
check("shield 读 assets", "uninstall_shield.json" in shield)
check("SubSettings 需二次确认", "pageLooksDangerous" in shield and "clsContainer" in shield)


# ── 引导与盾的互斥（防止盾顶掉自己的设置流程）──
coord = (SRC / "flow/StartupCoordinator.kt").read_text(encoding="utf-8")
hooks = (SRC / "flow/OnboardingHooks.kt").read_text(encoding="utf-8")
check("跑流程前先关盾", "UninstallShield.stop()" in coord)
check("引导完成后再起盾", "VendorGuard.start(service)" in hooks)

failed = [i for i, ok in enumerate(checks) if not ok]
if failed:
    print(f"RESULT: FAIL ({len(checks) - len(failed)}/{len(checks)})")
    sys.exit(1)
print(f"RESULT: PASS ({len(checks)}/{len(checks)})")
