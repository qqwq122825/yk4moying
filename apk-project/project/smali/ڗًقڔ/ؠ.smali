.class public final Lڗًقڔ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:Ljava/lang/String;

.field public final ء:Ljava/lang/String;

.field public final آ:Lڗًقڔ/آ;

.field public final أ:Lڗًقڔ/ؤ;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lڗًقڔ/آ;Lڗًقڔ/ؤ;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    iput-object p2, p0, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    iput-object p3, p0, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    iput-object p4, p0, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    iput-object p5, p0, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lڗًقڔ/ؠ;

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    check-cast p1, Lڗًقڔ/ؠ;

    iget-object v1, p0, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p1, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    if-nez v1, :cond_6

    goto :goto_0

    :cond_1
    iget-object v3, p1, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_0
    iget-object v1, p0, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    if-nez v1, :cond_2

    iget-object v1, p1, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    if-nez v1, :cond_6

    goto :goto_1

    :cond_2
    iget-object v3, p1, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_1
    iget-object v1, p0, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    if-nez v1, :cond_3

    iget-object v1, p1, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    if-nez v1, :cond_6

    goto :goto_2

    :cond_3
    iget-object v3, p1, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_2
    iget-object v1, p0, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    if-nez v1, :cond_4

    iget-object v1, p1, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    if-nez v1, :cond_6

    goto :goto_3

    :cond_4
    iget-object v3, p1, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    invoke-virtual {v1, v3}, Lڗًقڔ/آ;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_3
    iget-object v1, p0, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    if-nez v1, :cond_5

    iget-object p1, p1, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    if-nez p1, :cond_6

    goto :goto_4

    :cond_5
    iget-object p1, p1, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

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
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    const v2, 0xf4243

    xor-int/2addr v1, v2

    mul-int/2addr v1, v2

    iget-object v3, p0, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    if-nez v3, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    if-nez v3, :cond_2

    move v3, v0

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    if-nez v3, :cond_3

    move v3, v0

    goto :goto_3

    :cond_3
    invoke-virtual {v3}, Lڗًقڔ/آ;->hashCode()I

    move-result v3

    :goto_3
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v2, p0, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    if-nez v2, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_4
    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "InstallationResponse{uri="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lڗًقڔ/ؠ;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", fid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lڗًقڔ/ؠ;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", refreshToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lڗًقڔ/ؠ;->ء:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", authToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lڗًقڔ/ؠ;->آ:Lڗًقڔ/آ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", responseCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lڗًقڔ/ؠ;->أ:Lڗًقڔ/ؤ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
