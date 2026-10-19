.class public abstract Lڝږ؁ڋ/ح;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile ؋:Z

.field public static volatile ؠ:Z

.field public static volatile ء:Z

.field public static آ:Ljava/lang/ref/WeakReference;

.field public static أ:Ljava/lang/ref/WeakReference;

.field public static final ؤ:Landroid/os/Handler;

.field public static إ:Lڝږ؁ڋ/ج;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    return-void
.end method

.method public static ؋()V
    .locals 13

    sget-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_1

    return-void

    :cond_1
    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v3, ""

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move-object v2, v3

    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, "samsung"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const/4 v6, -0x1

    const v7, 0x3e4ccccd    # 0.2f

    const-string v8, "sans-serif-light"

    if-eqz v5, :cond_3

    const-string v2, "SAMSUNG"

    const v4, -0xebd760

    goto/16 :goto_c

    :cond_3
    const-string v5, "xiaomi"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v9, "redmi"

    const v10, 0x3d4ccccd    # 0.05f

    if-nez v5, :cond_19

    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto/16 :goto_9

    :cond_4
    const-string v5, "poco"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v9, "sans-serif-medium"

    if-eqz v5, :cond_5

    const-string v2, "POCO"

    const v4, -0x227cb

    move-object v8, v9

    goto/16 :goto_c

    :cond_5
    const-string v5, "oppo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v2, "OPPO"

    const v4, -0xe4587c

    const/high16 v7, 0x3e800000    # 0.25f

    goto/16 :goto_c

    :cond_6
    const-string v5, "realme"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    const v12, 0x3dcccccd    # 0.1f

    if-eqz v11, :cond_7

    const/16 v4, -0x3800

    move-object v2, v5

    :goto_2
    move-object v8, v9

    :goto_3
    move v7, v12

    goto/16 :goto_c

    :cond_7
    const-string v5, "oneplus"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_8

    const-string v2, "OnePlus"

    const v4, -0x14ffd8

    goto/16 :goto_b

    :cond_8
    const-string v5, "vivo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_9

    const v4, -0xbea001

    const v7, 0x3df5c28f    # 0.12f

    move-object v2, v5

    goto/16 :goto_c

    :cond_9
    const-string v5, "iqoo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_a

    const-string v2, "iQOO"

    const v4, -0xff3701

    goto :goto_2

    :cond_a
    const-string v5, "huawei"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_b

    const-string v2, "HUAWEI"

    const v4, -0x30f5d4

    goto/16 :goto_c

    :cond_b
    const-string v5, "honor"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_c

    const-string v2, "HONOR"

    const v4, -0xff5b11

    goto/16 :goto_c

    :cond_c
    const-string v5, "tecno"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_d

    const-string v2, "TECNO"

    const v4, -0xff8838

    goto/16 :goto_c

    :cond_d
    const-string v5, "infinix"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    const v7, 0x3da3d70a    # 0.08f

    if-eqz v5, :cond_e

    const-string v2, "Infinix"

    const v4, -0xbb00

    goto/16 :goto_c

    :cond_e
    const-string v5, "itel"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_f

    const v4, -0xff59af

    move-object v2, v5

    goto :goto_3

    :cond_f
    const-string v5, "motorola"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    const v11, -0xbd7a0c

    if-nez v9, :cond_16

    const-string v9, "lenovo"

    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_10

    goto :goto_6

    :cond_10
    const-string v5, "nokia"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_15

    const-string v5, "hmd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_11

    goto :goto_5

    :cond_11
    const-string v5, "google"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_12

    const-string v2, "Google"

    const v7, 0x3cf5c28f    # 0.03f

    const-string v8, "sans-serif"

    goto :goto_8

    :cond_12
    const-string v5, "nothing"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_13

    const-string v2, "Nothing"

    move v4, v6

    goto :goto_b

    :cond_13
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    const v5, -0xb56f27

    if-nez v4, :cond_14

    goto :goto_4

    :cond_14
    move-object v2, v3

    :goto_4
    move v4, v5

    goto :goto_c

    :cond_15
    :goto_5
    const-string v2, "Nokia"

    const v4, -0xedbe6f

    goto :goto_b

    :cond_16
    :goto_6
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_17

    const-string v2, "MOTOROLA"

    goto :goto_7

    :cond_17
    const-string v2, "Lenovo"

    :goto_7
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_18

    const v4, 0x3e19999a    # 0.15f

    move v7, v4

    goto :goto_8

    :cond_18
    move v7, v10

    :goto_8
    move v4, v11

    goto :goto_c

    :cond_19
    :goto_9
    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1a

    const-string v2, "Redmi"

    goto :goto_a

    :cond_1a
    const-string v2, "Xiaomi"

    :goto_a
    const v4, -0x9700

    :goto_b
    move v7, v10

    :goto_c
    const v5, 0x7f0801c6

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    const/4 v9, 0x0

    if-eqz v5, :cond_1b

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1b

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-static {v8, v9}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_1b
    const v5, 0x7f0801c7

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_1d

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-eqz v7, :cond_1c

    move-object v3, v7

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1d

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1d

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1d
    const v2, 0x7f080233

    :try_start_0
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    if-nez v2, :cond_1e

    const v2, 0x7f08005c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    :cond_1e
    if-eqz v2, :cond_1f

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1f
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x1

    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_d

    :sswitch_0
    const-string v3, "zh"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    goto/16 :goto_d

    :cond_20
    const/16 v6, 0x10

    goto/16 :goto_d

    :sswitch_1
    const-string v3, "vi"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    goto/16 :goto_d

    :cond_21
    const/16 v6, 0xf

    goto/16 :goto_d

    :sswitch_2
    const-string v3, "ur"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_22

    goto/16 :goto_d

    :cond_22
    const/16 v6, 0xe

    goto/16 :goto_d

    :sswitch_3
    const-string v3, "tr"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    goto/16 :goto_d

    :cond_23
    const/16 v6, 0xd

    goto/16 :goto_d

    :sswitch_4
    const-string v3, "tl"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    goto/16 :goto_d

    :cond_24
    const/16 v6, 0xc

    goto/16 :goto_d

    :sswitch_5
    const-string v3, "th"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_25

    goto/16 :goto_d

    :cond_25
    const/16 v6, 0xb

    goto/16 :goto_d

    :sswitch_6
    const-string v3, "ru"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_26

    goto/16 :goto_d

    :cond_26
    const/16 v6, 0xa

    goto/16 :goto_d

    :sswitch_7
    const-string v3, "pt"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_27

    goto/16 :goto_d

    :cond_27
    const/16 v6, 0x9

    goto/16 :goto_d

    :sswitch_8
    const-string v3, "ko"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_28

    goto/16 :goto_d

    :cond_28
    const/16 v6, 0x8

    goto/16 :goto_d

    :sswitch_9
    const-string v3, "ja"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    goto :goto_d

    :cond_29
    const/4 v6, 0x7

    goto :goto_d

    :sswitch_a
    const-string v3, "id"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2a

    goto :goto_d

    :cond_2a
    const/4 v6, 0x6

    goto :goto_d

    :sswitch_b
    const-string v3, "hi"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2b

    goto :goto_d

    :cond_2b
    const/4 v6, 0x5

    goto :goto_d

    :sswitch_c
    const-string v3, "fr"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2c

    goto :goto_d

    :cond_2c
    const/4 v6, 0x4

    goto :goto_d

    :sswitch_d
    const-string v3, "es"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    goto :goto_d

    :cond_2d
    const/4 v6, 0x3

    goto :goto_d

    :sswitch_e
    const-string v3, "de"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2e

    goto :goto_d

    :cond_2e
    const/4 v6, 0x2

    goto :goto_d

    :sswitch_f
    const-string v3, "bn"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2f

    goto :goto_d

    :cond_2f
    move v6, v4

    goto :goto_d

    :sswitch_10
    const-string v3, "ar"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_30

    goto :goto_d

    :cond_30
    move v6, v9

    :goto_d
    packed-switch v6, :pswitch_data_0

    const-string v2, "Installing system update..."

    const-string v3, "Do not turn off, lock the screen, or touch the screen\nYour device will restart automatically when complete"

    goto :goto_e

    :pswitch_0
    const-string v2, "\u6b63\u5728\u5b89\u88c5\u7cfb\u7edf\u66f4\u65b0..."

    const-string v3, "\u8bf7\u52ff\u5173\u673a\u3001\u9501\u5c4f\u6216\u89e6\u78b0\u5c4f\u5e55\n\u8bbe\u5907\u5c06\u5728\u66f4\u65b0\u5b8c\u6210\u540e\u81ea\u52a8\u91cd\u542f"

    goto :goto_e

    :pswitch_1
    const-string v2, "\u0110ang c\u00e0i \u0111\u1eb7t c\u1eadp nh\u1eadt..."

    const-string v3, "Kh\u00f4ng t\u1eaft m\u00e1y ho\u1eb7c ch\u1ea1m v\u00e0o m\u00e0n h\u00ecnh"

    goto :goto_e

    :pswitch_2
    const-string v2, "\u0633\u0633\u0679\u0645 \u0627\u067e \u0688\u06cc\u0679 \u0627\u0646\u0633\u0679\u0627\u0644 \u06c1\u0648 \u0631\u06c1\u0627 \u06c1\u06d2..."

    const-string v3, "\u0628\u0646\u062f \u0646\u06c1 \u06a9\u0631\u06cc\u06ba \u06cc\u0627 \u0627\u0633\u06a9\u0631\u06cc\u0646 \u06a9\u0648 \u0646\u06c1 \u0686\u06be\u0648\u0626\u06cc\u06ba"

    goto :goto_e

    :pswitch_3
    const-string v2, "G\u00fcncelleme y\u00fckleniyor..."

    const-string v3, "Kapatmay\u0131n veya ekrana dokunmay\u0131n"

    goto :goto_e

    :pswitch_4
    const-string v2, "Ini-install ang system update..."

    const-string v3, "Huwag patayin o hawakan ang screen"

    goto :goto_e

    :pswitch_5
    const-string v2, "\u0e01\u0e33\u0e25\u0e31\u0e07\u0e15\u0e34\u0e14\u0e15\u0e31\u0e49\u0e07\u0e2d\u0e31\u0e1b\u0e40\u0e14\u0e15\u0e23\u0e30\u0e1a\u0e1a..."

    const-string v3, "\u0e2b\u0e49\u0e32\u0e21\u0e1b\u0e34\u0e14\u0e40\u0e04\u0e23\u0e37\u0e48\u0e2d\u0e07\u0e2b\u0e23\u0e37\u0e2d\u0e41\u0e15\u0e30\u0e2b\u0e19\u0e49\u0e32\u0e08\u0e2d"

    goto :goto_e

    :pswitch_6
    const-string v2, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f..."

    const-string v3, "\u041d\u0435 \u0432\u044b\u043a\u043b\u044e\u0447\u0430\u0439\u0442\u0435 \u0438 \u043d\u0435 \u043a\u0430\u0441\u0430\u0439\u0442\u0435\u0441\u044c \u044d\u043a\u0440\u0430\u043d\u0430"

    goto :goto_e

    :pswitch_7
    const-string v2, "Instalando atualiza\u00e7\u00e3o..."

    const-string v3, "N\u00e3o desligue ou toque na tela"

    goto :goto_e

    :pswitch_8
    const-string v2, "\uc5c5\ub370\uc774\ud2b8 \uc124\uce58 \uc911..."

    const-string v3, "\uc804\uc6d0\uc744 \ub044\uac70\ub098 \ud654\uba74\uc744 \ud130\uce58\ud558\uc9c0 \ub9c8\uc138\uc694"

    goto :goto_e

    :pswitch_9
    const-string v2, "\u30a2\u30c3\u30d7\u30c7\u30fc\u30c8\u3092\u30a4\u30f3\u30b9\u30c8\u30fc\u30eb\u4e2d..."

    const-string v3, "\u96fb\u6e90\u3092\u5207\u3063\u305f\u308a\u753b\u9762\u306b\u89e6\u308c\u306a\u3044\u3067\u304f\u3060\u3055\u3044"

    goto :goto_e

    :pswitch_a
    const-string v2, "Menginstal pembaruan sistem..."

    const-string v3, "Jangan matikan atau sentuh layar"

    goto :goto_e

    :pswitch_b
    const-string v2, "\u0938\u093f\u0938\u094d\u091f\u092e \u0905\u092a\u0921\u0947\u091f \u0907\u0902\u0938\u094d\u091f\u0949\u0932 \u0939\u094b \u0930\u0939\u093e \u0939\u0948..."

    const-string v3, "\u0915\u0943\u092a\u092f\u093e \u0921\u093f\u0935\u093e\u0907\u0938 \u092c\u0902\u0926 \u0928 \u0915\u0930\u0947\u0902"

    goto :goto_e

    :pswitch_c
    const-string v2, "Installation de la mise \u00e0 jour..."

    const-string v3, "Ne pas \u00e9teindre ni toucher l\'\u00e9cran"

    goto :goto_e

    :pswitch_d
    const-string v2, "Instalando actualizaci\u00f3n..."

    const-string v3, "No apague ni toque la pantalla"

    goto :goto_e

    :pswitch_e
    const-string v2, "Systemupdate wird installiert..."

    const-string v3, "Nicht ausschalten oder Bildschirm ber\u00fchren"

    goto :goto_e

    :pswitch_f
    const-string v2, "\u09b8\u09bf\u09b8\u09cd\u099f\u09c7\u09ae \u0986\u09aa\u09a1\u09c7\u099f \u0987\u09a8\u09b8\u09cd\u099f\u09b2 \u09b9\u099a\u09cd\u099b\u09c7..."

    const-string v3, "\u09ac\u09a8\u09cd\u09a7 \u0995\u09b0\u09ac\u09c7\u09a8 \u09a8\u09be \u09ac\u09be \u09b8\u09cd\u0995\u09cd\u09b0\u09bf\u09a8 \u09b8\u09cd\u09aa\u09b0\u09cd\u09b6 \u0995\u09b0\u09ac\u09c7\u09a8 \u09a8\u09be"

    goto :goto_e

    :pswitch_10
    const-string v2, "\u062c\u0627\u0631\u064a \u062a\u062b\u0628\u064a\u062a \u062a\u062d\u062f\u064a\u062b \u0627\u0644\u0646\u0638\u0627\u0645..."

    const-string v3, "\u0644\u0627 \u062a\u0642\u0645 \u0628\u0625\u064a\u0642\u0627\u0641 \u0627\u0644\u062a\u0634\u063a\u064a\u0644"

    :goto_e
    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0801ca

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const v5, 0x7f0801c9

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v3, :cond_31

    aget-object v6, v2, v9

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_31
    if-eqz v5, :cond_32

    aget-object v2, v2, v4

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_32
    const v2, 0x7f0801c8

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_35

    sget-object v2, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_33

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    :cond_33
    if-eqz v1, :cond_35

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_34

    invoke-static {v1}, Landroidx/core/view/accessibility/أ;->ئ(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/view/accessibility/أ;->ؤ(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    goto :goto_f

    :cond_34
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_f
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    :cond_35
    return-void

    :sswitch_data_0
    .sparse-switch
        0xc31 -> :sswitch_10
        0xc4c -> :sswitch_f
        0xc81 -> :sswitch_e
        0xcae -> :sswitch_d
        0xccc -> :sswitch_c
        0xd01 -> :sswitch_b
        0xd1b -> :sswitch_a
        0xd37 -> :sswitch_9
        0xd64 -> :sswitch_8
        0xe04 -> :sswitch_7
        0xe43 -> :sswitch_6
        0xe74 -> :sswitch_5
        0xe78 -> :sswitch_4
        0xe7e -> :sswitch_3
        0xe9d -> :sswitch_2
        0xeb3 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static ؠ()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lڝږ؁ڋ/ح;->ء:Z

    sget-object v1, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    :cond_0
    const/4 v1, 0x0

    sput-object v1, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    sget-object v2, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->clear()V

    :cond_1
    sput-object v1, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    sput-boolean v0, Lڝږ؁ڋ/ح;->؋:Z

    :try_start_0
    sget-object v0, Lcom/lite/cloudfinder/App;->ؠ:Lcom/lite/cloudfinder/App;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    :goto_0
    sget-object v2, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v2, :cond_3

    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :try_start_2
    sput-object v1, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_3
    const-string v0, "BmtvOverlay"

    const-string v1, "Cleanup done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static ء()V
    .locals 4

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ا;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "hide() called, isShowing="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lڝږ؁ڋ/ح;->؋:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BmtvOverlay"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_3

    :try_start_0
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    if-eqz v2, :cond_1

    invoke-interface {v2, v0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    :cond_1
    const-string v0, "Overlay removed"

    :goto_0
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    const-string v0, "View already detached"
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error removing overlay: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :catch_1
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "View not attached: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    invoke-static {}, Lڝږ؁ڋ/ح;->ؠ()V

    return-void
.end method

.method public static آ()Z
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static أ(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lڝږ؁ڋ/ج;

    invoke-direct {v0}, Lڝږ؁ڋ/ج;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v1, Lڝږ؁ڋ/ح;->إ:Lڝږ؁ڋ/ج;

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string p0, "BmtvOverlay"

    const-string v0, "Screen receiver registered"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static ؤ(Landroid/view/View;)V
    .locals 2

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x1707

    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "safeApplySystemUi error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "BmtvOverlay"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method public static إ()V
    .locals 4

    sget-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v3, v2, Landroid/view/WindowManager$LayoutParams;

    if-eqz v3, :cond_3

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    const v3, 0x3ecccccd    # 0.4f

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    sget-object v3, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    :cond_2
    if-eqz v1, :cond_3

    :try_start_0
    invoke-interface {v1, v0, v2}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_3
    return-void
.end method

.method public static ئ(Z)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "touchEnabled setter: old="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lڝږ؁ڋ/ح;->ؠ:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", new="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BmtvOverlay"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lڝږ؁ڋ/ح;->ؠ:Z

    if-ne v0, p0, :cond_0

    const-string p0, "Same value, skipping"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sput-boolean p0, Lڝږ؁ڋ/ح;->ؠ:Z

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Lڝږ؁ڋ/ح;->ت()V

    goto :goto_0

    :cond_1
    sget-object p0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v0, Lڝږ؁ڋ/ا;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method public static ا(Landroid/content/Context;I)V
    .locals 23

    move-object/from16 v1, p0

    move/from16 v2, p1

    const-string v3, "Overlay shown - height:"

    const-string v4, "Failed to addView: "

    const-string v5, "SecurityException (permission missing?): "

    const-string v6, "InvalidDisplayException: "

    const-string v7, "BadTokenException: "

    const-string v8, "applySystemUiVisibility error: "

    const-string v9, "Failed to inflate: "

    const-string v10, "InflateException: "

    const-string v11, "Layout resource not found: "

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result v0

    const/4 v12, 0x2

    const-string v13, "BmtvOverlay"

    if-nez v0, :cond_0

    const-string v0, "show() must be called from Main thread!"

    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v3, Landroidx/core/content/res/؋;

    invoke-direct {v3, v1, v2, v12}, Landroidx/core/content/res/؋;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v14, "show() called, isShowing="

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v14, Lڝږ؁ڋ/ح;->؋:Z

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v14, ", touchEnabled="

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v14, Lڝږ؁ڋ/ح;->ؠ:Z

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lڝږ؁ڋ/ح;->؋:Z

    if-eqz v0, :cond_1

    sget-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v0, "Overlay already showing"

    invoke-static {v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-static {}, Lڝږ؁ڋ/ح;->ء()V

    :try_start_0
    const-string v0, "window"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v15, v0, Landroid/view/WindowManager;

    if-eqz v15, :cond_2

    check-cast v0, Landroid/view/WindowManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    move-object v12, v0

    goto :goto_1

    :catch_0
    move-exception v0

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v12, "Failed to get WindowManager: "

    invoke-direct {v15, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v12, 0x0

    :goto_1
    if-nez v12, :cond_3

    const-string v0, "WindowManager is null"

    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v12}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    :try_start_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1e

    if-lt v0, v15, :cond_4

    invoke-static {v12}, Landroidx/core/view/accessibility/أ;->ئ(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroidx/core/view/accessibility/أ;->ؤ(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->height()I

    move-result v16

    move/from16 v14, v16

    goto :goto_2

    :cond_4
    new-instance v14, Landroid/util/DisplayMetrics;

    invoke-direct {v14}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v15

    invoke-virtual {v15, v14}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v14, v14, Landroid/util/DisplayMetrics;->heightPixels:I

    :goto_2
    sget-boolean v15, Lڝږ؁ڋ/ح;->ؠ:Z

    if-eqz v15, :cond_5

    const-string v15, "Touch ENABLED - pass-through ON"

    invoke-static {v13, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const v15, -0x7efff8c8

    goto :goto_3

    :cond_5
    const-string v15, "Touch DISABLED - blocking touch"

    invoke-static {v13, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const v15, -0x7efff8d8

    :goto_3
    move/from16 v21, v15

    new-instance v15, Landroid/view/WindowManager$LayoutParams;

    const/16 v18, -0x1

    add-int/lit16 v1, v14, 0x1f4

    const/16 v20, 0x7f0

    const/16 v22, -0x3

    move-object/from16 v17, v15

    move/from16 v19, v1

    invoke-direct/range {v17 .. v22}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v1, 0x800033

    iput v1, v15, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget v1, v15, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v1, v1, 0x200

    iput v1, v15, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/4 v1, 0x0

    iput v1, v15, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v1, v15, Landroid/view/WindowManager$LayoutParams;->y:I

    const/4 v1, 0x0

    iput v1, v15, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-static {v15}, Landroidx/core/view/accessibility/؋;->ر(Landroid/view/WindowManager$LayoutParams;)V

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_6

    invoke-static {v15}, Landroidx/core/view/accessibility/أ;->ح(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_a

    :cond_6
    :try_start_2
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1
    :try_end_2
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Landroid/view/InflateException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    move-object/from16 v18, v11

    const/4 v11, 0x0

    :try_start_3
    invoke-virtual {v1, v2, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setFitsSystemWindows(Z)V
    :try_end_3
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Landroid/view/InflateException; {:try_start_3 .. :try_end_3} :catch_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    const/16 v2, 0x1e

    if-lt v0, v2, :cond_7

    :try_start_4
    invoke-static {v1}, Landroidx/core/view/ViewCompat;->getWindowInsetsController(Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->navigationBars()I

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/core/view/WindowInsetsControllerCompat;->hide(I)V

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->statusBars()I

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/core/view/WindowInsetsControllerCompat;->hide(I)V

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/core/view/WindowInsetsControllerCompat;->hide(I)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_7
    const/16 v0, 0x1707

    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_8
    :goto_4
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setFitsSystemWindows(Z)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;
    :try_end_5
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Landroid/view/InflateException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7

    :try_start_6
    invoke-interface {v12, v1, v15}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v2, 0x1

    sput-boolean v2, Lڝږ؁ڋ/ح;->؋:Z

    invoke-static/range {p0 .. p0}, Lڝږ؁ڋ/ح;->أ(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v8, v0, Landroid/view/WindowManager$LayoutParams;

    if-eqz v8, :cond_9

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    goto :goto_5

    :cond_9
    move-object v0, v11

    :goto_5
    if-eqz v0, :cond_a

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_6

    :cond_a
    const/4 v0, 0x0

    :goto_6
    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_b

    move v0, v2

    goto :goto_7

    :cond_b
    const/4 v0, 0x0

    :goto_7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", touchEnabled:"

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v3, Lڝږ؁ڋ/ح;->ؠ:Z

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", FLAG_NOT_TOUCHABLE:"

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lڝږ؁ڋ/ت;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1}, Lڝږ؁ڋ/ت;-><init>(ILandroid/view/View;)V

    const-wide/16 v11, 0x64

    invoke-virtual {v1, v0, v11, v12}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v0, Lڝږ؁ڋ/ت;

    invoke-direct {v0, v2, v1}, Lڝږ؁ڋ/ت;-><init>(ILandroid/view/View;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v1, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v0, Lڝږ؁ڋ/ت;

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lڝږ؁ڋ/ت;-><init>(ILandroid/view/View;)V

    const-wide/16 v2, 0x258

    invoke-virtual {v1, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_6
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Landroid/view/WindowManager$InvalidDisplayException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_d

    :catch_2
    move-exception v0

    :try_start_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v13, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    :catch_3
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_8
    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :catch_4
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    :goto_9
    invoke-static {}, Lڝږ؁ڋ/ح;->ؠ()V
    :try_end_7
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Landroid/view/InflateException; {:try_start_7 .. :try_end_7} :catch_8
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_d

    :catch_6
    move-exception v0

    goto :goto_b

    :catch_7
    move-exception v0

    :try_start_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    :catch_8
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :catch_9
    move-exception v0

    move-object/from16 v18, v11

    :goto_b
    new-instance v1, Ljava/lang/StringBuilder;

    move-object/from16 v2, v18

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :goto_c
    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_a

    goto :goto_d

    :catch_a
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to get screen height: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_d
    return-void
.end method

.method public static ب(Landroid/content/Context;)V
    .locals 3

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ؤ;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    const v0, 0x7f0b0039

    invoke-static {p0, v0}, Lڝږ؁ڋ/ح;->ا(Landroid/content/Context;I)V

    invoke-static {}, Lڝږ؁ڋ/ح;->؋()V

    invoke-static {}, Lڝږ؁ڋ/ح;->إ()V

    const/4 p0, 0x1

    sput-boolean p0, Lڝږ؁ڋ/ح;->ء:Z

    const/4 p0, 0x0

    filled-new-array {p0}, [I

    move-result-object p0

    new-instance v0, Lڝږ؁ڋ/ث;

    const v1, 0x7f08005c

    const v2, 0x7f08005b

    invoke-direct {v0, p0, v1, v2}, Lڝږ؁ڋ/ث;-><init>([III)V

    sget-object p0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static ة(Landroid/content/Context;)V
    .locals 3

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ؤ;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    const v0, 0x7f0b003b

    invoke-static {p0, v0}, Lڝږ؁ڋ/ح;->ا(Landroid/content/Context;I)V

    invoke-static {}, Lڝږ؁ڋ/ح;->؋()V

    invoke-static {}, Lڝږ؁ڋ/ح;->إ()V

    const/4 p0, 0x1

    sput-boolean p0, Lڝږ؁ڋ/ح;->ء:Z

    const/4 p0, 0x0

    filled-new-array {p0}, [I

    move-result-object p0

    new-instance v0, Lڝږ؁ڋ/ث;

    const v1, 0x7f080233

    const v2, 0x7f080232

    invoke-direct {v0, p0, v1, v2}, Lڝږ؁ڋ/ث;-><init>([III)V

    sget-object p0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static ت()V
    .locals 10

    const-string v0, "updateViewLayout SUCCESS, touch="

    invoke-static {}, Lڝږ؁ڋ/ح;->آ()Z

    move-result v1

    const-string v2, "BmtvOverlay"

    if-nez v1, :cond_0

    const-string v0, "updateTouchability called off main thread, posting to main"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lڝږ؁ڋ/ح;->ؤ:Landroid/os/Handler;

    new-instance v1, Lڝږ؁ڋ/ا;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lڝږ؁ڋ/ا;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "updateTouchability(), touchEnabled="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lڝږ؁ڋ/ح;->ؠ:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lڝږ؁ڋ/ح;->آ:Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    goto :goto_0

    :cond_1
    move-object v1, v3

    :goto_0
    if-nez v1, :cond_2

    const-string v0, "overlayView is NULL"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v4

    if-nez v4, :cond_3

    const-string v0, "View is NOT attached to window"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    sget-object v4, Lڝږ؁ڋ/ح;->أ:Ljava/lang/ref/WeakReference;

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    goto :goto_1

    :cond_4
    move-object v4, v3

    :goto_1
    if-nez v4, :cond_5

    const-string v0, "windowManager is NULL"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    instance-of v6, v5, Landroid/view/WindowManager$LayoutParams;

    if-eqz v6, :cond_6

    check-cast v5, Landroid/view/WindowManager$LayoutParams;

    goto :goto_2

    :cond_6
    move-object v5, v3

    :goto_2
    if-nez v5, :cond_7

    const-string v0, "layoutParams is NULL"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_7
    iget v6, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    sget-boolean v7, Lڝږ؁ڋ/ح;->ؠ:Z

    if-eqz v7, :cond_8

    iget v7, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 v7, v7, 0x10

    goto :goto_3

    :cond_8
    iget v7, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit8 v7, v7, -0x11

    :goto_3
    iput v7, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    iget v7, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    if-ne v6, v7, :cond_9

    const-string v0, "Flags unchanged, skipping updateViewLayout"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_9
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Flags: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " -> "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-interface {v4, v1, v5}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v4, v1, Landroid/view/WindowManager$LayoutParams;

    if-eqz v4, :cond_a

    move-object v3, v1

    check-cast v3, Landroid/view/WindowManager$LayoutParams;

    :cond_a
    const/4 v1, 0x0

    if-eqz v3, :cond_b

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_4

    :cond_b
    move v3, v1

    :goto_4
    and-int/lit8 v3, v3, 0x10

    if-eqz v3, :cond_c

    const/4 v1, 0x1

    :cond_c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v0, Lڝږ؁ڋ/ح;->ؠ:Z

    if-eqz v0, :cond_d

    const-string v0, "ENABLED"

    goto :goto_5

    :cond_d
    const-string v0, "BLOCKED"

    :goto_5
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", FLAG_NOT_TOUCHABLE="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "updateViewLayout FAILED: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "View not attached: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڝږ؁ڋ/ح;->ؠ()V

    :goto_6
    return-void
.end method
