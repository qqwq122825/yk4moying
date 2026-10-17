.class public Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;
.super Lـ۰صںڱیؕ/آ;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "L\u0640\u06f0\u0635\u06ba\u06b1\u06cc\u0615/\u0622;"
    }
.end annotation


# instance fields
.field public ئ:I

.field public ا:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lـ۰صںڱیؕ/آ;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lـ۰صںڱیؕ/آ;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p2, 0x0

    invoke-super {p0, p1, p2, p3}, Lـ۰صںڱیؕ/ؤ;->onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z

    throw p2
.end method

.method public final onMeasureChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p1, 0x0

    throw p1
.end method

.method public final onNestedPreScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p1, 0x0

    throw p1
.end method

.method public final onNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIIII[I)V
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p2, 0x0

    if-ltz p7, :cond_1

    if-eqz p7, :cond_0

    return-void

    :cond_0
    sget-object p3, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->ACTION_SCROLL_FORWARD:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    invoke-virtual {p3}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->getId()I

    move-result p3

    invoke-static {p1, p3}, Landroidx/core/view/ViewCompat;->removeAccessibilityAction(Landroid/view/View;I)V

    sget-object p3, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->ACTION_SCROLL_BACKWARD:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    invoke-virtual {p3}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->getId()I

    move-result p3

    invoke-static {p1, p3}, Landroidx/core/view/ViewCompat;->removeAccessibilityAction(Landroid/view/View;I)V

    throw p2

    :cond_1
    throw p2
.end method

.method public final onRestoreInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .locals 1

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    instance-of p2, p3, Lـ۰صںڱیؕ/ء;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    check-cast p3, Lـ۰صںڱیؕ/ء;

    invoke-virtual {p3}, Landroidx/customview/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object p2

    invoke-super {p0, p1, v0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->onRestoreInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, v0, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->onRestoreInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    :goto_0
    return-void
.end method

.method public final onSaveInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 p2, 0x0

    invoke-super {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->onSaveInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    throw p2
.end method

.method public final onStartNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    and-int/lit8 p1, p5, 0x2

    const/4 p2, 0x0

    if-nez p1, :cond_0

    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->ا:Ljava/lang/ref/WeakReference;

    iput p6, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->ئ:I

    const/4 p1, 0x0

    return p1

    :cond_0
    throw p2
.end method

.method public final onStopNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    iget p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->ئ:I

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    if-eq p4, p1, :cond_0

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->ا:Ljava/lang/ref/WeakReference;

    return-void

    :cond_0
    const/4 p1, 0x0

    throw p1
.end method
