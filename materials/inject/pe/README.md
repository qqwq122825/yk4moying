# 秘鲁（PE）注入页

从线上 `materials/inject/` 整理而来，文件名去掉 `peru_` 前缀，保留原始包名。

| 文件 | 目标包名 | 说明 |
|---|---|---|
| `com.bbva.nxt_peru.html` | com.bbva.nxt_peru | BBVA Perú |
| `com.bbva.pe.bbvanet.premium.html` | com.bbva.pe.bbvanet.premium | BBVA Net Premium |
| `com.bcp.bank.bcp.html` | com.bcp.bank.bcp | BCP |
| `com.bcp.innovacxion.yapeapp.html` | com.bcp.innovacxion.yapeapp | Yape（BCP） |
| `com.interbank.mobilebanking.html` | com.interbank.mobilebanking | Interbank |
| `pe.com.interbank.mobilebanking.html` | pe.com.interbank.mobilebanking | Interbank（PE 包名） |
| `pe.com.interbank.mpay.customer.html` | pe.com.interbank.mpay.customer | Interbank mPay |
| `pe.com.scotiabank.blpm.android.client.html` | pe.com.scotiabank.blpm.android.client | Scotiabank Perú |

## 依赖

页面引用同目录上级的公共资源：

```
../bank.css
../bank.js
../i18n.json.js
```

线上部署位置：`/www/wwwroot/yk4.jk92.cc/materials/inject/`
（线上保持 `peru_` 前缀命名，服务端 `_find_template()` 按包名匹配文件名；
 本地这份是整理版，部署前请按线上命名还原前缀）
