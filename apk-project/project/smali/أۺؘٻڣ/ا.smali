.class public final Lأۺؘٻڣ/ا;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:Ljava/lang/Integer;

.field public final ء:Lأۺؘٻڣ/ح;

.field public final آ:J

.field public final أ:J

.field public final ؤ:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Lأۺؘٻڣ/ح;JJLjava/util/Map;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    iput-object p2, p0, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    iput-object p3, p0, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    iput-wide p4, p0, Lأۺؘٻڣ/ا;->آ:J

    iput-wide p6, p0, Lأۺؘٻڣ/ا;->أ:J

    iput-object p8, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lأۺؘٻڣ/ا;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    check-cast p1, Lأۺؘٻڣ/ا;

    iget-object v1, p1, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    iget-object v3, p0, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    iget-object v3, p0, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    if-nez v3, :cond_1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {v3, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_0
    iget-object v1, p0, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    iget-object v3, p1, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    invoke-virtual {v1, v3}, Lأۺؘٻڣ/ح;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lأۺؘٻڣ/ا;->آ:J

    iget-wide v5, p1, Lأۺؘٻڣ/ا;->آ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-wide v3, p0, Lأۺؘٻڣ/ا;->أ:J

    iget-wide v5, p1, Lأۺؘٻڣ/ا;->أ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    iget-object p1, p1, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    return v0

    :cond_3
    return v2
.end method

.method public final hashCode()I
    .locals 7

    iget-object v0, p0, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-object v2, p0, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    invoke-virtual {v2}, Lأۺؘٻڣ/ح;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lأۺؘٻڣ/ا;->آ:J

    const/16 v4, 0x20

    ushr-long v5, v2, v4

    xor-long/2addr v2, v5

    long-to-int v2, v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lأۺؘٻڣ/ا;->أ:J

    ushr-long v4, v2, v4

    xor-long/2addr v2, v4

    long-to-int v2, v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "EventInternal{transportName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", encodedPayload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", eventMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lأۺؘٻڣ/ا;->آ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", uptimeMillis="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lأۺؘٻڣ/ا;->أ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", autoMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method public final ؠ(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    return p1
.end method

.method public final ء()Lأۺؘٻڣ/ئ;
    .locals 3

    new-instance v0, Lأۺؘٻڣ/ئ;

    invoke-direct {v0}, Lأۺؘٻڣ/ئ;-><init>()V

    iget-object v1, p0, Lأۺؘٻڣ/ا;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lأۺؘٻڣ/ئ;->إ(Ljava/lang/String;)V

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ؠ:Ljava/lang/Integer;

    iput-object v1, v0, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    iget-object v1, p0, Lأۺؘٻڣ/ا;->ء:Lأۺؘٻڣ/ح;

    invoke-virtual {v0, v1}, Lأۺؘٻڣ/ئ;->ؤ(Lأۺؘٻڣ/ح;)V

    iget-wide v1, p0, Lأۺؘٻڣ/ا;->آ:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    iget-wide v1, p0, Lأۺؘٻڣ/ا;->أ:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    new-instance v1, Ljava/util/HashMap;

    iget-object v2, p0, Lأۺؘٻڣ/ا;->ؤ:Ljava/util/Map;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v1, v0, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    return-object v0
.end method
