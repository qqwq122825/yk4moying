.class public Lcom/google/android/material/textfield/TextInputLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# static fields
.field public static final ڏ:[[I


# instance fields
.field public final ؋:Landroid/widget/FrameLayout;

.field public final ؠ:Lٿخ۴۟ؽ/ط;

.field public final ء:Lٿخ۴۟ؽ/خ;

.field public آ:Landroid/widget/EditText;

.field public أ:Ljava/lang/CharSequence;

.field public ؤ:I

.field public إ:I

.field public ئ:I

.field public ا:I

.field public final ب:Lٿخ۴۟ؽ/ز;

.field public ة:Z

.field public ت:I

.field public ث:Z

.field public ج:Lٿخ۴۟ؽ/غ;

.field public ح:Landroidx/appcompat/widget/AppCompatTextView;

.field public خ:I

.field public د:I

.field public ذ:Ljava/lang/CharSequence;

.field public ر:Z

.field public ز:Landroidx/appcompat/widget/AppCompatTextView;

.field public س:Landroid/content/res/ColorStateList;

.field public ش:I

.field public ص:Landroidx/transition/Fade;

.field public ض:Landroidx/transition/Fade;

.field public ط:Landroid/content/res/ColorStateList;

.field public ظ:Landroid/content/res/ColorStateList;

.field public ع:Landroid/content/res/ColorStateList;

.field public غ:Landroid/content/res/ColorStateList;

.field public ػ:Z

.field public ؼ:Ljava/lang/CharSequence;

.field public ؽ:Z

.field public ؾ:Lٽچڃ/إ;

.field public ؿ:Lٽچڃ/إ;

.field public ـ:Landroid/graphics/drawable/StateListDrawable;

.field public ف:Z

.field public ق:Lٽچڃ/إ;

.field public ك:Lٽچڃ/إ;

.field public ل:Lٽچڃ/ب;

.field public م:Z

.field public final ن:I

.field public ه:I

.field public و:I

.field public ى:I

.field public ي:I

.field public ٮ:I

.field public ٯ:I

.field public ٱ:I

.field public final ٲ:Landroid/graphics/Rect;

.field public final ٳ:Landroid/graphics/Rect;

.field public final ٴ:Landroid/graphics/RectF;

.field public ٵ:Landroid/graphics/Typeface;

.field public ٶ:Landroid/graphics/drawable/ColorDrawable;

.field public ٷ:I

.field public final ٸ:Ljava/util/LinkedHashSet;

.field public ٹ:Landroid/graphics/drawable/ColorDrawable;

.field public ٺ:I

.field public ٻ:Landroid/graphics/drawable/Drawable;

.field public ټ:Landroid/content/res/ColorStateList;

.field public ٽ:Landroid/content/res/ColorStateList;

.field public پ:I

.field public ٿ:I

.field public ڀ:I

.field public ځ:Landroid/content/res/ColorStateList;

.field public ڂ:I

.field public ڃ:I

.field public ڄ:I

.field public څ:I

.field public چ:I

.field public ڇ:Z

.field public final ڈ:Lٹ؅ڟ؀ە/ؠ;

.field public ډ:Z

.field public ڊ:Z

.field public ڋ:Landroid/animation/ValueAnimator;

.field public ڌ:Z

.field public ڍ:Z

.field public ڎ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const v0, 0x10100a7

    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [I

    filled-new-array {v0, v1}, [[I

    move-result-object v0

    sput-object v0, Lcom/google/android/material/textfield/TextInputLayout;->ڏ:[[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 19
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p0

    move-object/from16 v7, p2

    const v8, 0x7f030466

    const v9, 0x7f11033f

    move-object/from16 v1, p1

    invoke-static {v1, v7, v8, v9}, Lڗًقڔ/؋;->ڌ(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v10, -0x1

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->ؤ:I

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->إ:I

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->ئ:I

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->ا:I

    new-instance v1, Lٿخ۴۟ؽ/ز;

    invoke-direct {v1, v0}, Lٿخ۴۟ؽ/ز;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v11, 0x14

    invoke-direct {v1, v11}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ج:Lٿخ۴۟ؽ/غ;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٲ:Landroid/graphics/Rect;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٳ:Landroid/graphics/Rect;

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٸ:Ljava/util/LinkedHashSet;

    new-instance v1, Lٹ؅ڟ؀ە/ؠ;

    invoke-direct {v1, v0}, Lٹ؅ڟ؀ە/ؠ;-><init>(Landroid/view/View;)V

    iput-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    const/4 v12, 0x0

    iput-boolean v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڎ:Z

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v12}, Landroid/view/View;->setWillNotDraw(Z)V

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->setAddStatesFromChildren(Z)V

    new-instance v15, Landroid/widget/FrameLayout;

    invoke-direct {v15, v13}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v15, v0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v15, v14}, Landroid/view/ViewGroup;->setAddStatesFromChildren(Z)V

    sget-object v2, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    iput-object v2, v1, Lٹ؅ڟ؀ە/ؠ;->ى:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v12}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    iput-object v2, v1, Lٹ؅ڟ؀ە/ؠ;->و:Landroid/animation/TimeInterpolator;

    invoke-virtual {v1, v12}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    iget v2, v1, Lٹ؅ڟ؀ە/ؠ;->إ:I

    const v3, 0x800033

    if-eq v2, v3, :cond_0

    iput v3, v1, Lٹ؅ڟ؀ە/ؠ;->إ:I

    invoke-virtual {v1, v12}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_0
    sget-object v6, Lؾٿټڷ/؋;->ع:[I

    const/16 v5, 0x16

    const/16 v4, 0x28

    const/16 v3, 0x2d

    const/16 v2, 0x31

    filled-new-array {v5, v11, v4, v3, v2}, [I

    move-result-object v16

    invoke-static {v13, v7, v8, v9}, Lٹ؅ڟ؀ە/ة;->؋(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v17, 0x7f030466

    const v18, 0x7f11033f

    move-object v1, v13

    move v11, v2

    move-object/from16 v2, p2

    move-object v3, v6

    move/from16 v4, v17

    move/from16 v5, v18

    move-object v11, v6

    move-object/from16 v6, v16

    invoke-static/range {v1 .. v6}, Lٹ؅ڟ؀ە/ة;->ؠ(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)V

    invoke-static {v13, v7, v11, v8, v9}, Landroidx/appcompat/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/TintTypedArray;

    move-result-object v1

    new-instance v2, Lٿخ۴۟ؽ/ط;

    invoke-direct {v2, v0, v1}, Lٿخ۴۟ؽ/ط;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Landroidx/appcompat/widget/TintTypedArray;)V

    iput-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    const/16 v3, 0x30

    invoke-virtual {v1, v3, v14}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    const/16 v3, 0x2f

    invoke-virtual {v1, v3, v14}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڊ:Z

    const/16 v3, 0x2a

    invoke-virtual {v1, v3, v14}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ډ:Z

    const/4 v3, 0x6

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1, v3, v10}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setMinEms(I)V

    goto :goto_0

    :cond_1
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v1, v3, v10}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    :cond_2
    :goto_0
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_3

    invoke-virtual {v1, v3, v10}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxEms(I)V

    goto :goto_1

    :cond_3
    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v1, v5, v10}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    :cond_4
    :goto_1
    invoke-static {v13, v7, v8, v9}, Lٽچڃ/ب;->ؠ(Landroid/content/Context;Landroid/util/AttributeSet;II)Lآۋۻؾ۹/ئ;

    move-result-object v3

    new-instance v4, Lٽچڃ/ب;

    invoke-direct {v4, v3}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iput-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0602f7

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ن:I

    const/16 v3, 0x9

    invoke-virtual {v1, v3, v12}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->و:I

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0602f8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const/16 v4, 0x10

    invoke-virtual {v1, v4, v3}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0602f9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const/16 v4, 0x11

    invoke-virtual {v1, v4, v3}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٮ:I

    iget v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    const/16 v3, 0xd

    const/high16 v4, -0x40800000    # -1.0f

    invoke-virtual {v1, v3, v4}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v3

    const/16 v6, 0xc

    invoke-virtual {v1, v6, v4}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v6

    const/16 v7, 0xa

    invoke-virtual {v1, v7, v4}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v7

    const/16 v8, 0xb

    invoke-virtual {v1, v8, v4}, Landroidx/appcompat/widget/TintTypedArray;->getDimension(IF)F

    move-result v4

    iget-object v8, v0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lآۋۻؾ۹/ئ;

    invoke-direct {v9, v8}, Lآۋۻؾ۹/ئ;-><init>(Lٽچڃ/ب;)V

    const/4 v8, 0x0

    cmpl-float v11, v3, v8

    if-ltz v11, :cond_5

    new-instance v11, Lٽچڃ/؋;

    invoke-direct {v11, v3}, Lٽچڃ/؋;-><init>(F)V

    iput-object v11, v9, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    :cond_5
    cmpl-float v3, v6, v8

    if-ltz v3, :cond_6

    new-instance v3, Lٽچڃ/؋;

    invoke-direct {v3, v6}, Lٽچڃ/؋;-><init>(F)V

    iput-object v3, v9, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    :cond_6
    cmpl-float v3, v7, v8

    if-ltz v3, :cond_7

    new-instance v3, Lٽچڃ/؋;

    invoke-direct {v3, v7}, Lٽچڃ/؋;-><init>(F)V

    iput-object v3, v9, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    :cond_7
    cmpl-float v3, v4, v8

    if-ltz v3, :cond_8

    new-instance v3, Lٽچڃ/؋;

    invoke-direct {v3, v4}, Lٽچڃ/؋;-><init>(F)V

    iput-object v3, v9, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    :cond_8
    new-instance v3, Lٽچڃ/ب;

    invoke-direct {v3, v9}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    const/4 v3, 0x7

    invoke-static {v13, v1, v3}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_a

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v4

    const v6, 0x1010367

    const v7, -0x101009e

    if-eqz v4, :cond_9

    filled-new-array {v7}, [I

    move-result-object v4

    invoke-virtual {v3, v4, v10}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڃ:I

    const v4, 0x101009c

    const v7, 0x101009e

    filled-new-array {v4, v7}, [I

    move-result-object v4

    invoke-virtual {v3, v4, v10}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    filled-new-array {v6, v7}, [I

    move-result-object v4

    invoke-virtual {v3, v4, v10}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    goto :goto_2

    :cond_9
    iget v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    const v3, 0x7f0502de

    invoke-static {v13, v3}, Landroidx/appcompat/content/res/AppCompatResources;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    filled-new-array {v7}, [I

    move-result-object v4

    invoke-virtual {v3, v4, v10}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڃ:I

    filled-new-array {v6}, [I

    move-result-object v4

    invoke-virtual {v3, v4, v10}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v3

    :goto_2
    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->څ:I

    goto :goto_3

    :cond_a
    iput v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    iput v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    iput v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڃ:I

    iput v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    iput v12, v0, Lcom/google/android/material/textfield/TextInputLayout;->څ:I

    :goto_3
    invoke-virtual {v1, v14}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-virtual {v1, v14}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    :cond_b
    const/16 v3, 0xe

    invoke-static {v13, v1, v3}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v1, v3, v12}, Landroidx/appcompat/widget/TintTypedArray;->getColor(II)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    const v3, 0x7f0502f9

    invoke-static {v13, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->پ:I

    const v3, 0x7f0502fa

    invoke-static {v13, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->چ:I

    const v3, 0x7f0502fd

    invoke-static {v13, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ٿ:I

    if-eqz v4, :cond_c

    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeColorStateList(Landroid/content/res/ColorStateList;)V

    :cond_c
    const/16 v3, 0xf

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-static {v13, v1, v3}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeErrorColor(Landroid/content/res/ColorStateList;)V

    :cond_d
    const/16 v3, 0x31

    invoke-virtual {v1, v3, v10}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v4

    if-eq v4, v10, :cond_e

    invoke-virtual {v1, v3, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintTextAppearance(I)V

    :cond_e
    const/16 v3, 0x18

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ع:Landroid/content/res/ColorStateList;

    const/16 v3, 0x19

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->غ:Landroid/content/res/ColorStateList;

    const/16 v3, 0x28

    invoke-virtual {v1, v3, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    const/16 v4, 0x23

    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    const/16 v6, 0x22

    invoke-virtual {v1, v6, v14}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v6

    const/16 v7, 0x24

    invoke-virtual {v1, v7, v12}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v7

    const/16 v8, 0x2d

    invoke-virtual {v1, v8, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v8

    const/16 v9, 0x2c

    invoke-virtual {v1, v9, v12}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v9

    const/16 v11, 0x2b

    invoke-virtual {v1, v11}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v11

    const/16 v13, 0x39

    invoke-virtual {v1, v13, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v13

    const/16 v5, 0x38

    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    const/16 v14, 0x12

    invoke-virtual {v1, v14, v12}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v14

    const/16 v12, 0x13

    invoke-virtual {v1, v12, v10}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v10

    invoke-virtual {v0, v10}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterMaxLength(I)V

    const/16 v10, 0x16

    const/4 v12, 0x0

    invoke-virtual {v1, v10, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v10

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->د:I

    const/16 v10, 0x14

    invoke-virtual {v1, v10, v12}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v10

    iput v10, v0, Lcom/google/android/material/textfield/TextInputLayout;->خ:I

    const/16 v10, 0x8

    invoke-virtual {v1, v10, v12}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v10

    invoke-virtual {v0, v10}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxBackgroundMode(I)V

    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorAccessibilityLiveRegion(I)V

    iget v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->خ:I

    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterOverflowTextAppearance(I)V

    invoke-virtual {v0, v8}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextTextAppearance(I)V

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorTextAppearance(I)V

    iget v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->د:I

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterTextAppearance(I)V

    invoke-virtual {v0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v13}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextAppearance(I)V

    const/16 v3, 0x29

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorTextColor(Landroid/content/res/ColorStateList;)V

    :cond_f
    const/16 v3, 0x2e

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextColor(Landroid/content/res/ColorStateList;)V

    :cond_10
    const/16 v3, 0x32

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    :cond_11
    const/16 v3, 0x17

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_12

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterTextColor(Landroid/content/res/ColorStateList;)V

    :cond_12
    const/16 v3, 0x15

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_13

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterOverflowTextColor(Landroid/content/res/ColorStateList;)V

    :cond_13
    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_14

    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V

    :cond_14
    new-instance v3, Lٿخ۴۟ؽ/خ;

    invoke-direct {v3, v0, v1}, Lٿخ۴۟ؽ/خ;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Landroidx/appcompat/widget/TintTypedArray;)V

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v1, v4, v5}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v4

    invoke-virtual {v1}, Landroidx/appcompat/widget/TintTypedArray;->recycle()V

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    invoke-static {v0, v5}, Landroidx/core/view/ViewCompat;->setImportantForAutofill(Landroid/view/View;I)V

    invoke-virtual {v15, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v15, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->setEnabled(Z)V

    invoke-virtual {v0, v9}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    invoke-virtual {v0, v7}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    invoke-virtual {v0, v14}, Lcom/google/android/material/textfield/TextInputLayout;->setCounterEnabled(Z)V

    invoke-virtual {v0, v11}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private getEditTextBoxBackground()Landroid/graphics/drawable/Drawable;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    instance-of v1, v0, Landroid/widget/AutoCompleteTextView;

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_1

    goto/16 :goto_2

    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    const v3, 0x7f0300fa

    invoke-static {v3, v0}, Lٳَاڂ/؋;->؋(ILandroid/view/View;)I

    move-result v0

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    sget-object v4, Lcom/google/android/material/textfield/TextInputLayout;->ڏ:[[I

    const v5, 0x3dcccccd    # 0.1f

    const/4 v6, 0x2

    if-ne v3, v6, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    const v8, 0x7f030123

    const-string v9, "TextInputLayout"

    invoke-static {v3, v9, v8}, Lٹۧ٥ؐح/ؠ;->ء(Landroid/content/Context;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object v8

    iget v9, v8, Landroid/util/TypedValue;->resourceId:I

    if-eqz v9, :cond_2

    invoke-static {v3, v9}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    goto :goto_1

    :cond_2
    iget v3, v8, Landroid/util/TypedValue;->data:I

    :goto_1
    new-instance v8, Lٽچڃ/إ;

    iget-object v9, v7, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v9, v9, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-direct {v8, v9}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    invoke-static {v0, v3, v5}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v0

    filled-new-array {v0, v2}, [I

    move-result-object v5

    new-instance v9, Landroid/content/res/ColorStateList;

    invoke-direct {v9, v4, v5}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v8, v9}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v8, v3}, Lٽچڃ/إ;->setTint(I)V

    filled-new-array {v0, v3}, [I

    move-result-object v0

    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v4, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    new-instance v0, Lٽچڃ/إ;

    iget-object v4, v7, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v4, v4, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    invoke-direct {v0, v4}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    const/4 v4, -0x1

    invoke-virtual {v0, v4}, Lٽچڃ/إ;->setTint(I)V

    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v4, v3, v8, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-array v0, v6, [Landroid/graphics/drawable/Drawable;

    aput-object v4, v0, v2

    aput-object v7, v0, v1

    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object v1

    :cond_3
    if-ne v3, v1, :cond_4

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    invoke-static {v0, v2, v5}, Lٳَاڂ/؋;->ء(IIF)I

    move-result v0

    filled-new-array {v0, v2}, [I

    move-result-object v0

    new-instance v2, Landroid/content/res/ColorStateList;

    invoke-direct {v2, v4, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    new-instance v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v0, v2, v1, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object v0

    :cond_4
    const/4 v0, 0x0

    return-object v0

    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    return-object v0
.end method

.method private getOrCreateFilledDropDownMenuBackground()Landroid/graphics/drawable/Drawable;
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ـ:Landroid/graphics/drawable/StateListDrawable;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ـ:Landroid/graphics/drawable/StateListDrawable;

    const v1, 0x10100aa

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getOrCreateOutlinedDropDownMenuBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ـ:Landroid/graphics/drawable/StateListDrawable;

    const/4 v1, 0x0

    new-array v2, v1, [I

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->ؤ(Z)Lٽچڃ/إ;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ـ:Landroid/graphics/drawable/StateListDrawable;

    return-object v0
.end method

.method private getOrCreateOutlinedDropDownMenuBackground()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؿ:Lٽچڃ/إ;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->ؤ(Z)Lٽچڃ/إ;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؿ:Lٽچڃ/إ;

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؿ:Lٽچڃ/إ;

    return-object v0
.end method

.method private setEditText(Landroid/widget/EditText;)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEndIconMode()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    instance-of v0, p1, Lcom/google/android/material/textfield/TextInputEditText;

    if-nez v0, :cond_0

    const-string v0, "TextInputLayout"

    const-string v1, "EditText added is not a TextInputEditText. Please switch to using that class instead."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؤ:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMinEms(I)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ئ:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    :goto_0
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->إ:I

    if-eq v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxEms(I)V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ا:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    :goto_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ف:Z

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ئ()V

    new-instance v1, Lٿخ۴۟ؽ/ع;

    invoke-direct {v1, p0}, Lٿخ۴۟ؽ/ع;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setTextInputAccessibilityDelegate(Lٿخ۴۟ؽ/ع;)V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    invoke-virtual {v2, v1}, Lٹ؅ڟ؀ە/ؠ;->ث(Landroid/graphics/Typeface;)V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTextSize()F

    move-result v1

    iget v3, v2, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    cmpl-float v3, v3, v1

    if-eqz v3, :cond_3

    iput v1, v2, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    invoke-virtual {v2, v0}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLetterSpacing()F

    move-result v3

    iget v4, v2, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    cmpl-float v4, v4, v3

    if-eqz v4, :cond_4

    iput v3, v2, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    invoke-virtual {v2, v0}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_4
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/TextView;->getGravity()I

    move-result v3

    and-int/lit8 v4, v3, -0x71

    or-int/lit8 v4, v4, 0x30

    iget v5, v2, Lٹ؅ڟ؀ە/ؠ;->إ:I

    if-eq v5, v4, :cond_5

    iput v4, v2, Lٹ؅ڟ؀ە/ؠ;->إ:I

    invoke-virtual {v2, v0}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_5
    iget v4, v2, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    if-eq v4, v3, :cond_6

    iput v3, v2, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    invoke-virtual {v2, v0}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_6
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    new-instance v3, Lٿخ۴۟ؽ/ظ;

    invoke-direct {v3, v0, p0}, Lٿخ۴۟ؽ/ظ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    if-nez v2, :cond_7

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    :cond_7
    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->أ:Ljava/lang/CharSequence;

    invoke-virtual {p0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    :cond_8
    iput-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    :cond_9
    const/16 v2, 0x1d

    if-lt v1, v2, :cond_a

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ح()V

    :cond_a
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->ث(Landroid/text/Editable;)V

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->د()V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    invoke-virtual {v1}, Lٿخ۴۟ؽ/ز;->ؠ()V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٸ:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lٿخ۴۟ؽ/ث;

    invoke-virtual {v4, p0}, Lٿخ۴۟ؽ/ث;->؋(Lcom/google/android/material/textfield/TextInputLayout;)V

    goto :goto_2

    :cond_c
    invoke-virtual {v1}, Lٿخ۴۟ؽ/خ;->ث()V

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    :cond_d
    invoke-virtual {p0, v0, v3}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    return-void

    :cond_e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "We already have an EditText, can only have one"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setHintInternal(Ljava/lang/CharSequence;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    if-eqz p1, :cond_0

    iget-object v1, v0, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    iput-object p1, v0, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    const/4 p1, 0x0

    iput-object p1, v0, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    iget-object v1, v0, Lٹ؅ڟ؀ە/ؠ;->ؽ:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object p1, v0, Lٹ؅ڟ؀ە/ؠ;->ؽ:Landroid/graphics/Bitmap;

    :cond_1
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_2
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ا()V

    :cond_3
    return-void
.end method

.method private setPlaceholderTextEnabled(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_2

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    :cond_3
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    return-void
.end method

.method public static ب(Landroid/view/ViewGroup;Z)V
    .locals 4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v2, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ب(Landroid/view/ViewGroup;Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public final addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_0

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v0, v0, -0x71

    or-int/lit8 v0, v0, 0x10

    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ر()V

    check-cast p1, Landroid/widget/EditText;

    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setEditText(Landroid/widget/EditText;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-void
.end method

.method public final dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/view/View;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->أ:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    invoke-virtual {v0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->أ:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    goto :goto_1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    throw p1

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getAutofillId()Landroid/view/autofill/AutofillId;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setAutofillId(Landroid/view/autofill/AutofillId;)V

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->onProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->onProvideAutofillVirtualStructure(Landroid/view/ViewStructure;I)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/ViewStructure;->setChildCount(I)V

    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v2, v1, :cond_3

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v2}, Landroid/view/ViewStructure;->newChild(I)Landroid/view/ViewStructure;

    move-result-object v3

    invoke-virtual {v1, v3, p2}, Landroid/view/View;->dispatchProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-ne v1, v4, :cond_2

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/view/ViewStructure;->setHint(Ljava/lang/CharSequence;)V

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method public final dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڍ:Z

    invoke-super {p0, p1}, Landroid/view/View;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڍ:Z

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    iget-boolean v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    iget-object v9, v0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    if-eqz v1, :cond_8

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v10

    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->غ:Ljava/lang/CharSequence;

    if-eqz v1, :cond_8

    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->أ:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_8

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v1, v1, v3

    if-lez v1, :cond_8

    iget-object v11, v9, Lٹ؅ڟ؀ە/ؠ;->ن:Landroid/text/TextPaint;

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ؿ:F

    invoke-virtual {v11, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->خ:F

    iget v2, v9, Lٹ؅ڟ؀ە/ؠ;->د:F

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ؾ:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, v3, v4

    if-eqz v4, :cond_0

    invoke-virtual {v8, v3, v3, v1, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_0
    const/4 v12, 0x0

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ٺ:I

    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    iget-boolean v3, v9, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    if-eqz v3, :cond_2

    :cond_1
    move v4, v12

    :cond_2
    if-eqz v4, :cond_7

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->خ:F

    iget-object v3, v9, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {v3, v12}, Landroid/text/StaticLayout;->getLineStart(I)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v1, v3

    invoke-virtual {v11}, Landroid/graphics/Paint;->getAlpha()I

    move-result v13

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٸ:F

    int-to-float v2, v13

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v11, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1f

    if-lt v14, v15, :cond_3

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v4, v9, Lٹ؅ڟ؀ە/ؠ;->ق:F

    iget v5, v9, Lٹ؅ڟ؀ە/ؠ;->ك:I

    invoke-virtual {v11}, Landroid/graphics/Paint;->getAlpha()I

    move-result v6

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v7

    mul-int/2addr v7, v6

    div-int/lit16 v7, v7, 0xff

    invoke-static {v5, v7}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v5

    invoke-virtual {v11, v1, v3, v4, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_3
    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {v1, v8}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٷ:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v11, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    if-lt v14, v15, :cond_4

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v2, v9, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ق:F

    iget v4, v9, Lٹ؅ڟ؀ە/ؠ;->ك:I

    invoke-virtual {v11}, Landroid/graphics/Paint;->getAlpha()I

    move-result v5

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    mul-int/2addr v6, v5

    div-int/lit16 v6, v6, 0xff

    invoke-static {v4, v6}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v4

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_4
    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {v1, v12}, Landroid/text/Layout;->getLineBaseline(I)I

    move-result v1

    iget-object v2, v9, Lٹ؅ڟ؀ە/ؠ;->ٹ:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    const/4 v5, 0x0

    int-to-float v7, v1

    move-object/from16 v1, p1

    move v6, v7

    move/from16 v16, v7

    move-object v7, v11

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    if-lt v14, v15, :cond_5

    iget v1, v9, Lٹ؅ڟ؀ە/ؠ;->ـ:F

    iget v2, v9, Lٹ؅ڟ؀ە/ؠ;->ف:F

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ق:F

    iget v4, v9, Lٹ؅ڟ؀ە/ؠ;->ك:I

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_5
    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٹ:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u2026"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v12, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_6
    move-object v2, v1

    invoke-virtual {v11, v13}, Landroid/graphics/Paint;->setAlpha(I)V

    const/4 v3, 0x0

    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {v1, v12}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move/from16 v6, v16

    move-object v7, v11

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    goto :goto_0

    :cond_7
    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v1, v9, Lٹ؅ڟ؀ە/ؠ;->ٵ:Landroid/text/StaticLayout;

    invoke-virtual {v1, v8}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    :goto_0
    invoke-virtual {v8, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_8
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    if-eqz v1, :cond_9

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    if-eqz v1, :cond_9

    invoke-virtual {v1, v8}, Lٽچڃ/إ;->draw(Landroid/graphics/Canvas;)V

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/view/View;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_9

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v3, v9, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    iget v5, v2, Landroid/graphics/Rect;->left:I

    sget-object v6, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    sub-int/2addr v5, v4

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    add-int/2addr v5, v4

    iput v5, v1, Landroid/graphics/Rect;->left:I

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v4

    int-to-float v2, v2

    mul-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int/2addr v2, v4

    iput v2, v1, Landroid/graphics/Rect;->right:I

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    invoke-virtual {v1, v8}, Lٽچڃ/إ;->draw(Landroid/graphics/Canvas;)V

    :cond_9
    return-void
.end method

.method public final drawableStateChanged()V
    .locals 4

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڌ:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڌ:Z

    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    if-eqz v3, :cond_5

    iput-object v1, v3, Lٹ؅ڟ؀ە/ؠ;->ل:[I

    iget-object v1, v3, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    iget-object v1, v3, Lٹ؅ڟ؀ە/ؠ;->ب:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    move v1, v0

    goto :goto_0

    :cond_3
    move v1, v2

    :goto_0
    if-eqz v1, :cond_4

    invoke-virtual {v3, v2}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    move v1, v0

    goto :goto_1

    :cond_4
    move v1, v2

    :goto_1
    or-int/2addr v1, v2

    goto :goto_2

    :cond_5
    move v1, v2

    :goto_2
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v3, :cond_7

    invoke-static {p0}, Landroidx/core/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_3

    :cond_6
    move v0, v2

    :goto_3
    invoke-virtual {p0, v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->د()V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    if-eqz v1, :cond_8

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_8
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڌ:Z

    return-void
.end method

.method public getBaseline()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ء()I

    move-result v0

    add-int/2addr v0, v1

    return v0

    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->getBaseline()I

    move-result v0

    return v0
.end method

.method public getBoxBackground()Lٽچڃ/إ;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    return-object v0
.end method

.method public getBoxBackgroundColor()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    return v0
.end method

.method public getBoxBackgroundMode()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    return v0
.end method

.method public getBoxCollapsedPaddingTop()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->و:I

    return v0
.end method

.method public getBoxCornerRadiusBottomEnd()F
    .locals 2

    invoke-static {p0}, Lٹ؅ڟ؀ە/د;->؋(Landroid/view/View;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ئ:Lٽچڃ/ء;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->إ:Lٽچڃ/ء;

    :goto_0
    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusBottomStart()F
    .locals 2

    invoke-static {p0}, Lٹ؅ڟ؀ە/د;->؋(Landroid/view/View;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->إ:Lٽچڃ/ء;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ئ:Lٽچڃ/ء;

    :goto_0
    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusTopEnd()F
    .locals 2

    invoke-static {p0}, Lٹ؅ڟ؀ە/د;->؋(Landroid/view/View;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    :goto_0
    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public getBoxCornerRadiusTopStart()F
    .locals 2

    invoke-static {p0}, Lٹ؅ڟ؀ە/د;->؋(Landroid/view/View;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    :goto_0
    invoke-interface {v0, v1}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v0

    return v0
.end method

.method public getBoxStrokeColor()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    return v0
.end method

.method public getBoxStrokeErrorColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBoxStrokeWidth()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    return v0
.end method

.method public getBoxStrokeWidthFocused()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٮ:I

    return v0
.end method

.method public getCounterMaxLength()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    return v0
.end method

.method public getCounterOverflowDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ة:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCounterOverflowTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ظ:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getCounterTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ط:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getCursorColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ع:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getCursorErrorColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->غ:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getDefaultHintTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getEditText()Landroid/widget/EditText;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    return-object v0
.end method

.method public getEndIconContentDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getEndIconDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getEndIconMinSize()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget v0, v0, Lٿخ۴۟ؽ/خ;->ث:I

    return v0
.end method

.method public getEndIconMode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget v0, v0, Lٿخ۴۟ؽ/خ;->ا:I

    return v0
.end method

.method public getEndIconScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ج:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getEndIconView()Lcom/google/android/material/internal/CheckableImageButton;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    return-object v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v0, Lٿخ۴۟ؽ/ز;->د:Z

    if-eqz v1, :cond_0

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->خ:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getErrorAccessibilityLiveRegion()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget v0, v0, Lٿخ۴۟ؽ/ز;->ز:I

    return v0
.end method

.method public getErrorContentDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ر:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getErrorCurrentTextColors()I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getErrorIconDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getHelperText()Ljava/lang/CharSequence;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v0, Lٿخ۴۟ؽ/ز;->ض:Z

    if-eqz v1, :cond_0

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ص:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getHelperTextCurrentTextColor()I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getHint()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getHintCollapsedTextHeight()F
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    invoke-virtual {v0}, Lٹ؅ڟ؀ە/ؠ;->آ()F

    move-result v0

    return v0
.end method

.method public final getHintCurrentCollapsedTextColor()I
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget-object v1, v0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lٹ؅ڟ؀ە/ؠ;->أ(Landroid/content/res/ColorStateList;)I

    move-result v0

    return v0
.end method

.method public getHintTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getLengthCounter()Lٿخ۴۟ؽ/غ;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ج:Lٿخ۴۟ؽ/غ;

    return-object v0
.end method

.method public getMaxEms()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->إ:I

    return v0
.end method

.method public getMaxWidth()I
    .locals 1
    .annotation build Landroidx/annotation/Px;
    .end annotation

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ا:I

    return v0
.end method

.method public getMinEms()I
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؤ:I

    return v0
.end method

.method public getMinWidth()I
    .locals 1
    .annotation build Landroidx/annotation/Px;
    .end annotation

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ئ:I

    return v0
.end method

.method public getPasswordVisibilityToggleContentDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPasswordVisibilityToggleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getPlaceholderText()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ذ:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getPlaceholderTextAppearance()I
    .locals 1
    .annotation build Landroidx/annotation/StyleRes;
    .end annotation

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ش:I

    return v0
.end method

.method public getPlaceholderTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->س:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getPrefixText()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ء:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getPrefixTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ؠ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getPrefixTextView()Landroid/widget/TextView;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ؠ:Landroidx/appcompat/widget/AppCompatTextView;

    return-object v0
.end method

.method public getShapeAppearanceModel()Lٽچڃ/ب;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    return-object v0
.end method

.method public getStartIconContentDescription()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getStartIconDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getStartIconMinSize()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget v0, v0, Lٿخ۴۟ؽ/ط;->إ:I

    return v0
.end method

.method public getStartIconScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ئ:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getSuffixText()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getSuffixTextColor()Landroid/content/res/ColorStateList;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSuffixTextView()Landroid/widget/TextView;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٵ:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    invoke-virtual {v0, p1}, Lٹ؅ڟ؀ە/ؠ;->إ(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public final onGlobalLayout()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڎ:Z

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    if-ge v2, v0, :cond_1

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    const/4 v1, 0x1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->خ()Z

    move-result v0

    if-nez v1, :cond_2

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    new-instance v1, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v2, 0xb

    invoke-direct {v1, v2, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3
    return-void
.end method

.method public final onLayout(ZIIII)V
    .locals 6

    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_15

    sget-object p2, Lٹ؅ڟ؀ە/ء;->؋:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p3

    iget-object p4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٲ:Landroid/graphics/Rect;

    const/4 p5, 0x0

    invoke-virtual {p4, p5, p5, p2, p3}, Landroid/graphics/Rect;->set(IIII)V

    sget-object p2, Lٹ؅ڟ؀ە/ء;->؋:Ljava/lang/ThreadLocal;

    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/graphics/Matrix;

    if-nez p3, :cond_0

    new-instance p3, Landroid/graphics/Matrix;

    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Landroid/graphics/Matrix;->reset()V

    :goto_0
    invoke-static {p0, p1, p3}, Lٹ؅ڟ؀ە/ء;->؋(Landroid/view/ViewParent;Landroid/view/View;Landroid/graphics/Matrix;)V

    sget-object p1, Lٹ؅ڟ؀ە/ء;->ؠ:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/RectF;

    if-nez p2, :cond_1

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_1
    invoke-virtual {p2, p4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    invoke-virtual {p3, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget p1, p2, Landroid/graphics/RectF;->left:F

    const/high16 p3, 0x3f000000    # 0.5f

    add-float/2addr p1, p3

    float-to-int p1, p1

    iget v0, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, p3

    float-to-int v0, v0

    iget v1, p2, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, p3

    float-to-int v1, v1

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr p2, p3

    float-to-int p2, p2

    invoke-virtual {p4, p1, v0, v1, p2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    if-eqz p1, :cond_2

    iget p2, p4, Landroid/graphics/Rect;->bottom:I

    iget p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    sub-int p3, p2, p3

    iget v0, p4, Landroid/graphics/Rect;->left:I

    iget v1, p4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1, v0, p3, v1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    if-eqz p1, :cond_3

    iget p2, p4, Landroid/graphics/Rect;->bottom:I

    iget p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٮ:I

    sub-int p3, p2, p3

    iget v0, p4, Landroid/graphics/Rect;->left:I

    iget v1, p4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1, v0, p3, v1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_3
    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eqz p1, :cond_15

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    move-result p1

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget p3, p2, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    cmpl-float p3, p3, p1

    if-eqz p3, :cond_4

    iput p1, p2, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    invoke-virtual {p2, p5}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_4
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getGravity()I

    move-result p1

    and-int/lit8 p3, p1, -0x71

    or-int/lit8 p3, p3, 0x30

    iget v0, p2, Lٹ؅ڟ؀ە/ؠ;->إ:I

    if-eq v0, p3, :cond_5

    iput p3, p2, Lٹ؅ڟ؀ە/ؠ;->إ:I

    invoke-virtual {p2, p5}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_5
    iget p3, p2, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    if-eq p3, p1, :cond_6

    iput p1, p2, Lٹ؅ڟ؀ە/ؠ;->ؤ:I

    invoke-virtual {p2, p5}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_6
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_14

    invoke-static {p0}, Lٹ؅ڟ؀ە/د;->؋(Landroid/view/View;)Z

    move-result p1

    iget p3, p4, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٳ:Landroid/graphics/Rect;

    iput p3, v0, Landroid/graphics/Rect;->bottom:I

    iget p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v1, 0x1

    if-eq p3, v1, :cond_8

    const/4 v2, 0x2

    if-eq p3, v2, :cond_7

    iget p3, p4, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, p3, p1}, Lcom/google/android/material/textfield/TextInputLayout;->إ(IZ)I

    move-result p3

    iput p3, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    goto :goto_1

    :cond_7
    iget p1, p4, Landroid/graphics/Rect;->left:I

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    add-int/2addr p3, p1

    iput p3, v0, Landroid/graphics/Rect;->left:I

    iget p1, p4, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ء()I

    move-result p3

    sub-int/2addr p1, p3

    iput p1, v0, Landroid/graphics/Rect;->top:I

    iget p1, p4, Landroid/graphics/Rect;->right:I

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/view/View;->getPaddingRight()I

    move-result p3

    sub-int/2addr p1, p3

    goto :goto_3

    :cond_8
    iget p3, p4, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, p3, p1}, Lcom/google/android/material/textfield/TextInputLayout;->إ(IZ)I

    move-result p3

    iput p3, v0, Landroid/graphics/Rect;->left:I

    iget p3, p4, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->و:I

    add-int/2addr p3, v2

    :goto_1
    iput p3, v0, Landroid/graphics/Rect;->top:I

    iget p3, p4, Landroid/graphics/Rect;->right:I

    if-nez p1, :cond_9

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getSuffixText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_9

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {p1}, Lٿخ۴۟ؽ/خ;->ء()I

    move-result p1

    goto :goto_2

    :cond_9
    if-eqz p1, :cond_a

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getPrefixText()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {p1}, Lٿخ۴۟ؽ/ط;->؋()I

    move-result p1

    goto :goto_2

    :cond_a
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result p1

    :goto_2
    sub-int p1, p3, p1

    :goto_3
    iput p1, v0, Landroid/graphics/Rect;->right:I

    iget p3, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v4, p2, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    iget v5, v4, Landroid/graphics/Rect;->left:I

    if-ne v5, p3, :cond_b

    iget v5, v4, Landroid/graphics/Rect;->top:I

    if-ne v5, v2, :cond_b

    iget v5, v4, Landroid/graphics/Rect;->right:I

    if-ne v5, p1, :cond_b

    iget v5, v4, Landroid/graphics/Rect;->bottom:I

    if-ne v5, v3, :cond_b

    move v5, v1

    goto :goto_4

    :cond_b
    move v5, p5

    :goto_4
    if-nez v5, :cond_c

    invoke-virtual {v4, p3, v2, p1, v3}, Landroid/graphics/Rect;->set(IIII)V

    iput-boolean v1, p2, Lٹ؅ڟ؀ە/ؠ;->م:Z

    :cond_c
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_13

    iget-object p1, p2, Lٹ؅ڟ؀ە/ؠ;->ه:Landroid/text/TextPaint;

    iget p3, p2, Lٹ؅ڟ؀ە/ؠ;->ئ:F

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p3, p2, Lٹ؅ڟ؀ە/ؠ;->س:Landroid/graphics/Typeface;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget p3, p2, Lٹ؅ڟ؀ە/ؠ;->ٳ:F

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    invoke-virtual {p1}, Landroid/graphics/Paint;->ascent()F

    move-result p1

    neg-float p1, p1

    iget p3, p4, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v2

    add-int/2addr v2, p3

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne p3, v1, :cond_d

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/TextView;->getMinLines()I

    move-result p3

    if-gt p3, v1, :cond_d

    move p3, v1

    goto :goto_5

    :cond_d
    move p3, p5

    :goto_5
    if-eqz p3, :cond_e

    invoke-virtual {p4}, Landroid/graphics/Rect;->centerY()I

    move-result p3

    int-to-float p3, p3

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p1, v2

    sub-float/2addr p3, v2

    float-to-int p3, p3

    goto :goto_6

    :cond_e
    iget p3, p4, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    move-result v2

    add-int/2addr p3, v2

    :goto_6
    iput p3, v0, Landroid/graphics/Rect;->top:I

    iget p3, p4, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v2

    sub-int/2addr p3, v2

    iput p3, v0, Landroid/graphics/Rect;->right:I

    iget p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne p3, v1, :cond_f

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/TextView;->getMinLines()I

    move-result p3

    if-gt p3, v1, :cond_f

    move p3, v1

    goto :goto_7

    :cond_f
    move p3, p5

    :goto_7
    if-eqz p3, :cond_10

    iget p3, v0, Landroid/graphics/Rect;->top:I

    int-to-float p3, p3

    add-float/2addr p3, p1

    float-to-int p1, p3

    goto :goto_8

    :cond_10
    iget p1, p4, Landroid/graphics/Rect;->bottom:I

    iget-object p3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    move-result p3

    sub-int/2addr p1, p3

    :goto_8
    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    iget p3, v0, Landroid/graphics/Rect;->left:I

    iget p4, v0, Landroid/graphics/Rect;->top:I

    iget v0, v0, Landroid/graphics/Rect;->right:I

    iget-object v2, p2, Lٹ؅ڟ؀ە/ؠ;->ء:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->left:I

    if-ne v3, p3, :cond_11

    iget v3, v2, Landroid/graphics/Rect;->top:I

    if-ne v3, p4, :cond_11

    iget v3, v2, Landroid/graphics/Rect;->right:I

    if-ne v3, v0, :cond_11

    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    if-ne v3, p1, :cond_11

    move v3, v1

    goto :goto_9

    :cond_11
    move v3, p5

    :goto_9
    if-nez v3, :cond_12

    invoke-virtual {v2, p3, p4, v0, p1}, Landroid/graphics/Rect;->set(IIII)V

    iput-boolean v1, p2, Lٹ؅ڟ؀ە/ؠ;->م:Z

    :cond_12
    invoke-virtual {p2, p5}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result p1

    if-eqz p1, :cond_15

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-nez p1, :cond_15

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ا()V

    goto :goto_a

    :cond_13
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1

    :cond_14
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1

    :cond_15
    :goto_a
    return-void
.end method

.method public final onMeasure(II)V
    .locals 4

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڎ:Z

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڎ:Z

    :cond_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/widget/TextView;->getGravity()I

    move-result p1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    :cond_1
    invoke-virtual {p2}, Lٿخ۴۟ؽ/خ;->ث()V

    return-void
.end method

.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    instance-of v0, p1, Lٿخ۴۟ؽ/ػ;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    :cond_0
    check-cast p1, Lٿخ۴۟ؽ/ػ;

    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-object v0, p1, Lٿخ۴۟ؽ/ػ;->آ:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    iget-boolean p1, p1, Lٿخ۴۟ؽ/ػ;->أ:Z

    if-eqz p1, :cond_1

    new-instance p1, Lحظتۢۋۜآظ/آ;

    const/4 v0, 0x4

    invoke-direct {p1, v0, p0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final onRtlPropertiesChanged(I)V
    .locals 8

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onRtlPropertiesChanged(I)V

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->م:Z

    if-eq p1, v1, :cond_1

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v1, v1, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    invoke-interface {v1, v2}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v1

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v3, v3, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    invoke-interface {v3, v2}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v3

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v4, v4, Lٽچڃ/ب;->ئ:Lٽچڃ/ء;

    invoke-interface {v4, v2}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v4

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v5, v5, Lٽچڃ/ب;->إ:Lٽچڃ/ء;

    invoke-interface {v5, v2}, Lٽچڃ/ء;->؋(Landroid/graphics/RectF;)F

    move-result v2

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v6, v5, Lٽچڃ/ب;->؋:Lڃٷښـ۝ۼ/ؠ;

    new-instance v7, Lآۋۻؾ۹/ئ;

    invoke-direct {v7, v0}, Lآۋۻؾ۹/ئ;-><init>(I)V

    iget-object v0, v5, Lٽچڃ/ب;->ؠ:Lڃٷښـ۝ۼ/ؠ;

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->؋:Ljava/lang/Object;

    invoke-static {v0}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iput-object v6, v7, Lآۋۻؾ۹/ئ;->ؠ:Ljava/lang/Object;

    invoke-static {v6}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iget-object v0, v5, Lٽچڃ/ب;->ء:Lڃٷښـ۝ۼ/ؠ;

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->آ:Ljava/lang/Object;

    invoke-static {v0}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iget-object v0, v5, Lٽچڃ/ب;->آ:Lڃٷښـ۝ۼ/ؠ;

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->ء:Ljava/lang/Object;

    invoke-static {v0}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, v3}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, v1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, v2}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/؋;

    invoke-direct {v0, v4}, Lٽچڃ/؋;-><init>(F)V

    iput-object v0, v7, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    new-instance v0, Lٽچڃ/ب;

    invoke-direct {v0, v7}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->م:Z

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_1
    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Parcelable;
    .locals 5

    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Lٿخ۴۟ؽ/ػ;

    invoke-direct {v1, v0}, Lٿخ۴۟ؽ/ػ;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getError()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lٿخ۴۟ؽ/ػ;->آ:Ljava/lang/CharSequence;

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget v2, v0, Lٿخ۴۟ؽ/خ;->ا:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    move v2, v4

    :goto_0
    if-eqz v2, :cond_2

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v3, v4

    :goto_1
    iput-boolean v3, v1, Lٿخ۴۟ؽ/ػ;->أ:Z

    return-object v1
.end method

.method public setBoxBackgroundColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->څ:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ؠ()V

    :cond_0
    return-void
.end method

.method public setBoxBackgroundColorResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxBackgroundColor(I)V

    return-void
.end method

.method public setBoxBackgroundColorStateList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    const v0, -0x101009e

    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڃ:I

    const v0, 0x101009c

    const v2, 0x101009e

    filled-new-array {v0, v2}, [I

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    const v0, 0x1010367

    filled-new-array {v0, v2}, [I

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->څ:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ؠ()V

    return-void
.end method

.method public setBoxBackgroundMode(I)V
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ئ()V

    :cond_1
    return-void
.end method

.method public setBoxCollapsedPaddingTop(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->و:I

    return-void
.end method

.method public setBoxCornerFamily(I)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lآۋۻؾ۹/ئ;

    invoke-direct {v1, v0}, Lآۋۻؾ۹/ئ;-><init>(Lٽچڃ/ب;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->أ:Lٽچڃ/ء;

    invoke-static {p1}, Lسۄھؤۏ۫/؋;->ت(I)Lڃٷښـ۝ۼ/ؠ;

    move-result-object v2

    iput-object v2, v1, Lآۋۻؾ۹/ئ;->؋:Ljava/lang/Object;

    invoke-static {v2}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ؤ:Lٽچڃ/ء;

    invoke-static {p1}, Lسۄھؤۏ۫/؋;->ت(I)Lڃٷښـ۝ۼ/ؠ;

    move-result-object v2

    iput-object v2, v1, Lآۋۻؾ۹/ئ;->ؠ:Ljava/lang/Object;

    invoke-static {v2}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->ئ:Lٽچڃ/ء;

    invoke-static {p1}, Lسۄھؤۏ۫/؋;->ت(I)Lڃٷښـ۝ۼ/ؠ;

    move-result-object v2

    iput-object v2, v1, Lآۋۻؾ۹/ئ;->آ:Ljava/lang/Object;

    invoke-static {v2}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    iget-object v0, v0, Lٽچڃ/ب;->إ:Lٽچڃ/ء;

    invoke-static {p1}, Lسۄھؤۏ۫/؋;->ت(I)Lڃٷښـ۝ۼ/ؠ;

    move-result-object p1

    iput-object p1, v1, Lآۋۻؾ۹/ئ;->ء:Ljava/lang/Object;

    invoke-static {p1}, Lآۋۻؾ۹/ئ;->ؠ(Lڃٷښـ۝ۼ/ؠ;)V

    iput-object v0, v1, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    new-instance p1, Lٽچڃ/ب;

    invoke-direct {p1, v1}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ؠ()V

    return-void
.end method

.method public setBoxStrokeColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    :cond_0
    return-void
.end method

.method public setBoxStrokeColorStateList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->پ:I

    const v0, -0x101009e

    filled-new-array {v0}, [I

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->چ:I

    const v0, 0x1010367

    const v2, 0x101009e

    filled-new-array {v0, v2}, [I

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٿ:I

    const v0, 0x101009c

    filled-new-array {v0, v2}, [I

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    :goto_0
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    goto :goto_1

    :cond_0
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    return-void
.end method

.method public setBoxStrokeErrorColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    :cond_0
    return-void
.end method

.method public setBoxStrokeWidth(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    return-void
.end method

.method public setBoxStrokeWidthFocused(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٮ:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    return-void
.end method

.method public setBoxStrokeWidthFocusedResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeWidthFocused(I)V

    return-void
.end method

.method public setBoxStrokeWidthResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setBoxStrokeWidth(I)V

    return-void
.end method

.method public setCounterEnabled(Z)V
    .locals 5

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ة:Z

    if-eq v0, p1, :cond_4

    const/4 v0, 0x0

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    if-eqz p1, :cond_2

    new-instance v3, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    const v4, 0x7f08020a

    invoke-virtual {v3, v4}, Landroid/view/View;->setId(I)V

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٵ:Landroid/graphics/Typeface;

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v2, v3, v1}, Lٿخ۴۟ؽ/ز;->؋(Landroid/widget/TextView;I)V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0602fa

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    invoke-static {v1, v2}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->ث(Landroid/text/Editable;)V

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v2, v3, v1}, Lٿخ۴۟ؽ/ز;->إ(Landroid/widget/TextView;I)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    :cond_3
    :goto_1
    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ة:Z

    :cond_4
    return-void
.end method

.method public setCounterMaxLength(I)V
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    if-eq v0, p1, :cond_2

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ة:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    :goto_1
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ث(Landroid/text/Editable;)V

    :cond_2
    return-void
.end method

.method public setCounterOverflowTextAppearance(I)V
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->خ:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->خ:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    :cond_0
    return-void
.end method

.method public setCounterOverflowTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ظ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ظ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    :cond_0
    return-void
.end method

.method public setCounterTextAppearance(I)V
    .locals 1

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->د:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->د:I

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    :cond_0
    return-void
.end method

.method public setCounterTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ط:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ط:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    :cond_0
    return-void
.end method

.method public setCursorColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ع:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ع:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ح()V

    :cond_0
    return-void
.end method

.method public setCursorErrorColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1d
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->غ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_2

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->غ:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ح()V

    :cond_2
    return-void
.end method

.method public setDefaultHintTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ب(Landroid/view/ViewGroup;Z)V

    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public setEndIconActivated(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setActivated(Z)V

    return-void
.end method

.method public setEndIconCheckable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    return-void
.end method

.method public setEndIconContentDescription(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    if-eq v1, p1, :cond_1

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public setEndIconContentDescription(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    if-eq v1, p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setEndIconDrawable(I)V
    .locals 4
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_1

    iget-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v3, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v3, v1, p1, v2}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    iget-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    invoke-static {v3, v1, p1}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    :cond_1
    return-void
.end method

.method public setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_0

    iget-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v3, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v3, v1, p1, v2}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    iget-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    invoke-static {v3, v1, p1}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setEndIconMinSize(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-ltz p1, :cond_1

    iget v1, v0, Lٿخ۴۟ؽ/خ;->ث:I

    if-eq p1, v1, :cond_0

    iput p1, v0, Lٿخ۴۟ؽ/خ;->ث:I

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v1, p1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v1, p1}, Landroid/view/View;->setMinimumHeight(I)V

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "endIconSize cannot be less than 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEndIconMode(I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/خ;->إ(I)V

    return-void
.end method

.method public setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ح:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setEndIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ح:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v0, p1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setEndIconScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 2
    .param p1    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ج:Landroid/widget/ImageView$ScaleType;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method

.method public setEndIconTintList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setEndIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, v1, p1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setEndIconVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/خ;->ئ(Z)V

    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .locals 4
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v0, Lٿخ۴۟ؽ/ز;->د:Z

    const/4 v2, 0x1

    if-nez v1, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setErrorEnabled(Z)V

    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ء()V

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->خ:Ljava/lang/CharSequence;

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v1, v0, Lٿخ۴۟ؽ/ز;->ج:I

    if-eq v1, v2, :cond_2

    iput v2, v0, Lٿخ۴۟ؽ/ز;->ح:I

    :cond_2
    iget v2, v0, Lٿخ۴۟ؽ/ز;->ح:I

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, v3, p1}, Lٿخ۴۟ؽ/ز;->ئ(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result p1

    invoke-virtual {v0, v1, v2, p1}, Lٿخ۴۟ؽ/ز;->ا(IIZ)V

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ؤ()V

    :goto_0
    return-void
.end method

.method public setErrorAccessibilityLiveRegion(I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput p1, v0, Lٿخ۴۟ؽ/ز;->ز:I

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-static {v0, p1}, Landroidx/core/view/ViewCompat;->setAccessibilityLiveRegion(Landroid/view/View;I)V

    :cond_0
    return-void
.end method

.method public setErrorContentDescription(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->ر:Ljava/lang/CharSequence;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setErrorEnabled(Z)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v0, Lٿخ۴۟ؽ/ز;->د:Z

    if-ne v1, p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ء()V

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ئ:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v2, 0x0

    if-eqz p1, :cond_6

    new-instance v3, Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v4, v0, Lٿخ۴۟ؽ/ز;->إ:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    const v4, 0x7f08020b

    invoke-virtual {v3, v4}, Landroid/view/View;->setId(I)V

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Landroid/view/View;->setTextAlignment(I)V

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->غ:Landroid/graphics/Typeface;

    if-eqz v3, :cond_1

    iget-object v4, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_1
    iget v3, v0, Lٿخ۴۟ؽ/ز;->س:I

    iput v3, v0, Lٿخ۴۟ؽ/ز;->س:I

    iget-object v4, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v4, :cond_2

    invoke-virtual {v1, v4, v3}, Lcom/google/android/material/textfield/TextInputLayout;->ة(Landroid/widget/TextView;I)V

    :cond_2
    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ش:Landroid/content/res/ColorStateList;

    iput-object v1, v0, Lٿخ۴۟ؽ/ز;->ش:Landroid/content/res/ColorStateList;

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_3
    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ر:Ljava/lang/CharSequence;

    iput-object v1, v0, Lٿخ۴۟ؽ/ز;->ر:Ljava/lang/CharSequence;

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_4

    invoke-virtual {v3, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_4
    iget v1, v0, Lٿخ۴۟ؽ/ز;->ز:I

    iput v1, v0, Lٿخ۴۟ؽ/ز;->ز:I

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_5

    invoke-static {v3, v1}, Landroidx/core/view/ViewCompat;->setAccessibilityLiveRegion(Landroid/view/View;I)V

    :cond_5
    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, v1, v2}, Lٿخ۴۟ؽ/ز;->؋(Landroid/widget/TextView;I)V

    goto :goto_0

    :cond_6
    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ؤ()V

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, v3, v2}, Lٿخ۴۟ؽ/ز;->إ(Landroid/widget/TextView;I)V

    const/4 v2, 0x0

    iput-object v2, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->د()V

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    :goto_0
    iput-boolean p1, v0, Lٿخ۴۟ؽ/ز;->د:Z

    :goto_1
    return-void
.end method

.method public setErrorIconDrawable(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/خ;->ا(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, v0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v1, v0, p1}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setErrorIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/خ;->ا(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setErrorIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ؤ:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v1, v0}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setErrorIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ؤ:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v0, p1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setErrorIconTintList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->أ:Landroid/graphics/PorterDuff$Mode;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setErrorIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->أ:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->أ:Landroid/graphics/PorterDuff$Mode;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, v1, p1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setErrorTextAppearance(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput p1, v0, Lٿخ۴۟ؽ/ز;->س:I

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ئ:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v1, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ة(Landroid/widget/TextView;I)V

    :cond_0
    return-void
.end method

.method public setErrorTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->ش:Landroid/content/res/ColorStateList;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setExpandedHintEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ډ:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ډ:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    :cond_0
    return-void
.end method

.method public setHelperText(Ljava/lang/CharSequence;)V
    .locals 4
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    if-eqz v0, :cond_0

    iget-boolean p1, v1, Lٿخ۴۟ؽ/ز;->ض:Z

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    goto :goto_0

    :cond_0
    iget-boolean v0, v1, Lٿخ۴۟ؽ/ز;->ض:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHelperTextEnabled(Z)V

    :cond_1
    invoke-virtual {v1}, Lٿخ۴۟ؽ/ز;->ء()V

    iput-object p1, v1, Lٿخ۴۟ؽ/ز;->ص:Ljava/lang/CharSequence;

    iget-object v0, v1, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v0, v1, Lٿخ۴۟ؽ/ز;->ج:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    iput v2, v1, Lٿخ۴۟ؽ/ز;->ح:I

    :cond_2
    iget v2, v1, Lٿخ۴۟ؽ/ز;->ح:I

    iget-object v3, v1, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, v3, p1}, Lٿخ۴۟ؽ/ز;->ئ(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result p1

    invoke-virtual {v1, v0, v2, p1}, Lٿخ۴۟ؽ/ز;->ا(IIZ)V

    :cond_3
    :goto_0
    return-void
.end method

.method public setHelperTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->ع:Landroid/content/res/ColorStateList;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setHelperTextEnabled(Z)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v0, Lٿخ۴۟ؽ/ز;->ض:Z

    if-ne v1, p1, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ء()V

    const/4 v1, 0x1

    if-eqz p1, :cond_4

    new-instance v2, Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->إ:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    const v3, 0x7f08020c

    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/view/View;->setTextAlignment(I)V

    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->غ:Landroid/graphics/Typeface;

    if-eqz v2, :cond_1

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_1
    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v2, v1}, Landroidx/core/view/ViewCompat;->setAccessibilityLiveRegion(Landroid/view/View;I)V

    iget v2, v0, Lٿخ۴۟ؽ/ز;->ظ:I

    iput v2, v0, Lٿخ۴۟ؽ/ز;->ظ:I

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_2

    invoke-static {v3, v2}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    :cond_2
    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ع:Landroid/content/res/ColorStateList;

    iput-object v2, v0, Lٿخ۴۟ؽ/ز;->ع:Landroid/content/res/ColorStateList;

    iget-object v3, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_3
    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, v2, v1}, Lٿخ۴۟ؽ/ز;->؋(Landroid/widget/TextView;I)V

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    new-instance v2, Lٿخ۴۟ؽ/ر;

    invoke-direct {v2, v0}, Lٿخ۴۟ؽ/ر;-><init>(Lٿخ۴۟ؽ/ز;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lٿخ۴۟ؽ/ز;->ء()V

    iget v2, v0, Lٿخ۴۟ؽ/ز;->ج:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    const/4 v3, 0x0

    iput v3, v0, Lٿخ۴۟ؽ/ز;->ح:I

    :cond_5
    iget v3, v0, Lٿخ۴۟ؽ/ز;->ح:I

    iget-object v4, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    const-string v5, ""

    invoke-virtual {v0, v4, v5}, Lٿخ۴۟ؽ/ز;->ئ(Landroid/widget/TextView;Ljava/lang/CharSequence;)Z

    move-result v4

    invoke-virtual {v0, v2, v3, v4}, Lٿخ۴۟ؽ/ز;->ا(IIZ)V

    iget-object v2, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, v2, v1}, Lٿخ۴۟ؽ/ز;->إ(Landroid/widget/TextView;I)V

    const/4 v1, 0x0

    iput-object v1, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ئ:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->د()V

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    :goto_0
    iput-boolean p1, v0, Lٿخ۴۟ؽ/ز;->ض:Z

    :goto_1
    return-void
.end method

.method public setHelperTextTextAppearance(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iput p1, v0, Lٿخ۴۟ؽ/ز;->ظ:I

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-static {v0, p1}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    :cond_0
    return-void
.end method

.method public setHint(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHintInternal(Ljava/lang/CharSequence;)V

    const/16 p1, 0x800

    invoke-virtual {p0, p1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_0
    return-void
.end method

.method public setHintAnimationEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڊ:Z

    return-void
.end method

.method public setHintEnabled(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eq p1, v0, :cond_4

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    const/4 v0, 0x0

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setHintInternal(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    :cond_2
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    :cond_3
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؽ:Z

    :goto_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ر()V

    :cond_4
    return-void
.end method

.method public setHintTextAppearance(I)V
    .locals 5
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    new-instance v0, Lٹۧ٥ؐح/ؤ;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget-object v2, v1, Lٹ؅ڟ؀ە/ؠ;->؋:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3, p1}, Lٹۧ٥ؐح/ؤ;-><init>(Landroid/content/Context;I)V

    iget-object p1, v0, Lٹۧ٥ؐح/ؤ;->ب:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_0

    iput-object p1, v1, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    :cond_0
    iget p1, v0, Lٹۧ٥ؐح/ؤ;->ة:F

    const/4 v3, 0x0

    cmpl-float v3, p1, v3

    if-eqz v3, :cond_1

    iput p1, v1, Lٹ؅ڟ؀ە/ؠ;->ا:F

    :cond_1
    iget-object p1, v0, Lٹۧ٥ؐح/ؤ;->؋:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_2

    iput-object p1, v1, Lٹ؅ڟ؀ە/ؠ;->ٱ:Landroid/content/res/ColorStateList;

    :cond_2
    iget p1, v0, Lٹۧ٥ؐح/ؤ;->أ:F

    iput p1, v1, Lٹ؅ڟ؀ە/ؠ;->ٮ:F

    iget p1, v0, Lٹۧ٥ؐح/ؤ;->ؤ:F

    iput p1, v1, Lٹ؅ڟ؀ە/ؠ;->ٯ:F

    iget p1, v0, Lٹۧ٥ؐح/ؤ;->إ:F

    iput p1, v1, Lٹ؅ڟ؀ە/ؠ;->ي:F

    iget p1, v0, Lٹۧ٥ؐح/ؤ;->ا:F

    iput p1, v1, Lٹ؅ڟ؀ە/ؠ;->ٲ:F

    iget-object p1, v1, Lٹ؅ڟ؀ە/ؠ;->ط:Lٹۧ٥ؐح/؋;

    if-eqz p1, :cond_3

    const/4 v3, 0x1

    iput-boolean v3, p1, Lٹۧ٥ؐح/؋;->ء:Z

    :cond_3
    new-instance p1, Lٹۧ٥ؐح/؋;

    new-instance v3, Lڙڧا/ء;

    invoke-direct {v3, v1}, Lڙڧا/ء;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lٹۧ٥ؐح/ؤ;->؋()V

    iget-object v4, v0, Lٹۧ٥ؐح/ؤ;->ج:Landroid/graphics/Typeface;

    invoke-direct {p1, v3, v4}, Lٹۧ٥ؐح/؋;-><init>(Lڙڧا/ء;Landroid/graphics/Typeface;)V

    iput-object p1, v1, Lٹ؅ڟ؀ە/ؠ;->ط:Lٹۧ٥ؐح/؋;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v2, v1, Lٹ؅ڟ؀ە/ؠ;->ط:Lٹۧ٥ؐح/؋;

    invoke-virtual {v0, p1, v2}, Lٹۧ٥ؐح/ؤ;->ء(Landroid/content/Context;Lٹۧ٥ؐح/إ;)V

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    iget-object v0, v1, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_4

    invoke-virtual {p0, p1, p1}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ر()V

    :cond_4
    return-void
.end method

.method public setHintTextColor(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget-object v2, v0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    if-eq v2, p1, :cond_0

    iput-object p1, v0, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_1

    invoke-virtual {p0, v1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    :cond_1
    return-void
.end method

.method public setLengthCounter(Lٿخ۴۟ؽ/غ;)V
    .locals 0
    .param p1    # Lٿخ۴۟ؽ/غ;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ج:Lٿخ۴۟ؽ/غ;

    return-void
.end method

.method public setMaxEms(I)V
    .locals 2

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->إ:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxEms(I)V

    :cond_0
    return-void
.end method

.method public setMaxWidth(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/Px;
        .end annotation
    .end param

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ا:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    :cond_0
    return-void
.end method

.method public setMaxWidthResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setMaxWidth(I)V

    return-void
.end method

.method public setMinEms(I)V
    .locals 2

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؤ:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMinEms(I)V

    :cond_0
    return-void
.end method

.method public setMinWidth(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/Px;
        .end annotation
    .end param

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ئ:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMinWidth(I)V

    :cond_0
    return-void
.end method

.method public setMinWidthResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setMinWidth(I)V

    return-void
.end method

.method public setPasswordVisibilityToggleContentDescription(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setPasswordVisibilityToggleContentDescription(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setPasswordVisibilityToggleDrawable(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPasswordVisibilityToggleDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPasswordVisibilityToggleEnabled(Z)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    if-eqz p1, :cond_0

    iget v1, v0, Lٿخ۴۟ؽ/خ;->ا:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, v2}, Lٿخ۴۟ؽ/خ;->إ(I)V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/خ;->إ(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    return-void
.end method

.method public setPasswordVisibilityToggleTintList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public setPasswordVisibilityToggleTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iput-object p1, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, v1, p1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public setPlaceholderText(Ljava/lang/CharSequence;)V
    .locals 3
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-nez v0, :cond_0

    new-instance v0, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    const v1, 0x7f08020d

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->آ()Landroidx/transition/Fade;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ص:Landroidx/transition/Fade;

    const-wide/16 v1, 0x43

    invoke-virtual {v0, v1, v2}, Landroidx/transition/Transition;->setStartDelay(J)Landroidx/transition/Transition;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->آ()Landroidx/transition/Fade;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ض:Landroidx/transition/Fade;

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ش:I

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextAppearance(I)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->س:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setPlaceholderTextEnabled(Z)V

    :cond_2
    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ذ:Ljava/lang/CharSequence;

    :goto_0
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez p1, :cond_3

    const/4 p1, 0x0

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    :goto_1
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->س(Landroid/text/Editable;)V

    return-void
.end method

.method public setPlaceholderTextAppearance(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    iput p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ش:I

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    invoke-static {v0, p1}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    :cond_0
    return-void
.end method

.method public setPlaceholderTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->س:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->س:Landroid/content/res/ColorStateList;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setPrefixText(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    iput-object v1, v0, Lٿخ۴۟ؽ/ط;->ء:Ljava/lang/CharSequence;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->ؠ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lٿخ۴۟ؽ/ط;->أ()V

    return-void
.end method

.method public setPrefixTextAppearance(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ؠ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v0, p1}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    return-void
.end method

.method public setPrefixTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->ؠ:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setShapeAppearanceModel(Lٽچڃ/ب;)V
    .locals 1
    .param p1    # Lٽچڃ/ب;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, v0, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ؠ()V

    :cond_0
    return-void
.end method

.method public setStartIconCheckable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    return-void
.end method

.method public setStartIconContentDescription(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setStartIconContentDescription(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    if-eq v1, p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setStartIconDrawable(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->setStartIconDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStartIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/ط;->ؠ(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStartIconMinSize(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    if-ltz p1, :cond_1

    iget v1, v0, Lٿخ۴۟ؽ/ط;->إ:I

    if-eq p1, v1, :cond_0

    iput p1, v0, Lٿخ۴۟ؽ/ط;->إ:I

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_0
    return-void

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "startIconSize cannot be less than 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setStartIconOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->ا:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setStartIconOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iput-object p1, v0, Lٿخ۴۟ؽ/ط;->ا:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v0, p1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public setStartIconScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1
    .param p1    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iput-object p1, v0, Lٿخ۴۟ؽ/ط;->ئ:Landroid/widget/ImageView$ScaleType;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method

.method public setStartIconTintList(Landroid/content/res/ColorStateList;)V
    .locals 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->أ:Landroid/content/res/ColorStateList;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/ط;->أ:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->ؤ:Landroid/graphics/PorterDuff$Mode;

    iget-object v2, v0, Lٿخ۴۟ؽ/ط;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setStartIconTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->ؤ:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, p1, :cond_0

    iput-object p1, v0, Lٿخ۴۟ؽ/ط;->ؤ:Landroid/graphics/PorterDuff$Mode;

    iget-object v1, v0, Lٿخ۴۟ؽ/ط;->أ:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Lٿخ۴۟ؽ/ط;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, v0, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v2, v0, v1, p1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setStartIconVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/ط;->ء(Z)V

    return-void
.end method

.method public setSuffixText(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    iput-object v1, v0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    iget-object v1, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lٿخ۴۟ؽ/خ;->ج()V

    return-void
.end method

.method public setSuffixTextAppearance(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v0, p1}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    return-void
.end method

.method public setSuffixTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTextInputAccessibilityDelegate(Lٿخ۴۟ؽ/ع;)V
    .locals 1
    .param p1    # Lٿخ۴۟ؽ/ع;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-static {v0, p1}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    :cond_0
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 2
    .param p1    # Landroid/graphics/Typeface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٵ:Landroid/graphics/Typeface;

    if-eq p1, v0, :cond_2

    iput-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٵ:Landroid/graphics/Typeface;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    invoke-virtual {v0, p1}, Lٹ؅ڟ؀ە/ؠ;->ث(Landroid/graphics/Typeface;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->غ:Landroid/graphics/Typeface;

    if-eq p1, v1, :cond_1

    iput-object p1, v0, Lٿخ۴۟ؽ/ز;->غ:Landroid/graphics/Typeface;

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ط:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_2
    return-void
.end method

.method public final ؋(F)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget v1, v0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    const/4 v2, 0x1

    if-nez v1, :cond_1

    new-instance v1, Landroid/animation/ValueAnimator;

    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lؿ١ڔظۇٟؗٞ/؋;->ؠ:Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    const v5, 0x7f030335

    invoke-static {v3, v5, v4}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f03032b

    const/16 v5, 0xa7

    invoke-static {v3, v4, v5}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    new-instance v3, Lك۰ێخڊعءآ/ؠ;

    invoke-direct {v3, v2, p0}, Lك۰ێخڊعءآ/ؠ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_1
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    const/4 v3, 0x2

    new-array v3, v3, [F

    iget v0, v0, Lٹ؅ڟ؀ە/ؠ;->ؠ:F

    const/4 v4, 0x0

    aput v0, v3, v4

    aput p1, v3, v2

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final ؠ()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v1, v1, Lٽچڃ/ؤ;->؋:Lٽچڃ/ب;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    if-eq v1, v2, :cond_1

    invoke-virtual {v0, v2}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    :cond_1
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v1, 0x2

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v1, :cond_3

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    if-le v0, v2, :cond_2

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    if-eqz v0, :cond_2

    move v0, v4

    goto :goto_0

    :cond_2
    move v0, v3

    :goto_0
    if-eqz v0, :cond_3

    move v0, v4

    goto :goto_1

    :cond_3
    move v0, v3

    :goto_1
    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    int-to-float v1, v1

    iget v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    iget-object v6, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iput v1, v6, Lٽچڃ/ؤ;->ة:F

    invoke-virtual {v0}, Lٽچڃ/إ;->invalidateSelf()V

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v5, v0, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v6, v5, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    if-eq v6, v1, :cond_4

    iput-object v1, v5, Lٽچڃ/ؤ;->آ:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lٽچڃ/إ;->onStateChange([I)Z

    :cond_4
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne v1, v4, :cond_5

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f030123

    invoke-static {v0, v1, v3}, Lٳَاڂ/؋;->ؠ(Landroid/content/Context;II)I

    move-result v0

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    invoke-static {v1, v0}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result v0

    :cond_5
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    if-eqz v0, :cond_a

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    if-nez v1, :cond_6

    goto :goto_3

    :cond_6
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    if-le v1, v2, :cond_7

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    if-eqz v1, :cond_7

    move v3, v4

    :cond_7
    if-eqz v3, :cond_9

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/view/View;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_8

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->پ:I

    goto :goto_2

    :cond_8
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    :goto_2
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_a
    :goto_3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ذ()V

    return-void
.end method

.method public final ء()I
    .locals 4

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    if-eqz v0, :cond_2

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    return v1

    :cond_1
    invoke-virtual {v2}, Lٹ؅ڟ؀ە/ؠ;->آ()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    :goto_0
    float-to-int v0, v0

    return v0

    :cond_2
    invoke-virtual {v2}, Lٹ؅ڟ؀ە/ؠ;->آ()F

    move-result v0

    goto :goto_0
.end method

.method public final آ()Landroidx/transition/Fade;
    .locals 4

    new-instance v0, Landroidx/transition/Fade;

    invoke-direct {v0}, Landroidx/transition/Fade;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f03032d

    const/16 v3, 0x57

    invoke-static {v1, v2, v3}, Lںڍڒڸ/ش;->ٴ(Landroid/content/Context;II)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroidx/transition/Transition;->setDuration(J)Landroidx/transition/Transition;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lؿ١ڔظۇٟؗٞ/؋;->؋:Landroid/view/animation/LinearInterpolator;

    const v3, 0x7f030337

    invoke-static {v1, v3, v2}, Lںڍڒڸ/ش;->ٵ(Landroid/content/Context;ILandroid/view/animation/Interpolator;)Landroid/animation/TimeInterpolator;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/transition/Transition;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroidx/transition/Transition;

    return-object v0
.end method

.method public final أ()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؼ:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    instance-of v0, v0, Lٿخ۴۟ؽ/ئ;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ؤ(Z)Lٽچڃ/إ;
    .locals 5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0602de

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    int-to-float v0, v0

    if-eqz p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    instance-of v2, v1, Lٿخ۴۟ؽ/ص;

    if-eqz v2, :cond_1

    check-cast v1, Lٿخ۴۟ؽ/ص;

    invoke-virtual {v1}, Lٿخ۴۟ؽ/ص;->getPopupElevation()F

    move-result v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06014f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    int-to-float v1, v1

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06029f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    new-instance v3, Lآۋۻؾ۹/ئ;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lآۋۻؾ۹/ئ;-><init>(I)V

    new-instance v4, Lٽچڃ/؋;

    invoke-direct {v4, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v4, v3, Lآۋۻؾ۹/ئ;->أ:Ljava/lang/Object;

    new-instance v4, Lٽچڃ/؋;

    invoke-direct {v4, p1}, Lٽچڃ/؋;-><init>(F)V

    iput-object v4, v3, Lآۋۻؾ۹/ئ;->ؤ:Ljava/lang/Object;

    new-instance p1, Lٽچڃ/؋;

    invoke-direct {p1, v0}, Lٽچڃ/؋;-><init>(F)V

    iput-object p1, v3, Lآۋۻؾ۹/ئ;->ئ:Ljava/lang/Object;

    new-instance p1, Lٽچڃ/؋;

    invoke-direct {p1, v0}, Lٽچڃ/؋;-><init>(F)V

    iput-object p1, v3, Lآۋۻؾ۹/ئ;->إ:Ljava/lang/Object;

    new-instance p1, Lٽچڃ/ب;

    invoke-direct {p1, v3}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    instance-of v3, v0, Lٿخ۴۟ؽ/ص;

    if-eqz v3, :cond_2

    check-cast v0, Lٿخ۴۟ؽ/ص;

    invoke-virtual {v0}, Lٿخ۴۟ؽ/ص;->getDropDownBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v0, :cond_4

    sget-object v0, Lٽچڃ/إ;->ص:Landroid/graphics/Paint;

    const-class v0, Lٽچڃ/إ;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const v4, 0x7f030123

    invoke-static {v3, v0, v4}, Lٹۧ٥ؐح/ؠ;->ء(Landroid/content/Context;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object v0

    iget v4, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v4, :cond_3

    invoke-static {v3, v4}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    goto :goto_3

    :cond_3
    iget v0, v0, Landroid/util/TypedValue;->data:I

    :goto_3
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :cond_4
    new-instance v4, Lٽچڃ/إ;

    invoke-direct {v4}, Lٽچڃ/إ;-><init>()V

    invoke-virtual {v4, v3}, Lٽچڃ/إ;->ئ(Landroid/content/Context;)V

    invoke-virtual {v4, v0}, Lٽچڃ/إ;->ب(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v1}, Lٽچڃ/إ;->ا(F)V

    invoke-virtual {v4, p1}, Lٽچڃ/إ;->setShapeAppearanceModel(Lٽچڃ/ب;)V

    iget-object p1, v4, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object v0, p1, Lٽچڃ/ؤ;->ئ:Landroid/graphics/Rect;

    if-nez v0, :cond_5

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p1, Lٽچڃ/ؤ;->ئ:Landroid/graphics/Rect;

    :cond_5
    iget-object p1, v4, Lٽچڃ/إ;->؋:Lٽچڃ/ؤ;

    iget-object p1, p1, Lٽچڃ/ؤ;->ئ:Landroid/graphics/Rect;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v2, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v4}, Lٽچڃ/إ;->invalidateSelf()V

    return-object v4
.end method

.method public final إ(IZ)I
    .locals 1

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getPrefixText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    invoke-virtual {p2}, Lٿخ۴۟ؽ/ط;->؋()I

    move-result p2

    :goto_0
    add-int/2addr p2, p1

    return p2

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getSuffixText()Ljava/lang/CharSequence;

    move-result-object p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {p2}, Lٿخ۴۟ؽ/خ;->ء()I

    move-result p2

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result p2

    goto :goto_0
.end method

.method public final ئ()V
    .locals 8

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_4

    if-eq v0, v2, :cond_3

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ػ:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    instance-of v0, v0, Lٿخ۴۟ؽ/ئ;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    sget v4, Lٿخ۴۟ؽ/ئ;->ط:I

    new-instance v4, Lٿخ۴۟ؽ/ؤ;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lٽچڃ/ب;

    invoke-direct {v0}, Lٽچڃ/ب;-><init>()V

    :goto_0
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    invoke-direct {v4, v0, v5}, Lٿخ۴۟ؽ/ؤ;-><init>(Lٽچڃ/ب;Landroid/graphics/RectF;)V

    new-instance v0, Lٿخ۴۟ؽ/إ;

    invoke-direct {v0, v4}, Lٿخ۴۟ؽ/إ;-><init>(Lٿخ۴۟ؽ/ؤ;)V

    goto :goto_1

    :cond_1
    new-instance v0, Lٽچڃ/إ;

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-direct {v0, v4}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    :goto_1
    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is illegal; only @BoxBackgroundMode constants are supported."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Lٽچڃ/إ;

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ل:Lٽچڃ/ب;

    invoke-direct {v0, v3}, Lٽچڃ/إ;-><init>(Lٽچڃ/ب;)V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    new-instance v0, Lٽچڃ/إ;

    invoke-direct {v0}, Lٽچڃ/إ;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    new-instance v0, Lٽچڃ/إ;

    invoke-direct {v0}, Lٽچڃ/إ;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    goto :goto_3

    :cond_4
    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    :goto_2
    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ق:Lٽچڃ/إ;

    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ك:Lٽچڃ/إ;

    :goto_3
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ذ()V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v3, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v0, v2, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v0, v0, v4

    if-ltz v0, :cond_5

    move v0, v2

    goto :goto_4

    :cond_5
    move v0, v3

    :goto_4
    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f060236

    goto :goto_5

    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lٹۧ٥ؐح/ء;->آ(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f060235

    :goto_5
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->و:I

    :cond_7
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_b

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-eq v0, v2, :cond_8

    goto :goto_7

    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v0, v0, v4

    if-ltz v0, :cond_9

    move v3, v2

    :cond_9
    if-eqz v3, :cond_a

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060234

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v5}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060233

    goto :goto_6

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lٹۧ٥ؐح/ء;->آ(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060232

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v5}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060231

    :goto_6
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    invoke-static {v0, v3, v4, v5, v6}, Landroidx/core/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    :cond_b
    :goto_7
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ر()V

    :cond_c
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    instance-of v3, v0, Landroid/widget/AutoCompleteTextView;

    if-nez v3, :cond_d

    goto :goto_9

    :cond_d
    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_f

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne v3, v1, :cond_e

    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getOrCreateOutlinedDropDownMenuBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_8

    :cond_e
    if-ne v3, v2, :cond_f

    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getOrCreateFilledDropDownMenuBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    :goto_9
    return-void
.end method

.method public final ا()V
    .locals 12

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getGravity()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    iget-object v3, v2, Lٹ؅ڟ؀ە/ؠ;->ع:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Lٹ؅ڟ؀ە/ؠ;->ؠ(Ljava/lang/CharSequence;)Z

    move-result v3

    iput-boolean v3, v2, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v5, 0x5

    const v6, 0x800005

    const/4 v7, 0x1

    const/16 v8, 0x11

    iget-object v9, v2, Lٹ؅ڟ؀ە/ؠ;->آ:Landroid/graphics/Rect;

    if-eq v1, v8, :cond_6

    and-int/lit8 v10, v1, 0x7

    if-ne v10, v7, :cond_1

    goto :goto_2

    :cond_1
    and-int v10, v1, v6

    if-eq v10, v6, :cond_3

    and-int/lit8 v10, v1, 0x5

    if-ne v10, v5, :cond_2

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_4

    goto :goto_1

    :cond_3
    :goto_0
    if-eqz v3, :cond_5

    :cond_4
    iget v3, v9, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    goto :goto_4

    :cond_5
    :goto_1
    iget v3, v9, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    iget v10, v2, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    goto :goto_3

    :cond_6
    :goto_2
    int-to-float v3, v0

    div-float/2addr v3, v4

    iget v10, v2, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    div-float/2addr v10, v4

    :goto_3
    sub-float/2addr v3, v10

    :goto_4
    iget v10, v9, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    invoke-static {v3, v10}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iget-object v10, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٴ:Landroid/graphics/RectF;

    iput v3, v10, Landroid/graphics/RectF;->left:F

    iget v11, v9, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    iput v11, v10, Landroid/graphics/RectF;->top:F

    if-eq v1, v8, :cond_c

    and-int/lit8 v8, v1, 0x7

    if-ne v8, v7, :cond_7

    goto :goto_7

    :cond_7
    and-int v0, v1, v6

    if-eq v0, v6, :cond_a

    and-int/lit8 v0, v1, 0x5

    if-ne v0, v5, :cond_8

    goto :goto_5

    :cond_8
    iget-boolean v0, v2, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    if-eqz v0, :cond_9

    goto :goto_6

    :cond_9
    iget v0, v2, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    add-float/2addr v0, v3

    goto :goto_8

    :cond_a
    :goto_5
    iget-boolean v0, v2, Lٹ؅ڟ؀ە/ؠ;->ػ:Z

    if-eqz v0, :cond_b

    iget v0, v2, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    add-float/2addr v0, v3

    goto :goto_8

    :cond_b
    :goto_6
    iget v0, v9, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    goto :goto_8

    :cond_c
    :goto_7
    int-to-float v0, v0

    div-float/2addr v0, v4

    iget v1, v2, Lٹ؅ڟ؀ە/ؠ;->ٶ:F

    div-float/2addr v1, v4

    add-float/2addr v0, v1

    :goto_8
    iget v1, v9, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, v10, Landroid/graphics/RectF;->right:F

    iget v0, v9, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    invoke-virtual {v2}, Lٹ؅ڟ؀ە/ؠ;->آ()F

    move-result v1

    add-float/2addr v1, v0

    iput v1, v10, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-lez v0, :cond_e

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_d

    goto :goto_9

    :cond_d
    iget v0, v10, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ن:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iput v0, v10, Landroid/graphics/RectF;->left:F

    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, v1

    iput v0, v10, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v4

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {v10, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    check-cast v0, Lٿخ۴۟ؽ/ئ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v10, Landroid/graphics/RectF;->left:F

    iget v2, v10, Landroid/graphics/RectF;->top:F

    iget v3, v10, Landroid/graphics/RectF;->right:F

    iget v4, v10, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lٿخ۴۟ؽ/ئ;->ج(FFFF)V

    :cond_e
    :goto_9
    return-void
.end method

.method public final ة(Landroid/widget/TextView;I)V
    .locals 2

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, p2}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const v1, -0xff01

    if-ne p2, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    move v0, p2

    :catch_0
    :goto_0
    if-eqz v0, :cond_1

    const p2, 0x7f11019e

    invoke-static {p1, p2}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f05005c

    invoke-static {p2, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    return-void
.end method

.method public final ت()Z
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget v1, v0, Lٿخ۴۟ؽ/ز;->ح:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v1, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->خ:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public final ث(Landroid/text/Editable;)V
    .locals 7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ج:Lٿخ۴۟ؽ/غ;

    check-cast v0, Landroidx/constraintlayout/core/state/ؠ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    iget v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    goto :goto_3

    :cond_1
    if-le p1, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    move v2, v0

    :goto_1
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    iget-boolean v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v5, :cond_3

    const v5, 0x7f10002f

    goto :goto_2

    :cond_3
    const v5, 0x7f10002e

    :goto_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v6, v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v5, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eq v1, v2, :cond_4

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ج()V

    :cond_4
    invoke-static {}, Landroidx/core/text/BidiFormatter;->getInstance()Landroidx/core/text/BidiFormatter;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ت:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {p1, v5}, [Ljava/lang/Object;

    move-result-object p1

    const v5, 0x7f100030

    invoke-virtual {v4, v5, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroidx/core/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_3
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eq v1, p1, :cond_5

    invoke-virtual {p0, v0, v0}, Lcom/google/android/material/textfield/TextInputLayout;->ز(ZZ)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ص()V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->د()V

    :cond_5
    return-void
.end method

.method public final ج()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->خ:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->د:I

    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->ة(Landroid/widget/TextView;I)V

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ط:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ظ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_2
    return-void
.end method

.method public final ح()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ع:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0300f9

    invoke-static {v0, v1}, Lٹۧ٥ؐح/ؠ;->؋(Landroid/content/Context;I)Landroid/util/TypedValue;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_2

    invoke-static {v0, v2}, Landroidx/core/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_1

    :cond_2
    iget v0, v1, Landroid/util/TypedValue;->data:I

    if-eqz v0, :cond_3

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v1, :cond_8

    invoke-static {v1}, Lزءؽ۴ڰؠ/؋;->آ(Landroid/widget/EditText;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v1}, Lزءؽ۴ڰؠ/؋;->آ(Landroid/widget/EditText;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v2, :cond_5

    iget-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v2, :cond_5

    goto :goto_2

    :cond_5
    const/4 v2, 0x0

    goto :goto_3

    :cond_6
    :goto_2
    const/4 v2, 0x1

    :goto_3
    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->غ:Landroid/content/res/ColorStateList;

    if-eqz v2, :cond_7

    move-object v0, v2

    :cond_7
    invoke-static {v1, v0}, Landroidx/core/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    :cond_8
    :goto_4
    return-void
.end method

.method public final خ()Z
    .locals 10

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getStartIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getPrefixText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getPrefixTextView()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_2

    move v0, v2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x3

    if-eqz v0, :cond_5

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v0, v3

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٶ:Landroid/graphics/drawable/ColorDrawable;

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٷ:I

    if-eq v3, v0, :cond_4

    :cond_3
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٶ:Landroid/graphics/drawable/ColorDrawable;

    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٷ:I

    invoke-virtual {v3, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v0}, Landroidx/core/widget/TextViewCompat;->getCompoundDrawablesRelative(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v3, v0, v1

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٶ:Landroid/graphics/drawable/ColorDrawable;

    if-eq v3, v7, :cond_6

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    aget-object v8, v0, v2

    aget-object v9, v0, v4

    aget-object v0, v0, v6

    invoke-static {v3, v7, v8, v9, v0}, Landroidx/core/widget/TextViewCompat;->setCompoundDrawablesRelative(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٶ:Landroid/graphics/drawable/ColorDrawable;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v0}, Landroidx/core/widget/TextViewCompat;->getCompoundDrawablesRelative(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    aget-object v7, v0, v2

    aget-object v8, v0, v4

    aget-object v0, v0, v6

    invoke-static {v3, v5, v7, v8, v0}, Landroidx/core/widget/TextViewCompat;->setCompoundDrawablesRelative(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٶ:Landroid/graphics/drawable/ColorDrawable;

    :goto_1
    move v0, v2

    goto :goto_2

    :cond_6
    move v0, v1

    :goto_2
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v7

    if-nez v7, :cond_9

    iget v7, v3, Lٿخ۴۟ؽ/خ;->ا:I

    if-eqz v7, :cond_7

    move v7, v2

    goto :goto_3

    :cond_7
    move v7, v1

    :goto_3
    if-eqz v7, :cond_8

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v7

    if-nez v7, :cond_9

    :cond_8
    iget-object v7, v3, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    if-eqz v7, :cond_a

    :cond_9
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    if-lez v7, :cond_a

    move v7, v2

    goto :goto_4

    :cond_a
    move v7, v1

    :goto_4
    if-eqz v7, :cond_12

    iget-object v7, v3, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    iget-object v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingRight()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v8

    if-eqz v8, :cond_b

    iget-object v5, v3, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    goto :goto_6

    :cond_b
    iget v8, v3, Lٿخ۴۟ؽ/خ;->ا:I

    if-eqz v8, :cond_c

    move v8, v2

    goto :goto_5

    :cond_c
    move v8, v1

    :goto_5
    if-eqz v8, :cond_d

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v8

    if-eqz v8, :cond_d

    iget-object v5, v3, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    :cond_d
    :goto_6
    if-eqz v5, :cond_e

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    add-int/2addr v3, v7

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-static {v5}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v5

    add-int v7, v5, v3

    :cond_e
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v3}, Landroidx/core/widget/TextViewCompat;->getCompoundDrawablesRelative(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    if-eqz v5, :cond_f

    iget v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٺ:I

    if-eq v8, v7, :cond_f

    iput v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٺ:I

    invoke-virtual {v5, v1, v1, v7, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    aget-object v1, v3, v1

    aget-object v4, v3, v2

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    aget-object v3, v3, v6

    goto :goto_7

    :cond_f
    if-nez v5, :cond_10

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    iput-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    iput v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٺ:I

    invoke-virtual {v5, v1, v1, v7, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_10
    aget-object v4, v3, v4

    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    if-eq v4, v5, :cond_11

    iput-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٻ:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    aget-object v1, v3, v1

    aget-object v4, v3, v2

    aget-object v3, v3, v6

    :goto_7
    invoke-static {v0, v1, v4, v5, v3}, Landroidx/core/widget/TextViewCompat;->setCompoundDrawablesRelative(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_9

    :cond_11
    move v2, v0

    goto :goto_9

    :cond_12
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v3}, Landroidx/core/widget/TextViewCompat;->getCompoundDrawablesRelative(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aget-object v4, v3, v4

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    if-ne v4, v7, :cond_13

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    aget-object v1, v3, v1

    aget-object v4, v3, v2

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٻ:Landroid/graphics/drawable/Drawable;

    aget-object v3, v3, v6

    invoke-static {v0, v1, v4, v7, v3}, Landroidx/core/widget/TextViewCompat;->setCompoundDrawablesRelative(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_8

    :cond_13
    move v2, v0

    :goto_8
    iput-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٹ:Landroid/graphics/drawable/ColorDrawable;

    :goto_9
    move v0, v2

    :cond_14
    return v0
.end method

.method public final د()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_5

    iget v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-static {v0}, Landroidx/appcompat/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getErrorCurrentTextColors()I

    move-result v1

    goto :goto_0

    :cond_3
    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    :goto_0
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v1, v2}, Landroidx/appcompat/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_1

    :cond_4
    invoke-static {v0}, Landroidx/core/graphics/drawable/DrawableCompat;->clearColorFilter(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->refreshDrawableState()V

    :cond_5
    :goto_1
    return-void
.end method

.method public final ذ()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ف:Z

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_0
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditTextBoxBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v1, v0}, Landroidx/core/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ف:Z

    :cond_2
    :goto_0
    return-void
.end method

.method public final ر()V
    .locals 4

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ء()I

    move-result v2

    iget v3, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-eq v2, v3, :cond_0

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    :cond_0
    return-void
.end method

.method public final ز(ZZ)V
    .locals 9

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/view/View;->hasFocus()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v3

    :goto_1
    iget-object v5, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    iget-object v6, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڈ:Lٹ؅ڟ؀ە/ؠ;

    if-eqz v5, :cond_2

    invoke-virtual {v6, v5}, Lٹ؅ڟ؀ە/ؠ;->ا(Landroid/content/res/ColorStateList;)V

    :cond_2
    const/4 v5, 0x0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ټ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_3

    const v7, -0x101009e

    filled-new-array {v7}, [I

    move-result-object v7

    iget v8, p0, Lcom/google/android/material/textfield/TextInputLayout;->چ:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    goto :goto_2

    :cond_3
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->چ:I

    :goto_2
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_3

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-object v0, v0, Lٿخ۴۟ؽ/ز;->ذ:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_3

    :cond_5
    move-object v0, v5

    goto :goto_3

    :cond_6
    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_3
    invoke-virtual {v6, v0}, Lٹ؅ڟ؀ە/ؠ;->ا(Landroid/content/res/ColorStateList;)V

    goto :goto_4

    :cond_7
    if-eqz v4, :cond_8

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٽ:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_8

    iget-object v7, v6, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    if-eq v7, v0, :cond_8

    iput-object v0, v6, Lٹ؅ڟ؀ە/ؠ;->ة:Landroid/content/res/ColorStateList;

    invoke-virtual {v6, v3}, Lٹ؅ڟ؀ە/ؠ;->ئ(Z)V

    :cond_8
    :goto_4
    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    iget-object v7, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    if-nez v1, :cond_f

    iget-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ډ:Z

    if-eqz v1, :cond_f

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_9

    if-eqz v4, :cond_9

    goto :goto_6

    :cond_9
    if-nez p2, :cond_a

    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-nez p2, :cond_15

    :cond_a
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_b

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p2

    if-eqz p2, :cond_b

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_b
    const/4 p2, 0x0

    if-eqz p1, :cond_c

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڊ:Z

    if-eqz p1, :cond_c

    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->؋(F)V

    goto :goto_5

    :cond_c
    invoke-virtual {v6, p2}, Lٹ؅ڟ؀ە/ؠ;->ة(F)V

    :goto_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    check-cast p1, Lٿخ۴۟ؽ/ئ;

    iget-object p1, p1, Lٿخ۴۟ؽ/ئ;->ض:Lٿخ۴۟ؽ/ؤ;

    iget-object p1, p1, Lٿخ۴۟ؽ/ؤ;->ش:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    check-cast p1, Lٿخ۴۟ؽ/ئ;

    invoke-virtual {p1, p2, p2, p2, p2}, Lٿخ۴۟ؽ/ئ;->ج(FFFF)V

    :cond_d
    iput-boolean v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_e

    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-eqz p2, :cond_e

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ض:Landroidx/transition/Fade;

    invoke-static {p1, p2}, Landroidx/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_e
    iput-boolean v2, v7, Lٿخ۴۟ؽ/ط;->ب:Z

    invoke-virtual {v7}, Lٿخ۴۟ؽ/ط;->أ()V

    iput-boolean v2, v0, Lٿخ۴۟ؽ/خ;->ذ:Z

    invoke-virtual {v0}, Lٿخ۴۟ؽ/خ;->ج()V

    goto :goto_9

    :cond_f
    :goto_6
    if-nez p2, :cond_10

    iget-boolean p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-eqz p2, :cond_15

    :cond_10
    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_11

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p2

    if-eqz p2, :cond_11

    iget-object p2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڋ:Landroid/animation/ValueAnimator;

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_11
    const/high16 p2, 0x3f800000    # 1.0f

    if-eqz p1, :cond_12

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڊ:Z

    if-eqz p1, :cond_12

    invoke-virtual {p0, p2}, Lcom/google/android/material/textfield/TextInputLayout;->؋(F)V

    goto :goto_7

    :cond_12
    invoke-virtual {v6, p2}, Lٹ؅ڟ؀ە/ؠ;->ة(F)V

    :goto_7
    iput-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result p1

    if-eqz p1, :cond_13

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ا()V

    :cond_13
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez p1, :cond_14

    goto :goto_8

    :cond_14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    :goto_8
    invoke-virtual {p0, v5}, Lcom/google/android/material/textfield/TextInputLayout;->س(Landroid/text/Editable;)V

    iput-boolean v3, v7, Lٿخ۴۟ؽ/ط;->ب:Z

    invoke-virtual {v7}, Lٿخ۴۟ؽ/ط;->أ()V

    iput-boolean v3, v0, Lٿخ۴۟ؽ/خ;->ذ:Z

    invoke-virtual {v0}, Lٿخ۴۟ؽ/خ;->ج()V

    :cond_15
    :goto_9
    return-void
.end method

.method public final س(Landroid/text/Editable;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ج:Lٿخ۴۟ؽ/غ;

    check-cast v0, Landroidx/constraintlayout/core/state/ؠ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->؋:Landroid/widget/FrameLayout;

    if-nez p1, :cond_1

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ذ:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ذ:Ljava/lang/CharSequence;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ص:Landroidx/transition/Fade;

    invoke-static {v1, p1}, Landroidx/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ذ:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz p1, :cond_2

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ر:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ض:Landroidx/transition/Fade;

    invoke-static {v1, p1}, Landroidx/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    iget-object p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ز:Landroidx/appcompat/widget/AppCompatTextView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method public final ش(ZZ)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    const v2, 0x1010367

    const v3, 0x101009e

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    const v4, 0x10102fe

    filled-new-array {v4, v3}, [I

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    if-eqz p1, :cond_0

    iput v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    iput v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    goto :goto_0

    :cond_1
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    :goto_0
    return-void
.end method

.method public final ص()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    if-eqz v0, :cond_16

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-nez v0, :cond_0

    goto/16 :goto_8

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->isHovered()Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->isHovered()Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    move v1, v2

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_5

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->چ:I

    goto :goto_3

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    if-eqz v3, :cond_6

    goto :goto_2

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getErrorCurrentTextColors()I

    move-result v3

    goto :goto_3

    :cond_7
    iget-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ث:Z

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ح:Landroidx/appcompat/widget/AppCompatTextView;

    if-eqz v3, :cond_9

    iget-object v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ځ:Landroid/content/res/ColorStateList;

    if-eqz v4, :cond_8

    :goto_2
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->ش(ZZ)V

    goto :goto_4

    :cond_8
    invoke-virtual {v3}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v3

    goto :goto_3

    :cond_9
    if-eqz v0, :cond_a

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڀ:I

    goto :goto_3

    :cond_a
    if-eqz v1, :cond_b

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٿ:I

    goto :goto_3

    :cond_b
    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->پ:I

    :goto_3
    iput v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٯ:I

    :goto_4
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_c

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ح()V

    :cond_c
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ء:Lٿخ۴۟ؽ/خ;

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->ت()V

    iget-object v4, v3, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, v3, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    iget-object v6, v3, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v6, v4, v5}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    iget-object v4, v3, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v5, v3, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {v6, v5, v4}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v3}, Lٿخ۴۟ؽ/خ;->ؠ()Lٿخ۴۟ؽ/د;

    move-result-object v4

    instance-of v4, v4, Lٿخ۴۟ؽ/ة;

    if-eqz v4, :cond_e

    invoke-virtual {v6}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_d

    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v3}, Landroidx/core/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v6}, Lcom/google/android/material/textfield/TextInputLayout;->getErrorCurrentTextColors()I

    move-result v4

    invoke-static {v3, v4}, Landroidx/core/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v5, v3}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_5

    :cond_d
    iget-object v4, v3, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v3, v3, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v6, v5, v4, v3}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_e
    :goto_5
    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؠ:Lٿخ۴۟ؽ/ط;

    iget-object v4, v3, Lٿخ۴۟ؽ/ط;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, v3, Lٿخ۴۟ؽ/ط;->أ:Landroid/content/res/ColorStateList;

    iget-object v3, v3, Lٿخ۴۟ؽ/ط;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v3, v4, v5}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_11

    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_f

    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٮ:I

    goto :goto_6

    :cond_f
    iget v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ي:I

    :goto_6
    iput v4, p0, Lcom/google/android/material/textfield/TextInputLayout;->ى:I

    if-eq v4, v3, :cond_11

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result v3

    if-eqz v3, :cond_11

    iget-boolean v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڇ:Z

    if-nez v3, :cond_11

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->أ()Z

    move-result v3

    if-eqz v3, :cond_10

    iget-object v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ؾ:Lٽچڃ/إ;

    check-cast v3, Lٿخ۴۟ؽ/ئ;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4, v4, v4}, Lٿخ۴۟ؽ/ئ;->ج(FFFF)V

    :cond_10
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ا()V

    :cond_11
    iget v3, p0, Lcom/google/android/material/textfield/TextInputLayout;->ه:I

    if-ne v3, v2, :cond_15

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_12

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڃ:I

    goto :goto_7

    :cond_12
    if-eqz v1, :cond_13

    if-nez v0, :cond_13

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->څ:I

    goto :goto_7

    :cond_13
    if-eqz v0, :cond_14

    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڄ:I

    goto :goto_7

    :cond_14
    iget v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ڂ:I

    :goto_7
    iput v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->ٱ:I

    :cond_15
    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->ؠ()V

    :cond_16
    :goto_8
    return-void
.end method
