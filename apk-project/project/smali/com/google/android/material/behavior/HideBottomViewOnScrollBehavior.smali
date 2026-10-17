.class public Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final ؋:Ljava/util/LinkedHashSet;

.field public ؠ:I

.field public ء:I

.field public آ:Landroid/animation/TimeInterpolator;

.field public أ:Landroid/animation/TimeInterpolator;

.field public ؤ:I

.field public إ:I

.field public ئ:Landroid/view/ViewPropertyAnimator;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>()V

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->؋:Ljava/util/LinkedHashSet;

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؤ:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->؋:Ljava/util/LinkedHashSet;

    const/4 p1, 0x0

    iput p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؤ:I

    const/4 p1, 0x2

    iput p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    return-void
.end method


# virtual methods
.method public onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 3

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؤ:I

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f030325

    const/16 v2, 0xe1

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؠ:I

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f03032b

    const/16 v2, 0xaf

    invoke-static {v0, v1, v2}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ء:I

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lؿ١ڔظۇٟؗٞ/؋;->آ:Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    const v2, 0x7f030335

    invoke-static {v0, v2, v1}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->آ:Landroid/animation/TimeInterpolator;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lؿ١ڔظۇٟؗٞ/؋;->ء:Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;

    invoke-static {v0, v2, v1}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->أ:Landroid/animation/TimeInterpolator;

    invoke-super {p0, p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result p1

    return p1
.end method

.method public final onNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIIII[I)V
    .locals 6

    const/4 p1, 0x0

    iget-object p3, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->؋:Ljava/util/LinkedHashSet;

    const/4 p4, 0x1

    const/4 p6, 0x0

    if-lez p5, :cond_4

    iget p5, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    if-ne p5, p4, :cond_0

    move p5, p4

    goto :goto_0

    :cond_0
    move p5, p6

    :goto_0
    if-eqz p5, :cond_1

    goto :goto_2

    :cond_1
    iget-object p5, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ئ:Landroid/view/ViewPropertyAnimator;

    if-eqz p5, :cond_2

    invoke-virtual {p5}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p2}, Landroid/view/View;->clearAnimation()V

    :cond_2
    iput p4, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    invoke-virtual {p3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-nez p4, :cond_3

    iget p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؤ:I

    add-int/lit8 v2, p1, 0x0

    iget p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ء:I

    int-to-long v3, p1

    iget-object v5, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->أ:Landroid/animation/TimeInterpolator;

    move-object v0, p0

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->؋(Landroid/view/View;IJLandroid/animation/TimeInterpolator;)V

    goto :goto_2

    :cond_3
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw p1

    :cond_4
    if-gez p5, :cond_9

    iget p5, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    const/4 p7, 0x2

    if-ne p5, p7, :cond_5

    goto :goto_1

    :cond_5
    move p4, p6

    :goto_1
    if-eqz p4, :cond_6

    goto :goto_2

    :cond_6
    iget-object p4, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ئ:Landroid/view/ViewPropertyAnimator;

    if-eqz p4, :cond_7

    invoke-virtual {p4}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p2}, Landroid/view/View;->clearAnimation()V

    :cond_7
    iput p7, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->إ:I

    invoke-virtual {p3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-nez p4, :cond_8

    iget p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ؠ:I

    int-to-long p6, p1

    iget-object p8, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->آ:Landroid/animation/TimeInterpolator;

    const/4 p5, 0x0

    move-object p3, p0

    move-object p4, p2

    invoke-virtual/range {p3 .. p8}, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->؋(Landroid/view/View;IJLandroid/animation/TimeInterpolator;)V

    goto :goto_2

    :cond_8
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw p1

    :cond_9
    :goto_2
    return-void
.end method

.method public onStartNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    const/4 p1, 0x2

    if-ne p5, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final ؋(Landroid/view/View;IJLandroid/animation/TimeInterpolator;)V
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lفؐ٣ڮڂ/؋;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p0}, Lفؐ٣ڮڂ/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->ئ:Landroid/view/ViewPropertyAnimator;

    return-void
.end method
