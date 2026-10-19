.class public final Lڜٟٱڀ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ئ:Lڜٟٱڀ/ؤ;


# instance fields
.field public final ؋:Lڜٟٱڀ/ش;

.field public final ؠ:Landroid/os/Handler;

.field public ء:Ljava/lang/String;

.field public آ:Ljava/lang/String;

.field public أ:I

.field public ؤ:Z

.field public إ:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lڜٟٱڀ/ؤ;->أ:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lڜٟٱڀ/ؤ;->ؤ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ؤ;->إ:Z

    new-instance v0, Lڜٟٱڀ/ش;

    invoke-direct {v0}, Lڜٟٱڀ/ش;-><init>()V

    iput-object v0, p0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    iput-object p0, v0, Lڜٟٱڀ/ش;->ا:Lڜٟٱڀ/ؤ;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "BinaryWS"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lڜٟٱڀ/ؤ;->ؠ:Landroid/os/Handler;

    return-void
.end method

.method public static declared-synchronized ؋()Lڜٟٱڀ/ؤ;
    .locals 2

    const-class v0, Lڜٟٱڀ/ؤ;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lڜٟٱڀ/ؤ;->ئ:Lڜٟٱڀ/ؤ;

    if-nez v1, :cond_0

    new-instance v1, Lڜٟٱڀ/ؤ;

    invoke-direct {v1}, Lڜٟٱڀ/ؤ;-><init>()V

    sput-object v1, Lڜٟٱڀ/ؤ;->ئ:Lڜٟٱڀ/ؤ;

    :cond_0
    sget-object v1, Lڜٟٱڀ/ؤ;->ئ:Lڜٟٱڀ/ؤ;
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
.method public final ؠ()V
    .locals 5

    iget-boolean v0, p0, Lڜٟٱڀ/ؤ;->إ:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lڜٟٱڀ/ؤ;->ؤ:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lڜٟٱڀ/ؤ;->أ:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lڜٟٱڀ/ؤ;->أ:I

    const/4 v1, 0x5

    const-string v2, "ConnOrchestrator"

    if-le v0, v1, :cond_1

    const-string v0, "Max binary retries reached (5), disabling binary transport. Socket.IO remains active."

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڜٟٱڀ/ؤ;->ؤ:Z

    return-void

    :cond_1
    const-wide/16 v3, 0x1388

    int-to-long v0, v0

    mul-long/2addr v0, v3

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Scheduling binary reconnect in "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "ms (attempt "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lڜٟٱڀ/ؤ;->أ:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lڜٟٱڀ/ؤ;->ؠ:Landroid/os/Handler;

    new-instance v3, Landroidx/constraintlayout/helper/widget/؋;

    const/16 v4, 0x13

    invoke-direct {v3, v4, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_0
    return-void
.end method

.method public final ء([B)V
    .locals 2

    iget-object v0, p0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    iget-object v1, v0, Lڜٟٱڀ/ش;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, v0, Lڜٟٱڀ/ش;->؋:Lokhttp3/WebSocket;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    :try_start_0
    invoke-static {p1}, Lۀۗ۱/ث;->إ([B)Lۀۗ۱/ث;

    move-result-object p1

    invoke-interface {v0, p1}, Lokhttp3/WebSocket;->send(Lۀۗ۱/ث;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public final آ([B)Z
    .locals 3

    iget-object v0, p0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    iget-object v1, v0, Lڜٟٱڀ/ش;->ء:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, v0, Lڜٟٱڀ/ش;->؋:Lokhttp3/WebSocket;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :try_start_0
    invoke-static {v1, p1}, Lڜٟٱڀ/؋;->؋(B[B)[B

    move-result-object p1

    invoke-static {p1}, Lۀۗ۱/ث;->إ([B)Lۀۗ۱/ث;

    move-result-object p1

    invoke-interface {v0, p1}, Lokhttp3/WebSocket;->send(Lۀۗ۱/ث;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "WebTransportMgr"

    const-string v1, "sendScreen error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    return v2
.end method

.method public final أ(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    iput-object p1, p0, Lڜٟٱڀ/ؤ;->ء:Ljava/lang/String;

    iput-object p2, p0, Lڜٟٱڀ/ؤ;->آ:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lڜٟٱڀ/ؤ;->إ:Z

    iput-boolean v0, p0, Lڜٟٱڀ/ؤ;->ؤ:Z

    iget-object v0, p0, Lڜٟٱڀ/ؤ;->؋:Lڜٟٱڀ/ش;

    invoke-virtual {v0}, Lڜٟٱڀ/ش;->ء()Z

    move-result v1

    const-string v2, "ConnOrchestrator"

    if-eqz v1, :cond_0

    const-string p1, "Binary transport already connected, skipping"

    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lڜٟٱڀ/ؤ;->أ:I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Starting binary transport to "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":443"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0x1bb

    invoke-virtual {v0, p1, v1, p2}, Lڜٟٱڀ/ش;->؋(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method
