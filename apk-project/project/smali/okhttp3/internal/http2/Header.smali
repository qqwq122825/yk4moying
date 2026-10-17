.class public final Lokhttp3/internal/http2/Header;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/http2/Header$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lokhttp3/internal/http2/Header$Companion;

.field public static final PSEUDO_PREFIX:Lۀۗ۱/ث;

.field public static final RESPONSE_STATUS:Lۀۗ۱/ث;

.field public static final RESPONSE_STATUS_UTF8:Ljava/lang/String; = ":status"

.field public static final TARGET_AUTHORITY:Lۀۗ۱/ث;

.field public static final TARGET_AUTHORITY_UTF8:Ljava/lang/String; = ":authority"

.field public static final TARGET_METHOD:Lۀۗ۱/ث;

.field public static final TARGET_METHOD_UTF8:Ljava/lang/String; = ":method"

.field public static final TARGET_PATH:Lۀۗ۱/ث;

.field public static final TARGET_PATH_UTF8:Ljava/lang/String; = ":path"

.field public static final TARGET_SCHEME:Lۀۗ۱/ث;

.field public static final TARGET_SCHEME_UTF8:Ljava/lang/String; = ":scheme"


# instance fields
.field public final hpackSize:I

.field public final name:Lۀۗ۱/ث;

.field public final value:Lۀۗ۱/ث;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lokhttp3/internal/http2/Header$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lokhttp3/internal/http2/Header$Companion;-><init>(Lkotlin/jvm/internal/أ;)V

    sput-object v0, Lokhttp3/internal/http2/Header;->Companion:Lokhttp3/internal/http2/Header$Companion;

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    const-string v0, ":"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->PSEUDO_PREFIX:Lۀۗ۱/ث;

    const-string v0, ":status"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->RESPONSE_STATUS:Lۀۗ۱/ث;

    const-string v0, ":method"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_METHOD:Lۀۗ۱/ث;

    const-string v0, ":path"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_PATH:Lۀۗ۱/ث;

    const-string v0, ":scheme"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_SCHEME:Lۀۗ۱/ث;

    const-string v0, ":authority"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lۀۗ۱/ث;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    invoke-static {p1}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object p1

    invoke-static {p2}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lۀۗ۱/ث;Lۀۗ۱/ث;)V

    return-void
.end method

.method public constructor <init>(Lۀۗ۱/ث;Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    invoke-static {p2}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lۀۗ۱/ث;Lۀۗ۱/ث;)V

    return-void
.end method

.method public constructor <init>(Lۀۗ۱/ث;Lۀۗ۱/ث;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    iput-object p2, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    invoke-virtual {p1}, Lۀۗ۱/ث;->ء()I

    move-result p1

    add-int/lit8 p1, p1, 0x20

    invoke-virtual {p2}, Lۀۗ۱/ث;->ء()I

    move-result p2

    add-int/2addr p2, p1

    iput p2, p0, Lokhttp3/internal/http2/Header;->hpackSize:I

    return-void
.end method

.method public static synthetic copy$default(Lokhttp3/internal/http2/Header;Lۀۗ۱/ث;Lۀۗ۱/ث;ILjava/lang/Object;)Lokhttp3/internal/http2/Header;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lokhttp3/internal/http2/Header;->copy(Lۀۗ۱/ث;Lۀۗ۱/ث;)Lokhttp3/internal/http2/Header;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lۀۗ۱/ث;
    .locals 1

    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    return-object v0
.end method

.method public final component2()Lۀۗ۱/ث;
    .locals 1

    iget-object v0, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    return-object v0
.end method

.method public final copy(Lۀۗ۱/ث;Lۀۗ۱/ث;)Lokhttp3/internal/http2/Header;
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "value"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lokhttp3/internal/http2/Header;

    invoke-direct {v0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lۀۗ۱/ث;Lۀۗ۱/ث;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lokhttp3/internal/http2/Header;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lokhttp3/internal/http2/Header;

    iget-object v1, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    iget-object v3, p1, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    invoke-static {v1, v3}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    iget-object p1, p1, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    invoke-static {v1, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    invoke-virtual {v0}, Lۀۗ۱/ث;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    invoke-virtual {v1}, Lۀۗ۱/ث;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lokhttp3/internal/http2/Header;->name:Lۀۗ۱/ث;

    invoke-virtual {v1}, Lۀۗ۱/ث;->ت()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lokhttp3/internal/http2/Header;->value:Lۀۗ۱/ث;

    invoke-virtual {v1}, Lۀۗ۱/ث;->ت()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
