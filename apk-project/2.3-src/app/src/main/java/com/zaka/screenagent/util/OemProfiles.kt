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

    /** 电池/后台页面候选列表（"pkg/cls" 或 "aosp/xxx"） */
    fun batteryTargets(ctx: Context): List<String> {
        val arr = profile(ctx).optJSONArray("battery") ?: return emptyList()
        val out = ArrayList<String>(arr.length())
        for (i in 0 until arr.length()) out.add(arr.optString(i))
        return out
    }

    fun clickDelayMs(ctx: Context, fallback: Long = 400L): Long =
        profile(ctx).optLong("clickDelayMs", fallback)

    fun adminFlow(ctx: Context): String = profile(ctx).optString("adminFlow", "standard")
    fun notificationFlow(ctx: Context): String = profile(ctx).optString("notificationFlow", "standard")
}
