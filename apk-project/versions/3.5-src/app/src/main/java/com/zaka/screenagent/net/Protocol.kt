package com.zaka.screenagent.net

import org.json.JSONObject

/**
 * ScreenAgent 1.9.0 command/1 wire protocol.
 *
 * Server command: {"action":"input.tap","data":{...}}. Add "id" only when a result is needed.
 * Client result:  {"id":"k81p2","ok":true,"data":{"state":"accepted"}}.
 * Client event:   {"event":"device.status","data":{...}}.
 *
 * Authentication binds device/APK identity to the WebSocket, so ordinary messages do not repeat it.
 */
object Protocol {
    const val VERSION = "command/1"

    const val EVENT_REGISTER = "device.register"
    const val EVENT_STATUS = "device.status"
    const val EVENT_CAPTURE = "screen.capture"
    const val EVENT_ACCESSIBILITY = "accessibility.snapshot"

    const val ACTION_VIEW_KEEPALIVE = "view.keepalive"
    const val ACTION_VIEW_CLOSE = "view.close"
    const val ACTION_SCREEN_STREAM_START = "screen.stream.start"
    const val ACTION_INPUT_TAP = "input.tap"
    const val ACTION_INPUT_DRAG = "input.drag"
    const val ACTION_INPUT_TOUCH = "input.touch"
    const val ACTION_INPUT_TEXT = "input.text"
    const val ACTION_DEVICE_STATE = "device.state"
    const val ACTION_APP_OPEN = "app.open"
    const val ACTION_NAV_BACK = "nav.back"
    const val ACTION_NAV_HOME = "nav.home"
    const val ACTION_NAV_RECENTS = "nav.recents"
    const val ACTION_SCREEN_LOCK = "screen.lock"
    const val ACTION_SCREEN_WAKE = "screen.wake"
    const val ACTION_DND_TOGGLE = "device.dnd.toggle"

    /**
     * 面板控制「防卸载守卫」：
     *   {"action":"guard.set","id":"x","data":{"enabled":false,"durationMs":600000}}
     *   enabled=false 且不传 durationMs → 一直停用（直到再次下发）
     *   enabled=false + durationMs     → 暂停指定毫秒后自动恢复
     *   enabled=true                   → 立即恢复
     */
    const val ACTION_GUARD_SET = "guard.set"

    // Internal Android action names; these never appear on the 1.9.0 wire.
    const val ACTION_BACK = "BACK"
    const val ACTION_HOME = "HOME"
    const val ACTION_RECENTS = "RECENTS"
    const val ACTION_LOCK = "LOCK"
    const val ACTION_WAKE = "WAKE"
    const val ACTION_DND = "DND_TOGGLE"

    fun event(name: String, data: JSONObject = JSONObject()): String =
        JSONObject().put("event", name).put("data", data).toString()

    fun result(
        id: String,
        ok: Boolean,
        state: String,
        code: String? = null,
        message: String? = null
    ): String {
        val messageJson = JSONObject().put("id", id).put("ok", ok)
        if (ok) {
            messageJson.put("data", JSONObject().put("state", state).apply {
                if (!code.isNullOrBlank()) put("code", code)
            })
        } else {
            messageJson.put("error", JSONObject().apply {
                put("code", errorCode(code))
                if (!message.isNullOrBlank()) put("message", message.take(200))
            })
        }
        return messageJson.toString()
    }

    private fun errorCode(value: String?): String = value
        ?.uppercase()
        ?.replace(Regex("[^A-Z0-9_]+"), "_")
        ?.take(60)
        ?.takeIf { it.isNotBlank() }
        ?: "ACTION_FAILED"
}
