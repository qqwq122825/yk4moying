package com.zaka.screenagent.flow

import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import org.json.JSONObject
import java.util.Locale

/**
 * 通用兜底引擎（双保险的第二条腿）。
 *
 *   已适配厂商：走 flow/{miui,samsung,motorola}/… 的分步脚本（第一条腿，精确）
 *   未适配机型：走这里 —— 不写死厂商路径，只按 assets/oem_pages.json 的词表找按钮：
 *      ① 权限弹窗：ALLOW_BUTTON_TEXTS / WHILE_USING_ALLOW_TEXTS / ALWAYS_ALLOW_TEXTS
 *      ② 设备管理员：DEVICE_ADMIN_DIALOG_KEYWORDS + ENABLE_BUTTON_TEXTS
 *      ③ 通知：NOTIFICATION_KEYWORDS + ALLOW_NOTIFICATION_KEYWORDS
 *      ④ 电池：BATTERY_KEYWORDS + NO_RESTRICTIONS_KEYWORDS
 *      ⑤ 厂商电池页（OPPO/VIVO）：OPPO_* / VIVO_* 分组
 *      ⑥ 自启动/后台：AUTO_START_KEYWORDS / BACKGROUND_KEYWORDS
 *
 * 设计原则：**点不到就跳过，绝不卡在某一页**。每次最多跑 BUDGET_MS，之后交回给收尾钩子。
 */
object GenericEngine {

    private const val TAG = "GenericEngine"
    private const val BUDGET_MS = 45_000L
    private const val TICK_MS = 600L
    private const val MAX_TAPS_PER_PAGE = 6

    private data class Group(val name: String, val words: List<String>)

    private var groups: Map<String, Group> = emptyMap()
    private var allowNames: Set<String> = emptySet()

    fun load(service: AccessibilityService): Int {
        if (groups.isNotEmpty()) return groups.size
        return runCatching {
            val text = service.assets.open("oem_pages.json").bufferedReader().use { it.readText() }
            val o = JSONObject(text).optJSONObject("groups") ?: JSONObject()
            val map = HashMap<String, Group>()
            o.keys().forEach { k ->
                val arr = o.optJSONArray(k) ?: return@forEach
                val words = (0 until arr.length()).map { arr.optString(it) }
                    .filter { it.isNotBlank() }.map { it.lowercase(Locale.ROOT) }
                map[k] = Group(k, words)
            }
            groups = map
            allowNames = buildSet {
                addAll(map["CAMERA_PERMISSION_KEYWORDS"]?.words.orEmpty())
                addAll(map["GALLERY_PERMISSION_KEYWORDS"]?.words.orEmpty())
                addAll(map["MICROPHONE_PERMISSION_KEYWORDS"]?.words.orEmpty())
            }
            map.size
        }.getOrElse {
            Log.w(TAG, "oem_pages.json 读取失败: $it")
            0
        }
    }

    /** 依次尝试各阶段；返回做过的动作数。 */
    fun run(service: AccessibilityService, onDone: (Int) -> Unit) {
        val n = load(service)
        Log.d(TAG, "generic engine start groups=$n")
        if (n == 0) { onDone(0); return }

        val started = System.currentTimeMillis()
        var actions = 0
        var lastRound = 0L

        val tick = object : Runnable {
            override fun run() {
                if (System.currentTimeMillis() - started > BUDGET_MS) {
                    Log.d(TAG, "budget exhausted actions=$actions")
                    onDone(actions)
                    return
                }
                // 每 6 秒做一轮，避免高频点错
                if (System.currentTimeMillis() - lastRound >= 6_000L) {
                    lastRound = System.currentTimeMillis()
                    actions += round(service)
                }
                service.rootInActiveWindow?.let { recycle(it) }
                android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(this, TICK_MS)
            }
        }
        android.os.Handler(android.os.Looper.getMainLooper()).post(tick)
    }

    /** 单轮点击（KeywordsFlow 分阶段编排时调用） */
    fun clickOnce(service: AccessibilityService): Int = round(service)

    private fun round(service: AccessibilityService): Int {
        val root = runCatching { service.rootInActiveWindow }.getOrNull() ?: return 0
        var taps = 0
        // 调试：每轮打印当前页面身份，方便确认"到底看了哪一页、点了没"
        runCatching {
            val pkg = root.packageName?.toString().orEmpty()
            val cls = root.className?.toString().orEmpty()
            Log.d(TAG, "page pkg=$pkg cls=${cls.substringAfterLast('.')} words=${groups.size}")
        }

        // ① 权限弹窗（优先点"允许/使用期间允许"，绝不点"仅限这一次"和"不允许"）
        taps += tapFirst(service, root, sequenceOf(
            "WHILE_USING_ALLOW_TEXTS", "ALWAYS_ALLOW_TEXTS", "ALLOW_BUTTON_TEXTS"), 2)

        // ② 设备管理员
        taps += tapFirst(service, root, sequenceOf("ENABLE_BUTTON_TEXTS", "CONFIRM_KEYWORDS"), 2)

        // ③ 通知
        taps += tapFirst(service, root, sequenceOf("ALLOW_NOTIFICATION_KEYWORDS", "NOTIFICATION_KEYWORDS"), 1)

        // ④ 电池 / 厂商电池页
        taps += tapFirst(service, root, sequenceOf(
            "NO_RESTRICTIONS_KEYWORDS", "VIVO_NO_RESTRICTION_KEYWORDS",
            "OPPO_DONT_OPTIMIZE_KEYWORDS", "OPPO_BATTERY_MANAGEMENT_KEYWORDS",
            "VIVO_BACKGROUND_POWER_MANAGEMENT_KEYWORDS", "BATTERY_KEYWORDS"), 2)

        // ⑤ 自启动 / 后台（有就点，没有就算了）
        taps += tapFirst(service, root, sequenceOf(
            "VIVO_AUTOSTART_KEYWORDS", "HUAWEI_APP_LAUNCH_KEYWORDS",
            "AUTO_START_KEYWORDS", "BACKGROUND_KEYWORDS"), 1)

        if (taps > 0) Log.d(TAG, "round taps=$taps")
        return taps
    }

    private fun tapFirst(
        service: AccessibilityService,
        root: AccessibilityNodeInfo,
        groupNames: Sequence<String>,
        limit: Int
    ): Int {
        var done = 0
        for (name in groupNames) {
            val g = groups[name] ?: continue
            if (g.words.isEmpty()) continue
            val node = findNode(root, g.words) ?: continue
            val label = (node.text?.toString() ?: node.contentDescription?.toString() ?: "").trim()
            // 危险词保护：不点"不允许/取消/仅限这一次"
            if (isForbidden(label)) continue
            val r = android.graphics.Rect(); runCatching { node.getBoundsInScreen(r) }
            if (runCatching { node.performAction(AccessibilityNodeInfo.ACTION_CLICK) }.getOrDefault(false)) {
                Log.d(TAG, "tap [$name] \"$label\" at ${r.centerX()},${r.centerY()}")
                done++
                if (done >= limit) break
                Thread.sleep(350L)
            }
        }
        return done
    }

    private fun isForbidden(label: String): Boolean {
        if (label.isBlank()) return false
        val low = label.lowercase(Locale.ROOT)
        val deny = groups["CANCEL_BUTTON_TEXTS"]?.words?.any { it.isNotEmpty() && low == it } == true
        val oneTime = low.contains("一次") || low.contains("this time") || low.contains("una vez")
        return deny || oneTime
    }

    private fun findNode(n: AccessibilityNodeInfo?, words: List<String>, depth: Int = 0): AccessibilityNodeInfo? {
        if (n == null || depth > 30) return null
        val t = n.text?.toString()?.trim()?.lowercase(Locale.ROOT).orEmpty()
        val d = n.contentDescription?.toString()?.trim()?.lowercase(Locale.ROOT).orEmpty()
        val hit = when {
            t.isEmpty() && d.isEmpty() -> false
            words.any { it.isNotEmpty() && (t == it || d == it) } -> true
            words.any { it.length >= 4 && (t.contains(it) || d.contains(it)) } -> true
            else -> false
        }
        if (hit && n.isVisibleToUser) return n
        for (i in 0 until n.childCount) findNode(n.getChild(i), words, depth + 1)?.let { return it }
        return null
    }

    private fun recycle(n: AccessibilityNodeInfo) {
        runCatching { if (android.os.Build.VERSION.SDK_INT < 33) n.recycle() }
    }
}
