.class public Lھۥٓڍچ/ب;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ؤ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _next:Ljava/lang/Object;

.field private volatile _prev:Ljava/lang/Object;

.field private volatile _removedRef:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "_next"

    const-class v1, Lھۥٓڍچ/ب;

    const-class v2, Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_prev"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_removedRef"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/ب;->ؤ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p0, p0, Lھۥٓڍچ/ب;->_next:Ljava/lang/Object;

    iput-object p0, p0, Lھۥٓڍچ/ب;->_prev:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Lھۥٓڍچ/ا;

    invoke-direct {v1, p0}, Lھۥٓڍچ/ا;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final آ()Lھۥٓڍچ/ب;
    .locals 11

    :goto_0
    sget-object v0, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lھۥٓڍچ/ب;

    move-object v2, v1

    :goto_1
    const/4 v3, 0x0

    move-object v4, v3

    :goto_2
    sget-object v5, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne v6, p0, :cond_3

    if-ne v1, v2, :cond_0

    return-object v2

    :cond_0
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v7, v8

    goto :goto_3

    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v1, :cond_0

    :goto_3
    if-nez v7, :cond_2

    goto :goto_0

    :cond_2
    return-object v2

    :cond_3
    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ا()Z

    move-result v9

    if-eqz v9, :cond_4

    return-object v3

    :cond_4
    if-nez v6, :cond_5

    return-object v2

    :cond_5
    instance-of v9, v6, Lھۥٓڍچ/خ;

    if-eqz v9, :cond_6

    check-cast v6, Lھۥٓڍچ/خ;

    invoke-virtual {v6, v2}, Lھۥٓڍچ/خ;->؋(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_6
    instance-of v9, v6, Lھۥٓڍچ/د;

    if-eqz v9, :cond_b

    if-eqz v4, :cond_a

    check-cast v6, Lھۥٓڍچ/د;

    iget-object v6, v6, Lھۥٓڍچ/د;->؋:Lھۥٓڍچ/ب;

    :cond_7
    invoke-virtual {v5, v4, v2, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    move v7, v8

    goto :goto_4

    :cond_8
    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v2, :cond_7

    :goto_4
    if-nez v7, :cond_9

    goto :goto_0

    :cond_9
    move-object v2, v4

    goto :goto_1

    :cond_a
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lھۥٓڍچ/ب;

    goto :goto_2

    :cond_b
    const-string v4, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode{ kotlinx.coroutines.internal.LockFreeLinkedListKt.Node }"

    invoke-static {v6, v4}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, v6

    check-cast v4, Lھۥٓڍچ/ب;

    move-object v10, v4

    move-object v4, v2

    move-object v2, v10

    goto :goto_2
.end method

.method public final أ(Lھۥٓڍچ/ب;)V
    .locals 3

    :cond_0
    sget-object v0, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lھۥٓڍچ/ب;

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0, p1, v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ا()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lھۥٓڍچ/ب;->آ()Lھۥٓڍچ/ب;

    :cond_3
    return-void
.end method

.method public final ؤ()Ljava/lang/Object;
    .locals 2

    :goto_0
    sget-object v0, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lھۥٓڍچ/خ;

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    check-cast v0, Lھۥٓڍچ/خ;

    invoke-virtual {v0, p0}, Lھۥٓڍچ/خ;->؋(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public final إ()Lھۥٓڍچ/ب;
    .locals 2

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lھۥٓڍچ/د;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lھۥٓڍچ/د;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    iget-object v1, v1, Lھۥٓڍچ/د;->؋:Lھۥٓڍچ/ب;

    if-nez v1, :cond_2

    :cond_1
    const-string v1, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode{ kotlinx.coroutines.internal.LockFreeLinkedListKt.Node }"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, v0

    check-cast v1, Lھۥٓڍچ/ب;

    :cond_2
    return-object v1
.end method

.method public final ئ()Lھۥٓڍچ/ب;
    .locals 3

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->آ()Lھۥٓڍچ/ب;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v1, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lھۥٓڍچ/ب;

    :goto_0
    invoke-virtual {v0}, Lھۥٓڍچ/ب;->ا()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lھۥٓڍچ/ب;

    goto :goto_0

    :cond_1
    :goto_1
    return-object v0
.end method

.method public ا()Z
    .locals 1

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lھۥٓڍچ/د;

    return v0
.end method
