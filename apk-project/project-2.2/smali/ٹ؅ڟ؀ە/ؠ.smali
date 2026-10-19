.class public final Lٹ؅ڟ؀ە/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/view/View;

.field public ؠ:F

.field public final ء:Landroid/graphics/Rect;

.field public final آ:Landroid/graphics/Rect;

.field public final أ:Landroid/graphics/RectF;

.field public ؤ:I

.field public إ:I

.field public ئ:F

.field public ا:F

.field public ب:Landroid/content/res/ColorStateList;

.field public ة:Landroid/content/res/ColorStateList;

.field public ت:F

.field public ث:F

.field public ج:F

.field public ح:F

.field public خ:F

.field public د:F

.field public ذ:Landroid/graphics/Typeface;

.field public ر:Landroid/graphics/Typeface;

.field public ز:Landroid/graphics/Typeface;

.field public س:Landroid/graphics/Typeface;

.field public ش:Landroid/graphics/Typeface;

.field public ص:Landroid/graphics/Typeface;

.field public ض:Landroid/graphics/Typeface;

.field public ط:Lٹۧ٥ؐح/؋;

.field public final ظ:Landroid/text/TextUtils$TruncateAt;

.field public ع:Ljava/lang/CharSequence;

.field public غ:Ljava/lang/CharSequence;

.field public ػ:Z

.field public final ؼ:Z

.field public ؽ:Landroid/graphics/Bitmap;

.field public ؾ:F

.field public ؿ:F

.field public ـ:F

.field public ف:F

.field public ق:F

.field public ك:I

.field public ل:[I

.field public م:Z

.field public final ن:Landroid/text/TextPaint;

.field public final ه:Landroid/text/TextPaint;

.field public و:Landroid/animation/TimeInterpolator;

.field public ى:Landroid/animation/TimeInterpolator;

.field public ي:F

.field public ٮ:F

.field public ٯ:F

.field public ٱ:Landroid/content/res/ColorStateList;

.field public ٲ:F

.field public ٳ:F

.field public ٴ:F

.field public ٵ:Landroid/text/StaticLayout;

.field public ٶ:F

.field public ٷ:F

.field public ٸ:F

.field public ٹ:Ljava/lang/CharSequence;

.field public final ٺ:I

.field public final ٻ:F

.field public final ټ:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->إ:I

    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ا:F

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ظ:Landroid/text/TextUtils$TruncateAt;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lٹ؅ڟ؀ە/ؠ;->ؼ:Z

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ٺ:I

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٻ:F

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ټ:I

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    new-instance v0, Landroid/text/TextPaint;

    const/16 v1, 0x81

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ن:Landroid/text/TextPaint;

    new-instance v1, Landroid/text/TextPaint;

    invoke-direct {v1, v0}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ه:Landroid/text/TextPaint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ء:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->أ:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->إ(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public static ؋(IIF)I
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p2

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p2

    add-float/2addr v2, v1

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p2

    add-float/2addr v3, v1

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    add-float/2addr v4, v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr p0, v0

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, p2

    add-float/2addr p1, p0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p0, p2, v0, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method public static ؤ(FFFLandroid/animation/TimeInterpolator;)F
    .locals 0

    if-eqz p3, :cond_0

    invoke-interface {p3, p2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p2

    :cond_0
    sget-object p3, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    invoke-static {p1, p0, p2, p0}, Landroidx/activity/result/؋;->؋(FFFF)F

    move-result p0

    return p0
.end method


# virtual methods
.method public final ؠ(Ljava/lang/CharSequence;)Z
    .locals 3

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    iget-boolean v0, p0, Lٹ؅ڟ؀ە/ؠ;->ؼ:Z

    if-eqz v0, :cond_2

    if-eqz v2, :cond_1

    sget-object v0, Landroidx/core/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_RTL:Landroidx/core/text/TextDirectionHeuristicCompat;

    goto :goto_1

    :cond_1
    sget-object v0, Landroidx/core/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_LTR:Landroidx/core/text/TextDirectionHeuristicCompat;

    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-interface {v0, p1, v1, v2}, Landroidx/core/text/TextDirectionHeuristicCompat;->isRtl(Ljava/lang/CharSequence;II)Z

    move-result v2

    :cond_2
    return v2
.end method

.method public final ء(FZ)V
    .locals 12

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ء:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v3, p1, v2

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const v4, 0x3727c5ac    # 1.0E-5f

    cmpg-float v3, v3, v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-gez v3, :cond_1

    move v3, v5

    goto :goto_0

    :cond_1
    move v3, v6

    :goto_0
    const/4 v7, 0x0

    if-eqz v3, :cond_2

    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ا:F

    iget p2, p0, Lٹ؅ڟ؀ە/ؠ;->ٲ:F

    iput v2, p0, Lٹ؅ڟ؀ە/ؠ;->ؾ:F

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ذ:Landroid/graphics/Typeface;

    goto :goto_4

    :cond_2
    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    iget v8, p0, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    iget-object v9, p0, Lٹ؅ڟ؀ە/ؠ;->س:Landroid/graphics/Typeface;

    sub-float v10, p1, v7

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    cmpg-float v4, v10, v4

    if-gez v4, :cond_3

    move v4, v5

    goto :goto_1

    :cond_3
    move v4, v6

    :goto_1
    if-eqz v4, :cond_4

    iput v2, p0, Lٹ؅ڟ؀ە/ؠ;->ؾ:F

    goto :goto_2

    :cond_4
    iget v4, p0, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    iget v10, p0, Lٹ؅ڟ؀ە/ؠ;->ا:F

    iget-object v11, p0, Lٹ؅ڟ؀ە/ؠ;->ى:Landroid/animation/TimeInterpolator;

    invoke-static {v4, v10, p1, v11}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result p1

    iget v4, p0, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    div-float/2addr p1, v4

    iput p1, p0, Lٹ؅ڟ؀ە/ؠ;->ؾ:F

    :goto_2
    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ا:F

    iget v4, p0, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    div-float/2addr p1, v4

    mul-float v4, v1, p1

    if-nez p2, :cond_5

    cmpl-float p2, v4, v0

    if-lez p2, :cond_5

    div-float/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    move v0, p1

    goto :goto_3

    :cond_5
    move v0, v1

    :goto_3
    move p1, v3

    move p2, v8

    move-object v1, v9

    :goto_4
    cmpl-float v3, v0, v7

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->ن:Landroid/text/TextPaint;

    if-lez v3, :cond_d

    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ؿ:F

    cmpl-float v3, v3, p1

    if-eqz v3, :cond_6

    move v3, v5

    goto :goto_5

    :cond_6
    move v3, v6

    :goto_5
    iget v8, p0, Lٹ؅ڟ؀ە/ؠ;->ٴ:F

    cmpl-float v8, v8, p2

    if-eqz v8, :cond_7

    move v8, v5

    goto :goto_6

    :cond_7
    move v8, v6

    :goto_6
    iget-object v9, p0, Lٹ؅ڟ؀ە/ؠ;->ض:Landroid/graphics/Typeface;

    if-eq v9, v1, :cond_8

    move v9, v5

    goto :goto_7

    :cond_8
    move v9, v6

    :goto_7
    iget-object v10, p0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    if-eqz v10, :cond_9

    invoke-virtual {v10}, Landroid/text/Layout;->getWidth()I

    move-result v10

    int-to-float v10, v10

    cmpl-float v10, v0, v10

    if-eqz v10, :cond_9

    move v10, v5

    goto :goto_8

    :cond_9
    move v10, v6

    :goto_8
    if-nez v3, :cond_b

    if-nez v8, :cond_b

    if-nez v10, :cond_b

    if-nez v9, :cond_b

    iget-boolean v3, p0, Lٹ؅ڟ؀ە/ؠ;->م:Z

    if-eqz v3, :cond_a

    goto :goto_9

    :cond_a
    move v3, v6

    goto :goto_a

    :cond_b
    :goto_9
    move v3, v5

    :goto_a
    iput p1, p0, Lٹ؅ڟ؀ە/ؠ;->ؿ:F

    iput p2, p0, Lٹ؅ڟ؀ە/ؠ;->ٴ:F

    iput-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ض:Landroid/graphics/Typeface;

    iput-boolean v6, p0, Lٹ؅ڟ؀ە/ؠ;->م:Z

    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ؾ:F

    cmpl-float p1, p1, v2

    if-eqz p1, :cond_c

    move p1, v5

    goto :goto_b

    :cond_c
    move p1, v6

    :goto_b
    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setLinearText(Z)V

    goto :goto_c

    :cond_d
    move v3, v6

    :goto_c
    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    if-eqz p1, :cond_e

    if-eqz v3, :cond_17

    :cond_e
    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ؿ:F

    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ض:Landroid/graphics/Typeface;

    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ٴ:F

    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->ؠ(Ljava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    iget p2, p0, Lٹ؅ڟ؀ە/ؠ;->ٺ:I

    if-le p2, v5, :cond_10

    if-eqz p1, :cond_f

    goto :goto_d

    :cond_f
    move v1, v5

    goto :goto_e

    :cond_10
    :goto_d
    move v1, v6

    :goto_e
    if-eqz v1, :cond_11

    goto :goto_f

    :cond_11
    move p2, v5

    :goto_f
    if-ne p2, v5, :cond_12

    :try_start_0
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    goto :goto_11

    :cond_12
    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    invoke-static {v1, p1}, Landroidx/core/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    if-eq v1, v5, :cond_16

    const/4 v2, 0x5

    if-eq v1, v2, :cond_13

    iget-boolean v1, p0, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    if-eqz v1, :cond_14

    goto :goto_10

    :cond_13
    iget-boolean v1, p0, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    if-eqz v1, :cond_15

    :cond_14
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    goto :goto_11

    :cond_15
    :goto_10
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    goto :goto_11

    :cond_16
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    :goto_11
    iget-object v2, p0, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    float-to-int v0, v0

    new-instance v3, Lٹ؅ڟ؀ە/إ;

    invoke-direct {v3, v2, v4, v0}, Lٹ؅ڟ؀ە/إ;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ظ:Landroid/text/TextUtils$TruncateAt;

    iput-object v0, v3, Lٹ؅ڟ؀ە/إ;->ت:Landroid/text/TextUtils$TruncateAt;

    iput-boolean p1, v3, Lٹ؅ڟ؀ە/إ;->ة:Z

    iput-object v1, v3, Lٹ؅ڟ؀ە/إ;->أ:Landroid/text/Layout$Alignment;

    iput-boolean v6, v3, Lٹ؅ڟ؀ە/إ;->ب:Z

    iput p2, v3, Lٹ؅ڟ؀ە/إ;->ؤ:I

    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ٻ:F

    iput v7, v3, Lٹ؅ڟ؀ە/إ;->إ:F

    iput p1, v3, Lٹ؅ڟ؀ە/إ;->ئ:F

    iget p1, p0, Lٹ؅ڟ؀ە/ؠ;->ټ:I

    iput p1, v3, Lٹ؅ڟ؀ە/إ;->ا:I

    invoke-virtual {v3}, Lٹ؅ڟ؀ە/إ;->؋()Landroid/text/StaticLayout;

    move-result-object p1
    :try_end_0
    .catch Lٹ؅ڟ؀ە/ؤ; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_12

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string v0, "CollapsingTextHelper"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    :goto_12
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/text/StaticLayout;

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {p1}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    :cond_17
    return-void
.end method

.method public final آ()F
    .locals 2

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ه:Landroid/text/TextPaint;

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ا:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ذ:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٲ:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    invoke-virtual {v0}, Landroid/graphics/Paint;->ascent()F

    move-result v0

    neg-float v0, v0

    return v0
.end method

.method public final أ(Landroid/content/res/ColorStateList;)I
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ل:[I

    if-eqz v1, :cond_1

    invoke-virtual {p1, v1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    return p1
.end method

.method public final إ(Landroid/content/res/Configuration;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_4

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ز:Landroid/graphics/Typeface;

    if-eqz v0, :cond_0

    invoke-static {p1, v0}, Lٹۧ٥ؐح/ئ;->؋(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ر:Landroid/graphics/Typeface;

    :cond_0
    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ص:Landroid/graphics/Typeface;

    if-eqz v0, :cond_1

    invoke-static {p1, v0}, Lٹۧ٥ؐح/ئ;->؋(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ش:Landroid/graphics/Typeface;

    :cond_1
    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ر:Landroid/graphics/Typeface;

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ز:Landroid/graphics/Typeface;

    :goto_0
    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ذ:Landroid/graphics/Typeface;

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ش:Landroid/graphics/Typeface;

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ص:Landroid/graphics/Typeface;

    :goto_1
    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->س:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_4
    return-void
.end method

.method public final ئ(Z)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    if-gtz v3, :cond_1

    :cond_0
    if-eqz v1, :cond_13

    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3, v1}, Lٹ؅ڟ؀ە/ؠ;->ء(FZ)V

    iget-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    iget-object v5, v0, Lٹ؅ڟ؀ە/ؠ;->ن:Landroid/text/TextPaint;

    if-eqz v4, :cond_2

    iget-object v6, v0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    if-eqz v6, :cond_2

    invoke-virtual {v6}, Landroid/text/Layout;->getWidth()I

    move-result v6

    int-to-float v6, v6

    iget-object v7, v0, Lٹ؅ڟ؀ە/ؠ;->ظ:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v4, v5, v6, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->ٹ:Ljava/lang/CharSequence;

    :cond_2
    iget-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->ٹ:Ljava/lang/CharSequence;

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-eqz v4, :cond_3

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-virtual {v5, v4, v6, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v4

    iput v4, v0, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    goto :goto_0

    :cond_3
    iput v7, v0, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    :goto_0
    iget v4, v0, Lٹ؅ڟ؀ە/ؠ;->إ:I

    iget-boolean v8, v0, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    invoke-static {v4, v8}, Landroidx/core/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v4

    and-int/lit8 v8, v4, 0x70

    iget-object v9, v0, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    const/16 v10, 0x50

    const/16 v11, 0x30

    const/high16 v12, 0x40000000    # 2.0f

    if-eq v8, v11, :cond_5

    if-eq v8, v10, :cond_4

    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    move-result v8

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v13

    sub-float/2addr v8, v13

    div-float/2addr v8, v12

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerY()I

    move-result v13

    int-to-float v13, v13

    sub-float/2addr v13, v8

    goto :goto_1

    :cond_4
    iget v8, v9, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v13

    add-float/2addr v13, v8

    :goto_1
    iput v13, v0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    goto :goto_2

    :cond_5
    iget v8, v9, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    iput v8, v0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    :goto_2
    const v8, 0x800007

    and-int/2addr v4, v8

    const/4 v13, 0x5

    const/4 v14, 0x1

    if-eq v4, v14, :cond_7

    if-eq v4, v13, :cond_6

    iget v4, v9, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    goto :goto_4

    :cond_6
    iget v4, v9, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    iget v15, v0, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    goto :goto_3

    :cond_7
    invoke-virtual {v9}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget v15, v0, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    div-float/2addr v15, v12

    :goto_3
    sub-float/2addr v4, v15

    :goto_4
    iput v4, v0, Lٹ؅ڟ؀ە/ؠ;->ح:F

    invoke-virtual {v0, v7, v1}, Lٹ؅ڟ؀ە/ؠ;->ء(FZ)V

    iget-object v1, v0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    goto :goto_5

    :cond_8
    move v1, v7

    :goto_5
    iget-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    if-eqz v4, :cond_9

    iget v15, v0, Lٹ؅ڟ؀ە/ؠ;->ٺ:I

    if-le v15, v14, :cond_9

    invoke-virtual {v4}, Landroid/text/Layout;->getWidth()I

    move-result v4

    int-to-float v4, v4

    goto :goto_6

    :cond_9
    iget-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    if-eqz v4, :cond_a

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v15

    invoke-virtual {v5, v4, v6, v15}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v4

    goto :goto_6

    :cond_a
    move v4, v7

    :goto_6
    iget-object v6, v0, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    if-eqz v6, :cond_b

    invoke-virtual {v6}, Landroid/text/StaticLayout;->getLineCount()I

    :cond_b
    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    iget-boolean v15, v0, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    invoke-static {v6, v15}, Landroidx/core/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v6

    and-int/lit8 v15, v6, 0x70

    iget-object v7, v0, Lٹ؅ڟ؀ە/ؠ;->ء:Landroid/graphics/Rect;

    if-eq v15, v11, :cond_d

    if-eq v15, v10, :cond_c

    div-float/2addr v1, v12

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v10, v1

    iput v10, v0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    goto :goto_8

    :cond_c
    iget v10, v7, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v10

    sub-float/2addr v10, v1

    invoke-virtual {v5}, Landroid/graphics/Paint;->descent()F

    move-result v1

    add-float/2addr v1, v10

    goto :goto_7

    :cond_d
    iget v1, v7, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    :goto_7
    iput v1, v0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    :goto_8
    and-int v1, v6, v8

    if-eq v1, v14, :cond_f

    if-eq v1, v13, :cond_e

    iget v1, v7, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    goto :goto_a

    :cond_e
    iget v1, v7, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    goto :goto_9

    :cond_f
    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v4, v12

    :goto_9
    sub-float/2addr v1, v4

    :goto_a
    iput v1, v0, Lٹ؅ڟ؀ە/ؠ;->ج:F

    iget-object v1, v0, Lٹ؅ڟ؀ە/ؠ;->ؽ:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    if-eqz v1, :cond_10

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->ؽ:Landroid/graphics/Bitmap;

    :cond_10
    iget v1, v0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    invoke-virtual {v0, v1}, Lٹ؅ڟ؀ە/ؠ;->ت(F)V

    iget v1, v0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    iget v6, v7, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    iget v8, v9, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    iget-object v10, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v8, v1, v10}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iget-object v8, v0, Lٹ؅ڟ؀ە/ؠ;->أ:Landroid/graphics/RectF;

    iput v6, v8, Landroid/graphics/RectF;->left:F

    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    iget v10, v0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    iget-object v11, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v10, v1, v11}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iput v6, v8, Landroid/graphics/RectF;->top:F

    iget v6, v7, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    iget v10, v9, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    iget-object v11, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v10, v1, v11}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iput v6, v8, Landroid/graphics/RectF;->right:F

    iget v6, v7, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    iget v7, v9, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    iget-object v9, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v7, v1, v9}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iput v6, v8, Landroid/graphics/RectF;->bottom:F

    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ج:F

    iget v7, v0, Lٹ؅ڟ؀ە/ؠ;->ح:F

    iget-object v8, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v7, v1, v8}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iput v6, v0, Lٹ؅ڟ؀ە/ؠ;->خ:F

    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    iget v7, v0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    iget-object v8, v0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v6, v7, v1, v8}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    iput v6, v0, Lٹ؅ڟ؀ە/ؠ;->د:F

    invoke-virtual {v0, v1}, Lٹ؅ڟ؀ە/ؠ;->ت(F)V

    sub-float v6, v3, v1

    sget-object v7, Lؿ١ڔظۇٟؗٞ/؋;->ؠ:Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    const/4 v8, 0x0

    invoke-static {v8, v3, v6, v7}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v6

    sub-float v6, v3, v6

    iput v6, v0, Lٹ؅ڟ؀ە/ؠ;->ٷ:F

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    invoke-static {v3, v8, v1, v7}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v0, Lٹ؅ڟ؀ە/ؠ;->ٸ:F

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    iget-object v3, v0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    iget-object v6, v0, Lٹ؅ڟ؀ە/ؠ;->ب:Landroid/content/res/ColorStateList;

    if-eq v3, v6, :cond_11

    invoke-virtual {v0, v6}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v3

    iget-object v6, v0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v6}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v6

    invoke-static {v3, v6, v1}, Lٹ؅ڟ؀ە/ؠ;->؋(IIF)I

    move-result v3

    goto :goto_b

    :cond_11
    invoke-virtual {v0, v3}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v3

    :goto_b
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget v3, v0, Lٹ؅ڟ؀ە/ؠ;->ٲ:F

    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    cmpl-float v8, v3, v6

    if-eqz v8, :cond_12

    invoke-static {v6, v3, v1, v7}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    :cond_12
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    iget v3, v0, Lٹ؅ڟ؀ە/ؠ;->ي:F

    const/4 v6, 0x0

    invoke-static {v6, v3, v1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v0, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v3, v0, Lٹ؅ڟ؀ە/ؠ;->ٮ:F

    invoke-static {v6, v3, v1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v0, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v3, v0, Lٹ؅ڟ؀ە/ؠ;->ٯ:F

    invoke-static {v6, v3, v1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v0, Lٹ؅ڟ؀ە/ؠ;->ق:F

    invoke-virtual {v0, v4}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v3

    iget-object v4, v0, Lٹ؅ڟ؀ە/ؠ;->ٱ:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v4}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v4

    invoke-static {v3, v4, v1}, Lٹ؅ڟ؀ە/ؠ;->؋(IIF)I

    move-result v1

    iput v1, v0, Lٹ؅ڟ؀ە/ؠ;->ك:I

    iget v3, v0, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v4, v0, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v6, v0, Lٹ؅ڟ؀ە/ؠ;->ق:F

    invoke-virtual {v5, v3, v4, v6, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_13
    return-void
.end method

.method public final ا(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ب:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    :cond_0
    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ب:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_1
    return-void
.end method

.method public final ب(Landroid/graphics/Typeface;)Z
    .locals 2

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ط:Lٹۧ٥ؐح/؋;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iput-boolean v1, v0, Lٹۧ٥ؐح/؋;->ء:Z

    :cond_0
    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->ز:Landroid/graphics/Typeface;

    if-eq v0, p1, :cond_2

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ز:Landroid/graphics/Typeface;

    iget-object v0, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-static {v0, p1}, Lٹۧ٥ؐح/ئ;->؋(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ر:Landroid/graphics/Typeface;

    if-nez p1, :cond_1

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ز:Landroid/graphics/Typeface;

    :cond_1
    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ذ:Landroid/graphics/Typeface;

    return v1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public final ة(F)V
    .locals 8

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1}, Landroidx/core/math/MathUtils;->clamp(FFF)F

    move-result p1

    iget v2, p0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    cmpl-float v2, p1, v2

    if-eqz v2, :cond_2

    iput p1, p0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    iget-object v2, p0, Lٹ؅ڟ؀ە/ؠ;->ء:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    iget-object v6, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v3, v5, p1, v6}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iget-object v5, p0, Lٹ؅ڟ؀ە/ؠ;->أ:Landroid/graphics/RectF;

    iput v3, v5, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    iget v6, p0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    iget-object v7, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v3, v6, p1, v7}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v5, Landroid/graphics/RectF;->top:F

    iget v3, v2, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    iget v6, v4, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    iget-object v7, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v3, v6, p1, v7}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iput v3, v5, Landroid/graphics/RectF;->right:F

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iget v3, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v2, v3, p1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v2

    iput v2, v5, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Lٹ؅ڟ؀ە/ؠ;->ج:F

    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ح:F

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v2, v3, p1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v2

    iput v2, p0, Lٹ؅ڟ؀ە/ؠ;->خ:F

    iget v2, p0, Lٹ؅ڟ؀ە/ؠ;->ت:F

    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ث:F

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-static {v2, v3, p1, v4}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v2

    iput v2, p0, Lٹ؅ڟ؀ە/ؠ;->د:F

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->ت(F)V

    sub-float v2, v1, p1

    sget-object v3, Lؿ١ڔظۇٟؗٞ/؋;->ؠ:Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    invoke-static {v0, v1, v2, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v2

    sub-float v2, v1, v2

    iput v2, p0, Lٹ؅ڟ؀ە/ؠ;->ٷ:F

    iget-object v2, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    invoke-static {v1, v0, p1, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٸ:F

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->ب:Landroid/content/res/ColorStateList;

    iget-object v5, p0, Lٹ؅ڟ؀ە/ؠ;->ن:Landroid/text/TextPaint;

    if-eq v1, v4, :cond_0

    invoke-virtual {p0, v4}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v1

    iget-object v4, p0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v4}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v4

    invoke-static {v1, v4, p1}, Lٹ؅ڟ؀ە/ؠ;->؋(IIF)I

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v1}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v1

    :goto_0
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٲ:F

    iget v4, p0, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    cmpl-float v6, v1, v4

    if-eqz v6, :cond_1

    invoke-static {v4, v1, p1, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    :cond_1
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ي:F

    const/4 v3, 0x0

    invoke-static {v0, v1, p1, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, p0, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٮ:F

    invoke-static {v0, v1, p1, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, p0, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٯ:F

    invoke-static {v0, v1, p1, v3}, Lٹ؅ڟ؀ە/ؠ;->ؤ(FFFLandroid/animation/TimeInterpolator;)F

    move-result v0

    iput v0, p0, Lٹ؅ڟ؀ە/ؠ;->ق:F

    invoke-virtual {p0, v3}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v0

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ٱ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-static {v0, v1, p1}, Lٹ؅ڟ؀ە/ؠ;->؋(IIF)I

    move-result p1

    iput p1, p0, Lٹ؅ڟ؀ە/ؠ;->ك:I

    iget v0, p0, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v1, p0, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v3, p0, Lٹ؅ڟ؀ە/ؠ;->ق:F

    invoke-virtual {v5, v0, v1, v3, p1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_2
    return-void
.end method

.method public final ت(F)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lٹ؅ڟ؀ە/ؠ;->ء(FZ)V

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-static {p1}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    return-void
.end method

.method public final ث(Landroid/graphics/Typeface;)V
    .locals 3

    invoke-virtual {p0, p1}, Lٹ؅ڟ؀ە/ؠ;->ب(Landroid/graphics/Typeface;)Z

    move-result v0

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->ص:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    if-eq v1, p1, :cond_1

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ص:Landroid/graphics/Typeface;

    iget-object v1, p0, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-static {v1, p1}, Lٹۧ٥ؐح/ئ;->؋(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ش:Landroid/graphics/Typeface;

    if-nez p1, :cond_0

    iget-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->ص:Landroid/graphics/Typeface;

    :cond_0
    iput-object p1, p0, Lٹ؅ڟ؀ە/ؠ;->س:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    move p1, v2

    :goto_0
    if-nez v0, :cond_2

    if-eqz p1, :cond_3

    :cond_2
    invoke-virtual {p0, v2}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_3
    return-void
.end method
