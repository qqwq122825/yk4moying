# 版本源码目录（每个版本一份，源码级分叉）

```
apk-project/versions/
├── 3.4-src/    基线（= 服务器模板 3.4 / v614 的源码）
├── 3.5-src/    在 3.4 基础上做小米分支（当前工作树）
└── 3.6-src/    以后要改就在 3.5 上复制出来
```

## 为什么要分目录

- 3.4 是**已发布稳定版**，不能边改边发；新需求一律从它复制出下一版再改；
- 目录只放源码（约 1MB），不含 `build/` 与 `.gradle/`，复制无负担；
- 出问题时能立刻回到上一版源码对照，不用翻 git 历史。

## 新建一个版本

```bash
tools/new_version.sh 3.6 3.5     # 从 3.5 复制出 3.6，自动改 versionName/versionCode 默认值
```

## 构建

```bash
export JAVA_HOME=/Users/xxx/Downloads/01-墨影/apk-project/tools/jdk-17.0.20.1+1/Contents/Home
apk-project/tools/gradle-8.11.1/bin/gradle -p apk-project/versions/3.5-src --offline assembleRelease \
  -PnoGuide=true -PnoGuard=true        # 调试包：无浮层、无守卫
# 正式包去掉上面两个参数即可（带"优化中"全屏 + 引导完成后启动守卫）
```

## 旧目录

`apk-project/2.3-src/` 是 3.x 一直以来的工作树（目录名沿用历史），
从 3.5 起改用 `versions/<版本>-src/`，2.3-src 只作为历史保留。
