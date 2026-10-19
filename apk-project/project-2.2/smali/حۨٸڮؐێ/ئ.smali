.class public final Lحۨٸڮؐێ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ؠ:Lحۨٸڮؐێ/ئ;


# instance fields
.field public ؋:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lحۨٸڮؐێ/ئ;->؋:Landroid/content/Context;

    return-void

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lحۨٸڮؐێ/ئ;->؋:Landroid/content/Context;

    return-void
.end method

.method public static final varargs ؋(Landroid/content/pm/PackageInfo;[Lحۨٸڮؐێ/ت;)Lحۨٸڮؐێ/ت;
    .locals 3

    iget-object v0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    array-length v0, v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    const-string p0, "GoogleSignatureVerifier"

    const-string p1, "Package has more than one signature."

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_1
    new-instance v0, Lحۨٸڮؐێ/ث;

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v2, 0x0

    aget-object p0, p0, v2

    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object p0

    invoke-direct {v0, p0}, Lحۨٸڮؐێ/ث;-><init>([B)V

    :goto_0
    array-length p0, p1

    if-ge v2, p0, :cond_3

    aget-object p0, p1, v2

    invoke-virtual {p0, v0}, Lحۨٸڮؐێ/ت;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    aget-object p0, p1, v2

    return-object p0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-object v1
.end method

.method public static final ؠ(Landroid/content/pm/PackageInfo;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_4

    const-string v2, "com.android.vending"

    iget-object v3, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v3, "com.google.android.gms"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    move v2, v0

    goto :goto_3

    :cond_1
    :goto_1
    iget-object v2, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    iget v2, v2, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v2, v2, 0x81

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_3
    :goto_2
    move v2, v1

    :goto_3
    move v3, v2

    move-object v2, p0

    goto :goto_4

    :cond_4
    const/4 v2, 0x0

    move v3, v0

    :goto_4
    if-eqz p0, :cond_6

    iget-object p0, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz p0, :cond_6

    sget-object p0, Lحۨٸڮؐێ/ح;->؋:[Lحۨٸڮؐێ/ت;

    if-eqz v3, :cond_5

    invoke-static {v2, p0}, Lحۨٸڮؐێ/ئ;->؋(Landroid/content/pm/PackageInfo;[Lحۨٸڮؐێ/ت;)Lحۨٸڮؐێ/ت;

    move-result-object p0

    goto :goto_5

    :cond_5
    aget-object p0, p0, v1

    filled-new-array {p0}, [Lحۨٸڮؐێ/ت;

    move-result-object p0

    invoke-static {v2, p0}, Lحۨٸڮؐێ/ئ;->؋(Landroid/content/pm/PackageInfo;[Lحۨٸڮؐێ/ت;)Lحۨٸڮؐێ/ت;

    move-result-object p0

    :goto_5
    if-eqz p0, :cond_6

    return v0

    :cond_6
    return v1
.end method
