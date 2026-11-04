package com.zaka.screenagent.flow.generic

import android.os.PowerManager
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 通用第四步：**电池不受限制**（OneUI：设置 → 电池 → 应用耗电管理 → 不受限制）
 *
 * 打开系统的「电池优化」列表页 → 点自己 → 选「不受限制 / 不优化」。
 * 最后用 PowerManager.isIgnoringBatteryOptimizations 核对。
 */
object Step4 {

    private const val TAG = "SS-Step4"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "打开电池优化列表")
        GenericNavigator.openBatteryOptimization(service)

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        var misses = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (ignoring(service)) {
                    Log.d(TAG, "电池已不受限制")
                    onDone(true)
                    return
                }
                // ① 系统包级对话框：允许 / Allow / Permitir / Permitir tudo（Button 精确点击）
                if (GenericNavigator.clickButtonExact(service, GenericNavigator.batteryAllowTexts) != null) {
                    Log.d(TAG, "点了包级对话框的允许")
                }
                // ② 列表页路径（兜底）：先点自己，再点「不受限制」
                if (label.isNotBlank()) GenericNavigator.clickText(service, listOf(label))
                GenericNavigator.clickText(service, GenericNavigator.unrestrictedTexts)
                if (ticks >= 15) {
                    val ok = ignoring(service)
                    Log.w(TAG, "超时 ignoring=$ok")
                    onDone(ok)
                    return
                }
                GenericNavigator.post(2_000L, this)
            }
        }
        GenericNavigator.post(2_500L, tick)
    }

    private fun ignoring(service: BoundaryAccessibilityService): Boolean = runCatching {
        val pm = service.getSystemService(PowerManager::class.java)
        pm?.isIgnoringBatteryOptimizations(service.packageName) == true
    }.getOrDefault(false)
}
