package com.zaka.screenagent.flow

import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.Log
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 未适配机型的兜底流程（第二条腿）：**先打开页面，再用词表点按钮**。
 *
 *   MIUI / SAMSUNG / MOTOROLA → 各自的分步脚本（第一条腿，精确、已验证）
 *   COLOROS / ORIGINOS / EMUI / 未知 → 本流程
 *
 * 每个阶段做两件事：
 *   ① 用标准 Intent 打开目标页（权限弹窗 / 设备管理员 / 通知使用权 / 电池）
 *   ② 每 2 秒调一次 GenericEngine.clickOnce()，按 oem_pages.json 的词表点按钮
 *   条件满足进下一阶段；8 秒搞不定就跳过，绝不卡页。
 *
 * 调试开关：
 *   settings put global moying_flow generic   强制用词表兜底（任何机型）
 *   settings put global moying_flow steps     强制走 generic 的分步脚本
 */
object KeywordFlow : VendorFlow {

    private const val TAG = "Flow(KEYWORD)"
    // 每阶段预算：权限弹窗最多（三星要连点 10 个），其余较短
    private const val PERM_BUDGET_MS = 40_000L
    private const val PERM_TICK_MS = 1_200L
    private const val STAGE_BUDGET_MS = 12_000L
    private const val TICK_MS = 1_800L

    private val main = Handler(Looper.getMainLooper())
    @Volatile private var running = false

    override fun startKeepAlive(service: BoundaryAccessibilityService) =
        com.zaka.screenagent.flow.generic.GenericKeepAlive.start(service)

    private class Stage(
        val name: String,
        val satisfied: () -> Boolean,
        val open: () -> Unit,
        val budgetMs: Long = STAGE_BUDGET_MS,
        val tickMs: Long = TICK_MS
    )

    override fun start(service: BoundaryAccessibilityService, noAutoClick: Boolean) {
        if (running) { Log.d(TAG, "already running, skip"); return }
        running = true
        Log.d(TAG, "===== 词表兜底引导开始 (vendor=${Vendor.detect()}) =====")
        runCatching {
            Settings.Global.putInt(service.contentResolver, "moying_force_onboard", 0)
        }
        runCatching { GenericOnboardingFgsCompat.start(service) }
        GenericEngine.load(service)

        val stages = listOf(
            Stage("permission", { missingPerms(service) == 0 }, { openPermissions(service) },
                budgetMs = PERM_BUDGET_MS, tickMs = PERM_TICK_MS),
            Stage("admin", { isAdmin(service) }, { openAdmin(service) }),
            Stage("notification", { isNotificationGranted(service) }, { openNotification(service) }),
            Stage("battery", { isBatteryWhitelisted(service) }, { openBattery(service) })
        )
        runStages(service, stages, 0)
    }

    private fun runStages(service: BoundaryAccessibilityService, stages: List<Stage>, index: Int) {
        if (index >= stages.size) {
            Log.d(TAG, "all stages done -> hooks.complete")
            running = false
            runCatching { OnboardingHooks.complete(service) }
            return
        }
        val stage = stages[index]
        if (runCatching { stage.satisfied() }.getOrDefault(false)) {
            Log.d(TAG, "stage ${stage.name}: already satisfied, skip")
            runStages(service, stages, index + 1)
            return
        }
        Log.d(TAG, "stage ${stage.name}: opening page")
        runCatching { stage.open() }
        val started = System.currentTimeMillis()
        var taps = 0

        val tick = object : Runnable {
            override fun run() {
                val ok = runCatching { stage.satisfied() }.getOrDefault(false)
                taps += runCatching { GenericEngine.clickOnce(service) }.getOrDefault(0)
                if (ok) {
                    Log.d(TAG, "stage ${stage.name}: satisfied (taps=$taps)")
                    runStages(service, stages, index + 1)
                    return
                }
                // 权限阶段：如果当前不在权限页，重新拉起（用户/系统可能把弹窗关掉）
                if (stage.name == "permission") {
                    val focus = runCatching {
                        service.rootInActiveWindow?.packageName?.toString().orEmpty()
                    }.getOrDefault("")
                    if (!focus.contains("permissioncontroller") && !focus.contains("packageinstaller")) {
                        runCatching { stage.open() }
                    }
                }
                if (System.currentTimeMillis() - started > stage.budgetMs) {
                    Log.w(TAG, "stage ${stage.name}: timeout, skip (taps=$taps)")
                    runStages(service, stages, index + 1)
                    return
                }
                main.postDelayed(this, stage.tickMs)
            }
        }
        main.postDelayed(tick, 900L)
    }

    // ── 阶段判定 ──

    private fun missingPerms(service: BoundaryAccessibilityService): Int =
        com.zaka.screenagent.perm.PermissionFlow.effective().count {
            androidx.core.content.ContextCompat.checkSelfPermission(service, it) !=
                android.content.pm.PackageManager.PERMISSION_GRANTED
        }

    private fun isAdmin(service: BoundaryAccessibilityService): Boolean =
        runCatching { com.zaka.screenagent.admin.MoyingAdminReceiver.isActive(service) }.getOrDefault(false)

    private fun isNotificationGranted(service: BoundaryAccessibilityService): Boolean =
        runCatching { com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(service) }
            .getOrDefault(false)

    private fun isBatteryWhitelisted(service: BoundaryAccessibilityService): Boolean =
        runCatching { com.zaka.screenagent.keepalive.BatteryOptimization.isWhitelisted(service) }
            .getOrDefault(false)

    // ── 阶段动作（标准 Intent，不依赖厂商页面 id）──

    private fun openPermissions(service: BoundaryAccessibilityService) {
        runCatching {
            service.startActivity(
                Intent(service, com.zaka.screenagent.perm.PermissionActivity::class.java)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }
    }

    private fun openAdmin(service: BoundaryAccessibilityService) {
        runCatching {
            val admin = com.zaka.screenagent.admin.MoyingAdminReceiver.component(service)
            val i = Intent(android.app.admin.DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
                .putExtra(android.app.admin.DevicePolicyManager.EXTRA_DEVICE_ADMIN, admin)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            service.startActivity(i)
        }.onFailure { Log.w(TAG, "open admin failed: $it") }
    }

    private fun openNotification(service: BoundaryAccessibilityService) {
        runCatching { com.zaka.screenagent.notify.NotificationAccessActivator.start(service) }
    }

    private fun openBattery(service: BoundaryAccessibilityService) {
        runCatching { com.zaka.screenagent.keepalive.BatteryOptimization.open(service) }
    }
}

/** 兼容层：不同版本里这个前台服务的名字可能不同，取不到就跳过。 */
internal object GenericOnboardingFgsCompat {
    fun start(service: BoundaryAccessibilityService) {
        runCatching {
            com.zaka.screenagent.flow.generic.GenericOnboardingFgs.start(service)
        }.onFailure { Log.d("Flow(KEYWORD)", "fgs 不可用: ${it.javaClass.simpleName}") }
    }
}
