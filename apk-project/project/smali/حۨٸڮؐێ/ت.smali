.class public abstract Lحۨٸڮؐێ/ت;
.super Lذ۠ۋؿ/ف;
.source "SourceFile"


# instance fields
.field public final ؠ:I


# direct methods
.method public constructor <init>([B)V
    .locals 2

    invoke-direct {p0}, Lذ۠ۋؿ/ف;-><init>()V

    array-length v0, p1

    const/16 v1, 0x19

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-static {p1}, Ljava/util/Arrays;->hashCode([B)I

    move-result p1

    iput p1, p0, Lحۨٸڮؐێ/ت;->ؠ:I

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public static ؠ(Ljava/lang/String;)[B
    .locals 1

    :try_start_0
    const-string v0, "ISO-8859-1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    instance-of v1, p1, Lذ۠ۋؿ/س;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    check-cast p1, Lذ۠ۋؿ/س;

    move-object v1, p1

    check-cast v1, Lحۨٸڮؐێ/ت;

    iget v1, v1, Lحۨٸڮؐێ/ت;->ؠ:I

    iget v2, p0, Lحۨٸڮؐێ/ت;->ؠ:I

    if-eq v1, v2, :cond_1

    return v0

    :cond_1
    check-cast p1, Lحۨٸڮؐێ/ت;

    invoke-virtual {p1}, Lحۨٸڮؐێ/ت;->ء()[B

    move-result-object p1

    new-instance v1, Lس۬ٲتٗه/؋;

    invoke-direct {v1, p1}, Lس۬ٲتٗه/؋;-><init>(Ljava/lang/Object;)V

    iget-object p1, v1, Lس۬ٲتٗه/؋;->ؠ:Ljava/lang/Object;

    check-cast p1, [B

    invoke-virtual {p0}, Lحۨٸڮؐێ/ت;->ء()[B

    move-result-object v1

    invoke-static {v1, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string v1, "GoogleCertificates"

    const-string v2, "Failed to get Google certificates from remote"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, Lحۨٸڮؐێ/ت;->ؠ:I

    return v0
.end method

.method public abstract ء()[B
.end method
