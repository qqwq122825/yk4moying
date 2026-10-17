.class public abstract Lںڍڒڸ/ٱ;
.super Lھۥٓڍچ/ب;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ػ;
.implements Lںڍڒڸ/م;
.implements Lڲٱۘۑدٿٰ/ت;


# instance fields
.field public إ:Lںڍڒڸ/ٵ;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lھۥٓڍچ/ب;-><init>()V

    return-void
.end method


# virtual methods
.method public final dispose()V
    .locals 7

    invoke-virtual {p0}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ٱ;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_4

    if-eq v1, p0, :cond_1

    goto/16 :goto_2

    :cond_1
    sget-object v2, Lںڍڒڸ/ش;->ج:Lںڍڒڸ/ؼ;

    :cond_2
    sget-object v5, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v3, v4

    goto :goto_0

    :cond_3
    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v1, :cond_2

    :goto_0
    if-eqz v3, :cond_0

    goto :goto_2

    :cond_4
    instance-of v0, v1, Lںڍڒڸ/م;

    if-eqz v0, :cond_a

    check-cast v1, Lںڍڒڸ/م;

    invoke-interface {v1}, Lںڍڒڸ/م;->ء()Lںڍڒڸ/ٸ;

    move-result-object v0

    if-eqz v0, :cond_a

    :cond_5
    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lھۥٓڍچ/د;

    if-eqz v1, :cond_6

    check-cast v0, Lھۥٓڍچ/د;

    iget-object v0, v0, Lھۥٓڍچ/د;->؋:Lھۥٓڍچ/ب;

    goto :goto_2

    :cond_6
    if-ne v0, p0, :cond_7

    check-cast v0, Lھۥٓڍچ/ب;

    goto :goto_2

    :cond_7
    const-string v1, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode{ kotlinx.coroutines.internal.LockFreeLinkedListKt.Node }"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, v0

    check-cast v1, Lھۥٓڍچ/ب;

    sget-object v2, Lھۥٓڍچ/ب;->ؤ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lھۥٓڍچ/د;

    if-nez v5, :cond_8

    new-instance v5, Lھۥٓڍچ/د;

    invoke-direct {v5, v1}, Lھۥٓڍچ/د;-><init>(Lھۥٓڍچ/ب;)V

    invoke-virtual {v2, v1, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_8
    sget-object v2, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, p0, v0, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    move v0, v4

    goto :goto_1

    :cond_9
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_8

    move v0, v3

    :goto_1
    if-eqz v0, :cond_5

    invoke-virtual {v1}, Lھۥٓڍچ/ب;->آ()Lھۥٓڍچ/ب;

    :cond_a
    :goto_2
    return-void
.end method

.method public getParent()Lںڍڒڸ/ى;
    .locals 1

    invoke-virtual {p0}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object v0

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "[job@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object v1

    invoke-static {v1}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final ء()Lںڍڒڸ/ٸ;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final ب()Lںڍڒڸ/ٵ;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/ٱ;->إ:Lںڍڒڸ/ٵ;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "job"

    invoke-static {v0}, Lڗًقڔ/؋;->ڄ(Ljava/lang/String;)V

    const/4 v0, 0x0

    throw v0
.end method

.method public abstract ة(Ljava/lang/Throwable;)V
.end method
