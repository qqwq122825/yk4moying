.class public final Lؾپۑ۟ڂڷ/ا;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lؾپۑ۟ڂڷ/ح;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    iput-object v0, p0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ح;->ب(Ljava/lang/Object;)V

    return-void
.end method

.method public final ؠ(Ljava/lang/Exception;)Z
    .locals 3

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "Exception must not be null"

    if-eqz p1, :cond_1

    iget-object v2, v0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-boolean v1, v0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    if-eqz v1, :cond_0

    monitor-exit v2

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, v0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    iput-object p1, v0, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, v0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    move p1, v1

    :goto_0
    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء(Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    iget-object v1, v0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, v0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    if-eqz v2, :cond_0

    monitor-exit v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, v0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    iput-object p1, v0, Lؾپۑ۟ڂڷ/ح;->أ:Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, v0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {p1, v0}, Lڜأِجطّثٮ/؋;->ؤ(Lؾپۑ۟ڂڷ/ح;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
