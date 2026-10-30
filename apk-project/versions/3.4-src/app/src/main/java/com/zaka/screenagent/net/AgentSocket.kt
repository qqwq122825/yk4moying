package com.zaka.screenagent.net

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.Log
import com.zaka.screenagent.AgentConfig
import com.zaka.screenagent.DeviceIdentity
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.WebSocket
import okhttp3.WebSocketListener
import org.json.JSONObject
import java.util.LinkedHashMap
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

/** Authenticated ScreenAgent 1.9.0 WebSocket using the compact command/1 protocol. */
class AgentSocket(
    private val ctx: Context,
    private val onCommand: (String, String?, JSONObject) -> Unit,
    private val statusProvider: () -> JSONObject = { JSONObject() }
) {
    private val cfg: AgentConfig = AgentConfig.get(ctx)
    private val deviceId = DeviceIdentity.deviceId(ctx)
    private val client = OkHttpClient.Builder()
        .pingInterval(20, TimeUnit.SECONDS)
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(0, TimeUnit.MILLISECONDS)
        .retryOnConnectionFailure(true)
        .build()
    private var ws: WebSocket? = null
    private val running = AtomicBoolean(false)
    private val main = Handler(Looper.getMainLooper())
    private var retry = 0
    private var networkCallbackRegistered = false
    private val connectivity = ctx.getSystemService(ConnectivityManager::class.java)
    private val reconnect = Runnable { connect() }
    private val resultCache = object : LinkedHashMap<String, String>(128, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, String>?): Boolean =
            size > 100
    }
    private val networkCallback = object : ConnectivityManager.NetworkCallback() {
        override fun onAvailable(network: Network) {
            main.post {
                if (!running.get() || ws != null) return@post
                retry = 0
                main.removeCallbacks(reconnect)
                connect()
            }
        }

        override fun onLost(network: Network) {
            if (running.get()) main.post { onStateChange?.invoke("offline") }
        }
    }

    var onStateChange: ((String) -> Unit)? = null
    var onAuthenticationRequired: (() -> Unit)? = null
    var onDebugState: ((JSONObject) -> Unit)? = null

    fun start() {
        if (!running.compareAndSet(false, true)) return
        runCatching {
            connectivity.registerDefaultNetworkCallback(networkCallback)
            networkCallbackRegistered = true
        }
        connect()
    }

    fun stop() {
        running.set(false)
        main.removeCallbacksAndMessages(null)
        if (networkCallbackRegistered) runCatching {
            connectivity.unregisterNetworkCallback(networkCallback)
        }
        networkCallbackRegistered = false
        runCatching { ws?.close(1000, "bye") }
        ws = null
    }

    private fun sendRaw(message: String): Boolean =
        runCatching { ws?.send(message) == true }.getOrDefault(false)

    fun sendEvent(name: String, data: JSONObject = JSONObject()): Boolean =
        sendRaw(Protocol.event(name, data))

    fun sendResult(
        id: String?,
        accepted: Boolean,
        reasonCode: String? = null,
        state: String = if (accepted) "accepted" else "rejected"
    ) {
        if (id.isNullOrBlank()) return
        val message = Protocol.result(id, accepted, state, reasonCode)
        synchronized(resultCache) { resultCache[id] = message }
        sendRaw(message)
    }

    fun screenshotResult(commandId: String, result: String, reasonCode: String? = null) {
        sendEvent(Protocol.EVENT_CAPTURE, JSONObject().apply {
            put("id", commandId)
            put("state", result)
            if (!reasonCode.isNullOrBlank()) put("code", reasonCode)
        })
    }

    fun accessibilitySnapshot(viewerId: String, payload: JSONObject): Boolean =
        sendEvent(
            Protocol.EVENT_ACCESSIBILITY,
            JSONObject().put("viewerId", viewerId).put("payload", payload)
        )

    private fun endpoint(): String {
        val base = DeviceSession(ctx).origin
            .replace("https://", "wss://")
            .replace("http://", "ws://")
        return "$base/ws/device"
    }

    private fun deviceStatus(): JSONObject = JSONObject().apply {
        put("type", "device_heartbeat")
        put("apkId", cfg.apkId)
        val status = statusProvider()
        status.keys().forEach { key -> put(key, status.get(key)) }
    }

    private fun connect() {
        if (!running.get() || ws != null) return
        val request = Request.Builder()
            .url(endpoint())
            .header("Authorization", "Bearer ${DeviceSession(ctx).token}")
            .build()
        onStateChange?.invoke("connecting")
        ws = client.newWebSocket(request, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                main.removeCallbacks(reconnect)
                retry = 0
                Log.i(TAG, "ws open: $deviceId / command/1")
                sendEvent(Protocol.EVENT_REGISTER, JSONObject().apply {
                    put("apkId", cfg.apkId)
                    put("batch", cfg.batch)
                    put("buildId", cfg.buildId)
                    DeviceIdentity.profile(ctx).forEach { (key, value) -> put(key, value) }
                })
                sendEvent(Protocol.EVENT_STATUS, deviceStatus())
                onStateChange?.invoke("online")
                main.post(object : Runnable {
                    override fun run() {
                        if (!running.get()) return
                        sendEvent(Protocol.EVENT_STATUS, deviceStatus())
                        main.postDelayed(this, 20_000)
                    }
                })
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                runCatching {
                    val message = JSONObject(text)
                    val action = message.optString("action")
                    if (action.isNotBlank()) {
                        val id = message.optString("id").takeIf { it.isNotBlank() }
                        val duplicate = id?.let { synchronized(resultCache) { resultCache[it] } }
                        if (duplicate != null) {
                            sendRaw(duplicate)
                            return@runCatching
                        }
                        val data = message.optJSONObject("data") ?: JSONObject()
                        val ttl = message.optLong("ttl", -1L)
                        val receivedAt = SystemClock.elapsedRealtime()
                        Log.i(TAG, "action <- $action")
                        main.post {
                            if (ttl > 0 && SystemClock.elapsedRealtime() - receivedAt > ttl)
                                sendResult(id, false, "expired")
                            else onCommand(action, id, data)
                        }
                        return@runCatching
                    }
                    when (message.optString("event")) {
                        "server.ready", "server.status" -> {
                            val debug = message.optJSONObject("data")?.optJSONObject("debug")
                            if (debug != null) main.post { onDebugState?.invoke(debug) }
                        }
                    }
                }
            }

            override fun onFailure(webSocket: WebSocket, error: Throwable, response: Response?) {
                if (ws === webSocket) ws = null
                if (response?.code == 401 || response?.code == 403) {
                    stop()
                    onStateChange?.invoke("renewing")
                    onAuthenticationRequired?.invoke()
                    return
                }
                Log.w(TAG, "ws failure: ${error.message}")
                onStateChange?.invoke("offline")
                scheduleReconnect()
            }

            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                if (ws === webSocket) ws = null
                if (code == 4001) {
                    stop()
                    onStateChange?.invoke("renewing")
                    onAuthenticationRequired?.invoke()
                    return
                }
                onStateChange?.invoke("closed($code)")
                scheduleReconnect()
            }
        })
    }

    private fun scheduleReconnect() {
        if (!running.get()) return
        val delay = minOf(30_000L, 1000L * (1 shl minOf(retry, 5)))
        retry++
        main.removeCallbacks(reconnect)
        main.postDelayed(reconnect, delay)
    }

    companion object {
        private const val TAG = "AgentSocket"
    }
}
