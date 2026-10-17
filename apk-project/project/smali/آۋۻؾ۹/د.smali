.class public final Lآۋۻؾ۹/د;
.super Lآۋۻؾ۹/ط;
.source "SourceFile"


# instance fields
.field public final ؋:Lآۋۻؾ۹/ض;

.field public final ؠ:Lآۋۻؾ۹/ص;


# direct methods
.method public constructor <init>(Lآۋۻؾ۹/ض;Lآۋۻؾ۹/ص;)V
    .locals 0

    invoke-direct {p0}, Lآۋۻؾ۹/ط;-><init>()V

    iput-object p1, p0, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    iput-object p2, p0, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lآۋۻؾ۹/ط;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    check-cast p1, Lآۋۻؾ۹/ط;

    iget-object v1, p0, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    if-nez v1, :cond_1

    move-object v1, p1

    check-cast v1, Lآۋۻؾ۹/د;

    iget-object v1, v1, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    if-nez v1, :cond_3

    goto :goto_0

    :cond_1
    move-object v3, p1

    check-cast v3, Lآۋۻؾ۹/د;

    iget-object v3, v3, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_0
    iget-object v1, p0, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    check-cast p1, Lآۋۻؾ۹/د;

    if-nez v1, :cond_2

    iget-object p1, p1, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    if-nez p1, :cond_3

    goto :goto_1

    :cond_2
    iget-object p1, p1, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    return v0

    :cond_4
    return v2
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    const v2, 0xf4243

    xor-int/2addr v1, v2

    mul-int/2addr v1, v2

    iget-object v2, p0, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_1
    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NetworkConnectionInfo{networkType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mobileSubtype="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
