.class public Lcom/google/android/material/snackbar/BaseTransientBottomBar$Behavior;
.super Lcom/google/android/material/behavior/SwipeDismissBehavior;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/material/behavior/SwipeDismissBehavior<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public final ا:Lٿةڥۣ٠ؕآڏ/ؠ;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/material/behavior/SwipeDismissBehavior;-><init>()V

    new-instance v0, Lٿةڥۣ٠ؕآڏ/ؠ;

    invoke-direct {v0, p0}, Lٿةڥۣ٠ؕآڏ/ؠ;-><init>(Lcom/google/android/material/behavior/SwipeDismissBehavior;)V

    iput-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$Behavior;->ا:Lٿةڥۣ٠ؕآڏ/ؠ;

    return-void
.end method


# virtual methods
.method public final onInterceptTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$Behavior;->ا:Lٿةڥۣ٠ؕآڏ/ؠ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    if-nez v0, :cond_1

    new-instance v0, Lژة۪ڦضۆۿۡ/ص;

    invoke-direct {v0, v1}, Lژة۪ڦضۆۿۡ/ص;-><init>(I)V

    sput-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    :cond_1
    sget-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    iget-object v2, v0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1, p2, v0, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    if-nez v0, :cond_3

    new-instance v0, Lژة۪ڦضۆۿۡ/ص;

    invoke-direct {v0, v1}, Lژة۪ڦضۆۿۡ/ص;-><init>(I)V

    sput-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    :cond_3
    sget-object v0, Lژة۪ڦضۆۿۡ/ص;->ؤ:Lژة۪ڦضۆۿۡ/ص;

    iget-object v1, v0, Lژة۪ڦضۆۿۡ/ص;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ص;->ء:Ljava/io/Serializable;

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    monitor-exit v1

    goto :goto_0

    :catchall_1
    move-exception p1

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :cond_4
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->onInterceptTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final ؋(Landroid/view/View;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/snackbar/BaseTransientBottomBar$Behavior;->ا:Lٿةڥۣ٠ؕآڏ/ؠ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p1, p1, Lٿةڥۣ٠ؕآڏ/آ;

    return p1
.end method
