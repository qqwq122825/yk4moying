.class public final Lآۋۻؾ۹/ح;
.super Lآۋۻؾ۹/ش;
.source "SourceFile"


# instance fields
.field public final ؋:J

.field public final ؠ:J

.field public final ء:Lآۋۻؾ۹/ز;

.field public final آ:Ljava/lang/Integer;

.field public final أ:Ljava/lang/String;

.field public final ؤ:Ljava/util/List;

.field public final إ:Lآۋۻؾ۹/ظ;


# direct methods
.method public constructor <init>(JJLآۋۻؾ۹/ز;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Lآۋۻؾ۹/ظ;)V
    .locals 0

    invoke-direct {p0}, Lآۋۻؾ۹/ش;-><init>()V

    iput-wide p1, p0, Lآۋۻؾ۹/ح;->؋:J

    iput-wide p3, p0, Lآۋۻؾ۹/ح;->ؠ:J

    iput-object p5, p0, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    iput-object p6, p0, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    iput-object p7, p0, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    iput-object p8, p0, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    iput-object p9, p0, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lآۋۻؾ۹/ش;

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    check-cast p1, Lآۋۻؾ۹/ش;

    check-cast p1, Lآۋۻؾ۹/ح;

    iget-wide v3, p1, Lآۋۻؾ۹/ح;->؋:J

    iget-wide v5, p0, Lآۋۻؾ۹/ح;->؋:J

    cmp-long v1, v5, v3

    if-nez v1, :cond_6

    iget-wide v3, p1, Lآۋۻؾ۹/ح;->ؠ:J

    iget-wide v5, p0, Lآۋۻؾ۹/ح;->ؠ:J

    cmp-long v1, v5, v3

    if-nez v1, :cond_6

    iget-object v1, p1, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    iget-object v3, p0, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    if-nez v3, :cond_1

    if-nez v1, :cond_6

    goto :goto_0

    :cond_1
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_0
    iget-object v1, p1, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    iget-object v3, p0, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    if-nez v3, :cond_2

    if-nez v1, :cond_6

    goto :goto_1

    :cond_2
    invoke-virtual {v3, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_1
    iget-object v1, p1, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    iget-object v3, p0, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    if-nez v3, :cond_3

    if-nez v1, :cond_6

    goto :goto_2

    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_2
    iget-object v1, p1, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    iget-object v3, p0, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    if-nez v3, :cond_4

    if-nez v1, :cond_6

    goto :goto_3

    :cond_4
    invoke-interface {v3, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_3
    iget-object p1, p1, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    if-nez v1, :cond_5

    if-nez p1, :cond_6

    goto :goto_4

    :cond_5
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_4

    :cond_6
    move v0, v2

    :goto_4
    return v0

    :cond_7
    return v2
.end method

.method public final hashCode()I
    .locals 7

    iget-wide v0, p0, Lآۋۻؾ۹/ح;->؋:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lآۋۻؾ۹/ح;->ؠ:J

    ushr-long v5, v3, v2

    xor-long v2, v5, v3

    long-to-int v2, v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    if-nez v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_0
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    if-nez v3, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    if-nez v3, :cond_2

    move v3, v2

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    if-nez v3, :cond_3

    move v3, v2

    goto :goto_3

    :cond_3
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    :goto_3
    xor-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v1, p0, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_4
    xor-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LogRequest{requestTimeMs="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lآۋۻؾ۹/ح;->؋:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", requestUptimeMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lآۋۻؾ۹/ح;->ؠ:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", clientInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", logSource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", logSourceName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", logEvents="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", qosTier="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
