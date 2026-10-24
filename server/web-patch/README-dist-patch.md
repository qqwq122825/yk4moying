# 面板「保活」页：两种落地方式

## 现状：仓库里没有面板前端源码

只有构建产物：

```
web/panel/index.html
web/panel/assets/index-dvi-972c.js   （1.2 MB，压缩后）
```

本地仓库、git 历史、服务器上都没有 `package.json` / `vite.config.*` / `src/`，
所以"改源码重新构建"暂时不可行。

## 方式 A（当前在用）：给 dist 打补丁

```bash
python3 server/web-patch/apply_dist_patch.py <站点>/web/panel
```

脚本做的事（幂等，已打过的会跳过）：

1. 路由表里 `/devices` 之后插入
   `{ path:"/oem", element:<div id="tb-oem-mount"> }`
2. 导航数组里「翻译」之后插入
   `{ to:"/oem", label:"保活", icon:<盾牌 svg> }`

页面内容由 `web/panel/assets/tb-oem.js` 渲染进 `#tb-oem-mount`（只读表格）。
面板升级换新 dist 后，重跑一次脚本即可。

## 方式 B（有源码时）：改源码 + 构建

把 `OemPolicy.tsx` 放到 `src/pages/OemPolicy.tsx`，然后：

```tsx
// src/router.tsx
{ path: '/oem', element: <OemPolicy /> }

// src/components/Sidebar.tsx 的导航数组
{ to: '/oem', label: '保活', icon: <ShieldIcon /> }
```

```bash
pnpm install && pnpm build      # 产出 dist → 覆盖 web/panel
```

这样以后所有改动都在源码层面，不再需要补丁脚本。
