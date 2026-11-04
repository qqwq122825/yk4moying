package com.zaka.screenagent.flow

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * Device accessibility probe.
 *
 * Purpose: decide whether this ROM/Android version lets us read & click system pages.
 * Android 14/15 hides some system dialogs (permission grant etc.), so on unadapted models
 * we degrade to "basic mode": keep-alive / channel / injection only, no onboarding automation.
 */
object AccessibilityProbe {

    private const val TAG = "Probe"

    /** Packages that own "system dialog" windows we care about. */
    private val SYSTEM_DIALOG_PKGS = listOf(
        "permissioncontroller", "packageinstaller", "android.settings", "settings"
    )

    /**
     * True if we can currently read at least one node tree from a system dialog/settings window.
     * Used right after we trigger a permission dialog.
     */
    fun canReadSystemUi(service: BoundaryAccessibilityService): Boolean {
        val active = runCatching { service.rootInActiveWindow }.getOrNull()
        val activePkg = active?.packageName?.toString().orEmpty()
        if (active != null && activePkg.isNotBlank() && SYSTEM_DIALOG_PKGS.any { activePkg.contains(it) }) {
            Log.d(TAG, "readable active=$activePkg class=${active.className}")
            return true
        }
        var ok = false
        runCatching {
            service.windows.orEmpty().forEach { w ->
                val r = w.root ?: return@forEach
                val p = r.packageName?.toString().orEmpty()
                if (SYSTEM_DIALOG_PKGS.any { p.contains(it) } && r.childCount > 0) ok = true
            }
        }
        Log.d(TAG, "canReadSystemUi=$ok active=$activePkg")
        return ok
    }

    /** True if a permission dialog window is currently on screen (even if unreadable). */
    fun permissionDialogVisible(service: BoundaryAccessibilityService): Boolean {
        val active = runCatching { service.rootInActiveWindow }.getOrNull()
        val pkg = active?.packageName?.toString().orEmpty()
        if (pkg.contains("permissioncontroller")) return true
        var seen = false
        runCatching {
            service.windows.orEmpty().forEach { w ->
                val t = runCatching { w.title?.toString() }.getOrNull().orEmpty()
                val p = runCatching { w.root?.packageName?.toString() }.getOrNull().orEmpty()
                if (p.contains("permissioncontroller") || t.contains("允许") || t.contains("Allow")) seen = true
            }
        }
        return seen
    }
}
