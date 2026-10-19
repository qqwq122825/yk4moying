.class public final Lںڍڒڸ/ئ;
.super Lںڍڒڸ/ع;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/إ;
.implements Lګؓ۝ؒڄس/آ;
.implements Lںڍڒڸ/ڃ;


# static fields
.field public static final ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

.field public static final ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _decisionAndIndex:I

.field private volatile _parentHandle:Ljava/lang/Object;

.field private volatile _state:Ljava/lang/Object;

.field public final إ:Lڨڡئٸت/أ;

.field public final ئ:Lڨڡئٸت/ا;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-string v0, "_decisionAndIndex"

    const-class v1, Lںڍڒڸ/ئ;

    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const-string v0, "_state"

    const-class v2, Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_parentHandle"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ئ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(ILڨڡئٸت/أ;)V
    .locals 0

    invoke-direct {p0, p1}, Lںڍڒڸ/ع;-><init>(I)V

    iput-object p2, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    iput-object p1, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    const p1, 0x1fffffff

    iput p1, p0, Lںڍڒڸ/ئ;->_decisionAndIndex:I

    sget-object p1, Lںڍڒڸ/ؠ;->آ:Lںڍڒڸ/ؠ;

    iput-object p1, p0, Lںڍڒڸ/ئ;->_state:Ljava/lang/Object;

    return-void
.end method

.method public static ز(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "It\'s prohibited to register multiple handlers, tried to register "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", already has "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static ط(Lںڍڒڸ/ٺ;Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)Ljava/lang/Object;
    .locals 6

    instance-of v0, p1, Lںڍڒڸ/خ;

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x1

    if-eq p2, v0, :cond_2

    const/4 v1, 0x2

    if-ne p2, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    if-nez v0, :cond_3

    goto :goto_2

    :cond_3
    if-nez p3, :cond_4

    instance-of p2, p0, Lںڍڒڸ/ؤ;

    if-nez p2, :cond_4

    goto :goto_2

    :cond_4
    new-instance p2, Lںڍڒڸ/ح;

    instance-of v0, p0, Lںڍڒڸ/ؤ;

    if-eqz v0, :cond_5

    check-cast p0, Lںڍڒڸ/ؤ;

    goto :goto_1

    :cond_5
    const/4 p0, 0x0

    :goto_1
    move-object v2, p0

    const/4 v4, 0x0

    const/16 v5, 0x10

    move-object v0, p2

    move-object v1, p1

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lںڍڒڸ/ح;-><init>(Ljava/lang/Object;Lںڍڒڸ/ؤ;Lڲٱۘۑدٿٰ/ت;Ljava/util/concurrent/CancellationException;I)V

    move-object p1, p2

    :goto_2
    return-object p1
.end method


# virtual methods
.method public final getCallerFrame()Lګؓ۝ؒڄس/آ;
    .locals 2

    iget-object v0, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    instance-of v1, v0, Lګؓ۝ؒڄس/آ;

    if-eqz v1, :cond_0

    check-cast v0, Lګؓ۝ؒڄس/آ;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    return-object v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 2

    invoke-static {p1}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lںڍڒڸ/خ;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v0}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    :goto_0
    iget v0, p0, Lںڍڒڸ/ع;->ؤ:I

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lںڍڒڸ/ئ;->ص(Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CancellableContinuation("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    invoke-static {v1}, Lںڍڒڸ/ش;->ڀ(Lڨڡئٸت/أ;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "){"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ٺ;

    if-eqz v2, :cond_0

    const-string v1, "Active"

    goto :goto_0

    :cond_0
    instance-of v1, v1, Lںڍڒڸ/ا;

    if-eqz v1, :cond_1

    const-string v1, "Cancelled"

    goto :goto_0

    :cond_1
    const-string v1, "Completed"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋(Lھۥٓڍچ/ز;I)V
    .locals 4

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v1

    const v2, 0x1fffffff

    and-int v3, v1, v2

    if-ne v3, v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_2

    shr-int/lit8 v2, v1, 0x1d

    shl-int/lit8 v2, v2, 0x1d

    add-int/2addr v2, p2

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lںڍڒڸ/ئ;->ذ(Ljava/lang/Object;)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "invokeOnCancellation should be called at most once"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V
    .locals 10

    :cond_0
    sget-object p1, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v0, v6, Lںڍڒڸ/ٺ;

    if-nez v0, :cond_b

    instance-of v0, v6, Lںڍڒڸ/خ;

    if-eqz v0, :cond_1

    return-void

    :cond_1
    instance-of v0, v6, Lںڍڒڸ/ح;

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v0, :cond_8

    move-object v0, v6

    check-cast v0, Lںڍڒڸ/ح;

    iget-object v1, v0, Lںڍڒڸ/ح;->أ:Ljava/lang/Throwable;

    if-eqz v1, :cond_2

    move v1, v7

    goto :goto_0

    :cond_2
    move v1, v8

    :goto_0
    xor-int/2addr v1, v7

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    const/16 v2, 0xf

    invoke-static {v0, v1, p2, v2}, Lںڍڒڸ/ح;->؋(Lںڍڒڸ/ح;Lںڍڒڸ/ؤ;Ljava/util/concurrent/CancellationException;I)Lںڍڒڸ/ح;

    move-result-object v1

    :cond_3
    invoke-virtual {p1, p0, v6, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v6, :cond_3

    move v7, v8

    :goto_1
    if-eqz v7, :cond_0

    iget-object p1, v0, Lںڍڒڸ/ح;->ؠ:Lںڍڒڸ/ؤ;

    if-eqz p1, :cond_5

    invoke-virtual {p0, p1, p2}, Lںڍڒڸ/ئ;->ئ(Lںڍڒڸ/ؤ;Ljava/lang/Throwable;)V

    :cond_5
    iget-object p1, v0, Lںڍڒڸ/ح;->ء:Lڲٱۘۑدٿٰ/ت;

    if-eqz p1, :cond_6

    invoke-virtual {p0, p1, p2}, Lںڍڒڸ/ئ;->ا(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Throwable;)V

    :cond_6
    return-void

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Must be called at most once"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    new-instance v9, Lںڍڒڸ/ح;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/16 v5, 0xe

    move-object v0, v9

    move-object v1, v6

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lںڍڒڸ/ح;-><init>(Ljava/lang/Object;Lںڍڒڸ/ؤ;Lڲٱۘۑدٿٰ/ت;Ljava/util/concurrent/CancellationException;I)V

    :cond_9
    invoke-virtual {p1, p0, v6, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_2

    :cond_a
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v6, :cond_9

    move v7, v8

    :goto_2
    if-eqz v7, :cond_0

    return-void

    :cond_b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Not completed"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء()Lڨڡئٸت/أ;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    return-object v0
.end method

.method public final آ(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 0

    invoke-super {p0, p1}, Lںڍڒڸ/ع;->آ(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final أ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    instance-of v0, p1, Lںڍڒڸ/ح;

    if-eqz v0, :cond_0

    check-cast p1, Lںڍڒڸ/ح;

    iget-object p1, p1, Lںڍڒڸ/ح;->؋:Ljava/lang/Object;

    :cond_0
    return-object p1
.end method

.method public final إ()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final ئ(Lںڍڒڸ/ؤ;Ljava/lang/Throwable;)V
    .locals 2

    :try_start_0
    invoke-virtual {p1, p2}, Lںڍڒڸ/ؤ;->؋(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    new-instance p2, Lرسٗ/ؠ;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exception in invokeOnCancellation handler for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p1, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public final ا(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Throwable;)V
    .locals 2

    :try_start_0
    invoke-interface {p1, p2}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    new-instance p2, Lرسٗ/ؠ;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exception in resume onCancellation handler for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p1, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public final ب(Lھۥٓڍچ/ز;Ljava/lang/Throwable;)V
    .locals 3

    iget-object p2, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    sget-object v0, Lںڍڒڸ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    const v1, 0x1fffffff

    and-int/2addr v0, v1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    :try_start_0
    invoke-virtual {p1, v0, p2}, Lھۥٓڍچ/ز;->إ(ILڨڡئٸت/ا;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    new-instance v0, Lرسٗ/ؠ;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in invokeOnCancellation handler for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p2, v0}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :goto_1
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "The index for Segment.onCancellation(..) is broken"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ة(Ljava/lang/Throwable;)Z
    .locals 6

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ٺ;

    const/4 v3, 0x0

    if-nez v2, :cond_1

    return v3

    :cond_1
    new-instance v2, Lںڍڒڸ/ا;

    instance-of v4, v1, Lںڍڒڸ/ؤ;

    const/4 v5, 0x1

    if-nez v4, :cond_3

    instance-of v4, v1, Lھۥٓڍچ/ز;

    if-eqz v4, :cond_2

    goto :goto_0

    :cond_2
    move v4, v3

    goto :goto_1

    :cond_3
    :goto_0
    move v4, v5

    :goto_1
    invoke-direct {v2, p0, p1, v4}, Lںڍڒڸ/ا;-><init>(Lڨڡئٸت/أ;Ljava/lang/Throwable;Z)V

    :cond_4
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    move v3, v5

    goto :goto_2

    :cond_5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v1, :cond_4

    :goto_2
    if-eqz v3, :cond_0

    move-object v0, v1

    check-cast v0, Lںڍڒڸ/ٺ;

    instance-of v2, v0, Lںڍڒڸ/ؤ;

    if-eqz v2, :cond_6

    check-cast v1, Lںڍڒڸ/ؤ;

    invoke-virtual {p0, v1, p1}, Lںڍڒڸ/ئ;->ئ(Lںڍڒڸ/ؤ;Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_6
    instance-of v0, v0, Lھۥٓڍچ/ز;

    if-eqz v0, :cond_7

    check-cast v1, Lھۥٓڍچ/ز;

    invoke-virtual {p0, v1, p1}, Lںڍڒڸ/ئ;->ب(Lھۥٓڍچ/ز;Ljava/lang/Throwable;)V

    :cond_7
    :goto_3
    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ر()Z

    move-result p1

    if-nez p1, :cond_8

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ت()V

    :cond_8
    iget p1, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {p0, p1}, Lںڍڒڸ/ئ;->ث(I)V

    return v5
.end method

.method public final ت()V
    .locals 2

    sget-object v0, Lںڍڒڸ/ئ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ػ;

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-interface {v1}, Lںڍڒڸ/ػ;->dispose()V

    sget-object v1, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final ث(I)V
    .locals 6

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v1

    shr-int/lit8 v2, v1, 0x1d

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already resumed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const v2, 0x1fffffff

    and-int/2addr v2, v1

    const/high16 v5, 0x40000000    # 2.0f

    add-int/2addr v2, v5

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    :goto_0
    if-eqz v0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    move v0, v3

    goto :goto_1

    :cond_4
    move v0, v4

    :goto_1
    iget-object v1, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    if-nez v0, :cond_c

    instance-of v2, v1, Lھۥٓڍچ/إ;

    if-eqz v2, :cond_c

    const/4 v2, 0x2

    if-eq p1, v3, :cond_6

    if-ne p1, v2, :cond_5

    goto :goto_2

    :cond_5
    move p1, v4

    goto :goto_3

    :cond_6
    :goto_2
    move p1, v3

    :goto_3
    iget v5, p0, Lںڍڒڸ/ع;->ؤ:I

    if-eq v5, v3, :cond_7

    if-ne v5, v2, :cond_8

    :cond_7
    move v4, v3

    :cond_8
    if-ne p1, v4, :cond_c

    move-object p1, v1

    check-cast p1, Lھۥٓڍچ/إ;

    iget-object p1, p1, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    invoke-interface {v1}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    invoke-virtual {p1, v0}, Lںڍڒڸ/ر;->isDispatchNeeded(Lڨڡئٸت/ا;)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-virtual {p1, v0, p0}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto :goto_5

    :cond_9
    invoke-static {}, Lںڍڒڸ/ٿ;->؋()Lںڍڒڸ/ف;

    move-result-object p1

    invoke-virtual {p1}, Lںڍڒڸ/ف;->ق()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p1, p0}, Lںڍڒڸ/ف;->ؿ(Lںڍڒڸ/ع;)V

    goto :goto_5

    :cond_a
    invoke-virtual {p1, v3}, Lںڍڒڸ/ف;->ف(Z)V

    :try_start_0
    invoke-static {p0, v1, v3}, Lںڍڒڸ/ش;->ٷ(Lںڍڒڸ/ع;Lڨڡئٸت/أ;Z)V

    :cond_b
    invoke-virtual {p1}, Lںڍڒڸ/ف;->ل()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_b

    goto :goto_4

    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p0, v0, v1}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_4
    invoke-virtual {p1, v3}, Lںڍڒڸ/ف;->ؾ(Z)V

    goto :goto_5

    :catchall_1
    move-exception v0

    invoke-virtual {p1, v3}, Lںڍڒڸ/ف;->ؾ(Z)V

    throw v0

    :cond_c
    invoke-static {p0, v1, v0}, Lںڍڒڸ/ش;->ٷ(Lںڍڒڸ/ع;Lڨڡئٸت/أ;Z)V

    :goto_5
    return-void
.end method

.method public final ج()Ljava/lang/Object;
    .locals 8

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ر()Z

    move-result v0

    :cond_0
    sget-object v1, Lںڍڒڸ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v2

    shr-int/lit8 v3, v2, 0x1d

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x2

    if-eqz v3, :cond_2

    if-ne v3, v6, :cond_1

    move v1, v4

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already suspended"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    const v3, 0x1fffffff

    and-int/2addr v3, v2

    const/high16 v7, 0x20000000

    add-int/2addr v3, v7

    invoke-virtual {v1, p0, v2, v3}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v5

    :goto_0
    if-eqz v1, :cond_5

    sget-object v1, Lںڍڒڸ/ئ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ػ;

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->خ()Lںڍڒڸ/ػ;

    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->س()V

    :cond_4
    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    return-object v0

    :cond_5
    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->س()V

    :cond_6
    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/خ;

    if-nez v1, :cond_b

    iget v1, p0, Lںڍڒڸ/ع;->ؤ:I

    if-eq v1, v5, :cond_7

    if-ne v1, v6, :cond_8

    :cond_7
    move v4, v5

    :cond_8
    if-eqz v4, :cond_a

    sget-object v1, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    iget-object v2, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-interface {v2, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ى;

    if-eqz v1, :cond_a

    invoke-interface {v1}, Lںڍڒڸ/ى;->؋()Z

    move-result v2

    if-eqz v2, :cond_9

    goto :goto_1

    :cond_9
    check-cast v1, Lںڍڒڸ/ٵ;

    invoke-virtual {v1}, Lںڍڒڸ/ٵ;->س()Ljava/util/concurrent/CancellationException;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lںڍڒڸ/ئ;->ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V

    throw v1

    :cond_a
    :goto_1
    invoke-virtual {p0, v0}, Lںڍڒڸ/ئ;->أ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_b
    check-cast v0, Lںڍڒڸ/خ;

    iget-object v0, v0, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    throw v0
.end method

.method public final ح()V
    .locals 2

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->خ()Lںڍڒڸ/ػ;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lںڍڒڸ/ٺ;

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Lںڍڒڸ/ػ;->dispose()V

    sget-object v0, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    sget-object v1, Lںڍڒڸ/ئ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public final خ()Lںڍڒڸ/ػ;
    .locals 5

    sget-object v0, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    iget-object v1, p0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-interface {v1, v0}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    check-cast v0, Lںڍڒڸ/ى;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    new-instance v2, Lںڍڒڸ/ب;

    invoke-direct {v2, p0}, Lںڍڒڸ/ب;-><init>(Lںڍڒڸ/ئ;)V

    const/4 v3, 0x2

    const/4 v4, 0x1

    invoke-static {v0, v4, v2, v3}, Lڗًقڔ/؋;->ف(Lںڍڒڸ/ى;ZLںڍڒڸ/ٱ;I)Lںڍڒڸ/ػ;

    move-result-object v0

    :cond_1
    sget-object v2, Lںڍڒڸ/ئ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, p0, v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    :goto_0
    return-object v0
.end method

.method public final د(Lڲٱۘۑدٿٰ/ت;)V
    .locals 2

    instance-of v0, p1, Lںڍڒڸ/ؤ;

    if-eqz v0, :cond_0

    check-cast p1, Lںڍڒڸ/ؤ;

    goto :goto_0

    :cond_0
    new-instance v0, Lںڍڒڸ/أ;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p1}, Lںڍڒڸ/أ;-><init>(ILjava/lang/Object;)V

    move-object p1, v0

    :goto_0
    invoke-virtual {p0, p1}, Lںڍڒڸ/ئ;->ذ(Ljava/lang/Object;)V

    return-void
.end method

.method public final ذ(Ljava/lang/Object;)V
    .locals 11

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    instance-of v1, v7, Lںڍڒڸ/ؠ;

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v1, :cond_3

    :cond_1
    invoke-virtual {v0, p0, v7, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v7, :cond_1

    move v8, v9

    :goto_0
    if-eqz v8, :cond_0

    return-void

    :cond_3
    instance-of v1, v7, Lںڍڒڸ/ؤ;

    if-eqz v1, :cond_4

    move v1, v8

    goto :goto_1

    :cond_4
    instance-of v1, v7, Lھۥٓڍچ/ز;

    :goto_1
    const/4 v2, 0x0

    if-nez v1, :cond_15

    instance-of v1, v7, Lںڍڒڸ/خ;

    if-eqz v1, :cond_a

    move-object v0, v7

    check-cast v0, Lںڍڒڸ/خ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lںڍڒڸ/خ;->ؠ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, v0, v9, v8}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_9

    instance-of v3, v7, Lںڍڒڸ/ا;

    if-eqz v3, :cond_8

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    move-object v0, v2

    :goto_2
    if-eqz v0, :cond_6

    iget-object v2, v0, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    :cond_6
    instance-of v0, p1, Lںڍڒڸ/ؤ;

    if-eqz v0, :cond_7

    check-cast p1, Lںڍڒڸ/ؤ;

    invoke-virtual {p0, p1, v2}, Lںڍڒڸ/ئ;->ئ(Lںڍڒڸ/ؤ;Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_7
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.internal.Segment<*>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lھۥٓڍچ/ز;

    invoke-virtual {p0, p1, v2}, Lںڍڒڸ/ئ;->ب(Lھۥٓڍچ/ز;Ljava/lang/Throwable;)V

    :cond_8
    :goto_3
    return-void

    :cond_9
    invoke-static {p1, v7}, Lںڍڒڸ/ئ;->ز(Ljava/lang/Object;Ljava/lang/Object;)V

    throw v2

    :cond_a
    instance-of v1, v7, Lںڍڒڸ/ح;

    const-string v3, "null cannot be cast to non-null type kotlinx.coroutines.CancelHandler"

    if-eqz v1, :cond_11

    move-object v1, v7

    check-cast v1, Lںڍڒڸ/ح;

    iget-object v4, v1, Lںڍڒڸ/ح;->ؠ:Lںڍڒڸ/ؤ;

    if-nez v4, :cond_10

    instance-of v4, p1, Lھۥٓڍچ/ز;

    if-eqz v4, :cond_b

    return-void

    :cond_b
    invoke-static {p1, v3}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v3, p1

    check-cast v3, Lںڍڒڸ/ؤ;

    iget-object v4, v1, Lںڍڒڸ/ح;->أ:Ljava/lang/Throwable;

    if-eqz v4, :cond_c

    move v5, v8

    goto :goto_4

    :cond_c
    move v5, v9

    :goto_4
    if-eqz v5, :cond_d

    invoke-virtual {p0, v3, v4}, Lںڍڒڸ/ئ;->ئ(Lںڍڒڸ/ؤ;Ljava/lang/Throwable;)V

    return-void

    :cond_d
    const/16 v4, 0x1d

    invoke-static {v1, v3, v2, v4}, Lںڍڒڸ/ح;->؋(Lںڍڒڸ/ح;Lںڍڒڸ/ؤ;Ljava/util/concurrent/CancellationException;I)Lںڍڒڸ/ح;

    move-result-object v1

    :cond_e
    invoke-virtual {v0, p0, v7, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    goto :goto_5

    :cond_f
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v7, :cond_e

    move v8, v9

    :goto_5
    if-eqz v8, :cond_0

    return-void

    :cond_10
    invoke-static {p1, v7}, Lںڍڒڸ/ئ;->ز(Ljava/lang/Object;Ljava/lang/Object;)V

    throw v2

    :cond_11
    instance-of v1, p1, Lھۥٓڍچ/ز;

    if-eqz v1, :cond_12

    return-void

    :cond_12
    invoke-static {p1, v3}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v3, p1

    check-cast v3, Lںڍڒڸ/ؤ;

    new-instance v10, Lںڍڒڸ/ح;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x1c

    move-object v1, v10

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lںڍڒڸ/ح;-><init>(Ljava/lang/Object;Lںڍڒڸ/ؤ;Lڲٱۘۑدٿٰ/ت;Ljava/util/concurrent/CancellationException;I)V

    :cond_13
    invoke-virtual {v0, p0, v7, v10}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_6

    :cond_14
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v7, :cond_13

    move v8, v9

    :goto_6
    if-eqz v8, :cond_0

    return-void

    :cond_15
    invoke-static {p1, v7}, Lںڍڒڸ/ئ;->ز(Ljava/lang/Object;Ljava/lang/Object;)V

    throw v2
.end method

.method public final ر()Z
    .locals 4

    iget v0, p0, Lںڍڒڸ/ع;->ؤ:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_2

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<*>"

    iget-object v1, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Lھۥٓڍچ/إ;

    sget-object v0, Lھۥٓڍچ/إ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    move v0, v3

    :goto_1
    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    return v2
.end method

.method public final س()V
    .locals 7

    iget-object v0, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    instance-of v1, v0, Lھۥٓڍچ/إ;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Lھۥٓڍچ/إ;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_a

    :cond_1
    sget-object v1, Lھۥٓڍچ/إ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lڃٷښـ۝ۼ/ؠ;->ث:Lئٱنۃؖۊڄئ/آ;

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne v3, v4, :cond_4

    :cond_2
    invoke-virtual {v1, v0, v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v5, v6

    goto :goto_1

    :cond_3
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v4, :cond_2

    :goto_1
    if-eqz v5, :cond_1

    goto :goto_3

    :cond_4
    instance-of v4, v3, Ljava/lang/Throwable;

    if-eqz v4, :cond_9

    :cond_5
    invoke-virtual {v1, v0, v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    move v5, v6

    goto :goto_2

    :cond_6
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v3, :cond_5

    :goto_2
    if-eqz v5, :cond_8

    move-object v2, v3

    check-cast v2, Ljava/lang/Throwable;

    :goto_3
    if-nez v2, :cond_7

    goto :goto_4

    :cond_7
    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ت()V

    invoke-virtual {p0, v2}, Lںڍڒڸ/ئ;->ة(Ljava/lang/Throwable;)Z

    return-void

    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Failed requirement."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Inconsistent state "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    :goto_4
    return-void
.end method

.method public final ش(Ljava/lang/Object;Lڽتٺۊڗ؜/ء;)V
    .locals 1

    iget v0, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {p0, p1, v0, p2}, Lںڍڒڸ/ئ;->ص(Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)V

    return-void
.end method

.method public final ص(Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)V
    .locals 6

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ٺ;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_4

    move-object v2, v1

    check-cast v2, Lںڍڒڸ/ٺ;

    invoke-static {v2, p1, p2, p3}, Lںڍڒڸ/ئ;->ط(Lںڍڒڸ/ٺ;Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)Ljava/lang/Object;

    move-result-object v2

    :cond_1
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v3, v4

    goto :goto_0

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v1, :cond_1

    :goto_0
    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ر()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ت()V

    :cond_3
    invoke-virtual {p0, p2}, Lںڍڒڸ/ئ;->ث(I)V

    return-void

    :cond_4
    instance-of p2, v1, Lںڍڒڸ/ا;

    if-eqz p2, :cond_6

    check-cast v1, Lںڍڒڸ/ا;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lںڍڒڸ/ا;->ء:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {p2, v1, v3, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result p2

    if-eqz p2, :cond_6

    if-eqz p3, :cond_5

    iget-object p1, v1, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    invoke-virtual {p0, p3, p1}, Lںڍڒڸ/ئ;->ا(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Throwable;)V

    :cond_5
    return-void

    :cond_6
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Already resumed, but proposed with update "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ض(Lںڍڒڸ/ر;)V
    .locals 4

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget-object v1, p0, Lںڍڒڸ/ئ;->إ:Lڨڡئٸت/أ;

    instance-of v2, v1, Lھۥٓڍچ/إ;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    check-cast v1, Lھۥٓڍچ/إ;

    goto :goto_0

    :cond_0
    move-object v1, v3

    :goto_0
    if-eqz v1, :cond_1

    iget-object v1, v1, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    goto :goto_1

    :cond_1
    move-object v1, v3

    :goto_1
    if-ne v1, p1, :cond_2

    const/4 p1, 0x4

    goto :goto_2

    :cond_2
    iget p1, p0, Lںڍڒڸ/ع;->ؤ:I

    :goto_2
    invoke-virtual {p0, v0, p1, v3}, Lںڍڒڸ/ئ;->ص(Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)V

    return-void
.end method
