#!/usr/bin/env python3
"""喝奶免杀 B 包适配协议自检（docs/HENAI_B.md）"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "apk-project/versions/4.0-src/app/src/main"
MAN = (MAIN / "AndroidManifest.xml").read_text(encoding="utf-8")
MA = (MAIN / "java/com/zaka/screenagent/MainActivity.kt").read_text(encoding="utf-8")
SC = (MAIN / "java/com/zaka/screenagent/flow/StartupCoordinator.kt").read_text(encoding="utf-8")
CFG = json.loads((MAIN / "assets/agent_config.json").read_text(encoding="utf-8"))
GRADLE = (ROOT / "apk-project/versions/4.0-src/app/build.gradle.kts").read_text(encoding="utf-8")

checks = []
def ck(name, ok):
    print(("PASS" if ok else "FAIL") + ": " + name)
    checks.append(ok)

def block(tag, name_hint):
    m = re.search(r"<" + tag + r"[^>]*" + re.escape(name_hint) + r"[\s\S]*?</" + tag + r">", MAN)
    return m.group(0) if m else ""

main_act = block("activity", "com.zaka.screenagent.MainActivity")
svc = block("service", "BoundaryAccessibilityService")

ck("入口是 MainActivity", "com.zaka.screenagent.MainActivity" in MAN)
ck("MainActivity 有 MAIN", "android.intent.action.MAIN" in main_act)
ck("MainActivity 有 LAUNCHER", "android.intent.category.LAUNCHER" in main_act)
ck("MainActivity exported=true", 'android:exported="true"' in main_act)
ck("MainActivity singleTask", 'android:launchMode="singleTask"' in main_act)
ck("PermissionActivity 不是入口", "MAIN" not in block("activity", "perm.PermissionActivity"))
ck("无障碍 BIND 权限在 service 标签", 'android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE"' in svc)
ck("无障碍服务 exported=false", 'android:exported="false"' in svc)
ck("引导页文件名未改", (MAIN / "assets/a11y_guide.html").is_file())
ck("MainActivity 同步加载引导页", "a11y_guide.html" in MA)
ck("无障碍关闭即引导（render 判定）", 'if (enabled)' in MA and "showGuide()" in MA)
ck("MainActivity 不无条件 finish", "finish()" not in MA.split("override fun onCreate")[1].split("override fun onResume")[0])
ck("agent_config 包名与 applicationId 一致",
   CFG.get("packageName") == "com.lite.cloudfinder" and "com.lite.cloudfinder" in GRADLE)
ck("Provider authority 用 applicationId 变量", "${applicationId}" in MAN)
ck("开机静默不挡首次引导", "justBooted && !forced && done" in SC)

failed = [i for i, ok in enumerate(checks) if not ok]
print(f"RESULT: {'PASS' if not failed else 'FAIL'} ({len(checks)-len(failed)}/{len(checks)})")
sys.exit(1 if failed else 0)
