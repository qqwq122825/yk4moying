package com.zaka.screenagent.flow.miui

import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import androidx.core.content.ContextCompat
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.perm.PermissionActivity
import com.zaka.screenagent.perm.PermissionFlow

/**
 * 小米第一步：**自动申请权限 + 自动点「允许」**（小米专属实现，不共用通用 PermissionClicker）。
 *
 * 用法：
 *   MiuiPermission.run(service) { 全部拿到 -> true }
 *
 * 内部循环：
 *   ① 每 2 秒检查还缺几项；缺就拉起权限页（最多 6 次）
 *   ② 每 800ms 扫一次当前窗口，把「允许 / Allow / 始终允许」点掉
 *   ③ 全部授权后回调 onDone(true)
 */
object MiuiPermission {

    private const val TAG = "MiuiPermission"
    private val ui = Handler(Looper.getMainLooper())

    /** 允许类按钮文案（覆盖常见语言） */
    private val ALLOW_TEXTS = listOf(
        "允许", "始终允许", "仅在使用中允许", "本次允许", "允许所有", "确定", "同意",
        "Allow", "Allow all the time", "Allow only while using the app", "While using the app",
        "Permitir", "Permitir todo el tiempo", "Permitir solo mientras se usa la app",
        "Permitir", "Permitir o tempo todo", "Permitir apenas durante o uso do app",
        "Izinkan", "Selalu izinkan", "Izinkan saat aplikasi digunakan",
        "Cho phép", "Luôn cho phép",
        "อนุญาต", "อนุญาตตลอดเวลา",
        "السماح", "اسمح", "बिल्कुल सही", "अनुमति दें", "اجازت دیں", "Payagan", "Pahintulutan"
    )

    private var running = false

    /** 开始：申请 + 自动点允许；权限齐了回调 true */
    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        if (running) { Log.d(TAG, "已在运行，忽略重复调用"); return }
        running = true
        Log.d(TAG, "开始：缺 ${missing(service)} 项")
        openPage(service, 1)

        var ticks = 0
        fun tick() {
            val m = missing(service)
            if (m == 0) {
                running = false
                Log.d(TAG, "全部已授予")
                onDone(true); return
            }
            clickAllow(service)
            if (ticks++ > 90) {            // ≈ 90 秒
                running = false
                Log.w(TAG, "超时，仍缺 $m 项")
                onDone(false); return
            }
            ui.postDelayed({ tick() }, 800L)
        }
        ui.postDelayed({ tick() }, 800L)
    }

    /** 拉起权限页（MIUI 会丢第一次后台启动，2 秒一次重试） */
    private fun openPage(service: BoundaryAccessibilityService, attempt: Int) {
        if (missing(service) == 0) return
        if (onPermissionDialog(service)) { Log.d(TAG, "权限弹窗已在前台，不再拉起"); return }
        Log.d(TAG, "打开权限页 attempt=$attempt")
        runCatching {
            service.startActivity(
                Intent(service, PermissionActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开权限页失败 $it") }
        if (attempt < 6) {
            ui.postDelayed({ if (missing(service) > 0) openPage(service, attempt + 1) }, 2_000L)
        }
    }

    /** 否定词：出现这些一律不点 */
    private val NEGATIVE = listOf("不允许", "拒绝", "禁止", "Don\'t allow", "Deny", "No permitir", "Negar", "Não permitir")

    /**
     * 扫当前窗口，点掉权限弹窗里的「允许」类按钮。
     * 实测这台机器只有：仅在使用该应用时允许 / 仅限这一次 / 不允许，
     * 所以用"包含允许且不含否定词"匹配，并挑最靠上的那个（正向按钮在上面）。
     */
    private fun clickAllow(service: BoundaryAccessibilityService) {
        val root = service.rootInActiveWindow ?: return
        val cands = ArrayList<AccessibilityNodeInfo>()
        collectAllow(root, 0, cands)
        if (cands.isEmpty()) return
        // 最靠上（y 最小）的那个通常是正向按钮
        cands.sortBy { val r = android.graphics.Rect(); it.getBoundsInScreen(r); r.top }
        for (n in cands) {
            if (!n.isEnabled) continue
            if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK) || tap(service, n)) {
                Log.d(TAG, "CLICK 允许 text=${n.text}")
                return
            }
        }
    }

    private fun collectAllow(n: AccessibilityNodeInfo?, d: Int, out: MutableList<AccessibilityNodeInfo>) {
        if (n == null || d > 30) return
        val t = n.text?.toString().orEmpty()
        if (t.isNotEmpty() && t.contains("允许") && NEGATIVE.none { t.contains(it) }) {
            out.add(n); return
        }
        // 英文/其它语言：Allow / Permitir / Izinkan …
        if (t.isNotEmpty() && (t.startsWith("Allow") || t.startsWith("Permitir") || t.startsWith("Autoriser") ||
                t.startsWith("Zulassen") || t.startsWith("Izinkan") || t.startsWith("Cho phép"))) {
            if (NEGATIVE.none { t.contains(it, ignoreCase = true) }) { out.add(n); return }
        }
        for (i in 0 until n.childCount) collectAllow(n.getChild(i), d + 1, out)
    }

    /** 当前是否已经是系统权限弹窗（避免重复拉起） */
    private fun onPermissionDialog(service: AccessibilityService): Boolean {
        val pkg = runCatching { service.rootInActiveWindow?.packageName?.toString().orEmpty() }.getOrDefault("")
        return pkg.contains("permissioncontroller") || pkg.contains("permissioncontrollerx")
    }

    private fun missing(service: AccessibilityService): Int = PermissionFlow.PERMISSIONS.count {
        ContextCompat.checkSelfPermission(service, it) != PackageManager.PERMISSION_GRANTED
    }

    private fun tap(service: AccessibilityService, n: AccessibilityNodeInfo): Boolean {
        val r = android.graphics.Rect()
        n.getBoundsInScreen(r)
        if (r.width() <= 0 || r.height() <= 0) return false
        val path = android.graphics.Path().apply { moveTo(r.exactCenterX(), r.exactCenterY()) }
        val stroke = android.accessibilityservice.GestureDescription.StrokeDescription(path, 0, 80)
        val g = android.accessibilityservice.GestureDescription.Builder().addStroke(stroke).build()
        return runCatching { service.dispatchGesture(g, null, null) }.getOrDefault(false)
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}
