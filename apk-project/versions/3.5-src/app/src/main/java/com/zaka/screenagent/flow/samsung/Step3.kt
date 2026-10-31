package com.zaka.screenagent.flow.samsung

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.notify.NotificationAccessActivator

/**
 * 三星第三步：**通知使用权**
 *
 * 打开「通知访问」列表 → 找到自己那一行 → 点开关（OneUI 是 Switch）。
 * 与小米不同：这里不点「我已知晓」，也没有危险页；授予后系统直接返回。
 */
object Step3 {

    private const val TAG = "SS-Step3"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开通知使用权页")
        SamsungNavigator.openNotificationAccess(service)

        val appLabel = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (NotificationAccessActivator.isGranted(service)) {
                    Log.d(TAG, "通知使用权已授予")
                    onDone(true)
                    return
                }
                // 先点自己那一行（进入确认），再点「允许」
                if (appLabel.isNotBlank() && SamsungNavigator.clickText(service, listOf(appLabel)) == null) {
                    SamsungNavigator.clickText(service, SamsungNavigator.switchOnTexts)
                } else {
                    SamsungNavigator.clickText(service, SamsungNavigator.switchOnTexts)
                }
                if (ticks >= 20) {
                    val ok = NotificationAccessActivator.isGranted(service)
                    Log.w(TAG, "超时 granted=$ok")
                    onDone(ok)
                    return
                }
                SamsungNavigator.post(2_000L, this)
            }
        }
        SamsungNavigator.post(2_000L, tick)
    }
}
