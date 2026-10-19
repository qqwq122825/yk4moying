.class public Lٽچڃ/إ;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroidx/core/graphics/drawable/TintAwareDrawable;
.implements Lٽچڃ/س;


# static fields
.field public static final ص:Landroid/graphics/Paint;


# instance fields
.field public ؋:Lٽچڃ/ؤ;

.field public final ؠ:[Lٽچڃ/ر;

.field public final ء:[Lٽچڃ/ر;

.field public final آ:Ljava/util/BitSet;

.field public أ:Z

.field public final ؤ:Landroid/graphics/Matrix;

.field public final إ:Landroid/graphics/Path;

.field public final ئ:Landroid/graphics/Path;

.field public final ا:Landroid/graphics/RectF;

.field public final ب:Landroid/graphics/RectF;

.field public final ة:Landroid/graphics/Region;

.field public final ت:Landroid/graphics/Region;

.field public ث:Lٽچڃ/ب;

.field public final ج:Landroid/graphics/Paint;

.field public final ح:Landroid/graphics/Paint;

.field public final خ:Lٺڡءۡٻٟۙ/؋;

.field public final د:Lئٱنۃؖۊڄئ/آ;

.field public final ذ:Lٽچڃ/ت;

.field public ر:Landroid/graphics/PorterDuffColorFilter;

.field public ز:Landroid/graphics/PorterDuffColorFilter;

.field public final س:Landroid/graphics/RectF;

.field public final ش:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lٽچڃ/إ;->ص:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    new-instance v0, Lٽچڃ/ب;

    invoke-direct {v0}, Lٽچڃ/ب;-><init>()V

    invoke-direct {p0, v0}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    invoke-static {p1, p2, p3, p4}, Lٽچڃ/ب;->ؠ(Landroid/content/Context;Landroid/util/AttributeSet;II)Lآۋۻؾ۹/ئ;

    move-result-object p1

    invoke-virtual {p1}, Lآۋۻؾ۹/ئ;->؋()Lٽچڃ/ب;

    move-result-object p1

    invoke-direct {p0, p1}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    return-void
.end method

.method public constructor <init>(Lٽچڃ/ؤ;)V
    .locals 5

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [Lٽچڃ/ر;

    iput-object v1, p0, Lٽچڃ/إ;->ؠ:[Lٽچڃ/ر;

    new-array v0, v0, [Lٽچڃ/ر;

    iput-object v0, p0, Lٽچڃ/إ;->ء:[Lٽچڃ/ر;

    new-instance v0, Ljava/util/BitSet;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v0, p0, Lٽچڃ/إ;->آ:Ljava/util/BitSet;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ؤ:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->إ:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ئ:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ا:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ب:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ة:Landroid/graphics/Region;

    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    iput-object v0, p0, Lٽچڃ/إ;->ت:Landroid/graphics/Region;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lٽچڃ/إ;->ج:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lٽچڃ/إ;->ح:Landroid/graphics/Paint;

    new-instance v3, Lٺڡءۡٻٟۙ/؋;

    invoke-direct {v3}, Lٺڡءۡٻٟۙ/؋;-><init>()V

    iput-object v3, p0, Lٽچڃ/إ;->خ:Lٺڡءۡٻٟۙ/؋;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    if-ne v3, v4, :cond_0

    sget-object v3, Lٽچڃ/ة;->؋:Lٽچڃ/ت;

    goto :goto_0

    :cond_0
    new-instance v3, Lٽچڃ/ت;

    invoke-direct {v3}, Lٽچڃ/ت;-><init>()V

    :goto_0
    iput-object v3, p0, Lٽچڃ/إ;->ذ:Lٽچڃ/ت;

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, p0, Lٽچڃ/إ;->س:Landroid/graphics/RectF;

    iput-boolean v1, p0, Lٽچڃ/إ;->ش:Z

    iput-object p1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0}, Lٽچڃ/إ;->ت()Z

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->ة([I)Z

    new-instance p1, Lئٱنۃؖۊڄئ/آ;

    const/4 v0, 0x3

    invoke-direct {p1, v0, p0}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lٽچڃ/إ;->د:Lئٱنۃؖۊڄئ/آ;

    return-void
.end method

.method public constructor <init>(Lٽچڃ/ب;)V
    .locals 1

    new-instance v0, Lٽچڃ/ؤ;

    invoke-direct {v0, p1}, Lٽچڃ/ؤ;-><init>(Lٽچڃ/ب;)V

    invoke-direct {p0, v0}, Lٽچڃ/إ;-><init>(Lٽچڃ/ؤ;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 21

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    iget-object v8, v6, Lٽچڃ/إ;->ج:Landroid/graphics/Paint;

    iget-object v0, v6, Lٽچڃ/إ;->ر:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getAlpha()I

    move-result v9

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ت:I

    ushr-int/lit8 v1, v0, 0x7

    add-int/2addr v0, v1

    mul-int/2addr v0, v9

    ushr-int/lit8 v0, v0, 0x8

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v10, v6, Lٽچڃ/إ;->ح:Landroid/graphics/Paint;

    iget-object v0, v6, Lٽچڃ/إ;->ز:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v10}, Landroid/graphics/Paint;->getAlpha()I

    move-result v11

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ت:I

    ushr-int/lit8 v1, v0, 0x7

    add-int/2addr v0, v1

    mul-int/2addr v0, v11

    ushr-int/lit8 v0, v0, 0x8

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-boolean v0, v6, Lٽچڃ/إ;->أ:Z

    iget-object v3, v6, Lٽچڃ/إ;->إ:Landroid/graphics/Path;

    const/4 v12, 0x0

    const/4 v14, 0x0

    if-eqz v0, :cond_a

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->س:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v0, v1, :cond_0

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {v10}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    cmpl-float v0, v0, v12

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v14

    :goto_0
    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_2

    invoke-virtual {v10}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    div-float/2addr v0, v1

    goto :goto_1

    :cond_2
    move v0, v12

    :goto_1
    neg-float v0, v0

    iget-object v2, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v2, v2, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lآۋۻؾ۹/ئ;

    invoke-direct {v4, v2}, Lآۋۻؾ۹/ئ;-><init>(Lٽچڃ/ب;)V

    iget-object v5, v2, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    instance-of v15, v5, Lٽچڃ/ئ;

    if-eqz v15, :cond_3

    goto :goto_2

    :cond_3
    new-instance v15, Lٽچڃ/ؠ;

    invoke-direct {v15, v0, v5}, Lٽچڃ/ؠ;-><init>(FLٽچڃ/ء;)V

    move-object v5, v15

    :goto_2
    iput-object v5, v4, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    iget-object v5, v2, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    instance-of v15, v5, Lٽچڃ/ئ;

    if-eqz v15, :cond_4

    goto :goto_3

    :cond_4
    new-instance v15, Lٽچڃ/ؠ;

    invoke-direct {v15, v0, v5}, Lٽچڃ/ؠ;-><init>(FLٽچڃ/ء;)V

    move-object v5, v15

    :goto_3
    iput-object v5, v4, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    iget-object v5, v2, Lٽچڃ/ب;->ئ:Lٽچڃ/ء;

    instance-of v15, v5, Lٽچڃ/ئ;

    if-eqz v15, :cond_5

    goto :goto_4

    :cond_5
    new-instance v15, Lٽچڃ/ؠ;

    invoke-direct {v15, v0, v5}, Lٽچڃ/ؠ;-><init>(FLٽچڃ/ء;)V

    move-object v5, v15

    :goto_4
    iput-object v5, v4, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    iget-object v2, v2, Lٽچڃ/ب;->إ:Lٽچڃ/ء;

    instance-of v5, v2, Lٽچڃ/ئ;

    if-eqz v5, :cond_6

    goto :goto_5

    :cond_6
    new-instance v5, Lٽچڃ/ؠ;

    invoke-direct {v5, v0, v2}, Lٽچڃ/ؠ;-><init>(FLٽچڃ/ء;)V

    move-object v2, v5

    :goto_5
    iput-object v2, v4, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/ب;

    invoke-direct {v0, v4}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iput-object v0, v6, Lٽچڃ/إ;->ث:Lٽچڃ/ب;

    iget-object v15, v6, Lٽچڃ/إ;->ذ:Lٽچڃ/ت;

    iget-object v2, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v2, v2, Lٽچڃ/ؤ;->ب:F

    iget-object v4, v6, Lٽچڃ/إ;->ب:Landroid/graphics/RectF;

    invoke-virtual/range {p0 .. p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v5, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v5, v5, Lٽچڃ/ؤ;->س:Landroid/graphics/Paint$Style;

    sget-object v13, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v5, v13, :cond_7

    sget-object v13, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    if-ne v5, v13, :cond_8

    :cond_7
    invoke-virtual {v10}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v5

    cmpl-float v5, v5, v12

    if-lez v5, :cond_8

    const/4 v5, 0x1

    goto :goto_6

    :cond_8
    move v5, v14

    :goto_6
    if-eqz v5, :cond_9

    invoke-virtual {v10}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v5

    div-float/2addr v5, v1

    goto :goto_7

    :cond_9
    move v5, v12

    :goto_7
    invoke-virtual {v4, v5, v5}, Landroid/graphics/RectF;->inset(FF)V

    iget-object v1, v6, Lٽچڃ/إ;->ئ:Landroid/graphics/Path;

    const/16 v19, 0x0

    move-object/from16 v16, v0

    move/from16 v17, v2

    move-object/from16 v18, v4

    move-object/from16 v20, v1

    invoke-virtual/range {v15 .. v20}, Lٽچڃ/ت;->؋(Lٽچڃ/ب;FLandroid/graphics/RectF;Lئٱنۃؖۊڄئ/آ;Landroid/graphics/Path;)V

    invoke-virtual/range {p0 .. p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v6, v0, v3}, Lٽچڃ/إ;->؋(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    iput-boolean v14, v6, Lٽچڃ/إ;->أ:Z

    :cond_a
    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->خ:I

    const/4 v2, 0x2

    const/4 v13, 0x1

    if-eq v1, v13, :cond_d

    iget v4, v0, Lٽچڃ/ؤ;->د:I

    if-lez v4, :cond_d

    if-eq v1, v2, :cond_c

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual/range {p0 .. p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v0, v4}, Lٽچڃ/ب;->آ(Landroid/graphics/RectF;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual {v3}, Landroid/graphics/Path;->isConvex()Z

    move-result v0

    if-nez v0, :cond_b

    const/16 v0, 0x1d

    if-ge v1, v0, :cond_b

    move v0, v13

    goto :goto_8

    :cond_b
    move v0, v14

    :goto_8
    if-eqz v0, :cond_d

    :cond_c
    move v0, v13

    goto :goto_9

    :cond_d
    move v0, v14

    :goto_9
    if-nez v0, :cond_e

    goto/16 :goto_b

    :cond_e
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->ذ:I

    int-to-double v4, v1

    iget v0, v0, Lٽچڃ/ؤ;->ر:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double/2addr v0, v4

    double-to-int v0, v0

    iget-object v1, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v4, v1, Lٽچڃ/ؤ;->ذ:I

    int-to-double v4, v4

    iget v1, v1, Lٽچڃ/ؤ;->ر:I

    int-to-double v13, v1

    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    mul-double/2addr v13, v4

    double-to-int v1, v13

    int-to-float v0, v0

    int-to-float v1, v1

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-boolean v0, v6, Lٽچڃ/إ;->ش:Z

    if-nez v0, :cond_f

    invoke-virtual/range {p0 .. p1}, Lٽچڃ/إ;->آ(Landroid/graphics/Canvas;)V

    goto :goto_a

    :cond_f
    iget-object v0, v6, Lٽچڃ/إ;->س:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v1, v4

    float-to-int v1, v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v4, v4

    if-ltz v1, :cond_16

    if-ltz v4, :cond_16

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v5

    float-to-int v5, v5

    iget-object v13, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v13, v13, Lٽچڃ/ؤ;->د:I

    mul-int/2addr v13, v2

    add-int/2addr v13, v5

    add-int/2addr v13, v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    float-to-int v0, v0

    iget-object v5, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v5, v5, Lٽچڃ/ؤ;->د:I

    mul-int/2addr v5, v2

    add-int/2addr v5, v0

    add-int/2addr v5, v4

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v13, v5, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v13, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v13, v13, Lٽچڃ/ؤ;->د:I

    sub-int/2addr v5, v13

    sub-int/2addr v5, v1

    int-to-float v1, v5

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v13, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v13, v13, Lٽچڃ/ؤ;->د:I

    sub-int/2addr v5, v13

    sub-int/2addr v5, v4

    int-to-float v4, v5

    neg-float v5, v1

    neg-float v13, v4

    invoke-virtual {v2, v5, v13}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v6, v2}, Lٽچڃ/إ;->آ(Landroid/graphics/Canvas;)V

    const/4 v2, 0x0

    invoke-virtual {v7, v0, v1, v4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    :goto_a
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    :goto_b
    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v1, v0, Lٽچڃ/ؤ;->س:Landroid/graphics/Paint$Style;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v1, v2, :cond_11

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-ne v1, v2, :cond_10

    goto :goto_c

    :cond_10
    const/4 v1, 0x0

    goto :goto_d

    :cond_11
    :goto_c
    const/4 v1, 0x1

    :goto_d
    if-eqz v1, :cond_12

    iget-object v4, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual/range {p0 .. p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v8

    invoke-virtual/range {v0 .. v5}, Lٽچڃ/إ;->أ(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lٽچڃ/ب;Landroid/graphics/RectF;)V

    :cond_12
    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->س:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-eq v0, v1, :cond_13

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_14

    :cond_13
    invoke-virtual {v10}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    cmpl-float v0, v0, v12

    if-lez v0, :cond_14

    const/4 v13, 0x1

    goto :goto_e

    :cond_14
    const/4 v13, 0x0

    :goto_e
    if-eqz v13, :cond_15

    invoke-virtual/range {p0 .. p1}, Lٽچڃ/إ;->ؤ(Landroid/graphics/Canvas;)V

    :cond_15
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void

    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid shadow bounds. Check that the treatments result in a valid path."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlpha()I
    .locals 1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ت:I

    return v0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    return-object v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method public getOutline(Landroid/graphics/Outline;)V
    .locals 3

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->خ:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    return-void

    :cond_0
    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lٽچڃ/ب;->آ(Landroid/graphics/RectF;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    iget-object v1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v1, Lٽچڃ/ؤ;->ب:F

    mul-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    return-void

    :cond_1
    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lٽچڃ/إ;->إ:Landroid/graphics/Path;

    invoke-virtual {p0, v0, v1}, Lٽچڃ/إ;->؋(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v0, v2, :cond_2

    invoke-static {p1, v1}, Landroidx/core/view/accessibility/أ;->ت(Landroid/graphics/Outline;Landroid/graphics/Path;)V

    goto :goto_0

    :cond_2
    const/16 v2, 0x1d

    if-lt v0, v2, :cond_3

    :try_start_0
    invoke-virtual {p1, v1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Landroid/graphics/Path;->isConvex()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1, v1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    :catch_0
    :cond_4
    :goto_0
    return-void
.end method

.method public final getPadding(Landroid/graphics/Rect;)Z
    .locals 1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->ئ:Landroid/graphics/Rect;

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public final getTransparentRegion()Landroid/graphics/Region;
    .locals 3

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lٽچڃ/إ;->ة:Landroid/graphics/Region;

    invoke-virtual {v1, v0}, Landroid/graphics/Region;->set(Landroid/graphics/Rect;)Z

    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v2, p0, Lٽچڃ/إ;->إ:Landroid/graphics/Path;

    invoke-virtual {p0, v0, v2}, Lٽچڃ/إ;->؋(Landroid/graphics/RectF;Landroid/graphics/Path;)V

    iget-object v0, p0, Lٽچڃ/إ;->ت:Landroid/graphics/Region;

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    sget-object v2, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Region;->op(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z

    return-object v1
.end method

.method public final invalidateSelf()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lٽچڃ/إ;->أ:Z

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public isStateful()Z
    .locals 1

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->ؤ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_0
    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->أ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_1
    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_2
    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2

    new-instance v0, Lٽچڃ/ؤ;

    iget-object v1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    invoke-direct {v0, v1}, Lٽچڃ/ؤ;-><init>(Lٽچڃ/ؤ;)V

    iput-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lٽچڃ/إ;->أ:Z

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onStateChange([I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->ة([I)Z

    move-result p1

    invoke-virtual {p0}, Lٽچڃ/إ;->ت()Z

    move-result v0

    if-nez p1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_2
    return p1
.end method

.method public setAlpha(I)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->ت:I

    if-eq v1, p1, :cond_0

    iput p1, v0, Lٽچڃ/ؤ;->ت:I

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    iget-object p1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final setShapeAppearanceModel(Lٽچڃ/ب;)V
    .locals 1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput-object p1, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    return-void
.end method

.method public final setTint(I)V
    .locals 0

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput-object p1, v0, Lٽچڃ/ؤ;->ؤ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lٽچڃ/إ;->ت()Z

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v1, v0, Lٽچڃ/ؤ;->إ:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٽچڃ/ؤ;->إ:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0}, Lٽچڃ/إ;->ت()Z

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public final ؋(Landroid/graphics/RectF;Landroid/graphics/Path;)V
    .locals 6

    iget-object v0, p0, Lٽچڃ/إ;->ذ:Lٽچڃ/ت;

    iget-object v1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v2, v1, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    iget v3, v1, Lٽچڃ/ؤ;->ب:F

    iget-object v4, p0, Lٽچڃ/إ;->د:Lئٱنۃؖۊڄئ/آ;

    move-object v1, v2

    move v2, v3

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lٽچڃ/ت;->؋(Lٽچڃ/ب;FLandroid/graphics/RectF;Lئٱنۃؖۊڄئ/آ;Landroid/graphics/Path;)V

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ا:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٽچڃ/إ;->ؤ:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v1, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v1, Lٽچڃ/ؤ;->ا:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr p1, v3

    invoke-virtual {v0, v1, v1, v2, p1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    :cond_0
    iget-object p1, p0, Lٽچڃ/إ;->س:Landroid/graphics/RectF;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    return-void
.end method

.method public final ؠ(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;
    .locals 1

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    if-eqz p4, :cond_1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->ء(I)I

    move-result p1

    :cond_1
    new-instance p3, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {p3, p1, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_2

    :cond_2
    :goto_0
    if-eqz p4, :cond_3

    invoke-virtual {p3}, Landroid/graphics/Paint;->getColor()I

    move-result p1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->ء(I)I

    move-result p2

    if-eq p2, p1, :cond_3

    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    sget-object p3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2, p3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    move-object p3, p1

    :goto_2
    return-object p3
.end method

.method public final ء(I)I
    .locals 7

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->ج:F

    iget v2, v0, Lٽچڃ/ؤ;->ح:F

    add-float/2addr v1, v2

    iget v2, v0, Lٽچڃ/ؤ;->ث:F

    add-float/2addr v1, v2

    iget-object v0, v0, Lٽچڃ/ؤ;->ؠ:Lٸبق/؋;

    if-eqz v0, :cond_4

    iget-boolean v2, v0, Lٸبق/؋;->؋:Z

    if-eqz v2, :cond_4

    const/16 v2, 0xff

    invoke-static {p1, v2}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v3

    iget v4, v0, Lٸبق/؋;->آ:I

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_4

    iget v3, v0, Lٸبق/؋;->أ:F

    const/4 v4, 0x0

    cmpg-float v5, v3, v4

    if-lez v5, :cond_2

    cmpg-float v5, v1, v4

    if-gtz v5, :cond_1

    goto :goto_1

    :cond_1
    div-float/2addr v1, v3

    float-to-double v5, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->log1p(D)D

    move-result-wide v5

    double-to-float v1, v5

    const/high16 v3, 0x40900000    # 4.5f

    mul-float/2addr v1, v3

    const/high16 v3, 0x40000000    # 2.0f

    add-float/2addr v1, v3

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v1, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    goto :goto_2

    :cond_2
    :goto_1
    move v1, v4

    :goto_2
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    invoke-static {p1, v2}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result p1

    iget v2, v0, Lٸبق/؋;->ؠ:I

    invoke-static {p1, v2, v1}, Lٳَاڂ/؋;->ء(IIF)I

    move-result p1

    cmpl-float v1, v1, v4

    if-lez v1, :cond_3

    iget v0, v0, Lٸبق/؋;->ء:I

    if-eqz v0, :cond_3

    sget v1, Lٸبق/؋;->ؤ:I

    invoke-static {v0, v1}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    invoke-static {v0, p1}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result p1

    :cond_3
    invoke-static {p1, v3}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result p1

    :cond_4
    return p1
.end method

.method public final آ(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v0, p0, Lٽچڃ/إ;->آ:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, "\u0625"

    const-string v1, "Compatibility shadow requested but can\'t be drawn for all operations in this shape."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v0, v0, Lٽچڃ/ؤ;->ذ:I

    iget-object v1, p0, Lٽچڃ/إ;->إ:Landroid/graphics/Path;

    iget-object v2, p0, Lٽچڃ/إ;->خ:Lٺڡءۡٻٟۙ/؋;

    if-eqz v0, :cond_1

    iget-object v0, v2, Lٺڡءۡٻٟۙ/؋;->؋:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x4

    if-ge v0, v3, :cond_2

    iget-object v3, p0, Lٽچڃ/إ;->ؠ:[Lٽچڃ/ر;

    aget-object v3, v3, v0

    iget-object v4, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v4, v4, Lٽچڃ/ؤ;->د:I

    sget-object v5, Lٽچڃ/ر;->ؠ:Landroid/graphics/Matrix;

    invoke-virtual {v3, v5, v2, v4, p1}, Lٽچڃ/ر;->؋(Landroid/graphics/Matrix;Lٺڡءۡٻٟۙ/؋;ILandroid/graphics/Canvas;)V

    iget-object v3, p0, Lٽچڃ/إ;->ء:[Lٽچڃ/ر;

    aget-object v3, v3, v0

    iget-object v4, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v4, v4, Lٽچڃ/ؤ;->د:I

    invoke-virtual {v3, v5, v2, v4, p1}, Lٽچڃ/ر;->؋(Landroid/graphics/Matrix;Lٺڡءۡٻٟۙ/؋;ILandroid/graphics/Canvas;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lٽچڃ/إ;->ش:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v2, v0, Lٽچڃ/ؤ;->ذ:I

    int-to-double v2, v2

    iget v0, v0, Lٽچڃ/ؤ;->ر:I

    int-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double/2addr v4, v2

    double-to-int v0, v4

    iget-object v2, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v3, v2, Lٽچڃ/ؤ;->ذ:I

    int-to-double v3, v3

    iget v2, v2, Lٽچڃ/ؤ;->ر:I

    int-to-double v5, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double/2addr v5, v3

    double-to-int v2, v5

    neg-int v3, v0

    int-to-float v3, v3

    neg-int v4, v2

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    sget-object v3, Lٽچڃ/إ;->ص:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    int-to-float v0, v0

    int-to-float v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_3
    return-void
.end method

.method public final أ(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lٽچڃ/ب;Landroid/graphics/RectF;)V
    .locals 1

    invoke-virtual {p4, p5}, Lٽچڃ/ب;->آ(Landroid/graphics/RectF;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p3, p4, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    invoke-interface {p3, p5}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result p3

    iget-object p4, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget p4, p4, Lٽچڃ/ؤ;->ب:F

    mul-float/2addr p3, p4

    invoke-virtual {p1, p5, p3, p3, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :goto_0
    return-void
.end method

.method public ؤ(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v2, p0, Lٽچڃ/إ;->ح:Landroid/graphics/Paint;

    iget-object v3, p0, Lٽچڃ/إ;->ئ:Landroid/graphics/Path;

    iget-object v4, p0, Lٽچڃ/إ;->ث:Lٽچڃ/ب;

    iget-object v5, p0, Lٽچڃ/إ;->ب:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->س:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    const/4 v6, 0x0

    if-eq v0, v1, :cond_0

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    cmpl-float v0, v0, v6

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v6, v0, v1

    :cond_2
    invoke-virtual {v5, v6, v6}, Landroid/graphics/RectF;->inset(FF)V

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lٽچڃ/إ;->أ(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lٽچڃ/ب;Landroid/graphics/RectF;)V

    return-void
.end method

.method public final إ()Landroid/graphics/RectF;
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->ا:Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    return-object v0
.end method

.method public final ئ(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    new-instance v1, Lٸبق/؋;

    invoke-direct {v1, p1}, Lٸبق/؋;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lٽچڃ/ؤ;->ؠ:Lٸبق/؋;

    invoke-virtual {p0}, Lٽچڃ/إ;->ث()V

    return-void
.end method

.method public final ا(F)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->ج:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٽچڃ/ؤ;->ج:F

    invoke-virtual {p0}, Lٽچڃ/إ;->ث()V

    :cond_0
    return-void
.end method

.method public final ب(Landroid/content/res/ColorStateList;)V
    .locals 2

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v1, v0, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_0
    return-void
.end method

.method public final ة([I)Z
    .locals 5

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٽچڃ/إ;->ج:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    iget-object v3, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v3, v3, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    invoke-virtual {v3, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    if-eq v2, v3, :cond_0

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v2, v2, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lٽچڃ/إ;->ح:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    iget-object v4, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v4, v4, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v4, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    if-eq v3, p1, :cond_1

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    :cond_1
    move v1, v0

    :goto_1
    return v1
.end method

.method public final ت()Z
    .locals 7

    iget-object v0, p0, Lٽچڃ/إ;->ر:Landroid/graphics/PorterDuffColorFilter;

    iget-object v1, p0, Lٽچڃ/إ;->ز:Landroid/graphics/PorterDuffColorFilter;

    iget-object v2, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v3, v2, Lٽچڃ/ؤ;->ؤ:Landroid/content/res/ColorStateList;

    iget-object v2, v2, Lٽچڃ/ؤ;->إ:Landroid/graphics/PorterDuff$Mode;

    iget-object v4, p0, Lٽچڃ/إ;->ج:Landroid/graphics/Paint;

    const/4 v5, 0x1

    invoke-virtual {p0, v3, v2, v4, v5}, Lٽچڃ/إ;->ؠ(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    iput-object v2, p0, Lٽچڃ/إ;->ر:Landroid/graphics/PorterDuffColorFilter;

    iget-object v2, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v3, v2, Lٽچڃ/ؤ;->أ:Landroid/content/res/ColorStateList;

    iget-object v2, v2, Lٽچڃ/ؤ;->إ:Landroid/graphics/PorterDuff$Mode;

    iget-object v4, p0, Lٽچڃ/إ;->ح:Landroid/graphics/Paint;

    const/4 v6, 0x0

    invoke-virtual {p0, v3, v2, v4, v6}, Lٽچڃ/إ;->ؠ(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/graphics/Paint;Z)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    iput-object v2, p0, Lٽچڃ/إ;->ز:Landroid/graphics/PorterDuffColorFilter;

    iget-object v2, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-boolean v3, v2, Lٽچڃ/ؤ;->ز:Z

    if-eqz v3, :cond_0

    iget-object v2, v2, Lٽچڃ/ؤ;->ؤ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v3

    invoke-virtual {v2, v3, v6}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    iget-object v3, p0, Lٽچڃ/إ;->خ:Lٺڡءۡٻٟۙ/؋;

    invoke-virtual {v3, v2}, Lٺڡءۡٻٟۙ/؋;->؋(I)V

    :cond_0
    iget-object v2, p0, Lٽچڃ/إ;->ر:Landroid/graphics/PorterDuffColorFilter;

    invoke-static {v0, v2}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٽچڃ/إ;->ز:Landroid/graphics/PorterDuffColorFilter;

    invoke-static {v1, v0}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move v5, v6

    :cond_2
    :goto_0
    return v5
.end method

.method public final ث()V
    .locals 4

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget v1, v0, Lٽچڃ/ؤ;->ج:F

    iget v2, v0, Lٽچڃ/ؤ;->ح:F

    add-float/2addr v1, v2

    const/high16 v2, 0x3f400000    # 0.75f

    mul-float/2addr v2, v1

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    iput v2, v0, Lٽچڃ/ؤ;->د:I

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    const/high16 v2, 0x3e800000    # 0.25f

    mul-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    iput v1, v0, Lٽچڃ/ؤ;->ذ:I

    invoke-virtual {p0}, Lٽچڃ/إ;->ت()Z

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
