.class public final Lأۺؘٻڣ/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public ؋:Ljava/lang/Object;

.field public ؠ:Ljava/lang/Object;

.field public ء:Ljava/lang/Object;

.field public آ:Ljava/lang/Object;

.field public أ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lؼۄٿأ/؋;->؋:Lؼۄٿأ/؋;

    iput-object p1, p0, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lأۺؘٻڣ/ز;L؋ڽبژ٦ښيل/ء;Lژة۪ڦضۆۿۡ/ح;Lأۺؘٻڣ/ش;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    const-string p1, "FCM_CLIENT_EVENT_LOGGING"

    iput-object p1, p0, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    iput-object p2, p0, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    iput-object p3, p0, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    iput-object p4, p0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋()Lذ۠ۋؿ/آ;
    .locals 7

    new-instance v6, Lذ۠ۋؿ/آ;

    iget-object v0, p0, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Landroid/accounts/Account;

    iget-object v0, p0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroidx/collection/ArraySet;

    iget-object v0, p0, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v0, p0, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    iget-object v0, p0, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lؼۄٿأ/؋;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lذ۠ۋؿ/آ;-><init>(Landroid/accounts/Account;Landroidx/collection/ArraySet;Ljava/lang/String;Ljava/lang/String;Lؼۄٿأ/؋;)V

    return-object v6
.end method

.method public final ؠ(L؋ڽبژ٦ښيل/؋;)V
    .locals 9

    new-instance v3, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v0, 0xa

    invoke-direct {v3, v0}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iget-object v0, p0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    check-cast v0, Lأۺؘٻڣ/ش;

    new-instance v1, Lأۺؘٻڣ/ب;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lأۺؘٻڣ/ب;-><init>(I)V

    iget-object v2, p0, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    check-cast v2, Lأۺؘٻڣ/ز;

    if-eqz v2, :cond_4

    iput-object v2, v1, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    iput-object p1, v1, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    iget-object p1, p0, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_3

    iput-object p1, v1, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    iget-object p1, p0, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    check-cast p1, Lژة۪ڦضۆۿۡ/ح;

    if-eqz p1, :cond_2

    iput-object p1, v1, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    iget-object p1, p0, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    check-cast p1, L؋ڽبژ٦ښيل/ء;

    if-eqz p1, :cond_1

    iput-object p1, v1, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    const-string p1, ""

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object p1, v1, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    check-cast p1, Lأۺؘٻڣ/ز;

    iget-object v2, v1, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v4, v1, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    check-cast v4, L؋ڽبژ٦ښيل/؋;

    iget-object v5, v1, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    check-cast v5, Lژة۪ڦضۆۿۡ/ح;

    iget-object v1, v1, Lأۺؘٻڣ/ب;->ء:Ljava/lang/Object;

    check-cast v1, L؋ڽبژ٦ښيل/ء;

    check-cast v0, Lأۺؘٻڣ/ص;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, L؋ڽبژ٦ښيل/آ;->آ:L؋ڽبژ٦ښيل/آ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lأۺؘٻڣ/ز;->؋()Lأۺؘٻڣ/ة;

    move-result-object v7

    check-cast p1, Lأۺؘٻڣ/ت;

    iget-object v8, p1, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lأۺؘٻڣ/ة;->ؠ(Ljava/lang/String;)Lأۺؘٻڣ/ة;

    invoke-virtual {v7, v6}, Lأۺؘٻڣ/ة;->ء(L؋ڽبژ٦ښيل/آ;)Lأۺؘٻڣ/ة;

    iget-object p1, p1, Lأۺؘٻڣ/ت;->ؠ:[B

    iput-object p1, v7, Lأۺؘٻڣ/ة;->ؠ:[B

    invoke-virtual {v7}, Lأۺؘٻڣ/ة;->؋()Lأۺؘٻڣ/ت;

    move-result-object p1

    new-instance v6, Lأۺؘٻڣ/ئ;

    invoke-direct {v6}, Lأۺؘٻڣ/ئ;-><init>()V

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v6, Lأۺؘٻڣ/ئ;->ؤ:Ljava/lang/Object;

    iget-object v7, v0, Lأۺؘٻڣ/ص;->؋:Lثڈا/؋;

    check-cast v7, Lثڈا/ؠ;

    invoke-virtual {v7}, Lثڈا/ؠ;->؋()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iput-object v7, v6, Lأۺؘٻڣ/ئ;->آ:Ljava/lang/Object;

    iget-object v7, v0, Lأۺؘٻڣ/ص;->ؠ:Lثڈا/؋;

    check-cast v7, Lثڈا/ؠ;

    invoke-virtual {v7}, Lثڈا/ؠ;->؋()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iput-object v7, v6, Lأۺؘٻڣ/ئ;->أ:Ljava/lang/Object;

    invoke-virtual {v6, v2}, Lأۺؘٻڣ/ئ;->إ(Ljava/lang/String;)V

    new-instance v2, Lأۺؘٻڣ/ح;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v4, L؋ڽبژ٦ښيل/؋;->؋:Ljava/lang/Object;

    check-cast v4, Lژػز/أ;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lژة۪ڦضۆۿۡ/ر;->؋:Lةؽڗںۍټ٘/ء;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    invoke-virtual {v5, v4, v7}, Lةؽڗںۍټ٘/ء;->أ(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v2, v1, v4}, Lأۺؘٻڣ/ح;-><init>(L؋ڽبژ٦ښيل/ء;[B)V

    invoke-virtual {v6, v2}, Lأۺؘٻڣ/ئ;->ؤ(Lأۺؘٻڣ/ح;)V

    const/4 v1, 0x0

    iput-object v1, v6, Lأۺؘٻڣ/ئ;->ؠ:Ljava/lang/Object;

    invoke-virtual {v6}, Lأۺؘٻڣ/ئ;->ؠ()Lأۺؘٻڣ/ا;

    move-result-object v4

    iget-object v0, v0, Lأۺؘٻڣ/ص;->ء:Lئٱنۃؖۊڄئ/ء;

    move-object v6, v0

    check-cast v6, Lئٱنۃؖۊڄئ/ؠ;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Landroidx/work/impl/ء;

    const/4 v5, 0x1

    move-object v0, v7

    move-object v1, v6

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Landroidx/work/impl/ء;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p1, v6, Lئٱنۃؖۊڄئ/ؠ;->ؠ:Ljava/util/concurrent/Executor;

    invoke-interface {p1, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Missing required properties:"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null encoding"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null transformer"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null transportName"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null transportContext"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
