.class public final Lٽچڃ/ز;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public ؋:F

.field public ؠ:F

.field public ء:F

.field public آ:F

.field public أ:F

.field public ؤ:F

.field public final إ:Ljava/util/ArrayList;

.field public final ئ:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lٽچڃ/ز;->إ:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lٽچڃ/ز;->ئ:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/high16 v1, 0x43870000    # 270.0f

    invoke-virtual {p0, v0, v1, v0}, Lٽچڃ/ز;->آ(FFF)V

    return-void
.end method


# virtual methods
.method public final ؋(F)V
    .locals 4

    iget v0, p0, Lٽچڃ/ز;->أ:F

    cmpl-float v1, v0, p1

    if-nez v1, :cond_0

    return-void

    :cond_0
    sub-float v0, p1, v0

    const/high16 v1, 0x43b40000    # 360.0f

    add-float/2addr v0, v1

    rem-float/2addr v0, v1

    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    return-void

    :cond_1
    new-instance v1, Lٽچڃ/خ;

    iget v2, p0, Lٽچڃ/ز;->ء:F

    iget v3, p0, Lٽچڃ/ز;->آ:F

    invoke-direct {v1, v2, v3, v2, v3}, Lٽچڃ/خ;-><init>(FFFF)V

    iget v2, p0, Lٽچڃ/ز;->أ:F

    iput v2, v1, Lٽچڃ/خ;->ؤ:F

    iput v0, v1, Lٽچڃ/خ;->إ:F

    iget-object v0, p0, Lٽچڃ/ز;->ئ:Ljava/util/ArrayList;

    new-instance v2, Lٽچڃ/ج;

    invoke-direct {v2, v1}, Lٽچڃ/ج;-><init>(Lٽچڃ/خ;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput p1, p0, Lٽچڃ/ز;->أ:F

    return-void
.end method

.method public final ؠ(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .locals 4

    iget-object v0, p0, Lٽچڃ/ز;->إ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lٽچڃ/ذ;

    invoke-virtual {v3, p1, p2}, Lٽچڃ/ذ;->؋(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final ء(FF)V
    .locals 4

    new-instance v0, Lٽچڃ/د;

    invoke-direct {v0}, Lٽچڃ/د;-><init>()V

    iput p1, v0, Lٽچڃ/د;->ؠ:F

    iput p2, v0, Lٽچڃ/د;->ء:F

    iget-object v1, p0, Lٽچڃ/ز;->إ:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lٽچڃ/ح;

    iget v2, p0, Lٽچڃ/ز;->ء:F

    iget v3, p0, Lٽچڃ/ز;->آ:F

    invoke-direct {v1, v0, v2, v3}, Lٽچڃ/ح;-><init>(Lٽچڃ/د;FF)V

    invoke-virtual {v1}, Lٽچڃ/ح;->ؠ()F

    move-result v0

    const/high16 v2, 0x43870000    # 270.0f

    add-float/2addr v0, v2

    invoke-virtual {v1}, Lٽچڃ/ح;->ؠ()F

    move-result v3

    add-float/2addr v3, v2

    invoke-virtual {p0, v0}, Lٽچڃ/ز;->؋(F)V

    iget-object v0, p0, Lٽچڃ/ز;->ئ:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput v3, p0, Lٽچڃ/ز;->أ:F

    iput p1, p0, Lٽچڃ/ز;->ء:F

    iput p2, p0, Lٽچڃ/ز;->آ:F

    return-void
.end method

.method public final آ(FFF)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lٽچڃ/ز;->؋:F

    iput p1, p0, Lٽچڃ/ز;->ؠ:F

    iput v0, p0, Lٽچڃ/ز;->ء:F

    iput p1, p0, Lٽچڃ/ز;->آ:F

    iput p2, p0, Lٽچڃ/ز;->أ:F

    add-float/2addr p2, p3

    const/high16 p1, 0x43b40000    # 360.0f

    rem-float/2addr p2, p1

    iput p2, p0, Lٽچڃ/ز;->ؤ:F

    iget-object p1, p0, Lٽچڃ/ز;->إ:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lٽچڃ/ز;->ئ:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
