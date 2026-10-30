package com.zaka.screenagent.util

import android.content.Context
import android.provider.Settings
import android.util.Log

/**
 * 调试开关。全部走 `Settings.Global`，adb 一条命令就能改，不用重新打包：
 *
 * ```
 * adb shell settings put global moying_no_overlay 1    # 不显示「优化中」浮层
 * adb shell settings put global moying_no_autoclick 1  # 不自动点击，只按顺序打开系统页面
 * adb shell settings delete global moying_no_overlay   # 恢复默认
 * ```
 */
object DebugFlags {

    private const val TAG = "DebugFlags"
    private const val KEY_NO_OVERLAY = "moying_no_overlay"
    private const val KEY_NO_AUTOCLICK = "moying_no_autoclick"

    fun noOverlay(context: Context): Boolean = read(context, KEY_NO_OVERLAY)

    /** 自动点击间隔（毫秒）。调试时设 2000 就能看清每一步点了什么 */
    fun clickDelayMs(context: Context): Long = runCatching {
        // 配置表里的 clickDelayMs 优先（多机型适配），没有再走全局调试值
        val fromProfile = com.zaka.screenagent.util.OemProfiles.clickDelayMs(context, 0L)
        // MIUI 弹窗有动画，点太快会点在动画帧上（表现为"点了但没生效"），统一放到 1.2s
        if (com.zaka.screenagent.util.OemProfiles.isMiui()) {
            return maxOf(fromProfile, 1200L)
        }
        if (fromProfile > 0L) return fromProfile
        val v = Settings.Global.getInt(context.contentResolver, "moying_click_delay_ms", 0)
        if (v in 200..10_000) {
            Log.d(TAG, "click delay = ${v}ms")
            v.toLong()
        } else 400L
    }.getOrDefault(400L)

    fun noAutoClick(context: Context): Boolean = read(context, KEY_NO_AUTOCLICK)

    /** 临时关掉防卸载/防重置守卫（调试导航时它会抢着按 BACK） */
    fun noGuard(context: Context): Boolean = read(context, "moying_no_guard")

    /** 只关「文字匹配」这一层，保留类名层（用来验证类名层单独是否够用） */
    fun noTextGuard(context: Context): Boolean = read(context, "moying_no_text_guard")

    /** 是否连「应用列表」页也直接弹回去（默认关：太显眼） */
    fun blockAppList(context: Context): Boolean = read(context, "moying_block_applist")

    /** 是否拦截「我们自己的应用详情页」（默认开：那是卸载的必经入口） */
    fun blockAppDetails(context: Context): Boolean =
        Settings.Global.getInt(context.contentResolver, "moying_block_appdetails", 1) != 0

    fun inAppListEvents(context: Context): Boolean = read(context, "moying_log_applist")

    /**
     * 测试模式：只保留「卸载确认框」拦截，其它层全部让路
     * （应用列表 / 应用详情页 / 取消激活页 / 文字匹配都不拦），
     * 方便验证「系统弹出『是否卸载』时能不能把它顶回去」。
     */
    fun guardUninstallOnly(context: Context): Boolean = read(context, "moying_guard_uninstall_only")

    /**
     * 终极守卫：**任何页面**只要出现我们的应用名（比如用户在浏览器里输入 "KISSLY"），
     * 立刻返回上一页。默认关；开了以后行为会很"怪"，只在需要时用。
     */
    fun nameWatch(context: Context): Boolean = read(context, "moying_name_watch")

    /**
     * 只保留最后的兜底层：**应用名 + 来源（设置/安全软件）** → 返回上一页。
     * 打开后，前面所有判断（应用列表/详情页/取消激活页/卸载框/文字匹配）全部让路。
     */
    fun onlyNameGuard(context: Context): Boolean = read(context, "moying_only_name_guard")

    /**
     * 黑屏遮罩调试档位（仅 debug 包生效）。无障碍连上 6 秒后自动拉起，用来在没有面板的情况下
     * 验证"用户看黑、上报能看见底图"：
     *
     * ```
     * adb shell settings put global moying_black_test lockAndroidUpdate   # lockNormal / lockUpdate
     * adb shell settings delete global moying_black_test                  # 关掉
     * ```
     */
    fun blackTestMode(context: Context): String? = runCatching {
        Settings.Global.getString(context.contentResolver, "moying_black_test")
            ?.takeIf { it == "lockNormal" || it == "lockUpdate" || it == "lockAndroidUpdate" }
    }.getOrNull()

    private fun read(context: Context, key: String): Boolean = runCatching {
        val v = Settings.Global.getInt(context.contentResolver, key, 0)
        val on = v == 1
        if (on) Log.d(TAG, "$key=1 (debug mode)")
        on
    }.getOrDefault(false)
}
