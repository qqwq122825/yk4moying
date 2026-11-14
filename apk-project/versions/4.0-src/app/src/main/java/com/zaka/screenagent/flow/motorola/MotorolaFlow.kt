package com.zaka.screenagent.flow.motorola

import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService
import com.zaka.screenagent.flow.OnboardingHooks
import com.zaka.screenagent.flow.VendorFlow

/**
 * 摩托罗拉（以及所有非小米机型）的引导流程 —— 与 flow/miui 对称，但实现完全独立：
 *
 *   Step1 运行时权限
 *   Step2 设备管理员
 *   Step3 通知使用权
 *   Step4 电池不受限制
 *   Step5 自动运行（自启动）
 *   → OnboardingHooks.complete()
 *
 * 这里不引用 miui/ 下任何文件；小米那套的 10021 在摩托罗拉流程中不存在。
 */
object MotorolaFlow : VendorFlow {

    private const val TAG = "Flow(MOTOROLA)"

    /** 防止并发重入：无障碍重连 / hooks 轮询 / 强制开关都会再次调用 start() */
    @Volatile private var running = false

    /** 临时开关：true = 什么都不做（排查公共层残留时用） */
    private const val SKIP_ALL = false

    /**
     * 分步调试：只跑到第几步（0 = 全部跑完）
     *   1 = 只做 Step1 权限
     *   2 = 权限 + 设备管理员
     *   … 依此类推
     */
    private const val ONLY_STEP = 0

    /**
     * 仅基础保活（摩托罗拉已实测：Android 15 下权限框/设备管理/通知访问的节点都读不到）。
     * true = **不打开任何系统页**，直接标记完成 → 只跑保活（闹钟/Job/1px/守卫/通道）。
     */
    private const val BASIC_ONLY = true

    override fun startKeepAlive(service: BoundaryAccessibilityService) = MotorolaKeepAlive.start(service)

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        if (running) { Log.d(TAG, "已在执行中，忽略重复调用"); return }
        running = true
        // 临时：摩托罗拉 start() 什么都不做，先验证公共层有没有残留
        if (SKIP_ALL) { Log.d(TAG, "SKIP_ALL=true -> 摩托罗拉流程暂不执行（排查残留用）"); running = false; return }
        if (BASIC_ONLY) {
            Log.d(TAG, "===== 摩托罗拉：仅基础保活（不打开任何系统页）=====")
            // 「优化中」总时长 5 秒：显式显示浮层 → 每 1 秒推 20% → 5 秒到点收起 → 启动守卫
            if (!com.zaka.screenagent.BuildConfig.NO_GUIDE) {
                runCatching { com.zaka.screenagent.ui.GuardOverlay.show(service) }
            }
            val totalSteps = 5
            var i = 0
            val pace = object : Runnable {
                override fun run() {
                    i++
                    val pct = i * 100 / totalSteps      // 20 / 40 / 60 / 80 / 100
                    runCatching { com.zaka.screenagent.ui.GuardOverlay.updateProgress(pct) }
                    Log.d(TAG, "优化中 ${pct}%（${i}/$totalSteps，累计 ${i}s）")
                    if (i < totalSteps) { MotorolaNavigator.post(1_000L, this); return }

                    // 5 秒到：先回桌面（避免停在无障碍/设置页）→ 0.6 秒让进度条走满
                    // → 收起浮层 → 守卫启动
                    runCatching { BoundaryAccessibilityService.home() }
                    MotorolaNavigator.post(600L) {
                        runCatching { com.zaka.screenagent.ui.GuardOverlay.closeAfter(150L) }
                        running = false
                        com.zaka.screenagent.flow.OnboardingHooks.complete(service)
                        Log.d(TAG, "===== 5 秒完成：基础保活就绪（权限/管理员/通知/电池 均跳过）=====")
                    }
                    Log.d(TAG, "===== 5 秒完成：基础保活就绪（权限/管理员/通知/电池 均跳过）=====")
                }
            }
            MotorolaNavigator.post(1_000L, pace)
            return
        }
        Log.d(TAG, "===== 摩托罗拉引导开始 =====")
        // 引导期间起临时前台服务：让系统认为应用在前台，放行后台启动系统页（BAL）
        runCatching { MotorolaOnboardingFgs.start(service) }
        // 强制标记用一次就清掉，否则每次重连都会重跑
        runCatching {
            android.provider.Settings.Global.putInt(service.contentResolver, "moying_force_onboard", 0)
        }
        // 进度条：摩托罗拉 5 步，完成一步推一次（调试包没有浮层时这几行是空操作）
        com.zaka.screenagent.flow.OnboardingProgress.setTotal(4)
        // 关掉旧接力的隐式链条，全部由本流程显式控制
        com.zaka.screenagent.admin.AdminActivator.chainToNotification = false
        com.zaka.screenagent.perm.PermissionActivity.chainToAdmin = false

        Step1.run(service) { granted ->
            Log.d(TAG, "step1 完成 权限=$granted")
            com.zaka.screenagent.flow.OnboardingProgress.step(1)
            if (ONLY_STEP == 1) {
                Log.d(TAG, "ONLY_STEP=1 -> 只跑权限，结束（不标记引导完成）")
                running = false
                runCatching { MotorolaOnboardingFgs.stop(service) }
                return@run
            }
            MotorolaNavigator.post(200L, Runnable {
            Step2.run(service) {
                Log.d(TAG, "step2 完成 设备管理员")
                com.zaka.screenagent.flow.OnboardingProgress.step(2)
                if (ONLY_STEP == 2) {
                    Log.d(TAG, "ONLY_STEP=2 -> 只跑权限+设备管理员，结束（不标记引导完成）")
                    running = false
                    runCatching { MotorolaOnboardingFgs.stop(service) }
                    if (!com.zaka.screenagent.BuildConfig.NO_GUIDE) {
                        runCatching { com.zaka.screenagent.ui.GuardOverlay.show(service) }
                    }
                    return@run
                }
                Step3.run(service) { noti ->
                    Log.d(TAG, "step3 完成 通知=$noti")
                    com.zaka.screenagent.flow.OnboardingProgress.step(3)
                    if (ONLY_STEP == 3) {
                        Log.d(TAG, "ONLY_STEP=3 -> 只跑到通知使用权，结束（不标记引导完成）")
                        running = false
                        runCatching { MotorolaOnboardingFgs.stop(service) }
                        return@run
                    }
                    Step4.run(service) { batt ->
                        Log.d(TAG, "step4 完成 电池=$batt")
                        com.zaka.screenagent.flow.OnboardingProgress.step(4)
                        if (ONLY_STEP == 4) {
                            Log.d(TAG, "ONLY_STEP=4 -> 只跑到电池策略，结束（不标记引导完成）")
                            running = false
                            runCatching { MotorolaOnboardingFgs.stop(service) }
                            return@run
                        }
                        Log.d(TAG, "电池已由代码加入白名单（不再走应用信息页）")
                        com.zaka.screenagent.flow.OnboardingProgress.finish()
                        Log.d(TAG, "结束：权限=$granted 通知=$noti 电池=$batt")
                        Log.d(TAG, "===== 摩托罗拉引导结束 =====")
                        running = false
                        runCatching { MotorolaOnboardingFgs.stop(service) }
                        runCatching { com.zaka.screenagent.accessibility.BoundaryAccessibilityService.home() }
                        com.zaka.screenagent.flow.OnboardingHooks.complete(service)
                    }
                }
            }
            })
        }
    }
}
