.class public final Lڜٟٱڀ/د;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ض:Lڜٟٱڀ/د; = null

.field public static ط:Z = false

.field public static ظ:Lokhttp3/OkHttpClient;


# instance fields
.field public ؋:Landroid/content/Context;

.field public ؠ:Lio/socket/client/Socket;

.field public final ء:Lڙڧا/ء;

.field public آ:Lةؽڗںۍټ٘/ء;

.field public أ:Lڜٟٱڀ/أ;

.field public ؤ:Lڜٟٱڀ/إ;

.field public إ:Ljava/lang/String;

.field public ئ:Landroid/os/PowerManager$WakeLock;

.field public final ا:Landroid/os/Handler;

.field public ب:Z

.field public ة:Z

.field public volatile ت:J

.field public ث:Ljava/lang/String;

.field public ج:I

.field public ح:Ljava/lang/String;

.field public final خ:Lڜٟٱڀ/ج;

.field public final د:Lڜٟٱڀ/ج;

.field public final ذ:Lڜٟٱڀ/ج;

.field public final ر:Lڜٟٱڀ/ج;

.field public final ز:Lڜٟٱڀ/ح;

.field public final س:Lڜٟٱڀ/ح;

.field public final ش:Lڜٟٱڀ/ح;

.field public volatile ص:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜٟٱڀ/د;->ب:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lڜٟٱڀ/د;->ة:Z

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lڜٟٱڀ/د;->ت:J

    new-instance v2, Lڜٟٱڀ/ج;

    invoke-direct {v2, p0, v0}, Lڜٟٱڀ/ج;-><init>(Lڜٟٱڀ/د;I)V

    iput-object v2, p0, Lڜٟٱڀ/د;->خ:Lڜٟٱڀ/ج;

    new-instance v2, Lڜٟٱڀ/ج;

    invoke-direct {v2, p0, v1}, Lڜٟٱڀ/ج;-><init>(Lڜٟٱڀ/د;I)V

    iput-object v2, p0, Lڜٟٱڀ/د;->د:Lڜٟٱڀ/ج;

    new-instance v2, Lڜٟٱڀ/ج;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lڜٟٱڀ/ج;-><init>(Lڜٟٱڀ/د;I)V

    iput-object v2, p0, Lڜٟٱڀ/د;->ذ:Lڜٟٱڀ/ج;

    new-instance v2, Lڜٟٱڀ/ج;

    const/4 v4, 0x3

    invoke-direct {v2, p0, v4}, Lڜٟٱڀ/ج;-><init>(Lڜٟٱڀ/د;I)V

    iput-object v2, p0, Lڜٟٱڀ/د;->ر:Lڜٟٱڀ/ج;

    new-instance v2, Lڜٟٱڀ/ح;

    invoke-direct {v2, v0}, Lڜٟٱڀ/ح;-><init>(I)V

    iput-object v2, p0, Lڜٟٱڀ/د;->ز:Lڜٟٱڀ/ح;

    new-instance v0, Lڜٟٱڀ/ح;

    invoke-direct {v0, v1}, Lڜٟٱڀ/ح;-><init>(I)V

    iput-object v0, p0, Lڜٟٱڀ/د;->س:Lڜٟٱڀ/ح;

    new-instance v0, Lڜٟٱڀ/ح;

    invoke-direct {v0, v3}, Lڜٟٱڀ/ح;-><init>(I)V

    iput-object v0, p0, Lڜٟٱڀ/د;->ش:Lڜٟٱڀ/ح;

    new-instance v0, Lڙڧا/ء;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lڙڧا/ء;-><init>(Landroidx/activity/result/؋;)V

    iput-object v0, p0, Lڜٟٱڀ/د;->ء:Lڙڧا/ء;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ReconnectThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lڜٟٱڀ/د;->ا:Landroid/os/Handler;

    return-void
.end method

.method public static declared-synchronized ؠ()Lڜٟٱڀ/د;
    .locals 2

    const-class v0, Lڜٟٱڀ/د;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڜٟٱڀ/د;->ض:Lڜٟٱڀ/د;

    if-nez v1, :cond_0

    new-instance v1, Lڜٟٱڀ/د;

    invoke-direct {v1}, Lڜٟٱڀ/د;-><init>()V

    sput-object v1, Lڜٟٱڀ/د;->ض:Lڜٟٱڀ/د;

    :cond_0
    sget-object v1, Lڜٟٱڀ/د;->ض:Lڜٟٱڀ/د;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public final ؋()V
    .locals 12

    iget-object v0, p0, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    const-string v1, "SocketManager"

    if-nez v0, :cond_0

    const-string v0, "connect() skipped: not initialized (waiting for accessibility)"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lڜٟٱڀ/د;->ب:Z

    const-wide/32 v2, 0xea60

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lڜٟٱڀ/د;->ت:J

    sub-long/2addr v6, v8

    cmp-long v0, v6, v2

    if-lez v0, :cond_2

    const-string v0, "isConnecting stuck for 60s, force resetting"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v5, p0, Lڜٟٱڀ/د;->ب:Z

    :try_start_0
    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/socket/emitter/Emitter;->off()Lio/socket/emitter/Emitter;

    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->disconnect()Lio/socket/client/Socket;

    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->close()Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    iput-object v4, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    iput-object v4, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    iput v5, p0, Lڜٟٱڀ/د;->ج:I

    :cond_2
    iget-boolean v0, p0, Lڜٟٱڀ/د;->ب:Z

    if-eqz v0, :cond_3

    return-void

    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lڜٟٱڀ/د;->ت:J

    sub-long v8, v6, v8

    const-wide/16 v10, 0x1f40

    cmp-long v0, v8, v10

    if-gez v0, :cond_4

    const-string v0, "connect() throttled, rescheduling"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lڜٟٱڀ/د;->أ()V

    return-void

    :cond_4
    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lio/socket/client/Socket;->connected()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "connect() skipped: already connected"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lڜٟٱڀ/د;->ة:Z

    :try_start_1
    iget-object v8, p0, Lڜٟٱڀ/د;->ئ:Landroid/os/PowerManager$WakeLock;

    if-eqz v8, :cond_6

    invoke-virtual {v8}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v8

    if-nez v8, :cond_6

    iget-object v8, p0, Lڜٟٱڀ/د;->ئ:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v8, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v2

    const-string v3, "acquireWakeLock error"

    invoke-static {v1, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_0
    iget-object v2, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    if-eqz v2, :cond_8

    iget v2, p0, Lڜٟٱڀ/د;->ج:I

    if-lez v2, :cond_8

    iget-wide v2, p0, Lڜٟٱڀ/د;->ت:J

    sub-long v2, v6, v2

    const-wide/16 v8, 0x7530

    cmp-long v2, v2, v8

    if-lez v2, :cond_7

    const-string v2, "Socket stale (30s no connect), resetting for fresh probe"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_2
    iget-object v2, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v2}, Lio/socket/client/Socket;->disconnect()Lio/socket/client/Socket;

    iget-object v2, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v2}, Lio/socket/client/Socket;->close()Lio/socket/client/Socket;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    iput-object v4, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    iput-object v4, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    iput v5, p0, Lڜٟٱڀ/د;->ج:I

    goto :goto_1

    :cond_7
    const-string v2, "Reusing existing socket, calling socket.connect()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-wide v6, p0, Lڜٟٱڀ/د;->ت:J

    iput-boolean v0, p0, Lڜٟٱڀ/د;->ب:Z

    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;

    return-void

    :cond_8
    :goto_1
    iput-boolean v0, p0, Lڜٟٱڀ/د;->ب:Z

    iput-wide v6, p0, Lڜٟٱڀ/د;->ت:J

    iget-object v0, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget v0, p0, Lڜٟٱڀ/د;->ج:I

    if-lez v0, :cond_9

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Creating socket for cached host: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lڜٟٱڀ/د;->ث:Ljava/lang/String;

    iget v1, p0, Lڜٟٱڀ/د;->ج:I

    invoke-virtual {p0, v1, v0}, Lڜٟٱڀ/د;->إ(ILjava/lang/String;)V

    return-void

    :cond_9
    const-string v0, "Starting domain probing..."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_3
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lڜٟٱڀ/خ;

    invoke-direct {v2, p0, v5}, Lڜٟٱڀ/خ;-><init>(Lڜٟٱڀ/د;I)V

    const-string v3, "QuickProbe"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    return-void

    :catch_3
    move-exception v0

    const-string v2, "Quick probe setup failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lڜٟٱڀ/د;->ؤ:Lڜٟٱڀ/إ;

    new-instance v1, Lئٱنۃؖۊڄئ/آ;

    const/16 v2, 0x8

    invoke-direct {v1, v2, p0}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Landroidx/constraintlayout/motion/widget/؋;

    const/16 v4, 0x18

    invoke-direct {v3, v4, v0, v1}, Landroidx/constraintlayout/motion/widget/؋;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "DomainProber"

    invoke-direct {v2, v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final ء(Landroid/content/Context;)V
    .locals 7

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "unknown"

    :goto_0
    iput-object v0, p0, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    new-instance v0, Lڜٟٱڀ/أ;

    invoke-direct {v0, p1, p0}, Lڜٟٱڀ/أ;-><init>(Landroid/content/Context;Lڜٟٱڀ/د;)V

    iput-object v0, p0, Lڜٟٱڀ/د;->أ:Lڜٟٱڀ/أ;

    new-instance v0, Lڜٟٱڀ/إ;

    iget-object v1, p0, Lڜٟٱڀ/د;->ء:Lڙڧا/ء;

    iget-object v2, p0, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lڜٟٱڀ/إ;-><init>(Lڙڧا/ء;Ljava/lang/String;)V

    iput-object v0, p0, Lڜٟٱڀ/د;->ؤ:Lڜٟٱڀ/إ;

    sput-object v2, Lسۄھؤۏ۫/؋;->ذ:Ljava/lang/String;

    invoke-static {p1}, Lںڍڒڸ/ش;->ؾ(Landroid/content/Context;)[I

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    const-string v1, "BPackage:SocketWakeLock"

    invoke-virtual {p1, v0, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    iput-object p1, p0, Lڜٟٱڀ/د;->ئ:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_1
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p1

    new-instance v1, Lڛڜڕڰڑ/ؠ;

    invoke-direct {v1, p1, v0}, Lڛڜڕڰڑ/ؠ;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;I)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    const-string p1, "SocketManager"

    :try_start_1
    new-instance v1, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v1}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1e

    invoke-virtual {v1, v3, v4, v2}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const-wide/16 v5, 0x3c

    invoke-virtual {v1, v5, v6, v2}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    invoke-virtual {v1, v3, v4, v2}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-static {v0}, Lڜٟٱڀ/ر;->؋(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    invoke-static {v0}, Lio/socket/client/IO;->setDefaultOkHttpWebSocketFactory(Lokhttp3/WebSocket$Factory;)V

    invoke-static {v0}, Lio/socket/client/IO;->setDefaultOkHttpCallFactory(Lokhttp3/Call$Factory;)V

    const-string v0, "OkHttp configured with trust-all SSL"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "OkHttp setup error"

    invoke-static {p1, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const-string p1, "conn"

    const-string v0, "SocketService.onCreate - initializing connection"

    invoke-static {p1, v0}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final آ()Z
    .locals 1

    iget-object v0, p0, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lio/socket/client/Socket;->connected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final أ()V
    .locals 4

    iget-boolean v0, p0, Lڜٟٱڀ/د;->ة:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lڜٟٱڀ/د;->ا:Landroid/os/Handler;

    new-instance v1, Lڜٟٱڀ/خ;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lڜٟٱڀ/خ;-><init>(Lڜٟٱڀ/د;I)V

    const-wide/16 v2, 0x1f40

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final ؤ(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    iget-object v0, p0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    :cond_0
    return-void
.end method

.method public final إ(ILjava/lang/String;)V
    .locals 16

    move-object/from16 v1, p0

    const-string v2, "SocketManager"

    const-string v0, "Connecting to "

    const-string v3, "&ver=v4.0"

    const-string v4, "apkid=10068&line="

    const-string v5, "/io"

    const-string v6, "https://"

    const/4 v7, 0x0

    :try_start_0
    iget-object v8, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    if-eqz v8, :cond_0

    invoke-virtual {v8}, Lio/socket/emitter/Emitter;->off()Lio/socket/emitter/Emitter;

    iget-object v8, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v8}, Lio/socket/client/Socket;->disconnect()Lio/socket/client/Socket;

    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v6, p2

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lio/socket/client/IO$Options;

    invoke-direct {v8}, Lio/socket/client/IO$Options;-><init>()V

    sget-object v9, Lڜٟٱڀ/د;->ظ:Lokhttp3/OkHttpClient;

    const/4 v10, 0x1

    if-nez v9, :cond_1

    new-instance v9, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v9}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v11, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v12, 0x1e

    invoke-virtual {v9, v12, v13, v11}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    const-wide/16 v14, 0x3c

    invoke-virtual {v9, v14, v15, v11}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    invoke-virtual {v9, v12, v13, v11}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    const-wide/16 v12, 0x19

    invoke-virtual {v9, v12, v13, v11}, Lokhttp3/OkHttpClient$Builder;->pingInterval(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    invoke-virtual {v9, v10}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    invoke-static {v9}, Lڜٟٱڀ/ر;->؋(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v9

    sput-object v9, Lڜٟٱڀ/د;->ظ:Lokhttp3/OkHttpClient;

    :cond_1
    sget-object v9, Lڜٟٱڀ/د;->ظ:Lokhttp3/OkHttpClient;

    iput-object v9, v8, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    iput-object v9, v8, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    iput-boolean v7, v8, Lio/socket/client/Manager$Options;->reconnection:Z

    const-wide/16 v11, 0x1f40

    iput-wide v11, v8, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    iput-wide v11, v8, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    const-wide/32 v11, 0xc350

    iput-wide v11, v8, Lio/socket/client/Manager$Options;->timeout:J

    iput-boolean v7, v8, Lio/socket/client/IO$Options;->forceNew:Z

    new-array v9, v10, [Ljava/lang/String;

    const-string v10, "websocket"

    aput-object v10, v9, v7

    iput-object v9, v8, Lio/socket/engineio/client/Socket$Options;->transports:[Ljava/lang/String;

    iput-boolean v7, v8, Lio/socket/engineio/client/Socket$Options;->upgrade:Z

    iput-boolean v7, v8, Lio/socket/client/IO$Options;->multiplex:Z

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v5, p1

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v8, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    iget-object v5, v1, Lڜٟٱڀ/د;->ح:Ljava/lang/String;

    if-eqz v5, :cond_2

    goto :goto_0

    :cond_2
    const-string v5, ""

    :goto_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&cmode=test&device="

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v8, Lio/socket/engineio/client/Socket$Options;->query:Ljava/lang/String;

    invoke-static {v6, v8}, Lio/socket/client/IO;->socket(Ljava/lang/String;Lio/socket/client/IO$Options;)Lio/socket/client/Socket;

    move-result-object v3

    iput-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    new-instance v4, Lةؽڗںۍټ٘/ء;

    iget-object v5, v1, Lڜٟٱڀ/د;->ء:Lڙڧا/ء;

    iget-object v9, v1, Lڜٟٱڀ/د;->إ:Ljava/lang/String;

    invoke-direct {v4, v3, v5, v9}, Lةؽڗںۍټ٘/ء;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, v1, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    const-string v4, "connect"

    iget-object v5, v1, Lڜٟٱڀ/د;->خ:Lڜٟٱڀ/ج;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "disconnect"

    iget-object v5, v1, Lڜٟٱڀ/د;->د:Lڜٟٱڀ/ج;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "connect_error"

    iget-object v5, v1, Lڜٟٱڀ/د;->ذ:Lڜٟٱڀ/ج;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "connect_timeout"

    new-instance v5, Lڜٟٱڀ/ج;

    const/4 v9, 0x4

    invoke-direct {v5, v1, v9}, Lڜٟٱڀ/ج;-><init>(Lڜٟٱڀ/د;I)V

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "new_msg"

    iget-object v5, v1, Lڜٟٱڀ/د;->ر:Lڜٟٱڀ/ج;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "webrtcOffer"

    iget-object v5, v1, Lڜٟٱڀ/د;->ز:Lڜٟٱڀ/ح;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "webrtcIce"

    iget-object v5, v1, Lڜٟٱڀ/د;->س:Lڜٟٱڀ/ح;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    iget-object v3, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    const-string v4, "webrtcStop"

    iget-object v5, v1, Lڜٟٱڀ/د;->ش:Lڜٟٱڀ/ح;

    invoke-virtual {v3, v4, v5}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " path="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v8, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lڜٟٱڀ/د;->ؠ:Lio/socket/client/Socket;

    invoke-virtual {v0}, Lio/socket/client/Socket;->connect()Lio/socket/client/Socket;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v3, "Socket URI error"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-boolean v7, v1, Lڜٟٱڀ/د;->ب:Z

    invoke-virtual/range {p0 .. p0}, Lڜٟٱڀ/د;->أ()V

    :goto_1
    return-void
.end method
