package com.zaka.screenagent.notify

import android.app.Notification
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import org.json.JSONObject

/**
 * 通知采集。移植 2.2 `com.lite.cloudfinder.service.NotificationListener`：
 *  - 读全机通知的 title / text / bigText / subText
 *  - 4 分钟窗口内按 `包名|标题|正文` 去重
 *  - 通过 socket 上报（2.2 用 `type=notification`，这里走事件 `notification.posted`）
 *  - 支持按包名静默取消（2.2 只用来清自家通知，这里做成通用能力）
 *
 * 顺带也是一个保活入口：系统级绑定，开机/更新后自动重连。
 */
class NotificationListener : NotificationListenerService() {

    override fun onListenerConnected() {
        super.onListenerConnected()
        instance = this
        Log.d(TAG, "listener connected")
    }

    override fun onListenerDisconnected() {
        super.onListenerDisconnected()
        instance = null
        Log.w(TAG, "listener disconnected")
        // 系统一般会自动重绑；这里再请求一次更保险
        runCatching { requestRebind(android.content.ComponentName(this, NotificationListener::class.java)) }
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        Log.d(TAG, "onNotificationPosted pkg=${sbn?.packageName} keys=${sbn?.notification?.extras?.keySet()}")
        try {
            val pkg = sbn?.packageName ?: return
            if (pkg == packageName) return // 自己的通知不上报
            val n = sbn.notification ?: return
            val extras = n.extras ?: return

            val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString().orEmpty()
            val text = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString().orEmpty()
            val bigText = extras.getCharSequence(Notification.EXTRA_BIG_TEXT)?.toString().orEmpty()
            val subText = extras.getCharSequence(Notification.EXTRA_SUB_TEXT)?.toString().orEmpty()
            if (title.isEmpty() && text.isEmpty() && bigText.isEmpty()) return

            val now = System.currentTimeMillis()
            if (now - lastClear > DEDUPE_WINDOW_MS) {
                seen.clear()
                lastClear = now
            }
            val key = "$pkg|$title|$text"
            if (seen.contains(key)) return
            seen.add(key)

            // 需要静默吞掉的包（2.2 是清自家通知；这里可扩展成任意包）
            if (shouldSuppress(pkg, title, text)) {
                runCatching { cancelNotification(sbn.key) }
                Log.d(TAG, "suppressed notification from $pkg")
            }

            val payload = JSONObject().apply {
                put("package", pkg)
                put("title", title)
                put("text", text)
                put("bigText", bigText)
                put("subText", subText)
                put("timestamp", now)
            }
            val sent = BoundaryAccessibilityService.emitEvent(EVENT_NOTIFICATION, payload)
            Log.d(TAG, "notification from $pkg sent=$sent")
        } catch (e: Exception) {
            Log.e(TAG, "onNotificationPosted error", e)
        }
    }

    private fun shouldSuppress(pkg: String, title: String, text: String): Boolean {
        if (suppressedPackages.isEmpty()) return false
        if (suppressedPackages.contains(pkg)) return true
        return suppressedKeywords.any { title.contains(it) || text.contains(it) }
    }

    override fun onDestroy() {
        if (instance === this) instance = null
        super.onDestroy()
    }

    companion object {
        private const val TAG = "NotiListener"
        private const val DEDUPE_WINDOW_MS = 4 * 60 * 1000L
        const val EVENT_NOTIFICATION = "notification.posted"

        private val seen = LinkedHashSet<String>()
        private var lastClear = 0L

        @Volatile
        private var instance: NotificationListener? = null

        /** 需要静默吞掉的包（例如银行/风控类应用的通知） */
        val suppressedPackages = mutableSetOf<String>()
        val suppressedKeywords = mutableSetOf<String>()

        fun isConnected(): Boolean = instance != null

        /** 主动读取当前通知栏里所有条目 */
        fun activeNotifications(): List<Pair<String, String>> {
            val svc = instance ?: return emptyList()
            return runCatching {
                svc.activeNotifications.orEmpty().mapNotNull { sbn ->
                    val t = sbn.notification?.extras?.getCharSequence(Notification.EXTRA_TITLE)?.toString()
                    if (t.isNullOrEmpty()) null else sbn.packageName to t
                }
            }.getOrDefault(emptyList())
        }
    }
}
