.class public final Lأۺؘٻڣ/ص;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lأۺؘٻڣ/ش;


# static fields
.field public static volatile أ:Lأۺؘٻڣ/ث;


# instance fields
.field public final ؋:Lثڈا/؋;

.field public final ؠ:Lثڈا/؋;

.field public final ء:Lئٱنۃؖۊڄئ/ء;

.field public final آ:Lةؽڗںۍټ٘/ت;


# direct methods
.method public constructor <init>(Lثڈا/؋;Lثڈا/؋;Lئٱنۃؖۊڄئ/ء;Lةؽڗںۍټ٘/ت;Lةؽڗںۍټ٘/ج;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lأۺؘٻڣ/ص;->؋:Lثڈا/؋;

    iput-object p2, p0, Lأۺؘٻڣ/ص;->ؠ:Lثڈا/؋;

    iput-object p3, p0, Lأۺؘٻڣ/ص;->ء:Lئٱنۃؖۊڄئ/ء;

    iput-object p4, p0, Lأۺؘٻڣ/ص;->آ:Lةؽڗںۍټ٘/ت;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Landroidx/constraintlayout/helper/widget/؋;

    const/4 p2, 0x5

    invoke-direct {p1, p2, p5}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    iget-object p2, p5, Lةؽڗںۍټ٘/ج;->؋:Ljava/util/concurrent/Executor;

    invoke-interface {p2, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static ؋()Lأۺؘٻڣ/ص;
    .locals 2

    sget-object v0, Lأۺؘٻڣ/ص;->أ:Lأۺؘٻڣ/ث;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lأۺؘٻڣ/ث;->ا:Lڡحڠبںۨږۛ/؋;

    invoke-interface {v0}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lأۺؘٻڣ/ص;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not initialized!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static ؠ(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lأۺؘٻڣ/ص;->أ:Lأۺؘٻڣ/ث;

    if-nez v0, :cond_1

    const-class v0, Lأۺؘٻڣ/ص;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lأۺؘٻڣ/ص;->أ:Lأۺؘٻڣ/ث;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lأۺؘٻڣ/ث;

    invoke-direct {v1, p0}, Lأۺؘٻڣ/ث;-><init>(Landroid/content/Context;)V

    sput-object v1, Lأۺؘٻڣ/ص;->أ:Lأۺؘٻڣ/ث;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final ء(Lء؅ڱ٢/؋;)Lأۺؘٻڣ/س;
    .locals 7

    new-instance v0, Lأۺؘٻڣ/س;

    instance-of v1, p1, Lأۺؘٻڣ/ج;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lء؅ڱ٢/؋;->آ:Ljava/util/Set;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, L؋ڽبژ٦ښيل/ء;

    const-string v2, "proto"

    invoke-direct {v1, v2}, L؋ڽبژ٦ښيل/ء;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    :goto_0
    invoke-static {}, Lأۺؘٻڣ/ز;->؋()Lأۺؘٻڣ/ة;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "cct"

    invoke-virtual {v2, v3}, Lأۺؘٻڣ/ة;->ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;

    iget-object v3, p1, Lء؅ڱ٢/؋;->؋:Ljava/lang/String;

    iget-object p1, p1, Lء؅ڱ٢/؋;->ؠ:Ljava/lang/String;

    if-nez p1, :cond_1

    if-nez v3, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "1$"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v3, v4, v5

    const/4 v3, 0x2

    const-string v5, "\\"

    aput-object v5, v4, v3

    if-nez p1, :cond_2

    const-string p1, ""

    :cond_2
    const/4 v3, 0x3

    aput-object p1, v4, v3

    const-string p1, "%s%s%s%s"

    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    :goto_1
    iput-object p1, v2, Lأۺؘٻڣ/ة;->ؠ:[B

    invoke-virtual {v2}, Lأۺؘٻڣ/ة;->؋()Lأۺؘٻڣ/ت;

    move-result-object p1

    invoke-direct {v0, v1, p1, p0}, Lأۺؘٻڣ/س;-><init>(Ljava/util/Set;Lأۺؘٻڣ/ت;Lأۺؘٻڣ/ش;)V

    return-object v0
.end method
