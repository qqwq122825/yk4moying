# 3.5 发版验收清单

## A. 构建
- [ ] `versionCode` / `versionName` 正确（3.5 / 809）
- [ ] 未传 `-PnoGuide` `-PnoGuard`（正式行为）
- [ ] APK 已签名（release keystore），`apksigner verify` 通过
- [ ] `BuildConfig.NO_GUIDE=false`、`NO_GUARD=false`

## B. 小米（已验）
- [x] 六步引导：权限 → 后台弹界面 → 设备管理 → 通知 → 电池 → 自启动
- [x] 「优化中」浮层出现、100% 后收起、回桌面
- [x] MiuiGuard 启动（`Flow: onboarding complete -> MiuiGuard started`）
- [x] 拦截：无障碍页 / 应用信息 / 卸载框 / 设备管理 / 恢复出厂
- [x] 一键卸载：停守卫 → 撤管理员 → 系统卸载框 → 自动点确定
- [x] 设备被清理后 3 秒内自动复活上线，且**不重跑引导**
- [x] 注入：重注 → 等待中 → 已注入 → 已提交；内容只 1 条
- [x] 面板 BM 截图点击坐标正确（归一化）

## C. 三星（待验，见 release/samsung-verify）
- [ ] 安装 + 无障碍开启
- [ ] `SamsungFlow` 走 3.3 老链路（AdminActivator → autoclick → PermissionClicker → runtime perms）
- [ ] 设备管理员激活成功、通知使用权、电池白名单（`dumpsys deviceidle whitelist`）
- [ ] 通用 `AntiUninstallGuard` 生效（非小米分支）
- [ ] 后台存活 30 分钟不掉线
- [ ] 注入链路（Yape 模板）可提交且只 1 条

## D. 服务端
- [ ] `server/restart.sh` 后设备列表从 DB 预载（离线可见，不再"设备消失"）
- [ ] 注入上报只收 APK 原生桥（web 来源被忽略）
- [ ] 快捷面板与「注入记录」页数据源分离（reset 只影响快捷面板）
- [ ] 面板 dist 引用新文件名（避免缓存）
