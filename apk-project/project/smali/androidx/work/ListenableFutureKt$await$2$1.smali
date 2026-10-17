.class public final Landroidx/work/ListenableFutureKt$await$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/ListenableFutureKt;->await(Lڃاـڂڅږ/؋;Lڨڡئٸت/أ;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $cancellableContinuation:Lںڍڒڸ/إ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06ba\u068d\u0692\u06b8/\u0625;"
        }
    .end annotation
.end field

.field final synthetic $this_await:Lڃاـڂڅږ/؋;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u0683\u0627\u0640\u0682\u0685\u0696/\u060b;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lںڍڒڸ/إ;Lڃاـڂڅږ/؋;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06ba\u068d\u0692\u06b8/\u0625;",
            "L\u0683\u0627\u0640\u0682\u0685\u0696/\u060b;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$cancellableContinuation:Lںڍڒڸ/إ;

    iput-object p2, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$this_await:Lڃاـڂڅږ/؋;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$cancellableContinuation:Lںڍڒڸ/إ;

    iget-object v1, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$this_await:Lڃاـڂڅږ/؋;

    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v0, Lںڍڒڸ/ئ;

    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_0

    move-object v1, v0

    :cond_0
    instance-of v0, v0, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$cancellableContinuation:Lںڍڒڸ/إ;

    check-cast v0, Lںڍڒڸ/ئ;

    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->ة(Ljava/lang/Throwable;)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroidx/work/ListenableFutureKt$await$2$1;->$cancellableContinuation:Lںڍڒڸ/إ;

    invoke-static {v1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v1

    check-cast v0, Lںڍڒڸ/ئ;

    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
