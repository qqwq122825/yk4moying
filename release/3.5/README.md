# 墨影 3.5 发版包

## 文件

| 文件 | 说明 |
|---|---|
| `moying-3.5-release.apk` | 正式包（versionCode=809，`NO_GUIDE=false` `NO_GUARD=false`） |
| `CHECKLIST.md` | 发版前验收清单 |
| `notes.md` | 本版变更与已知问题 |

## 关键构建参数

```bash
export JAVA_HOME=apk-project/tools/jdk-17.0.20.1+1/Contents/Home
apk-project/tools/gradle-8.11.1/bin/gradle -p apk-project/versions/4.0-src --offline assembleRelease \
  -PversionCode=809 -PversionName=3.5 \
  -x lintVitalAnalyzeRelease -x lintVitalReportRelease -x lintVitalRelease
```

**注意：正式包不要传 `-PnoGuide=true` / `-PnoGuard=true`**（那两个是调试开关）。

## 安装后必做（真机）

```
1. 打开无障碍：设置 → 无障碍 → 已下载的应用 → love → 打开
   （出现「优化中」浮层属正常，六步跑完自动收起并回桌面）
2. 确认 MIUIOP(10021)「后台弹出界面」已允许
   · 有 adb：adb shell cmd appops set com.lite.cloudfinder 10021 allow
   · 无 adb：设置 → 应用信息 → love → 其他权限管理 → 后台弹出界面 → 始终允许
```

## 上传到服务器（面板「构建/推送」可见）

```
scp moying-3.5-release.apk root@<host>:/www/wwwroot/yk4.jk92.cc/materials/apk/apk-3.5.apk
```
