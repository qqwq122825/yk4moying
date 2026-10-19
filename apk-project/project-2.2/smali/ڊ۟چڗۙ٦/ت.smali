.class public final Lڊ۟چڗۙ٦/ت;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lڊ۟چڗۙ٦/س;

.field public final ؠ:I

.field public final ء:I


# direct methods
.method public constructor <init>(IILjava/lang/Class;)V
    .locals 0

    invoke-static {p3}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object p3

    invoke-direct {p0, p3, p1, p2}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    return-void
.end method

.method public constructor <init>(Lڊ۟چڗۙ٦/س;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    iput p2, p0, Lڊ۟چڗۙ٦/ت;->ؠ:I

    iput p3, p0, Lڊ۟چڗۙ٦/ت;->ء:I

    return-void
.end method

.method public static ؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;
    .locals 3

    new-instance v0, Lڊ۟چڗۙ٦/ت;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lڊ۟چڗۙ٦/ت;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lڊ۟چڗۙ٦/ت;

    iget-object v0, p1, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    iget-object v2, p0, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v2, v0}, Lڊ۟چڗۙ٦/س;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lڊ۟چڗۙ٦/ت;->ؠ:I

    iget v2, p1, Lڊ۟چڗۙ٦/ت;->ؠ:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lڊ۟چڗۙ٦/ت;->ء:I

    iget p1, p1, Lڊ۟چڗۙ٦/ت;->ء:I

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v0}, Lڊ۟چڗۙ٦/س;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget v2, p0, Lڊ۟چڗۙ٦/ت;->ؠ:I

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v1, p0, Lڊ۟چڗۙ٦/ت;->ء:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Dependency{anInterface="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lڊ۟چڗۙ٦/ت;->ؠ:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const-string v1, "required"

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    const-string v1, "optional"

    goto :goto_0

    :cond_1
    const-string v1, "set"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", injection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lڊ۟چڗۙ٦/ت;->ء:I

    if-eqz v1, :cond_4

    if-eq v1, v2, :cond_3

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    const-string v1, "deferred"

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v2, "Unsupported injection: "

    invoke-static {v2, v1}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_3
    const-string v1, "provider"

    goto :goto_1

    :cond_4
    const-string v1, "direct"

    :goto_1
    const-string v2, "}"

    invoke-static {v0, v1, v2}, Landroidx/activity/result/؋;->ا(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
