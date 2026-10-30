package com.zaka.screenagent.net

import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import com.zaka.screenagent.DeviceIdentity
import org.json.JSONArray
import org.json.JSONObject

/**
 * 已安装应用列表（对齐 2.2 的 iconList 回包）。
 *
 * 面板「注入目标」里判断"本机已安装 / 未安装"靠的就是这份数据：
 *   {"data":[{"pkg":"com.bcp.innovacxion.yapeapp","name":"Yape"}, …], "deviceId":"…"}
 *
 * 2.2 只枚举带 LAUNCHER 入口的 App；这里改成**全量已安装包**，
 * 因为注入目标里有不带启动图标的包（如某些银行插件包）。
 */
object AppList {

    private const val TAG = "AppList"

    fun build(ctx: Context, limit: Int = 1500): JSONObject {
        val pm = ctx.packageManager
        val arr = JSONArray()
        val seen = HashSet<String>()
        runCatching {
            val pkgs = pm.getInstalledPackages(0)
            for (pi in pkgs) {
                val pkg = pi.packageName ?: continue
                if (!seen.add(pkg)) continue
                val label = runCatching { pi.applicationInfo?.loadLabel(pm)?.toString() }.getOrNull() ?: pkg
                arr.put(JSONObject().put("pkg", pkg).put("name", label))
                if (arr.length() >= limit) break
            }
        }.onFailure { Log.w(TAG, "enumerate failed: $it") }

        Log.d(TAG, "installed apps: ${arr.length()}")
        return JSONObject()
            .put("data", arr)
            .put("deviceId", DeviceIdentity.deviceId(ctx).lowercase())
            .put("count", arr.length())
    }

    fun send(channel: MoyingChannel, ctx: Context) {
        runCatching { channel.send("iconList", build(ctx)) }
            .onFailure { Log.w(TAG, "send failed: $it") }
    }
}
