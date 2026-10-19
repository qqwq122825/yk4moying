.class public abstract Lـ۰صںڱیؕ/آ;
.super Lـ۰صںڱیؕ/ؤ;
.source "SourceFile"


# instance fields
.field public ء:Z

.field public آ:I

.field public أ:I

.field public ؤ:I

.field public إ:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lـ۰صںڱیؕ/ؤ;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lـ۰صںڱیؕ/آ;->آ:I

    iput v0, p0, Lـ۰صںڱیؕ/آ;->ؤ:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lـ۰صںڱیؕ/ؤ;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    iput p1, p0, Lـ۰صںڱیؕ/آ;->آ:I

    iput p1, p0, Lـ۰صںڱیؕ/آ;->ؤ:I

    return-void
.end method


# virtual methods
.method public final onInterceptTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    iget v0, p0, Lـ۰صںڱیؕ/آ;->ؤ:I

    if-gez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lـ۰صںڱیؕ/آ;->ؤ:I

    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ne v0, v1, :cond_3

    iget-boolean v0, p0, Lـ۰صںڱیؕ/آ;->ء:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lـ۰صںڱیؕ/آ;->آ:I

    if-ne v0, v3, :cond_1

    return v4

    :cond_1
    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-ne v0, v3, :cond_2

    return v4

    :cond_2
    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lـ۰صںڱیؕ/آ;->أ:I

    sub-int v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v5, p0, Lـ۰صںڱیؕ/آ;->ؤ:I

    if-le v1, v5, :cond_3

    iput v0, p0, Lـ۰صںڱیؕ/آ;->أ:I

    return v2

    :cond_3
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_7

    iput v3, p0, Lـ۰صںڱیؕ/آ;->آ:I

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    move-object v5, p0

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    iget-object v5, v5, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->ا:Ljava/lang/ref/WeakReference;

    if-eqz v5, :cond_5

    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-virtual {v5, v3}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_0

    :cond_4
    move v3, v4

    goto :goto_1

    :cond_5
    :goto_0
    move v3, v2

    :goto_1
    if-eqz v3, :cond_6

    invoke-virtual {p1, p2, v0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_2

    :cond_6
    move v2, v4

    :goto_2
    iput-boolean v2, p0, Lـ۰صںڱیؕ/آ;->ء:Z

    if-eqz v2, :cond_7

    iput v1, p0, Lـ۰صںڱیؕ/آ;->أ:I

    invoke-virtual {p3, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lـ۰صںڱیؕ/آ;->آ:I

    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    if-nez p1, :cond_7

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p1

    iput-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    :cond_7
    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_8

    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_8
    return v4
.end method

.method public final onTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p1, v2, :cond_4

    const/4 v4, 0x2

    if-eq p1, v4, :cond_2

    const/4 p2, 0x3

    if-eq p1, p2, :cond_5

    const/4 p2, 0x6

    if-eq p1, p2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    if-nez p1, :cond_1

    move p1, v2

    goto :goto_0

    :cond_1
    move p1, v3

    :goto_0
    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p2

    iput p2, p0, Lـ۰صںڱیؕ/آ;->آ:I

    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    const/high16 p2, 0x3f000000    # 0.5f

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lـ۰صںڱیؕ/آ;->أ:I

    goto :goto_1

    :cond_2
    iget p1, p0, Lـ۰صںڱیؕ/آ;->آ:I

    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result p1

    if-ne p1, v0, :cond_3

    return v3

    :cond_3
    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lـ۰صںڱیؕ/آ;->أ:I

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v1

    :cond_4
    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    if-nez p1, :cond_9

    :cond_5
    iput-boolean v3, p0, Lـ۰صںڱیؕ/آ;->ء:Z

    iput v0, p0, Lـ۰صںڱیؕ/آ;->آ:I

    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    :cond_6
    :goto_1
    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_7

    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_7
    iget-boolean p1, p0, Lـ۰صںڱیؕ/آ;->ء:Z

    if-nez p1, :cond_8

    move v2, v3

    :cond_8
    return v2

    :cond_9
    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    const/16 p3, 0x3e8

    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object p1, p0, Lـ۰صںڱیؕ/آ;->إ:Landroid/view/VelocityTracker;

    iget p3, p0, Lـ۰صںڱیؕ/آ;->آ:I

    invoke-virtual {p1, p3}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    invoke-static {p2}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v1
.end method
