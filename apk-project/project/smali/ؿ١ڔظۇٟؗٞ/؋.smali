.class public abstract Lؿ١ڔظۇٟؗٞ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Landroid/view/animation/LinearInterpolator;

.field public static final ؠ:Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

.field public static final ء:Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;

.field public static final آ:Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    sput-object v0, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    new-instance v0, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    invoke-direct {v0}, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;-><init>()V

    sput-object v0, Lؿ١ڔظۇٟؗٞ/؋;->ؠ:Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    new-instance v0, Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;

    invoke-direct {v0}, Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;-><init>()V

    sput-object v0, Lؿ١ڔظۇٟؗٞ/؋;->ء:Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;

    new-instance v0, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    invoke-direct {v0}, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;-><init>()V

    sput-object v0, Lؿ١ڔظۇٟؗٞ/؋;->آ:Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    return-void
.end method

.method public static ؋(FFFFF)F
    .locals 1

    cmpg-float v0, p4, p2

    if-gtz v0, :cond_0

    return p0

    :cond_0
    cmpl-float v0, p4, p3

    if-ltz v0, :cond_1

    return p1

    :cond_1
    sub-float/2addr p4, p2

    sub-float/2addr p3, p2

    div-float/2addr p4, p3

    invoke-static {p1, p0, p4, p0}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result p0

    return p0
.end method
