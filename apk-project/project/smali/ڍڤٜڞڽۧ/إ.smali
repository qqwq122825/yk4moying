.class public final Lڍڤٜڞڽۧ/إ;
.super Landroidx/concurrent/futures/AbstractResolvableFuture;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/ScheduledFuture;


# static fields
.field public static final synthetic أ:I


# instance fields
.field public final آ:Ljava/util/concurrent/ScheduledFuture;


# direct methods
.method public constructor <init>(Lڍڤٜڞڽۧ/ؤ;)V
    .locals 2

    invoke-direct {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;-><init>()V

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    invoke-interface {p1, v0}, Lڍڤٜڞڽۧ/ؤ;->؋(Lئٱنۃؖۊڄئ/آ;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Lڍڤٜڞڽۧ/إ;->آ:Ljava/util/concurrent/ScheduledFuture;

    return-void
.end method


# virtual methods
.method public final afterDone()V
    .locals 2

    iget-object v0, p0, Lڍڤٜڞڽۧ/إ;->آ:Ljava/util/concurrent/ScheduledFuture;

    invoke-virtual {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->wasInterrupted()Z

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    return-void
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Ljava/util/concurrent/Delayed;

    iget-object v0, p0, Lڍڤٜڞڽۧ/إ;->آ:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final getDelay(Ljava/util/concurrent/TimeUnit;)J
    .locals 2

    iget-object v0, p0, Lڍڤٜڞڽۧ/إ;->آ:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Delayed;->getDelay(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method
