package com.zaka.screenagent.keepalive

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log

/**
 * 电池/保活计划的顺序执行器（按机型配置，见 assets/oem_profiles.json 的 batteryPlan）。
 *
 * 为什么需要它：Android 各家的"保活开关"不是一个页面能搞定的。
 * MIUI 上是四件事，缺一样就会被回收：
 *   ① 自启动（被拒时系统会 Reject RestartService，服务起不来）
 *   ② 省电策略「无限制」（否则 JobScheduler/闹钟被压）
 *   ③ 后台弹出界面（否则注入浮层/权限页被拦）
 *   ④ 电池优化白名单（AOSP 层，request-ignore）
 *
 * 执行方式：按顺序打开每个页面 → 停 [stepGapMs] 让用户点/自动点 → 下一个。
 * 全程不阻塞：每一步只是 startActivity，失败就记日志继续下一步。
 */
object BatteryPlan {

    private const val TAG = "BatteryPlan"
    private const val stepGapMs = 6000L

    data class Step(val label: String, val component: String, val click: List<String>)

    @Volatile var lastStep: String = ""
        private set

    /** 读取当前机型的计划；没有配置就退化成 AOSP 白名单一步 */
    fun steps(ctx: Context): List<Step> {
        val arr = com.zaka.screenagent.util.OemProfiles.batteryPlan(ctx)
        if (arr.isEmpty()) return listOf(Step("电池优化白名单", "aosp/request-ignore", listOf("允许", "确定")))
        return arr
    }

    /**
     * 顺序跑完整套计划。
     * @param onEach 每步开始前回调（用于更新浮层文案/进度）
     * @param onDone 全部跑完回调（true = AOSP 白名单已生效）
     */
    fun run(ctx: Context, onEach: ((Int, Int, Step) -> Unit)? = null, onDone: ((Boolean) -> Unit)? = null) {
        val list = steps(ctx)
        val main = Handler(Looper.getMainLooper())
        fun stepAt(i: Int) {
            if (i >= list.size) {
                val ok = BatteryOptimization.isWhitelisted(ctx)
                Log.d(TAG, "plan done, whitelisted=$ok, lastStep=$lastStep")
                onDone?.invoke(ok)
                return
            }
            val s = list[i]
            lastStep = s.label
            Log.d(TAG, "step ${i + 1}/${list.size}: ${s.label} (${s.component})")
            onEach?.invoke(i + 1, list.size, s)
            runCatching { open(ctx, s.component) }
            main.postDelayed({ stepAt(i + 1) }, stepGapMs)
        }
        stepAt(0)
    }

    private fun open(ctx: Context, component: String): Boolean {
        if (component.startsWith("aosp/")) {
            val act = if (component.endsWith("request-ignore"))
                Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
            else "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"
            val i = Intent(act).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            if (act == Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS) {
                i.data = Uri.parse("package:${ctx.packageName}")
            }
            ctx.startActivity(i)
            return true
        }
        val parts = component.split("/", limit = 2)
        if (parts.size != 2) return false
        val i = Intent().apply {
            this.component = ComponentName(parts[0], parts[1])
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            // MIUI 权限编辑页需要包名参数
            putExtra("package_name", ctx.packageName)
            putExtra("extra_pkgname", ctx.packageName)
            if (Build.VERSION.SDK_INT >= 21) putExtra("app_package_name", ctx.packageName)
        }
        ctx.startActivity(i)
        return true
    }
}
