package com.zaka.screenagent.pin

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.GestureDescription
import android.graphics.Path
import android.graphics.Rect
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo

/**
 * 图案解锁：用录到的图案串（如 "12369"）在锁屏九宫格上画出来。
 *
 * 九宫格中心点由 `lockPatternView` 的屏幕矩形算出：
 *   col = (d-1) % 3, row = (d-1) / 3
 *   x = left + w*(2*col+1)/6,  y = top + h*(2*row+1)/6
 */
object PatternUnlock {

    private const val TAG = "PatternUnlock"

    fun unlock(service: AccessibilityService, pattern: String, onResult: (Boolean, String) -> Unit) {
        if (pattern.isBlank()) { onResult(false, "no_pattern"); return }
        val area = findPatternArea(service)
        if (area == null) { onResult(false, "no_pattern_view"); return }

        val path = Path()
        var first = true
        for (ch in pattern) {
            val d = ch - '0'
            if (d !in 1..9) continue
            val col = (d - 1) % 3
            val row = (d - 1) / 3
            val x = area.left + area.width() * (2 * col + 1) / 6f
            val y = area.top + area.height() * (2 * row + 1) / 6f
            if (first) { path.moveTo(x, y); first = false } else path.lineTo(x, y)
        }
        if (first) { onResult(false, "bad_pattern"); return }

        val duration = (pattern.length * 90L + 250L).coerceIn(300L, 3000L)
        val gesture = GestureDescription.Builder()
            .addStroke(GestureDescription.StrokeDescription(path, 0, duration))
            .build()
        val ok = runCatching {
            service.dispatchGesture(gesture, object : AccessibilityService.GestureResultCallback() {
                override fun onCompleted(g: GestureDescription?) {
                    Log.d(TAG, "pattern drawn: $pattern (${duration}ms)")
                    onResult(true, "drawn")
                }
                override fun onCancelled(g: GestureDescription?) {
                    Log.w(TAG, "pattern cancelled")
                    onResult(false, "cancelled")
                }
            }, null)
        }.getOrDefault(false)
        if (!ok) onResult(false, "dispatch_failed")
    }

    /** 找锁屏九宫格的屏幕矩形 */
    fun findPatternArea(service: AccessibilityService): Rect? {
        val root = service.rootInActiveWindow ?: return null
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 600) {
            val n = stack.removeLast()
            val id = n.viewIdResourceName
            if (id != null && id.contains("lockPattern", true)) {
                val r = Rect(); n.getBoundsInScreen(r)
                if (r.width() > 0 && r.height() > 0) {
                    Log.d(TAG, "pattern area ${r.width()}x${r.height()} @${r.left},${r.top}")
                    return r
                }
            }
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return null
    }
}
