package com.zaka.screenagent.flow

/**
 * 保活「策略参数」的唯一持有者：机制在公共层（服务/闹钟/传感器），
 * **具体数值由各厂商在自己的 KeepAlive 里设置**（miui/MiuiKeepAlive、samsung/SamsungKeepAlive）。
 *
 * 为什么这样拆：
 *   · 公共层只问"现在该多久跑一次"，不写死数字；
 *   · 小米激进省电（熄屏 CPU 超 6% 就杀），需要更长的熄屏间隔；
 *   · 三星宽松，可以用更短的间隔换取更快的复活速度。
 */
object VendorKeepAlive {

    /** 亮屏时前台包名轮询间隔（注入用） */
    @Volatile var fgTickOnMs: Long = 400L

    /** 熄屏时前台轮询间隔（熄屏期间完全不读节点树） */
    @Volatile var fgTickOffMs: Long = 5_000L

    /** 亮屏时复活闹钟间隔 */
    @Volatile var alarmOnMs: Long = 3_000L

    /** 熄屏时复活闹钟间隔 */
    @Volatile var alarmOffMs: Long = 30_000L

    /** 传感器是否跟随屏幕开关（true=熄屏注销） */
    @Volatile var sensorFollowScreen: Boolean = true

    /** 熄屏时是否允许读无障碍节点树（小米设 false 省 CPU，三星可 true） */
    @Volatile var readNodesWhenOff: Boolean = false
}
