.class public final Lنٍصے/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:F

.field public final ؠ:F

.field public final ء:Ljava/util/ArrayList;

.field public آ:Lنٍصے/ة;

.field public أ:Lنٍصے/ة;

.field public ؤ:I

.field public إ:I

.field public ئ:F

.field public ا:I


# direct methods
.method public constructor <init>(FF)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lنٍصے/ب;->ء:Ljava/util/ArrayList;

    const/4 v0, -0x1

    iput v0, p0, Lنٍصے/ب;->ؤ:I

    iput v0, p0, Lنٍصے/ب;->إ:I

    const/4 v1, 0x0

    iput v1, p0, Lنٍصے/ب;->ئ:F

    iput v0, p0, Lنٍصے/ب;->ا:I

    iput p1, p0, Lنٍصے/ب;->؋:F

    iput p2, p0, Lنٍصے/ب;->ؠ:F

    return-void
.end method


# virtual methods
.method public final ؋(FFFZZ)V
    .locals 8

    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, p3, v0

    sub-float v1, p1, v0

    add-float/2addr v0, p1

    iget v2, p0, Lنٍصے/ب;->ؠ:F

    cmpl-float v3, v0, v2

    if-lez v3, :cond_0

    sub-float v1, v0, p3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    cmpg-float v2, v1, v0

    if-gez v2, :cond_1

    add-float v2, v1, p3

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    sub-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    :cond_1
    :goto_0
    move v7, v0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v7}, Lنٍصے/ب;->ؠ(FFFZZF)V

    return-void
.end method

.method public final ؠ(FFFZZF)V
    .locals 12

    move-object v0, p0

    move v8, p3

    const/4 v1, 0x0

    cmpg-float v1, v8, v1

    if-gtz v1, :cond_0

    return-void

    :cond_0
    iget-object v9, v0, Lنٍصے/ب;->ء:Ljava/util/ArrayList;

    const/4 v10, -0x1

    if-eqz p5, :cond_4

    if-nez p4, :cond_3

    iget v1, v0, Lنٍصے/ب;->ا:I

    if-eq v1, v10, :cond_2

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Anchor keylines must be either the first or last keyline."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    :goto_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, v0, Lنٍصے/ب;->ا:I

    goto :goto_1

    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Anchor keylines cannot be focal."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    :goto_1
    new-instance v11, Lنٍصے/ة;

    const/4 v2, 0x1

    move-object v1, v11

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-direct/range {v1 .. v7}, Lنٍصے/ة;-><init>(FFFFZF)V

    iget-object v1, v0, Lنٍصے/ب;->آ:Lنٍصے/ة;

    if-eqz p4, :cond_9

    if-nez v1, :cond_5

    iput-object v11, v0, Lنٍصے/ب;->آ:Lنٍصے/ة;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, v0, Lنٍصے/ب;->ؤ:I

    :cond_5
    iget v1, v0, Lنٍصے/ب;->إ:I

    if-eq v1, v10, :cond_7

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, v0, Lنٍصے/ب;->إ:I

    sub-int/2addr v1, v2

    const/4 v2, 0x1

    if-gt v1, v2, :cond_6

    goto :goto_2

    :cond_6
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines marked as focal must be placed next to each other. There cannot be non-focal keylines between focal keylines."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7
    :goto_2
    iget-object v1, v0, Lنٍصے/ب;->آ:Lنٍصے/ة;

    iget v1, v1, Lنٍصے/ة;->آ:F

    cmpl-float v1, v8, v1

    if-nez v1, :cond_8

    iput-object v11, v0, Lنٍصے/ب;->أ:Lنٍصے/ة;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, v0, Lنٍصے/ب;->إ:I

    goto :goto_4

    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines that are marked as focal must all have the same masked item size."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    if-nez v1, :cond_b

    iget v1, v0, Lنٍصے/ب;->ئ:F

    cmpg-float v1, v8, v1

    if-ltz v1, :cond_a

    goto :goto_3

    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines before the first focal keyline must be ordered by incrementing masked item size."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_b
    :goto_3
    iget-object v1, v0, Lنٍصے/ب;->أ:Lنٍصے/ة;

    if-eqz v1, :cond_d

    iget v1, v0, Lنٍصے/ب;->ئ:F

    cmpl-float v1, v8, v1

    if-gtz v1, :cond_c

    goto :goto_4

    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines after the last focal keyline must be ordered by decreasing masked item size."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_d
    :goto_4
    iput v8, v0, Lنٍصے/ب;->ئ:F

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final ء(FFFIZ)V
    .locals 8

    if-lez p4, :cond_1

    const/4 v0, 0x0

    cmpg-float v0, p3, v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p4, :cond_1

    int-to-float v1, v0

    mul-float/2addr v1, p3

    add-float v3, v1, p1

    const/4 v7, 0x0

    move-object v2, p0

    move v4, p2

    move v5, p3

    move v6, p5

    invoke-virtual/range {v2 .. v7}, Lنٍصے/ب;->؋(FFFZZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public final آ()Lنٍصے/ت;
    .locals 12

    iget-object v0, p0, Lنٍصے/ب;->آ:Lنٍصے/ة;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lنٍصے/ب;->ء:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget v4, p0, Lنٍصے/ب;->؋:F

    if-ge v1, v3, :cond_0

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lنٍصے/ة;

    new-instance v3, Lنٍصے/ة;

    iget-object v5, p0, Lنٍصے/ب;->آ:Lنٍصے/ة;

    iget v5, v5, Lنٍصے/ة;->ؠ:F

    iget v6, p0, Lنٍصے/ب;->ؤ:I

    int-to-float v6, v6

    mul-float/2addr v6, v4

    sub-float/2addr v5, v6

    int-to-float v6, v1

    mul-float/2addr v6, v4

    add-float/2addr v6, v5

    iget v7, v2, Lنٍصے/ة;->ؠ:F

    iget v8, v2, Lنٍصے/ة;->ء:F

    iget v9, v2, Lنٍصے/ة;->آ:F

    iget-boolean v10, v2, Lنٍصے/ة;->أ:Z

    iget v11, v2, Lنٍصے/ة;->ؤ:F

    move-object v5, v3

    invoke-direct/range {v5 .. v11}, Lنٍصے/ة;-><init>(FFFFZF)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Lنٍصے/ت;

    iget v2, p0, Lنٍصے/ب;->ؤ:I

    iget v3, p0, Lنٍصے/ب;->إ:I

    invoke-direct {v1, v4, v0, v2, v3}, Lنٍصے/ت;-><init>(FLjava/util/ArrayList;II)V

    return-object v1

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "There must be a keyline marked as focal."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
