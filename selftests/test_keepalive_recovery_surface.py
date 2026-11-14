#!/usr/bin/env python3
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "apk-project/versions/4.0-src/app/src/main"

manifest = (SRC / "AndroidManifest.xml").read_text(encoding="utf-8")
job = (SRC / "java/com/zaka/screenagent/keepalive/KeepAliveJobService.kt").read_text(encoding="utf-8")
media = (SRC / "java/com/zaka/screenagent/keepalive/KeepAliveMediaService.kt").read_text(encoding="utf-8")
receiver = (SRC / "java/com/zaka/screenagent/keepalive/PackageEventReceiver.kt").read_text(encoding="utf-8")

checks = {
    "package receiver registered": "com.zaka.screenagent.keepalive.PackageEventReceiver" in manifest,
    "package scheme present": '<data android:scheme="package"' in manifest,
    "four package actions": all(x in manifest for x in (
        "android.intent.action.PACKAGE_ADDED",
        "android.intent.action.PACKAGE_REPLACED",
        "android.intent.action.PACKAGE_REMOVED",
        "android.intent.action.PACKAGE_CHANGED",
    )),
    "immediate job has separate id": re.search(r"IMMEDIATE_JOB_ID\s*=\s*9902", job) is not None,
    "immediate job has deadline": ".setOverrideDeadline(IMMEDIATE_DEADLINE_MS)" in job,
    "media destroy recovers": 'scheduleImmediate(this, "media_destroyed")' in media,
    "task removal recovers": 'scheduleImmediate(this, "task_removed")' in media,
    "receiver rearms all channels": all(x in receiver for x in (
        "KeepAliveJobService.schedule(context)",
        "KeepAliveJobService.scheduleImmediate(context",
        "AlarmReviveReceiver.schedule(context",
    )),
}

failed = [name for name, ok in checks.items() if not ok]
for name, ok in checks.items():
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
if failed:
    raise SystemExit("failed: " + ", ".join(failed))
print(f"RESULT: PASS ({len(checks)}/{len(checks)})")
