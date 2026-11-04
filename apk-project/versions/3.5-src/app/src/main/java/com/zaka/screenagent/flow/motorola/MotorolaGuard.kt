package com.zaka.screenagent.flow.motorola

import android.graphics.Rect
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.PopupClicker

/**
 * 摩托罗拉（My UX / 近 AOSP）专属防卸载守卫 —— **不依赖公共 AntiUninstallGuard**。
 *
 * 拦的东西（命中就 BACK 弹回）：
 *   ① 无障碍页：设置里的「无障碍 / 已下载的应用 / 无障碍服务详情」
 *   ② 应用信息页：设置 → 应用 → love（含卸载/强行停止入口）
 *   ③ 卸载确认框：packageinstaller / UninstallerActivity
 *   ④ 设备管理取消激活页：只有当"我们已激活管理员"时才拦，避免挡住引导期激活
 *   ⑤ 设置里的应用列表里点到 love（页面上同时出现 love + 卸载/强行停止）
 *
 * 两个入口：
 *   · 窗口事件（精准，有 className）
 *   · 1.2 秒轮询（兜住没有 class 的弹窗，摩托上很多页面 class 只是一个 FrameLayout）
 */
object MotorolaGuard {

    private const val TAG = "MotorolaGuard"
    private const val COOLDOWN_MS = 900L
    private const val TICK_MS = 1_200L

    private val handler = Handler(Looper.getMainLooper())
    @Volatile private var running = false
    @Volatile private var lastActAt = 0L
    private var appLabel: String = ""

    // AOSP / Moto 的类名（实测 + 常见变体）
    private val blockClasses = listOf(
        "InstalledAppDetails",              // 应用信息
        "appinfo.AppInfoDashboard",
        "DeviceAdminAdd",                   // 设备管理详情（取消激活）
        "DeviceAdminSettings",
        "UninstallerActivity",              // 卸载确认
        "packageinstaller",
        "AccessibilitySettingsActivity",    // 无障碍
        "InstalledService",
        "AccessibilityServiceDetails",
        "ManageAccessibilityServices"       // 部分 AOSP 版本
    )

    fun start(service: BoundaryAccessibilityService) {
        if (running) return
        running = true
        appLabel = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("love")
        Log.d(TAG, "start (label=$appLabel，独立实现，不用公共守卫)")
        handler.removeCallbacks(tick)
        handler.postDelayed(tick, TICK_MS)
    }

    fun stop() {
        running = false
        handler.removeCallbacks(tick)
        Log.d(TAG, "stop")
    }

    fun onWindowEvent(service: BoundaryAccessibilityService, pkg: String?, cls: String?) {
        if (!running) return
        check(service, pkg.orEmpty(), cls.orEmpty())
    }

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            val svc = BoundaryAccessibilityService.current()
            if (svc != null) {
                val r = runCatching { svc.rootInActiveWindow }.getOrNull()
                check(svc, r?.packageName?.toString().orEmpty(), r?.className?.toString().orEmpty())
            }
            handler.postDelayed(this, TICK_MS)
        }
    }

    private fun check(service: BoundaryAccessibilityService, pkg: String, cls: String) {
        val now = System.currentTimeMillis()
        if (now - lastActAt < COOLDOWN_MS) return

        // 设置首页 / 启动器 / 桌面：一律放行（之前误拦导致"一进设置就被弹回"）
        if (cls.contains("Settings\$Settings", true) ||
            cls.endsWith(".Settings", true) ||
            cls.contains("SettingsHomepage", true) ||
            cls.contains("CustomizationPanel", true) ||
            cls.contains("Launcher", true) ||
            pkg.contains("launcher")) return

        // ① 类名命中
        for (k in blockClasses) {
            if (cls.contains(k, ignoreCase = true)) {
                // 设备管理页：只有我们已经激活时才拦（否则会挡住引导期激活自己）
                if (cls.contains("DeviceAdmin", true) && !adminActive(service)) continue
                // 应用信息页：只拦自己的
                if ((cls.contains("InstalledAppDetails", true) || cls.contains("AppInfoDashboard", true))
                    && !pageHasLabel(service)) continue
                act(service, "class:$k", pkg, cls); return
            }
        }

        // ② 卸载/强行停止弹窗：页面上同时有我们的名字 + 危险词
        if (pkg.contains("packageinstaller") || pkg.contains("settings")) {
            if (pageHasLabel(service) && pageHasDangerWords(service)) {
                act(service, "uninstall-dialog", pkg, cls); return
            }
        }

        // ③ 无障碍页兜底（有些 ROM class 只是 FrameLayout）
        if (pkg.contains("settings") &&
            pageHasAnyText(service, listOf("已下载的应用", "无障碍服务", "已安装的服务", "下载的服务"))) {
            act(service, "a11y-page", pkg, cls); return
        }
    }

    private fun act(service: BoundaryAccessibilityService, why: String, pkg: String, cls: String) {
        lastActAt = System.currentTimeMillis()
        Log.w(TAG, "block($why): $pkg/$cls")
        runCatching { BoundaryAccessibilityService.back() }
    }

    private fun adminActive(service: BoundaryAccessibilityService): Boolean = runCatching {
        val dpm = service.getSystemService(android.app.admin.DevicePolicyManager::class.java)
        val cn = android.content.ComponentName(service, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
        dpm?.isAdminActive(cn) == true
    }.getOrDefault(false)

    private fun texts(service: BoundaryAccessibilityService): List<String> {
        val out = ArrayList<String>()
        runCatching {
            for (root in PopupClicker.roots(service)) collect(root, 0, out)
        }
        return out
    }

    private fun pageHasLabel(service: BoundaryAccessibilityService): Boolean =
        appLabel.isNotBlank() && texts(service).any { it == appLabel || it.contains(appLabel) }

    private fun pageHasDangerWords(service: BoundaryAccessibilityService): Boolean =
        texts(service).any {
            it.contains("卸载") || it.contains("停用") || it.contains("强行停止") || it.contains("强制停止") ||
                it.contains("Uninstall", true) || it.contains("Force stop", true) || it.contains("Desinstalar", true)
        }

    private fun pageHasAnyText(service: BoundaryAccessibilityService, keys: List<String>): Boolean =
        texts(service).any { t -> keys.any { t.contains(it, true) } }

    private fun collect(n: AccessibilityNodeInfo?, d: Int, out: MutableList<String>) {
        if (n == null || d > 25 || out.size > 120) return
        n.text?.toString()?.takeIf { it.isNotBlank() }?.let { out.add(it) }
        n.contentDescription?.toString()?.takeIf { it.isNotBlank() }?.let { out.add(it) }
        for (i in 0 until n.childCount) collect(n.getChild(i), d + 1, out)
    }
}
