.class public Lcom/google/android/material/chip/Chip;
.super Landroidx/appcompat/widget/AppCompatCheckBox;
.source "SourceFile"

# interfaces
.implements Lٳًيٙڱڙڜڨ/أ;
.implements Lٽچڃ/س;
.implements Landroid/widget/Checkable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/appcompat/widget/AppCompatCheckBox;",
        "L\u0673\u064b\u064a\u0659\u06b1\u0699\u069c\u06a8/\u0623;",
        "L\u067d\u0686\u0683/\u0633;",
        "Landroid/widget/Checkable;"
    }
.end annotation


# static fields
.field public static final ر:Landroid/graphics/Rect;

.field public static final ز:[I

.field public static final س:[I


# instance fields
.field public ؋:Lٳًيٙڱڙڜڨ/ؤ;

.field public ؠ:Landroid/graphics/drawable/InsetDrawable;

.field public ء:Landroid/graphics/drawable/RippleDrawable;

.field public آ:Landroid/view/View$OnClickListener;

.field public أ:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field public ؤ:Z

.field public إ:Z

.field public ئ:Z

.field public ا:Z

.field public ب:Z

.field public ة:I

.field public ت:I

.field public ث:Ljava/lang/CharSequence;

.field public final ج:Lٳًيٙڱڙڜڨ/آ;

.field public ح:Z

.field public final خ:Landroid/graphics/Rect;

.field public final د:Landroid/graphics/RectF;

.field public final ذ:Lٳًيٙڱڙڜڨ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/google/android/material/chip/Chip;->ر:Landroid/graphics/Rect;

    const v0, 0x10100a1

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/google/android/material/chip/Chip;->ز:[I

    const v0, 0x101009f

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/google/android/material/chip/Chip;->س:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/chip/Chip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    const p3, 0x7f110407

    const v0, 0x7f0300d1

    invoke-static {p1, p2, v0, p3}, Lڗًقڔ/؋;->ڌ(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->خ:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->د:Landroid/graphics/RectF;

    new-instance p1, Lٳًيٙڱڙڜڨ/ؠ;

    const/4 p3, 0x0

    invoke-direct {p1, p3, p0}, Lٳًيٙڱڙڜڨ/ؠ;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->ذ:Lٳًيٙڱڙڜڨ/ؠ;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v6, 0x800013

    const/4 v7, 0x1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "background"

    const-string v1, "http://schemas.android.com/apk/res/android"

    invoke-interface {p2, v1, v0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Chip"

    if-eqz v0, :cond_1

    const-string v0, "Do not set the background; Chip manages its own background drawable."

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    const-string v0, "drawableLeft"

    invoke-interface {p2, v1, v0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1f

    const-string v0, "drawableStart"

    invoke-interface {p2, v1, v0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    const-string v0, "drawableEnd"

    invoke-interface {p2, v1, v0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Please set end drawable using R.attr#closeIcon."

    if-nez v0, :cond_1d

    const-string v0, "drawableRight"

    invoke-interface {p2, v1, v0}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1c

    const-string v0, "singleLine"

    invoke-interface {p2, v1, v0, v7}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "lines"

    invoke-interface {p2, v1, v0, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v7, :cond_1b

    const-string v0, "minLines"

    invoke-interface {p2, v1, v0, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v7, :cond_1b

    const-string v0, "maxLines"

    invoke-interface {p2, v1, v0, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v7, :cond_1b

    const-string v0, "gravity"

    invoke-interface {p2, v1, v0, v6}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v6, :cond_2

    const-string v0, "Chip text must be vertically center and start aligned"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    new-instance v8, Lٳًيٙڱڙڜڨ/ؤ;

    invoke-direct {v8, p1, p2}, Lٳًيٙڱڙڜڨ/ؤ;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iget-object v0, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    sget-object v9, Lؾٿټڷ/؋;->ء:[I

    new-array v5, p3, [I

    const v4, 0x7f110407

    const v3, 0x7f0300d1

    move-object v1, p2

    move-object v2, v9

    invoke-static/range {v0 .. v5}, Lٹ؅ڟ؀ە/ة;->آ(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/16 v10, 0x25

    invoke-virtual {v0, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    iput-boolean v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ږ:Z

    iget-object v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    const/16 v2, 0x18

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iget-object v3, v8, Lٳًيٙڱڙڜڨ/ؤ;->ض:Landroid/content/res/ColorStateList;

    if-eq v3, v2, :cond_3

    iput-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ض:Landroid/content/res/ColorStateList;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_3
    const/16 v2, 0xb

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iget-object v3, v8, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    if-eq v3, v2, :cond_4

    iput-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_4
    const/16 v2, 0x13

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iget v4, v8, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    cmpl-float v4, v4, v2

    if-eqz v4, :cond_5

    iput v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_5
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ع(F)V

    :cond_6
    const/16 v2, 0x16

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ؾ(Landroid/content/res/ColorStateList;)V

    const/16 v2, 0x17

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ؿ(F)V

    const/16 v2, 0x24

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->و(Landroid/content/res/ColorStateList;)V

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_7

    const-string v2, ""

    :cond_7
    iget-object v4, v8, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    iput-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    iget-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iput-boolean v7, v2, Lٹ؅ڟ؀ە/ا;->آ:Z

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_8
    invoke-virtual {v0, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_9

    invoke-virtual {v0, p3, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_9

    new-instance v5, Lٹۧ٥ؐح/ؤ;

    invoke-direct {v5, v1, v2}, Lٹۧ٥ؐح/ؤ;-><init>(Landroid/content/Context;I)V

    goto :goto_1

    :cond_9
    move-object v5, v4

    :goto_1
    iget v2, v5, Lٹۧ٥ؐح/ؤ;->ة:F

    invoke-virtual {v0, v7, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, v5, Lٹۧ٥ؐح/ؤ;->ة:F

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ى(Lٹۧ٥ؐح/ؤ;)V

    const/4 v2, 0x3

    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    if-eq v5, v7, :cond_c

    const/4 v11, 0x2

    if-eq v5, v11, :cond_b

    if-eq v5, v2, :cond_a

    goto :goto_3

    :cond_a
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    goto :goto_2

    :cond_b
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    goto :goto_2

    :cond_c
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    :goto_2
    iput-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    :goto_3
    const/16 v2, 0x12

    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ؽ(Z)V

    const-string v2, "http://schemas.android.com/apk/res-auto"

    if-eqz p2, :cond_d

    const-string v5, "chipIconEnabled"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_d

    const-string v5, "chipIconVisible"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_d

    const/16 v5, 0xf

    invoke-virtual {v0, v5, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ؽ(Z)V

    :cond_d
    const/16 v5, 0xe

    invoke-static {v1, v0, v5}, Lٹۧ٥ؐح/ء;->ء(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->غ(Landroid/graphics/drawable/Drawable;)V

    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_e

    invoke-static {v1, v0, v5}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ؼ(Landroid/content/res/ColorStateList;)V

    :cond_e
    const/16 v5, 0x10

    const/high16 v11, -0x40800000    # -1.0f

    invoke-virtual {v0, v5, v11}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ػ(F)V

    const/16 v5, 0x1f

    invoke-virtual {v0, v5, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->م(Z)V

    if-eqz p2, :cond_f

    const-string v5, "closeIconEnabled"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_f

    const-string v5, "closeIconVisible"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_f

    const/16 v5, 0x1a

    invoke-virtual {v0, v5, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->م(Z)V

    :cond_f
    const/16 v5, 0x19

    invoke-static {v1, v0, v5}, Lٹۧ٥ؐح/ء;->ء(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ـ(Landroid/graphics/drawable/Drawable;)V

    const/16 v5, 0x1e

    invoke-static {v1, v0, v5}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ل(Landroid/content/res/ColorStateList;)V

    const/16 v5, 0x1c

    invoke-virtual {v0, v5, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ق(F)V

    const/4 v5, 0x6

    invoke-virtual {v0, v5, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ص(Z)V

    const/16 v5, 0xa

    invoke-virtual {v0, v5, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v8, v5}, Lٳًيٙڱڙڜڨ/ؤ;->ظ(Z)V

    if-eqz p2, :cond_10

    const-string v5, "checkedIconEnabled"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_10

    const-string v5, "checkedIconVisible"

    invoke-interface {p2, v2, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_10

    const/16 v2, 0x8

    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ظ(Z)V

    :cond_10
    const/4 v2, 0x7

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->ء(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ض(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_11

    invoke-static {v1, v0, v2}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v8, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ط(Landroid/content/res/ColorStateList;)V

    :cond_11
    const/16 v2, 0x27

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_12

    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_12

    invoke-static {v1, v2}, Lؿ١ڔظۇٟؗٞ/ء;->؋(Landroid/content/Context;I)Lؿ١ڔظۇٟؗٞ/ء;

    move-result-object v2

    goto :goto_4

    :cond_12
    move-object v2, v4

    :goto_4
    iput-object v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٱ:Lؿ١ڔظۇٟؗٞ/ء;

    const/16 v2, 0x21

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_13

    invoke-virtual {v0, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_13

    invoke-static {v1, v2}, Lؿ١ڔظۇٟؗٞ/ء;->؋(Landroid/content/Context;I)Lؿ١ڔظۇٟؗٞ/ء;

    move-result-object v4

    :cond_13
    iput-object v4, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٲ:Lؿ١ڔظۇٟؗٞ/ء;

    const/16 v1, 0x15

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iget v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_14

    iput v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_14
    const/16 v1, 0x23

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {v8, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ه(F)V

    const/16 v1, 0x22

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {v8, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ن(F)V

    const/16 v1, 0x29

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iget v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_15

    iput v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_15
    const/16 v1, 0x28

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iget v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_16

    iput v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_16
    const/16 v1, 0x1d

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {v8, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ك(F)V

    const/16 v1, 0x1b

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {v8, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ف(F)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iget v2, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_17

    iput v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    invoke-virtual {v8}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v8}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_17
    const/4 v1, 0x4

    const v2, 0x7fffffff

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ڕ:I

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    const v4, 0x7f110407

    new-array v5, p3, [I

    const v3, 0x7f0300d1

    move-object v0, p1

    move-object v1, p2

    move-object v2, v9

    invoke-static/range {v0 .. v5}, Lٹ؅ڟ؀ە/ة;->آ(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/material/chip/Chip;->ب:Z

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/16 v2, 0x30

    int-to-float v2, v2

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v7, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-float v1, v1

    const/16 v2, 0x14

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    iput v1, p0, Lcom/google/android/material/chip/Chip;->ت:I

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0, v8}, Lcom/google/android/material/chip/Chip;->setChipDrawable(Lٳًيٙڱڙڜڨ/ؤ;)V

    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getElevation(Landroid/view/View;)F

    move-result v0

    invoke-virtual {v8, v0}, Lٽچڃ/إ;->ا(F)V

    const v4, 0x7f110407

    new-array v5, p3, [I

    const v3, 0x7f0300d1

    move-object v0, p1

    move-object v1, p2

    move-object v2, v9

    invoke-static/range {v0 .. v5}, Lٹ؅ڟ؀ە/ة;->آ(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Lٳًيٙڱڙڜڨ/آ;

    invoke-direct {p1, p0, p0}, Lٳًيٙڱڙڜڨ/آ;-><init>(Lcom/google/android/material/chip/Chip;Lcom/google/android/material/chip/Chip;)V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->أ()V

    if-nez p2, :cond_18

    new-instance p1, Lٳًيٙڱڙڜڨ/ء;

    invoke-direct {p1, p0}, Lٳًيٙڱڙڜڨ/ء;-><init>(Lcom/google/android/material/chip/Chip;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    :cond_18
    iget-boolean p1, p0, Lcom/google/android/material/chip/Chip;->ؤ:Z

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChecked(Z)V

    iget-object p1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, v8, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ئ()V

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-boolean p1, p1, Lٳًيٙڱڙڜڨ/ؤ;->ڔ:Z

    if-nez p1, :cond_19

    invoke-virtual {p0, v7}, Lcom/google/android/material/chip/Chip;->setLines(I)V

    invoke-virtual {p0, v7}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    :cond_19
    invoke-virtual {p0, v6}, Lcom/google/android/material/chip/Chip;->setGravity(I)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->إ()V

    iget-boolean p1, p0, Lcom/google/android/material/chip/Chip;->ب:Z

    if-eqz p1, :cond_1a

    iget p1, p0, Lcom/google/android/material/chip/Chip;->ت:I

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_1a
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/chip/Chip;->ة:I

    new-instance p1, Lٳًيٙڱڙڜڨ/؋;

    invoke-direct {p1, p0}, Lٳًيٙڱڙڜڨ/؋;-><init>(Lcom/google/android/material/chip/Chip;)V

    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void

    :cond_1b
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Chip does not support multi-line text"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1c
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1d
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1e
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1f
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set left drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getCloseIconTouchBounds()Landroid/graphics/RectF;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->د:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->آ()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->آ:Landroid/view/View$OnClickListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    invoke-virtual {v1}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    iget v4, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    add-float/2addr v3, v4

    iget v4, v1, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    add-float/2addr v3, v4

    iget v4, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٸ:F

    add-float/2addr v3, v4

    iget v4, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    add-float/2addr v3, v4

    invoke-static {v1}, Landroidx/core/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-nez v1, :cond_0

    iget v1, v2, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v3

    iput v1, v0, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    iget v1, v2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v3

    iput v1, v0, Landroid/graphics/RectF;->right:F

    :goto_0
    iget v1, v2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->top:F

    iget v1, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    :cond_1
    return-object v0
.end method

.method private getCloseIconTouchBoundsInt()Landroid/graphics/Rect;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v0

    iget v1, v0, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iget v2, v0, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    iget v3, v0, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v0, v0

    iget-object v4, p0, Lcom/google/android/material/chip/Chip;->خ:Landroid/graphics/Rect;

    invoke-virtual {v4, v1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    return-object v4
.end method

.method private getTextAppearance()Lٹۧ٥ؐح/ؤ;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iget-object v0, v0, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private setCloseIconHovered(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ئ:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->ئ:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method private setCloseIconPressed(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method public static synthetic ؋(Lcom/google/android/material/chip/Chip;)Landroid/graphics/RectF;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ؠ(Lcom/google/android/material/chip/Chip;)Landroid/graphics/Rect;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBoundsInt()Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/View;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {v0, p1}, Landroidx/customview/widget/ExploreByTouchHelper;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-super {p0, p1}, Landroid/view/View;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {v0, p1}, Landroidx/customview/widget/ExploreByTouchHelper;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroidx/customview/widget/ExploreByTouchHelper;->getKeyboardFocusedVirtualViewId()I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public final drawableStateChanged()V
    .locals 5

    invoke-super {p0}, Landroidx/appcompat/widget/AppCompatCheckBox;->drawableStateChanged()V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ز(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->ا:Z

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->ئ:Z

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    :cond_1
    iget-boolean v3, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    if-eqz v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    :cond_2
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_3

    add-int/lit8 v2, v2, 0x1

    :cond_3
    new-array v2, v2, [I

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_4

    const v3, 0x101009e

    aput v3, v2, v1

    const/4 v3, 0x1

    goto :goto_0

    :cond_4
    move v3, v1

    :goto_0
    iget-boolean v4, p0, Lcom/google/android/material/chip/Chip;->ا:Z

    if-eqz v4, :cond_5

    const v4, 0x101009c

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    :cond_5
    iget-boolean v4, p0, Lcom/google/android/material/chip/Chip;->ئ:Z

    if-eqz v4, :cond_6

    const v4, 0x1010367

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    :cond_6
    iget-boolean v4, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    if-eqz v4, :cond_7

    const v4, 0x10100a7

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    :cond_7
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_8

    const v4, 0x10100a1

    aput v4, v2, v3

    :cond_8
    iget-object v3, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-static {v3, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v3

    if-nez v3, :cond_9

    iput-object v2, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڏ:[I

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ٯ()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lٳًيٙڱڙڜڨ/ؤ;->ش([I[I)Z

    move-result v0

    move v1, v0

    :cond_9
    if-eqz v1, :cond_a

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_a
    return-void
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ث:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ث:Ljava/lang/CharSequence;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_1

    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const-string v1, "android.widget.Button"

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    return-object v1

    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_3

    return-object v1

    :cond_3
    const-string v0, "android.view.View"

    return-object v0
.end method

.method public getBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    :cond_0
    return-object v0
.end method

.method public getCheckedIcon()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٮ:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getCheckedIconTint()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٯ:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getChipBackgroundColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getChipCornerRadius()F
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->ذ()F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :cond_0
    return v1
.end method

.method public getChipDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    return-object v0
.end method

.method public getChipEndPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getChipIcon()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ؿ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v1, v0

    :cond_0
    return-object v1
.end method

.method public getChipIconSize()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ف:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getChipIconTint()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ـ:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getChipMinHeight()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getChipStartPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getChipStrokeColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->غ:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getChipStrokeWidth()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ػ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getChipText()Ljava/lang/CharSequence;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getCloseIcon()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v1, v0

    :cond_0
    return-object v1
.end method

.method public getCloseIconContentDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->و:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getCloseIconEndPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٹ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCloseIconSize()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ه:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCloseIconStartPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٸ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCloseIconTint()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ن:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getEllipsize()Landroid/text/TextUtils$TruncateAt;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getFocusedRect(Landroid/graphics/Rect;)V
    .locals 3

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {v0}, Landroidx/customview/widget/ExploreByTouchHelper;->getKeyboardFocusedVirtualViewId()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroidx/customview/widget/ExploreByTouchHelper;->getAccessibilityFocusedVirtualViewId()I

    move-result v0

    if-ne v0, v2, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBoundsInt()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->getFocusedRect(Landroid/graphics/Rect;)V

    :goto_0
    return-void
.end method

.method public getHideMotionSpec()Lؿ١ڔظۇٟؗٞ/ء;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٲ:Lؿ١ڔظۇٟؗٞ/ء;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getIconEndPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٵ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getIconStartPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٴ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getRippleColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ؼ:Landroid/content/res/ColorStateList;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getShapeAppearanceModel()Lٽچڃ/ب;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-object v0, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    return-object v0
.end method

.method public getShowMotionSpec()Lؿ١ڔظۇٟؗٞ/ء;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٱ:Lؿ١ڔظۇٟؗٞ/ء;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getTextEndPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTextStartPadding()F
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    invoke-static {p0, v0}, Lسۄھؤۏ۫/؋;->س(Landroid/view/View;Lٽچڃ/إ;)V

    return-void
.end method

.method public final onCreateDrawableState(I)[I
    .locals 1

    add-int/lit8 p1, p1, 0x2

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/material/chip/Chip;->ز:[I

    invoke-static {p1, v0}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_1

    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    sget-object v0, Lcom/google/android/material/chip/Chip;->س:[I

    invoke-static {p1, v0}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    :cond_2
    return-object p1
.end method

.method public final onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/view/View;->onFocusChanged(ZILandroid/graphics/Rect;)V

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/customview/widget/ExploreByTouchHelper;->onFocusChanged(ZILandroid/graphics/Rect;)V

    :cond_0
    return-void
.end method

.method public final onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x7

    if-eq v0, v1, :cond_1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/material/chip/Chip;->setCloseIconHovered(Z)V

    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getAccessibilityClassName()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCheckable(Z)V

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    return-void
.end method

.method public final onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .locals 3

    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 p2, 0x3ea

    invoke-static {p1, p2}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object p1

    return-object p1
.end method

.method public final onRtlPropertiesChanged(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onRtlPropertiesChanged(I)V

    iget v0, p0, Lcom/google/android/material/chip/Chip;->ة:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/google/android/material/chip/Chip;->ة:I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->إ()V

    :cond_0
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getCloseIconTouchBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_5

    if-eq v0, v2, :cond_1

    const/4 v4, 0x2

    if-eq v0, v4, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    goto :goto_2

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    if-eqz v0, :cond_7

    if-nez v1, :cond_6

    invoke-direct {p0, v3}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    goto :goto_1

    :cond_1
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->إ:Z

    if-eqz v0, :cond_4

    invoke-virtual {p0, v3}, Landroid/view/View;->playSoundEffect(I)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->آ:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_2

    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_2
    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-virtual {v0, v2, v2}, Landroidx/customview/widget/ExploreByTouchHelper;->sendEventForVirtualView(II)Z

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    move v0, v3

    :goto_0
    invoke-direct {p0, v3}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    goto :goto_3

    :cond_5
    if-eqz v1, :cond_7

    invoke-direct {p0, v2}, Lcom/google/android/material/chip/Chip;->setCloseIconPressed(Z)V

    :cond_6
    :goto_1
    move v0, v2

    goto :goto_3

    :cond_7
    :goto_2
    move v0, v3

    :goto_3
    if-nez v0, :cond_9

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_4

    :cond_8
    move v2, v3

    :cond_9
    :goto_4
    return v2
.end method

.method public setAccessibilityClassName(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->ث:Ljava/lang/CharSequence;

    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ء:Landroid/graphics/drawable/RippleDrawable;

    if-eq p1, v0, :cond_0

    const-string p1, "Chip"

    const-string v0, "Do not set the background; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    const-string p1, "Chip"

    const-string v0, "Do not set the background color; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ء:Landroid/graphics/drawable/RippleDrawable;

    if-eq p1, v0, :cond_0

    const-string p1, "Chip"

    const-string v0, "Do not set the background drawable; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatCheckBox;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 1

    const-string p1, "Chip"

    const-string v0, "Do not set the background resource; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string p1, "Chip"

    const-string v0, "Do not set the background tint list; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string p1, "Chip"

    const-string v0, "Do not set the background tint mode; Chip manages its own background drawable."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setCheckable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ص(Z)V

    :cond_0
    return-void
.end method

.method public setCheckableResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ص(Z)V

    :cond_0
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-nez v0, :cond_0

    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->ؤ:Z

    goto :goto_0

    :cond_0
    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ى:Z

    if-eqz v0, :cond_1

    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setCheckedIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ض(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setCheckedIconEnabled(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCheckedIconVisible(Z)V

    return-void
.end method

.method public setCheckedIconEnabledResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCheckedIconVisible(I)V

    return-void
.end method

.method public setCheckedIconResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ض(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setCheckedIconTint(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ط(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setCheckedIconTintResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ط(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setCheckedIconVisible(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ظ(Z)V

    :cond_0
    return-void
.end method

.method public setCheckedIconVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ظ(Z)V

    :cond_0
    return-void
.end method

.method public setChipBackgroundColor(Landroid/content/res/ColorStateList;)V
    .locals 2
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_0
    return-void
.end method

.method public setChipBackgroundColorResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ط:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_0
    return-void
.end method

.method public setChipCornerRadius(F)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ع(F)V

    :cond_0
    return-void
.end method

.method public setChipCornerRadiusResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ع(F)V

    :cond_0
    return-void
.end method

.method public setChipDrawable(Lٳًيٙڱڙڜڨ/ؤ;)V
    .locals 3
    .param p1    # Lٳًيٙڱڙڜڨ/ؤ;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eq v0, p1, :cond_1

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڒ:Ljava/lang/ref/WeakReference;

    :cond_0
    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lٳًيٙڱڙڜڨ/ؤ;->ڔ:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p1, Lٳًيٙڱڙڜڨ/ؤ;->ڒ:Ljava/lang/ref/WeakReference;

    iget p1, p0, Lcom/google/android/material/chip/Chip;->ت:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->ء(I)V

    :cond_1
    return-void
.end method

.method public setChipEndPadding(F)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipEndPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->غ(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setChipIconEnabled(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChipIconVisible(Z)V

    return-void
.end method

.method public setChipIconEnabledResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setChipIconVisible(I)V

    return-void
.end method

.method public setChipIconResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->غ(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setChipIconSize(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ػ(F)V

    :cond_0
    return-void
.end method

.method public setChipIconSizeResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ػ(F)V

    :cond_0
    return-void
.end method

.method public setChipIconTint(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؼ(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setChipIconTintResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؼ(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setChipIconVisible(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؽ(Z)V

    :cond_0
    return-void
.end method

.method public setChipIconVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؽ(Z)V

    :cond_0
    return-void
.end method

.method public setChipMinHeight(F)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipMinHeightResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipStartPadding(F)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipStartPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setChipStrokeColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؾ(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setChipStrokeColorResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؾ(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setChipStrokeWidth(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؿ(F)V

    :cond_0
    return-void
.end method

.method public setChipStrokeWidthResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ؿ(F)V

    :cond_0
    return-void
.end method

.method public setChipText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setChipTextResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCloseIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ـ(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->أ()V

    return-void
.end method

.method public setCloseIconContentDescription(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->و:Ljava/lang/CharSequence;

    if-eq v1, p1, :cond_0

    invoke-static {}, Landroidx/core/text/BidiFormatter;->getInstance()Landroidx/core/text/BidiFormatter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/core/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->و:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_0
    return-void
.end method

.method public setCloseIconEnabled(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(Z)V

    return-void
.end method

.method public setCloseIconEnabledResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(I)V

    return-void
.end method

.method public setCloseIconEndPadding(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ف(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconEndPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ف(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ـ(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->أ()V

    return-void
.end method

.method public setCloseIconSize(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ق(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconSizeResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ق(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconStartPadding(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ك(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconStartPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ك(F)V

    :cond_0
    return-void
.end method

.method public setCloseIconTint(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ل(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setCloseIconTintResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ل(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setCloseIconVisible(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/BoolRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->setCloseIconVisible(Z)V

    return-void
.end method

.method public setCloseIconVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->م(Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->أ()V

    return-void
.end method

.method public final setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatCheckBox;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatCheckBox;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCompoundDrawablesWithIntrinsicBounds(IIII)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set end drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set start drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-nez p1, :cond_1

    if-nez p3, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set right drawable using R.attr#closeIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Please set left drawable using R.attr#chipIcon."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setElevation(F)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    invoke-super {p0, p1}, Landroid/view/View;->setElevation(F)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٽچڃ/إ;->ا(F)V

    :cond_0
    return-void
.end method

.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    if-eq p1, v0, :cond_2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_1

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ړ:Landroid/text/TextUtils$TruncateAt;

    :cond_1
    return-void

    :cond_2
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Text within a chip are not allowed to scroll."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEnsureMinTouchTargetSize(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/material/chip/Chip;->ب:Z

    iget p1, p0, Lcom/google/android/material/chip/Chip;->ت:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/chip/Chip;->ء(I)V

    return-void
.end method

.method public setGravity(I)V
    .locals 1

    const v0, 0x800013

    if-eq p1, v0, :cond_0

    const-string p1, "Chip"

    const-string v0, "Chip text must be vertically center and start aligned"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    :goto_0
    return-void
.end method

.method public setHideMotionSpec(Lؿ١ڔظۇٟؗٞ/ء;)V
    .locals 1
    .param p1    # Lؿ١ڔظۇٟؗٞ/ء;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٲ:Lؿ١ڔظۇٟؗٞ/ء;

    :cond_0
    return-void
.end method

.method public setHideMotionSpecResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/AnimatorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Lؿ١ڔظۇٟؗٞ/ء;->؋(Landroid/content/Context;I)Lؿ١ڔظۇٟؗٞ/ء;

    move-result-object p1

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٲ:Lؿ١ڔظۇٟؗٞ/ء;

    :cond_0
    return-void
.end method

.method public setIconEndPadding(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ن(F)V

    :cond_0
    return-void
.end method

.method public setIconEndPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ن(F)V

    :cond_0
    return-void
.end method

.method public setIconStartPadding(F)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ه(F)V

    :cond_0
    return-void
.end method

.method public setIconStartPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ه(F)V

    :cond_0
    return-void
.end method

.method public setInternalOnCheckedChangeListener(Lٹ؅ڟ؀ە/أ;)V
    .locals 0
    .param p1    # Lٹ؅ڟ؀ە/أ;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u0679\u0605\u069f\u0600\u06d5/\u0623;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public setLayoutDirection(I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setLayoutDirection(I)V

    return-void
.end method

.method public setLines(I)V
    .locals 1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/TextView;->setLines(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMaxLines(I)V
    .locals 1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMaxWidth(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/Px;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڕ:I

    :cond_0
    return-void
.end method

.method public setMinLines(I)V
    .locals 1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/TextView;->setMinLines(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 0
    .param p1    # Landroid/widget/CompoundButton$OnCheckedChangeListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->أ:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method public setOnCloseIconClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->آ:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->أ()V

    return-void
.end method

.method public setRippleColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->و(Landroid/content/res/ColorStateList;)V

    :cond_0
    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-boolean p1, p1, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    :cond_1
    return-void
.end method

.method public setRippleColorResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->و(Landroid/content/res/ColorStateList;)V

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-boolean p1, p1, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    :cond_0
    return-void
.end method

.method public setShapeAppearanceModel(Lٽچڃ/ب;)V
    .locals 1
    .param p1    # Lٽچڃ/ب;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    invoke-virtual {v0, p1}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    return-void
.end method

.method public setShowMotionSpec(Lؿ١ڔظۇٟؗٞ/ء;)V
    .locals 1
    .param p1    # Lؿ١ڔظۇٟؗٞ/ء;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٱ:Lؿ١ڔظۇٟؗٞ/ء;

    :cond_0
    return-void
.end method

.method public setShowMotionSpecResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/AnimatorRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-static {v1, p1}, Lؿ١ڔظۇٟؗٞ/ء;->؋(Landroid/content/Context;I)Lؿ١ڔظۇٟؗٞ/ء;

    move-result-object p1

    iput-object p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٱ:Lؿ١ڔظۇٟؗٞ/ء;

    :cond_0
    return-void
.end method

.method public setSingleLine(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-super {p0, p1}, Landroid/widget/TextView;->setSingleLine(Z)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Chip does not support multi-line text"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڔ:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    move-object v0, p1

    :goto_0
    invoke-super {p0, v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    iget-object p2, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz p2, :cond_3

    iget-object v0, p2, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iput-object p1, p2, Lٳًيٙڱڙڜڨ/ؤ;->ؽ:Ljava/lang/CharSequence;

    iget-object p1, p2, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lٹ؅ڟ؀ە/ا;->آ:Z

    invoke-virtual {p2}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {p2}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_3
    return-void
.end method

.method public setTextAppearance(I)V
    .locals 3

    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextAppearance(I)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    new-instance v1, Lٹۧ٥ؐح/ؤ;

    iget-object v2, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-direct {v1, v2, p1}, Lٹۧ٥ؐح/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lٳًيٙڱڙڜڨ/ؤ;->ى(Lٹۧ٥ؐح/ؤ;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ئ()V

    return-void
.end method

.method public final setTextAppearance(Landroid/content/Context;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz p1, :cond_0

    new-instance v0, Lٹۧ٥ؐح/ؤ;

    iget-object v1, p1, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-direct {v0, v1, p2}, Lٹۧ٥ؐح/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p1, v0}, Lٳًيٙڱڙڜڨ/ؤ;->ى(Lٹۧ٥ؐح/ؤ;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ئ()V

    return-void
.end method

.method public setTextAppearance(Lٹۧ٥ؐح/ؤ;)V
    .locals 1
    .param p1    # Lٹۧ٥ؐح/ؤ;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lٳًيٙڱڙڜڨ/ؤ;->ى(Lٹۧ٥ؐح/ؤ;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ئ()V

    return-void
.end method

.method public setTextAppearanceResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/chip/Chip;->setTextAppearance(Landroid/content/Context;I)V

    return-void
.end method

.method public setTextEndPadding(F)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setTextEndPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final setTextSize(IF)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {p1, p2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    iget-object p2, v0, Lٳًيٙڱڙڜڨ/ؤ;->ځ:Lٹ؅ڟ؀ە/ا;

    iget-object v1, p2, Lٹ؅ڟ؀ە/ا;->ؤ:Lٹۧ٥ؐح/ؤ;

    if-eqz v1, :cond_0

    iput p1, v1, Lٹۧ٥ؐح/ؤ;->ة:F

    iget-object p2, p2, Lٹ؅ڟ؀ە/ا;->؋:Landroid/text/TextPaint;

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ئ()V

    return-void
.end method

.method public setTextStartPadding(F)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public setTextStartPaddingResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٻ:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput p1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->س()V

    :cond_0
    return-void
.end method

.method public final ء(I)V
    .locals 10

    iput p1, p0, Lcom/google/android/material/chip/Chip;->ت:I

    iget-boolean v0, p0, Lcom/google/android/material/chip/Chip;->ب:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    if-eqz p1, :cond_0

    if-eqz p1, :cond_1

    iput-object v1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getChipMinHeight()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    goto :goto_0

    :cond_0
    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ظ:F

    float-to-int v0, v0

    sub-int v0, p1, v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object v3, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    invoke-virtual {v3}, Lٳًيٙڱڙڜڨ/ؤ;->getIntrinsicWidth()I

    move-result v3

    sub-int v3, p1, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-gtz v3, :cond_5

    if-gtz v0, :cond_5

    iget-object p1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    if-eqz p1, :cond_3

    if-eqz p1, :cond_4

    iput-object v1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getChipMinHeight()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    goto :goto_1

    :cond_3
    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    :cond_4
    :goto_1
    return-void

    :cond_5
    if-lez v3, :cond_6

    div-int/lit8 v3, v3, 0x2

    move v8, v3

    goto :goto_2

    :cond_6
    move v8, v2

    :goto_2
    if-lez v0, :cond_7

    div-int/lit8 v2, v0, 0x2

    :cond_7
    move v9, v2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    if-eqz v0, :cond_8

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/InsetDrawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v1, v0, Landroid/graphics/Rect;->top:I

    if-ne v1, v9, :cond_8

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    if-ne v1, v9, :cond_8

    iget v1, v0, Landroid/graphics/Rect;->left:I

    if-ne v1, v8, :cond_8

    iget v0, v0, Landroid/graphics/Rect;->right:I

    if-ne v0, v8, :cond_8

    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    return-void

    :cond_8
    invoke-virtual {p0}, Landroid/widget/TextView;->getMinHeight()I

    move-result v0

    if-eq v0, p1, :cond_9

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_9
    invoke-virtual {p0}, Landroid/widget/TextView;->getMinWidth()I

    move-result v0

    if-eq v0, p1, :cond_a

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMinWidth(I)V

    :cond_a
    new-instance p1, Landroid/graphics/drawable/InsetDrawable;

    iget-object v5, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    move-object v4, p1

    move v6, v8

    move v7, v9

    invoke-direct/range {v4 .. v9}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    iput-object p1, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    sget-object p1, Lٺپر/؋;->؋:[I

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->ؤ()V

    return-void
.end method

.method public final آ()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ل:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->unwrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

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
    return v0
.end method

.method public final أ()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->آ()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lٳًيٙڱڙڜڨ/ؤ;->ك:Z

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->آ:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ج:Lٳًيٙڱڙڜڨ/آ;

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    move v1, v2

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    :goto_1
    iput-boolean v1, p0, Lcom/google/android/material/chip/Chip;->ح:Z

    return-void
.end method

.method public final ؤ()V
    .locals 4

    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-object v1, v1, Lٳًيٙڱڙڜڨ/ؤ;->ؼ:Landroid/content/res/ColorStateList;

    invoke-static {v1}, Lٺپر/؋;->؋(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/google/android/material/chip/Chip;->ء:Landroid/graphics/drawable/RippleDrawable;

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget-boolean v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڐ:Z

    iput-object v3, v0, Lٳًيٙڱڙڜڨ/ؤ;->ڑ:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lٳًيٙڱڙڜڨ/ؤ;->onStateChange([I)Z

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->ء:Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/google/android/material/chip/Chip;->إ()V

    return-void
.end method

.method public final إ()V
    .locals 4

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v1, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٺ:F

    iget v2, v0, Lٳًيٙڱڙڜڨ/ؤ;->ٷ:F

    add-float/2addr v1, v2

    invoke-virtual {v0}, Lٳًيٙڱڙڜڨ/ؤ;->د()F

    move-result v0

    add-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    iget v2, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٳ:F

    iget v3, v1, Lٳًيٙڱڙڜڨ/ؤ;->ٶ:F

    add-float/2addr v2, v3

    invoke-virtual {v1}, Lٳًيٙڱڙڜڨ/ؤ;->خ()F

    move-result v1

    add-float/2addr v1, v2

    float-to-int v1, v1

    iget-object v2, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    if-eqz v2, :cond_1

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lcom/google/android/material/chip/Chip;->ؠ:Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/InsetDrawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v3, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v3

    iget v2, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v2

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-static {p0, v1, v2, v0, v3}, Landroidx/core/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    :cond_2
    :goto_0
    return-void
.end method

.method public final ئ()V
    .locals 4

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/chip/Chip;->؋:Lٳًيٙڱڙڜڨ/ؤ;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    iput-object v1, v0, Landroid/text/TextPaint;->drawableState:[I

    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/chip/Chip;->getTextAppearance()Lٹۧ٥ؐح/ؤ;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/material/chip/Chip;->ذ:Lٳًيٙڱڙڜڨ/ؠ;

    invoke-virtual {v1, v2, v0, v3}, Lٹۧ٥ؐح/ؤ;->آ(Landroid/content/Context;Landroid/text/TextPaint;Lٹۧ٥ؐح/إ;)V

    :cond_1
    return-void
.end method
