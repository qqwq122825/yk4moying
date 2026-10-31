package com.zaka.screenagent.flow.miui

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.MoyingAdminReceiver

/**
 * 小米专属「防关闭守卫」—— 只管小米上那几页，不碰公共的 AntiUninstallGuard。
 *
 * 要顶住的动作（全部用 BACK 弹回）：
 *   ① 无障碍设置页（MiuiAccessibilitySettingsActivity / 已下载的应用列表）→ 防止关掉无障碍
 *   ② 本应用的「应用信息」页（ApplicationsDetailsActivity）→ 防止强制停止/卸载
 *   ③ 卸载确认框（packageinstaller）
 *   ④ 设备管理取消激活页（DeviceAdminAdd / DeviceManagerApplyActivity）
 *   ⑤ 安全中心里「应用管理」本应用条目
 *
 * 两个入口：窗口事件（精准）+ 800ms 轮询（兜住没 class 的弹窗）。
 */
object MiuiGuard {

    private const val TAG = "MiuiGuard"
    private const val COOLDOWN_MS = 800L

    private val handler = Handler(Looper.getMainLooper())
    private var running = false
    private var lastActAt = 0L
    private var appName: String = ""

    private val blockClasses = listOf(
        "accessibility.MiuiAccessibilitySettingsActivity",
        "accessibility.AccessibilitySettingsActivity",
        "appmanager.ApplicationsDetailsActivity",
        "application.specialaccess.deviceadmin.DeviceAdminAdd",
        "privacymanager.DeviceManagerApplyActivity",
        "permcenter.permissions.PermissionsEditorActivity",
        "packageinstaller",
        "UninstallerActivity",
        "appmanager.AppManagerMainActivity"
    )

    fun start(service: BoundaryAccessibilityService) {
        if (running) return
        running = true
        appName = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")
        Log.d(TAG, "start (appName=$appName)")
        handler.removeCallbacks(tick)
        handler.postDelayed(tick, 800L)
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
        Log.d(TAG, "stop")
    }

    fun isRunning() = running

    /** 窗口事件入口：有 className，最准 */
    fun onWindowEvent(service: BoundaryAccessibilityService, pkg: String?, cls: String?) {
        if (!running || pkg == null || cls == null) return
        val now = System.currentTimeMillis()
        if (now - lastActAt < COOLDOWN_MS) return
        if (dangerous(pkg, cls) && pressBack(service)) lastActAt = now
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            val svc = BoundaryAccessibilityService.current()
            if (svc != null) {
                val pkg = runCatching { svc.rootInActiveWindow?.packageName?.toString().orEmpty() }.getOrDefault("")
                val cls = runCatching { svc.rootInActiveWindow?.className?.toString().orEmpty() }.getOrDefault("")
                val now = System.currentTimeMillis()
                if (now - lastActAt >= COOLDOWN_MS && dangerous(pkg, cls)) {
                    if (pressBack(svc)) lastActAt = now
                }
            }
            handler.postDelayed(this, 800L)
        }
    }

    /** 判断当前页是不是"会让我们掉权限/被卸载"的页面 */
    private fun dangerous(pkg: String, cls: String): Boolean {
        if (pkg.isBlank() && cls.isBlank()) return false
        // ① 类名命中
        for (k in blockClasses) {
            if (cls.contains(k, ignoreCase = true)) {
                Log.w(TAG, "block by class: $pkg/$cls")
                return true
            }
        }
        // ② 设置族里的无障碍页（小米有时用 SubSettings 包一层）
        if (pkg.contains("settings") && cls.contains("SubSettings", ignoreCase = true)) {
            val texts = currentTexts()
            if (texts.any { it.contains("无障碍") || it.contains("辅助功能") }) {
                Log.w(TAG, "block accessibility subscreen by text")
                return true
            }
        }
        // ③ 卸载确认框：包里带我们自己名字 + 有"卸载/取消"
        if (pkg.contains("packageinstaller") || pkg.contains("miui") || pkg.contains("settings")) {
            val texts = currentTexts()
            val hasName = appName.isNotBlank() && texts.any { it.contains(appName) }
            val hasUninstall = texts.any { it.contains("卸载") || it.contains("停用") || it.contains("强制停止") }
            if (hasName && hasUninstall) {
                Log.w(TAG, "block uninstall/force-stop dialog")
                return true
            }
        }
        return false
    }

    private fun currentTexts(): List<String> {
        val out = ArrayList<String>()
        val svc = BoundaryAccessibilityService.current() ?: return out
        runCatching {
            val roots = ArrayList<AccessibilityNodeInfo>()
            svc.rootInActiveWindow?.let { roots.add(it) }
            svc.windows.orEmpty().forEach { w -> w.root?.let { if (it !in roots) roots.add(it) } }
            for (r in roots) collectText(r, 0, out)
        }
        return out
    }

    private fun collectText(n: AccessibilityNodeInfo?, d: Int, out: MutableList<String>) {
        if (n == null || d > 30 || out.size > 60) return
        n.text?.toString()?.takeIf { it.isNotBlank() }?.let { out.add(it) }
        for (i in 0 until n.childCount) collectText(n.getChild(i), d + 1, out)
    }

    private fun pressBack(service: BoundaryAccessibilityService): Boolean =
        runCatching { BoundaryAccessibilityService.back() }.getOrDefault(false)
}
