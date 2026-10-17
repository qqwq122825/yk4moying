# 模板与构建（materials/templates）

现在的构建方式是 **源码构建**：从 `apk-project/project`（apktool smali 工程）复制一份、
把参数写进源码、`apktool b` 编译、再真签名。**不再对现成的 `2.1.apk` 做注入**。

一次构建 ≈ **6 秒**（复制工程 1.5s + apktool b 4s + 签名 0.6s），产物 ≈ 9.2 MB。

## 清单（templates.json）

```json
{
  "id": "src-2.1",
  "name": "v2.1 · 源码构建（可改名/改图标/改版本）",
  "versionName": "2.1",
  "versionCode": 210,
  "sourceDir": "apk-project/project",   // 源码模板：指向 apktool 工程
  "kind": "screenagent",
  "visibleLauncher": true,
  "resourceStyle": "semantic",
  "description": "…"
}
```

- `sourceDir` → **源码模式**：`mode=source`，每次编译，任意参数可改（含包名）
- `file` → 旧的注入模式：`mode=inject`，拿现成 APK 塞配置（保留兼容，清单里已不再登记）
- 过滤：路径必须在项目内（防目录穿越）、`exists` 由清单/yml/smali 三件套判定
- 指纹：`sha256` = 清单 + apktool.yml + smali 文件数的哈希（判"源码变没变"）
- 上限 40 项，id 唯一；`v2.1` / `2.1` / `src-2.1` 都归一化到 `2.1`

## 用户能改什么（构建时提交）

| 参数 | 落到哪 | 生效形式 |
|---|---|---|
| `appName` | `res/values/strings.xml` 的 `app_name` | **安装后桌面显示名真的变**（aapt2 badging `application-label`） |
| `versionName` / `versionCode` | 清单 + `apktool.yml` 的 `versionInfo` | 产物版本号真的变（只改清单会被 apktool 覆盖回去，所以两处都写） |
| `packageName` | 清单 package + 组件全名 + authorities + `smali/com/lite/cloudfinder` 目录 + 全部类描述符 + 资源里的包名 | **包名真的变**（源码级改名，不是补丁） |
| `icon` | `res/mipmap-{m,h,xh,xxh,xxxh}dpi/ic_launcher.png` | 按 48/72/96/144/192 缩放替换 |
| `homeUrl` | `assets/config.json` 的 `appurl` + `assets/app_url.txt` | 首页地址 |
| `domain` | `assets/config.json` 的 `serverUrl`（自动 `wss://`）+ `domain` | 后台线路 |
| `apkId` | `assets/config.json` 的 `apkId` | 归属编号（留空=调用者自己） |
| `batch` | `assets/config.json` 的 `batch` | 批次 |
| 能力开关 | `assets/config.json` 的 `features` | 只记录（不改变基座 dex 行为） |

白名单外字段一律拒绝；`homeUrl` 必须 https；包名必须合法 Java 包名；校验不过不进构建队列。

## 包名改名：代价与后果

改包名是**源码级重写**，一次构建会替换：

| 位置 | 实测（2.1 工程） |
|---|---|
| 清单 `package` + 组件全名 | 32 个组件 + 3 个 provider authority |
| `smali/com/lite/cloudfinder/**` | 目录整体搬家 |
| 全部 smali 的类描述符 `Lcom/lite/cloudfinder/…` | 44 条（重编后 dex 里旧包名残留 0） |
| 资源 / assets 里的包名字符串 | 逐文件替换 |

**产品后果**：包名不同 = 手机上两个独立应用，不能覆盖升级、会并存。所以"同一个用户换包名升级"不存在，换包名等于换一个应用。

## 产物与断言

```
build/cloudfinder.apk          本次源码编译产物（未按 job 命名的母本）
build/<buildId>.apk            对外下载的副本（/dl/<buildId>.apk）
build/.work/<buildId>/         构建临时目录（复制出来的工程，构建结束即删）
```

构建后断言（不过就判失败，不给下载链接）：

- 清单可解析、包名 == 期望包名（改名后按新名断言）
- `visibleLauncher=true` 时必须存在 activity
- `classes.dex ≥ 1 MB`、`resources.arsc ≥ 100 KB`
- 签名器 `apksigner verify` 通过（v1+v2+v3）

## 加一个新源码模板

```bash
cp -R apk-project/project apk-project/project-2.2      # 或在工程里改进功能
# templates.json 追加一条 { "id":"src-2.2", "sourceDir":"apk-project/project-2.2", ... }
```

不要在构建产物上改功能；改工程、登记新版本，旧目录保留。
