.class public final Lڊ۟چڗۙ٦/ة;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lڊ۟چڗۙ٦/س;

.field public final ؠ:Z


# direct methods
.method public constructor <init>(Lڊ۟چڗۙ٦/س;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڊ۟چڗۙ٦/ة;->؋:Lڊ۟چڗۙ٦/س;

    iput-boolean p2, p0, Lڊ۟چڗۙ٦/ة;->ؠ:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lڊ۟چڗۙ٦/ة;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lڊ۟چڗۙ٦/ة;

    iget-object v0, p1, Lڊ۟چڗۙ٦/ة;->؋:Lڊ۟چڗۙ٦/س;

    iget-object v2, p0, Lڊ۟چڗۙ٦/ة;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v0, v2}, Lڊ۟چڗۙ٦/س;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p1, p1, Lڊ۟چڗۙ٦/ة;->ؠ:Z

    iget-boolean v0, p0, Lڊ۟چڗۙ٦/ة;->ؠ:Z

    if-ne p1, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lڊ۟چڗۙ٦/ة;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v0}, Lڊ۟چڗۙ٦/س;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-boolean v1, p0, Lڊ۟چڗۙ٦/ة;->ؠ:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
