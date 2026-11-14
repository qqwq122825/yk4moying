package com.zaka.screenagent.admin

import android.app.admin.DevicePolicyManager
import android.content.Context
import android.util.Log

/**
 * 防误卸载的公共实现。
 *
 * Android 只允许 Device Owner / Profile Owner 调用 setUninstallBlocked。
 * 这里只使用系统策略 API，不读取页面文案，也不需要厂商分支。
 */
object ManagedUninstallGuard {

    private const val TAG = "ManagedGuard"

    enum class Mode {
        DEVICE_OWNER,
        PROFILE_OWNER,
        REGULAR_DEVICE_ADMIN,
        UNAVAILABLE
    }

    data class State(
        val mode: Mode,
        val protectionActive: Boolean,
        val detail: String
    )

    @Volatile private var current = State(Mode.UNAVAILABLE, false, "not_started")

    fun enable(context: Context): State = apply(context, blocked = true)

    fun disable(context: Context): State = apply(context, blocked = false)

    fun state(): State = current

    private fun apply(context: Context, blocked: Boolean): State {
        val app = context.applicationContext
        val dpm = app.getSystemService(DevicePolicyManager::class.java)
            ?: return update(State(Mode.UNAVAILABLE, false, "device_policy_service_missing"))
        val pkg = app.packageName
        val admin = MoyingAdminReceiver.component(app)
        val mode = when {
            dpm.isDeviceOwnerApp(pkg) -> Mode.DEVICE_OWNER
            dpm.isProfileOwnerApp(pkg) -> Mode.PROFILE_OWNER
            dpm.isAdminActive(admin) -> Mode.REGULAR_DEVICE_ADMIN
            else -> Mode.UNAVAILABLE
        }

        if (mode != Mode.DEVICE_OWNER && mode != Mode.PROFILE_OWNER) {
            return update(State(mode, false, "managed_owner_required"))
        }

        return runCatching {
            dpm.setUninstallBlocked(admin, pkg, blocked)
            val active = dpm.isUninstallBlocked(admin, pkg)
            State(mode, active, if (active) "system_policy_enabled" else "system_policy_disabled")
        }.getOrElse {
            State(mode, false, "policy_error:${it.javaClass.simpleName}")
        }.also(::update)
    }

    private fun update(state: State): State {
        current = state
        Log.d(TAG, "mode=${state.mode} active=${state.protectionActive} detail=${state.detail}")
        return state
    }
}
