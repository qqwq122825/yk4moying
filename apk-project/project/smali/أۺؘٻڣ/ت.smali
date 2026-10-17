.class public final Lأۺؘٻڣ/ت;
.super Lأۺؘٻڣ/ز;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:[B

.field public final ء:L؋ڽبژ٦ښيل/آ;


# direct methods
.method public constructor <init>(Ljava/lang/String;[BL؋ڽبژ٦ښيل/آ;)V
    .locals 0

    invoke-direct {p0}, Lأۺؘٻڣ/ز;-><init>()V

    iput-object p1, p0, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iput-object p2, p0, Lأۺؘٻڣ/ت;->ؠ:[B

    iput-object p3, p0, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lأۺؘٻڣ/ز;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    check-cast p1, Lأۺؘٻڣ/ز;

    move-object v1, p1

    check-cast v1, Lأۺؘٻڣ/ت;

    iget-object v1, v1, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    iget-object v3, p0, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    instance-of v1, p1, Lأۺؘٻڣ/ت;

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Lأۺؘٻڣ/ت;

    goto :goto_0

    :cond_1
    move-object v1, p1

    check-cast v1, Lأۺؘٻڣ/ت;

    :goto_0
    iget-object v1, v1, Lأۺؘٻڣ/ت;->ؠ:[B

    iget-object v3, p0, Lأۺؘٻڣ/ت;->ؠ:[B

    invoke-static {v3, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_2

    check-cast p1, Lأۺؘٻڣ/ت;

    iget-object v1, p0, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    iget-object p1, p1, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    return v0

    :cond_3
    return v2
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget-object v2, p0, Lأۺؘٻڣ/ت;->ؠ:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v1, p0, Lأۺؘٻڣ/ت;->ء:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
