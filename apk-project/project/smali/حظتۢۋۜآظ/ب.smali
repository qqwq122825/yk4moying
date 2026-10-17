.class public final synthetic Lحظتۢۋۜآظ/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;

.field public final synthetic أ:Landroid/content/Intent;

.field public final synthetic ؤ:Landroid/content/Context;

.field public final synthetic إ:Z

.field public final synthetic ئ:Landroid/content/BroadcastReceiver$PendingResult;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;Landroid/content/Intent;Landroid/content/Context;ZLandroid/content/BroadcastReceiver$PendingResult;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lحظتۢۋۜآظ/ب;->آ:Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;

    iput-object p2, p0, Lحظتۢۋۜآظ/ب;->أ:Landroid/content/Intent;

    iput-object p3, p0, Lحظتۢۋۜآظ/ب;->ؤ:Landroid/content/Context;

    iput-boolean p4, p0, Lحظتۢۋۜآظ/ب;->إ:Z

    iput-object p5, p0, Lحظتۢۋۜآظ/ب;->ئ:Landroid/content/BroadcastReceiver$PendingResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    move-object/from16 v1, p0

    iget-object v0, v1, Lحظتۢۋۜآظ/ب;->آ:Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;

    iget-object v2, v1, Lحظتۢۋۜآظ/ب;->أ:Landroid/content/Intent;

    iget-object v3, v1, Lحظتۢۋۜآظ/ب;->ؤ:Landroid/content/Context;

    iget-boolean v4, v1, Lحظتۢۋۜآظ/ب;->إ:Z

    iget-object v5, v1, Lحظتۢۋۜآظ/ب;->ئ:Landroid/content/BroadcastReceiver$PendingResult;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_0
    const-string v6, "wrapped_intent"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    instance-of v7, v6, Landroid/content/Intent;

    const/4 v8, 0x0

    if-eqz v7, :cond_0

    check-cast v6, Landroid/content/Intent;

    goto :goto_0

    :cond_0
    move-object v6, v8

    :goto_0
    if-eqz v6, :cond_1

    invoke-virtual {v0, v3, v6}, Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;->ء(Landroid/content/Context;Landroid/content/Intent;)I

    move-result v0

    goto/16 :goto_2

    :cond_1
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    if-nez v6, :cond_2

    const/16 v0, 0x1f4

    goto/16 :goto_2

    :cond_2
    new-instance v6, Lحظتۢۋۜآظ/؋;

    invoke-direct {v6, v2}, Lحظتۢۋۜآظ/؋;-><init>(Landroid/content/Intent;)V

    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    const/4 v7, 0x1

    invoke-direct {v2, v7}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    const-class v9, Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;

    monitor-enter v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v10, Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;->ؠ:Ljava/lang/ref/SoftReference;

    if-eqz v10, :cond_3

    invoke-virtual {v10}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/concurrent/Executor;

    :cond_3
    if-nez v8, :cond_4

    new-instance v8, Lسڒذ/؋;

    const-string v10, "pscm-ack-executor"

    invoke-direct {v8, v10}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    new-instance v15, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v11, 0x1

    const/4 v12, 0x1

    const-wide/16 v13, 0x3c

    sget-object v16, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v17, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct/range {v17 .. v17}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move-object v10, v15

    move-object/from16 v18, v15

    move-object/from16 v15, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v8

    invoke-direct/range {v10 .. v17}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    move-object/from16 v8, v18

    invoke-virtual {v8, v7}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    invoke-static {v8}, Ljava/util/concurrent/Executors;->unconfigurableExecutorService(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    new-instance v7, Ljava/lang/ref/SoftReference;

    invoke-direct {v7, v8}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    sput-object v7, Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;->ؠ:Ljava/lang/ref/SoftReference;

    :cond_4
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance v7, Lحظتۢۋۜآظ/ا;

    const/4 v9, 0x0

    invoke-direct {v7, v3, v6, v2, v9}, Lحظتۢۋۜآظ/ا;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;I)V

    invoke-interface {v8, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v3, v6}, Lcom/google/android/gms/cloudmessaging/CloudMessagingReceiver;->؋(Landroid/content/Context;Lحظتۢۋۜآظ/؋;)I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v6, 0x1

    invoke-virtual {v0, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v6, v7, v0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "CloudMessagingReceiver"

    const-string v2, "Message ack timed out"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_4
    const-string v2, "CloudMessagingReceiver"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v6, "Message ack failed: "

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_1
    move v0, v3

    :goto_2
    if-eqz v4, :cond_6

    if-eqz v5, :cond_6

    invoke-virtual {v5, v0}, Landroid/content/BroadcastReceiver$PendingResult;->setResultCode(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_6
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Landroid/content/BroadcastReceiver$PendingResult;->finish()V

    :cond_7
    return-void

    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v0

    if-eqz v5, :cond_8

    invoke-virtual {v5}, Landroid/content/BroadcastReceiver$PendingResult;->finish()V

    :cond_8
    throw v0
.end method
