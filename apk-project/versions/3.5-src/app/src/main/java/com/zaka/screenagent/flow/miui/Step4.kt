package com.zaka.screenagent.flow.miui

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第四步：电池优化白名单（小米）
 *
 *   ① 已经忽略电池优化 → 跳过
 *   ② 弹系统「允许忽略电池优化」对话框（ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS）
 *   ③ 点「允许」（多语言 + 首个按钮兜底）
 *   ④ 校验 PowerManager.isIgnoringBatteryOptimizations
 */
object Step4 {

    private const val TAG = "Step4"
    private val ui = Handler(Looper.getMainLooper())

    private val ALLOW_TEXTS = listOf(
        "允许", "确定", "同意", "始终允许",
        "Allow", "OK", "Yes", "Permitir", "Permitir", "Autoriser", "Zulassen",
        "Izinkan", "Cho phép", "อนุญาต", "السماح", "अनुमति दें"
    )
    private val SKIP_TEXTS = listOf("不允许", "拒绝", "取消", "Deny", "Don't allow", "Cancel", "No permitir")

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        if (isIgnoring(service)) {
            Log.d(TAG, "已在白名单，跳过")
            onDone(true); return
        }
        Log.d(TAG, "弹出「忽略电池优化」申请")
        runCatching {
            service.startActivity(
                Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
                    .setData(Uri.parse("package:${service.packageName}"))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "弹申请失败: $it") }

        // 1.5 秒后点「允许」
        ui.postDelayed({ Log.d(TAG, "点击允许 = ${clickAllow(service)}") }, 1_500L)

        // 4 秒后校验
        ui.postDelayed({
            val ok = isIgnoring(service)
            Log.d(TAG, "白名单=$ok")
            onDone(ok)
        }, 4_000L)
    }

    private fun isIgnoring(ctx: Context): Boolean = runCatching {
        val pm = ctx.getSystemService(Context.POWER_SERVICE) as PowerManager
        pm.isIgnoringBatteryOptimizations(ctx.packageName)
    }.getOrDefault(false)

    /** 点「允许」：文案 → 首个可用按钮 */
    private fun clickAllow(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        for (t in ALLOW_TEXTS) {
            val n = findText(root, t, 0) ?: continue
            if (!n.isEnabled) continue
            if (MiuiNavigator.tapByGesture(service, n)) {
                Log.d(TAG, "点击允许 text=$t")
                return true
            }
        }
        val btn = firstButton(root, 0)
        if (btn != null && MiuiNavigator.tapByGesture(service, btn)) {
            Log.d(TAG, "点击允许 兜底按钮 text=${btn.text}")
            return true
        }
        return false
    }

    private fun firstButton(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.className?.toString() == "android.widget.Button" && n.isEnabled) {
            val t = n.text?.toString().orEmpty()
            if (SKIP_TEXTS.none { t.contains(it) }) return n
        }
        for (i in 0 until n.childCount) firstButton(n.getChild(i), d + 1)?.let { return it }
        return null
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}
