.class public final Landroidx/room/TransactionElement;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/إ;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/room/TransactionElement$Key;
    }
.end annotation


# static fields
.field public static final Key:Landroidx/room/TransactionElement$Key;


# instance fields
.field private final referenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final transactionDispatcher:Lڨڡئٸت/ؤ;

.field private final transactionThreadControlJob:Lںڍڒڸ/ى;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/room/TransactionElement$Key;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/room/TransactionElement$Key;-><init>(Lkotlin/jvm/internal/أ;)V

    sput-object v0, Landroidx/room/TransactionElement;->Key:Landroidx/room/TransactionElement$Key;

    return-void
.end method

.method public constructor <init>(Lںڍڒڸ/ى;Lڨڡئٸت/ؤ;)V
    .locals 1

    const-string v0, "transactionThreadControlJob"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transactionDispatcher"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/room/TransactionElement;->transactionThreadControlJob:Lںڍڒڸ/ى;

    iput-object p2, p0, Landroidx/room/TransactionElement;->transactionDispatcher:Lڨڡئٸت/ؤ;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Landroidx/room/TransactionElement;->referenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final acquire()V
    .locals 1

    iget-object v0, p0, Landroidx/room/TransactionElement;->referenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method

.method public fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            ")TR;"
        }
    .end annotation

    const-string v0, "operation"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2, p1, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0625;",
            ">(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;",
            ")TE;"
        }
    .end annotation

    invoke-static {p0, p1}, Lڗًقڔ/ء;->خ(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    return-object p1
.end method

.method public getKey()Lڨڡئٸت/ئ;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;"
        }
    .end annotation

    sget-object v0, Landroidx/room/TransactionElement;->Key:Landroidx/room/TransactionElement$Key;

    return-object v0
.end method

.method public final getTransactionDispatcher$room_ktx_release()Lڨڡئٸت/ؤ;
    .locals 1

    iget-object v0, p0, Landroidx/room/TransactionElement;->transactionDispatcher:Lڨڡئٸت/ؤ;

    return-object v0
.end method

.method public minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;",
            ")",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0627;"
        }
    .end annotation

    invoke-static {p0, p1}, Lڗًقڔ/ء;->ص(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final release()V
    .locals 2

    iget-object v0, p0, Landroidx/room/TransactionElement;->referenceCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-ltz v0, :cond_1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/room/TransactionElement;->transactionThreadControlJob:Lںڍڒڸ/ى;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Transaction was never started or was already released."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
