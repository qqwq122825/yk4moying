.class public final Lژة۪ڦضۆۿۡ/ظ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public أ:J

.field public final ؤ:Ljava/lang/Object;

.field public إ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x1

    iput v0, p0, Lژة۪ڦضۆۿۡ/ظ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lژة۪ڦضۆۿۡ/ظ;->أ:J

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ظ;->ؤ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;J)V
    .locals 10

    const/4 v0, 0x0

    iput v0, p0, Lژة۪ڦضۆۿۡ/ظ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-wide/16 v4, 0x1e

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lسڒذ/؋;

    const-string v9, "firebase-iid-executor"

    invoke-direct {v8, v9}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    iput-wide p2, p0, Lژة۪ڦضۆۿۡ/ظ;->أ:J

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object p1

    const-string p2, "power"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const/4 p2, 0x1

    const-string p3, "fiid-sync"

    invoke-virtual {p1, p2, p3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ظ;->ؤ:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget v0, p0, Lژة۪ڦضۆۿۡ/ظ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    const-string v0, "Topic sync or token retrieval failed on hard failure exceptions: "

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v1

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v1

    iget-object v2, p0, Lژة۪ڦضۆۿۡ/ظ;->ؤ:Ljava/lang/Object;

    if-eqz v1, :cond_0

    move-object v1, v2

    check-cast v1, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v4, 0x1

    :try_start_1
    iput-boolean v4, v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    monitor-exit v3

    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v3, v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ئ:Lژة۪ڦضۆۿۡ/ذ;

    invoke-virtual {v3}, Lژة۪ڦضۆۿۡ/ذ;->ء()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    iput-boolean v1, v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v0

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto/16 :goto_2

    :catchall_0
    move-exception v4

    :try_start_5
    monitor-exit v3

    throw v4

    :catchall_1
    move-exception v0

    goto/16 :goto_3

    :catch_0
    move-exception v3

    goto :goto_1

    :cond_1
    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v3

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lژة۪ڦضۆۿۡ/ص;->ؠ(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->ؠ()Z

    move-result v3

    if-nez v3, :cond_2

    new-instance v3, Lژة۪ڦضۆۿۡ/ط;

    invoke-direct {v3, v1, p0}, Lژة۪ڦضۆۿۡ/ط;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v3}, Lژة۪ڦضۆۿۡ/ط;->؋()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v0

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_2
    :try_start_6
    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->ء()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v3
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    iput-boolean v1, v3, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    monitor-exit v3

    goto :goto_0

    :catchall_2
    move-exception v4

    monitor-exit v3

    throw v4

    :cond_3
    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-wide v4, p0, Lژة۪ڦضۆۿۡ/ظ;->أ:J

    invoke-virtual {v3, v4, v5}, Lcom/google/firebase/messaging/FirebaseMessaging;->ؤ(J)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :goto_0
    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v0

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :catchall_3
    move-exception v4

    :try_start_9
    monitor-exit v3

    throw v4
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :goto_1
    :try_start_a
    const-string v4, "FirebaseMessaging"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Won\'t retry the operation."

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    iput-boolean v1, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v0

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_2
    check-cast v2, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_4
    return-void

    :catchall_4
    move-exception v1

    :try_start_d
    monitor-exit v0

    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :goto_3
    invoke-static {}, Lژة۪ڦضۆۿۡ/ص;->؋()Lژة۪ڦضۆۿۡ/ص;

    move-result-object v1

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lژة۪ڦضۆۿۡ/ص;->ء(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_5

    check-cast v2, Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_5
    throw v0

    :goto_4
    :try_start_e
    sget-object v0, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ا:Ljava/util/concurrent/ExecutorService;

    sget-object v0, Lسۄھؤۏ۫/؋;->إ:Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;

    if-eqz v0, :cond_7

    sget-object v1, Lسۄھؤۏ۫/؋;->ة:Ljava/lang/String;

    if-nez v1, :cond_6

    const-string v1, ""

    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0}, Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;->ٵ()V

    iput-object v1, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    iput-wide v2, p0, Lژة۪ڦضۆۿۡ/ظ;->أ:J
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1

    goto :goto_5

    :catch_1
    move-exception v0

    const-string v1, "PeriodicTreeUploader"

    const-string v2, "periodic upload error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_7
    :goto_5
    const-wide/16 v0, 0xbb8

    :try_start_f
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_f
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_f} :catch_2

    goto :goto_4

    :catch_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    return-object v0
.end method

.method public final ؠ()Z
    .locals 2

    invoke-virtual {p0}, Lژة۪ڦضۆۿۡ/ظ;->؋()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public final ء()Z
    .locals 6

    const-string v0, "FirebaseMessaging"

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lژة۪ڦضۆۿۡ/ظ;->إ:Ljava/lang/Object;

    check-cast v3, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v3}, Lcom/google/firebase/messaging/FirebaseMessaging;->؋()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v3, "Token retrieval failed: null"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    const/4 v3, 0x3

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "Token successfully retrieved"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    :cond_1
    return v1

    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    const-string v1, "Token retrieval failed with SecurityException. Will retry token retrieval"

    :goto_0
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :goto_1
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "SERVICE_NOT_AVAILABLE"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "INTERNAL_SERVER_ERROR"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "InternalServerError"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :cond_3
    :goto_2
    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Token retrieval failed: "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ". Will retry token retrieval"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_4
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    const-string v1, "Token retrieval failed without exception message. Will retry token retrieval"

    goto :goto_0

    :cond_5
    throw v3
.end method
