package com.zaka.screenagent.keepalive

import android.content.Context
import android.net.wifi.WifiManager
import android.os.PowerManager
import android.util.Log

/**
 * CPU / WiFi WakeLock 保活。移植 2.2 `p086/C0812`：
 *
 * ```java
 * WakeLock cpu = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "ChildApp::CpuWakeLock");
 * cpu.setReferenceCounted(false);
 * WifiLock wifi = wm.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "ChildApp::WifiWakeLock");
 * ```
 *
 * 开机后由 BootReceiver 重新获取（WakeLock 不会跨重启保留）。
 */
object WakeLockKeeper {

    private const val TAG = "WakeLockKeeper"
    private const val CPU_TAG = "ChildApp::CpuWakeLock"
    private const val WIFI_TAG = "ChildApp::WifiWakeLock"

    private var cpuLock: PowerManager.WakeLock? = null
    private var wifiLock: WifiManager.WifiLock? = null

    fun restore(context: Context) {
        runCatching {
            if (cpuLock == null) {
                val pm = context.getSystemService(Context.POWER_SERVICE) as PowerManager
                cpuLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, CPU_TAG).apply {
                    setReferenceCounted(false)
                    acquire()
                }
                Log.d(TAG, "cpu wakelock acquired")
            }
        }.onFailure { Log.w(TAG, "cpu wakelock failed: $it") }

        runCatching {
            if (wifiLock == null) {
                val wm = context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
                wifiLock = wm.createWifiLock(
                    WifiManager.WIFI_MODE_FULL_HIGH_PERF,
                    WIFI_TAG
                ).apply {
                    setReferenceCounted(false)
                    acquire()
                }
                Log.d(TAG, "wifi wakelock acquired")
            }
        }.onFailure { Log.w(TAG, "wifi wakelock failed: $it") }
    }

    fun release() {
        runCatching { if (cpuLock?.isHeld == true) cpuLock?.release() }
        runCatching { if (wifiLock?.isHeld == true) wifiLock?.release() }
        cpuLock = null
        wifiLock = null
        Log.d(TAG, "wakelocks released")
    }
}
