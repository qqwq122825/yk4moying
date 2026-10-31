package com.zaka.screenagent.flow.miui

import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 第四步：电池策略（小米「后台配置」页）
 *
 * 页面（实测 com.miui.powerkeeper/.ui.HiddenAppsConfigActivity）：
 *   ○ 无限制                    ← 要点这一项（列表第一项）
 *   ● 智能限制后台运行（推荐）    ← 默认选中
 *   ○ 后台运行超过10分钟后关闭
 *   ○ 禁止后台运行
 *
 * 这里不需要危险页；只点第一项，然后回读是否选中。
 */
object Step4 {

    private const val TAG = "Step4"
    private val ui = Handler(Looper.getMainLooper())

    private val FIRST_ITEM_TEXTS = listOf(
        "无限制", "不限制", "不受限制", "No restrictions", "Unrestricted",
        "Sin restricciones", "Sem restrições", "Sans restrictions", "Keine Einschränkungen",
        "Tanpa batasan", "Không hạn chế", "ไม่จำกัด", "بلا قيود"
    )

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开电池策略页")
        runCatching {
            service.startActivity(
                Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
                    .setData(Uri.parse("package:${service.packageName}"))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开失败: $it") }

        // 等 2 秒页面出来 → 点第一项
        ui.postDelayed({
            val ok = clickFirstOption(service)
            Log.d(TAG, "点击第一项(无限制) = $ok")
        }, 2_000L)

        // 4 秒后回读
        ui.postDelayed({
            val ok = firstOptionSelected(service)
            Log.d(TAG, "第一项已选中 = $ok")
            onDone(ok)
        }, 4_000L)
    }

    /** 点列表第一项：先按「无限制」文案，取不到就点列表里第一个可点项 */
    private fun clickFirstOption(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        for (t in FIRST_ITEM_TEXTS) {
            val n = findText(root, t, 0) ?: continue
            if (MiuiNavigator.tapByGesture(service, n)) {
                Log.d(TAG, "点「$t」")
                return true
            }
        }
        val first = firstClickable(root, 0)
        if (first != null && MiuiNavigator.tapByGesture(service, first)) {
            Log.d(TAG, "点第一个可点项 text=${first.text}")
            return true
        }
        return false
    }

    /** 回读：列表里是否已有项被选中（checked/selected） */
    private fun firstOptionSelected(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        var found = false
        fun walk(n: AccessibilityNodeInfo?, d: Int) {
            if (n == null || d > 30 || found) return
            if (n.isChecked || n.isSelected) { found = true; return }
            for (i in 0 until n.childCount) walk(n.getChild(i), d + 1)
        }
        walk(root, 0)
        return found
    }

    /** 列表里第一个可点、且带文案的项（就是第一项「无限制」） */
    private fun firstClickable(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.isClickable && !n.text?.toString().isNullOrEmpty()) return n
        for (i in 0 until n.childCount) firstClickable(n.getChild(i), d + 1)?.let { return it }
        return null
    }

    private fun findText(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findText(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }
}
