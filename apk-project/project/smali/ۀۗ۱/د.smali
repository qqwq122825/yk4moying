.class public final Lۀۗ۱/د;
.super Lۀۗ۱/ؿ;
.source "SourceFile"


# instance fields
.field public ؋:Lۀۗ۱/ؿ;


# direct methods
.method public constructor <init>(Lۀۗ۱/ؿ;)V
    .locals 1

    const-string v0, "delegate"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lۀۗ۱/ؿ;-><init>()V

    iput-object p1, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    return-void
.end method


# virtual methods
.method public final clearDeadline()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->clearDeadline()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public final clearTimeout()Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->clearTimeout()Lۀۗ۱/ؿ;

    move-result-object v0

    return-object v0
.end method

.method public final deadlineNanoTime()J
    .locals 2

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->deadlineNanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public final deadlineNanoTime(J)Lۀۗ۱/ؿ;
    .locals 1

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0, p1, p2}, Lۀۗ۱/ؿ;->deadlineNanoTime(J)Lۀۗ۱/ؿ;

    move-result-object p1

    return-object p1
.end method

.method public final hasDeadline()Z
    .locals 1

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->hasDeadline()Z

    move-result v0

    return v0
.end method

.method public final throwIfReached()V
    .locals 1

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->throwIfReached()V

    return-void
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;
    .locals 1

    const-string v0, "unit"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0, p1, p2, p3}, Lۀۗ۱/ؿ;->timeout(JLjava/util/concurrent/TimeUnit;)Lۀۗ۱/ؿ;

    move-result-object p1

    return-object p1
.end method

.method public final timeoutNanos()J
    .locals 2

    iget-object v0, p0, Lۀۗ۱/د;->؋:Lۀۗ۱/ؿ;

    invoke-virtual {v0}, Lۀۗ۱/ؿ;->timeoutNanos()J

    move-result-wide v0

    return-wide v0
.end method
