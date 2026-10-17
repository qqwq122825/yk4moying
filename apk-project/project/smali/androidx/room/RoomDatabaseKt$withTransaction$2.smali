.class final Landroidx/room/RoomDatabaseKt$withTransaction$2;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/room/RoomDatabaseKt;->withTransaction(Landroidx/room/RoomDatabase;Lڲٱۘۑدٿٰ/ت;Lڨڡئٸت/أ;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "L\u06ab\u0613\u06dd\u0612\u0684\u0633/\u0626;",
        "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;"
    }
.end annotation

.annotation runtime Lګؓ۝ؒڄس/أ;
    c = "androidx.room.RoomDatabaseKt$withTransaction$2"
    f = "RoomDatabaseExt.kt"
    l = {
        0x3b
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $block:Lڲٱۘۑدٿٰ/ت;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
        }
    .end annotation
.end field

.field final synthetic $this_withTransaction:Landroidx/room/RoomDatabase;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;Lڲٱۘۑدٿٰ/ت;Lڨڡئٸت/أ;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/room/RoomDatabase;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    iput-object p2, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$block:Lڲٱۘۑدٿٰ/ت;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;"
        }
    .end annotation

    new-instance v0, Landroidx/room/RoomDatabaseKt$withTransaction$2;

    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    iget-object v2, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$block:Lڲٱۘۑدٿٰ/ت;

    invoke-direct {v0, v1, v2, p2}, Landroidx/room/RoomDatabaseKt$withTransaction$2;-><init>(Landroidx/room/RoomDatabase;Lڲٱۘۑدٿٰ/ت;Lڨڡئٸت/أ;)V

    iput-object p1, v0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lںڍڒڸ/س;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Landroidx/room/RoomDatabaseKt$withTransaction$2;->invoke(Lںڍڒڸ/س;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lںڍڒڸ/س;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06ba\u068d\u0692\u06b8/\u0633;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Landroidx/room/RoomDatabaseKt$withTransaction$2;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Landroidx/room/RoomDatabaseKt$withTransaction$2;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Landroidx/room/RoomDatabaseKt$withTransaction$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v0, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->L$0:Ljava/lang/Object;

    check-cast v0, Landroidx/room/TransactionElement;

    :try_start_0
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->L$0:Ljava/lang/Object;

    check-cast p1, Lںڍڒڸ/س;

    invoke-interface {p1}, Lںڍڒڸ/س;->getCoroutineContext()Lڨڡئٸت/ا;

    move-result-object p1

    sget-object v1, Landroidx/room/TransactionElement;->Key:Landroidx/room/TransactionElement$Key;

    invoke-interface {p1, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    check-cast p1, Landroidx/room/TransactionElement;

    invoke-virtual {p1}, Landroidx/room/TransactionElement;->acquire()V

    :try_start_1
    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$block:Lڲٱۘۑدٿٰ/ت;

    iput-object p1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->L$0:Ljava/lang/Object;

    iput v2, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->label:I

    invoke-interface {v1, p0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-ne v1, v0, :cond_2

    return-object v0

    :cond_2
    move-object v0, p1

    move-object p1, v1

    :goto_0
    :try_start_3
    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    invoke-virtual {v0}, Landroidx/room/TransactionElement;->release()V

    return-object p1

    :catchall_1
    move-exception v0

    move-object v3, v0

    move-object v0, p1

    move-object p1, v3

    :goto_1
    :try_start_5
    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$withTransaction$2;->$this_withTransaction:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception p1

    goto :goto_2

    :catchall_3
    move-exception v0

    move-object v3, v0

    move-object v0, p1

    move-object p1, v3

    :goto_2
    invoke-virtual {v0}, Landroidx/room/TransactionElement;->release()V

    throw p1
.end method
