package com.zaka.screenagent

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import android.view.ViewGroup
import android.webkit.WebResourceRequest
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.webkit.WebChromeClient

/**
 * B 包的「首页」：直接加载构建时写入的首页地址（assets/agent_config.json → homepage）。
 *
 * 设计约束：
 *   · **无桌面入口**：清单里没有 LAUNCHER，桌面看不到图标
 *   · 只由内部拉起：面板指令 / A 包安装完成 / 无障碍动作
 *   · 原来那套调试面板（数据模式 / 无障碍设置 / 运行操作）已移除，
 *     避免用户或操作者误看到技术界面
 */
class MainActivity : Activity() {

    private var web: WebView? = null

    @SuppressLint("SetJavaScriptEnabled")
    override fun onCreate(state: Bundle?) {
        super.onCreate(state)
        val url = AgentConfig.get(this).homepage.ifBlank { "https://www.baidu.com/" }
        Log.d(TAG, "home url=$url")

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
                // 去掉 "; wv" 标记，网站看到的是普通 Chrome
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
    }

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
