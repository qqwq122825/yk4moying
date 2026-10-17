.class public final Lڃٷښـ۝ۼ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:J

.field public final ؠ:J

.field public final ء:J


# direct methods
.method public constructor <init>(JJJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lڃٷښـ۝ۼ/؋;->؋:J

    iput-wide p3, p0, Lڃٷښـ۝ۼ/؋;->ؠ:J

    iput-wide p5, p0, Lڃٷښـ۝ۼ/؋;->ء:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lڃٷښـ۝ۼ/؋;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    check-cast p1, Lڃٷښـ۝ۼ/؋;

    iget-wide v3, p1, Lڃٷښـ۝ۼ/؋;->؋:J

    iget-wide v5, p0, Lڃٷښـ۝ۼ/؋;->؋:J

    cmp-long v1, v5, v3

    if-nez v1, :cond_1

    iget-wide v3, p0, Lڃٷښـ۝ۼ/؋;->ؠ:J

    iget-wide v5, p1, Lڃٷښـ۝ۼ/؋;->ؠ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lڃٷښـ۝ۼ/؋;->ء:J

    iget-wide v5, p1, Lڃٷښـ۝ۼ/؋;->ء:J

    cmp-long p1, v3, v5

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 7

    iget-wide v0, p0, Lڃٷښـ۝ۼ/؋;->؋:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lڃٷښـ۝ۼ/؋;->ؠ:J

    ushr-long v5, v3, v2

    xor-long/2addr v3, v5

    long-to-int v3, v3

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lڃٷښـ۝ۼ/؋;->ء:J

    ushr-long v1, v3, v2

    xor-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StartupTime{epochMillis="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lڃٷښـ۝ۼ/؋;->؋:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", elapsedRealtime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lڃٷښـ۝ۼ/؋;->ؠ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", uptimeMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lڃٷښـ۝ۼ/؋;->ء:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
