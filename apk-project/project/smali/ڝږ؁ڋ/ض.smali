.class public final Lڝږ؁ڋ/ض;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic ؋:Landroid/widget/FrameLayout;

.field public final synthetic ؠ:Z

.field public final synthetic ء:Ljava/lang/StringBuilder;

.field public final synthetic آ:Ljava/util/List;

.field public final synthetic أ:Landroid/widget/LinearLayout;

.field public final synthetic ؤ:Lڝږ؁ڋ/ظ;


# direct methods
.method public constructor <init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZLjava/lang/StringBuilder;Ljava/util/ArrayList;Landroid/widget/LinearLayout;)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/ض;->ؤ:Lڝږ؁ڋ/ظ;

    iput-object p2, p0, Lڝږ؁ڋ/ض;->؋:Landroid/widget/FrameLayout;

    iput-boolean p3, p0, Lڝږ؁ڋ/ض;->ؠ:Z

    iput-object p4, p0, Lڝږ؁ڋ/ض;->ء:Ljava/lang/StringBuilder;

    iput-object p5, p0, Lڝږ؁ڋ/ض;->آ:Ljava/util/List;

    iput-object p6, p0, Lڝږ؁ڋ/ض;->أ:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lڝږ؁ڋ/ض;->؋:Landroid/widget/FrameLayout;

    invoke-static {p1}, Lڝږ؁ڋ/ظ;->؋(Landroid/widget/FrameLayout;)V

    iget-boolean v0, p0, Lڝږ؁ڋ/ض;->ؠ:Z

    invoke-static {v0, p1}, Lڝږ؁ڋ/ظ;->ؠ(ZLandroid/widget/FrameLayout;)V

    iget-object p1, p0, Lڝږ؁ڋ/ض;->ؤ:Lڝږ؁ڋ/ظ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lڝږ؁ڋ/ض;->ء:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lڝږ؁ڋ/ض;->آ:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v0, v2

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lڝږ؁ڋ/ض;->أ:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    const-wide/16 v4, 0x96

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    new-instance v4, Lحظتۢۋۜآظ/ا;

    const/4 v5, 0x4

    invoke-direct {v4, v1, v0, v2, v5}, Lحظتۢۋۜآظ/ا;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;I)V

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[PIN] Backspace | Buffer: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "LockOverlay"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return p2
.end method
