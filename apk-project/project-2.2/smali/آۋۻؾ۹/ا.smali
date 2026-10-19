.class public final Lآۋۻؾ۹/ا;
.super Lآۋۻؾ۹/؋;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/Integer;

.field public final ؠ:Ljava/lang/String;

.field public final ء:Ljava/lang/String;

.field public final آ:Ljava/lang/String;

.field public final أ:Ljava/lang/String;

.field public final ؤ:Ljava/lang/String;

.field public final إ:Ljava/lang/String;

.field public final ئ:Ljava/lang/String;

.field public final ا:Ljava/lang/String;

.field public final ب:Ljava/lang/String;

.field public final ة:Ljava/lang/String;

.field public final ت:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lآۋۻؾ۹/؋;-><init>()V

    iput-object p1, p0, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    iput-object p2, p0, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    iput-object p3, p0, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    iput-object p4, p0, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    iput-object p5, p0, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    iput-object p6, p0, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    iput-object p7, p0, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    iput-object p8, p0, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    iput-object p9, p0, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    iput-object p10, p0, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    iput-object p11, p0, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    iput-object p12, p0, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lآۋۻؾ۹/؋;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    check-cast p1, Lآۋۻؾ۹/؋;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    if-nez v1, :cond_1

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    if-nez v1, :cond_d

    goto :goto_0

    :cond_1
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    invoke-virtual {v1, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_0
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    if-nez v1, :cond_2

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_1

    :cond_2
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_1
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    if-nez v1, :cond_3

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_2

    :cond_3
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_2
    iget-object v1, p0, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    if-nez v1, :cond_4

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_3

    :cond_4
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_3
    iget-object v1, p0, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    if-nez v1, :cond_5

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_4

    :cond_5
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_4
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    if-nez v1, :cond_6

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_5

    :cond_6
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_5
    iget-object v1, p0, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    if-nez v1, :cond_7

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_6

    :cond_7
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_6
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    if-nez v1, :cond_8

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_7

    :cond_8
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_7
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    if-nez v1, :cond_9

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_8

    :cond_9
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_8
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    if-nez v1, :cond_a

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_9

    :cond_a
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_9
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    if-nez v1, :cond_b

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/ا;

    iget-object v1, v1, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    if-nez v1, :cond_d

    goto :goto_a

    :cond_b
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/ا;

    iget-object v3, v3, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    :goto_a
    iget-object v1, p0, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    check-cast p1, Lآۋۻؾ۹/ا;

    if-nez v1, :cond_c

    iget-object p1, p1, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    if-nez p1, :cond_d

    goto :goto_b

    :cond_c
    iget-object p1, p1, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_b

    :cond_d
    move v0, v2

    :goto_b
    return v0

    :cond_e
    return v2
.end method

.method public final hashCode()I
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :goto_0
    const v2, 0xf4243

    xor-int/2addr v1, v2

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    if-nez v3, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    if-nez v3, :cond_2

    move v3, v0

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    if-nez v3, :cond_3

    move v3, v0

    goto :goto_3

    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    if-nez v3, :cond_4

    move v3, v0

    goto :goto_4

    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    if-nez v3, :cond_5

    move v3, v0

    goto :goto_5

    :cond_5
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_5
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    if-nez v3, :cond_6

    move v3, v0

    goto :goto_6

    :cond_6
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_6
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    if-nez v3, :cond_7

    move v3, v0

    goto :goto_7

    :cond_7
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_7
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    if-nez v3, :cond_8

    move v3, v0

    goto :goto_8

    :cond_8
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_8
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    if-nez v3, :cond_9

    move v3, v0

    goto :goto_9

    :cond_9
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_9
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    if-nez v3, :cond_a

    move v3, v0

    goto :goto_a

    :cond_a
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_a
    xor-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v2, p0, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    if-nez v2, :cond_b

    goto :goto_b

    :cond_b
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_b
    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AndroidClientInfo{sdkVersion="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lآۋۻؾ۹/ا;->؋:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", model="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ؠ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hardware="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ء:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", device="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->آ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", product="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->أ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", osBuild="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ؤ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", manufacturer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->إ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", fingerprint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ئ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", locale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ا:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", country="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ب:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mccMnc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ة:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", applicationBuild="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/ا;->ت:Ljava/lang/String;

    const-string v2, "}"

    invoke-static {v0, v1, v2}, Landroidx/activity/result/؋;->ا(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
