.class public final synthetic Lڝږ؁ڋ/ز;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڝږ؁ڋ/ظ;

.field public final synthetic ؤ:Ljava/lang/String;

.field public final synthetic إ:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lڝږ؁ڋ/ظ;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    iput p4, p0, Lڝږ؁ڋ/ز;->آ:I

    iput-object p1, p0, Lڝږ؁ڋ/ز;->أ:Lڝږ؁ڋ/ظ;

    iput-object p2, p0, Lڝږ؁ڋ/ز;->ؤ:Ljava/lang/String;

    iput-object p3, p0, Lڝږ؁ڋ/ز;->إ:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 30

    move-object/from16 v1, p0

    iget v0, v1, Lڝږ؁ڋ/ز;->آ:I

    iget-object v2, v1, Lڝږ؁ڋ/ز;->إ:Ljava/lang/String;

    const-string v3, ""

    iget-object v4, v1, Lڝږ؁ڋ/ز;->ؤ:Ljava/lang/String;

    const-string v5, "LockOverlay"

    const/4 v6, 0x0

    iget-object v15, v1, Lڝږ؁ڋ/ز;->أ:Lڝږ؁ڋ/ظ;

    const/4 v14, -0x1

    const/4 v13, 0x1

    const/4 v12, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    invoke-virtual {v15}, Lڝږ؁ڋ/ظ;->ئ()V

    :try_start_0
    iget-object v0, v15, Lڝږ؁ڋ/ظ;->آ:Landroid/view/LayoutInflater;

    const v7, 0x7f0b001e

    invoke-virtual {v0, v7, v6, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f08022b

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_1

    if-eqz v4, :cond_0

    move-object v3, v4

    :cond_0
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    const v3, 0x7f080228

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_3

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    const-string v2, "Enter password"

    :goto_0
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    const v2, 0x7f0800cc

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    const v3, 0x7f080106

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v2, :cond_4

    new-instance v4, Lٿخ۴۟ؽ/ظ;

    invoke-direct {v4, v13, v15}, Lٿخ۴۟ؽ/ظ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_4
    if-eqz v2, :cond_5

    new-instance v4, Lڝږ؁ڋ/س;

    invoke-direct {v4, v15, v2}, Lڝږ؁ڋ/س;-><init>(Lڝږ؁ڋ/ظ;Landroid/widget/EditText;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    :cond_5
    new-array v4, v13, [Z

    aput-boolean v12, v4, v12

    if-eqz v3, :cond_6

    new-instance v6, Lڝږ؁ڋ/ش;

    invoke-direct {v6, v4, v2, v3}, Lڝږ؁ڋ/ش;-><init>([ZLandroid/widget/EditText;Landroid/widget/ImageView;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_6
    const-string v3, "PASSWORD"

    invoke-virtual {v15, v0, v13, v3}, Lڝږ؁ڋ/ظ;->ء(Landroid/view/View;ZLjava/lang/String;)V

    new-instance v3, Lحظتۢۋۜآظ/ة;

    const/16 v4, 0xd

    invoke-direct {v3, v15, v2, v4}, Lحظتۢۋۜآظ/ة;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v0, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v2, "Failed to inflate password layout"

    invoke-static {v5, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void

    :pswitch_1
    invoke-virtual {v15}, Lڝږ؁ڋ/ظ;->ئ()V

    :try_start_1
    iget-object v0, v15, Lڝږ؁ڋ/ظ;->آ:Landroid/view/LayoutInflater;

    const v7, 0x7f0b0020

    invoke-virtual {v0, v7, v6, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f08022c

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_8

    if-eqz v4, :cond_7

    move-object v3, v4

    :cond_7
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_8
    const v3, 0x7f080229

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_a

    if-eqz v2, :cond_9

    goto :goto_2

    :cond_9
    const-string v2, "Draw pattern to unlock"

    :goto_2
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_a
    const v2, 0x7f080195

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_b

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    new-instance v3, Lڝږ؁ڋ/ق;

    iget-object v4, v15, Lڝږ؁ڋ/ظ;->ؠ:Landroid/view/ContextThemeWrapper;

    invoke-direct {v3, v4}, Lڝږ؁ڋ/ق;-><init>(Landroid/view/ContextThemeWrapper;)V

    new-instance v4, Lڙڧا/ء;

    invoke-direct {v4, v15}, Lڙڧا/ء;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Lڝږ؁ڋ/ق;->setOnPatternComplete(Lڝږ؁ڋ/ف;)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v14, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_b
    const-string v2, "PATTERN"

    invoke-virtual {v15, v0, v12, v2}, Lڝږ؁ڋ/ظ;->ء(Landroid/view/View;ZLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    const-string v2, "Failed to inflate pattern layout"

    invoke-static {v5, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void

    :goto_4
    invoke-virtual {v15}, Lڝږ؁ڋ/ظ;->ئ()V

    :try_start_2
    iget-object v0, v15, Lڝږ؁ڋ/ظ;->آ:Landroid/view/LayoutInflater;

    const v7, 0x7f0b001f

    invoke-virtual {v0, v7, v6, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f08022d

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_d

    if-eqz v4, :cond_c

    move-object v3, v4

    :cond_c
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_d
    const v3, 0x7f08022a

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_f

    if-eqz v2, :cond_e

    goto :goto_5

    :cond_e
    const-string v2, "Enter PIN"

    :goto_5
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v2, v15, Lڝږ؁ڋ/ظ;->ب:Ljava/lang/StringBuilder;

    const v4, 0x7f080199

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v4, :cond_10

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    if-eqz v7, :cond_10

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    if-eqz v8, :cond_10

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    if-eqz v8, :cond_10

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_6

    :cond_10
    const/high16 v7, 0x40400000    # 3.0f

    :goto_6
    move/from16 v18, v7

    const/high16 v7, 0x41200000    # 10.0f

    mul-float v7, v7, v18

    float-to-int v11, v7

    const/high16 v7, 0x40c00000    # 6.0f

    mul-float v7, v7, v18

    float-to-int v10, v7

    const/16 v7, 0x30

    :try_start_3
    iget-object v8, v15, Lڝږ؁ڋ/ظ;->؋:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->uiMode:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    and-int/2addr v8, v7

    const/16 v9, 0x20

    if-ne v8, v9, :cond_11

    goto :goto_7

    :cond_11
    move/from16 v19, v12

    goto :goto_8

    :catch_2
    :goto_7
    move/from16 v19, v13

    :goto_8
    if-eqz v19, :cond_12

    :try_start_4
    const-string v8, "#15FFFFFF"

    goto :goto_9

    :cond_12
    const-string v8, "#15000000"

    :goto_9
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    if-eqz v19, :cond_13

    const-string v8, "#10FFFFFF"

    goto :goto_a

    :cond_13
    const-string v8, "#10000000"

    :goto_a
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    const/16 v14, 0xa

    new-array v13, v14, [[I

    const v14, 0x7f080071

    filled-new-array {v14, v7}, [I

    move-result-object v7

    aput-object v7, v13, v12

    const v7, 0x7f080072

    const/16 v14, 0x31

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x1

    aput-object v7, v13, v14

    const v7, 0x7f080073

    const/16 v14, 0x32

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x2

    aput-object v7, v13, v14

    const v7, 0x7f080074

    const/16 v14, 0x33

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x3

    aput-object v7, v13, v14

    const v7, 0x7f080075

    const/16 v14, 0x34

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x4

    aput-object v7, v13, v14

    const v7, 0x7f080076

    const/16 v14, 0x35

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x5

    aput-object v7, v13, v14

    const v7, 0x7f080077

    const/16 v14, 0x36

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x6

    aput-object v7, v13, v14

    const v7, 0x7f080078

    const/16 v14, 0x37

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/4 v14, 0x7

    aput-object v7, v13, v14

    const v7, 0x7f080079

    const/16 v14, 0x38

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/16 v14, 0x8

    aput-object v7, v13, v14

    const v7, 0x7f08007a

    const/16 v14, 0x39

    filled-new-array {v7, v14}, [I

    move-result-object v7

    const/16 v14, 0x9

    aput-object v7, v13, v14

    move v14, v12

    const/16 v7, 0xa

    :goto_b
    if-ge v14, v7, :cond_19

    aget-object v20, v13, v14

    aget v7, v20, v12

    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    if-nez v7, :cond_14

    move/from16 v23, v8

    move/from16 v24, v10

    const/4 v10, -0x1

    goto :goto_10

    :cond_14
    const/4 v12, -0x1

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    instance-of v1, v12, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_17

    check-cast v12, Landroid/widget/LinearLayout;

    move/from16 v23, v8

    const/4 v1, 0x0

    :goto_c
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-ge v1, v8, :cond_16

    invoke-virtual {v12, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    move/from16 v24, v10

    instance-of v10, v8, Landroid/widget/TextView;

    if-eqz v10, :cond_15

    check-cast v8, Landroid/widget/TextView;

    const/4 v10, -0x1

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_d

    :cond_15
    const/4 v10, -0x1

    :goto_d
    add-int/lit8 v1, v1, 0x1

    move/from16 v10, v24

    goto :goto_c

    :cond_16
    :goto_e
    move/from16 v24, v10

    const/4 v10, -0x1

    goto :goto_f

    :cond_17
    move/from16 v23, v8

    goto :goto_e

    :goto_f
    invoke-static {v7}, Lڝږ؁ڋ/ظ;->ؤ(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    instance-of v7, v1, Landroid/widget/FrameLayout;

    if-nez v7, :cond_18

    :goto_10
    move-object/from16 v27, v3

    move-object/from16 v21, v5

    move v3, v10

    move/from16 v26, v11

    move-object/from16 v22, v13

    move/from16 v25, v14

    move-object/from16 v29, v15

    move/from16 v5, v23

    const/16 v28, 0xa

    move/from16 v23, v9

    goto :goto_11

    :cond_18
    check-cast v1, Landroid/widget/FrameLayout;

    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v12, 0x1

    invoke-virtual {v7, v12}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {v7, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    aget v7, v20, v12

    int-to-char v8, v7

    invoke-virtual {v1, v12}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v1, v12}, Landroid/view/View;->setFocusable(Z)V

    new-instance v7, Lڝږ؁ڋ/ص;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-object/from16 v20, v7

    const/16 v16, 0xa

    move-object/from16 v7, v20

    move-object/from16 v21, v5

    move/from16 v17, v8

    move/from16 v5, v23

    move-object v8, v15

    move/from16 v23, v9

    move-object v9, v1

    move/from16 v25, v10

    move/from16 v10, v19

    move/from16 v26, v11

    move/from16 v11, v17

    move/from16 v17, v12

    move-object v12, v2

    move-object/from16 v27, v3

    move-object/from16 v22, v13

    move/from16 v3, v17

    move-object v13, v4

    move/from16 v28, v16

    move/from16 v3, v25

    move/from16 v25, v14

    move-object v14, v6

    move-object/from16 v29, v15

    move/from16 v15, v26

    move/from16 v16, v24

    move/from16 v17, v18

    :try_start_5
    invoke-direct/range {v7 .. v17}, Lڝږ؁ڋ/ص;-><init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZCLjava/lang/StringBuilder;Landroid/widget/LinearLayout;Ljava/util/ArrayList;IIF)V

    move-object/from16 v7, v20

    invoke-virtual {v1, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :goto_11
    add-int/lit8 v14, v25, 0x1

    move-object/from16 v1, p0

    move v8, v5

    move-object/from16 v5, v21

    move-object/from16 v13, v22

    move/from16 v9, v23

    move/from16 v10, v24

    move/from16 v11, v26

    move-object/from16 v3, v27

    move/from16 v7, v28

    move-object/from16 v15, v29

    const/4 v12, 0x0

    goto/16 :goto_b

    :catch_3
    move-exception v0

    goto/16 :goto_12

    :cond_19
    move-object/from16 v27, v3

    move-object/from16 v21, v5

    move v5, v8

    move-object/from16 v29, v15

    const/4 v3, -0x1

    const v1, 0x7f08007b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_1a

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    invoke-static {v1}, Lڝږ؁ڋ/ظ;->ؤ(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    instance-of v7, v1, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_1a

    check-cast v1, Landroid/widget/FrameLayout;

    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {v7, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v8}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v1, v8}, Landroid/view/View;->setFocusable(Z)V

    new-instance v14, Lڝږ؁ڋ/ض;

    move-object v7, v14

    move-object/from16 v8, v29

    move-object v9, v1

    move/from16 v10, v19

    move-object v11, v2

    move-object v12, v6

    move-object v13, v4

    invoke-direct/range {v7 .. v13}, Lڝږ؁ڋ/ض;-><init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZLjava/lang/StringBuilder;Ljava/util/ArrayList;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v14}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_1a
    const v1, 0x7f08007c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_1b

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {v1}, Lڝږ؁ڋ/ظ;->ؤ(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    instance-of v3, v1, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_1b

    check-cast v1, Landroid/widget/FrameLayout;

    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v1, v7}, Landroid/view/View;->setFocusable(Z)V

    new-instance v3, Lڝږ؁ڋ/ط;

    move-object v7, v3

    move-object/from16 v8, v29

    move-object v9, v1

    move/from16 v10, v19

    move-object v11, v2

    move-object/from16 v12, v27

    move-object v13, v6

    move-object v14, v4

    invoke-direct/range {v7 .. v14}, Lڝږ؁ڋ/ط;-><init>(Lڝږ؁ڋ/ظ;Landroid/widget/FrameLayout;ZLjava/lang/StringBuilder;Landroid/widget/TextView;Ljava/util/ArrayList;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_1b
    const-string v1, "PIN"

    move-object/from16 v2, v29

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Lڝږ؁ڋ/ظ;->ء(Landroid/view/View;ZLjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_13

    :catch_4
    move-exception v0

    move-object/from16 v21, v5

    :goto_12
    const-string v1, "Failed to inflate PIN layout"

    move-object/from16 v2, v21

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_13
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
