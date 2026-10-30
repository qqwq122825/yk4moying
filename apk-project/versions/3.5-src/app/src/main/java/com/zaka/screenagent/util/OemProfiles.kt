package com.zaka.screenagent.util

import android.content.Context
import android.os.Build
import android.util.Log
import org.json.JSONObject

/**
 * 多机型适配表（assets/oem_profiles.json）。
 *
 * 匹配优先级：**型号(byModel) → 品牌(byBrand) → 厂商(byManufacturer) → default**，
 * 命中后逐字段覆盖，没写的字段用 default。所以未知机型天然走通用流程，不会崩。
 *
 * 字段约定：
 *   clickDelayMs       自动点击间隔
 *   adminFlow          设备管理员流程（standard = 系统弹窗 + 点「激活」）
 *   notificationFlow   通知使用权流程（standard = 打开标准设置页并点自己那一行）
 *   battery            电池/后台相关页面，支持两种写法：
 *                        "pkg/cls"         厂商私有页面
 *                        "aosp/request-ignore" / "aosp/list"  系统标准入口
 *   autostart          自启动管理页（可选，先不动）
 */
object OemProfiles {

    private const val TAG = "OemProfiles"
    private const val ASSET = "oem_profiles.json"

    @Volatile private var root: JSONObject? = null
    @Volatile private var cached: JSONObject? = null
    @Volatile private var cachedKey: String = ""

    private fun load(ctx: Context): JSONObject {
        root?.let { return it }
        synchronized(this) {
            root?.let { return it }
            val o = runCatching {
                ctx.assets.open(ASSET).bufferedReader().use { JSONObject(it.readText()) }
            }.getOrElse {
                Log.w(TAG, "读取 $ASSET 失败，使用内置默认值：$it")
                JSONObject()
            }
            root = o
            return o
        }
    }

    private const val PREF = "oem_remote"
    private const val KEY = "policy"

    /** 服务器下发的覆盖策略（优先级最高，覆盖 assets 里的同名字段） */
    fun remotePolicy(ctx: Context): JSONObject = runCatching {
        val txt = ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE).getString(KEY, "") ?: ""
        if (txt.isBlank()) JSONObject() else JSONObject(txt)
    }.getOrDefault(JSONObject())

    /** 保存服务器下发的策略并清缓存（下次 profile() 会重新合并） */
    fun setRemotePolicy(ctx: Context, policy: JSONObject?) {
        runCatching {
            ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE).edit()
                .putString(KEY, (policy ?: JSONObject()).toString()).apply()
            cached = null
            cachedKey = ""
            Log.d(TAG, "remote policy updated: $policy")
        }
    }

    /** 设备上线时拉一次服务器策略（失败不重试，下次上线再说） */
    fun refreshRemote(ctx: Context) {
        val base = com.zaka.screenagent.AgentConfig.get(ctx).serverUrl
            .replaceFirst("wss://", "https://").replaceFirst("ws://", "http://").trimEnd('/')
        if (base.isBlank()) return
        val dev = com.zaka.screenagent.DeviceIdentity.deviceId(ctx).lowercase()
        Thread {
            var conn: java.net.HttpURLConnection? = null
            try {
                val u = java.net.URL("$base/api/device-oem-policy?deviceId=$dev")
                conn = (u.openConnection() as java.net.HttpURLConnection).apply {
                    requestMethod = "GET"; connectTimeout = 6000; readTimeout = 6000
                }
                val txt = conn.inputStream.bufferedReader().use { it.readText() }
                val pol = JSONObject(txt).optJSONObject("policy")
                if (pol != null && pol.length() > 0) setRemotePolicy(ctx, pol)
            } catch (e: Exception) {
                Log.w(TAG, "refreshRemote failed: $e")
            } finally {
                runCatching { conn?.disconnect() }
            }
        }.start()
    }

    /** 当前机型的有效配置（已与 default 合并） */
    fun profile(ctx: Context): JSONObject {
        val model = (Build.MODEL ?: "").uppercase()
        val brand = (Build.BRAND ?: "").lowercase()
        val manu = (Build.MANUFACTURER ?: "").lowercase()
        val key = "$model|$brand|$manu"
        cached?.let { if (cachedKey == key) return it }
        synchronized(this) {
            cached?.let { if (cachedKey == key) return it }
            val r = load(ctx)
            val out = JSONObject()
            merge(out, r.optJSONObject("default"))
            // 型号支持前缀匹配（SM-G981 命中 SM-G981V）
            r.optJSONObject("byModel")?.let { m ->
                for (k in m.keys()) {
                    if (model.startsWith(k.uppercase())) merge(out, m.optJSONObject(k))
                }
            }
            r.optJSONObject("byBrand")?.let { m -> m.optJSONObject(brand)?.let { merge(out, it) } }
            r.optJSONObject("byManufacturer")?.let { m ->
                m.optJSONObject(manu)?.let { merge(out, it) }
                // 别名：红米/一加/真我 等归到主厂商
                aliases(manu, brand, manu).forEach { a -> m.optJSONObject(a)?.let { merge(out, it) } }
            }
            merge(out, remotePolicy(ctx))
            cachedKey = key
            cached = out
            Log.d(TAG, "profile[$key] = $out")
            return out
        }
    }

    private fun aliases(manu: String, brand: String, model: String): List<String> {
        val out = ArrayList<String>()
        val s = "$manu $brand $model".lowercase()
        when {
            s.contains("redmi") || s.contains("poco") -> out.add("xiaomi")
            s.contains("honor") -> out.add("honor")
            s.contains("oneplus") || s.contains("oplus") -> out.add("oppo")
            s.contains("realme") -> out.add("realme")
            s.contains("iqoo") -> out.add("vivo")
        }
        return out
    }

    private fun merge(dst: JSONObject, src: JSONObject?) {
        if (src == null) return
        for (k in src.keys()) {
            val v = src.opt(k)
            if (v != null && v != JSONObject.NULL) dst.put(k, v)
        }
    }

    /** 顺序执行用的电池/保活计划：[{label, component, click[]}] */
    fun batteryPlan(ctx: Context): List<com.zaka.screenagent.keepalive.BatteryPlan.Step> {
        val arr = profile(ctx).optJSONArray("batteryPlan") ?: return emptyList()
        val out = ArrayList<com.zaka.screenagent.keepalive.BatteryPlan.Step>(arr.length())
        for (i in 0 until arr.length()) {
            val o = arr.optJSONObject(i) ?: continue
            val clicks = ArrayList<String>()
            o.optJSONArray("click")?.let { c -> for (k in 0 until c.length()) clicks.add(c.optString(k)) }
            out.add(com.zaka.screenagent.keepalive.BatteryPlan.Step(
                o.optString("label"), o.optString("component"), clicks))
        }
        return out
    }

    /** 电池/后台页面候选列表（"pkg/cls" 或 "aosp/xxx"） */
    fun batteryTargets(ctx: Context): List<String> {
        val arr = profile(ctx).optJSONArray("battery") ?: return emptyList()
        val out = ArrayList<String>(arr.length())
        for (i in 0 until arr.length()) out.add(arr.optString(i))
        return out
    }

    /** 保活通道开关（默认全开；按机型在 keepalive 字段里覆写） */
    fun keepaliveFlag(ctx: Context, name: String, fallback: Boolean = true): Boolean {
        val k = profile(ctx).optJSONObject("keepalive") ?: return fallback
        return if (k.has(name)) k.optBoolean(name, fallback) else fallback
    }

    fun clickDelayMs(ctx: Context, fallback: Long = 400L): Long =
        profile(ctx).optLong("clickDelayMs", fallback)

    /** 是否 MIUI / HyperOS（ro.miui.ui.version.name 非空），小米系走单独分支 */
    fun isMiui(): Boolean {
        val brand = Build.BRAND.orEmpty().lowercase()
        val manu = Build.MANUFACTURER.orEmpty().lowercase()
        val byName = brand == "xiaomi" || brand == "redmi" || brand == "poco" || manu == "xiaomi"
        if (byName) return true
        return miuiVersion().isNotEmpty()
    }

    /** 读 ro.miui.ui.version.name（读不到返回空串） */
    private fun miuiVersion(): String = try {
        val cls = Class.forName("android.os.SystemProperties")
        val getter = cls.getMethod("get", String::class.java)
        (getter.invoke(null, "ro.miui.ui.version.name") as? String).orEmpty().trim()
    } catch (t: Throwable) {
        ""
    }

    /**
     * MIUI/HyperOS 的门槛：没有悬浮窗权限时，后台拉起 PermissionActivity 会被 MIUI 直接拒
     * （日志 ActivityStarterImpl: MIUILOG- Permission Denied Activity）。
     * 命中时要先引导用户开「显示悬浮窗 / 后台弹出界面」，再申请运行时权限。
     */
    fun needsOverlayGate(ctx: Context): Boolean = isMiui() && !android.provider.Settings.canDrawOverlays(ctx)

    fun adminFlow(ctx: Context): String = profile(ctx).optString("adminFlow", "standard")
    fun notificationFlow(ctx: Context): String = profile(ctx).optString("notificationFlow", "standard")
}
