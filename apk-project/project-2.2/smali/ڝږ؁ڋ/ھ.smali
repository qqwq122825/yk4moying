.class public final Lڝږ؁ڋ/ھ;
.super Ljava/lang/Object;

# 调试模式开关：inject_state.debug_mode，默认 true。
# 为 true 时 onServiceConnected 会跳过原版整套引导（优化中遮罩、电池白名单、自启动、设备管理器），
# 只保留上线、上报与权限申请。

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
    const/4 v0, 0x1
    return v0
.end method
