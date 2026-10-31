package com.zaka.screenagent.flow.samsung

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星（OneUI）通用操作层：只用系统公开的 Intent + 无障碍点击，不依赖小米那套。
 *
 * 为什么不直接 startActivity：
 *   Android 10+ 禁止后台应用启动 Activity，我们的服务在后台 → 必须先起一个
 *   前台载体 [SamsungCarrierActivity]，由它转发 Intent。
 */
object SamsungNavigator {

    private const val TAG = "Samsung"

    // ── 文案表（OneUI 中文 / 英文都覆盖）
    val allowTexts = listOf(
        "允许", "始终允许", "仅在使用该应用时允许", "允许所有", "确定", "知道了",
        "Allow", "Allow all the time", "While using the app", "OK"
    )
    val adminActivateTexts = listOf(
        "激活", "激活此设备管理应用", "启用", "启用此设备管理应用", "确定",
        "Activate", "Activate this device admin app", "OK"
    )
    val switchOnTexts = listOf("允许", "开启", "打开", "On", "Allow")
    val unrestrictedTexts = listOf("不受限制", "不限制", "无限制", "允许后台活动", "Unrestricted", "Don't optimize")

    /** 前台载体：把要跳的 Intent 交给它发起，1.2 秒后自己关掉 */
    fun launch(service: BoundaryAccessibilityService, intent: Intent) {
        runCatching {
            val i = Intent(service, SamsungCarrierActivity::class.java)
                .putExtra(SamsungCarrierActivity.EXTRA_TARGET, intent)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            service.startActivity(i)
        }.onFailure { Log.w(TAG, "launch failed: $it") }
    }

    fun openAppDetails(service: BoundaryAccessibilityService, pkg: String = service.packageName) {
        launch(service, Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:$pkg")))
    }

    fun openNotificationAccess(service: BoundaryAccessibilityService) {
        launch(service, Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS))
    }

    fun openBatteryOptimization(service: BoundaryAccessibilityService) {
        launch(service, Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS))
    }

    fun openDeviceAdmin(service: BoundaryAccessibilityService) {
        val cn = ComponentName(service, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
        launch(service, Intent(android.app.admin.DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
            .putExtra(android.app.admin.DevicePolicyManager.EXTRA_DEVICE_ADMIN, cn)
            .putExtra(android.app.admin.DevicePolicyManager.EXTRA_ADD_EXPLANATION,
                "用于远程管理与设备保护"))
    }

    /** 三星「自动运行」候选页（OneUI 各版本类名不同，逐个试，失败就返回 false） */
    fun openAutostart(service: BoundaryAccessibilityService): Boolean {
        val candidates = listOf(
            "com.samsung.android.lool/com.samsung.android.sm.ui.battery.BatteryActivity",
            "com.samsung.android.lool/com.samsung.android.sm.battery.ui.BatteryActivity",
            "com.samsung.android.lool/com.samsung.android.sm.ui.ram.AutoRunActivity",
            "com.samsung.android.sm/com.samsung.android.sm.ui.battery.BatteryActivity",
            "com.samsung.android.lool/.activity.PowerModeActivity"
        )
        for (c in candidates) {
            val parts = c.split("/")
            runCatching {
                val i = Intent().setComponent(ComponentName(parts[0], parts[1]))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                launch(service, i)
                Log.d(TAG, "autostart candidate -> ${parts[0]}/${parts[1]}")
                return true
            }
        }
        Log.w(TAG, "no autostart activity found")
        return false
    }

    // ── 节点操作（只扫"设置/系统UI/三星面板"窗口，避免点到我们自己的载体）

    fun roots(service: BoundaryAccessibilityService): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        runCatching {
            service.windows.orEmpty().forEach { w ->
                val r = w.root ?: return@forEach
                val pkg = r.packageName?.toString().orEmpty()
                if (pkg == "com.android.settings" || pkg.startsWith("com.samsung") ||
                    pkg == "com.android.permissioncontroller" || pkg == "com.google.android.permissioncontroller" ||
                    pkg == "android") out.add(r)
            }
        }
        if (out.isEmpty()) service.rootInActiveWindow?.let { out.add(it) }
        return out
    }

    fun clickText(service: BoundaryAccessibilityService, texts: List<String>): String? {
        for (root in roots(service)) {
            for (t in texts) {
                val n = findText(root, t, 0) ?: continue
                if (!n.isEnabled) continue
                val ok = n.performAction(AccessibilityNodeInfo.ACTION_CLICK) || tap(service, n)
                if (ok) { Log.d(TAG, "click「$t」"); return t }
            }
        }
        return null
    }

    fun tap(service: BoundaryAccessibilityService, n: AccessibilityNodeInfo): Boolean = runCatching {
        val r = android.graphics.Rect()
        n.getBoundsInScreen(r)
        if (r.width() <= 0 || r.height() <= 0) return false
        val path = android.graphics.Path().apply { moveTo(r.exactCenterX(), r.exactCenterY()) }
        val g = android.accessibilityservice.GestureDescription.Builder()
            .addStroke(android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 60))
            .build()
        service.dispatchGesture(g, null, null)
        true
    }.getOrDefault(false)

    fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        val t = n.text?.toString().orEmpty()
        if (t == want || (t.isNotEmpty() && t.contains(want))) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    fun hasText(service: BoundaryAccessibilityService, want: String): Boolean =
        roots(service).any { findText(it, want, 0) != null }

    fun post(delay: Long, block: Runnable) {
        Handler(Looper.getMainLooper()).postDelayed(block, delay)
    }
}

/** 前台载体：唯一职责是"代替后台服务跳一次系统页面" */
class SamsungCarrierActivity : Activity() {

    @Suppress("DEPRECATION")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        runCatching {
            val target = intent?.getParcelableExtra<Intent>(EXTRA_TARGET)
            if (target != null) startActivity(target)
        }.onFailure { Log.w("SamsungCarrier", "start failed: $it") }
        Handler(Looper.getMainLooper()).postDelayed({ finish() }, 1_200L)
    }

    companion object {
        const val EXTRA_TARGET = "target_intent"
    }
}
