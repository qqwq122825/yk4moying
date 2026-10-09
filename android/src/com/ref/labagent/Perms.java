package com.ref.labagent;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import java.util.ArrayList;
import java.util.List;

/** 运行时权限集中申请（原版把这一摊叫 autoRequestPerm / requestfloaty / permission）。 */
public class Perms {

    public static final String[] WANTED = new String[]{
            Manifest.permission.CAMERA,
            Manifest.permission.READ_SMS,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.READ_CALL_LOG,
            Manifest.permission.SYSTEM_ALERT_WINDOW
    };

    public static List<String> missing(Context c) {
        List<String> out = new ArrayList<>();
        for (String p : WANTED) {
            if (Manifest.permission.SYSTEM_ALERT_WINDOW.equals(p)) {
                continue;                       // 这个是特殊权限，用 Intent 申请
            }
            if (Build.VERSION.SDK_INT >= 23 && c.checkSelfPermission(p) != PackageManager.PERMISSION_GRANTED) {
                out.add(p);
            }
        }
        return out;
    }

    public static void requestAll(Activity a) {
        if (Build.VERSION.SDK_INT < 23) {
            return;
        }
        List<String> miss = missing(a);
        if (!miss.isEmpty()) {
            a.requestPermissions(miss.toArray(new String[0]), 2001);
        }
        if (!Overlay.canDraw(a)) {
            Overlay.requestPermission(a);
        }
    }

    /** 直接标记为已授权（root 下由 Python 侧用 pm grant 调；这个口子留给桥命令） */
    public static String status(Context c) {
        List<String> miss = missing(c);
        return miss.isEmpty() ? "all-granted" : ("missing:" + miss);
    }
}
