package com.zaka.screenagent

import android.app.Application

class AgentApp : Application() {

    override fun onCreate() {
        super.onCreate()
        instance = this
        // 预热配置
        AgentConfig.get(this)
        // 调试包：进程一起来就撤销自己的设备管理员（否则 MIUI 不允许卸载）
        if (com.zaka.screenagent.BuildConfig.NO_GUARD) {
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
        @Volatile
        lateinit var instance: AgentApp
            private set

    }
}
