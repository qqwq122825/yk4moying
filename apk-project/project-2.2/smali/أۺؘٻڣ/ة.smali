.class public final Lأۺؘٻڣ/ة;
.super Lأۺؘٻڣ/ر;
.source "SourceFile"


# instance fields
.field public ؋:Ljava/lang/String;

.field public ؠ:[B

.field public ء:L؋ڽبژ٦ښيل/آ;


# virtual methods
.method public final ؋()Lأۺؘٻڣ/ت;
    .locals 4

    iget-object v0, p0, Lأۺؘٻڣ/ة;->؋:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, " backendName"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iget-object v1, p0, Lأۺؘٻڣ/ة;->ء:L؋ڽبژ٦ښيل/آ;

    if-nez v1, :cond_1

    const-string v1, " priority"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Lأۺؘٻڣ/ت;

    iget-object v1, p0, Lأۺؘٻڣ/ة;->؋:Ljava/lang/String;

    iget-object v2, p0, Lأۺؘٻڣ/ة;->ؠ:[B

    iget-object v3, p0, Lأۺؘٻڣ/ة;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-direct {v0, v1, v2, v3}, Lأۺؘٻڣ/ت;-><init>(Ljava/lang/String;[BL؋ڽبژ٦ښيل/آ;)V

    return-object v0

    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Missing required properties:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lأۺؘٻڣ/ة;->؋:Ljava/lang/String;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null backendName"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lأۺؘٻڣ/ة;->ء:L؋ڽبژ٦ښيل/آ;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null priority"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
