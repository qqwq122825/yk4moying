.class public final Lokhttp3/MultipartReader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/MultipartReader$Companion;,
        Lokhttp3/MultipartReader$Part;,
        Lokhttp3/MultipartReader$PartSource;
    }
.end annotation


# static fields
.field public static final Companion:Lokhttp3/MultipartReader$Companion;

.field private static final afterBoundaryOptions:Lۀۗ۱/س;


# instance fields
.field private final boundary:Ljava/lang/String;

.field private closed:Z

.field private final crlfDashDashBoundary:Lۀۗ۱/ث;

.field private currentPart:Lokhttp3/MultipartReader$PartSource;

.field private final dashDashBoundary:Lۀۗ۱/ث;

.field private noMoreParts:Z

.field private partCount:I

.field private final source:Lۀۗ۱/ت;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    new-instance v0, Lokhttp3/MultipartReader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lokhttp3/MultipartReader$Companion;-><init>(Lkotlin/jvm/internal/أ;)V

    sput-object v0, Lokhttp3/MultipartReader;->Companion:Lokhttp3/MultipartReader$Companion;

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    const-string v0, "\r\n"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    const-string v1, "--"

    invoke-static {v1}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v1

    const-string v2, " "

    invoke-static {v2}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v2

    const-string v3, "\t"

    invoke-static {v3}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v3

    filled-new-array {v0, v1, v2, v3}, [Lۀۗ۱/ث;

    move-result-object v0

    invoke-static {v0}, Lٽچڃ/أ;->ء([Lۀۗ۱/ث;)Lۀۗ۱/س;

    move-result-object v0

    sput-object v0, Lokhttp3/MultipartReader;->afterBoundaryOptions:Lۀۗ۱/س;

    return-void
.end method

.method public constructor <init>(Lokhttp3/ResponseBody;)V
    .locals 2

    const-string v0, "response"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->source()Lۀۗ۱/ت;

    move-result-object v0

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v1, "boundary"

    invoke-virtual {p1, v1}, Lokhttp3/MediaType;->parameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0, v0, p1}, Lokhttp3/MultipartReader;-><init>(Lۀۗ۱/ت;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance p1, Ljava/net/ProtocolException;

    const-string v0, "expected the Content-Type to have a boundary parameter"

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lۀۗ۱/ت;Ljava/lang/String;)V
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "boundary"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    iput-object p2, p0, Lokhttp3/MultipartReader;->boundary:Ljava/lang/String;

    new-instance p1, Lۀۗ۱/ب;

    invoke-direct {p1}, Lۀۗ۱/ب;-><init>()V

    const-string v0, "--"

    invoke-virtual {p1, v0}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    invoke-virtual {p1}, Lۀۗ۱/ب;->ؤ()Lۀۗ۱/ث;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/MultipartReader;->dashDashBoundary:Lۀۗ۱/ث;

    new-instance p1, Lۀۗ۱/ب;

    invoke-direct {p1}, Lۀۗ۱/ب;-><init>()V

    const-string v0, "\r\n--"

    invoke-virtual {p1, v0}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    invoke-virtual {p1}, Lۀۗ۱/ب;->ؤ()Lۀۗ۱/ث;

    move-result-object p1

    iput-object p1, p0, Lokhttp3/MultipartReader;->crlfDashDashBoundary:Lۀۗ۱/ث;

    return-void
.end method

.method public static final synthetic access$currentPartBytesRemaining(Lokhttp3/MultipartReader;J)J
    .locals 0

    invoke-direct {p0, p1, p2}, Lokhttp3/MultipartReader;->currentPartBytesRemaining(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$getAfterBoundaryOptions$cp()Lۀۗ۱/س;
    .locals 1

    sget-object v0, Lokhttp3/MultipartReader;->afterBoundaryOptions:Lۀۗ۱/س;

    return-object v0
.end method

.method public static final synthetic access$getCurrentPart$p(Lokhttp3/MultipartReader;)Lokhttp3/MultipartReader$PartSource;
    .locals 0

    iget-object p0, p0, Lokhttp3/MultipartReader;->currentPart:Lokhttp3/MultipartReader$PartSource;

    return-object p0
.end method

.method public static final synthetic access$getSource$p(Lokhttp3/MultipartReader;)Lۀۗ۱/ت;
    .locals 0

    iget-object p0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    return-object p0
.end method

.method public static final synthetic access$setCurrentPart$p(Lokhttp3/MultipartReader;Lokhttp3/MultipartReader$PartSource;)V
    .locals 0

    iput-object p1, p0, Lokhttp3/MultipartReader;->currentPart:Lokhttp3/MultipartReader$PartSource;

    return-void
.end method

.method private final currentPartBytesRemaining(J)J
    .locals 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    iget-object v2, v0, Lokhttp3/MultipartReader;->crlfDashDashBoundary:Lۀۗ۱/ث;

    invoke-virtual {v2}, Lۀۗ۱/ث;->ء()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v2, v3}, Lۀۗ۱/ت;->ظ(J)V

    iget-object v1, v0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    invoke-interface {v1}, Lۀۗ۱/ت;->ؠ()Lۀۗ۱/ب;

    move-result-object v1

    iget-object v2, v0, Lokhttp3/MultipartReader;->crlfDashDashBoundary:Lۀۗ۱/ث;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "bytes"

    invoke-static {v2, v3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2}, Lۀۗ۱/ث;->ء()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    if-eqz v3, :cond_b

    iget-object v3, v1, Lۀۗ۱/ب;->آ:Lۀۗ۱/ط;

    const-wide/16 v7, 0x1

    if-nez v3, :cond_1

    goto/16 :goto_8

    :cond_1
    iget-wide v9, v1, Lۀۗ۱/ب;->أ:J

    const-wide/16 v11, 0x0

    sub-long v13, v9, v11

    cmp-long v13, v13, v11

    if-gez v13, :cond_5

    :goto_1
    cmp-long v13, v9, v11

    if-lez v13, :cond_2

    iget-object v3, v3, Lۀۗ۱/ط;->إ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v13, v3, Lۀۗ۱/ط;->ء:I

    iget v14, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v13, v14

    int-to-long v13, v13

    sub-long/2addr v9, v13

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Lۀۗ۱/ث;->أ()[B

    move-result-object v13

    aget-byte v4, v13, v4

    invoke-virtual {v2}, Lۀۗ۱/ث;->ء()I

    move-result v2

    iget-wide v14, v1, Lۀۗ۱/ب;->أ:J

    int-to-long v5, v2

    sub-long/2addr v14, v5

    add-long/2addr v14, v7

    :goto_2
    cmp-long v1, v9, v14

    if-gez v1, :cond_9

    iget v1, v3, Lۀۗ۱/ط;->ء:I

    iget v5, v3, Lۀۗ۱/ط;->ؠ:I

    int-to-long v5, v5

    add-long/2addr v5, v14

    sub-long/2addr v5, v9

    int-to-long v7, v1

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v1, v5

    iget v5, v3, Lۀۗ۱/ط;->ؠ:I

    int-to-long v5, v5

    add-long/2addr v5, v11

    sub-long/2addr v5, v9

    long-to-int v5, v5

    :goto_3
    if-ge v5, v1, :cond_4

    iget-object v6, v3, Lۀۗ۱/ط;->؋:[B

    aget-byte v6, v6, v5

    if-ne v6, v4, :cond_3

    add-int/lit8 v6, v5, 0x1

    invoke-static {v3, v6, v13, v2}, Lہد٣ً؃ل/؋;->؋(Lۀۗ۱/ط;I[BI)Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_7

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_4
    iget v1, v3, Lۀۗ۱/ط;->ء:I

    iget v5, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v5

    int-to-long v5, v1

    add-long v11, v5, v9

    iget-object v3, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v9, v11

    const-wide/16 v7, 0x1

    goto :goto_2

    :cond_5
    move-wide v5, v11

    :goto_4
    iget v7, v3, Lۀۗ۱/ط;->ء:I

    iget v8, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    add-long/2addr v7, v5

    cmp-long v9, v7, v11

    if-gtz v9, :cond_6

    iget-object v3, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v5, v7

    goto :goto_4

    :cond_6
    invoke-virtual {v2}, Lۀۗ۱/ث;->أ()[B

    move-result-object v7

    aget-byte v4, v7, v4

    invoke-virtual {v2}, Lۀۗ۱/ث;->ء()I

    move-result v2

    iget-wide v8, v1, Lۀۗ۱/ب;->أ:J

    int-to-long v13, v2

    sub-long/2addr v8, v13

    const-wide/16 v13, 0x1

    add-long/2addr v8, v13

    :goto_5
    cmp-long v1, v5, v8

    if-gez v1, :cond_9

    iget v1, v3, Lۀۗ۱/ط;->ء:I

    iget v10, v3, Lۀۗ۱/ط;->ؠ:I

    int-to-long v13, v10

    add-long/2addr v13, v8

    sub-long/2addr v13, v5

    move-wide/from16 v16, v8

    int-to-long v8, v1

    invoke-static {v8, v9, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v1, v8

    iget v8, v3, Lۀۗ۱/ط;->ؠ:I

    int-to-long v8, v8

    add-long/2addr v8, v11

    sub-long/2addr v8, v5

    long-to-int v8, v8

    :goto_6
    if-ge v8, v1, :cond_8

    iget-object v9, v3, Lۀۗ۱/ط;->؋:[B

    aget-byte v9, v9, v8

    if-ne v9, v4, :cond_7

    add-int/lit8 v9, v8, 0x1

    invoke-static {v3, v9, v7, v2}, Lہد٣ً؃ل/؋;->؋(Lۀۗ۱/ط;I[BI)Z

    move-result v9

    if-eqz v9, :cond_7

    move-wide v9, v5

    move v5, v8

    :goto_7
    iget v1, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v5, v1

    int-to-long v1, v5

    add-long/2addr v1, v9

    goto :goto_9

    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    :cond_8
    iget v1, v3, Lۀۗ۱/ط;->ء:I

    iget v8, v3, Lۀۗ۱/ط;->ؠ:I

    sub-int/2addr v1, v8

    int-to-long v8, v1

    add-long v11, v8, v5

    iget-object v3, v3, Lۀۗ۱/ط;->ؤ:Lۀۗ۱/ط;

    invoke-static {v3}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    move-wide v5, v11

    move-wide/from16 v8, v16

    goto :goto_5

    :cond_9
    :goto_8
    const-wide/16 v1, -0x1

    :goto_9
    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-nez v3, :cond_a

    iget-object v1, v0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    invoke-interface {v1}, Lۀۗ۱/ت;->ؠ()Lۀۗ۱/ب;

    move-result-object v1

    iget-wide v1, v1, Lۀۗ۱/ب;->أ:J

    iget-object v3, v0, Lokhttp3/MultipartReader;->crlfDashDashBoundary:Lۀۗ۱/ث;

    invoke-virtual {v3}, Lۀۗ۱/ث;->ء()I

    move-result v3

    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    :cond_a
    move-wide/from16 v3, p1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    return-wide v1

    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bytes is empty"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final boundary()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lokhttp3/MultipartReader;->boundary:Ljava/lang/String;

    return-object v0
.end method

.method public close()V
    .locals 1

    iget-boolean v0, p0, Lokhttp3/MultipartReader;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/MultipartReader;->closed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lokhttp3/MultipartReader;->currentPart:Lokhttp3/MultipartReader$PartSource;

    iget-object v0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    invoke-interface {v0}, Ljava/nio/channels/Channel;->close()V

    return-void
.end method

.method public final nextPart()Lokhttp3/MultipartReader$Part;
    .locals 7

    iget-boolean v0, p0, Lokhttp3/MultipartReader;->closed:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lokhttp3/MultipartReader;->noMoreParts:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    return-object v2

    :cond_0
    iget v0, p0, Lokhttp3/MultipartReader;->partCount:I

    const-wide/16 v3, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    iget-object v5, p0, Lokhttp3/MultipartReader;->dashDashBoundary:Lۀۗ۱/ث;

    invoke-interface {v0, v3, v4, v5}, Lۀۗ۱/ت;->خ(JLۀۗ۱/ث;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    iget-object v3, p0, Lokhttp3/MultipartReader;->dashDashBoundary:Lۀۗ۱/ث;

    goto :goto_1

    :cond_1
    :goto_0
    const-wide/16 v5, 0x2000

    invoke-direct {p0, v5, v6}, Lokhttp3/MultipartReader;->currentPartBytesRemaining(J)J

    move-result-wide v5

    cmp-long v0, v5, v3

    if-eqz v0, :cond_2

    iget-object v0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    invoke-interface {v0, v5, v6}, Lۀۗ۱/ت;->skip(J)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    iget-object v3, p0, Lokhttp3/MultipartReader;->crlfDashDashBoundary:Lۀۗ۱/ث;

    :goto_1
    invoke-virtual {v3}, Lۀۗ۱/ث;->ء()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v0, v3, v4}, Lۀۗ۱/ت;->skip(J)V

    const/4 v0, 0x0

    :goto_2
    iget-object v3, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    sget-object v4, Lokhttp3/MultipartReader;->afterBoundaryOptions:Lۀۗ۱/س;

    invoke-interface {v3, v4}, Lۀۗ۱/ت;->ذ(Lۀۗ۱/س;)I

    move-result v3

    const/4 v4, -0x1

    const-string v5, "unexpected characters after boundary"

    if-eq v3, v4, :cond_8

    if-eqz v3, :cond_7

    if-eq v3, v1, :cond_4

    const/4 v4, 0x2

    if-eq v3, v4, :cond_3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    if-nez v0, :cond_6

    iget v0, p0, Lokhttp3/MultipartReader;->partCount:I

    if-eqz v0, :cond_5

    iput-boolean v1, p0, Lokhttp3/MultipartReader;->noMoreParts:Z

    return-object v2

    :cond_5
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "expected at least 1 part"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    iget v0, p0, Lokhttp3/MultipartReader;->partCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lokhttp3/MultipartReader;->partCount:I

    new-instance v0, Lokhttp3/internal/http1/HeadersReader;

    iget-object v1, p0, Lokhttp3/MultipartReader;->source:Lۀۗ۱/ت;

    invoke-direct {v0, v1}, Lokhttp3/internal/http1/HeadersReader;-><init>(Lۀۗ۱/ت;)V

    invoke-virtual {v0}, Lokhttp3/internal/http1/HeadersReader;->readHeaders()Lokhttp3/Headers;

    move-result-object v0

    new-instance v1, Lokhttp3/MultipartReader$PartSource;

    invoke-direct {v1, p0}, Lokhttp3/MultipartReader$PartSource;-><init>(Lokhttp3/MultipartReader;)V

    iput-object v1, p0, Lokhttp3/MultipartReader;->currentPart:Lokhttp3/MultipartReader$PartSource;

    new-instance v2, Lokhttp3/MultipartReader$Part;

    invoke-static {v1}, Lڃٷښـ۝ۼ/ؠ;->أ(Lۀۗ۱/ؼ;)Lۀۗ۱/ض;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lokhttp3/MultipartReader$Part;-><init>(Lokhttp3/Headers;Lۀۗ۱/ت;)V

    return-object v2

    :cond_8
    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
