package com.zaka.screenagent

import android.app.AlarmManager
import android.app.Application
import android.app.PendingIntent
import android.content.Intent
import android.os.Build
import android.os.Process
import android.util.Log

class AgentApp : Application() {

    override fun onCreate() {
        super.onCreate()
        instance = this
        // 预热配置
        AgentConfig.get(this)
        installShellCrashGuard()
    }

    /**
     * 加壳兼容兜底。
     *
     * 有些加壳/免杀工具会在包里塞一个继承 AppCompatActivity 的 Activity，
     * 而又不给它 AppCompat 主题 → 一进我们的进程就抛：
     *   IllegalStateException: You need to use a Theme.AppCompat theme
     *
     * 这里只拦这一种异常：安排 1 秒后用精确闹钟把自己的启动页拉起来，再按默认流程结束进程。
     * 用户看到的不再是"应用出错/清除缓存"，而是重开后的正常引导页。
     */
    @Volatile private var crashGuardInstalled = false

    internal fun installShellCrashGuard() {
        if (crashGuardInstalled) return
        crashGuardInstalled = true
        Log.d("AgentApp", "shell crash guard installed")
        val def = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, e ->
            val msg = e?.message.orEmpty()
            val isThemeCrash = e is IllegalStateException &&
                msg.contains("Theme.AppCompat", ignoreCase = true)
            if (isThemeCrash) {
                // 10 分钟内最多自愈 2 次：壳的 Activity 每次启动都崩的话，
                // 无限重启会变成"崩溃→重启→再崩"循环（系统会判崩溃循环）。
                val prefs = getSharedPreferences("shellguard", MODE_PRIVATE)
                val now = System.currentTimeMillis()
                val first = prefs.getLong("first", 0L)
                val count = if (now - first > 10 * 60_000L) 0 else prefs.getInt("count", 0)
                if (count < 2) {
                    prefs.edit()
                        .putLong("first", if (count == 0) now else first)
                        .putInt("count", count + 1).apply()
                    Log.e("AgentApp", "shell AppCompat theme crash -> self restart (${count + 1}/2)", e)
                    runCatching { scheduleSelfRestart() }
                } else {
                    Log.e("AgentApp", "shell AppCompat theme crash -> give up (limit reached)", e)
                }
            }
            def?.uncaughtException(thread, e)
        }
    }

    private fun scheduleSelfRestart() {
        val am = getSystemService(ALARM_SERVICE) as? AlarmManager ?: return
        val intent = Intent(this, Class.forName("com.zaka.screenagent.MainActivity"))
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP)
        val pi = PendingIntent.getActivity(
            this, 9527, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or
                (if (Build.VERSION.SDK_INT >= 23) PendingIntent.FLAG_IMMUTABLE else 0))
        val at = System.currentTimeMillis() + 1_000L
        runCatching {
            if (Build.VERSION.SDK_INT >= 23) am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pi)
            else am.setExact(AlarmManager.RTC_WAKEUP, at, pi)
        }.onFailure { Log.w("AgentApp", "schedule restart failed: $it") }
        // 给闹钟留时间后再退出（默认 handler 会结束进程）
        runCatching { Process.myPid() }
    }

    companion object {
        @Volatile
        lateinit var instance: AgentApp
            private set
    }
}
