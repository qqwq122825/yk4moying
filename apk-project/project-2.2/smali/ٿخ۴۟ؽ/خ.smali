.class public final Lٿخ۴۟ؽ/خ;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public final ؋:Lcom/google/android/material/textfield/TextInputLayout;

.field public final ؠ:Landroid/widget/FrameLayout;

.field public final ء:Lcom/google/android/material/internal/CheckableImageButton;

.field public آ:Landroid/content/res/ColorStateList;

.field public أ:Landroid/graphics/PorterDuff$Mode;

.field public ؤ:Landroid/view/View$OnLongClickListener;

.field public final إ:Lcom/google/android/material/internal/CheckableImageButton;

.field public final ئ:Lٿخ۴۟ؽ/ح;

.field public ا:I

.field public final ب:Ljava/util/LinkedHashSet;

.field public ة:Landroid/content/res/ColorStateList;

.field public ت:Landroid/graphics/PorterDuff$Mode;

.field public ث:I

.field public ج:Landroid/widget/ImageView$ScaleType;

.field public ح:Landroid/view/View$OnLongClickListener;

.field public خ:Ljava/lang/CharSequence;

.field public final د:Landroidx/appcompat/widget/AppCompatTextView;

.field public ذ:Z

.field public ر:Landroid/widget/EditText;

.field public final ز:Landroid/view/accessibility/AccessibilityManager;

.field public س:Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

.field public final ش:Lٿخ۴۟ؽ/ت;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;Landroidx/appcompat/widget/TintTypedArray;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    iput v3, v0, Lٿخ۴۟ؽ/خ;->ا:I

    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v4, v0, Lٿخ۴۟ؽ/خ;->ب:Ljava/util/LinkedHashSet;

    new-instance v4, Lٿخ۴۟ؽ/ت;

    invoke-direct {v4, v0}, Lٿخ۴۟ؽ/ت;-><init>(Lٿخ۴۟ؽ/خ;)V

    iput-object v4, v0, Lٿخ۴۟ؽ/خ;->ش:Lٿخ۴۟ؽ/ت;

    new-instance v4, Lٿخ۴۟ؽ/ث;

    invoke-direct {v4, v0}, Lٿخ۴۟ؽ/ث;-><init>(Lٿخ۴۟ؽ/خ;)V

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "accessibility"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/accessibility/AccessibilityManager;

    iput-object v5, v0, Lٿخ۴۟ؽ/خ;->ز:Landroid/view/accessibility/AccessibilityManager;

    iput-object v1, v0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x2

    const/4 v8, -0x1

    const v9, 0x800005

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/FrameLayout;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v6, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lٿخ۴۟ؽ/خ;->ؠ:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v9

    const v10, 0x7f080208

    invoke-virtual {v0, v0, v9, v10}, Lٿخ۴۟ؽ/خ;->؋(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;I)Lcom/google/android/material/internal/CheckableImageButton;

    move-result-object v10

    iput-object v10, v0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    const v11, 0x7f080207

    invoke-virtual {v0, v6, v9, v11}, Lٿخ۴۟ؽ/خ;->؋(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;I)Lcom/google/android/material/internal/CheckableImageButton;

    move-result-object v9

    iput-object v9, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    new-instance v11, Lٿخ۴۟ؽ/ح;

    invoke-direct {v11, v0, v2}, Lٿخ۴۟ؽ/ح;-><init>(Lٿخ۴۟ؽ/خ;Landroidx/appcompat/widget/TintTypedArray;)V

    iput-object v11, v0, Lٿخ۴۟ؽ/خ;->ئ:Lٿخ۴۟ؽ/ح;

    new-instance v11, Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v11, v12}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    iput-object v11, v0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    const/16 v12, 0x26

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13, v2, v12}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v12

    iput-object v12, v0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    :cond_0
    const/16 v12, 0x27

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    const/4 v14, 0x0

    if-eqz v13, :cond_1

    invoke-virtual {v2, v12, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v12

    invoke-static {v12, v14}, Lٹ؅ڟ؀ە/د;->ؠ(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v12

    iput-object v12, v0, Lٿخ۴۟ؽ/خ;->أ:Landroid/graphics/PorterDuff$Mode;

    :cond_1
    const/16 v12, 0x25

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v0, v12}, Lٿخ۴۟ؽ/خ;->ا(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f10004b

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v10, v12}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v12, 0x2

    invoke-static {v10, v12}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    invoke-virtual {v10, v3}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v10, v3}, Lcom/google/android/material/internal/CheckableImageButton;->setPressable(Z)V

    invoke-virtual {v10, v3}, Landroid/view/View;->setFocusable(Z)V

    const/16 v12, 0x35

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-nez v13, :cond_4

    const/16 v13, 0x20

    invoke-virtual {v2, v13}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-static {v15, v2, v13}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v13

    iput-object v13, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    :cond_3
    const/16 v13, 0x21

    invoke-virtual {v2, v13}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-virtual {v2, v13, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v13

    invoke-static {v13, v14}, Lٹ؅ڟ؀ە/د;->ؠ(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v13

    iput-object v13, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    :cond_4
    const/16 v13, 0x1e

    invoke-virtual {v2, v13}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    const/4 v7, 0x1

    if-eqz v15, :cond_6

    invoke-virtual {v2, v13, v3}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v12

    invoke-virtual {v0, v12}, Lٿخ۴۟ؽ/خ;->إ(I)V

    const/16 v12, 0x1b

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v9}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v13

    if-eq v13, v12, :cond_5

    invoke-virtual {v9, v12}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_5
    const/16 v12, 0x1a

    invoke-virtual {v2, v12, v7}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v12

    invoke-virtual {v9, v12}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    goto :goto_0

    :cond_6
    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_9

    const/16 v13, 0x36

    invoke-virtual {v2, v13}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-static {v15, v2, v13}, Lٹۧ٥ؐح/ء;->ؠ(Landroid/content/Context;Landroidx/appcompat/widget/TintTypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v13

    iput-object v13, v0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    :cond_7
    const/16 v13, 0x37

    invoke-virtual {v2, v13}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-virtual {v2, v13, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v13

    invoke-static {v13, v14}, Lٹ؅ڟ؀ە/د;->ؠ(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v13

    iput-object v13, v0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    :cond_8
    invoke-virtual {v2, v12, v3}, Landroidx/appcompat/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v12

    invoke-virtual {v0, v12}, Lٿخ۴۟ؽ/خ;->إ(I)V

    const/16 v12, 0x33

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v9}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v13

    if-eq v13, v12, :cond_9

    invoke-virtual {v9, v12}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_9
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0602bc

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    const/16 v13, 0x1d

    invoke-virtual {v2, v13, v12}, Landroidx/appcompat/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v12

    if-ltz v12, :cond_f

    iget v13, v0, Lٿخ۴۟ؽ/خ;->ث:I

    if-eq v12, v13, :cond_a

    iput v12, v0, Lٿخ۴۟ؽ/خ;->ث:I

    invoke-virtual {v9, v12}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v9, v12}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v10, v12}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v10, v12}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_a
    const/16 v12, 0x1f

    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_b

    invoke-virtual {v2, v12, v8}, Landroidx/appcompat/widget/TintTypedArray;->getInt(II)I

    move-result v8

    invoke-static {v8}, Lںڍڒڸ/ش;->ث(I)Landroid/widget/ImageView$ScaleType;

    move-result-object v8

    iput-object v8, v0, Lٿخ۴۟ؽ/خ;->ج:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v10, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_b
    invoke-virtual {v11, v5}, Landroid/view/View;->setVisibility(I)V

    const v5, 0x7f08020f

    invoke-virtual {v11, v5}, Landroid/view/View;->setId(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x42a00000    # 80.0f

    const/4 v12, -0x2

    invoke-direct {v5, v12, v12, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v11, v7}, Landroidx/core/view/ViewCompat;->setAccessibilityLiveRegion(Landroid/view/View;I)V

    const/16 v5, 0x48

    invoke-virtual {v2, v5, v3}, Landroidx/appcompat/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {v11, v3}, Landroidx/core/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    const/16 v3, 0x49

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/TintTypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v11, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_c
    const/16 v3, 0x47

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_d

    goto :goto_1

    :cond_d
    move-object v14, v2

    :goto_1
    iput-object v14, v0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual/range {p0 .. p0}, Lٿخ۴۟ؽ/خ;->ج()V

    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v2, v1, Lcom/google/android/material/textfield/TextInputLayout;->ٸ:Ljava/util/LinkedHashSet;

    invoke-virtual {v2, v4}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    iget-object v2, v1, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-eqz v2, :cond_e

    invoke-virtual {v4, v1}, Lٿخ۴۟ؽ/ث;->؋(Lcom/google/android/material/textfield/TextInputLayout;)V

    :cond_e
    new-instance v1, Lٿخ۴۟ؽ/ج;

    invoke-direct {v1, v0}, Lٿخ۴۟ؽ/ج;-><init>(Lٿخ۴۟ؽ/خ;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :cond_f
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "endIconSize cannot be less than 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final ؋(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;I)Lcom/google/android/material/internal/CheckableImageButton;
    .locals 2

    const v0, 0x7f0b0034

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lٹۧ٥ؐح/ء;->آ(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-static {p2, v1}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    :cond_0
    return-object p1
.end method

.method public final ؠ()Lٿخ۴۟ؽ/د;
    .locals 5

    iget v0, p0, Lٿخ۴۟ؽ/خ;->ا:I

    iget-object v1, p0, Lٿخ۴۟ؽ/خ;->ئ:Lٿخ۴۟ؽ/ح;

    iget-object v2, v1, Lٿخ۴۟ؽ/ح;->؋:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lٿخ۴۟ؽ/د;

    if-nez v3, :cond_5

    const/4 v3, -0x1

    iget-object v4, v1, Lٿخ۴۟ؽ/ح;->ؠ:Lٿخ۴۟ؽ/خ;

    if-eq v0, v3, :cond_4

    const/4 v3, 0x1

    if-eqz v0, :cond_3

    if-eq v0, v3, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    new-instance v1, Lٿخ۴۟ؽ/ة;

    invoke-direct {v1, v4}, Lٿخ۴۟ؽ/ة;-><init>(Lٿخ۴۟ؽ/خ;)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid end icon mode: "

    invoke-static {v2, v0}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    new-instance v1, Lٿخ۴۟ؽ/آ;

    invoke-direct {v1, v4}, Lٿخ۴۟ؽ/آ;-><init>(Lٿخ۴۟ؽ/خ;)V

    goto :goto_0

    :cond_2
    new-instance v3, Lٿخ۴۟ؽ/ض;

    iget v1, v1, Lٿخ۴۟ؽ/ح;->آ:I

    invoke-direct {v3, v4, v1}, Lٿخ۴۟ؽ/ض;-><init>(Lٿخ۴۟ؽ/خ;I)V

    goto :goto_1

    :cond_3
    new-instance v1, Lٿخ۴۟ؽ/أ;

    invoke-direct {v1, v4, v3}, Lٿخ۴۟ؽ/أ;-><init>(Lٿخ۴۟ؽ/خ;I)V

    goto :goto_0

    :cond_4
    new-instance v1, Lٿخ۴۟ؽ/أ;

    const/4 v3, 0x0

    invoke-direct {v1, v4, v3}, Lٿخ۴۟ؽ/أ;-><init>(Lٿخ۴۟ؽ/خ;I)V

    :goto_0
    move-object v3, v1

    :goto_1
    invoke-virtual {v2, v0, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_5
    return-object v3
.end method

.method public final ء()I
    .locals 3

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-static {v0}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v0

    add-int/2addr v0, v1

    :goto_1
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v2}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr v2, v0

    return v2
.end method

.method public final آ()Z
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ؠ:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final أ()Z
    .locals 1

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ؤ(Z)V
    .locals 5

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ؠ()Lٿخ۴۟ؽ/د;

    move-result-object v0

    invoke-virtual {v0}, Lٿخ۴۟ؽ/د;->ة()Z

    move-result v1

    iget-object v2, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Lcom/google/android/material/internal/CheckableImageButton;->isChecked()Z

    move-result v1

    invoke-virtual {v0}, Lٿخ۴۟ؽ/د;->ت()Z

    move-result v4

    if-eq v1, v4, :cond_0

    xor-int/2addr v1, v3

    invoke-virtual {v2, v1}, Lcom/google/android/material/internal/CheckableImageButton;->setChecked(Z)V

    move v1, v3

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    instance-of v4, v0, Lٿخ۴۟ؽ/ة;

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Landroid/view/View;->isActivated()Z

    move-result v4

    invoke-virtual {v0}, Lٿخ۴۟ؽ/د;->ب()Z

    move-result v0

    if-eq v4, v0, :cond_1

    xor-int/lit8 v0, v4, 0x1

    invoke-virtual {v2, v0}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    if-nez p1, :cond_2

    if-eqz v3, :cond_3

    :cond_2
    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v0, v2, p1}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    :cond_3
    return-void
.end method

.method public final إ(I)V
    .locals 8

    iget v0, p0, Lٿخ۴۟ؽ/خ;->ا:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ؠ()Lٿخ۴۟ؽ/د;

    move-result-object v0

    iget-object v1, p0, Lٿخ۴۟ؽ/خ;->س:Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

    iget-object v2, p0, Lٿخ۴۟ؽ/خ;->ز:Landroid/view/accessibility/AccessibilityManager;

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    invoke-static {v2, v1}, Landroidx/core/view/accessibility/AccessibilityManagerCompat;->removeTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager;Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;)Z

    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lٿخ۴۟ؽ/خ;->س:Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

    invoke-virtual {v0}, Lٿخ۴۟ؽ/د;->ر()V

    iput p1, p0, Lٿخ۴۟ؽ/خ;->ا:I

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ب:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_b

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    move v3, v0

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p0, v3}, Lٿخ۴۟ؽ/خ;->ئ(Z)V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ؠ()Lٿخ۴۟ؽ/د;

    move-result-object v3

    iget-object v4, p0, Lٿخ۴۟ؽ/خ;->ئ:Lٿخ۴۟ؽ/ح;

    iget v4, v4, Lٿخ۴۟ؽ/ح;->ء:I

    if-nez v4, :cond_3

    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->آ()I

    move-result v4

    :cond_3
    if-eqz v4, :cond_4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v4}, Landroidx/appcompat/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_1

    :cond_4
    move-object v4, v1

    :goto_1
    iget-object v5, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v5, v4}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v6, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v4, :cond_5

    iget-object v4, p0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v7, p0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v6, v5, v4, v7}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    iget-object v4, p0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    invoke-static {v6, v5, v4}, Lںڍڒڸ/ش;->ٲ(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    :cond_5
    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->ء()I

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    :cond_6
    invoke-virtual {v5}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v4

    if-eq v4, v1, :cond_7

    invoke-virtual {v5, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_7
    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->ة()Z

    move-result v1

    invoke-virtual {v5, v1}, Lcom/google/android/material/internal/CheckableImageButton;->setCheckable(Z)V

    invoke-virtual {v6}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackgroundMode()I

    move-result v1

    invoke-virtual {v3, v1}, Lٿخ۴۟ؽ/د;->ا(I)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->ذ()V

    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->ئ()Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

    move-result-object p1

    iput-object p1, p0, Lٿخ۴۟ؽ/خ;->س:Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

    if-eqz p1, :cond_8

    if-eqz v2, :cond_8

    invoke-static {p0}, Landroidx/core/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->س:Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;

    invoke-static {v2, p1}, Landroidx/core/view/accessibility/AccessibilityManagerCompat;->addTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager;Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;)Z

    :cond_8
    invoke-virtual {v3}, Lٿخ۴۟ؽ/د;->ؤ()Landroid/view/View$OnClickListener;

    move-result-object p1

    iget-object v1, p0, Lٿخ۴۟ؽ/خ;->ح:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v5, v1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->ر:Landroid/widget/EditText;

    if-eqz p1, :cond_9

    invoke-virtual {v3, p1}, Lٿخ۴۟ؽ/د;->ث(Landroid/widget/EditText;)V

    invoke-virtual {p0, v3}, Lٿخ۴۟ؽ/خ;->ب(Lٿخ۴۟ؽ/د;)V

    :cond_9
    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->ة:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lٿخ۴۟ؽ/خ;->ت:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v6, v5, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p0, v0}, Lٿخ۴۟ؽ/خ;->ؤ(Z)V

    return-void

    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "The current box background mode "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/google/android/material/textfield/TextInputLayout;->getBoxBackgroundMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is not supported by the end icon mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v1
.end method

.method public final ئ(Z)V
    .locals 1

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v0

    if-eq v0, p1, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ة()V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ث()V

    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Lcom/google/android/material/textfield/TextInputLayout;->خ()Z

    :cond_1
    return-void
.end method

.method public final ا(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ت()V

    iget-object p1, p0, Lٿخ۴۟ؽ/خ;->آ:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lٿخ۴۟ؽ/خ;->أ:Landroid/graphics/PorterDuff$Mode;

    iget-object v2, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v2, v0, p1, v1}, Lںڍڒڸ/ش;->ء(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public final ب(Lٿخ۴۟ؽ/د;)V
    .locals 2

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ر:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lٿخ۴۟ؽ/د;->أ()Landroid/view/View$OnFocusChangeListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ر:Landroid/widget/EditText;

    invoke-virtual {p1}, Lٿخ۴۟ؽ/د;->أ()Landroid/view/View$OnFocusChangeListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_1
    invoke-virtual {p1}, Lٿخ۴۟ؽ/د;->إ()Landroid/view/View$OnFocusChangeListener;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p1}, Lٿخ۴۟ؽ/د;->إ()Landroid/view/View$OnFocusChangeListener;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_2
    return-void
.end method

.method public final ة()V
    .locals 4

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v3, p0, Lٿخ۴۟ؽ/خ;->ؠ:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lٿخ۴۟ؽ/خ;->ذ:Z

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v3

    if-nez v3, :cond_3

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    move v0, v2

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v0, 0x1

    :goto_3
    if-eqz v0, :cond_4

    move v1, v2

    :cond_4
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final ت()V
    .locals 5

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->ء:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v1, :cond_0

    iget-object v1, v4, Lcom/google/android/material/textfield/TextInputLayout;->ب:Lٿخ۴۟ؽ/ز;

    iget-boolean v1, v1, Lٿخ۴۟ؽ/ز;->د:Z

    if-eqz v1, :cond_0

    invoke-virtual {v4}, Lcom/google/android/material/textfield/TextInputLayout;->ت()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    if-eqz v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ة()V

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ث()V

    iget v0, p0, Lٿخ۴۟ؽ/خ;->ا:I

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    if-nez v2, :cond_3

    invoke-virtual {v4}, Lcom/google/android/material/textfield/TextInputLayout;->خ()Z

    :cond_3
    return-void
.end method

.method public final ث()V
    .locals 5

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->آ()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->أ()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-static {v1}, Landroidx/core/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06023a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->آ:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    iget-object v4, p0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v4, v2, v3, v1, v0}, Landroidx/core/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    return-void
.end method

.method public final ج()V
    .locals 4

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->د:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    iget-object v2, p0, Lٿخ۴۟ؽ/خ;->خ:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lٿخ۴۟ؽ/خ;->ذ:Z

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    const/16 v2, 0x8

    :goto_0
    if-eq v1, v2, :cond_2

    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ؠ()Lٿخ۴۟ؽ/د;

    move-result-object v1

    if-nez v2, :cond_1

    const/4 v3, 0x1

    :cond_1
    invoke-virtual {v1, v3}, Lٿخ۴۟ؽ/د;->خ(Z)V

    :cond_2
    invoke-virtual {p0}, Lٿخ۴۟ؽ/خ;->ة()V

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lٿخ۴۟ؽ/خ;->؋:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->خ()Z

    return-void
.end method
