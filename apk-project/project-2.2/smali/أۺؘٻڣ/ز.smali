.class public abstract Lأۺؘٻڣ/ز;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static ؋()Lأۺؘٻڣ/ة;
    .locals 2

    new-instance v0, Lأۺؘٻڣ/ة;

    invoke-direct {v0}, Lأۺؘٻڣ/ة;-><init>()V

    sget-object v1, L؋ڽبژ٦ښيل/آ;->آ:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v0, v1}, Lأۺؘٻڣ/ة;->ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 4

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Lأۺؘٻڣ/ت;

    const/4 v2, 0x0

    iget-object v3, v1, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    iget-object v3, v1, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    iget-object v1, v1, Lأۺؘٻڣ/ت;->ؠ:[B

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    :goto_0
    aput-object v1, v0, v2

    const-string v1, "TransportContext(%s, %s, %s)"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
