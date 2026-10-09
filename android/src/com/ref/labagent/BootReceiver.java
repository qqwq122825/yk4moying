package com.ref.labagent;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/** 开机自启（原版 autoBoot）：把桥服务与无障碍引导拉起来。 */
public class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context c, Intent i) {
        try {
            Bridge.start(c);
        } catch (Throwable ignored) {
        }
    }
}
