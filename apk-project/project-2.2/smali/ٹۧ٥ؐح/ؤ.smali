.class public final Lٹۧ٥ؐح/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/content/res/ColorStateList;

.field public final ؠ:Ljava/lang/String;

.field public final ء:I

.field public final آ:I

.field public final أ:F

.field public final ؤ:F

.field public final إ:F

.field public final ئ:Z

.field public final ا:F

.field public ب:Landroid/content/res/ColorStateList;

.field public ة:F

.field public final ت:I

.field public ث:Z

.field public ج:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    sget-object v1, Lؾٿټڷ/؋;->ط:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->ة:F

    const/4 v3, 0x3

    invoke-static {p1, v1, v3}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lٹۧ٥ؐح/ؤ;->ب:Landroid/content/res/ColorStateList;

    const/4 v3, 0x4

    invoke-static {p1, v1, v3}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    const/4 v3, 0x5

    invoke-static {p1, v1, v3}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->ء:I

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->آ:I

    const/16 v3, 0xc

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    const/16 v3, 0xa

    :goto_0
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    iput v4, p0, Lٹۧ٥ؐح/ؤ;->ت:I

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lٹۧ٥ؐح/ؤ;->ؠ:Ljava/lang/String;

    const/16 v3, 0xe

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    const/4 v3, 0x6

    invoke-static {p1, v1, v3}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lٹۧ٥ؐح/ؤ;->؋:Landroid/content/res/ColorStateList;

    const/4 v3, 0x7

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->أ:F

    const/16 v3, 0x8

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->ؤ:F

    const/16 v3, 0x9

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Lٹۧ٥ؐح/ؤ;->إ:F

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    sget-object v1, Lؾٿټڷ/؋;->د:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    iput-boolean p2, p0, Lٹۧ٥ؐح/ؤ;->ئ:Z

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lٹۧ٥ؐح/ؤ;->ا:F

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final ؋()V
    .locals 3

    iget-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    iget v1, p0, Lٹۧ٥ؐح/ؤ;->ء:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lٹۧ٥ؐح/ؤ;->ؠ:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    :cond_0
    iget-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    if-nez v0, :cond_4

    const/4 v0, 0x1

    iget v2, p0, Lٹۧ٥ؐح/ؤ;->آ:I

    if-eq v2, v0, :cond_3

    const/4 v0, 0x2

    if-eq v2, v0, :cond_2

    const/4 v0, 0x3

    if-eq v2, v0, :cond_1

    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_1
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_2
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_3
    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    :goto_0
    iput-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    iget-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    :cond_4
    return-void
.end method

.method public final ؠ(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 2

    iget-boolean v0, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    if-eqz v0, :cond_0

    iget-object p1, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    return-object p1

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-nez v0, :cond_1

    :try_start_0
    iget v0, p0, Lٹۧ٥ؐح/ؤ;->ت:I

    invoke-static {p1, v0}, Landroidx/core/content/res/ResourcesCompat;->getFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    if-eqz p1, :cond_1

    iget v0, p0, Lٹۧ٥ؐح/ؤ;->ء:I

    invoke-static {p1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error loading font "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lٹۧ٥ؐح/ؤ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TextAppearance"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_1
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lٹۧ٥ؐح/ؤ;->؋()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    iget-object p1, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    return-object p1
.end method

.method public final ء(Landroid/content/Context;Lٹۧ٥ؐح/إ;)V
    .locals 4

    const/4 v0, 0x0

    iget v1, p0, Lٹۧ٥ؐح/ؤ;->ت:I

    if-eqz v1, :cond_0

    invoke-static {p1, v1}, Landroidx/core/content/res/ResourcesCompat;->getCachedFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    const/4 v3, 0x1

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_2

    invoke-virtual {p0, p1}, Lٹۧ٥ؐح/ؤ;->ؠ(Landroid/content/Context;)Landroid/graphics/Typeface;

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lٹۧ٥ؐح/ؤ;->؋()V

    :goto_2
    if-nez v1, :cond_3

    iput-boolean v3, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    :cond_3
    iget-boolean v2, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    if-eqz v2, :cond_4

    iget-object p1, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    invoke-virtual {p2, p1, v3}, Lٹۧ٥ؐح/إ;->ؠ(Landroid/graphics/Typeface;Z)V

    return-void

    :cond_4
    :try_start_0
    new-instance v2, Lٹۧ٥ؐح/آ;

    invoke-direct {v2, p0, p2}, Lٹۧ٥ؐح/آ;-><init>(Lٹۧ٥ؐح/ؤ;Lٹۧ٥ؐح/إ;)V

    invoke-static {p1, v1, v2, v0}, Landroidx/core/content/res/ResourcesCompat;->getFont(Landroid/content/Context;ILandroidx/core/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error loading font "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lٹۧ٥ؐح/ؤ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TextAppearance"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-boolean v3, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    const/4 p1, -0x3

    invoke-virtual {p2, p1}, Lٹۧ٥ؐح/إ;->؋(I)V

    goto :goto_3

    :catch_1
    iput-boolean v3, p0, Lٹۧ٥ؐح/ؤ;->ث:Z

    invoke-virtual {p2, v3}, Lٹۧ٥ؐح/إ;->؋(I)V

    :goto_3
    return-void
.end method

.method public final آ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V
    .locals 2

    invoke-virtual {p0, p1, p2, p3}, Lٹۧ٥ؐح/ؤ;->أ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    iget-object p1, p0, Lٹۧ٥ؐح/ؤ;->ب:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_0

    iget-object p3, p2, Landroid/text/TextPaint;->drawableState:[I

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1, p3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    goto :goto_0

    :cond_0
    const/high16 p1, -0x1000000

    :goto_0
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lٹۧ٥ؐح/ؤ;->؋:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_1

    iget-object p3, p2, Landroid/text/TextPaint;->drawableState:[I

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1, p3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iget p3, p0, Lٹۧ٥ؐح/ؤ;->إ:F

    iget v0, p0, Lٹۧ٥ؐح/ؤ;->أ:F

    iget v1, p0, Lٹۧ٥ؐح/ؤ;->ؤ:F

    invoke-virtual {p2, p3, v0, v1, p1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    return-void
.end method

.method public final أ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V
    .locals 1

    iget v0, p0, Lٹۧ٥ؐح/ؤ;->ت:I

    if-eqz v0, :cond_0

    invoke-static {p1, v0}, Landroidx/core/content/res/ResourcesCompat;->getCachedFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lٹۧ٥ؐح/ؤ;->ؠ(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lٹۧ٥ؐح/ؤ;->ؤ(Landroid/content/Context;Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lٹۧ٥ؐح/ؤ;->؋()V

    iget-object v0, p0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    invoke-virtual {p0, p1, p2, v0}, Lٹۧ٥ؐح/ؤ;->ؤ(Landroid/content/Context;Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    new-instance v0, Lٹۧ٥ؐح/أ;

    invoke-direct {v0, p0, p1, p2, p3}, Lٹۧ٥ؐح/أ;-><init>(Lٹۧ٥ؐح/ؤ;Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    invoke-virtual {p0, p1, v0}, Lٹۧ٥ؐح/ؤ;->ء(Landroid/content/Context;Lٹۧ٥ؐح/إ;)V

    :goto_2
    return-void
.end method

.method public final ؤ(Landroid/content/Context;Landroid/text/TextPaint;Landroid/graphics/Typeface;)V
    .locals 0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-static {p1, p3}, Lٹۧ٥ؐح/ئ;->؋(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object p1

    if-eqz p1, :cond_0

    move-object p3, p1

    :cond_0
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-virtual {p3}, Landroid/graphics/Typeface;->getStyle()I

    move-result p1

    not-int p1, p1

    iget p3, p0, Lٹۧ٥ؐح/ؤ;->ء:I

    and-int/2addr p1, p3

    and-int/lit8 p3, p1, 0x1

    if-eqz p3, :cond_1

    const/4 p3, 0x1

    goto :goto_0

    :cond_1
    const/4 p3, 0x0

    :goto_0
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_2

    const/high16 p1, -0x41800000    # -0.25f

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSkewX(F)V

    iget p1, p0, Lٹۧ٥ؐح/ؤ;->ة:F

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-boolean p1, p0, Lٹۧ٥ؐح/ؤ;->ئ:Z

    if-eqz p1, :cond_3

    iget p1, p0, Lٹۧ٥ؐح/ؤ;->ا:F

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    :cond_3
    return-void
.end method
