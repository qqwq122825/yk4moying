# 多 AI 协作与推送规则（2026-11 起）

## 现状（2026-11-18 核对）

```
仓库         /Users/xxx/Downloads/01-墨影  (git@github.com:qqwq122825/yk4moying.git, main)
提交作者     全部为「全炫桦」（本地 git user，所有 AI 共用一个身份）
本地/远端    cf75fd90 == origin/main
分支         main、backup/pre-target35
工作树       主工作树干净；另有 3 个 /private/tmp 下的 rollback/baseline 工作树（prunable）
服务器代码   server/*.py 与仓库 md5 一致（无漂移）
```

## 其他 AI 删掉的是什么

`artifacts/`、`/analysis/` 这类**被 .gitignore 忽略的本地大件**被删过：

```
artifacts/4.0/、artifacts/4.0.1/       本地出包归档（APK 另存 ~/Downloads + release/4.0）
analysis/wonderly-1.8.19/              Wonderly 反编译工作区（payload/jadx/locateValues.json）
```

- 对 git 没有任何影响：`git status` 无 D 记录，已跟踪文件一个没丢
- 已产出的结论都进了仓库：`assets/uninstall_shield.json`、`assets/oem_pages.json`、
  `docs/4.0-uninstall-shield.md`、`docs/4.0-keyword-fallback.md`
- 原始 APK 仍在 `~/Downloads/Wonderly_1.8.19.apk`，需要时能重新反编译

## 真正的风险点

```
① state/refc2.db 与 state/store.json 是被跟踪的（.gitignore 里有 ! 例外）
   → 面板操作 / 别的 AI 改库都会让工作区变脏；误提交会把别人的运行态带进仓库
② 服务器端文件可能被别的 AI 直接改（目前一致，但无法保证）
   → 提交前先比对 md5
③ 同一文件被两个 AI 同时改 → 推送被拒或覆盖
   → 一律先 fetch/rebase，再提交
```

## 提交推送标准动作

```bash
bash tools/safe_push.sh "<提交信息>" <要提交的路径...>
```

它做五件事：

```
1 拉远端；分叉则中止并提示 rebase
2 只 add 你指定的路径（不 `git add -A`）
3 拒绝把 state/refc2.db、state/store.json 混进提交；检测冲突标记
4 跑三条自检（防卸载 / 词表兜底 / 4.0 启动）
5 提交并推送，打印本地与远端短哈希
```

## 人工约定

```
· 只提交自己改的文件，禁止 git add -A / git commit -a
· 有 apk / db / 二进制产物时先看 .gitignore，别硬加 -f
· 动服务器代码（server/*.py）先 scp 下来 diff，改完再传，避免覆盖别的 AI 的修复
· 大件分析产物要么进 docs/*.md（结论），要么本地保留；不要指望 untracked 目录长期存在
· 需要回滚：git revert <hash>，不用 reset --hard（会把别人的工作一起抹掉）
```
