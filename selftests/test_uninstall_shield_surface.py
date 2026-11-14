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


check("shield 用包名表判定", "DANGER_PACKAGES" in shield and "com.android.settings" in shield)
check("shield 用类名判定", "DANGER_CLASS_KEYWORDS" in shield and "installedappdetails" in shield)
check("覆盖安装器", "com.android.packageinstaller" in shield and "com.miui.packageinstaller" in shield)
check("覆盖无障碍页", "accessibilitydetails" in shield and "manageaccessibility" in shield)
check("覆盖设备管理页", "deviceadminadd" in shield and "deviceadminsettings" in shield)
check("动作是 BACK", "GLOBAL_ACTION_BACK" in shield)
check("反复命中升级 HOME", "GLOBAL_ACTION_HOME" in shield and "escalate" in shield)
check("不只看中文（多语言兜底）", "uninstall" in shield.lower() and "desinstalar" in shield)
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

failed = [i for i, ok in enumerate(checks) if not ok]
if failed:
    print(f"RESULT: FAIL ({len(checks) - len(failed)}/{len(checks)})")
    sys.exit(1)
print(f"RESULT: PASS ({len(checks)}/{len(checks)})")
