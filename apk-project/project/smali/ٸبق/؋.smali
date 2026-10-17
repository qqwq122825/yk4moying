.class public final Lٸبق/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؤ:I


# instance fields
.field public final ؋:Z

.field public final ؠ:I

.field public final ء:I

.field public final آ:I

.field public final أ:F


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-wide v0, 0x4014666666666667L    # 5.1000000000000005

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lٸبق/؋;->ؤ:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    const v0, 0x7f0301a2

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lٹۧ٥ؐح/ؠ;->ؠ(Landroid/content/Context;IZ)Z

    move-result v0

    const v2, 0x7f0301a1

    invoke-static {p1, v2, v1}, Lٳَاڂ/؋;->ؠ(Landroid/content/Context;II)I

    move-result v2

    const v3, 0x7f0301a0

    invoke-static {p1, v3, v1}, Lٳَاڂ/؋;->ؠ(Landroid/content/Context;II)I

    move-result v3

    const v4, 0x7f030123

    invoke-static {p1, v4, v1}, Lٳَاڂ/؋;->ؠ(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lٸبق/؋;->؋:Z

    iput v2, p0, Lٸبق/؋;->ؠ:I

    iput v3, p0, Lٸبق/؋;->ء:I

    iput v1, p0, Lٸبق/؋;->آ:I

    iput p1, p0, Lٸبق/؋;->أ:F

    return-void
.end method
