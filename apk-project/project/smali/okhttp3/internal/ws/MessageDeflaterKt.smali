.class public final Lokhttp3/internal/ws/MessageDeflaterKt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final EMPTY_DEFLATE_BLOCK:Lۀۗ۱/ث;

.field private static final LAST_OCTETS_COUNT_TO_REMOVE_AFTER_DEFLATION:I = 0x4


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    const-string v0, "000000ffff"

    invoke-static {v0}, Lړجإٖټض/أ;->أ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/ws/MessageDeflaterKt;->EMPTY_DEFLATE_BLOCK:Lۀۗ۱/ث;

    return-void
.end method

.method public static final synthetic access$getEMPTY_DEFLATE_BLOCK$p()Lۀۗ۱/ث;
    .locals 1

    sget-object v0, Lokhttp3/internal/ws/MessageDeflaterKt;->EMPTY_DEFLATE_BLOCK:Lۀۗ۱/ث;

    return-object v0
.end method
