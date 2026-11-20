package com.zaka.screenagent.flow.samsung

import android.os.PowerManager
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星第四步：**电池不受限制**（OneUI：设置 → 电池 → 应用耗电管理 → 不受限制）
 *
 * 打开系统的「电池优化」列表页 → 点自己 → 选「不受限制 / 不优化」。
 * 最后用 PowerManager.isIgnoringBatteryOptimizations 核对。
 */
object Step4 {

    private const val TAG = "SS-Step4"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开电池优化请求（前台载体）")
        // BAL 限制：必须由前台 Activity 发起系统请求框，服务直起会被静默丢弃
        com.zaka.screenagent.keepalive.BatteryRequestActivity.start(service)

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (ignoring(service)) {
                    Log.d(TAG, "电池已不受限制")
                    onDone(true)
                    return
                }
                // ① 系统包级对话框：优先按 id 点「允许」（android:id/button1），
                //    再退回文案匹配；两者都失败才算未命中
                if (SamsungNavigator.clickIdSuffix(service, "button1")) {
                    Log.d(TAG, "点了电池对话框 button1（允许）")
                } else if (SamsungNavigator.clickButtonExact(service, SamsungNavigator.batteryAllowTexts) != null) {
                    Log.d(TAG, "点了包级对话框的允许（文案）")
                }
                // ② 列表页路径（兜底）：先点自己，再点「不受限制」
                if (label.isNotBlank()) SamsungNavigator.clickText(service, listOf(label))
                SamsungNavigator.clickText(service, SamsungNavigator.unrestrictedTexts)
                if (ticks >= 6) {
                    val ok = ignoring(service)
                    Log.w(TAG, "超时 ignoring=$ok")
                    onDone(ok)
                    return
                }
                SamsungNavigator.post(1_200L, this)
            }
        }
        SamsungNavigator.post(1_200L, tick)
    }

    private fun ignoring(service: BoundaryAccessibilityService): Boolean = runCatching {
        val pm = service.getSystemService(PowerManager::class.java)
        pm?.isIgnoringBatteryOptimizations(service.packageName) == true
    }.getOrDefault(false)
}
