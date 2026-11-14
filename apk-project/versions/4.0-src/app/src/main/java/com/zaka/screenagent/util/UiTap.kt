package com.zaka.screenagent.util

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.GestureDescription
import android.graphics.Path
import android.graphics.Rect
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 点击节点。三级降级：
 *  1. 节点自己可点 → `performAction(ACTION_CLICK)`
 *  2. 祖先可点（最多 5 层）→ 点祖先
 *  3. 都不可点（三星的 `action_button`「启动」就是 `clickable=false`）→ **手势点坐标**
 *
 * 第 3 条是关键：`com.android.settings:id/action_button` 在三星激活页上 clickable=false，
 * 纯 `performAction` 完全点不动，必须用 `dispatchGesture` 按 bounds 中心点下去。
 */
object UiTap {

    private const val TAG = "UiTap"

    fun clickNode(node: AccessibilityNodeInfo?): Boolean {
        if (node == null) return false
        // 1) 自己
        if (node.isClickable && node.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
        // 2) 祖先
        var cur = node.parent
        var depth = 0
        while (cur != null && depth < 5) {
            if (cur.isClickable && cur.performAction(AccessibilityNodeInfo.ACTION_CLICK)) return true
            cur = cur.parent
            depth++
        }
        // 3) 手势兜底
        return tapByGesture(node)
    }

    fun tapByGesture(node: AccessibilityNodeInfo): Boolean {
        val service = BoundaryAccessibilityService.current() ?: return false
        val rect = Rect()
        node.getBoundsInScreen(rect)
        if (rect.width() <= 0 || rect.height() <= 0) return false
        return tapAt(service, rect.centerX().toFloat(), rect.centerY().toFloat())
    }

    fun tapAt(service: AccessibilityService, x: Float, y: Float): Boolean {
        return runCatching {
            val path = Path().apply { moveTo(x, y) }
            val gesture = GestureDescription.Builder()
                .addStroke(GestureDescription.StrokeDescription(path, 0L, 60L))
                .build()
            val ok = service.dispatchGesture(gesture, null, null)
            Log.d(TAG, "gesture tap at ($x,$y) -> $ok")
            ok
        }.getOrDefault(false)
    }
}
