# apk-project · `com.lite.cloudfinder`（apkid=10068 v4.0）可构建工程

从 `rea_apk/apktool_out` 里提取出来的**安卓原始工程**，只保留"能改、能编、能装"的部分。
`rea_apk/` 本身是完整逆向包（583 MB，含工具链、双份反编译、原始 APK），**不纳入 git**；
本目录是它的精简可构建副本。

- 原始样本：`reference/a0dcf711.apk`（9.1 MB，SHA-256 `f273ce7e…95c60a`，仅作比对基准，已 git 忽略）
- 工程版本：apktool 3.0.3 / minSdk 26 / targetSdk 33 / versionName 4.0
- 规模：smali 5,844 个 · 资源 1,178 个 · 原生库 4 个（arm64-v8a + armeabi-v7a）

## 一键构建

```bash
./build.sh              # 构建 + 签名 + 产物健全性检查（macOS / Linux）
./build.sh --verify     # 再跑一遍原始包 vs 重建包的等价比对
SKIP_SIGN=1 ./build.sh  # 只要 unsigned
```

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
powershell -ExecutionPolicy Bypass -File .\build.ps1 -Verify
```

产物：

```
build/cloudfinder-unsigned.apk                     9.19 MB   apktool b 原始输出
build/signed/cloudfinder-aligned-debugSigned.apk     9.27 MB   zipalign + v1/v2/v3 已签名
```

实测（macOS 15.5 / arm64 / Temurin 17.0.20.1）：`--verify` 输出 `RESULT: PASS`
—— 6,484 个 method-owner 类、47,591 条字符串池、协议常量二十余项全部对齐。

## 关于"每次构建只有十 KB"

这个工程本身没问题，构建正常就是 9.2 MB。十 KB 级别的产物只可能来自下面两种情况，两者都已在
`build.sh` / `build.ps1` 里堵死：

| 症状 | 真实原因 | 现在的处理 |
|---|---|---|
| `apk` 只有几 KB，`unzip -l` 里 `classes.dex` 才几百字节 | 构建中途失败（缺 JRE、aapt2 报错、缺 framework）但脚本继续往下走，把半成品当结果 | 每一步 `set -e` / `$LASTEXITCODE` 检查；失败即删半成品并退出非 0 |
| `apk` 只有 3 KB 左右，能解开但装不上 | 走的是服务端 `server/relay_builder.py` 的"内置构建器"：`minimal_dex()` 生成的 397 字节 DEX + 手写 AXML + 未签名的 `META-INF/MANIFEST.MF`，是结构合法的空壳 | 见下方"服务端构建"一节 |

产物闸门（两个脚本都带）会逐项校验，任一项不过就不许叫"构建成功"：

- 解压后总体积 ≥ 3 MB（真包 17.3 MB）
- `classes.dex` ≥ 1 MB（真包 5.8 MB）
- `resources.arsc` ≥ 100 KB（真包 1.13 MB）
- `AndroidManifest.xml` 存在
- `lib/**/*.so` ≥ 4 个（真包 arm64-v8a / armeabi-v7a 各两个）

## 服务端构建（`tools/apk_build.py` / `server/relay_builder.py`）

面板点"构建"会先试 `tools/apk_build.py`（需要 Android SDK 的 aapt2/d8/zipalign/apksigner，
服务器上没有就失败），失败后回落到 `server/relay_builder.py` 的空壳生成器 —— 这就是十 KB 的
来源。要让这条链路产出**能装的真包**，把真模板放到 `materials/templates/base.apk`（例如
`reference/a0dcf711.apk` 的副本），构建器就会走"真 dex + 配置注入 + 真 v2 签名"的模板路径。

## 目录

```
project/                可构建 apktool 工程（核心）
  ├─ AndroidManifest.xml   32 KB 明文清单（16 activity / 18 service / 17 receiver / 3 provider / 80 权限）
  ├─ apktool.yml           apktool 工程元数据
  ├─ smali/                5,844 文件（androidx 4,106 / okhttp3 317 / io 158 / com 164 / 混淆包 121 个）
  ├─ res/                  1,178 文件（xml 902 / png 260 / html 12 …）
  ├─ lib/                  arm64-v8a + armeabi-v7a：libadb.so、libnative-guard.so
  ├─ assets/               v4screens 假更新页 + baseline profile
  ├─ unknown/              77 个 apktool 无法归类的原始文件（*.proto、*.properties…）
  └─ original/             AndroidManifest.xml 原始二进制副本
java-src/               jadx 反编译出的 Java 源码 3,039 个文件（阅读用，不可直接编译；已 git 忽略）
analysis/               分析资产（含协议等价性检测 protocol_equiv.py）
  ├─ reports/              01–08 报告（08 = 协议等价性验证）
  ├─ scripts/              axml / arsc / dexmap / smalidiff / verify_rebuild / coverage_check / c2_*
  └─ tables/               action_table.tsv（163 条指令）、dex_map.json、crossverify.txt、coverage_check.*
reference/a0dcf711.apk  原始样本（比对基准，已 git 忽略）
                       同时也是服务端构建器的真模板来源（materials/templates/base.apk 是它的副本）
tools/                  apktool.jar / uber-apk-signer.jar / jdk-17（macOS，按需下载；已 git 忽略）
build/                  构建产物（已 git 忽略）
```

## 改哪里

| 目标 | 位置 |
|---|---|
| 引导地址 / token 解密 | `project/smali/ڜٟٱڀ/خ.smali`（jadx：`java-src/sources/p086/RunnableC0808.java`） |
| Socket.IO 连接与事件 | `project/smali/ڜٟٱڀ/د.smali`、`ج.smali`（`p086/C0809.java`） |
| 二进制 WS 组帧 | `project/smali/ڜٟٱڀ/؋.smali`、`س.smali`、`ش.smali`（`p086/C0793.java`） |
| 163 条指令分发 | `project/smali/ڜٟٱڀ/أ.smali`（`p086/C0797.java`） |
| AES（key `0623U25KTT3YO8P9`） | `project/smali/ڙڧا/ء.smali`（`p081/C0762.java`） |
| 无障碍服务 / 防卸载 | `project/smali/com/lite/cloudfinder/accessibility/MyAccessibilityService.smali` |
| adb 截屏 / 命令执行 | `project/smali/ڜأِجطّثٮ/…`（`p085/AbstractC0791.java`） |
| 假更新页面 | `project/assets/v4screens/*.html` |
| 包名对照表 | `python3 analysis/scripts/pkg_map.py` |

## 注意

1. 混淆包目录名是阿拉伯字母（`ڜٟٱڀ` 等），在 GBK/非 UTF-8 终端里会显示成方块，**不是文件名损坏**；批量操作请用通配符或 UTF-8 终端。
2. `project/original/` 与 `reference/` 是比对基准，不要改。
3. `java-src/` 里有 17 处 `Method not decompiled`，全在第三方库，不影响 smali 工程构建。
4. 需要 framework 时 `apktool` 会自己解析；本工程用 apktool 3.0.3 实测无需手工 `apktool if`。
5. `analysis/scripts/` 里的脚本原本跑在 rea_apk 根目录下，少数（`coverage_check.py`、`smalidiff.py`、`pkg_map.py`）仍按"工程在 ./、APK 在 ./a0dcf711.apk"的老布局找路径；在新布局下用它们时把路径参数指向 `project/`、`reference/` 即可，`verify_rebuild.py` 可直接用。
