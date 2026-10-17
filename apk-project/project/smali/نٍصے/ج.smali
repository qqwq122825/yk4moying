.class public final Lنٍصے/ج;
.super Lڃٷښـ۝ۼ/ؠ;
.source "SourceFile"


# static fields
.field public static final خ:[I

.field public static final د:[I


# instance fields
.field public ح:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x1

    filled-new-array {v0}, [I

    move-result-object v1

    sput-object v1, Lنٍصے/ج;->خ:[I

    const/4 v1, 0x0

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lنٍصے/ج;->د:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lڃٷښـ۝ۼ/ؠ;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lنٍصے/ج;->ح:I

    return-void
.end method


# virtual methods
.method public final د(Lنٍصے/ؠ;Landroid/view/View;)Lنٍصے/ت;
    .locals 27

    move-object/from16 v0, p1

    check-cast v0, Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v1

    int-to-float v1, v1

    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج()Z

    move-result v5

    if-eqz v5, :cond_1

    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v3, v2

    int-to-float v3, v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    int-to-float v4, v2

    :cond_1
    move v11, v3

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0600f2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    add-float v12, v2, v11

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f0600f1

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    add-float v13, v2, v11

    add-float v2, v4, v11

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v14

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v4, v2

    add-float/2addr v4, v11

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    add-float/2addr v2, v11

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v3, v11

    invoke-static {v4, v2, v3}, Landroidx/core/math/MathUtils;->clamp(FFF)F

    move-result v15

    add-float v2, v14, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v17, v2, v16

    sget-object v2, Lنٍصے/ج;->خ:[I

    mul-float v3, v12, v16

    cmpg-float v3, v1, v3

    const/16 v18, 0x0

    if-gez v3, :cond_2

    filled-new-array/range {v18 .. v18}, [I

    move-result-object v2

    :cond_2
    sget-object v3, Lنٍصے/ج;->د:[I

    iget v4, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج:I

    const/4 v10, 0x1

    if-ne v4, v10, :cond_5

    array-length v4, v2

    new-array v5, v4, [I

    move/from16 v6, v18

    :goto_0
    const/4 v7, 0x2

    if-ge v6, v4, :cond_3

    aget v8, v2, v6

    mul-int/2addr v8, v7

    aput v8, v5, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    new-array v2, v7, [I

    move/from16 v4, v18

    :goto_1
    if-ge v4, v7, :cond_4

    aget v6, v3, v4

    mul-int/2addr v6, v7

    aput v6, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_4
    move-object v8, v2

    move-object v6, v5

    goto :goto_2

    :cond_5
    move-object v6, v2

    move-object v8, v3

    :goto_2
    array-length v2, v8

    const/high16 v3, -0x80000000

    move v5, v3

    move/from16 v4, v18

    :goto_3
    if-ge v4, v2, :cond_7

    aget v7, v8, v4

    if-le v7, v5, :cond_6

    move v5, v7

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_7
    int-to-float v2, v5

    mul-float v2, v2, v17

    sub-float v2, v1, v2

    array-length v4, v6

    move/from16 v5, v18

    :goto_4
    if-ge v5, v4, :cond_9

    aget v7, v6, v5

    if-le v7, v3, :cond_8

    move v3, v7

    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_9
    int-to-float v3, v3

    mul-float/2addr v3, v13

    sub-float/2addr v2, v3

    div-float/2addr v2, v14

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    double-to-int v2, v2

    div-float v3, v1, v14

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    sub-int v2, v3, v2

    add-int/2addr v2, v10

    new-array v9, v2, [I

    move/from16 v4, v18

    :goto_5
    if-ge v4, v2, :cond_a

    sub-int v5, v3, v4

    aput v5, v9, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_a
    move v2, v1

    move v3, v15

    move v4, v12

    move v5, v13

    move/from16 v7, v17

    move-object/from16 v19, v9

    move v9, v14

    move/from16 v20, v11

    move v11, v10

    move-object/from16 v10, v19

    invoke-static/range {v2 .. v10}, Lنٍصے/؋;->؋(FFFF[IF[IF[I)Lنٍصے/؋;

    move-result-object v2

    iget v3, v2, Lنٍصے/؋;->ء:I

    iget v4, v2, Lنٍصے/؋;->آ:I

    add-int/2addr v3, v4

    iget v4, v2, Lنٍصے/؋;->إ:I

    add-int/2addr v3, v4

    move-object/from16 v10, p0

    iput v3, v10, Lنٍصے/ج;->ح:I

    invoke-interface/range {p1 .. p1}, Lنٍصے/ؠ;->getItemCount()I

    move-result v3

    iget v4, v2, Lنٍصے/؋;->ء:I

    iget v5, v2, Lنٍصے/؋;->آ:I

    add-int v6, v4, v5

    iget v7, v2, Lنٍصے/؋;->إ:I

    add-int/2addr v6, v7

    sub-int/2addr v6, v3

    if-lez v6, :cond_c

    if-gtz v4, :cond_b

    if-le v5, v11, :cond_c

    :cond_b
    move/from16 v18, v11

    :cond_c
    :goto_6
    if-lez v6, :cond_f

    iget v3, v2, Lنٍصے/؋;->ء:I

    if-lez v3, :cond_d

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lنٍصے/؋;->ء:I

    goto :goto_7

    :cond_d
    iget v3, v2, Lنٍصے/؋;->آ:I

    if-le v3, v11, :cond_e

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lنٍصے/؋;->آ:I

    :cond_e
    :goto_7
    add-int/lit8 v6, v6, -0x1

    goto :goto_6

    :cond_f
    if-eqz v18, :cond_10

    iget v3, v2, Lنٍصے/؋;->ء:I

    filled-new-array {v3}, [I

    move-result-object v6

    iget v2, v2, Lنٍصے/؋;->آ:I

    filled-new-array {v2}, [I

    move-result-object v8

    filled-new-array {v7}, [I

    move-result-object v18

    move v2, v1

    move v3, v15

    move v4, v12

    move v5, v13

    move/from16 v7, v17

    move v9, v14

    move-object/from16 v10, v18

    invoke-static/range {v2 .. v10}, Lنٍصے/؋;->؋(FFFF[IF[IF[I)Lنٍصے/؋;

    move-result-object v2

    :cond_10
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v0, v0, Lcom/google/android/material/carousel/CarouselLayoutManager;->ج:I

    const v4, 0x7f0600ef

    const/4 v5, 0x0

    if-ne v0, v11, :cond_15

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    add-float v0, v0, v20

    iget v3, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    div-float v3, v0, v16

    sub-float v7, v5, v3

    iget v4, v2, Lنٍصے/؋;->ؠ:F

    iget v6, v2, Lنٍصے/؋;->ء:I

    invoke-static {v5, v4, v6}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v4

    iget v6, v2, Lنٍصے/؋;->ؠ:F

    iget v8, v2, Lنٍصے/؋;->ء:I

    int-to-float v8, v8

    div-float v8, v8, v16

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    double-to-int v8, v8

    invoke-static {v4, v6, v8}, Lسۄھؤۏ۫/؋;->؋(FFI)F

    move-result v6

    iget v8, v2, Lنٍصے/؋;->ؠ:F

    iget v9, v2, Lنٍصے/؋;->ء:I

    invoke-static {v5, v6, v8, v9}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v8, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v8}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v14

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v8, v2, Lنٍصے/؋;->آ:I

    int-to-float v8, v8

    div-float v8, v8, v16

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    double-to-int v8, v8

    invoke-static {v14, v6, v8}, Lسۄھؤۏ۫/؋;->؋(FFI)F

    move-result v6

    iget v8, v2, Lنٍصے/؋;->أ:F

    iget v9, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v8, v9}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v6, v2, Lنٍصے/؋;->ؤ:F

    iget v8, v2, Lنٍصے/؋;->إ:I

    invoke-static {v5, v6, v8}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v15

    iget v6, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v15, v6, v8}, Lسۄھؤۏ۫/؋;->؋(FFI)F

    move-result v6

    iget v9, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v5, v6, v9, v8}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v8, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v8}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v13

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v8, v2, Lنٍصے/؋;->آ:I

    int-to-float v8, v8

    div-float v8, v8, v16

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v8, v8

    invoke-static {v13, v6, v8}, Lسۄھؤۏ۫/؋;->؋(FFI)F

    move-result v6

    iget v8, v2, Lنٍصے/؋;->أ:F

    iget v9, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v8, v9}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v6, v2, Lنٍصے/؋;->ؠ:F

    iget v8, v2, Lنٍصے/؋;->ء:I

    invoke-static {v5, v6, v8}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v5

    add-float/2addr v3, v1

    iget v6, v2, Lنٍصے/؋;->ؤ:F

    move/from16 v8, v20

    invoke-static {v0, v6, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v17

    iget v6, v2, Lنٍصے/؋;->ؠ:F

    iget v9, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v6, v9, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v18

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v9, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v6, v9, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v19

    new-instance v12, Lنٍصے/ب;

    iget v6, v2, Lنٍصے/؋;->ؤ:F

    invoke-direct {v12, v6, v1}, Lنٍصے/ب;-><init>(FF)V

    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object v6, v12

    move/from16 v8, v17

    move v9, v0

    invoke-virtual/range {v6 .. v11}, Lنٍصے/ب;->؋(FFFZZ)V

    iget v1, v2, Lنٍصے/؋;->ء:I

    if-lez v1, :cond_11

    iget v11, v2, Lنٍصے/؋;->ؠ:F

    int-to-float v1, v1

    div-float v1, v1, v16

    float-to-double v6, v1

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v1, v6

    const/4 v6, 0x0

    move-object v8, v12

    move v9, v4

    move/from16 v10, v18

    move-object v4, v12

    move v12, v1

    move v1, v13

    move v13, v6

    invoke-virtual/range {v8 .. v13}, Lنٍصے/ب;->ء(FFFIZ)V

    goto :goto_8

    :cond_11
    move-object v4, v12

    move v1, v13

    :goto_8
    iget v6, v2, Lنٍصے/؋;->آ:I

    if-lez v6, :cond_12

    iget v12, v2, Lنٍصے/؋;->أ:F

    int-to-float v6, v6

    div-float v6, v6, v16

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v13, v6

    const/4 v6, 0x0

    move-object v9, v4

    move v10, v14

    move/from16 v11, v19

    move v14, v6

    invoke-virtual/range {v9 .. v14}, Lنٍصے/ب;->ء(FFFIZ)V

    :cond_12
    iget v6, v2, Lنٍصے/؋;->ؤ:F

    iget v7, v2, Lنٍصے/؋;->إ:I

    const/16 v26, 0x1

    const/16 v23, 0x0

    move-object/from16 v21, v4

    move/from16 v22, v15

    move/from16 v24, v6

    move/from16 v25, v7

    invoke-virtual/range {v21 .. v26}, Lنٍصے/ب;->ء(FFFIZ)V

    iget v6, v2, Lنٍصے/؋;->آ:I

    if-lez v6, :cond_13

    iget v7, v2, Lنٍصے/؋;->أ:F

    int-to-float v6, v6

    div-float v6, v6, v16

    float-to-double v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v6, v8

    const/16 v26, 0x0

    move-object/from16 v21, v4

    move/from16 v22, v1

    move/from16 v23, v19

    move/from16 v24, v7

    move/from16 v25, v6

    invoke-virtual/range {v21 .. v26}, Lنٍصے/ب;->ء(FFFIZ)V

    :cond_13
    iget v1, v2, Lنٍصے/؋;->ء:I

    if-lez v1, :cond_14

    iget v2, v2, Lنٍصے/؋;->ؠ:F

    int-to-float v1, v1

    div-float v1, v1, v16

    float-to-double v6, v1

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v1, v6

    const/16 v26, 0x0

    move-object/from16 v21, v4

    move/from16 v22, v5

    move/from16 v23, v18

    move/from16 v24, v2

    move/from16 v25, v1

    invoke-virtual/range {v21 .. v26}, Lنٍصے/ب;->ء(FFFIZ)V

    :cond_14
    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object v6, v4

    move v7, v3

    move/from16 v8, v17

    move v9, v0

    invoke-virtual/range {v6 .. v11}, Lنٍصے/ب;->؋(FFFZZ)V

    invoke-virtual {v4}, Lنٍصے/ب;->آ()Lنٍصے/ت;

    move-result-object v0

    goto/16 :goto_9

    :cond_15
    move/from16 v8, v20

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    add-float/2addr v0, v8

    iget v3, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    div-float v3, v0, v16

    sub-float v10, v5, v3

    iget v4, v2, Lنٍصے/؋;->ؤ:F

    iget v6, v2, Lنٍصے/؋;->إ:I

    invoke-static {v5, v4, v6}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v4

    iget v7, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v4, v7, v6}, Lسۄھؤۏ۫/؋;->؋(FFI)F

    move-result v7

    iget v9, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v5, v7, v9, v6}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v6, v2, Lنٍصے/؋;->أ:F

    iget v7, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v7}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v6

    iget v7, v2, Lنٍصے/؋;->أ:F

    iget v9, v2, Lنٍصے/؋;->آ:I

    invoke-static {v5, v6, v7, v9}, Lسۄھؤۏ۫/؋;->ط(FFFI)F

    move-result v5

    iget v7, v2, Lنٍصے/؋;->ؠ:F

    iget v9, v2, Lنٍصے/؋;->ء:I

    invoke-static {v5, v7, v9}, Lسۄھؤۏ۫/؋;->ؠ(FFI)F

    move-result v5

    add-float/2addr v3, v1

    iget v7, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v0, v7, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v7

    iget v9, v2, Lنٍصے/؋;->ؠ:F

    iget v11, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v9, v11, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v17

    iget v9, v2, Lنٍصے/؋;->أ:F

    iget v11, v2, Lنٍصے/؋;->ؤ:F

    invoke-static {v9, v11, v8}, Lڃٷښـ۝ۼ/ؠ;->ب(FFF)F

    move-result v8

    const/4 v15, 0x0

    new-instance v14, Lنٍصے/ب;

    iget v9, v2, Lنٍصے/؋;->ؤ:F

    invoke-direct {v14, v9, v1}, Lنٍصے/ب;-><init>(FF)V

    const/4 v13, 0x0

    const/4 v1, 0x1

    move-object v9, v14

    move v11, v7

    move v12, v0

    move-object/from16 v18, v14

    move v14, v1

    invoke-virtual/range {v9 .. v14}, Lنٍصے/ب;->؋(FFFZZ)V

    iget v14, v2, Lنٍصے/؋;->ؤ:F

    iget v1, v2, Lنٍصے/؋;->إ:I

    const/16 v16, 0x1

    move-object/from16 v11, v18

    move v12, v4

    move v13, v15

    move v15, v1

    invoke-virtual/range {v11 .. v16}, Lنٍصے/ب;->ء(FFFIZ)V

    iget v1, v2, Lنٍصے/؋;->آ:I

    if-lez v1, :cond_16

    iget v14, v2, Lنٍصے/؋;->أ:F

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v11, v18

    move v12, v6

    move v13, v8

    invoke-virtual/range {v11 .. v16}, Lنٍصے/ب;->؋(FFFZZ)V

    :cond_16
    iget v15, v2, Lنٍصے/؋;->ء:I

    if-lez v15, :cond_17

    iget v14, v2, Lنٍصے/؋;->ؠ:F

    const/16 v16, 0x0

    move-object/from16 v11, v18

    move v12, v5

    move/from16 v13, v17

    invoke-virtual/range {v11 .. v16}, Lنٍصے/ب;->ء(FFFIZ)V

    :cond_17
    const/4 v13, 0x0

    const/4 v14, 0x1

    move-object/from16 v9, v18

    move v10, v3

    move v11, v7

    move v12, v0

    invoke-virtual/range {v9 .. v14}, Lنٍصے/ب;->؋(FFFZZ)V

    invoke-virtual/range {v18 .. v18}, Lنٍصے/ب;->آ()Lنٍصے/ت;

    move-result-object v0

    :goto_9
    return-object v0
.end method

.method public final ز(Lنٍصے/ؠ;I)Z
    .locals 2

    iget v0, p0, Lنٍصے/ج;->ح:I

    if-ge p2, v0, :cond_0

    invoke-interface {p1}, Lنٍصے/ؠ;->getItemCount()I

    move-result v0

    iget v1, p0, Lنٍصے/ج;->ح:I

    if-ge v0, v1, :cond_1

    :cond_0
    iget v0, p0, Lنٍصے/ج;->ح:I

    if-lt p2, v0, :cond_2

    invoke-interface {p1}, Lنٍصے/ؠ;->getItemCount()I

    move-result p1

    iget p2, p0, Lنٍصے/ج;->ح:I

    if-ge p1, p2, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
