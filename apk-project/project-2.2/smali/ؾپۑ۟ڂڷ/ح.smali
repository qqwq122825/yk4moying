.class public final Lؾپۑ۟ڂڷ/ح;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/Object;

.field public final ؠ:Lڜأِجطّثٮ/؋;

.field public ء:Z

.field public volatile آ:Z

.field public أ:Ljava/lang/Object;

.field public ؤ:Ljava/lang/Exception;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    new-instance v0, Lڜأِجطّثٮ/؋;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lڜأِجطّثٮ/؋;-><init>(I)V

    iput-object v0, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V
    .locals 1

    new-instance v0, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v0, p1, p2}, Lؾپۑ۟ڂڷ/ت;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v0}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-void
.end method

.method public final ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V
    .locals 1

    new-instance v0, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v0, p1, p2}, Lؾپۑ۟ڂڷ/ت;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v0}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-void
.end method

.method public final ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;
    .locals 3

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    new-instance v1, Lؾپۑ۟ڂڷ/ة;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v0, v2}, Lؾپۑ۟ڂڷ/ة;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;Lؾپۑ۟ڂڷ/ح;I)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v1}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-object v0
.end method

.method public final آ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;
    .locals 3

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    new-instance v1, Lؾپۑ۟ڂڷ/ة;

    const/4 v2, 0x1

    invoke-direct {v1, p1, p2, v0, v2}, Lؾپۑ۟ڂڷ/ة;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;Lؾپۑ۟ڂڷ/ح;I)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v1}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-object v0
.end method

.method public final أ()Ljava/lang/Exception;
    .locals 2

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final ؤ()Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    const-string v2, "Task is not yet complete"

    invoke-static {v2, v1}, Lسۄھؤۏ۫/؋;->ة(Ljava/lang/String;Z)V

    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    if-nez v1, :cond_0

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->أ:Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    :cond_0
    new-instance v2, Lؾپۑ۟ڂڷ/إ;

    invoke-direct {v2, v1}, Lؾپۑ۟ڂڷ/إ;-><init>(Ljava/lang/Exception;)V

    throw v2

    :cond_1
    new-instance v1, Ljava/util/concurrent/CancellationException;

    const-string v2, "Task is already canceled."

    invoke-direct {v1, v2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw v1

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method public final إ()Z
    .locals 3

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    if-nez v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final ئ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ئ;)Lؾپۑ۟ڂڷ/ح;
    .locals 2

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    new-instance v1, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v1, p1, p2, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ئ;Lؾپۑ۟ڂڷ/ح;)V

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v1}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    return-object v0
.end method

.method public final ا(Ljava/lang/Exception;)V
    .locals 2

    const-string v0, "Exception must not be null"

    if-eqz p1, :cond_0

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ت()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    iput-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, p0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ب(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ت()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    iput-object p1, p0, Lؾپۑ۟ڂڷ/ح;->أ:Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, p0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final ة()V
    .locals 2

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    iput-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v0, p0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public final ت()V
    .locals 4

    iget-boolean v0, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    if-eqz v0, :cond_4

    sget v0, Lؾپۑ۟ڂڷ/ؠ;->آ:I

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->إ()Z

    move-result v1

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-eqz v1, :cond_0

    const-string v1, "cancellation"

    goto :goto_0

    :cond_0
    const-string v1, "unknown issue"

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "result "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    const-string v1, "failure"

    :goto_0
    new-instance v2, Lؾپۑ۟ڂڷ/ؠ;

    const-string v3, "Complete with: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lؾپۑ۟ڂڷ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v0, "DuplicateTaskCompletionException can only be created from completed Task."

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw v2

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_4
    return-void
.end method

.method public final ث()V
    .locals 2

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v0, p0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
