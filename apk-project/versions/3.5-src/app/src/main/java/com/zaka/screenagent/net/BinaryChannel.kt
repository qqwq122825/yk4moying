package com.zaka.screenagent.net

import android.util.Log
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.WebSocket
import okhttp3.WebSocketListener
import okio.ByteString
import okio.ByteString.Companion.toByteString
import org.json.JSONObject
import java.nio.ByteBuffer
import java.util.concurrent.TimeUnit

/**
 * 二进制通道（2.1/2.2 同款）：
 *   wss://<host>/ws/binary-device?deviceId=<android_id>
 *   帧格式 [1B type][4B 大端长度][payload]，一条 message 可含多帧
 *
 * type: 1=screen(JPEG/PNG) 2=a11y_tree 4=thumb 6=hd 7=adb_tree
 *       16=command(服务端下发) 33=pong 48=hello
 *
 * 好处：不 base64、不 AES、不 JSON 包装，JPEG 每帧 ~60KB（PNG 的 1/7）。
 */
class BinaryChannel(
    private val hostProvider: () -> String,
    private val deviceIdProvider: () -> String,
    private val onCommand: (JSONObject) -> Unit
) {
    companion object {
        private const val TAG = "BinChannel"
        const val T_SCREEN = 1
        const val T_A11Y_TREE = 2
        const val T_THUMB = 4
        const val T_HD = 6
        const val T_ADB = 7
        const val T_COMMAND = 16
        const val T_PONG = 33
        const val T_HELLO = 48
        const val APK_ID = "10020"
    }

    private val client = OkHttpClient.Builder()
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(0, TimeUnit.MILLISECONDS)
        .pingInterval(25, TimeUnit.SECONDS)
        .retryOnConnectionFailure(true)
        .build()

    private var ws: WebSocket? = null
    @Volatile private var open = false
    private var retry = 0
    private val main = android.os.Handler(android.os.Looper.getMainLooper())
    private val reconnect = Runnable { connect() }

    fun isOpen(): Boolean = open

    fun start() {
        connect()
    }

    fun stop() {
        open = false
        main.removeCallbacks(reconnect)
        runCatching { ws?.close(1000, "bye") }
        ws = null
    }

    private fun connect() {
        val url = "wss://${hostProvider()}/ws/binary-device?deviceId=${deviceIdProvider()}"
        Log.d(TAG, "connect $url")
        ws = client.newWebSocket(Request.Builder().url(url).build(), object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                open = true
                retry = 0
                Log.i(TAG, "binary channel open")
                sendFrame(T_HELLO, JSONObject().put("apkId", APK_ID).toString().toByteArray())
            }

            override fun onMessage(webSocket: WebSocket, bytes: ByteString) {
                parse(bytes.toByteArray())
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                open = false
                Log.w(TAG, "binary failure: ${t.message}")
                schedule()
            }

            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                open = false
                Log.w(TAG, "binary closed $code")
                schedule()
            }
        })
    }

    private fun schedule() {
        retry++
        val delay = minOf(30_000L, 2_000L * retry)
        main.removeCallbacks(reconnect)
        main.postDelayed(reconnect, delay)
    }

    /** 一条 message 里可以塞多帧，这里逐帧解析 */
    private fun parse(buf: ByteArray) {
        var i = 0
        while (i + 5 <= buf.size) {
            val type = buf[i].toInt() and 0xff
            val len = ByteBuffer.wrap(buf, i + 1, 4).int
            if (len < 0 || i + 5 + len > buf.size) break
            val payload = buf.copyOfRange(i + 5, i + 5 + len)
            i += 5 + len
            when (type) {
                T_COMMAND -> runCatching {
                    onCommand(JSONObject(String(payload, Charsets.UTF_8)))
                }.onFailure { Log.w(TAG, "cmd parse fail: $it") }
                T_PONG -> {}
                else -> Log.v(TAG, "frame type=$type len=$len")
            }
        }
    }

    fun sendFrame(type: Int, payload: ByteArray): Boolean {
        val socket = ws ?: return false
        if (!open) return false
        val head = ByteBuffer.allocate(5).put(type.toByte()).putInt(payload.size).array()
        return runCatching {
            socket.send((head + payload).toByteString())
            true
        }.getOrDefault(false)
    }
}
