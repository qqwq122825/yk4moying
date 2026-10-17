.class public final Lژة۪ڦضۆۿۡ/ؼ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ا:J

.field public static final synthetic ب:I


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Lژة۪ڦضۆۿۡ/ذ;

.field public final ء:Lأۺؘٻڣ/ئ;

.field public final آ:Lcom/google/firebase/messaging/FirebaseMessaging;

.field public final أ:Landroidx/collection/ArrayMap;

.field public final ؤ:Ljava/util/concurrent/ScheduledExecutorService;

.field public إ:Z

.field public final ئ:Lژة۪ڦضۆۿۡ/غ;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    sput-wide v0, Lژة۪ڦضۆۿۡ/ؼ;->ا:J

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/messaging/FirebaseMessaging;Lژة۪ڦضۆۿۡ/ذ;Lژة۪ڦضۆۿۡ/غ;Lأۺؘٻڣ/ئ;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ؼ;->أ:Landroidx/collection/ArrayMap;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lژة۪ڦضۆۿۡ/ؼ;->إ:Z

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ؼ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/ؼ;->ؠ:Lژة۪ڦضۆۿۡ/ذ;

    iput-object p3, p0, Lژة۪ڦضۆۿۡ/ؼ;->ئ:Lژة۪ڦضۆۿۡ/غ;

    iput-object p4, p0, Lژة۪ڦضۆۿۡ/ؼ;->ء:Lأۺؘٻڣ/ئ;

    iput-object p5, p0, Lژة۪ڦضۆۿۡ/ؼ;->؋:Landroid/content/Context;

    iput-object p6, p0, Lژة۪ڦضۆۿۡ/ؼ;->ؤ:Ljava/util/concurrent/ScheduledExecutorService;

    return-void
.end method

.method public static ؋(Lؾپۑ۟ڂڷ/ح;)V
    .locals 3

    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-static {p0, v1, v2, v0}, Lڃٷښـ۝ۼ/ؠ;->ء(Lؾپۑ۟ڂڷ/ح;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "SERVICE_NOT_AVAILABLE"

    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v1, v0, Ljava/io/IOException;

    if-nez v1, :cond_1

    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_1
    check-cast v0, Ljava/io/IOException;

    throw v0
.end method

.method public static آ()Z
    .locals 2

    const-string v0, "FirebaseMessaging"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method


# virtual methods
.method public final ؠ(Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ؼ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->؋()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->ء:Lأۺؘٻڣ/ئ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/topics/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "gcm.topic"

    invoke-virtual {v2, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1, v2}, Lأۺؘٻڣ/ئ;->ئ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    invoke-virtual {v1, p1}, Lأۺؘٻڣ/ئ;->ء(Lؾپۑ۟ڂڷ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    invoke-static {p1}, Lژة۪ڦضۆۿۡ/ؼ;->؋(Lؾپۑ۟ڂڷ/ح;)V

    return-void
.end method

.method public final ء(Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ؼ;->آ:Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->؋()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->ء:Lأۺؘٻڣ/ئ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/topics/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "gcm.topic"

    invoke-virtual {v2, v5, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "delete"

    const-string v5, "1"

    invoke-virtual {v2, v3, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1, v2}, Lأۺؘٻڣ/ئ;->ئ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    invoke-virtual {v1, p1}, Lأۺؘٻڣ/ئ;->ء(Lؾپۑ۟ڂڷ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    invoke-static {p1}, Lژة۪ڦضۆۿۡ/ؼ;->؋(Lؾپۑ۟ڂڷ/ح;)V

    return-void
.end method

.method public final أ()Z
    .locals 10

    :goto_0
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lژة۪ڦضۆۿۡ/ؼ;->ئ:Lژة۪ڦضۆۿۡ/غ;

    invoke-virtual {v0}, Lژة۪ڦضۆۿۡ/غ;->؋()Lژة۪ڦضۆۿۡ/ع;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-static {}, Lژة۪ڦضۆۿۡ/ؼ;->آ()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FirebaseMessaging"

    const-string v2, "topic sync succeeded"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-exit p0

    return v1

    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-string v2, "FirebaseMessaging"

    const-string v3, "Unsubscribe from topic: "

    const-string v4, "Subscribe to topic: "

    const-string v5, "Unknown topic operation"

    const/4 v6, 0x0

    :try_start_1
    iget-object v7, v0, Lژة۪ڦضۆۿۡ/ع;->ؠ:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/16 v9, 0x53

    if-eq v8, v9, :cond_3

    const/16 v9, 0x55

    if-eq v8, v9, :cond_2

    goto :goto_1

    :cond_2
    const-string v8, "U"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    move v7, v1

    goto :goto_2

    :cond_3
    const-string v8, "S"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v7, :cond_4

    move v7, v6

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v7, -0x1

    :goto_2
    const-string v8, " succeeded."

    iget-object v9, v0, Lژة۪ڦضۆۿۡ/ع;->؋:Ljava/lang/String;

    if-eqz v7, :cond_6

    if-eq v7, v1, :cond_5

    :try_start_2
    invoke-static {}, Lژة۪ڦضۆۿۡ/ؼ;->آ()Z

    move-result v3

    if-eqz v3, :cond_a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_5
    invoke-virtual {p0, v9}, Lژة۪ڦضۆۿۡ/ؼ;->ء(Ljava/lang/String;)V

    invoke-static {}, Lژة۪ڦضۆۿۡ/ؼ;->آ()Z

    move-result v4

    if-eqz v4, :cond_a

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    :cond_6
    invoke-virtual {p0, v9}, Lژة۪ڦضۆۿۡ/ؼ;->ؠ(Ljava/lang/String;)V

    invoke-static {}, Lژة۪ڦضۆۿۡ/ؼ;->آ()Z

    move-result v3

    if-eqz v3, :cond_a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_7

    :catch_0
    move-exception v1

    const-string v3, "SERVICE_NOT_AVAILABLE"

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "INTERNAL_SERVER_ERROR"

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_8

    const-string v1, "Topic operation failed without exception message. Will retry Topic operation."

    goto :goto_6

    :cond_8
    throw v1

    :cond_9
    :goto_5
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Topic operation failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ". Will retry Topic operation."

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_6
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v6

    :cond_a
    :goto_7
    if-nez v1, :cond_b

    return v6

    :cond_b
    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->ئ:Lژة۪ڦضۆۿۡ/غ;

    monitor-enter v1

    :try_start_3
    iget-object v2, v1, Lژة۪ڦضۆۿۡ/غ;->؋:Lذ٨ۍ/ر;

    iget-object v3, v0, Lژة۪ڦضۆۿۡ/ع;->ء:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lذ٨ۍ/ر;->ء(Ljava/lang/String;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit v1

    iget-object v2, p0, Lژة۪ڦضۆۿۡ/ؼ;->أ:Landroidx/collection/ArrayMap;

    monitor-enter v2

    :try_start_4
    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ع;->ء:Ljava/lang/String;

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->أ:Landroidx/collection/ArrayMap;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    goto :goto_8

    :cond_c
    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->أ:Landroidx/collection/ArrayMap;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lؾپۑ۟ڂڷ/ا;

    if-eqz v3, :cond_d

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    :cond_d
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->أ:Landroidx/collection/ArrayMap;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    :goto_8
    monitor-exit v2

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0

    :catchall_2
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0
.end method

.method public final ؤ(J)V
    .locals 10

    const-wide/16 v0, 0x2

    mul-long/2addr v0, p1

    const-wide/16 v2, 0x1e

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sget-wide v2, Lژة۪ڦضۆۿۡ/ؼ;->ا:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    new-instance v0, Lژة۪ڦضۆۿۡ/ؾ;

    iget-object v6, p0, Lژة۪ڦضۆۿۡ/ؼ;->؋:Landroid/content/Context;

    iget-object v7, p0, Lژة۪ڦضۆۿۡ/ؼ;->ؠ:Lژة۪ڦضۆۿۡ/ذ;

    move-object v4, v0

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lژة۪ڦضۆۿۡ/ؾ;-><init>(Lژة۪ڦضۆۿۡ/ؼ;Landroid/content/Context;Lژة۪ڦضۆۿۡ/ذ;J)V

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ؼ;->ؤ:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, p1, p2, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    monitor-enter p0

    const/4 p1, 0x1

    :try_start_0
    iput-boolean p1, p0, Lژة۪ڦضۆۿۡ/ؼ;->إ:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
