.class public Lcom/google/firebase/messaging/FirebaseMessaging;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ب:J

.field public static ة:Lئٱنۃؖۊڄئ/آ;

.field public static ت:Lڕۇۅؑۨؼ۫ە/؋;

.field public static ث:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# instance fields
.field public final ؋:Lڃٷښـ۝ۼ/إ;

.field public final ؠ:Landroid/content/Context;

.field public final ء:Lأۺؘٻڣ/ئ;

.field public final آ:Lژة۪ڦضۆۿۡ/ش;

.field public final أ:Lژة۪ڦضۆۿۡ/خ;

.field public final ؤ:Ljava/util/concurrent/Executor;

.field public final إ:Ljava/util/concurrent/Executor;

.field public final ئ:Lژة۪ڦضۆۿۡ/ذ;

.field public ا:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ب:J

    new-instance v0, Lڊ۟چڗۙ٦/ئ;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lڊ۟چڗۙ٦/ئ;-><init>(I)V

    sput-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ت:Lڕۇۅؑۨؼ۫ە/؋;

    return-void
.end method

.method public constructor <init>(Lڃٷښـ۝ۼ/إ;Lڕۇۅؑۨؼ۫ە/؋;Lڕۇۅؑۨؼ۫ە/؋;Lږٍڔڴٝ/آ;Lڕۇۅؑۨؼ۫ە/؋;Lڒڬؾۓؾ/ؠ;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    new-instance v8, Lژة۪ڦضۆۿۡ/ذ;

    invoke-virtual/range {p1 .. p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v9, v7, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-direct {v8, v9}, Lژة۪ڦضۆۿۡ/ذ;-><init>(Landroid/content/Context;)V

    new-instance v10, Lأۺؘٻڣ/ئ;

    move-object v1, v10

    move-object/from16 v2, p1

    move-object v3, v8

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lأۺؘٻڣ/ئ;-><init>(Lڃٷښـ۝ۼ/إ;Lژة۪ڦضۆۿۡ/ذ;Lڕۇۅؑۨؼ۫ە/؋;Lڕۇۅؑۨؼ۫ە/؋;Lږٍڔڴٝ/آ;)V

    new-instance v1, Lسڒذ/؋;

    const-string v2, "Firebase-Messaging-Task"

    invoke-direct {v1, v2}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v3, Lسڒذ/؋;

    const-string v4, "Firebase-Messaging-Init"

    invoke-direct {v3, v4}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    new-instance v3, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const-wide/16 v14, 0x1e

    sget-object v16, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v17, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct/range {v17 .. v17}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v5, Lسڒذ/؋;

    const-string v6, "Firebase-Messaging-File-Io"

    invoke-direct {v5, v6}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    move-object v11, v3

    move-object/from16 v18, v5

    invoke-direct/range {v11 .. v18}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v5, 0x0

    iput-boolean v5, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z

    sput-object p5, Lcom/google/firebase/messaging/FirebaseMessaging;->ت:Lڕۇۅؑۨؼ۫ە/؋;

    iput-object v7, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    new-instance v6, Lژة۪ڦضۆۿۡ/خ;

    move-object/from16 v11, p6

    invoke-direct {v6, v0, v11}, Lژة۪ڦضۆۿۡ/خ;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;Lڒڬؾۓؾ/ؠ;)V

    iput-object v6, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->أ:Lژة۪ڦضۆۿۡ/خ;

    invoke-virtual/range {p1 .. p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v6, v7, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    iput-object v6, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    new-instance v11, Lژة۪ڦضۆۿۡ/ة;

    invoke-direct {v11}, Lژة۪ڦضۆۿۡ/ة;-><init>()V

    iput-object v8, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ئ:Lژة۪ڦضۆۿۡ/ذ;

    iput-object v10, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ء:Lأۺؘٻڣ/ئ;

    new-instance v12, Lژة۪ڦضۆۿۡ/ش;

    invoke-direct {v12, v1}, Lژة۪ڦضۆۿۡ/ش;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v12, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->آ:Lژة۪ڦضۆۿۡ/ش;

    iput-object v2, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؤ:Ljava/util/concurrent/Executor;

    iput-object v3, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->إ:Ljava/util/concurrent/Executor;

    invoke-virtual/range {p1 .. p1}, Lڃٷښـ۝ۼ/إ;->؋()V

    instance-of v1, v9, Landroid/app/Application;

    if-eqz v1, :cond_0

    check-cast v9, Landroid/app/Application;

    invoke-virtual {v9, v11}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Context "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " was not an application, can\'t register for lifecycle callbacks. Some notification events may be dropped as a result."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "FirebaseMessaging"

    invoke-static {v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    new-instance v1, Lژة۪ڦضۆۿۡ/ث;

    invoke-direct {v1, v0, v5}, Lژة۪ڦضۆۿۡ/ث;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    new-instance v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v3, Lسڒذ/؋;

    const-string v5, "Firebase-Messaging-Topics-Io"

    invoke-direct {v3, v5}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sget v3, Lژة۪ڦضۆۿۡ/ؼ;->ب:I

    new-instance v3, Lژة۪ڦضۆۿۡ/ػ;

    move-object/from16 p1, v3

    move-object/from16 p2, v6

    move-object/from16 p3, v10

    move-object/from16 p4, p0

    move-object/from16 p5, v8

    move-object/from16 p6, v1

    invoke-direct/range {p1 .. p6}, Lژة۪ڦضۆۿۡ/ػ;-><init>(Landroid/content/Context;Lأۺؘٻڣ/ئ;Lcom/google/firebase/messaging/FirebaseMessaging;Lژة۪ڦضۆۿۡ/ذ;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)V

    invoke-static {v1, v3}, Lڃٷښـ۝ۼ/ؠ;->ؤ(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v1

    new-instance v3, Lژة۪ڦضۆۿۡ/ت;

    invoke-direct {v3, v0, v4}, Lژة۪ڦضۆۿۡ/ت;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V

    invoke-virtual {v1, v2, v3}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    new-instance v1, Lژة۪ڦضۆۿۡ/ث;

    invoke-direct {v1, v0, v4}, Lژة۪ڦضۆۿۡ/ث;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static declared-synchronized getInstance(Lڃٷښـ۝ۼ/إ;)Lcom/google/firebase/messaging/FirebaseMessaging;
    .locals 2
    .param p0    # Lڃٷښـ۝ۼ/إ;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-class v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v0

    :try_start_0
    const-class v1, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {p0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object p0, p0, Lڃٷښـ۝ۼ/إ;->آ:Lڊ۟چڗۙ٦/ا;

    invoke-interface {p0, v1}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/messaging/FirebaseMessaging;

    const-string v1, "Firebase Messaging component is not present"

    invoke-static {p0, v1}, Lسۄھؤۏ۫/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static ؠ(Lژة۪ڦضۆۿۡ/ظ;J)V
    .locals 4

    const-class v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ث:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v2, Lسڒذ/؋;

    const-string v3, "TAG"

    invoke-direct {v2, v3}, Lسڒذ/؋;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sput-object v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ث:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    :cond_0
    sget-object v1, Lcom/google/firebase/messaging/FirebaseMessaging;->ث:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p0, p1, p2, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public final ؋()Ljava/lang/String;
    .locals 8

    invoke-virtual {p0}, Lcom/google/firebase/messaging/FirebaseMessaging;->ء()Lژة۪ڦضۆۿۡ/ض;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->إ(Lژة۪ڦضۆۿۡ/ض;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, v0, Lژة۪ڦضۆۿۡ/ض;->؋:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-static {v1}, Lژة۪ڦضۆۿۡ/ذ;->؋(Lڃٷښـ۝ۼ/إ;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->آ:Lژة۪ڦضۆۿۡ/ش;

    const-string v3, "Joining ongoing request for: "

    const-string v4, "Making new request for: "

    monitor-enter v2

    :try_start_0
    iget-object v5, v2, Lژة۪ڦضۆۿۡ/ش;->ؠ:Landroidx/collection/ArrayMap;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lؾپۑ۟ڂڷ/ح;

    const/4 v6, 0x3

    if-eqz v5, :cond_1

    const-string v0, "FirebaseMessaging"

    invoke-static {v0, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "FirebaseMessaging"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v3, "FirebaseMessaging"

    invoke-static {v3, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "FirebaseMessaging"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v3, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ء:Lأۺؘٻڣ/ئ;

    iget-object v4, v3, Lأۺؘٻڣ/ئ;->؋:Ljava/lang/Object;

    check-cast v4, Lڃٷښـ۝ۼ/إ;

    invoke-static {v4}, Lژة۪ڦضۆۿۡ/ذ;->؋(Lڃٷښـ۝ۼ/إ;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v7, "*"

    invoke-virtual {v3, v4, v7, v5}, Lأۺؘٻڣ/ئ;->ئ(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v4

    invoke-virtual {v3, v4}, Lأۺؘٻڣ/ئ;->ء(Lؾپۑ۟ڂڷ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v3

    new-instance v4, Lژة۪ڦضۆۿۡ/ج;

    invoke-direct {v4, p0, v1, v0}, Lژة۪ڦضۆۿۡ/ج;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;Ljava/lang/String;Lژة۪ڦضۆۿۡ/ض;)V

    iget-object v0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->إ:Ljava/util/concurrent/Executor;

    invoke-virtual {v3, v0, v4}, Lؾپۑ۟ڂڷ/ح;->ئ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ئ;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    iget-object v3, v2, Lژة۪ڦضۆۿۡ/ش;->؋:Ljava/util/concurrent/Executor;

    new-instance v4, Lةؽڗںۍټ٘/ب;

    invoke-direct {v4, v6, v2, v1}, Lةؽڗںۍټ٘/ب;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v3, v4}, Lؾپۑ۟ڂڷ/ح;->آ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v5

    iget-object v0, v2, Lژة۪ڦضۆۿۡ/ش;->ؠ:Landroidx/collection/ArrayMap;

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_0
    monitor-exit v2

    :try_start_1
    invoke-static {v5}, Lڃٷښـ۝ۼ/ؠ;->ؠ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public final ء()Lژة۪ڦضۆۿۡ/ض;
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    const-class v1, Lcom/google/firebase/messaging/FirebaseMessaging;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    if-nez v2, :cond_0

    new-instance v2, Lئٱنۃؖۊڄئ/آ;

    invoke-direct {v2, v0}, Lئٱنۃؖۊڄئ/آ;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;

    :cond_0
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ة:Lئٱنۃؖۊڄئ/آ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit v1

    iget-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->؋()V

    const-string v2, "[DEFAULT]"

    iget-object v3, v1, Lڃٷښـ۝ۼ/إ;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v1, ""

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lڃٷښـ۝ۼ/إ;->ء()Ljava/lang/String;

    move-result-object v1

    :goto_0
    iget-object v2, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-static {v2}, Lژة۪ڦضۆۿۡ/ذ;->؋(Lڃٷښـ۝ۼ/إ;)Ljava/lang/String;

    move-result-object v2

    monitor-enter v0

    :try_start_1
    iget-object v3, v0, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|T|"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|*"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v3, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lژة۪ڦضۆۿۡ/ض;->ؠ(Ljava/lang/String;)Lژة۪ڦضۆۿۡ/ض;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final آ()V
    .locals 6

    iget-object v0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ء:Lأۺؘٻڣ/ئ;

    iget-object v0, v0, Lأۺؘٻڣ/ئ;->ء:Ljava/lang/Object;

    check-cast v0, Lحظتۢۋۜآظ/ؠ;

    iget-object v1, v0, Lحظتۢۋۜآظ/ؠ;->ء:Lحظتۢۋۜآظ/ر;

    invoke-virtual {v1}, Lحظتۢۋۜآظ/ر;->؋()I

    move-result v1

    const v2, 0xe5ee4e0

    if-lt v1, v2, :cond_0

    iget-object v0, v0, Lحظتۢۋۜآظ/ؠ;->ؠ:Landroid/content/Context;

    invoke-static {v0}, Lحظتۢۋۜآظ/ذ;->؋(Landroid/content/Context;)Lحظتۢۋۜآظ/ذ;

    move-result-object v0

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    new-instance v2, Lحظتۢۋۜآظ/ح;

    monitor-enter v0

    :try_start_0
    iget v3, v0, Lحظتۢۋۜآظ/ذ;->آ:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lحظتۢۋۜآظ/ذ;->آ:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    const/4 v4, 0x5

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v1, v5}, Lحظتۢۋۜآظ/ح;-><init>(IILandroid/os/Bundle;I)V

    invoke-virtual {v0, v2}, Lحظتۢۋۜآظ/ذ;->ؠ(Lحظتۢۋۜآظ/ح;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    sget-object v1, Lحظتۢۋۜآظ/ز;->آ:Lحظتۢۋۜآظ/ز;

    sget-object v2, Lحظتۢۋۜآظ/ء;->آ:Lحظتۢۋۜآظ/ء;

    invoke-virtual {v0, v1, v2}, Lؾپۑ۟ڂڷ/ح;->ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "SERVICE_NOT_AVAILABLE"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance v1, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v1}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {v1, v0}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    move-object v0, v1

    :goto_0
    new-instance v1, Lژة۪ڦضۆۿۡ/ت;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lژة۪ڦضۆۿۡ/ت;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;I)V

    iget-object v2, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؤ:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v2, v1}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    return-void
.end method

.method public final أ()Z
    .locals 7

    iget-object v0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ:Landroid/content/Context;

    invoke-static {v0}, Lںڍڒڸ/ش;->ـ(Landroid/content/Context;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lt v1, v2, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    const/4 v2, 0x3

    const-string v5, "FirebaseMessaging"

    if-nez v1, :cond_1

    invoke-static {v5, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Platform doesn\'t support proxying."

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_1
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->uid:I

    if-ne v1, v6, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    move v1, v4

    :goto_1
    if-nez v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "error retrieving notification delegate for package "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_3
    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-static {v0}, Lزءؽ۴ڰؠ/؋;->أ(Landroid/app/NotificationManager;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {v5, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "GMS core is set for proxying"

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    move v0, v3

    goto :goto_3

    :cond_5
    :goto_2
    move v0, v4

    :goto_3
    if-nez v0, :cond_6

    return v4

    :cond_6
    iget-object v0, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v0}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v0, v0, Lڃٷښـ۝ۼ/إ;->آ:Lڊ۟چڗۙ٦/ا;

    const-class v1, Lڅ۸ۃڼ۴ػ/؋;

    invoke-interface {v0, v1}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    return v3

    :cond_7
    invoke-static {}, Lڗًقڔ/ء;->إ()Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->ت:Lڕۇۅؑۨؼ۫ە/؋;

    if-eqz v0, :cond_8

    goto :goto_4

    :cond_8
    move v3, v4

    :goto_4
    return v3
.end method

.method public final declared-synchronized ؤ(J)V
    .locals 4

    monitor-enter p0

    const-wide/16 v0, 0x2

    mul-long/2addr v0, p1

    const-wide/16 v2, 0x1e

    :try_start_0
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sget-wide v2, Lcom/google/firebase/messaging/FirebaseMessaging;->ب:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    new-instance v2, Lژة۪ڦضۆۿۡ/ظ;

    invoke-direct {v2, p0, v0, v1}, Lژة۪ڦضۆۿۡ/ظ;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;J)V

    invoke-static {v2, p1, p2}, Lcom/google/firebase/messaging/FirebaseMessaging;->ؠ(Lژة۪ڦضۆۿۡ/ظ;J)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ا:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final إ(Lژة۪ڦضۆۿۡ/ض;)Z
    .locals 9

    const/4 v0, 0x1

    if-eqz p1, :cond_4

    iget-object v1, p0, Lcom/google/firebase/messaging/FirebaseMessaging;->ئ:Lژة۪ڦضۆۿۡ/ذ;

    monitor-enter v1

    :try_start_0
    iget-object v2, v1, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lژة۪ڦضۆۿۡ/ذ;->آ()V

    :cond_0
    iget-object v2, v1, Lژة۪ڦضۆۿۡ/ذ;->ؠ:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p1, Lژة۪ڦضۆۿۡ/ض;->ء:J

    sget-wide v7, Lژة۪ڦضۆۿۡ/ض;->آ:J

    add-long/2addr v5, v7

    cmp-long v1, v3, v5

    const/4 v3, 0x0

    if-gtz v1, :cond_2

    iget-object p1, p1, Lژة۪ڦضۆۿۡ/ض;->ؠ:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    move p1, v3

    goto :goto_1

    :cond_2
    :goto_0
    move p1, v0

    :goto_1
    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    move v0, v3

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v1

    throw p1

    :cond_4
    :goto_2
    return v0
.end method
