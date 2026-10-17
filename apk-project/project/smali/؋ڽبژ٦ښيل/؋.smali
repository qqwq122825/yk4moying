.class public final L؋ڽبژ٦ښيل/؋;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/Object;

.field public final ؠ:L؋ڽبژ٦ښيل/ؠ;


# direct methods
.method public constructor <init>(Lژػز/أ;L؋ڽبژ٦ښيل/ؠ;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    iput-object p2, p0, L؋ڽبژ٦ښيل/؋;->ؠ:L؋ڽبژ٦ښيل/ؠ;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, L؋ڽبژ٦ښيل/؋;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    check-cast p1, L؋ڽبژ٦ښيل/؋;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p1, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    iget-object v3, p0, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, L؋ڽبژ٦ښيل/آ;->آ:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p1, p1, L؋ڽبژ٦ښيل/؋;->ؠ:L؋ڽبژ٦ښيل/ؠ;

    iget-object v1, p0, L؋ڽبژ٦ښيل/؋;->ؠ:L؋ڽبژ٦ښيل/ؠ;

    if-nez v1, :cond_1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {v1, p1}, L؋ڽبژ٦ښيل/ؠ;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0

    :cond_3
    return v2
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, -0x2aff6277

    xor-int/2addr v0, v1

    const v1, 0xf4243

    mul-int/2addr v0, v1

    sget-object v2, L؋ڽبژ٦ښيل/آ;->آ:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v1, p0, L؋ڽبژ٦ښيل/؋;->ؠ:L؋ڽبژ٦ښيل/ؠ;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, L؋ڽبژ٦ښيل/ؠ;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Event{code=null, payload="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", priority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, L؋ڽبژ٦ښيل/آ;->آ:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", productData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, L؋ڽبژ٦ښيل/؋;->ؠ:L؋ڽبژ٦ښيل/ؠ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
