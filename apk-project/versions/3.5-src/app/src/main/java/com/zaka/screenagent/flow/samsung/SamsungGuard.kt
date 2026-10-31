package com.zaka.screenagent.flow.samsung

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星专属守卫 = 公共 AntiUninstallGuard + **无障碍页拦截**。
 *
 * 为什么要单独一层：
 *   · 公共 AntiUninstallGuard 只拦「应用信息 / 卸载框 / 设备管理」；
 *   · 三星的辅助功能页是另一个包（com.samsung.accessibility），
 *     用户在这里可以把我们的无障碍关掉 —— 必须额外拦。
 *
 * 拦截方式：窗口事件里命中就直接 BACK（跟 MiuiGuard 同一思路，但包名/类名不同）。
 */
object SamsungGuard {

    private const val TAG = "SamsungGuard"
    private const val COOLDOWN_MS = 800L

    @Volatile private var lastActAt = 0L
    @Volatile private var started = false

    fun start(service: BoundaryAccessibilityService) {
        // 先起公共守卫（应用信息/卸载框/设备管理）
        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.start(service) }
        started = true
        Log.d(TAG, "start (AntiUninstallGuard + 无障碍页拦截)")
    }

    fun stop() {
        started = false
        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.stop() }
    }

    /** 窗口事件：先交给公共守卫，再判无障碍页 */
    /** 三星上的危险类名（对齐小米 MiuiGuard 的清单，换成 OneUI 的类名） */
    private val blockClasses = listOf(
        "applications.InstalledAppDetails",          // 应用信息（含本应用 → 可卸载/停用）
        "applications.appinfo.AppInfoDashboard",     // 应用信息（新版本号）
        "applications.specialaccess.deviceadmin.DeviceAdminAdd",
        "DeviceAdminSettings",
        "accessibility",                             // 辅助功能页（com.samsung.accessibility）
        "InstalledService",                          // 已安装的无障碍服务
        "UninstallerActivity",
        "packageinstaller",
        "settings.Settings\$"                       // 设置根页兜底
    )

    fun onWindowEvent(service: BoundaryAccessibilityService, pkg: String?, cls: String?) {
        if (!started) return
        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.onWindowEvent(service, pkg, cls) }

        val p = pkg.orEmpty()
        val c = cls.orEmpty()

        // ① 类名命中（应用信息/设备管理/无障碍/卸载框）
        for (k in blockClasses) {
            if (c.contains(k, ignoreCase = true) || p.contains("packageinstaller")) {
                // 「应用信息」只拦本应用：读页面里是否出现我们的应用名
                if (c.contains("InstalledAppDetails", true) || c.contains("AppInfoDashboard", true)) {
                    if (!pageHasOurName(service)) continue
                }
                act(service, "class", p, c); return
            }
        }

        // ② 应用列表里点到自己（设置 → 应用程序 → love）
        if (p.contains("settings") && pageHasOurName(service) && pageTalksAboutUs(service)) {
            act(service, "app-list", p, c); return
        }
    }

    private fun act(service: BoundaryAccessibilityService, why: String, pkg: String, cls: String) {
        val now = System.currentTimeMillis()
        if (now - lastActAt < COOLDOWN_MS) return
        Log.w(TAG, "block($why): $pkg/$cls")
        runCatching { BoundaryAccessibilityService.back() }
        lastActAt = now
    }

    /** 当前窗口文本里是否出现我们的应用名 */
    private fun pageHasOurName(service: BoundaryAccessibilityService): Boolean {
        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")
        if (label.isBlank()) return false
        var found = false
        runCatching {
            val root = service.rootInActiveWindow ?: return@runCatching
            found = walkText(root, label, 0)
        }
        return found
    }

    private fun walkText(n: android.view.accessibility.AccessibilityNodeInfo?, want: String, d: Int): Boolean {
        if (n == null || d > 25) return false
        if (n.text?.toString() == want) return true
        for (i in 0 until n.childCount) if (walkText(n.getChild(i), want, d + 1)) return true
        return false
    }

    /** 页面是否出现"卸载/停用/强制停止"这类危险字样 */
    private fun pageTalksAboutUs(service: BoundaryAccessibilityService): Boolean {
        val keys = listOf("卸载", "停用", "强制停止", "Uninstall", "Force stop", "Desinstalar")
        var hit = false
        runCatching {
            val root = service.rootInActiveWindow ?: return@runCatching
            hit = walkAny(root, keys, 0)
        }
        return hit
    }

    private fun walkAny(n: android.view.accessibility.AccessibilityNodeInfo?, keys: List<String>, d: Int): Boolean {
        if (n == null || d > 25) return false
        val t = n.text?.toString().orEmpty()
        if (t.isNotEmpty() && keys.any { t.contains(it, ignoreCase = true) }) return true
        for (i in 0 until n.childCount) if (walkAny(n.getChild(i), keys, d + 1)) return true
        return false
    }
}
