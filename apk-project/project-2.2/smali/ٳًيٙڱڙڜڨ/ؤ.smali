.class public final Lٳًيٙڱڙڜڨ/ؤ;
.super Lٽچڃ/إ;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;
.implements Lٹ؅ڟ؀ە/ئ;


# static fields
.field public static final ڗ:[I

.field public static final ژ:Landroid/graphics/drawable/ShapeDrawable;


# instance fields
.field public ض:Landroid/content/res/ColorStateList;

.field public ط:Landroid/content/res/ColorStateList;

.field public ظ:F

.field public ع:F

.field public غ:Landroid/content/res/ColorStateList;

.field public ػ:F

.field public ؼ:Landroid/content/res/ColorStateList;

.field public ؽ:Ljava/lang/CharSequence;

.field public ؾ:Z

.field public ؿ:Landroid/graphics/drawable/Drawable;

.field public ـ:Landroid/content/res/ColorStateList;

.field public ف:F

.field public ق:Z

.field public ك:Z

.field public ل:Landroid/graphics/drawable/Drawable;

.field public م:Landroid/graphics/drawable/RippleDrawable;

.field public ن:Landroid/content/res/ColorStateList;

.field public ه:F

.field public و:Ljava/lang/CharSequence;

.field public ى:Z

.field public ي:Z

.field public ٮ:Landroid/graphics/drawable/Drawable;

.field public ٯ:Landroid/content/res/ColorStateList;

.field public ٱ:Lؿ١ڔظۇٟؗٞ/ء;

.field public ٲ:Lؿ١ڔظۇٟؗٞ/ء;

.field public ٳ:F

.field public ٴ:F

.field public ٵ:F

.field public ٶ:F

.field public ٷ:F

.field public ٸ:F

.field public ٹ:F

.field public ٺ:F

.field public final ٻ:Landroid/content/Context;

.field public final ټ:Landroid/graphics/Paint;

.field public final ٽ:Landroid/graphics/Paint$FontMetrics;

.field public final پ:Landroid/graphics/RectF;

.field public final ٿ:Landroid/graphics/PointF;

.field public final ڀ:Landroid/graphics/Path;

.field public final ځ:Lٹ؅ڟ؀ە/ا;

.field public ڂ:I

.field public ڃ:I

.field public ڄ:I

.field public څ:I

.field public چ:I

.field public ڇ:I

.field public ڈ:Z

.field public ډ:I

.field public ڊ:I

.field public ڋ:Landroid/graphics/ColorFilter;

.field public ڌ:Landroid/graphics/PorterDuffColorFilter;

.field public ڍ:Landroid/content/res/ColorStateList;

.field public ڎ:Landroid/graphics/PorterDuff$Mode;

.field public ڏ:[I

.field public ڐ:Z

.field public ڑ:Landroid/content/res/ColorStateList;

.field public ڒ:Ljava/lang/ref/WeakReference;

.field public ړ:Landroid/text/TextUtils$TruncateAt;

.field public ڔ:Z

.field public ڕ:I

.field public ږ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const v0, 0x101009e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lٳًيٙڱڙڜڨ/ؤ;->ڗ:[I

    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    sput-object v0, Lٳًيٙڱڙڜڨ/ؤ;->ژ:Landroid/graphics/drawable/ShapeDrawable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const v0, 0x7f0300d1

    const v1, 0x7f110407

    invoke-direct {p0, p1, p2, v0, v1}, Lٽچڃ/إ;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/high16 p2, -0x40800000    # -1.0f

    iput p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    new-instance p2, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ټ:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {p2}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٽ:Landroid/graphics/Paint$FontMetrics;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->پ:Landroid/graphics/RectF;

    new-instance p2, Landroid/graphics/PointF;

    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٿ:Landroid/graphics/PointF;

    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڀ:Landroid/graphics/Path;

    const/16 p2, 0xff

    iput p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڎ:Landroid/graphics/PorterDuff$Mode;

    new-instance p2, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {p2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڒ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->ئ(Landroid/content/Context;)V

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    new-instance p2, Lٹ؅ڟ؀ە/ا;

    invoke-direct {p2, p0}, Lٹ؅ڟ؀ە/ا;-><init>(Lٹ؅ڟ؀ە/ئ;)V

    iput-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    const-string v1, ""

    iput-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    iget-object p2, p2, Lٹ؅ڟ؀ە/ا;->؋:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    iput p1, p2, Landroid/text/TextPaint;->density:F

    sget-object p1, Lٳًيٙڱڙڜڨ/ؤ;->ڗ:[I

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object p2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-static {p2, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p2

    if-nez p2, :cond_0

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p2

    invoke-virtual {p0, p2, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ش([I[I)Z

    :cond_0
    iput-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڔ:Z

    sget-object p1, Lٺپر/؋;->؋:[I

    sget-object p1, Lٳًيٙڱڙڜڨ/ؤ;->ژ:Landroid/graphics/drawable/ShapeDrawable;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-void
.end method

.method public static ر(Landroid/content/res/ColorStateList;)Z
    .locals 0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static ز(Landroid/graphics/drawable/Drawable;)Z
    .locals 0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static ٱ(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .locals 23

    move-object/from16 v6, p0

    move-object/from16 v14, p1

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v15

    invoke-virtual {v15}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_19

    iget v5, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    if-nez v5, :cond_0

    goto/16 :goto_b

    :cond_0
    const/16 v13, 0xff

    const/4 v12, 0x0

    if-ge v5, v13, :cond_1

    iget v0, v15, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget v0, v15, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget v0, v15, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget v0, v15, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFI)I

    move-result v0

    move v11, v0

    goto :goto_0

    :cond_1
    move v11, v12

    :goto_0
    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ټ:Landroid/graphics/Paint;

    iget-object v10, v6, Lٳًيٙڱڙڜڨ/ؤ;->پ:Landroid/graphics/RectF;

    if-nez v0, :cond_2

    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڂ:I

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v10, v15}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v1

    invoke-virtual {v14, v10, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_2
    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-nez v0, :cond_4

    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڃ:I

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڋ:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڌ:Landroid/graphics/PorterDuffColorFilter;

    :goto_1
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v10, v15}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v1

    invoke-virtual {v14, v10, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_4
    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_5

    invoke-super/range {p0 .. p1}, Lٽچڃ/إ;->draw(Landroid/graphics/Canvas;)V

    :cond_5
    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    const/4 v7, 0x0

    cmpl-float v0, v0, v7

    const/high16 v16, 0x40000000    # 2.0f

    if-lez v0, :cond_8

    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-nez v0, :cond_8

    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->څ:I

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-nez v0, :cond_7

    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڋ:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_6

    goto :goto_2

    :cond_6
    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڌ:Landroid/graphics/PorterDuffColorFilter;

    :goto_2
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    :cond_7
    iget v0, v15, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    div-float v1, v1, v16

    add-float/2addr v0, v1

    iget v3, v15, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float/2addr v3, v1

    iget v4, v15, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sub-float/2addr v4, v1

    iget v5, v15, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    sub-float/2addr v5, v1

    invoke-virtual {v10, v0, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    div-float v1, v1, v16

    sub-float/2addr v0, v1

    invoke-virtual {v14, v10, v0, v0, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :cond_8
    iget v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->چ:I

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v10, v15}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-nez v0, :cond_9

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v1

    invoke-virtual {v14, v10, v0, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_3

    :cond_9
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v15}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v3, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڀ:Landroid/graphics/Path;

    iget-object v1, v6, Lٽچڃ/إ;->ذ:Lٽچڃ/ت;

    iget-object v4, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v5, v4, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    iget v4, v4, Lٽچڃ/ؤ;->ب:F

    iget-object v8, v6, Lٽچڃ/إ;->د:Lئٱنۃؖۊڄئ/آ;

    move-object/from16 v17, v1

    move-object/from16 v18, v5

    move/from16 v19, v4

    move-object/from16 v20, v0

    move-object/from16 v21, v8

    move-object/from16 v22, v3

    invoke-virtual/range {v17 .. v22}, Lٽچڃ/ت;->؋(Lٽچڃ/ب;FLandroid/graphics/RectF;Lئٱنۃؖۊڄئ/آ;Landroid/graphics/Path;)V

    invoke-virtual/range {p0 .. p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v5

    iget-object v0, v6, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v4, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Lٽچڃ/إ;->أ(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Path;Lٽچڃ/ب;Landroid/graphics/RectF;)V

    :goto_3
    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {v6, v15, v10}, Lٳًيٙڱڙڜڨ/ؤ;->ح(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    iget v0, v10, Landroid/graphics/RectF;->left:F

    iget v1, v10, Landroid/graphics/RectF;->top:F

    invoke-virtual {v14, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v2, v12, v12, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v14}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-float v0, v0

    neg-float v1, v1

    invoke-virtual {v14, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_a
    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {v6, v15, v10}, Lٳًيٙڱڙڜڨ/ؤ;->ح(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    iget v0, v10, Landroid/graphics/RectF;->left:F

    iget v1, v10, Landroid/graphics/RectF;->top:F

    invoke-virtual {v14, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v2, v12, v12, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v14}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-float v0, v0

    neg-float v1, v1

    invoke-virtual {v14, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_b
    iget-boolean v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڔ:Z

    if-eqz v0, :cond_14

    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    if-eqz v0, :cond_14

    iget-object v0, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٿ:Landroid/graphics/PointF;

    invoke-virtual {v0, v7, v7}, Landroid/graphics/PointF;->set(FF)V

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    iget-object v3, v6, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    if-eqz v2, :cond_d

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v2

    add-float/2addr v2, v1

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    add-float/2addr v2, v1

    invoke-static/range {p0 .. p0}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_c

    iget v1, v15, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    goto :goto_4

    :cond_c
    iget v1, v15, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    :goto_4
    invoke-virtual {v15}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    iget-object v4, v3, Lٹ؅ڟ؀ە/ا;->؋:Landroid/text/TextPaint;

    iget-object v5, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٽ:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    iget v4, v5, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget v5, v5, Landroid/graphics/Paint$FontMetrics;->ascent:F

    add-float/2addr v4, v5

    div-float v4, v4, v16

    sub-float/2addr v2, v4

    iput v2, v0, Landroid/graphics/PointF;->y:F

    :cond_d
    invoke-virtual {v10}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    if-eqz v2, :cond_f

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v4

    add-float/2addr v4, v2

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    add-float/2addr v4, v2

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->د()F

    move-result v5

    add-float/2addr v5, v2

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    add-float/2addr v5, v2

    invoke-static/range {p0 .. p0}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v2

    if-nez v2, :cond_e

    iget v2, v15, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v4

    iput v2, v10, Landroid/graphics/RectF;->left:F

    iget v2, v15, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    sub-float/2addr v2, v5

    goto :goto_5

    :cond_e
    iget v2, v15, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v5

    iput v2, v10, Landroid/graphics/RectF;->left:F

    iget v2, v15, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    sub-float/2addr v2, v4

    :goto_5
    iput v2, v10, Landroid/graphics/RectF;->right:F

    iget v2, v15, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iput v2, v10, Landroid/graphics/RectF;->top:F

    iget v2, v15, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iput v2, v10, Landroid/graphics/RectF;->bottom:F

    :cond_f
    iget-object v2, v3, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    iget-object v4, v3, Lٹ؅ڟ؀ە/ا;->؋:Landroid/text/TextPaint;

    if-eqz v2, :cond_10

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v2

    iput-object v2, v4, Landroid/text/TextPaint;->drawableState:[I

    iget-object v2, v3, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    iget-object v5, v3, Lٹ؅ڟ؀ە/ا;->ؠ:Lٳًيٙڱڙڜڨ/ؠ;

    iget-object v7, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v2, v7, v4, v5}, Lٹۧ٥ؐح/ؤ;->آ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    :cond_10
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lٹ؅ڟ؀ە/ا;->؋(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    if-le v1, v2, :cond_11

    const/4 v1, 0x1

    goto :goto_6

    :cond_11
    move v1, v12

    :goto_6
    if-eqz v1, :cond_12

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {v14, v10}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    goto :goto_7

    :cond_12
    move v2, v12

    :goto_7
    iget-object v3, v6, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    if-eqz v1, :cond_13

    iget-object v5, v6, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    if-eqz v5, :cond_13

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v7, v6, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v3, v4, v5, v7}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v3

    :cond_13
    move-object v8, v3

    const/4 v9, 0x0

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iget v5, v0, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move-object/from16 v7, p1

    move-object/from16 v17, v10

    move v10, v3

    move v3, v11

    move v11, v5

    move v5, v12

    move v12, v0

    move v0, v13

    move-object v13, v4

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    if-eqz v1, :cond_15

    invoke-virtual {v14, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_8

    :cond_14
    move-object/from16 v17, v10

    move v3, v11

    move v5, v12

    move v0, v13

    :cond_15
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->setEmpty()V

    invoke-virtual/range {p0 .. p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v1

    if-eqz v1, :cond_17

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    add-float/2addr v1, v2

    invoke-static/range {p0 .. p0}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v2

    if-nez v2, :cond_16

    iget v2, v15, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    sub-float/2addr v2, v1

    move-object/from16 v4, v17

    iput v2, v4, Landroid/graphics/RectF;->right:F

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    sub-float/2addr v2, v1

    iput v2, v4, Landroid/graphics/RectF;->left:F

    goto :goto_9

    :cond_16
    move-object/from16 v4, v17

    iget v2, v15, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v1

    iput v2, v4, Landroid/graphics/RectF;->left:F

    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    add-float/2addr v2, v1

    iput v2, v4, Landroid/graphics/RectF;->right:F

    :goto_9
    invoke-virtual {v15}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v1

    iget v2, v6, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    div-float v7, v2, v16

    sub-float/2addr v1, v7

    iput v1, v4, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, v2

    iput v1, v4, Landroid/graphics/RectF;->bottom:F

    goto :goto_a

    :cond_17
    move-object/from16 v4, v17

    :goto_a
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v2, v4, Landroid/graphics/RectF;->top:F

    invoke-virtual {v14, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v7, v6, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v8

    float-to-int v8, v8

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v7, v5, v5, v8, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    sget-object v4, Lٺپر/؋;->؋:[I

    iget-object v4, v6, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    iget-object v5, v6, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v4, v6, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    iget-object v4, v6, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v4, v14}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-float v1, v1

    neg-float v2, v2

    invoke-virtual {v14, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_18
    iget v1, v6, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    if-ge v1, v0, :cond_19

    invoke-virtual {v14, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_19
    :goto_b
    return-void
.end method

.method public final getAlpha()I
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    return v0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڋ:Landroid/graphics/ColorFilter;

    return-object v0
.end method

.method public final getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    float-to-int v0, v0

    return v0
.end method

.method public final getIntrinsicWidth()I
    .locals 3

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v1

    add-float/2addr v1, v0

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    add-float/2addr v1, v0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    invoke-virtual {v2, v0}, Lٹ؅ڟ؀ە/ا;->؋(Ljava/lang/String;)F

    move-result v0

    add-float/2addr v0, v1

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    add-float/2addr v0, v1

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->د()F

    move-result v1

    add-float/2addr v1, v0

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    add-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڕ:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public final getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .locals 8

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lٽچڃ/إ;->getOutline(Landroid/graphics/Outline;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->getIntrinsicWidth()I

    move-result v5

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    float-to-int v6, v0

    iget v7, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    :goto_0
    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/graphics/Outline;->setAlpha(F)V

    return-void
.end method

.method public final invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public final isStateful()Z
    .locals 3

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ض:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ر(Landroid/content/res/ColorStateList;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ر(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->غ:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ر(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڑ:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ر(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_0
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iget-object v0, v0, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lٹۧ٥ؐح/ؤ;->ب:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    if-nez v0, :cond_4

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ي:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-nez v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ر(Landroid/content/res/ColorStateList;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    move v1, v2

    :cond_4
    :goto_2
    return v1
.end method

.method public final onLayoutDirectionChanged(I)Z
    .locals 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onLayoutDirectionChanged(I)Z

    move-result v0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setLayoutDirection(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_0
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setLayoutDirection(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setLayoutDirection(Landroid/graphics/drawable/Drawable;I)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public final onLevelChange(I)Z
    .locals 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onLevelChange(I)Z

    move-result v0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_0
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_3
    return v0
.end method

.method public final onStateChange([I)Z
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_0
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-virtual {p0, p1, v0}, Lٳًيٙڱڙڜڨ/ؤ;->ش([I[I)Z

    move-result p1

    return p1
.end method

.method public final scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    :cond_0
    return-void
.end method

.method public final setAlpha(I)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڊ:I

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڋ:Landroid/graphics/ColorFilter;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڋ:Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_0
    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 3

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڎ:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, p1, :cond_2

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڎ:Landroid/graphics/PorterDuff$Mode;

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v1, v0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    :goto_1
    iput-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڌ:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_2
    return-void
.end method

.method public final setVisible(ZZ)Z
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_0
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_3
    return v0
.end method

.method public final unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final ج(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    invoke-static {p0}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    invoke-static {p1, v0}, Landroidx/core/graphics/drawable/DrawableCompat;->setLayoutDirection(Landroid/graphics/drawable/Drawable;I)Z

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_1
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ن:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void

    :cond_2
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_3

    iget-boolean v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ق:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ـ:Landroid/content/res/ColorStateList;

    invoke-static {v0, v1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_4
    return-void
.end method

.method public final ح(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .locals 5

    invoke-virtual {p2}, Landroid/graphics/RectF;->setEmpty()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_0
    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٴ:F

    add-float/2addr v0, v1

    iget-boolean v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    :goto_0
    iget v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    const/4 v3, 0x0

    cmpg-float v4, v2, v3

    if-gtz v4, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v2, v1

    :cond_2
    invoke-static {p0}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_3

    iget v1, p1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/RectF;->right:F

    goto :goto_1

    :cond_3
    iget v1, p1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/RectF;->left:F

    :goto_1
    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    :goto_2
    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    cmpg-float v2, v1, v3

    if-gtz v2, :cond_5

    if-eqz v0, :cond_5

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/16 v2, 0x18

    int-to-float v2, v2

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/4 v3, 0x1

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, v2, v1

    if-gtz v2, :cond_5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    goto :goto_3

    :cond_5
    move v0, v1

    :goto_3
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v0, v1

    sub-float/2addr p1, v1

    iput p1, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v0

    iput p1, p2, Landroid/graphics/RectF;->bottom:F

    :cond_6
    return-void
.end method

.method public final خ()F
    .locals 4

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٴ:F

    iget-boolean v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    :goto_1
    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    cmpg-float v1, v3, v1

    if-gtz v1, :cond_3

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v3, v1

    :cond_3
    add-float/2addr v3, v0

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٵ:F

    add-float/2addr v3, v0

    return v3
.end method

.method public final د()F
    .locals 2

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٸ:F

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    add-float/2addr v0, v1

    iget v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    add-float/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final ذ()F
    .locals 2

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    invoke-virtual {p0}, Lٽچڃ/إ;->إ()Landroid/graphics/RectF;

    move-result-object v1

    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    :goto_0
    return v0
.end method

.method public final س()V
    .locals 2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڒ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lٳًيٙڱڙڜڨ/أ;

    if-eqz v0, :cond_0

    check-cast v0, Lcom/google/android/material/chip/Chip;

    iget v1, v0, Lcom/google/android/material/chip/Chip;->ت:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/chip/Chip;->ء(I)V

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    invoke-virtual {v0}, Landroid/view/View;->invalidateOutline()V

    :cond_0
    return-void
.end method

.method public final ش([I[I)Z
    .locals 8

    invoke-super {p0, p1}, Lٽچڃ/إ;->onStateChange([I)Z

    move-result v0

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ض:Landroid/content/res/ColorStateList;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڂ:I

    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    invoke-virtual {p0, v1}, Lٽچڃ/إ;->ء(I)I

    move-result v1

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڂ:I

    const/4 v4, 0x1

    if-eq v3, v1, :cond_1

    iput v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڂ:I

    move v0, v4

    :cond_1
    iget-object v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_2

    iget v5, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڃ:I

    invoke-virtual {v3, p1, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    goto :goto_1

    :cond_2
    move v3, v2

    :goto_1
    invoke-virtual {p0, v3}, Lٽچڃ/إ;->ء(I)I

    move-result v3

    iget v5, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڃ:I

    if-eq v5, v3, :cond_3

    iput v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڃ:I

    move v0, v4

    :cond_3
    invoke-static {v3, v1}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result v1

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڄ:I

    if-eq v3, v1, :cond_4

    move v3, v4

    goto :goto_2

    :cond_4
    move v3, v2

    :goto_2
    iget-object v5, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v5, v5, Lٽچڃ/ؤ;->ء:Landroid/content/res/ColorStateList;

    if-nez v5, :cond_5

    move v5, v4

    goto :goto_3

    :cond_5
    move v5, v2

    :goto_3
    or-int/2addr v3, v5

    if-eqz v3, :cond_6

    iput v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڄ:I

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    move v0, v4

    :cond_6
    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->غ:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_7

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->څ:I

    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_4

    :cond_7
    move v1, v2

    :goto_4
    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->څ:I

    if-eq v3, v1, :cond_8

    iput v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->څ:I

    move v0, v4

    :cond_8
    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڑ:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_9

    invoke-static {p1}, Lٺپر/؋;->ؠ([I)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڑ:Landroid/content/res/ColorStateList;

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->چ:I

    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_5

    :cond_9
    move v1, v2

    :goto_5
    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->چ:I

    if-eq v3, v1, :cond_a

    iput v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->چ:I

    iget-boolean v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-eqz v1, :cond_a

    move v0, v4

    :cond_a
    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iget-object v1, v1, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    if-eqz v1, :cond_b

    iget-object v1, v1, Lٹۧ٥ؐح/ؤ;->ب:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_b

    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڇ:I

    invoke-virtual {v1, p1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_6

    :cond_b
    move v1, v2

    :goto_6
    iget v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڇ:I

    if-eq v3, v1, :cond_c

    iput v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڇ:I

    move v0, v4

    :cond_c
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    if-nez v1, :cond_d

    goto :goto_8

    :cond_d
    array-length v3, v1

    move v5, v2

    :goto_7
    if-ge v5, v3, :cond_f

    aget v6, v1, v5

    const v7, 0x10100a0

    if-ne v6, v7, :cond_e

    move v1, v4

    goto :goto_9

    :cond_e
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    :cond_f
    :goto_8
    move v1, v2

    :goto_9
    if-eqz v1, :cond_10

    iget-boolean v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v1, :cond_10

    move v1, v4

    goto :goto_a

    :cond_10
    move v1, v2

    :goto_a
    iget-boolean v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eq v3, v1, :cond_12

    iget-object v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_12

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    iput-boolean v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_11

    move v0, v4

    move v1, v0

    goto :goto_b

    :cond_11
    move v1, v2

    move v0, v4

    goto :goto_b

    :cond_12
    move v1, v2

    :goto_b
    iget-object v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_13

    iget v5, p0, Lٳًيٙڱڙڜڨ/ؤ;->ډ:I

    invoke-virtual {v3, p1, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    goto :goto_c

    :cond_13
    move v3, v2

    :goto_c
    iget v5, p0, Lٳًيٙڱڙڜڨ/ؤ;->ډ:I

    if-eq v5, v3, :cond_16

    iput v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ډ:I

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڍ:Landroid/content/res/ColorStateList;

    iget-object v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڎ:Landroid/graphics/PorterDuff$Mode;

    if-eqz v0, :cond_15

    if-nez v3, :cond_14

    goto :goto_d

    :cond_14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v5

    invoke-virtual {v0, v5, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    new-instance v5, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v5, v0, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_e

    :cond_15
    :goto_d
    const/4 v5, 0x0

    :goto_e
    iput-object v5, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڌ:Landroid/graphics/PorterDuffColorFilter;

    goto :goto_f

    :cond_16
    move v4, v0

    :goto_f
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v4, v0

    :cond_17
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v4, v0

    :cond_18
    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_19

    array-length v0, p1

    array-length v3, p2

    add-int/2addr v0, v3

    new-array v0, v0, [I

    array-length v3, p1

    invoke-static {p1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length p1, p1

    array-length v3, p2

    invoke-static {p2, v2, v0, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    or-int/2addr v4, p1

    :cond_19
    sget-object p1, Lٺپر/؋;->؋:[I

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p1}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    or-int/2addr v4, p1

    :cond_1a
    if-eqz v4, :cond_1b

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_1b
    if-eqz v1, :cond_1c

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_1c
    return v4
.end method

.method public final ص(Z)V
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    :cond_0
    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_1
    return-void
.end method

.method public final ض(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {v1}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ط(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٯ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_2

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٯ:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ي:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_2
    return-void
.end method

.method public final ظ(Z)V
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ي:Z

    if-eq v0, p1, :cond_2

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result v0

    iput-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ي:Z

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ي()Z

    move-result p1

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    :goto_1
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_2
    return-void
.end method

.method public final ع(F)V
    .locals 2

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ع:F

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lآۋۻؾ۹/ئ;

    invoke-direct {v1, v0}, Lآۋۻؾ۹/ئ;-><init>(Lٽچڃ/ب;)V

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    new-instance p1, Lٽچڃ/ب;

    invoke-direct {p1, v1}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    invoke-virtual {p0, p1}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_0
    return-void
.end method

.method public final غ(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eq v0, p1, :cond_3

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v2

    if-eqz p1, :cond_1

    invoke-static {p1}, Landroidx/core/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_1
    iput-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v2, p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_3
    return-void
.end method

.method public final ػ(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ؼ(Landroid/content/res/ColorStateList;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ق:Z

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ـ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ـ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_1
    return-void
.end method

.method public final ؽ(Z)V
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؾ:Z

    if-eq v0, p1, :cond_2

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result v0

    iput-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؾ:Z

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٮ()Z

    move-result p1

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    :goto_1
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_2
    return-void
.end method

.method public final ؾ(Landroid/content/res/ColorStateList;)V
    .locals 2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->غ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->غ:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v1, v0, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_1
    return-void
.end method

.method public final ؿ(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ټ:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput p1, v0, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_0
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_1
    return-void
.end method

.method public final ـ(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eq v0, p1, :cond_3

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->د()F

    move-result v2

    if-eqz p1, :cond_1

    invoke-static {p1}, Landroidx/core/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_1
    iput-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    sget-object p1, Lٺپر/؋;->؋:[I

    new-instance p1, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؼ:Landroid/content/res/ColorStateList;

    invoke-static {v1}, Lٺپر/؋;->؋(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v3, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    sget-object v4, Lٳًيٙڱڙڜڨ/ؤ;->ژ:Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {p1, v1, v3, v4}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->م:Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->د()F

    move-result p1

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v2, p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_3
    return-void
.end method

.method public final ف(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ق(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ك(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٸ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٸ:F

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ل(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ن:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ن:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_1
    return-void
.end method

.method public final م(Z)V
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ك:Z

    if-eq v0, p1, :cond_2

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v0

    iput-boolean p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ك:Z

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result p1

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ج(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lٳًيٙڱڙڜڨ/ؤ;->ٱ(Landroid/graphics/drawable/Drawable;)V

    :goto_1
    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_2
    return-void
.end method

.method public final ن(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٵ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٵ:F

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ه(F)V
    .locals 1

    iget v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٴ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v0

    iput p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٴ:F

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result p1

    invoke-virtual {p0}, Lٽچڃ/إ;->invalidateSelf()V

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final و(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؼ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؼ:Landroid/content/res/ColorStateList;

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lٺپر/؋;->؋(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڑ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_1
    return-void
.end method

.method public final ى(Lٹۧ٥ؐح/ؤ;)V
    .locals 5

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iget-object v1, v0, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    if-eq v1, p1, :cond_2

    iput-object p1, v0, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    if-eqz p1, :cond_1

    iget-object v1, v0, Lٹ؅ڟ؀ە/ا;->؋:Landroid/text/TextPaint;

    iget-object v2, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    iget-object v3, v0, Lٹ؅ڟ؀ە/ا;->ؠ:Lٳًيٙڱڙڜڨ/ؠ;

    invoke-virtual {p1, v2, v1, v3}, Lٹۧ٥ؐح/ؤ;->أ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    iget-object v4, v0, Lٹ؅ڟ؀ە/ا;->أ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lٹ؅ڟ؀ە/ئ;

    if-eqz v4, :cond_0

    invoke-interface {v4}, Lٹ؅ڟ؀ە/ئ;->getState()[I

    move-result-object v4

    iput-object v4, v1, Landroid/text/TextPaint;->drawableState:[I

    :cond_0
    invoke-virtual {p1, v2, v1, v3}, Lٹۧ٥ؐح/ؤ;->آ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    const/4 p1, 0x1

    iput-boolean p1, v0, Lٹ؅ڟ؀ە/ا;->آ:Z

    :cond_1
    iget-object p1, v0, Lٹ؅ڟ؀ە/ا;->أ:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lٹ؅ڟ؀ە/ئ;

    if-eqz p1, :cond_2

    move-object v0, p1

    check-cast v0, Lٳًيٙڱڙڜڨ/ؤ;

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-interface {p1}, Lٹ؅ڟ؀ە/ئ;->getState()[I

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_2
    return-void
.end method

.method public final ي()Z
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ي:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ڈ:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ٮ()Z
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؾ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ٯ()Z
    .locals 1

    iget-boolean v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ك:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
