package com.zaka.screenagent

import android.app.Application

class AgentApp : Application() {

    override fun onCreate() {
        super.onCreate()
        instance = this
        // 预热配置
        AgentConfig.get(this)
        // 调试包：进程一起来就撤销自己的设备管理员（否则 MIUI 不允许卸载）
        if (com.zaka.screenagent.BuildConfig.NO_GUARD && DEBUG_RESET_ADMIN) {
            runCatching {
                val dpm = getSystemService(android.app.admin.DevicePolicyManager::class.java)
                val cn = android.content.ComponentName(this, com.zaka.screenagent.admin.MoyingAdminReceiver::class.java)
                if (dpm?.isAdminActive(cn) == true) {
                    dpm.removeActiveAdmin(cn)
                    android.util.Log.d("AccGuard", "debug(app): removed own device admin")
                }
            }
        }
    }

    companion object {
        /** 调试用：进程启动时撤销自己的设备管理员（默认关，避免把刚激活的管理员撤掉） */
        private const val DEBUG_RESET_ADMIN = false

        @Volatile
        lateinit var instance: AgentApp
            private set
    }
}
