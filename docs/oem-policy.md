# 机型保活策略（本地配置 + 接口）

面板不再加入口按钮，改成「本地按机型自动匹配 + 服务端接口可覆盖」两条路。

## 1. 本地配置（默认，跟随包走）

文件：`apk-project/2.3-src/app/src/main/assets/oem_profiles.json`

匹配顺序：**byModel（前缀匹配） → byBrand → byManufacturer → default**，
命中后逐字段覆盖，没写的字段继承 default。未知机型自动落到 default，不会卡住。

```json
{
  "default": { "clickDelayMs": 400,
               "battery": ["aosp/request-ignore", "aosp/list"] },
  "byManufacturer": {
    "xiaomi": { "clickDelayMs": 500,
                "battery": ["com.miui.powerkeeper/com.miui.powerkeeper.ui.HiddenAppsConfigActivity",
                            "com.miui.securitycenter/com.miui.permcenter.autostart.AutoStartManagementActivity",
                            "aosp/request-ignore"] },
    "tecno":  { "clickDelayMs": 600,
                "battery": ["com.transsion.phonemanager/com.transsion.phonemanager.module.autostart.AutoStartActivity",
                            "aosp/request-ignore"] }
  },
  "byModel": { "SM-G981": { "clickDelayMs": 400 } }
}
```

`battery` 每项两种写法：

- `"pkg/cls"` —— 厂商私有页面
- `"aosp/request-ignore"` / `"aosp/list"` —— 系统标准入口

代码：`util/OemProfiles.kt`（加载/合并/别名），`keepalive/BatteryOptimization.kt`（按顺序尝试）。

别名：红米/POCO→xiaomi、一加/realme→oppo 系、iQOO→vivo、荣耀→honor。

## 2. 服务端接口（需要时远程覆盖某台机器）

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/api/devices` | 设备上报里带 `deviceInfo.oem`（候选路径）、`batteryPath`（首选）、`batteryPathUsed`（实际打开成功的那条） |
| GET | `/api/oem-policy?deviceId=X` | 读该设备的覆盖策略（面板鉴权） |
| POST | `/api/oem-policy` | 写覆盖并立即 `send_command('oemPolicy')` 下发 |
| GET | `/api/device-oem-policy?deviceId=X` | 设备上线时自己拉取（免 token） |

写覆盖示例：

```bash
curl -X POST https://yk4.jk92.cc/api/oem-policy \
  -H "Authorization: Bearer $TOKEN" -H 'Content-Type: application/json' \
  -d '{"deviceId":"7e0709667bdaad56","policy":{"battery":["com.miui.powerkeeper/com.miui.powerkeeper.ui.HiddenAppsConfigActivity","aosp/request-ignore"],"clickDelayMs":600}}'
```

优先级：**远程覆盖 > byModel > byBrand > byManufacturer > default**。

存储：`state/oem_policy.json`；设备端持久化在 SharedPreferences（`oem_remote/policy`）。

## 3. 怎么确认某台机器走了哪条

设备日志：

```
D/OemProfiles : profile[REDMI 13C|redmi|xiaomi] = {...}
D/BatteryOpt  : opened by profile: com.miui.powerkeeper/…HiddenAppsConfigActivity
```

或看 `/api/devices` 里的 `deviceInfo.batteryPathUsed`（`aosp/*` 表示落在了兜底）。
