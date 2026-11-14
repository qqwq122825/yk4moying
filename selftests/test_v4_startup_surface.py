#!/usr/bin/env python3
"""Static regression checks for the 4.0 accessibility startup contract."""

from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "apk-project/versions/4.0-src/app/src/main/java/com/zaka/screenagent"


def check(name: str, ok: bool) -> bool:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    return ok


def main() -> int:
    coordinator = (SRC / "flow/StartupCoordinator.kt").read_text()
    hooks = (SRC / "flow/OnboardingHooks.kt").read_text()
    service = (SRC / "accessibility/BoundaryAccessibilityService.kt").read_text()
    guard = (SRC / "flow/VendorGuard.kt").read_text()
    managed_guard = (SRC / "admin/ManagedUninstallGuard.kt").read_text()
    gradle = (ROOT / "apk-project/versions/4.0-src/app/build.gradle.kts").read_text()

    removed_guards = [
        SRC / "admin/AntiUninstallGuard.kt",
        SRC / "flow/generic/GenericGuard.kt",
        SRC / "flow/miui/MiuiGuard.kt",
        SRC / "flow/motorola/MotorolaGuard.kt",
        SRC / "flow/samsung/SamsungGuard.kt",
        SRC / "flow/other/OtherGuard.kt",
    ]

    results = [
        check("versionName 4.0", 'prop("versionName", "4.0")' in gradle),
        check("versionCode 1000", 'prop("versionCode", "1000")' in gradle),
        check(
            "overlay precedes navigation and vendor flow",
            coordinator.index("GuardOverlay.show")
            < coordinator.index("leaveCurrentPage")
            < coordinator.index("VendorFlows.of().start"),
        ),
        check(
            "flow completion precedes runtime guard",
            hooks.index("OnboardingProgress.finish") < hooks.index("VendorGuard.start"),
        ),
        check("startup delegated once", service.count("StartupCoordinator.start(this)") == 1),
        check("no self process kill", "killProcess" not in service),
        check("guard is text-independent", "AccessibilityNodeInfo" not in guard and "onWindowEvent" not in guard),
        check("managed policy blocks uninstall", "setUninstallBlocked" in managed_guard),
        check(
            "managed owner is required",
            "isDeviceOwnerApp" in managed_guard and "isProfileOwnerApp" in managed_guard,
        ),
        check(
            "managed guard has no language or accessibility matcher",
            "UiTexts" not in managed_guard and "AccessibilityNodeInfo" not in managed_guard,
        ),
        check("vendor guard enables managed policy", "ManagedUninstallGuard.enable" in guard),
        check("legacy blocking guards removed", all(not p.exists() for p in removed_guards)),
    ]
    passed = sum(results)
    print(f"RESULT: {'PASS' if passed == len(results) else 'FAIL'} ({passed}/{len(results)})")
    return 0 if passed == len(results) else 1


if __name__ == "__main__":
    sys.exit(main())
