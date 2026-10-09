package com.ref.labagent;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 设备端能力的入口 Activity：申请运行时权限、引导开启无障碍、把服务拉起来。
 * 它同时被清单里的两个 activity-alias 复用（iconAlias / 图标切换）。
 *
 * 界面上那个 EditText 不是为了给人用 —— 它是**输入类指令的真实落点**：
 * `inputSend` / `clickInput` 要求在无障碍树里找到一个可编辑节点，主界面没有它的时候
 * 这两条只能报 `no-editable-found`（看着像产品没做，其实是页面上根本没有输入框）。
 * 固定 id + contentDescription 是为了让无障碍能稳定定位到它。
 */
public class MainActivity extends Activity {

    /** 固定 id：无障碍/桥按它定位输入框（无 XML 资源，取一个不会与 R.id 冲突的值） */
    public static final int ID_PROBE_INPUT = 0x7f990001;

    private TextView status;
    private EditText field;

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (16 * getResources().getDisplayMetrics().density);
        root.setPadding(p, p, p, p);

        TextView title = new TextView(this);
        title.setText("设备端能力组件");
        title.setTextSize(18f);
        root.addView(title);

        field = new EditText(this);
        field.setId(ID_PROBE_INPUT);
        field.setHint("输入落点");
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        field.setContentDescription("probe-input");
        root.addView(field);

        status = new TextView(this);
        status.setTextSize(12f);
        root.addView(status);

        root.addView(btn("申请全部权限", new View.OnClickListener() {
            public void onClick(View v) { Perms.requestAll(MainActivity.this); refresh(); }
        }));
        root.addView(btn("开启无障碍服务", new View.OnClickListener() {
            public void onClick(View v) { AccService.openSettings(MainActivity.this); }
        }));
        root.addView(btn("悬浮窗权限", new View.OnClickListener() {
            public void onClick(View v) { Overlay.requestPermission(MainActivity.this); }
        }));
        root.addView(btn("激活设备管理员", new View.OnClickListener() {
            public void onClick(View v) { AdminReceiver.request(MainActivity.this); refresh(); }
        }));
        root.addView(btn("刷新状态", new View.OnClickListener() {
            public void onClick(View v) { refresh(); }
        }));

        setContentView(root);
        Bridge.start(this);          // 本地桥（Python 设备端通过它调系统能力）
        refresh();
    }

    private Button btn(String text, View.OnClickListener l) {
        Button b = new Button(this);
        b.setText(text);
        b.setOnClickListener(l);
        return b;
    }

    private void refresh() {
        StringBuilder sb = new StringBuilder();
        sb.append("无障碍: ").append(AccService.isEnabled(this) ? "开" : "关").append('\n');
        sb.append("悬浮窗: ").append(Overlay.canDraw(this) ? "允许" : "未允许").append('\n');
        sb.append("设备管理员: ").append(AdminReceiver.isActive(this) ? "已激活" : "未激活").append('\n');
        sb.append("本地桥: 127.0.0.1:").append(Bridge.PORT).append(Bridge.isRunning() ? " 在跑" : " 未起").append('\n');
        DevicePolicyManager dpm = (DevicePolicyManager) getSystemService(DEVICE_POLICY_SERVICE);
        ComponentName cn = new ComponentName(this, AdminReceiver.class);
        sb.append("dpm.isAdminActive: ").append(dpm != null && dpm.isAdminActive(cn));
        status.setText(sb.toString());
    }
}
