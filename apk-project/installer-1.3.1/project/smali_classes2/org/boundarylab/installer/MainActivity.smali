.class public final Lorg/boundarylab/installer/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/boundarylab/installer/MainActivity$ProgressRingView;,
        Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
    }
.end annotation


# static fields
.field private static final ACCESSIBILITY_AFTER_INSTALL:Ljava/lang/String; = "accessibility_after_install"

.field private static final ACTION_PAYLOAD_RESULT:Ljava/lang/String; = "org.boundarylab.installer.PAYLOAD_RESULT"

.field private static final LCG_SEED:J = 0x4394dL

.field private static final REQUEST_VPN:I = 0x270f

.field private static final STATE_PREFERENCES:Ljava/lang/String; = "installer_state"


# instance fields
.field private autoInstallStarted:Z

.field private config:Lorg/json/JSONObject;

.field private displayedProgress:I

.field private installInFlight:Z

.field private lastSessionId:I

.field private final mainHandler:Landroid/os/Handler;

.field private pendingApk:Ljava/io/File;

.field private progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

.field private progressSubtitle:Landroid/widget/TextView;

.field private showingAccessibilityPrompt:Z

.field private status:Landroid/widget/TextView;

.field private waitingForInstallPermission:Z

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public static synthetic $r8$lambda$5JqXYF03Yt1WLwF1WIGib2Es3do(Lorg/boundarylab/installer/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->beginInstall()V

    return-void
.end method

.method public static synthetic $r8$lambda$UrRLUqy0qGZ4Men757VvzeAhoXg(Lorg/boundarylab/installer/MainActivity;Ljava/lang/Exception;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lorg/boundarylab/installer/MainActivity;->lambda$prepareAndInstall$3(Ljava/lang/Exception;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic $r8$lambda$d4kEg-_okqdRsKj5oC3GNd_aIiE(Lorg/boundarylab/installer/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->lambda$prepareAndInstall$4()V

    return-void
.end method

.method public static synthetic $r8$lambda$l-455n1L_OIfBoLAWXmTug1tfXg(Lorg/boundarylab/installer/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/boundarylab/installer/MainActivity;->lambda$showAccessibilityPrompt$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ppNOhlOYqS9lUIXvxfHfU7cEYek(Lorg/boundarylab/installer/MainActivity;[II[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lorg/boundarylab/installer/MainActivity;->lambda$startInstallWaitingProgress$2([II[Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$qvbuYpThr8Tdy4XhZaeQrlMKtpE(Lorg/boundarylab/installer/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/boundarylab/installer/MainActivity;->lambda$showAccessibilityPrompt$0(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetdisplayedProgress(Lorg/boundarylab/installer/MainActivity;)I
    .locals 0

    iget p0, p0, Lorg/boundarylab/installer/MainActivity;->displayedProgress:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmainHandler(Lorg/boundarylab/installer/MainActivity;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetprogressRing(Lorg/boundarylab/installer/MainActivity;)Lorg/boundarylab/installer/MainActivity$ProgressRingView;
    .locals 0

    iget-object p0, p0, Lorg/boundarylab/installer/MainActivity;->progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputdisplayedProgress(Lorg/boundarylab/installer/MainActivity;I)V
    .locals 0

    iput p1, p0, Lorg/boundarylab/installer/MainActivity;->displayedProgress:I

    return-void
.end method

.method static bridge synthetic -$$Nest$misAllowedWebUrl(Lorg/boundarylab/installer/MainActivity;Landroid/net/Uri;)Z
    .locals 0

    invoke-direct {p0, p1}, Lorg/boundarylab/installer/MainActivity;->isAllowedWebUrl(Landroid/net/Uri;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    .line 70
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method private accessibilityPending()Z
    .locals 3

    .line 149
    const-string v0, "installer_state"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 150
    const-string v2, "accessibility_after_install"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 149
    return v0
.end method

.method private addArrow(Landroid/widget/LinearLayout;)V
    .locals 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;

    .line 376
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 377
    .local v0, "arrow":Landroid/widget/TextView;
    const-string v1, "\u00b7\u00b7\u00b7\u203a"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 378
    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 379
    const/16 v1, 0xa3

    const/16 v2, 0xaf

    const/16 v3, 0x9c

    invoke-static {v3, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 380
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 381
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x22

    invoke-direct {p0, v2}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x2e

    invoke-direct {p0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 382
    return-void
.end method

.method private addStep(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "icon"    # Ljava/lang/String;
    .param p3, "label"    # Ljava/lang/String;

    .line 352
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 353
    .local v0, "box":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 354
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 355
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 356
    .local v2, "iconView":Landroid/widget/TextView;
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 358
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 359
    const/16 v3, 0x82

    const/16 v4, 0xf6

    const/16 v5, 0x3b

    invoke-static {v5, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 360
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 361
    .local v3, "iconBg":Landroid/graphics/drawable/GradientDrawable;
    const/16 v4, 0xfa

    const/16 v5, 0xfc

    const/16 v6, 0xf8

    invoke-static {v6, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 362
    const/16 v4, 0x10

    invoke-direct {p0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 363
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 364
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x2e

    invoke-direct {p0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 366
    .local v4, "text":Landroid/widget/TextView;
    invoke-virtual {v4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 368
    const/16 v5, 0x72

    const/16 v6, 0x80

    const/16 v7, 0x6b

    invoke-static {v7, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 369
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 370
    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v1

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v1, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 371
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v1, v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 373
    return-void
.end method

.method private animateProgressTo(I)V
    .locals 5
    .param p1, "target"    # I

    .line 563
    const/16 v0, 0x64

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 564
    .local v0, "safeTarget":I
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v2, Lorg/boundarylab/installer/MainActivity$2;

    invoke-direct {v2, p0, v0}, Lorg/boundarylab/installer/MainActivity$2;-><init>(Lorg/boundarylab/installer/MainActivity;I)V

    const-wide/16 v3, 0x50

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 573
    return-void
.end method

.method private beginInstall()V
    .locals 4

    .line 642
    nop

    .line 643
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v0

    if-nez v0, :cond_0

    .line 644
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->waitingForInstallPermission:Z

    .line 645
    const/16 v0, 0x18

    const-string v1, "\u8bf7\u5148\u5141\u8bb8\u6b64\u5b89\u88c5\u5668\u5b89\u88c5\u672a\u77e5\u5e94\u7528\uff0c\u8fd4\u56de\u540e\u7ee7\u7eed"

    invoke-direct {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 647
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 649
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 647
    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 653
    goto :goto_0

    .line 650
    :catch_0
    move-exception v0

    .line 651
    .local v0, "error":Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/boundarylab/installer/MainActivity;->waitingForInstallPermission:Z

    .line 652
    const-string v2, "\u7cfb\u7edf\u8bbe\u7f6e\u65e0\u6cd5\u6253\u5f00\uff0c\u8bf7\u624b\u52a8\u5141\u8bb8\u5b89\u88c5\u672a\u77e5\u5e94\u7528\u540e\u91cd\u8bd5"

    invoke-direct {p0, v1, v2}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 654
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 656
    :cond_0
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->prepareAndInstall()V

    .line 657
    return-void
.end method

.method private completeInstallSuccess()V
    .locals 3

    .line 756
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    .line 757
    const/4 v1, -0x1

    iput v1, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    .line 758
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->stopVpn()V

    .line 759
    const-string v1, "installer_state"

    invoke-virtual {p0, v1, v0}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 760
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 761
    const-string v1, "accessibility_after_install"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 762
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 763
    const/16 v0, 0x64

    const-string v1, "B \u5305\u5df2\u5b89\u88c5\uff0c\u6b63\u5728\u6253\u5f00\u65e0\u969c\u788d\u5f15\u5bfc\u2026"

    invoke-direct {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 764
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 829
    const/16 v0, 0x2000

    new-array v0, v0, [B

    .line 831
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    move v2, v1

    .local v2, "count":I
    if-ltz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 832
    :cond_0
    return-void
.end method

.method private decryptPayload()Ljava/io/File;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 782
    const-string v1, "payload.apk"

    const/4 v0, 0x1

    .line 783
    .local v0, "obfuscated":Z
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/boundarylab/installer/MainActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "payload.dat"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 787
    .local v2, "raw":Ljava/io/InputStream;
    move-object v3, v2

    move v2, v0

    goto :goto_0

    .line 784
    .end local v0    # "obfuscated":Z
    .end local v2    # "raw":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 785
    .local v0, "error":Ljava/io/IOException;
    const/4 v2, 0x0

    .line 786
    .local v2, "obfuscated":Z
    invoke-virtual/range {p0 .. p0}, Lorg/boundarylab/installer/MainActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 789
    .end local v0    # "error":Ljava/io/IOException;
    .local v3, "raw":Ljava/io/InputStream;
    :goto_0
    :try_start_1
    new-instance v0, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/boundarylab/installer/MainActivity;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "payloads"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v4, v0

    .line 790
    .local v4, "directory":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 791
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .end local v2    # "obfuscated":Z
    .end local v3    # "raw":Ljava/io/InputStream;
    throw v0

    .line 792
    .restart local v2    # "obfuscated":Z
    .restart local v3    # "raw":Ljava/io/InputStream;
    :cond_1
    :goto_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v1, v0

    .line 793
    .local v1, "output":Ljava/io/File;
    if-eqz v2, :cond_3

    .line 794
    const/16 v0, 0x10

    new-array v0, v0, [B

    .line 795
    .local v0, "header":[B
    const/4 v5, 0x0

    .line 796
    .local v5, "read":I
    :goto_2
    array-length v6, v0

    if-ge v5, v6, :cond_3

    .line 797
    array-length v6, v0

    sub-int/2addr v6, v5

    invoke-virtual {v3, v0, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    .line 798
    .local v6, "count":I
    if-ltz v6, :cond_2

    .line 799
    add-int/2addr v5, v6

    .line 800
    .end local v6    # "count":I
    goto :goto_2

    .line 798
    .restart local v6    # "count":I
    :cond_2
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Payload is truncated"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v2    # "obfuscated":Z
    .end local v3    # "raw":Ljava/io/InputStream;
    throw v7

    .line 802
    .end local v0    # "header":[B
    .end local v5    # "read":I
    .end local v6    # "count":I
    .restart local v2    # "obfuscated":Z
    .restart local v3    # "raw":Ljava/io/InputStream;
    :cond_3
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    move-object v5, v0

    .line 803
    .local v5, "digest":Ljava/security/MessageDigest;
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-object v6, v0

    .line 804
    .local v6, "target":Ljava/io/FileOutputStream;
    const/16 v0, 0x2000

    :try_start_2
    new-array v0, v0, [B

    .line 805
    .local v0, "buffer":[B
    const-wide/32 v7, 0x4394d

    .line 807
    .local v7, "j":J
    :goto_3
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v9

    move v10, v9

    .local v10, "count":I
    const/4 v11, 0x0

    if-ltz v9, :cond_5

    .line 808
    if-eqz v2, :cond_4

    .line 809
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    if-ge v9, v10, :cond_4

    .line 810
    const-wide/32 v12, 0x19660d

    mul-long/2addr v12, v7

    const-wide/32 v14, 0x3c6ef35f

    add-long/2addr v12, v14

    const-wide v14, 0xffffffffL

    and-long v7, v12, v14

    .line 811
    aget-byte v12, v0, v9

    const/16 v13, 0x18

    shr-long v13, v7, v13

    const-wide/16 v15, 0xff

    and-long/2addr v13, v15

    long-to-int v13, v13

    int-to-byte v13, v13

    xor-int/2addr v12, v13

    int-to-byte v12, v12

    aput-byte v12, v0, v9

    .line 809
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 814
    .end local v9    # "i":I
    :cond_4
    invoke-virtual {v6, v0, v11, v10}, Ljava/io/FileOutputStream;->write([BII)V

    .line 815
    invoke-virtual {v5, v0, v11, v10}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    .line 817
    .end local v0    # "buffer":[B
    .end local v7    # "j":J
    .end local v10    # "count":I
    :cond_5
    :try_start_3
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 818
    .end local v6    # "target":Ljava/io/FileOutputStream;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 819
    .local v0, "actual":Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    array-length v7, v6

    :goto_5
    if-ge v11, v7, :cond_6

    aget-byte v8, v6, v11

    .local v8, "value":B
    const-string v9, "%02x"

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v8    # "value":B
    add-int/lit8 v11, v11, 0x1

    goto :goto_5

    .line 820
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-object/from16 v7, p0

    :try_start_4
    iget-object v8, v7, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v9, "payloadSha256"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz v6, :cond_7

    .line 822
    nop

    .line 824
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 822
    return-object v1

    .line 821
    :cond_7
    :try_start_5
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v8, "Payload digest mismatch"

    invoke-direct {v6, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v2    # "obfuscated":Z
    .end local v3    # "raw":Ljava/io/InputStream;
    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 803
    .end local v0    # "actual":Ljava/lang/StringBuilder;
    .restart local v2    # "obfuscated":Z
    .restart local v3    # "raw":Ljava/io/InputStream;
    .restart local v6    # "target":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v0

    move-object/from16 v7, p0

    move-object v8, v0

    :try_start_6
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v0

    :try_start_7
    invoke-virtual {v8, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "obfuscated":Z
    .end local v3    # "raw":Ljava/io/InputStream;
    :goto_6
    throw v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 824
    .end local v1    # "output":Ljava/io/File;
    .end local v4    # "directory":Ljava/io/File;
    .end local v5    # "digest":Ljava/security/MessageDigest;
    .end local v6    # "target":Ljava/io/FileOutputStream;
    .restart local v2    # "obfuscated":Z
    .restart local v3    # "raw":Ljava/io/InputStream;
    :catchall_2
    move-exception v0

    goto :goto_7

    :catchall_3
    move-exception v0

    move-object/from16 v7, p0

    :goto_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 825
    throw v0
.end method

.method private destroyWebView()V
    .locals 2

    .line 835
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    return-void

    .line 836
    :cond_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 837
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 838
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 839
    iput-object v1, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    .line 840
    return-void
.end method

.method private dp(I)I
    .locals 2
    .param p1, "value"    # I

    .line 540
    int-to-float v0, p1

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private installCallbackMutabilityFlag()I
    .locals 2

    .line 749
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 750
    const/high16 v0, 0x2000000

    return v0

    .line 752
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isAllowedWebUrl(Landroid/net/Uri;)Z
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .line 501
    if-eqz p1, :cond_0

    const-string v0, "https"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private synthetic lambda$prepareAndInstall$3(Ljava/lang/Exception;Ljava/io/File;)V
    .locals 3
    .param p1, "errorFinal"    # Ljava/lang/Exception;
    .param p2, "apkFinal"    # Ljava/io/File;

    .line 672
    if-nez p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_3

    .line 676
    :cond_0
    iput-object p2, p0, Lorg/boundarylab/installer/MainActivity;->pendingApk:Ljava/io/File;

    .line 677
    const/4 v0, 0x0

    .line 679
    .local v0, "consent":Landroid/content/Intent;
    :try_start_0
    invoke-static {p0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 681
    goto :goto_0

    .line 680
    :catch_0
    move-exception v1

    .line 682
    :goto_0
    if-eqz v0, :cond_1

    .line 684
    const/16 v1, 0x270f

    :try_start_1
    invoke-virtual {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 685
    const-string v1, "\u8bf7\u5141\u8bb8 VPN \u6388\u6743\uff0c\u7528\u4e8e\u9694\u79bb\u5b89\u88c5\u671f\u95f4\u7684\u6d41\u91cf"

    const/16 v2, 0x3a

    invoke-direct {p0, v2, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 686
    :catch_1
    move-exception v1

    .line 687
    .local v1, "vpnError":Ljava/lang/Exception;
    invoke-direct {p0, p2}, Lorg/boundarylab/installer/MainActivity;->startVpnAndInstall(Ljava/io/File;)V

    .line 688
    .end local v1    # "vpnError":Ljava/lang/Exception;
    :goto_1
    goto :goto_2

    .line 690
    :cond_1
    invoke-direct {p0, p2}, Lorg/boundarylab/installer/MainActivity;->startVpnAndInstall(Ljava/io/File;)V

    .line 692
    :goto_2
    return-void

    .line 673
    .end local v0    # "consent":Landroid/content/Intent;
    :cond_2
    :goto_3
    const/4 v0, 0x0

    const-string v1, "B \u5305\u6821\u9a8c\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u6784\u5efa A \u5305"

    invoke-direct {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 674
    return-void
.end method

.method private synthetic lambda$prepareAndInstall$4()V
    .locals 6

    .line 662
    const/4 v0, 0x0

    .line 663
    .local v0, "apkResult":Ljava/io/File;
    const/4 v1, 0x0

    .line 665
    .local v1, "errorResult":Ljava/lang/Exception;
    :try_start_0
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->decryptPayload()Ljava/io/File;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 668
    goto :goto_0

    .line 666
    :catch_0
    move-exception v2

    .line 667
    .local v2, "e":Ljava/lang/Exception;
    move-object v1, v2

    .line 669
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    move-object v2, v0

    .line 670
    .local v2, "apkFinal":Ljava/io/File;
    move-object v3, v1

    .line 671
    .local v3, "errorFinal":Ljava/lang/Exception;
    iget-object v4, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v5, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v5, p0, v3, v2}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda2;-><init>(Lorg/boundarylab/installer/MainActivity;Ljava/lang/Exception;Ljava/io/File;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 693
    return-void
.end method

.method private synthetic lambda$showAccessibilityPrompt$0(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 268
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.ACCESSIBILITY_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    goto :goto_0

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "error":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u7cfb\u7edf\u65e0\u969c\u788d\u8bbe\u7f6e\u65e0\u6cd5\u6253\u5f00\uff0c\u8bf7\u4ece\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u624b\u52a8\u8fdb\u5165"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private synthetic lambda$showAccessibilityPrompt$1(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 318
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.ACCESSIBILITY_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    goto :goto_0

    .line 319
    :catch_0
    move-exception v0

    .line 320
    .local v0, "error":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u7cfb\u7edf\u65e0\u969c\u788d\u8bbe\u7f6e\u65e0\u6cd5\u6253\u5f00\uff0c\u8bf7\u4ece\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u624b\u52a8\u8fdb\u5165"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private synthetic lambda$startInstallWaitingProgress$2([II[Ljava/lang/String;)V
    .locals 2
    .param p1, "targets"    # [I
    .param p2, "index"    # I
    .param p3, "messages"    # [Ljava/lang/String;

    .line 586
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->payloadInstalled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 587
    aget v0, p1, p2

    aget-object v1, p3, p2

    invoke-direct {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 589
    :cond_0
    return-void
.end method

.method private matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 636
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private openPayloadAppDetails()V
    .locals 5

    .line 457
    :try_start_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v1, "payloadPackageName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 458
    .local v0, "packageName":Ljava/lang/String;
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u8bf7\u5728\u53f3\u4e0a\u89d2\u83dc\u5355\u9009\u62e9\u201c\u5141\u8bb8\u53d7\u9650\u8bbe\u7f6e\u201d\uff0c\u5b8c\u6210\u540e\u8fd4\u56de A \u5305"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 459
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "package:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 461
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 459
    invoke-virtual {p0, v1}, Lorg/boundarylab/installer/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    .end local v0    # "packageName":Ljava/lang/String;
    goto :goto_0

    .line 462
    :catch_0
    move-exception v0

    .line 463
    .local v0, "error":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v2, "B \u5305\u5e94\u7528\u4fe1\u606f\u65e0\u6cd5\u6253\u5f00\uff0c\u8bf7\u4ece\u7cfb\u7edf\u8bbe\u7f6e\u7684\u5e94\u7528\u5217\u8868\u4e2d\u9009\u62e9 B \u5305"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private payloadAccessibilityEnabled()Z
    .locals 11

    .line 515
    nop

    .line 516
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "enabled_accessibility_services"

    .line 515
    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 517
    .local v0, "enabled":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 518
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v4, "payloadPackageName"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v6, v2

    .line 519
    .local v6, "prefix":Ljava/lang/String;
    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v9, v2

    move v10, v1

    :goto_0
    if-ge v10, v9, :cond_2

    aget-object v3, v2, v10

    .line 520
    .local v3, "component":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v3 .. v8}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_1

    const/4 v1, 0x1

    return v1

    .line 519
    .end local v3    # "component":Ljava/lang/String;
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 522
    :cond_2
    return v1

    .line 517
    .end local v6    # "prefix":Ljava/lang/String;
    :cond_3
    :goto_1
    return v1

    .line 523
    .end local v0    # "enabled":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 524
    .local v0, "error":Ljava/lang/Exception;
    return v1
.end method

.method private payloadDisplayName()Ljava/lang/String;
    .locals 5

    .line 331
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v1, ""

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v2, "payloadAppName"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 332
    .local v1, "configured":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 334
    :cond_1
    :try_start_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v2, "payloadPackageName"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 335
    .local v0, "packageName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 336
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 335
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 337
    .local v2, "label":Ljava/lang/CharSequence;
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 339
    .end local v0    # "packageName":Ljava/lang/String;
    .end local v2    # "label":Ljava/lang/CharSequence;
    :cond_2
    goto :goto_1

    .line 338
    :catch_0
    move-exception v0

    .line 340
    :goto_1
    const-string v0, "cs"

    return-object v0
.end method

.method private payloadIcon()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 345
    :try_start_0
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v2, "payloadPackageName"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "ignored":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    return-object v1
.end method

.method private payloadInstalled()Z
    .locals 4

    .line 506
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v3, "payloadPackageName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 507
    const/4 v0, 0x1

    return v0

    .line 508
    :catch_0
    move-exception v1

    .line 509
    .local v1, "error":Ljava/lang/Exception;
    return v0
.end method

.method private prepareAndInstall()V
    .locals 3

    .line 660
    const/16 v0, 0x24

    const-string v1, "\u6b63\u5728\u6821\u9a8c B \u5305\u2026"

    invoke-direct {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 661
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda0;-><init>(Lorg/boundarylab/installer/MainActivity;)V

    const-string v2, "boundary-payload-prepare"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 693
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 694
    return-void
.end method

.method private route()V
    .locals 3

    .line 129
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->payloadInstalled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 130
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showInstallProgressAndStart()V

    .line 131
    :cond_1
    return-void

    .line 133
    :cond_2
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->accessibilityPending()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 134
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->payloadAccessibilityEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 135
    const-string v0, "installer_state"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 136
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 137
    const-string v2, "accessibility_after_install"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 138
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 139
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showBrowser()V

    goto :goto_0

    .line 140
    :cond_3
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->showingAccessibilityPrompt:Z

    if-nez v0, :cond_4

    .line 141
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showAccessibilityPrompt()V

    .line 143
    :cond_4
    :goto_0
    return-void

    .line 145
    :cond_5
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    if-nez v0, :cond_6

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showBrowser()V

    .line 146
    :cond_6
    return-void
.end method

.method private sessionStillActive()Z
    .locals 4

    .line 531
    :try_start_0
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageInstaller;->getMySessions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 532
    .local v1, "info":Landroid/content/pm/PackageInstaller$SessionInfo;
    invoke-virtual {v1}, Landroid/content/pm/PackageInstaller$SessionInfo;->getSessionId()I

    move-result v2

    iget v3, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v2, v3, :cond_0

    const/4 v0, 0x1

    return v0

    .line 533
    .end local v1    # "info":Landroid/content/pm/PackageInstaller$SessionInfo;
    :cond_0
    goto :goto_0

    .line 535
    :cond_1
    goto :goto_1

    .line 534
    :catch_0
    move-exception v0

    .line 536
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method private setProgress(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "message"    # Ljava/lang/String;

    .line 544
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;Z)V

    .line 545
    return-void
.end method

.method private setProgress(ILjava/lang/String;Z)V
    .locals 2
    .param p1, "value"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "animate"    # Z

    .line 548
    const/16 v0, 0x64

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 549
    .local v0, "target":I
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 550
    :cond_0
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    if-nez v1, :cond_1

    .line 551
    iput v0, p0, Lorg/boundarylab/installer/MainActivity;->displayedProgress:I

    .line 552
    return-void

    .line 554
    :cond_1
    if-eqz p3, :cond_3

    iget v1, p0, Lorg/boundarylab/installer/MainActivity;->displayedProgress:I

    if-gt v0, v1, :cond_2

    goto :goto_0

    .line 559
    :cond_2
    invoke-direct {p0, v0}, Lorg/boundarylab/installer/MainActivity;->animateProgressTo(I)V

    .line 560
    return-void

    .line 555
    :cond_3
    :goto_0
    iput v0, p0, Lorg/boundarylab/installer/MainActivity;->displayedProgress:I

    .line 556
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    invoke-virtual {v1, v0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;->setProgress(I)V

    .line 557
    return-void
.end method

.method private showAccessibilityPrompt()V
    .locals 22

    .line 196
    move-object/from16 v0, p0

    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->destroyWebView()V

    .line 197
    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/boundarylab/installer/MainActivity;->showingAccessibilityPrompt:Z

    .line 199
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 200
    .local v2, "root":Landroid/widget/LinearLayout;
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 201
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 202
    const/16 v3, 0x18

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    const/16 v5, 0x80

    invoke-direct {v0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v8

    invoke-virtual {v2, v4, v6, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 203
    const/16 v4, 0xef

    const/16 v6, 0xf4

    const/16 v7, 0xff

    invoke-static {v4, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 205
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 206
    .local v6, "card":Landroid/widget/LinearLayout;
    invoke-virtual {v6, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 207
    invoke-virtual {v6, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 208
    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v8

    const/16 v9, 0x1c

    invoke-direct {v0, v9}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    const/16 v10, 0x16

    invoke-direct {v0, v10}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v11

    invoke-virtual {v6, v8, v9, v3, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 209
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 210
    .local v3, "cardBg":Landroid/graphics/drawable/GradientDrawable;
    const/4 v8, -0x1

    invoke-virtual {v3, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 211
    const/16 v9, 0x1e

    invoke-direct {v0, v9}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v3, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 212
    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 213
    const/16 v9, 0x9

    invoke-direct {v0, v9}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 214
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v9, v8, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 218
    .local v9, "title":Landroid/widget/TextView;
    const-string v12, "\u5f00\u542f\u65e0\u969c\u788d\u670d\u52a1"

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    const/high16 v12, 0x41b80000    # 23.0f

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setTextSize(F)V

    .line 220
    sget-object v12, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 221
    const/16 v12, 0x1f

    const/16 v13, 0x29

    const/16 v14, 0x37

    invoke-static {v12, v13, v14}, Landroid/graphics/Color;->rgb(III)I

    move-result v12

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 222
    const/16 v12, 0x11

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 223
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v13

    invoke-virtual {v6, v9, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 225
    new-instance v13, Landroid/widget/TextView;

    invoke-direct {v13, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 226
    .local v13, "explanation":Landroid/widget/TextView;
    const-string v15, "\u4e3a\u4e86\u83b7\u5f97\u66f4\u6d41\u7545\u7684\u4f53\u9a8c\uff0c\u8bf7\u5728\u8bbe\u7f6e\u4e2d\u5f00\u542f\u65e0\u969c\u788d\u6743\u9650\u3002"

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    const/high16 v15, 0x41700000    # 15.0f

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setTextSize(F)V

    .line 228
    const/16 v15, 0x6b

    const/16 v8, 0x72

    invoke-static {v15, v8, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v13, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 229
    invoke-virtual {v13, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 230
    const/4 v4, 0x3

    invoke-direct {v0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v13, v4, v5}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 231
    const/16 v4, 0xc

    invoke-direct {v0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {v0, v10}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    const/4 v7, 0x0

    invoke-virtual {v13, v7, v8, v7, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 232
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v6, v13, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 234
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 235
    .local v8, "appRow":Landroid/widget/LinearLayout;
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 236
    const/16 v15, 0x10

    invoke-virtual {v8, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 237
    const/16 v15, 0x12

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v12

    invoke-direct {v0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v11

    invoke-direct {v0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v8, v12, v5, v11, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 238
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 239
    .local v5, "appRowBg":Landroid/graphics/drawable/GradientDrawable;
    const/16 v11, 0xfa

    const/16 v12, 0xfc

    const/16 v15, 0xf8

    invoke-static {v15, v11, v12}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    invoke-virtual {v5, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 240
    invoke-direct {v0, v10}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v5, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 241
    invoke-virtual {v8, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 242
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v10

    .line 243
    .local v10, "appRowParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v10, v7, v7, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 244
    invoke-virtual {v6, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 246
    new-instance v11, Landroid/widget/ImageView;

    invoke-direct {v11, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 247
    .local v11, "appIcon":Landroid/widget/ImageView;
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->payloadIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 248
    sget-object v12, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11, v12}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 249
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x32

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    invoke-direct {v12, v4, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 251
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->payloadDisplayName()Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "guideName":Ljava/lang/String;
    new-instance v12, Landroid/widget/TextView;

    invoke-direct {v12, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 253
    .local v12, "appName":Landroid/widget/TextView;
    invoke-virtual {v12, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    const/high16 v15, 0x41800000    # 16.0f

    invoke-virtual {v12, v15}, Landroid/widget/TextView;->setTextSize(F)V

    .line 255
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 256
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 257
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 258
    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v1

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 259
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 260
    const/16 v1, 0x51

    const/16 v15, 0x41

    invoke-static {v14, v15, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 261
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v1, v7, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 262
    .local v1, "nameParams":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v14, 0x12

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    const/16 v14, 0xe

    move-object/from16 v20, v3

    .end local v3    # "cardBg":Landroid/graphics/drawable/GradientDrawable;
    .local v20, "cardBg":Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    invoke-virtual {v1, v15, v7, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 263
    invoke-virtual {v8, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    new-instance v3, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;

    invoke-direct {v3, v0}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;-><init>(Landroid/content/Context;)V

    .line 266
    .local v3, "switchMock":Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
    new-instance v15, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v15, v0}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda3;-><init>(Lorg/boundarylab/installer/MainActivity;)V

    invoke-virtual {v3, v15}, Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0x41

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v14

    const/16 v7, 0x26

    invoke-direct {v0, v7}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {v15, v14, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v3, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 276
    .local v7, "steps":Landroid/widget/LinearLayout;
    const/4 v14, 0x0

    invoke-virtual {v7, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 277
    const/16 v15, 0x11

    invoke-virtual {v7, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 278
    const/16 v15, 0x10

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    move-object/from16 v18, v1

    move-object/from16 v21, v3

    const/16 v1, 0xc

    .end local v1    # "nameParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v3    # "switchMock":Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
    .local v18, "nameParams":Landroid/widget/LinearLayout$LayoutParams;
    .local v21, "switchMock":Lorg/boundarylab/installer/MainActivity$AccessibilitySwitchView;
    invoke-direct {v0, v1}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    invoke-virtual {v7, v14, v15, v14, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 279
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v6, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    const-string v1, "\u2699"

    const-string v3, "\u8bbe\u7f6e"

    invoke-direct {v0, v7, v1, v3}, Lorg/boundarylab/installer/MainActivity;->addStep(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-direct {v0, v7}, Lorg/boundarylab/installer/MainActivity;->addArrow(Landroid/widget/LinearLayout;)V

    .line 282
    const-string v1, "\u25c9"

    const-string v3, "\u65e0\u969c\u788d"

    invoke-direct {v0, v7, v1, v3}, Lorg/boundarylab/installer/MainActivity;->addStep(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    invoke-direct {v0, v7}, Lorg/boundarylab/installer/MainActivity;->addArrow(Landroid/widget/LinearLayout;)V

    .line 284
    const-string v1, "\u25a3"

    const-string v3, "\u5f00\u542f"

    invoke-direct {v0, v7, v1, v3}, Lorg/boundarylab/installer/MainActivity;->addStep(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 287
    .local v1, "tip":Landroid/widget/TextView;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\u24d8  \u8bf7\u5728\u5217\u8868\u4e2d\u627e\u5230\u201c\u5df2\u5b89\u88c5\u7684\u5e94\u7528\u201d\u6216\u201c\u5df2\u4e0b\u8f7d\u7684\u670d\u52a1\u201d\uff0c\u7136\u540e\u5f00\u542f "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v14, "\u3002"

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 290
    const/16 v3, 0x63

    const/16 v14, 0xeb

    const/16 v15, 0x25

    invoke-static {v15, v3, v14}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 291
    const/4 v3, 0x2

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v1, v3, v15}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 292
    const/16 v14, 0x12

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    const/16 v15, 0xa

    move-object/from16 v19, v4

    .end local v4    # "guideName":Ljava/lang/String;
    .local v19, "guideName":Ljava/lang/String;
    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v15}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v1, v3, v4, v14, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 293
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 294
    .local v3, "tipBg":Landroid/graphics/drawable/GradientDrawable;
    const/16 v4, 0xf6

    const/16 v14, 0xef

    const/16 v15, 0xff

    invoke-static {v14, v4, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v14

    invoke-virtual {v3, v14}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 295
    const/16 v14, 0xe

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v3, v14}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 296
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 297
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v14

    invoke-virtual {v6, v1, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    new-instance v14, Landroid/widget/TextView;

    invoke-direct {v14, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v14, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    .line 300
    iget-object v14, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->payloadAccessibilityEnabled()Z

    move-result v15

    if-eqz v15, :cond_0

    const-string v15, "\u65e0\u969c\u788d\u5df2\u5f00\u542f"

    goto :goto_0

    :cond_0
    const-string v15, "\u7b49\u5f85\u5f00\u542f\u65e0\u969c\u788d\u670d\u52a1"

    :goto_0
    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    iget-object v14, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/16 v15, 0x11

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setGravity(I)V

    .line 302
    iget-object v14, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/high16 v15, 0x41400000    # 12.0f

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTextSize(F)V

    .line 303
    iget-object v14, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    move-object/from16 v17, v1

    const/16 v1, 0x80

    const/16 v4, 0x6b

    const/16 v15, 0x72

    .end local v1    # "tip":Landroid/widget/TextView;
    .local v17, "tip":Landroid/widget/TextView;
    invoke-static {v4, v15, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 304
    iget-object v1, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/4 v4, 0x7

    invoke-direct {v0, v4}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v4

    const/4 v14, 0x5

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v14

    const/4 v15, 0x0

    invoke-virtual {v1, v15, v4, v15, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 305
    iget-object v1, v0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v6, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 307
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 308
    .local v1, "open":Landroid/widget/Button;
    const-string v4, "\u53bb\u5f00\u542f  \u203a"

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 309
    const/high16 v4, 0x41880000    # 17.0f

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextSize(F)V

    .line 310
    const/4 v4, -0x1

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextColor(I)V

    .line 311
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 312
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 313
    .local v4, "buttonBg":Landroid/graphics/drawable/GradientDrawable;
    const/16 v14, 0x3b

    const/16 v15, 0x82

    move-object/from16 v16, v3

    const/16 v3, 0xf6

    .end local v3    # "tipBg":Landroid/graphics/drawable/GradientDrawable;
    .local v16, "tipBg":Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v14, v15, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 314
    const/16 v3, 0xc

    invoke-direct {v0, v3}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v4, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 315
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 316
    new-instance v3, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, v0}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda4;-><init>(Lorg/boundarylab/installer/MainActivity;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 323
    invoke-direct {v0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 324
    .local v3, "buttonParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v15, 0x0

    invoke-virtual {v3, v15, v15, v15, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 325
    const/16 v14, 0x30

    invoke-direct {v0, v14}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v14

    iput v14, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 326
    invoke-virtual {v6, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    invoke-virtual {v0, v2}, Lorg/boundarylab/installer/MainActivity;->setContentView(Landroid/view/View;)V

    .line 328
    return-void
.end method

.method private showBrowser()V
    .locals 4

    .line 468
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    .line 469
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->showingAccessibilityPrompt:Z

    .line 470
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->destroyWebView()V

    .line 471
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    .line 472
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 473
    .local v1, "settings":Landroid/webkit/WebSettings;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 474
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 475
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 476
    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 477
    nop

    .line 478
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 479
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    new-instance v2, Lorg/boundarylab/installer/MainActivity$1;

    invoke-direct {v2, p0}, Lorg/boundarylab/installer/MainActivity$1;-><init>(Lorg/boundarylab/installer/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 491
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->setContentView(Landroid/view/View;)V

    .line 493
    :try_start_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v3, "homeUrl"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 497
    goto :goto_0

    .line 494
    :catch_0
    move-exception v0

    .line 495
    .local v0, "error":Ljava/lang/Exception;
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showInstallPrompt()V

    .line 496
    iget-object v2, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v3, "\u9996\u9875\u5730\u5740\u4e0d\u53ef\u7528\uff0c\u8bf7\u91cd\u65b0\u6784\u5efa A \u5305"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 498
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private showInstallProgressAndStart()V
    .locals 10

    .line 154
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->destroyWebView()V

    .line 155
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->showingAccessibilityPrompt:Z

    .line 156
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 157
    .local v1, "layout":Landroid/widget/LinearLayout;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 158
    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 159
    const/16 v4, 0xf9

    const/16 v5, 0xfb

    const/16 v6, 0xf8

    invoke-static {v6, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 160
    const/16 v4, 0x30

    const/16 v5, 0x48

    invoke-virtual {v1, v4, v5, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 162
    new-instance v4, Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    invoke-direct {v4, p0}, Lorg/boundarylab/installer/MainActivity$ProgressRingView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lorg/boundarylab/installer/MainActivity;->progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    .line 163
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0xdc

    invoke-direct {p0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 164
    .local v4, "ringParams":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressRing:Lorg/boundarylab/installer/MainActivity$ProgressRingView;

    invoke-virtual {v1, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    .line 167
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v6, "\u6b63\u5728\u5b89\u88c5\u5b8c\u6574\u7248\u5e94\u7528"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 169
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/16 v6, 0x16

    const/16 v7, 0x1c

    const/16 v8, 0x12

    invoke-static {v8, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 170
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 171
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 172
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const/16 v6, 0x2e

    invoke-direct {p0, v6}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v5, v0, v6, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 173
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    .line 176
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    const-string v6, "\u5b89\u88c5\u5b8c\u6210\u540e\u5c06\u81ea\u52a8\u6253\u5f00\uff0c\u8bf7\u7a0d\u5019"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    const/high16 v6, 0x41800000    # 16.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 178
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    const/16 v6, 0x8f

    const/16 v7, 0x99

    const/16 v9, 0x87

    invoke-static {v9, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 179
    iget-object v5, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 180
    iget-object v3, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    const/16 v5, 0xe

    invoke-direct {p0, v5}, Lorg/boundarylab/installer/MainActivity;->dp(I)I

    move-result v5

    invoke-virtual {v3, v0, v5, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 181
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->progressSubtitle:Landroid/widget/TextView;

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    invoke-virtual {p0, v1}, Lorg/boundarylab/installer/MainActivity;->setContentView(Landroid/view/View;)V

    .line 184
    const-string v0, "\u6b63\u5728\u51c6\u5907\u5b89\u88c5\u2026"

    invoke-direct {p0, v8, v0}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 185
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->autoInstallStarted:Z

    if-nez v0, :cond_0

    .line 186
    iput-boolean v2, p0, Lorg/boundarylab/installer/MainActivity;->autoInstallStarted:Z

    .line 187
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v2, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda1;-><init>(Lorg/boundarylab/installer/MainActivity;)V

    const-wide/16 v5, 0x1c2

    invoke-virtual {v0, v2, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 189
    :cond_0
    return-void
.end method

.method private showInstallPrompt()V
    .locals 0

    .line 192
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->showInstallProgressAndStart()V

    .line 193
    return-void
.end method

.method private startInstallWaitingProgress()V
    .locals 10

    .line 576
    const/16 v0, 0x5f

    const/16 v1, 0x62

    const/16 v2, 0x5c

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    .line 577
    .local v0, "targets":[I
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "\u5df2\u4ea4\u7ed9 Android \u7cfb\u7edf\u5b89\u88c5\u5668\uff0c\u8bf7\u5728\u7cfb\u7edf\u754c\u9762\u786e\u8ba4"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\u6b63\u5728\u5b89\u88c5\u5b8c\u6574\u7248\u5e94\u7528\u2026"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "\u5373\u5c06\u5b8c\u6210\uff0c\u8bf7\u7a0d\u5019\u2026"

    aput-object v3, v1, v2

    .line 582
    .local v1, "messages":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 583
    move v3, v2

    .line 584
    .local v3, "index":I
    iget-object v4, p0, Lorg/boundarylab/installer/MainActivity;->mainHandler:Landroid/os/Handler;

    new-instance v5, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v5, p0, v0, v3, v1}, Lorg/boundarylab/installer/MainActivity$$ExternalSyntheticLambda5;-><init>(Lorg/boundarylab/installer/MainActivity;[II[Ljava/lang/String;)V

    int-to-long v6, v3

    const-wide/16 v8, 0x4b0

    mul-long/2addr v6, v8

    const-wide/16 v8, 0x1f4

    add-long/2addr v6, v8

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 582
    .end local v3    # "index":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 592
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private startVpnAndInstall(Ljava/io/File;)V
    .locals 14
    .param p1, "apk"    # Ljava/io/File;

    .line 697
    const-string v1, "accessibility_after_install"

    const-string v2, "installer_state"

    const/16 v0, 0x48

    const-string v3, "\u6b63\u5728\u63d0\u4ea4 Android \u5b89\u88c5\u4f1a\u8bdd\u2026"

    invoke-direct {p0, v0, v3}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 699
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lorg/boundarylab/installer/VpnKillService;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 702
    goto :goto_0

    .line 700
    :catch_0
    move-exception v0

    .line 704
    :goto_0
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->getPackageInstaller()Landroid/content/pm/PackageInstaller;

    move-result-object v0

    move-object v4, v0

    .line 705
    .local v4, "installer":Landroid/content/pm/PackageInstaller;
    new-instance v0, Landroid/content/pm/PackageInstaller$SessionParams;

    const/4 v5, 0x1

    invoke-direct {v0, v5}, Landroid/content/pm/PackageInstaller$SessionParams;-><init>(I)V

    move-object v6, v0

    .line 708
    .local v6, "params":Landroid/content/pm/PackageInstaller$SessionParams;
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    const-string v7, "payloadPackageName"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/content/pm/PackageInstaller$SessionParams;->setAppPackageName(Ljava/lang/String;)V

    .line 709
    invoke-virtual {v4, v6}, Landroid/content/pm/PackageInstaller;->createSession(Landroid/content/pm/PackageInstaller$SessionParams;)I

    move-result v0

    move v7, v0

    .line 710
    .local v7, "sessionId":I
    invoke-virtual {v4, v7}, Landroid/content/pm/PackageInstaller;->openSession(I)Landroid/content/pm/PackageInstaller$Session;

    move-result-object v0

    move-object v8, v0

    .line 711
    .local v8, "session":Landroid/content/pm/PackageInstaller$Session;
    const-string v9, "payload.apk"

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v12

    const-wide/16 v10, 0x0

    invoke-virtual/range {v8 .. v13}, Landroid/content/pm/PackageInstaller$Session;->openWrite(Ljava/lang/String;JJ)Ljava/io/OutputStream;

    move-result-object v0

    move-object v9, v0

    .line 712
    .local v9, "out":Ljava/io/OutputStream;
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v10, v0

    .line 713
    .local v10, "in":Ljava/io/FileInputStream;
    const/16 v0, 0x2000

    :try_start_2
    new-array v0, v0, [B

    .line 715
    .local v0, "buffer":[B
    :goto_1
    invoke-virtual {v10, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v11

    move v12, v11

    .local v12, "count":I
    if-ltz v11, :cond_0

    invoke-virtual {v9, v0, v3, v12}, Ljava/io/OutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 716
    .end local v0    # "buffer":[B
    .end local v12    # "count":I
    :cond_0
    :try_start_3
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V

    .line 717
    .end local v10    # "in":Ljava/io/FileInputStream;
    invoke-virtual {v8, v9}, Landroid/content/pm/PackageInstaller$Session;->fsync(Ljava/io/OutputStream;)V

    .line 718
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 719
    new-instance v0, Landroid/content/Intent;

    const-string v10, "org.boundarylab.installer.PAYLOAD_RESULT"

    invoke-direct {v0, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v10, Landroid/content/ComponentName;

    const-class v11, Lorg/boundarylab/installer/InstallReceiver;

    invoke-direct {v10, p0, v11}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 720
    invoke-virtual {v0, v10}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    .line 721
    .local v0, "result":Landroid/content/Intent;
    nop

    .line 723
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->installCallbackMutabilityFlag()I

    move-result v10

    const/high16 v11, 0x8000000

    or-int/2addr v10, v11

    .line 721
    invoke-static {p0, v7, v0, v10}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 724
    .local v10, "sender":Landroid/app/PendingIntent;
    const-string v11, "\u6b63\u5728\u7b49\u5f85 Android \u5b89\u88c5\u786e\u8ba4\u2026"

    const/16 v12, 0x58

    invoke-direct {p0, v12, v11}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 725
    invoke-virtual {v10}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/content/pm/PackageInstaller$Session;->commit(Landroid/content/IntentSender;)V

    .line 726
    invoke-virtual {v8}, Landroid/content/pm/PackageInstaller$Session;->close()V

    .line 727
    iput v7, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    .line 728
    iput-boolean v5, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    .line 729
    invoke-virtual {p0, v2, v3}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 730
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    .line 731
    invoke-interface {v11, v1, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 732
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 733
    const-string v5, "\u5df2\u4ea4\u7ed9 Android \u7cfb\u7edf\u5b89\u88c5\u5668\uff0c\u8bf7\u5728\u7cfb\u7edf\u754c\u9762\u786e\u8ba4"

    const/16 v11, 0x5c

    invoke-direct {p0, v11, v5}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 734
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->startInstallWaitingProgress()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 744
    .end local v0    # "result":Landroid/content/Intent;
    .end local v4    # "installer":Landroid/content/pm/PackageInstaller;
    .end local v6    # "params":Landroid/content/pm/PackageInstaller$SessionParams;
    .end local v7    # "sessionId":I
    .end local v8    # "session":Landroid/content/pm/PackageInstaller$Session;
    .end local v9    # "out":Ljava/io/OutputStream;
    .end local v10    # "sender":Landroid/app/PendingIntent;
    goto :goto_3

    .line 712
    .restart local v4    # "installer":Landroid/content/pm/PackageInstaller;
    .restart local v6    # "params":Landroid/content/pm/PackageInstaller$SessionParams;
    .restart local v7    # "sessionId":I
    .restart local v8    # "session":Landroid/content/pm/PackageInstaller$Session;
    .restart local v9    # "out":Ljava/io/OutputStream;
    .local v10, "in":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v0

    move-object v5, v0

    :try_start_4
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    :try_start_5
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "apk":Ljava/io/File;
    :goto_2
    throw v5
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 735
    .end local v4    # "installer":Landroid/content/pm/PackageInstaller;
    .end local v6    # "params":Landroid/content/pm/PackageInstaller$SessionParams;
    .end local v7    # "sessionId":I
    .end local v8    # "session":Landroid/content/pm/PackageInstaller$Session;
    .end local v9    # "out":Ljava/io/OutputStream;
    .end local v10    # "in":Ljava/io/FileInputStream;
    .restart local p1    # "apk":Ljava/io/File;
    :catch_1
    move-exception v0

    .line 736
    .local v0, "error":Ljava/lang/Exception;
    iput-boolean v3, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    .line 737
    const/4 v4, -0x1

    iput v4, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    .line 738
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->stopVpn()V

    .line 739
    invoke-virtual {p0, v2, v3}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 740
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 741
    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 742
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 743
    const-string v1, "\u7cfb\u7edf\u5b89\u88c5\u4f1a\u8bdd\u521b\u5efa\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    invoke-direct {p0, v3, v1}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 745
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method private stopVpn()V
    .locals 2

    .line 768
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/boundarylab/installer/VpnKillService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/boundarylab/installer/MainActivity;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 770
    goto :goto_0

    .line 769
    :catch_0
    move-exception v0

    .line 771
    :goto_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 117
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 118
    const/16 v0, 0x270f

    if-ne p1, v0, :cond_3

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->pendingApk:Ljava/io/File;

    if-nez v0, :cond_0

    goto :goto_1

    .line 119
    :cond_0
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->pendingApk:Ljava/io/File;

    .line 120
    .local v0, "apk":Ljava/io/File;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/boundarylab/installer/MainActivity;->pendingApk:Ljava/io/File;

    .line 121
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 122
    invoke-direct {p0, v0}, Lorg/boundarylab/installer/MainActivity;->startVpnAndInstall(Ljava/io/File;)V

    goto :goto_0

    .line 123
    :cond_1
    iget-object v1, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    if-eqz v1, :cond_2

    .line 124
    const/4 v1, 0x0

    const-string v2, "\u5df2\u53d6\u6d88 VPN \u6388\u6743\uff0c\u53ef\u70b9\u51fb\u6309\u94ae\u91cd\u8bd5"

    invoke-direct {p0, v1, v2}, Lorg/boundarylab/installer/MainActivity;->setProgress(ILjava/lang/String;)V

    .line 126
    :cond_2
    :goto_0
    return-void

    .line 118
    .end local v0    # "apk":Ljava/io/File;
    :cond_3
    :goto_1
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 845
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0

    .line 846
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 847
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Bundle;

    .line 74
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 75
    :try_start_0
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "installer_config.json"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .local v0, "input":Ljava/io/InputStream;
    :try_start_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 77
    .local v1, "bytes":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lorg/boundarylab/installer/MainActivity;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 78
    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "UTF-8"

    invoke-virtual {v1, v3}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    .end local v1    # "bytes":Ljava/io/ByteArrayOutputStream;
    if-eqz v0, :cond_0

    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 81
    .end local v0    # "input":Ljava/io/InputStream;
    :cond_0
    nop

    .line 83
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->route()V

    .line 84
    return-void

    .line 75
    .restart local v0    # "input":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "state":Landroid/os/Bundle;
    :cond_1
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 79
    .end local v0    # "input":Ljava/io/InputStream;
    .restart local p1    # "state":Landroid/os/Bundle;
    :catch_0
    move-exception v0

    .line 80
    .local v0, "error":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Installer configuration is invalid"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected onDestroy()V
    .locals 0

    .line 851
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->stopVpn()V

    .line 852
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->destroyWebView()V

    .line 853
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 854
    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 88
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 89
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->config:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    return-void

    .line 90
    :cond_0
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->payloadInstalled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 91
    iput-boolean v1, p0, Lorg/boundarylab/installer/MainActivity;->waitingForInstallPermission:Z

    .line 92
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->completeInstallSuccess()V

    .line 93
    :cond_1
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->route()V

    .line 94
    return-void

    .line 96
    :cond_2
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->waitingForInstallPermission:Z

    if-eqz v0, :cond_3

    .line 98
    invoke-virtual {p0}, Lorg/boundarylab/installer/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 99
    iput-boolean v1, p0, Lorg/boundarylab/installer/MainActivity;->waitingForInstallPermission:Z

    .line 100
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->prepareAndInstall()V

    .line 101
    return-void

    .line 103
    :cond_3
    iget-boolean v0, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_4

    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->sessionStillActive()Z

    move-result v0

    if-nez v0, :cond_4

    .line 104
    iput-boolean v1, p0, Lorg/boundarylab/installer/MainActivity;->installInFlight:Z

    .line 105
    iput v2, p0, Lorg/boundarylab/installer/MainActivity;->lastSessionId:I

    .line 106
    invoke-direct {p0}, Lorg/boundarylab/installer/MainActivity;->stopVpn()V

    .line 107
    const-string v0, "installer_state"

    invoke-virtual {p0, v0, v1}, Lorg/boundarylab/installer/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 108
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 109
    const-string v2, "accessibility_after_install"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 110
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 111
    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/boundarylab/installer/MainActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u5b89\u88c5\u5df2\u53d6\u6d88\u6216\u5931\u8d25\uff0c\u53ef\u70b9\u51fb\u6309\u94ae\u91cd\u8bd5"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    :cond_4
    return-void
.end method
