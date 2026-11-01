package com.zaka.screenagent.flow.motorola

import android.graphics.Rect
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.notify.NotificationAccessActivator

/**
 * 摩托罗拉第三步：**通知使用权**
 *
 * 摩托罗拉实测（OneUI 5 / Android 13）列表结构：
 *   一行 = TextView(android:id/title, 应用名) + Switch(id=switch_widget)
 *   点 Switch → 可能弹「允许 love 访问通知？」确认框（按钮：允许/取消）
 *
 * 所以：找到应用名那一行 → 点**同一行内**的 Switch → 点确认框的「允许」→ 回读校验。
 * 找不到该行时下滑列表继续找（love 在列表靠下位置，实测 y≈1776）。
 */
object Step3 {

    private const val TAG = "Moto-Step3"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开通知使用权页")
        MotorolaNavigator.openNotificationAccess(service)

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (NotificationAccessActivator.isGranted(service)) {
                    Log.d(TAG, "通知使用权已授予")
                    onDone(true)
                    return
                }
                val clicked = label.isNotBlank() && clickRowSwitch(service, label)
                if (clicked) {
                    Log.d(TAG, "点了「$label」的开关")
                    // 点完立刻处理可能出现的确认框（允许/确定）
                    MotorolaNavigator.post(1_000L) {
                        val ok = MotorolaNavigator.clickButtonExact(service, listOf("允许", "确定", "OK", "Allow", "Permitir", "Aceptar", "Ativar"))
                        Log.d(TAG, "确认框点击=${ok ?: "无"}")
                    }
                } else if (ticks % 2 == 0) {
                    scrollDown(service)
                }
                if (ticks >= 16) {
                    val got = NotificationAccessActivator.isGranted(service)
                    Log.w(TAG, "超时 granted=$got")
                    onDone(got)
                    return
                }
                MotorolaNavigator.post(2_500L, this)
            }
        }
        MotorolaNavigator.post(2_500L, tick)
    }

    /** 精确匹配应用名 → 取同行的 Switch 点它 */
    private fun clickRowSwitch(service: BoundaryAccessibilityService, label: String): Boolean {
        for (root in MotorolaNavigator.roots(service)) {
            val title = findExact(root, label, 0) ?: continue
            val tb = Rect(); title.getBoundsInScreen(tb)

            // 同 y 区间内的 switch_widget 就是这一行的开关
            for (r2 in MotorolaNavigator.roots(service)) {
                // 摩托罗拉这一行整行可点，优先点行本身（点 switch 节点偶尔被忽略）
                val sw = findSwitchNear(r2, tb, 0)
                if (sw == null) {
                    val row = title.parent
                    if (row != null && row.isClickable &&
                        (row.performAction(AccessibilityNodeInfo.ACTION_CLICK) || MotorolaNavigator.tap(service, row))) return true
                    continue
                }
                val ok = sw.performAction(AccessibilityNodeInfo.ACTION_CLICK) || MotorolaNavigator.tap(service, sw)
                if (ok) return true
            }
            // 兜底：直接点行右侧
            return MotorolaNavigator.tapAt(service, (tb.right + 60).coerceAtMost(1040), tb.centerY())
        }
        return false
    }

    private fun findExact(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        if (n.text?.toString() == want) return n
        for (i in 0 until n.childCount) findExact(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    private fun findSwitchNear(n: AccessibilityNodeInfo?, row: Rect, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 40) return null
        val rid = n.viewIdResourceName.orEmpty()
        if (rid.endsWith("switch_widget") || n.className?.toString()?.contains("Switch") == true) {
            val b = Rect(); n.getBoundsInScreen(b)
            if (Math.abs(b.centerY() - row.centerY()) <= 40) return n
        }
        for (i in 0 until n.childCount) findSwitchNear(n.getChild(i), row, d + 1)?.let { return it }
        return null
    }

    private fun scrollDown(service: BoundaryAccessibilityService) {
        for (root in MotorolaNavigator.roots(service)) {
            val list = findScrollable(root, 0)
            if (list != null && list.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD)) return
        }
        MotorolaNavigator.swipeUp(service)
    }

    private fun findScrollable(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.isScrollable) return n
        for (i in 0 until n.childCount) findScrollable(n.getChild(i), d + 1)?.let { return it }
        return null
    }
}
