#!/usr/bin/env python3
"""4.0.4 双保险：已适配走分步脚本，未适配走词表兜底（KeywordFlow + GenericEngine）。"""
from pathlib import Path
import json, sys

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "apk-project/versions/4.0-src/app/src/main"
FLOW = SRC / "java/com/zaka/screenagent/flow"
ASSET = SRC / "assets/oem_pages.json"

flows = (FLOW / "VendorFlows.kt").read_text(encoding="utf-8")
engine = (FLOW / "GenericEngine.kt").read_text(encoding="utf-8")
kwflow = (FLOW / "KeywordFlow.kt").read_text(encoding="utf-8")
data = json.loads(ASSET.read_text(encoding="utf-8")) if ASSET.is_file() else {}

checks = []
def check(name, ok):
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    checks.append(ok)

check("词表文件存在", bool(data))
check("分组 ≥50", len(data.get("groups", {})) >= 50)
check("词条 ≥9000", sum(len(v) for v in data.get("groups", {}).values()) >= 9000)
check("含权限允许组", "ALLOW_BUTTON_TEXTS" in data.get("groups", {}))
check("含设备管理员组", "DEVICE_ADMIN_KEYWORDS" in data.get("groups", {}))
check("含电池/无限制组", "BATTERY_KEYWORDS" in data.get("groups", {}) and "NO_RESTRICTIONS_KEYWORDS" in data.get("groups", {}))
check("含 OPPO/VIVO 电池组", "OPPO_BATTERY_MANAGEMENT_KEYWORDS" in data.get("groups", {}) and "VIVO_NO_RESTRICTION_KEYWORDS" in data.get("groups", {}))
check("含自启动组", "AUTO_START_KEYWORDS" in data.get("groups", {}))

check("已适配厂商仍走分步", "Vendor.MIUI -> com.zaka.screenagent.flow.miui.MiuiFlow" in flows
      and "Vendor.SAMSUNG -> com.zaka.screenagent.flow.samsung.SamsungFlow" in flows
      and "Vendor.MOTOROLA -> com.zaka.screenagent.flow.motorola.MotorolaFlow" in flows)
check("未适配走词表兜底", "Vendor.DEFAULT -> KeywordFlow" in flows)
check("有强制调试开关", 'forced == "generic"' in flows and 'forced == "steps"' in flows)
check("引擎读词表", "oem_pages.json" in engine and "groups" in engine)
check("引擎有预算上限", "BUDGET_MS" in engine)
check("引擎跳过仅限这一次", "isForbidden" in engine and "this time" in engine)
check("引擎结束走收尾钩子", "OnboardingHooks.complete(service)" in kwflow)

failed = [i for i, ok in enumerate(checks) if not ok]
print(f"RESULT: {'PASS' if not failed else 'FAIL'} ({len(checks)-len(failed)}/{len(checks)})")
sys.exit(1 if failed else 0)
