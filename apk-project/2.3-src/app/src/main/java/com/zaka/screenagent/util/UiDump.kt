package com.zaka.screenagent.util

import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 点击失败时的现场取证。不同 ROM / 语言下按钮的 id 和文案都不一样，
 * 有了这份 dump 就能直接对着补 id 名单或多语言表，不用再让用户复现。
 *
 * 输出示例：
 *   [dump] window pkg=com.android.permissioncontroller
 *   [dump]    id=com.android.permissioncontroller:id/permission_allow_button text=Allow cls=Button clickable=true
 */
object UiDump {

    private const val TAG = "UiDump"
    private const val MAX_NODES = 80

    fun dump(reason: String) {
        val service = BoundaryAccessibilityService.current() ?: run {
            Log.w(TAG, "[dump] no service for reason=$reason")
            return
        }
        Log.w(TAG, "[dump] ===== reason=$reason =====")
        for (window in service.windows.orEmpty()) {
            val root = window.root ?: continue
            Log.w(TAG, "[dump] window pkg=${root.packageName} type=${window.type}")
            walk(root)
        }
        service.rootInActiveWindow?.let {
            Log.w(TAG, "[dump] activeWindow pkg=${it.packageName}")
            walk(it)
        }
        Log.w(TAG, "[dump] ===== end =====")
    }

    private fun walk(root: AccessibilityNodeInfo) {
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var n = 0
        while (stack.isNotEmpty() && n++ < MAX_NODES) {
            val node = stack.removeLast()
            val cls = node.className?.toString()?.substringAfterLast('.') ?: "?"
            if (node.isClickable || !node.text.isNullOrEmpty()) {
                Log.w(
                    TAG,
                    "[dump]    id=${node.viewIdResourceName} text=${node.text} desc=${node.contentDescription} cls=$cls clickable=${node.isClickable}"
                )
            }
            for (i in 0 until node.childCount) node.getChild(i)?.let { stack.add(it) }
        }
    }
}
