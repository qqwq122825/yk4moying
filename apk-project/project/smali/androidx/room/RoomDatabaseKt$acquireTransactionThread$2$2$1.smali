.class final Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2;->run()V
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
    c = "androidx.room.RoomDatabaseKt$acquireTransactionThread$2$2$1"
    f = "RoomDatabaseExt.kt"
    l = {
        0x7d
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $continuation:Lںڍڒڸ/إ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06ba\u068d\u0692\u06b8/\u0625;"
        }
    .end annotation
.end field

.field final synthetic $controlJob:Lںڍڒڸ/ى;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(Lںڍڒڸ/إ;Lںڍڒڸ/ى;Lڨڡئٸت/أ;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06ba\u068d\u0692\u06b8/\u0625;",
            "L\u06ba\u068d\u0692\u06b8/\u0649;",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$continuation:Lںڍڒڸ/إ;

    iput-object p2, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$controlJob:Lںڍڒڸ/ى;

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

    new-instance v0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;

    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$continuation:Lںڍڒڸ/إ;

    iget-object v2, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$controlJob:Lںڍڒڸ/ى;

    invoke-direct {v0, v1, v2, p2}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;-><init>(Lںڍڒڸ/إ;Lںڍڒڸ/ى;Lڨڡئٸت/أ;)V

    iput-object p1, v0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lںڍڒڸ/س;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->invoke(Lںڍڒڸ/س;Lڨڡئٸت/أ;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->label:I

    sget-object v2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto/16 :goto_4

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lںڍڒڸ/س;

    iget-object v1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$continuation:Lںڍڒڸ/إ;

    invoke-interface {p1}, Lںڍڒڸ/س;->getCoroutineContext()Lڨڡئٸت/ا;

    move-result-object p1

    sget-object v4, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {p1, v4}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    check-cast v1, Lںڍڒڸ/ئ;

    invoke-virtual {v1, p1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    iget-object p1, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->$controlJob:Lںڍڒڸ/ى;

    iput v3, p0, Landroidx/room/RoomDatabaseKt$acquireTransactionThread$2$2$1;->label:I

    check-cast p1, Lںڍڒڸ/ٵ;

    :cond_2
    invoke-virtual {p1}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v1

    instance-of v4, v1, Lںڍڒڸ/م;

    const/4 v5, 0x0

    if-nez v4, :cond_3

    move v1, v5

    goto :goto_0

    :cond_3
    invoke-virtual {p1, v1}, Lںڍڒڸ/ٵ;->ل(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_2

    move v1, v3

    :goto_0
    if-nez v1, :cond_4

    invoke-interface {p0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    invoke-static {p1}, Lڗًقڔ/ء;->ب(Lڨڡئٸت/ا;)V

    goto :goto_2

    :cond_4
    new-instance v1, Lںڍڒڸ/ئ;

    invoke-static {p0}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lںڍڒڸ/ئ;-><init>(ILڨڡئٸت/أ;)V

    invoke-virtual {v1}, Lںڍڒڸ/ئ;->ح()V

    new-instance v4, Lںڍڒڸ/و;

    invoke-direct {v4, v3, v1}, Lںڍڒڸ/و;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v5, v3, v4}, Lںڍڒڸ/ٵ;->ػ(ZZLڲٱۘۑدٿٰ/ت;)Lںڍڒڸ/ػ;

    move-result-object p1

    new-instance v4, Lںڍڒڸ/أ;

    invoke-direct {v4, v3, p1}, Lںڍڒڸ/أ;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v4}, Lںڍڒڸ/ئ;->د(Lڲٱۘۑدٿٰ/ت;)V

    invoke-virtual {v1}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object p1

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, v1, :cond_5

    goto :goto_1

    :cond_5
    move-object p1, v2

    :goto_1
    if-ne p1, v1, :cond_6

    goto :goto_3

    :cond_6
    :goto_2
    move-object p1, v2

    :goto_3
    if-ne p1, v0, :cond_7

    return-object v0

    :cond_7
    :goto_4
    return-object v2
.end method
