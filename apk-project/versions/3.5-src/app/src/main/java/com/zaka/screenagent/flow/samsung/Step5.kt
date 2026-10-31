package com.zaka.screenagent.flow.samsung

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星第五步：**自动运行（自启动）**
 *
 * OneUI 没有像 MIUI 那样的开关页标准类名，各版本不同，所以：
 *   ① 逐个尝试已知的三星「电池/自动运行」Activity；
 *   ② 进去后找「自动运行应用」/「自动运行」列表里的自己，打开开关；
 *   ③ 找不到就退化为「应用信息 → 电池 → 不受限制」，只记录结果不阻塞流程。
 */
object Step5 {

    private const val TAG = "SS-Step5"

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        val opened = SamsungNavigator.openAutostart(service)
        Log.d(TAG, "打开自动运行页 opened=$opened")

        val label = runCatching {
            service.packageManager.getApplicationLabel(service.applicationInfo).toString()
        }.getOrDefault("")

        var ticks = 0
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (label.isNotBlank()) SamsungNavigator.clickText(service, listOf(label))
                SamsungNavigator.clickText(service, SamsungNavigator.switchOnTexts)
                if (ticks >= 10) {                        // 约 20 秒，失败不阻塞
                    Log.d(TAG, "自动运行处理结束 opened=$opened")
                    onDone(opened)
                    return
                }
                SamsungNavigator.post(2_000L, this)
            }
        }
        SamsungNavigator.post(2_000L, tick)
    }
}
