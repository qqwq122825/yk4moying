.class public final Lةٌخ/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؤ:Lةٌخ/؋;


# instance fields
.field public final ؋:J

.field public final ؠ:I

.field public final ء:I

.field public final آ:J

.field public final أ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 15

    const-wide/32 v0, 0xa00000

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x2710

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-wide/32 v3, 0x240c8400

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const v4, 0x14000

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    if-nez v0, :cond_0

    const-string v5, " maxStorageSizeInBytes"

    goto :goto_0

    :cond_0
    const-string v5, ""

    :goto_0
    if-nez v1, :cond_1

    const-string v6, " loadBatchSize"

    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_1
    if-nez v2, :cond_2

    const-string v6, " criticalSectionEnterTimeoutMs"

    invoke-static {v5, v6}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_2
    if-nez v3, :cond_3

    const-string v6, " eventCleanUpAge"

    invoke-static {v5, v6}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_3
    if-nez v4, :cond_4

    const-string v6, " maxBlobByteSizePerRow"

    invoke-static {v5, v6}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_4
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    new-instance v5, Lةٌخ/؋;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object v7, v5

    invoke-direct/range {v7 .. v14}, Lةٌخ/؋;-><init>(JIIJI)V

    sput-object v5, Lةٌخ/؋;->ؤ:Lةٌخ/؋;

    return-void

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Missing required properties:"

    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(JIIJI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lةٌخ/؋;->؋:J

    iput p3, p0, Lةٌخ/؋;->ؠ:I

    iput p4, p0, Lةٌخ/؋;->ء:I

    iput-wide p5, p0, Lةٌخ/؋;->آ:J

    iput p7, p0, Lةٌخ/؋;->أ:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lةٌخ/؋;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    check-cast p1, Lةٌخ/؋;

    iget-wide v3, p1, Lةٌخ/؋;->؋:J

    iget-wide v5, p0, Lةٌخ/؋;->؋:J

    cmp-long v1, v5, v3

    if-nez v1, :cond_1

    iget v1, p0, Lةٌخ/؋;->ؠ:I

    iget v3, p1, Lةٌخ/؋;->ؠ:I

    if-ne v1, v3, :cond_1

    iget v1, p0, Lةٌخ/؋;->ء:I

    iget v3, p1, Lةٌخ/؋;->ء:I

    if-ne v1, v3, :cond_1

    iget-wide v3, p0, Lةٌخ/؋;->آ:J

    iget-wide v5, p1, Lةٌخ/؋;->آ:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget v1, p0, Lةٌخ/؋;->أ:I

    iget p1, p1, Lةٌخ/؋;->أ:I

    if-ne v1, p1, :cond_1

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

    iget-wide v0, p0, Lةٌخ/؋;->؋:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget v3, p0, Lةٌخ/؋;->ؠ:I

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget v3, p0, Lةٌخ/؋;->ء:I

    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lةٌخ/؋;->آ:J

    ushr-long v5, v3, v2

    xor-long v2, v5, v3

    long-to-int v2, v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v1, p0, Lةٌخ/؋;->أ:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "EventStoreConfig{maxStorageSizeInBytes="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lةٌخ/؋;->؋:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", loadBatchSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lةٌخ/؋;->ؠ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", criticalSectionEnterTimeoutMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lةٌخ/؋;->ء:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", eventCleanUpAge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lةٌخ/؋;->آ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", maxBlobByteSizePerRow="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lةٌخ/؋;->أ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
