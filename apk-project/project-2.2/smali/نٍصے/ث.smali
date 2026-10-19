.class public final Lنٍصے/ث;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lنٍصے/ت;

.field public final ؠ:Ljava/util/List;

.field public final ء:Ljava/util/List;

.field public final آ:[F

.field public final أ:[F

.field public final ؤ:F

.field public final إ:F


# direct methods
.method public constructor <init>(Lنٍصے/ت;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lنٍصے/ث;->؋:Lنٍصے/ت;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lنٍصے/ث;->ؠ:Ljava/util/List;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lنٍصے/ث;->ء:Ljava/util/List;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lنٍصے/ت;

    invoke-virtual {v0}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v0

    iget v0, v0, Lنٍصے/ة;->؋:F

    invoke-virtual {p1}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v2

    iget v2, v2, Lنٍصے/ة;->؋:F

    sub-float/2addr v0, v2

    iput v0, p0, Lنٍصے/ث;->ؤ:F

    invoke-virtual {p1}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object p1

    iget p1, p1, Lنٍصے/ة;->؋:F

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lنٍصے/ت;

    invoke-virtual {v2}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v2

    iget v2, v2, Lنٍصے/ة;->؋:F

    sub-float/2addr p1, v2

    iput p1, p0, Lنٍصے/ث;->إ:F

    invoke-static {v0, p2, v1}, Lنٍصے/ث;->ؠ(FLjava/util/ArrayList;Z)[F

    move-result-object p2

    iput-object p2, p0, Lنٍصے/ث;->آ:[F

    const/4 p2, 0x0

    invoke-static {p1, p3, p2}, Lنٍصے/ث;->ؠ(FLjava/util/ArrayList;Z)[F

    move-result-object p1

    iput-object p1, p0, Lنٍصے/ث;->أ:[F

    return-void
.end method

.method public static ؠ(FLjava/util/ArrayList;Z)[F
    .locals 6

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v1, v0, [F

    const/4 v2, 0x1

    :goto_0
    if-ge v2, v0, :cond_2

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lنٍصے/ت;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lنٍصے/ت;

    if-eqz p2, :cond_0

    invoke-virtual {v5}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v5

    iget v5, v5, Lنٍصے/ة;->؋:F

    invoke-virtual {v4}, Lنٍصے/ت;->ؠ()Lنٍصے/ة;

    move-result-object v4

    iget v4, v4, Lنٍصے/ة;->؋:F

    sub-float/2addr v5, v4

    goto :goto_1

    :cond_0
    invoke-virtual {v4}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v4

    iget v4, v4, Lنٍصے/ة;->؋:F

    invoke-virtual {v5}, Lنٍصے/ت;->آ()Lنٍصے/ة;

    move-result-object v5

    iget v5, v5, Lنٍصے/ة;->؋:F

    sub-float v5, v4, v5

    :goto_1
    div-float/2addr v5, p0

    add-int/lit8 v4, v0, -0x1

    if-ne v2, v4, :cond_1

    const/high16 v3, 0x3f800000    # 1.0f

    goto :goto_2

    :cond_1
    aget v3, v1, v3

    add-float/2addr v3, v5

    :goto_2
    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public static ء(Lنٍصے/ت;IIFIIF)Lنٍصے/ت;
    .locals 8

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lنٍصے/ة;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    new-instance p1, Lنٍصے/ب;

    iget p0, p0, Lنٍصے/ت;->؋:F

    invoke-direct {p1, p0, p6}, Lنٍصے/ب;-><init>(FF)V

    const/4 p0, 0x0

    move p2, p0

    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p6

    if-ge p2, p6, :cond_1

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lنٍصے/ة;

    iget v4, p6, Lنٍصے/ة;->آ:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v4, v1

    add-float v2, v1, p3

    if-lt p2, p4, :cond_0

    if-gt p2, p5, :cond_0

    const/4 v1, 0x1

    move v5, v1

    goto :goto_1

    :cond_0
    move v5, p0

    :goto_1
    iget v3, p6, Lنٍصے/ة;->ء:F

    iget-boolean v6, p6, Lنٍصے/ة;->أ:Z

    iget v7, p6, Lنٍصے/ة;->ؤ:F

    move-object v1, p1

    invoke-virtual/range {v1 .. v7}, Lنٍصے/ب;->ؠ(FFFZZF)V

    iget p6, p6, Lنٍصے/ة;->آ:F

    add-float/2addr p3, p6

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lنٍصے/ب;->آ()Lنٍصے/ت;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final ؋(FFF)Lنٍصے/ت;
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    iget v4, v0, Lنٍصے/ث;->ؤ:F

    add-float/2addr v4, v2

    iget v5, v0, Lنٍصے/ث;->إ:F

    sub-float v5, v3, v5

    cmpg-float v6, v1, v4

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    if-gez v6, :cond_0

    invoke-static {v8, v7, v2, v4, v1}, Lؿ١ڔظۇٟؗٞ/؋;->؋(FFFFF)F

    move-result v1

    iget-object v2, v0, Lنٍصے/ث;->ؠ:Ljava/util/List;

    iget-object v3, v0, Lنٍصے/ث;->آ:[F

    goto :goto_0

    :cond_0
    cmpl-float v2, v1, v5

    if-lez v2, :cond_6

    invoke-static {v7, v8, v5, v3, v1}, Lؿ١ڔظۇٟؗٞ/؋;->؋(FFFFF)F

    move-result v1

    iget-object v2, v0, Lنٍصے/ث;->ء:Ljava/util/List;

    iget-object v3, v0, Lنٍصے/ث;->أ:[F

    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x0

    aget v6, v3, v5

    const/4 v9, 0x1

    move v10, v9

    :goto_1
    const/4 v11, 0x2

    const/4 v12, 0x3

    if-ge v10, v4, :cond_2

    aget v13, v3, v10

    cmpg-float v14, v1, v13

    if-gtz v14, :cond_1

    add-int/lit8 v3, v10, -0x1

    invoke-static {v7, v8, v6, v13, v1}, Lؿ١ڔظۇٟؗٞ/؋;->؋(FFFFF)F

    move-result v1

    new-array v4, v12, [F

    aput v1, v4, v5

    int-to-float v1, v3

    aput v1, v4, v9

    int-to-float v1, v10

    aput v1, v4, v11

    goto :goto_2

    :cond_1
    add-int/lit8 v10, v10, 0x1

    move v6, v13

    goto :goto_1

    :cond_2
    new-array v4, v12, [F

    fill-array-data v4, :array_0

    :goto_2
    aget v1, v4, v9

    float-to-int v1, v1

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lنٍصے/ت;

    aget v3, v4, v11

    float-to-int v3, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lنٍصے/ت;

    aget v3, v4, v5

    iget v4, v1, Lنٍصے/ت;->؋:F

    iget v6, v2, Lنٍصے/ت;->؋:F

    cmpl-float v4, v4, v6

    if-nez v4, :cond_5

    iget-object v4, v1, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    iget-object v7, v2, Lنٍصے/ت;->ؠ:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ne v6, v8, :cond_4

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :goto_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_3

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lنٍصے/ة;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lنٍصے/ة;

    new-instance v15, Lنٍصے/ة;

    iget v10, v8, Lنٍصے/ة;->؋:F

    iget v11, v9, Lنٍصے/ة;->؋:F

    sget-object v12, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    invoke-static {v11, v10, v3, v10}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result v11

    iget v10, v9, Lنٍصے/ة;->ؠ:F

    iget v12, v8, Lنٍصے/ة;->ؠ:F

    invoke-static {v10, v12, v3, v12}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result v12

    iget v10, v9, Lنٍصے/ة;->ء:F

    iget v13, v8, Lنٍصے/ة;->ء:F

    invoke-static {v10, v13, v3, v13}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result v13

    iget v9, v9, Lنٍصے/ة;->آ:F

    iget v8, v8, Lنٍصے/ة;->آ:F

    invoke-static {v9, v8, v3, v8}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result v14

    const/4 v8, 0x0

    const/16 v16, 0x0

    move-object v10, v15

    move-object v9, v15

    move v15, v8

    invoke-direct/range {v10 .. v16}, Lنٍصے/ة;-><init>(FFFFZF)V

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_3
    sget-object v4, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    iget v4, v2, Lنٍصے/ت;->ء:I

    iget v5, v1, Lنٍصے/ت;->ء:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    mul-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    add-int/2addr v4, v5

    iget v2, v2, Lنٍصے/ت;->آ:I

    iget v5, v1, Lنٍصے/ت;->آ:I

    sub-int/2addr v2, v5

    int-to-float v2, v2

    mul-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int/2addr v2, v5

    new-instance v3, Lنٍصے/ت;

    iget v1, v1, Lنٍصے/ت;->؋:F

    invoke-direct {v3, v1, v6, v4, v2}, Lنٍصے/ت;-><init>(FLjava/util/ArrayList;II)V

    goto :goto_4

    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines being linearly interpolated must have the same number of keylines."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keylines being linearly interpolated must have the same item size."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6
    iget-object v3, v0, Lنٍصے/ث;->؋:Lنٍصے/ت;

    :goto_4
    return-object v3

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method
