.class public final Lڊ۟چڗۙ٦/س;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/Class;

.field public final ؠ:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڊ۟چڗۙ٦/س;->؋:Ljava/lang/Class;

    iput-object p2, p0, Lڊ۟چڗۙ٦/س;->ؠ:Ljava/lang/Class;

    return-void
.end method

.method public static ؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;
    .locals 2

    new-instance v0, Lڊ۟چڗۙ٦/س;

    const-class v1, Lڊ۟چڗۙ٦/ز;

    invoke-direct {v0, v1, p0}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    const-class v1, Lڊ۟چڗۙ٦/س;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_1
    check-cast p1, Lڊ۟چڗۙ٦/س;

    iget-object v1, p0, Lڊ۟چڗۙ٦/س;->ؠ:Ljava/lang/Class;

    iget-object v2, p1, Lڊ۟چڗۙ٦/س;->ؠ:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    :cond_2
    iget-object v0, p0, Lڊ۟چڗۙ٦/س;->؋:Ljava/lang/Class;

    iget-object p1, p1, Lڊ۟چڗۙ٦/س;->؋:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lڊ۟چڗۙ٦/س;->ؠ:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lڊ۟چڗۙ٦/س;->؋:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    const-class v0, Lڊ۟چڗۙ٦/ز;

    iget-object v1, p0, Lڊ۟چڗۙ٦/س;->ؠ:Ljava/lang/Class;

    iget-object v2, p0, Lڊ۟چڗۙ٦/س;->؋:Ljava/lang/Class;

    if-ne v2, v0, :cond_0

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "@"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
