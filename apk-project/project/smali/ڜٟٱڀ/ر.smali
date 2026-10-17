.class public abstract Lڜٟٱڀ/ر;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Lڜٟٱڀ/ذ;

.field public static final ؠ:Lښ۫ٳڢ/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lڜٟٱڀ/ذ;

    invoke-direct {v0}, Lڜٟٱڀ/ذ;-><init>()V

    sput-object v0, Lڜٟٱڀ/ر;->؋:Lڜٟٱڀ/ذ;

    new-instance v0, Lښ۫ٳڢ/ؠ;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lښ۫ٳڢ/ؠ;-><init>(I)V

    sput-object v0, Lڜٟٱڀ/ر;->ؠ:Lښ۫ٳڢ/ؠ;

    return-void
.end method

.method public static ؋(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient$Builder;
    .locals 5

    :try_start_0
    const-string v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    sget-object v2, Lڜٟٱڀ/ر;->؋:Lڜٟٱڀ/ذ;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, v0, v2}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p0

    sget-object v0, Lڜٟٱڀ/ر;->ؠ:Lښ۫ٳڢ/ؠ;

    invoke-virtual {p0, v0}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Failed to create SSLSocketFactory"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
