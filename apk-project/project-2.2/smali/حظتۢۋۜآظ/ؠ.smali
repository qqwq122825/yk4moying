.class public final Lحظتۢۋۜآظ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ئ:I

.field public static ا:Landroid/app/PendingIntent;

.field public static final ب:Ljava/util/regex/Pattern;


# instance fields
.field public final ؋:Landroidx/collection/SimpleArrayMap;

.field public final ؠ:Landroid/content/Context;

.field public final ء:Lحظتۢۋۜآظ/ر;

.field public final آ:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field public final أ:Landroid/os/Messenger;

.field public ؤ:Landroid/os/Messenger;

.field public إ:Lحظتۢۋۜآظ/إ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "\\|ID\\|([^|]+)\\|:?+(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lحظتۢۋۜآظ/ؠ;->ب:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    iput-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    new-instance v0, Lحظتۢۋۜآظ/ر;

    invoke-direct {v0, p1}, Lحظتۢۋۜآظ/ر;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    new-instance p1, Landroid/os/Messenger;

    new-instance v0, Lحظتۢۋۜآظ/أ;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lحظتۢۋۜآظ/أ;-><init>(Lحظتۢۋۜآظ/ؠ;Landroid/os/Looper;)V

    invoke-direct {p1, v0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object p1, p0, Lحظتۢۋۜآظ/ؠ;->أ:Landroid/os/Messenger;

    new-instance p1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    const-wide/16 v1, 0x3c

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v1, v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    iput-object p1, p0, Lحظتۢۋۜآظ/ؠ;->آ:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-void
.end method


# virtual methods
.method public final ؋(Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;
    .locals 8

    const-class v0, Lحظتۢۋۜآظ/ؠ;

    monitor-enter v0

    :try_start_0
    sget v1, Lحظتۢۋۜآظ/ؠ;->ئ:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lحظتۢۋۜآظ/ؠ;->ئ:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit v0

    new-instance v0, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    iget-object v2, p0, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    monitor-enter v2

    :try_start_1
    iget-object v3, p0, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {v3, v1, v0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "com.google.android.gms"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v3, p0, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {v3}, Lحظتۢۋۜآظ/ر;->ؠ()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    const-string v3, "com.google.iid.TOKEN_REQUEST"

    goto :goto_0

    :cond_0
    const-string v3, "com.google.android.c2dm.intent.REGISTER"

    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    const-class v3, Lحظتۢۋۜآظ/ؠ;

    monitor-enter v3

    :try_start_2
    sget-object v5, Lحظتۢۋۜآظ/ؠ;->ا:Landroid/app/PendingIntent;

    const/4 v6, 0x0

    if-nez v5, :cond_1

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const-string v7, "com.google.example.invalidpackage"

    invoke-virtual {v5, v7}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget v7, Lضٕؔ/؋;->؋:I

    invoke-static {p1, v6, v5, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    sput-object p1, Lحظتۢۋۜآظ/ؠ;->ا:Landroid/app/PendingIntent;

    :cond_1
    const-string p1, "app"

    sget-object v5, Lحظتۢۋۜآظ/ؠ;->ا:Landroid/app/PendingIntent;

    invoke-virtual {v2, p1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v3

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v3, "|ID|"

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v3, "kid"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "Rpc"

    const/4 v3, 0x3

    invoke-static {p1, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v5, "Sending "

    const-string v7, "Rpc"

    invoke-virtual {v5, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->أ:Landroid/os/Messenger;

    const-string v5, "google.messenger"

    invoke-virtual {v2, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ؤ:Landroid/os/Messenger;

    if-nez p1, :cond_3

    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->إ:Lحظتۢۋۜآظ/إ;

    if-eqz p1, :cond_5

    :cond_3
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object p1

    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    :try_start_3
    iget-object v5, p0, Lحظتۢۋۜآظ/ؠ;->ؤ:Landroid/os/Messenger;

    if-eqz v5, :cond_4

    invoke-virtual {v5, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    goto :goto_1

    :cond_4
    iget-object v5, p0, Lحظتۢۋۜآظ/ؠ;->إ:Lحظتۢۋۜآظ/إ;

    iget-object v5, v5, Lحظتۢۋۜآظ/إ;->آ:Landroid/os/Messenger;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    :catch_0
    const-string p1, "Rpc"

    invoke-static {p1, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "Rpc"

    const-string v3, "Messenger failed, fallback to startService"

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {p1}, Lحظتۢۋۜآظ/ر;->ؠ()I

    move-result p1

    if-ne p1, v4, :cond_6

    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-virtual {p1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_1

    :cond_6
    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_1
    iget-object p1, p0, Lحظتۢۋۜآظ/ؠ;->آ:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v2, Lحظتۢۋۜآظ/آ;

    invoke-direct {v2, v6, v0}, Lحظتۢۋۜآظ/آ;-><init>(ILjava/lang/Object;)V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1e

    invoke-virtual {p1, v2, v4, v5, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iget-object v2, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    sget-object v3, Lحظتۢۋۜآظ/ز;->آ:Lحظتۢۋۜآظ/ز;

    new-instance v4, Lةؽڗںۍټ٘/ء;

    invoke-direct {v4, p0, v1, p1}, Lةؽڗںۍټ٘/ء;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Lؾپۑ۟ڂڷ/ح;->؋(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    iget-object p1, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v3

    throw p1

    :catchall_1
    move-exception p1

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1

    :catchall_2
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public final ؠ(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 3

    const-string v0, "Missing callback for "

    iget-object v1, p0, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lحظتۢۋۜآظ/ؠ;->؋:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lؾپۑ۟ڂڷ/ا;

    if-nez v2, :cond_0

    const-string p2, "Rpc"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v1

    return-void

    :cond_0
    invoke-virtual {v2, p2}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
