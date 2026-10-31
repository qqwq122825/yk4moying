package com.zaka.screenagent.flow.samsung

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.OnboardingHooks
import com.zaka.screenagent.flow.VendorFlow

/**
 * 三星（以及所有非小米机型）的引导流程 —— 与 flow/miui 对称，但实现完全独立：
 *
 *   Step1 运行时权限
 *   Step2 设备管理员
 *   Step3 通知使用权
 *   Step4 电池不受限制
 *   Step5 自动运行（自启动）
 *   → OnboardingHooks.complete()
 *
 * 这里不引用 miui/ 下任何文件；小米那套的 10021、危险页、MiuiGuard 在三星上都不存在。
 */
object SamsungFlow : VendorFlow {

    private const val TAG = "Flow(SAMSUNG)"

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        Log.d(TAG, "===== 三星引导开始 =====")
        // 关掉旧接力的隐式链条，全部由本流程显式控制
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = false
        com.zaka.screenagent.perm.PermissionActivity.chainToAdmin = false

        Step1.run(service) { granted ->
            Log.d(TAG, "step1 完成 权限=$granted")
            Step2.run(service) {
                Log.d(TAG, "step2 完成 设备管理员")
                Step3.run(service) { noti ->
                    Log.d(TAG, "step3 完成 通知=$noti")
                    Step4.run(service) { batt ->
                        Log.d(TAG, "step4 完成 电池=$batt")
                        Step5.run(service) { auto ->
                            Log.d(TAG, "结束：权限=$granted 通知=$noti 电池=$batt 自动运行=$auto")
                            Log.d(TAG, "===== 三星引导结束 =====")
                            OnboardingHooks.complete(service)
                        }
                    }
                }
            }
        }
    }
}
