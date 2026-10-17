.class public abstract Lڟەطڽٲ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ؋:Landroid/widget/FrameLayout;

.field public static ؠ:Landroid/view/WindowManager;

.field public static final ء:Landroid/os/Handler;

.field public static آ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;

    const/4 v0, 0x0

    sput-boolean v0, Lڟەطڽٲ/ؠ;->آ:Z

    return-void
.end method

.method public static ؋()V
    .locals 2

    :try_start_0
    sget-object v0, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    sget-object v1, Lڟەطڽٲ/ؠ;->ؠ:Landroid/view/WindowManager;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    sput-boolean v0, Lڟەطڽٲ/ؠ;->آ:Z

    return-void
.end method

.method public static ؠ(Landroid/content/Context;I)I
    .locals 0

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static ء(Landroid/content/Context;)V
    .locals 3

    sget-boolean v0, Lڟەطڽٲ/ؠ;->آ:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ؤ;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
