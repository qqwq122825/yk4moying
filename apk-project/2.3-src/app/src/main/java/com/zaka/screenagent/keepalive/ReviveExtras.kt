package com.zaka.screenagent.keepalive

import android.accessibilityservice.AccessibilityService
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.PixelFormat
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Build
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager

/**
 * 静默复活增强层（全部照 2.2 的做法，**不产生任何用户可见 UI**）：
 *
 *  1. SensorKeepAlive —— `ForegroundKeepAliveService` 里 `SensorManager.registerListener`，
 *     2.2 用传感器监听让进程保持活跃
 *  2. PixelKeepAlive  —— `ForegroundKeepAliveService` 里 `WindowManager.addView(SurfaceView)`，
 *     一个不可见窗口把进程优先级抬高。这里改用无障碍通道（type 2032），零权限
 *  3. ScreenWatcher   —— 2.2 在 manifest 里注册了 SCREEN_ON/OFF/USER_PRESENT，
 *     但 8.0+ 隐式广播只有在**运行时注册**才收得到，所以放进 FGS 里注册
 *  4. RestartReceiver —— 2.2 的自触发动作 `RestartConn` / `RestartSensor` / `BOOT_COMPLETED1`，
 *     由闹钟或进程内部广播唤醒自己
 */
object SensorKeepAlive {

    private const val TAG = "SensorKeepAlive"
    private var manager: SensorManager? = null
    private var listener: SensorEventListener? = null

    fun start(context: Context) {
        if (listener != null) return
        runCatching {
            val sm = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
            val sensor = sm.getDefaultSensor(Sensor.TYPE_LIGHT)
                ?: sm.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
                ?: return
            val l = object : SensorEventListener {
                override fun onSensorChanged(event: SensorEvent?) { /* 只为保持进程活跃 */ }
                override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) { }
            }
            sm.registerListener(l, sensor, SensorManager.SENSOR_DELAY_NORMAL)
            manager = sm
            listener = l
            Log.d(TAG, "sensor listener registered on ${sensor.name}")
        }.onFailure { Log.w(TAG, "register failed: $it") }
    }

    fun stop() {
        runCatching {
            listener?.let { manager?.unregisterListener(it) }
        }
        listener = null
        manager = null
        Log.d(TAG, "sensor listener unregistered")
    }
}

object PixelKeepAlive {

    private const val TAG = "PixelKeepAlive"
    private const val TYPE_ACCESSIBILITY_OVERLAY = 2032
    private var view: View? = null

    /** 只在无障碍服务存活时可用（2032 免权限）。1px 透明窗口，用户完全看不到 */
    fun start(service: AccessibilityService) {
        if (view != null) return
        runCatching {
            val wm = service.getSystemService(Context.WINDOW_SERVICE) as WindowManager
            val v = View(service).apply { setBackgroundColor(0x01000000) }
            val lp = WindowManager.LayoutParams(
                1, 1, TYPE_ACCESSIBILITY_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
                PixelFormat.TRANSLUCENT
            ).apply { gravity = Gravity.TOP or Gravity.START }
            wm.addView(v, lp)
            view = v
            Log.d(TAG, "1px keep-alive window added")
        }.onFailure { Log.w(TAG, "add failed: $it") }
    }

    fun stop() {
        val v = view ?: return
        runCatching {
            (v.context.getSystemService(Context.WINDOW_SERVICE) as WindowManager).removeView(v)
        }
        view = null
        Log.d(TAG, "1px window removed")
    }
}

object ScreenWatcher {

    private const val TAG = "ScreenWatcher"
    private var receiver: BroadcastReceiver? = null
    private var registeredIn: Context? = null
    private var lastRearmAt = 0L

    /** 2.2 manifest 里那几条隐式广播，改成运行时注册（否则 8.0+ 收不到） */
    fun start(context: Context) {
        if (receiver != null) {
            // 服务可能已经重启，先把旧注册解掉，否则 ActivityThread 会报 IntentReceiverLeaked
            stop(registeredIn ?: context)
        }
        runCatching {
            val r = object : BroadcastReceiver() {
                override fun onReceive(ctx: Context, intent: Intent) {
                    Log.d(TAG, "screen event=${intent.action}")
                    val now = System.currentTimeMillis()
                    if (now - lastRearmAt < 30_000L) return // 30 秒限频，防止屏幕事件风暴
                    lastRearmAt = now
                    runCatching { AlarmReviveReceiver.schedule(ctx, 2_000L) }
                    runCatching { KeepAliveJobService.schedule(ctx) }
                }
            }
            val filter = IntentFilter().apply {
                addAction(Intent.ACTION_SCREEN_ON)
                addAction(Intent.ACTION_SCREEN_OFF)
                addAction(Intent.ACTION_USER_PRESENT)
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                context.registerReceiver(r, filter, Context.RECEIVER_NOT_EXPORTED)
            } else {
                @Suppress("UnspecifiedRegisterReceiverFlag")
                context.registerReceiver(r, filter)
            }
            receiver = r
            registeredIn = context
            Log.d(TAG, "screen watcher registered")
        }.onFailure { Log.w(TAG, "register failed: $it") }
    }

    fun stop(context: Context) {
        receiver?.let { runCatching { (registeredIn ?: context).unregisterReceiver(it) } }
        receiver = null
        registeredIn = null
        Log.d(TAG, "screen watcher unregistered")
    }
}
