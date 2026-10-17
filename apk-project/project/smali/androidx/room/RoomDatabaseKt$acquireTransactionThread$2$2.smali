.class final Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/room/RoomDatabaseKt;->acquireTransactionThread(Ljava/util/concurrent/Executor;Lںڍڒڸ/ى;Lڨڡئٸت/أ;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $continuation:Lںڍڒڸ/إ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06ba\u068d\u0692\u06b8/\u0625;"
        }
    .end annotation
.end field

.field final synthetic $controlJob:Lںڍڒڸ/ى;


# direct methods
.method public constructor <init>(Lںڍڒڸ/إ;Lںڍڒڸ/ى;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06ba\u068d\u0692\u06b8/\u0625;",
            "L\u06ba\u068d\u0692\u06b8/\u0649;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;->$continuation:Lںڍڒڸ/إ;

    iput-object p2, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;->$controlJob:Lںڍڒڸ/ى;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    new-instance v0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;

    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;->$continuation:Lںڍڒڸ/إ;

    iget-object v2, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;->$controlJob:Lںڍڒڸ/ى;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;-><init>(Lںڍڒڸ/إ;Lںڍڒڸ/ى;Lڨڡئٸت/أ;)V

    sget-object v1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    sget-object v4, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-static {}, Lںڍڒڸ/ٿ;->؋()Lںڍڒڸ/ف;

    move-result-object v5

    const/4 v6, 0x1

    invoke-static {v1, v5, v6}, Lڗًقڔ/ء;->ح(Lڨڡئٸت/ا;Lڨڡئٸت/ا;Z)Lڨڡئٸت/ا;

    move-result-object v1

    sget-object v7, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    if-eq v1, v7, :cond_0

    invoke-interface {v1, v4}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-interface {v1, v7}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v1

    :cond_0
    new-instance v4, Lںڍڒڸ/ء;

    invoke-direct {v4, v1, v2, v5}, Lںڍڒڸ/ء;-><init>(Lڨڡئٸت/ا;Ljava/lang/Thread;Lںڍڒڸ/ف;)V

    invoke-virtual {v4, v6, v4, v0}, Lںڍڒڸ/؋;->ي(ILںڍڒڸ/؋;Lڲٱۘۑدٿٰ/خ;)V

    const/4 v0, 0x0

    iget-object v1, v4, Lںڍڒڸ/ء;->ئ:Lںڍڒڸ/ف;

    if-eqz v1, :cond_1

    sget v2, Lںڍڒڸ/ف;->إ:I

    invoke-virtual {v1, v0}, Lںڍڒڸ/ف;->ف(Z)V

    :cond_1
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-nez v2, :cond_7

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lںڍڒڸ/ف;->ك()J

    move-result-wide v7

    goto :goto_1

    :cond_2
    const-wide v7, 0x7fffffffffffffffL

    :goto_1
    invoke-virtual {v4}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lںڍڒڸ/م;

    xor-int/2addr v2, v6

    if-nez v2, :cond_3

    invoke-static {v4, v7, v8}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(Ljava/lang/Object;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_3
    if-eqz v1, :cond_4

    sget v2, Lںڍڒڸ/ف;->إ:I

    invoke-virtual {v1, v0}, Lںڍڒڸ/ف;->ؾ(Z)V

    :cond_4
    invoke-virtual {v4}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lںڍڒڸ/ش;->ځ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/خ;

    if-eqz v1, :cond_5

    move-object v3, v0

    check-cast v3, Lںڍڒڸ/خ;

    :cond_5
    if-nez v3, :cond_6

    return-void

    :cond_6
    iget-object v0, v3, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    throw v0

    :cond_7
    :try_start_1
    new-instance v2, Ljava/lang/InterruptedException;

    invoke-direct {v2}, Ljava/lang/InterruptedException;-><init>()V

    invoke-virtual {v4, v2}, Lںڍڒڸ/ٵ;->ث(Ljava/lang/Object;)Z

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v2

    if-eqz v1, :cond_8

    sget v3, Lںڍڒڸ/ف;->إ:I

    invoke-virtual {v1, v0}, Lںڍڒڸ/ف;->ؾ(Z)V

    :cond_8
    throw v2
.end method
