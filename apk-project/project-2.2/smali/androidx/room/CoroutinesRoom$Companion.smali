.class public final Landroidx/room/CoroutinesRoom$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/room/CoroutinesRoom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/أ;)V
    .locals 0

    invoke-direct {p0}, Landroidx/room/CoroutinesRoom$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/room/RoomDatabase;",
            "Z[",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Callable<",
            "TR;>;)",
            "L\u06be\u0673\u06f0\u068c\u0604\u063a\u068e\u06e6/\u0625;"
        }
    .end annotation

    const-string v0, "db"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tableNames"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callable"

    invoke-static {p4, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/room/CoroutinesRoom$Companion$createFlow$1;

    const/4 v6, 0x0

    move-object v1, v0

    move v2, p2

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Landroidx/room/CoroutinesRoom$Companion$createFlow$1;-><init>(ZLandroidx/room/RoomDatabase;[Ljava/lang/String;Ljava/util/concurrent/Callable;Lڨڡئٸت/أ;)V

    new-instance p1, Lھٳ۰ڌ؄غڎۦ/ت;

    invoke-direct {p1, v0}, Lھٳ۰ڌ؄غڎۦ/ت;-><init>(Lڲٱۘۑدٿٰ/خ;)V

    return-object p1
.end method

.method public final execute(Landroidx/room/RoomDatabase;ZLandroid/os/CancellationSignal;Ljava/util/concurrent/Callable;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/room/RoomDatabase;",
            "Z",
            "Landroid/os/CancellationSignal;",
            "Ljava/util/concurrent/Callable<",
            "TR;>;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p4}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-interface {p5}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    sget-object v1, Landroidx/room/TransactionElement;->Key:Landroidx/room/TransactionElement$Key;

    invoke-interface {v0, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Landroidx/room/TransactionElement;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/room/TransactionElement;->getTransactionDispatcher$room_ktx_release()Lڨڡئٸت/ؤ;

    move-result-object v0

    if-nez v0, :cond_3

    :cond_1
    if-eqz p2, :cond_2

    invoke-static {p1}, Landroidx/room/CoroutinesRoomKt;->getTransactionDispatcher(Landroidx/room/RoomDatabase;)Lںڍڒڸ/ر;

    move-result-object p1

    goto :goto_0

    :cond_2
    invoke-static {p1}, Landroidx/room/CoroutinesRoomKt;->getQueryDispatcher(Landroidx/room/RoomDatabase;)Lںڍڒڸ/ر;

    move-result-object p1

    :goto_0
    move-object v0, p1

    :cond_3
    new-instance p1, Lںڍڒڸ/ئ;

    invoke-static {p5}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p2

    const/4 p5, 0x1

    invoke-direct {p1, p5, p2}, Lںڍڒڸ/ئ;-><init>(ILڨڡئٸت/أ;)V

    invoke-virtual {p1}, Lںڍڒڸ/ئ;->ح()V

    new-instance p2, Landroidx/room/CoroutinesRoom$Companion$execute$4$job$1;

    const/4 v1, 0x0

    invoke-direct {p2, p4, p1, v1}, Landroidx/room/CoroutinesRoom$Companion$execute$4$job$1;-><init>(Ljava/util/concurrent/Callable;Lںڍڒڸ/إ;Lڨڡئٸت/أ;)V

    const/4 p4, 0x2

    and-int/2addr p4, p5

    sget-object v2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    if-eqz p4, :cond_4

    move-object v0, v2

    :cond_4
    const/4 p4, 0x2

    and-int v3, p4, p4

    const/4 v4, 0x0

    if-eqz v3, :cond_5

    move v3, p5

    goto :goto_1

    :cond_5
    move v3, v4

    :goto_1
    invoke-static {v2, v0, p5}, Lڗًقڔ/ء;->ح(Lڨڡئٸت/ا;Lڨڡئٸت/ا;Z)Lڨڡئٸت/ا;

    move-result-object v0

    sget-object v2, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    if-eq v0, v2, :cond_6

    sget-object v5, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {v0, v5}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v5

    if-nez v5, :cond_6

    invoke-interface {v0, v2}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v0

    :cond_6
    if-eqz v3, :cond_9

    if-ne v3, p4, :cond_7

    move v4, p5

    :cond_7
    if-eqz v4, :cond_8

    new-instance p4, Lںڍڒڸ/ٶ;

    invoke-direct {p4, v0, p2}, Lںڍڒڸ/ٶ;-><init>(Lڨڡئٸت/ا;Lڲٱۘۑدٿٰ/خ;)V

    goto :goto_2

    :cond_8
    new-instance p4, Lںڍڒڸ/ټ;

    invoke-direct {p4, v0, p5}, Lںڍڒڸ/ټ;-><init>(Lڨڡئٸت/ا;Z)V

    :goto_2
    invoke-virtual {p4, v3, p4, p2}, Lںڍڒڸ/؋;->ي(ILںڍڒڸ/؋;Lڲٱۘۑدٿٰ/خ;)V

    new-instance p2, Landroidx/room/CoroutinesRoom$Companion$execute$4$1;

    invoke-direct {p2, p3, p4}, Landroidx/room/CoroutinesRoom$Companion$execute$4$1;-><init>(Landroid/os/CancellationSignal;Lںڍڒڸ/ى;)V

    invoke-virtual {p1, p2}, Lںڍڒڸ/ئ;->د(Lڲٱۘۑدٿٰ/ت;)V

    invoke-virtual {p1}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    return-object p1

    :cond_9
    throw v1
.end method

.method public final execute(Landroidx/room/RoomDatabase;ZLjava/util/concurrent/Callable;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/room/RoomDatabase;",
            "Z",
            "Ljava/util/concurrent/Callable<",
            "TR;>;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->inTransaction()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-interface {p4}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    sget-object v1, Landroidx/room/TransactionElement;->Key:Landroidx/room/TransactionElement$Key;

    invoke-interface {v0, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Landroidx/room/TransactionElement;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/room/TransactionElement;->getTransactionDispatcher$room_ktx_release()Lڨڡئٸت/ؤ;

    move-result-object v0

    if-nez v0, :cond_3

    :cond_1
    if-eqz p2, :cond_2

    invoke-static {p1}, Landroidx/room/CoroutinesRoomKt;->getTransactionDispatcher(Landroidx/room/RoomDatabase;)Lںڍڒڸ/ر;

    move-result-object p1

    goto :goto_0

    :cond_2
    invoke-static {p1}, Landroidx/room/CoroutinesRoomKt;->getQueryDispatcher(Landroidx/room/RoomDatabase;)Lںڍڒڸ/ر;

    move-result-object p1

    :goto_0
    move-object v0, p1

    :cond_3
    new-instance p1, Landroidx/room/CoroutinesRoom$Companion$execute$2;

    const/4 p2, 0x0

    invoke-direct {p1, p3, p2}, Landroidx/room/CoroutinesRoom$Companion$execute$2;-><init>(Ljava/util/concurrent/Callable;Lڨڡئٸت/أ;)V

    invoke-static {v0, p1, p4}, Lںڍڒڸ/ش;->ڄ(Lڨڡئٸت/ا;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
