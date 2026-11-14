# 4.0 模板与构建

B 包的活跃源码位于：

`apk-project/versions/4.0-src`

目录名暂保留是为了不破坏现有构建脚本；实际默认版本已是 `4.0 (1000)`。

## 本地构建

```bash
export JAVA_HOME="$PWD/apk-project/tools/jdk-17.0.20.1+1/Contents/Home"
export PATH="$JAVA_HOME/bin:$PWD/apk-project/tools/gradle-8.11.1/bin:$PATH"
cd apk-project/versions/4.0-src
gradle :app:assembleDebug --offline --no-daemon
gradle :app:assembleRelease --offline --no-daemon
```

正式包输出：

`apk-project/versions/4.0-src/app/build/outputs/apk/release/app-release.apk`

## 4.0 启动约定

1. 无障碍服务连接。
2. `StartupCoordinator` 立即显示「优化中」。
3. `VendorFlows` 按厂商执行引导。
4. `OnboardingHooks` 标记完成、收起浮层。
5. `VendorGuard` 进入运行就绪态。

守卫层不再匹配「卸载/强制停止/无障碍」等系统按钮文案，所以没有中文 ROM 特例；厂商差异只存在引导与保活策略中。
