.class public final Lokhttp3/internal/http/HttpHeaders;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final QUOTED_STRING_DELIMITERS:Lۀۗ۱/ث;

.field private static final TOKEN_DELIMITERS:Lۀۗ۱/ث;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    sget-object v0, Lۀۗ۱/ث;->إ:Lۀۗ۱/ث;

    const-string v0, "\"\\"

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lۀۗ۱/ث;

    const-string v0, "\t ,="

    invoke-static {v0}, Lړجإٖټض/أ;->ؤ(Ljava/lang/String;)Lۀۗ۱/ث;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lۀۗ۱/ث;

    return-void
.end method

.method public static final hasBody(Lokhttp3/Response;)Z
    .locals 1

    const-string v0, "response"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->promisesBody(Lokhttp3/Response;)Z

    move-result p0

    return p0
.end method

.method public static final parseChallenges(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Headers;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lokhttp3/Challenge;",
            ">;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "headerName"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lokhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {p0, v2}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lڹےف/ئ;->ڛ(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Lۀۗ۱/ب;

    invoke-direct {v3}, Lۀۗ۱/ب;-><init>()V

    invoke-virtual {p0, v2}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lۀۗ۱/ب;->ٵ(Ljava/lang/String;)V

    :try_start_0
    invoke-static {v3, v0}, Lokhttp3/internal/http/HttpHeaders;->readChallengeHeader(Lۀۗ۱/ب;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    sget-object v4, Lokhttp3/internal/platform/Platform;->Companion:Lokhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v4}, Lokhttp3/internal/platform/Platform$Companion;->get()Lokhttp3/internal/platform/Platform;

    move-result-object v4

    const-string v5, "Unable to parse challenge"

    const/4 v6, 0x5

    invoke-virtual {v4, v5, v6, v3}, Lokhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static final promisesBody(Lokhttp3/Response;)Z
    .locals 8

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HEAD"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v0

    const/16 v2, 0x64

    const/4 v3, 0x1

    if-lt v0, v2, :cond_1

    const/16 v2, 0xc8

    if-lt v0, v2, :cond_2

    :cond_1
    const/16 v2, 0xcc

    if-eq v0, v2, :cond_2

    const/16 v2, 0x130

    if-eq v0, v2, :cond_2

    return v3

    :cond_2
    invoke-static {p0}, Lokhttp3/internal/Util;->headersContentLength(Lokhttp3/Response;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-nez v0, :cond_4

    const/4 v0, 0x2

    const/4 v2, 0x0

    const-string v4, "Transfer-Encoding"

    invoke-static {p0, v4, v2, v0, v2}, Lokhttp3/Response;->header$default(Lokhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "chunked"

    invoke-static {v0, p0}, Lڹےف/ئ;->ڛ(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v3
.end method

.method private static final readChallengeHeader(Lۀۗ۱/ب;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06c0\u06d7\u06f1/\u0628;",
            "Ljava/util/List<",
            "Lokhttp3/Challenge;",
            ">;)V"
        }
    .end annotation

    :goto_0
    const/4 v0, 0x0

    move-object v1, v0

    :goto_1
    if-nez v1, :cond_0

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lۀۗ۱/ب;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    move-result v2

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lۀۗ۱/ب;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lۀۗ۱/ب;->ج()Z

    move-result p0

    if-nez p0, :cond_1

    return-void

    :cond_1
    new-instance p0, Lokhttp3/Challenge;

    sget-object v0, Lڡپٔۯ/ز;->آ:Lڡپٔۯ/ز;

    invoke-direct {p0, v1, v0}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2
    const/16 v4, 0x3d

    invoke-static {p0, v4}, Lokhttp3/internal/Util;->skipAll(Lۀۗ۱/ب;B)I

    move-result v5

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    move-result v6

    const/4 v7, 0x1

    if-nez v2, :cond_9

    if-nez v6, :cond_3

    invoke-virtual {p0}, Lۀۗ۱/ب;->ج()Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_3
    new-instance v2, Lokhttp3/Challenge;

    invoke-static {v3}, Landroidx/activity/result/؋;->ب(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    if-ltz v5, :cond_4

    move v6, v7

    goto :goto_2

    :cond_4
    move v6, v4

    :goto_2
    if-eqz v6, :cond_8

    if-eqz v5, :cond_7

    const-string v6, "="

    if-eq v5, v7, :cond_6

    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    new-array v7, v5, [C

    :goto_3
    if-ge v4, v5, :cond_5

    aput-char v6, v7, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_5
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v7}, Ljava/lang/String;-><init>([C)V

    goto :goto_4

    :cond_6
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    :cond_7
    const-string v4, ""

    :goto_4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    const-string v3, "singletonMap<String, Str\u2026ek + \"=\".repeat(eqCount))"

    invoke-static {v0, v3}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, v1, v0}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Count \'n\' must be non-negative, but was "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p1, 0x2e

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {p0, v4}, Lokhttp3/internal/Util;->skipAll(Lۀۗ۱/ب;B)I

    move-result v6

    add-int/2addr v6, v5

    :goto_5
    if-nez v3, :cond_a

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lۀۗ۱/ب;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    move-result v5

    if-nez v5, :cond_11

    invoke-static {p0, v4}, Lokhttp3/internal/Util;->skipAll(Lۀۗ۱/ب;B)I

    move-result v5

    move v6, v5

    :cond_a
    if-eqz v6, :cond_11

    if-le v6, v7, :cond_b

    return-void

    :cond_b
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    move-result v5

    if-eqz v5, :cond_c

    return-void

    :cond_c
    const/16 v5, 0x22

    invoke-static {p0, v5}, Lokhttp3/internal/http/HttpHeaders;->startsWith(Lۀۗ۱/ب;B)Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->readQuotedString(Lۀۗ۱/ب;)Ljava/lang/String;

    move-result-object v5

    goto :goto_6

    :cond_d
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->readToken(Lۀۗ۱/ب;)Ljava/lang/String;

    move-result-object v5

    :goto_6
    if-nez v5, :cond_e

    return-void

    :cond_e
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_f

    return-void

    :cond_f
    invoke-static {p0}, Lokhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lۀۗ۱/ب;)Z

    move-result v3

    if-nez v3, :cond_10

    invoke-virtual {p0}, Lۀۗ۱/ب;->ج()Z

    move-result v3

    if-nez v3, :cond_10

    return-void

    :cond_10
    move-object v3, v0

    goto :goto_5

    :cond_11
    new-instance v4, Lokhttp3/Challenge;

    invoke-direct {v4, v1, v2}, Lokhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v1, v3

    goto/16 :goto_1
.end method

.method private static final readQuotedString(Lۀۗ۱/ب;)Ljava/lang/String;
    .locals 12

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move-result v0

    const/16 v1, 0x22

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    new-instance v0, Lۀۗ۱/ب;

    invoke-direct {v0}, Lۀۗ۱/ب;-><init>()V

    :goto_1
    sget-object v2, Lokhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lۀۗ۱/ث;

    invoke-virtual {p0, v2}, Lۀۗ۱/ب;->ـ(Lۀۗ۱/ث;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    return-object v5

    :cond_1
    invoke-virtual {p0, v2, v3}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v4

    if-ne v4, v1, :cond_2

    invoke-virtual {v0, p0, v2, v3}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    invoke-virtual {v0}, Lۀۗ۱/ب;->ل()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    iget-wide v6, p0, Lۀۗ۱/ب;->أ:J

    const-wide/16 v8, 0x1

    add-long v10, v2, v8

    cmp-long v4, v6, v10

    if-nez v4, :cond_3

    return-object v5

    :cond_3
    invoke-virtual {v0, p0, v2, v3}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    invoke-virtual {v0, p0, v8, v9}, Lۀۗ۱/ب;->write(Lۀۗ۱/ب;J)V

    goto :goto_1

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final readToken(Lۀۗ۱/ب;)Ljava/lang/String;
    .locals 4

    sget-object v0, Lokhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lۀۗ۱/ث;

    invoke-virtual {p0, v0}, Lۀۗ۱/ب;->ـ(Lۀۗ۱/ث;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    iget-wide v0, p0, Lۀۗ۱/ب;->أ:J

    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    sget-object v2, Lڹےف/؋;->؋:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0, v1, v2}, Lۀۗ۱/ب;->ك(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static final receiveHeaders(Lokhttp3/CookieJar;Lokhttp3/HttpUrl;Lokhttp3/Headers;)V
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "url"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "headers"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lokhttp3/CookieJar;->NO_COOKIES:Lokhttp3/CookieJar;

    if-ne p0, v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lokhttp3/Cookie;->Companion:Lokhttp3/Cookie$Companion;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Cookie$Companion;->parseAll(Lokhttp3/HttpUrl;Lokhttp3/Headers;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-interface {p0, p1, p2}, Lokhttp3/CookieJar;->saveFromResponse(Lokhttp3/HttpUrl;Ljava/util/List;)V

    return-void
.end method

.method private static final skipCommasAndWhitespace(Lۀۗ۱/ب;)Z
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Lۀۗ۱/ب;->ج()Z

    move-result v2

    if-nez v2, :cond_3

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v2, v3}, Lۀۗ۱/ب;->ؾ(J)B

    move-result v2

    const/16 v3, 0x2c

    const/4 v4, 0x1

    if-ne v2, v3, :cond_0

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    move v1, v4

    goto :goto_0

    :cond_0
    const/16 v3, 0x20

    if-ne v2, v3, :cond_1

    goto :goto_1

    :cond_1
    const/16 v3, 0x9

    if-ne v2, v3, :cond_2

    goto :goto_1

    :cond_2
    move v4, v0

    :goto_1
    if-eqz v4, :cond_3

    invoke-virtual {p0}, Lۀۗ۱/ب;->readByte()B

    goto :goto_0

    :cond_3
    return v1
.end method

.method private static final startsWith(Lۀۗ۱/ب;B)Z
    .locals 2

    invoke-virtual {p0}, Lۀۗ۱/ب;->ج()Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lۀۗ۱/ب;->ؾ(J)B

    move-result p0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
