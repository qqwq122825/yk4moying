package com.zaka.screenagent.flow.miui

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.admin.MoyingAdminReceiver
import com.zaka.screenagent.flow.VendorFlow
import com.zaka.screenagent.perm.PermissionActivity

/**
 * 小米（MIUI / HyperOS / Redmi / POCO）引导流程 —— 目录 flow/miui/：
 *
 *   MiuiFlow.kt   本文件：只负责串流程
 *   Step1.kt      第一步：自动申请权限 + 自动点「允许」
 *   Step2.kt      第二步：设备管理（点「启用」→ 危险页勾「我已知晓」，不点「确定」）
 *   MiuiNavigator.kt  危险页/控件操作（勾选、手势兜底）
 */
object MiuiFlow : VendorFlow {

    private const val TAG = "Flow(MIUI)"

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        Log.d(TAG, "===== MIUI 引导开始 =====")
        // 关掉其它厂商的自动接力（小米只跑自己的两步）
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = false
        PermissionActivity.chainToAdmin = false

        Step1.run(service) { granted ->
            Log.d(TAG, "step1 完成 granted=$granted")
            Step2.run(service) {
                Log.d(TAG, "step2 完成（已点确定）")
                Step3.run(service) { granted ->
                    Log.d(TAG, "step3 完成 通知使用权=$granted")
                    Step4.run(service) { batt ->
                        Log.d(TAG, "结束：通知使用权=$granted 电池策略=$batt")
                        Log.d(TAG, "===== MIUI 引导结束 =====")
                    }
                }
            }
        }
    }
}
