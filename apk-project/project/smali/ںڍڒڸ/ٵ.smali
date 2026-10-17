.class public Lںڍڒڸ/ٵ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ى;
.implements Lںڍڒڸ/ث;
.implements Lںڍڒڸ/ٻ;


# static fields
.field public static final آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _parentHandle:Ljava/lang/Object;

.field private volatile _state:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "_state"

    const-class v1, Lںڍڒڸ/ٵ;

    const-class v2, Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_parentHandle"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    sget-object p1, Lںڍڒڸ/ش;->ج:Lںڍڒڸ/ؼ;

    goto :goto_0

    :cond_0
    sget-object p1, Lںڍڒڸ/ش;->ث:Lںڍڒڸ/ؼ;

    :goto_0
    iput-object p1, p0, Lںڍڒڸ/ٵ;->_state:Ljava/lang/Object;

    return-void
.end method

.method public static ؿ(Lھۥٓڍچ/ب;)Lںڍڒڸ/ت;
    .locals 1

    :goto_0
    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ا()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ئ()Lھۥٓڍچ/ب;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lھۥٓڍچ/ب;->إ()Lھۥٓڍچ/ب;

    move-result-object p0

    invoke-virtual {p0}, Lھۥٓڍچ/ب;->ا()Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Lںڍڒڸ/ت;

    if-eqz v0, :cond_1

    check-cast p0, Lںڍڒڸ/ت;

    return-object p0

    :cond_1
    instance-of v0, p0, Lںڍڒڸ/ٸ;

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0
.end method

.method public static م(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    instance-of v0, p0, Lںڍڒڸ/ٳ;

    if-eqz v0, :cond_1

    check-cast p0, Lںڍڒڸ/ٳ;

    invoke-virtual {p0}, Lںڍڒڸ/ٳ;->أ()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "Cancelling"

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lںڍڒڸ/ٳ;->ؤ()Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "Completing"

    goto :goto_0

    :cond_1
    instance-of v0, p0, Lںڍڒڸ/م;

    if-eqz v0, :cond_4

    check-cast p0, Lںڍڒڸ/م;

    invoke-interface {p0}, Lںڍڒڸ/م;->؋()Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    const-string p0, "Active"

    goto :goto_0

    :cond_3
    const-string p0, "New"

    goto :goto_0

    :cond_4
    instance-of p0, p0, Lںڍڒڸ/خ;

    if-eqz p0, :cond_5

    const-string p0, "Cancelled"

    goto :goto_0

    :cond_5
    const-string p0, "Completed"

    :goto_0
    return-object p0
.end method


# virtual methods
.method public final fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p2, p1, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->خ(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    return-object p1
.end method

.method public final getKey()Lڨڡئٸت/ئ;
    .locals 1

    sget-object v0, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    return-object v0
.end method

.method public final minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/ء;->ص(Lڨڡئٸت/إ;Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ؾ()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x7b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lںڍڒڸ/ٵ;->م(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public ؋()Z
    .locals 2

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/م;

    if-eqz v1, :cond_0

    check-cast v0, Lںڍڒڸ/م;

    invoke-interface {v0}, Lںڍڒڸ/م;->؋()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public ء(Ljava/util/concurrent/CancellationException;)V
    .locals 2

    if-nez p1, :cond_0

    new-instance p1, Lںڍڒڸ/ي;

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->خ()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    :cond_0
    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ج(Ljava/util/concurrent/CancellationException;)V

    return-void
.end method

.method public final ب(Ljava/lang/Object;Lںڍڒڸ/ٸ;Lںڍڒڸ/ٱ;)Z
    .locals 5

    new-instance v0, Lںڍڒڸ/ٴ;

    invoke-direct {v0, p3, p0, p1}, Lںڍڒڸ/ٴ;-><init>(Lھۥٓڍچ/ب;Lںڍڒڸ/ٵ;Ljava/lang/Object;)V

    :goto_0
    invoke-virtual {p2}, Lھۥٓڍچ/ب;->ئ()Lھۥٓڍچ/ب;

    move-result-object p1

    sget-object v1, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p3, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p3, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p2, v0, Lںڍڒڸ/ٴ;->ء:Lھۥٓڍچ/ب;

    :cond_0
    invoke-virtual {v1, p1, p2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    move v1, v4

    goto :goto_1

    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p2, :cond_0

    move v1, v3

    :goto_1
    const/4 v2, 0x2

    if-nez v1, :cond_2

    move p1, v3

    goto :goto_2

    :cond_2
    invoke-virtual {v0, p1}, Lھۥٓڍچ/؋;->؋(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_3

    move p1, v4

    goto :goto_2

    :cond_3
    move p1, v2

    :goto_2
    if-eq p1, v4, :cond_4

    if-eq p1, v2, :cond_5

    goto :goto_0

    :cond_4
    move v3, v4

    :cond_5
    return v3
.end method

.method public ة(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public ت(Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ة(Ljava/lang/Object;)V

    return-void
.end method

.method public final ث(Ljava/lang/Object;)Z
    .locals 9

    sget-object v0, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ص()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    :cond_0
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/م;

    if-eqz v1, :cond_2

    instance-of v1, v0, Lںڍڒڸ/ٳ;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lںڍڒڸ/ٳ;

    invoke-virtual {v1}, Lںڍڒڸ/ٳ;->ؤ()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v1, Lںڍڒڸ/خ;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ر(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    invoke-virtual {p0, v0, v1}, Lںڍڒڸ/ٵ;->ن(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_2
    :goto_0
    sget-object v0, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    :goto_1
    sget-object v1, Lںڍڒڸ/ش;->ا:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v1, :cond_3

    return v3

    :cond_3
    sget-object v1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v1, :cond_13

    const/4 v0, 0x0

    move-object v1, v0

    :cond_4
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lںڍڒڸ/ٳ;

    if-eqz v5, :cond_9

    monitor-enter v4

    :try_start_0
    move-object v5, v4

    check-cast v5, Lںڍڒڸ/ٳ;

    sget-object v6, Lںڍڒڸ/ٳ;->إ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lںڍڒڸ/ش;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v5, v6, :cond_5

    move v5, v3

    goto :goto_2

    :cond_5
    move v5, v2

    :goto_2
    if-eqz v5, :cond_6

    sget-object p1, Lںڍڒڸ/ش;->ة:Lئٱنۃؖۊڄئ/آ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v4

    goto/16 :goto_7

    :cond_6
    :try_start_1
    move-object v5, v4

    check-cast v5, Lںڍڒڸ/ٳ;

    invoke-virtual {v5}, Lںڍڒڸ/ٳ;->أ()Z

    move-result v5

    if-nez v1, :cond_7

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ر(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    :cond_7
    move-object p1, v4

    check-cast p1, Lںڍڒڸ/ٳ;

    invoke-virtual {p1, v1}, Lںڍڒڸ/ٳ;->ؠ(Ljava/lang/Throwable;)V

    move-object p1, v4

    check-cast p1, Lںڍڒڸ/ٳ;

    invoke-virtual {p1}, Lںڍڒڸ/ٳ;->آ()Ljava/lang/Throwable;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    xor-int/lit8 v1, v5, 0x1

    if-eqz v1, :cond_8

    move-object v0, p1

    :cond_8
    monitor-exit v4

    if-eqz v0, :cond_f

    check-cast v4, Lںڍڒڸ/ٳ;

    iget-object p1, v4, Lںڍڒڸ/ٳ;->آ:Lںڍڒڸ/ٸ;

    invoke-virtual {p0, p1, v0}, Lںڍڒڸ/ٵ;->ـ(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V

    goto :goto_6

    :catchall_0
    move-exception p1

    monitor-exit v4

    throw p1

    :cond_9
    instance-of v5, v4, Lںڍڒڸ/م;

    if-eqz v5, :cond_12

    if-nez v1, :cond_a

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ر(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    :cond_a
    move-object v5, v4

    check-cast v5, Lںڍڒڸ/م;

    invoke-interface {v5}, Lںڍڒڸ/م;->؋()Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-virtual {p0, v5}, Lںڍڒڸ/ٵ;->ض(Lںڍڒڸ/م;)Lںڍڒڸ/ٸ;

    move-result-object v6

    if-nez v6, :cond_b

    goto :goto_4

    :cond_b
    new-instance v7, Lںڍڒڸ/ٳ;

    invoke-direct {v7, v6, v1}, Lںڍڒڸ/ٳ;-><init>(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V

    :cond_c
    sget-object v4, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v4, p0, v5, v7}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    move v4, v3

    goto :goto_3

    :cond_d
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v5, :cond_c

    move v4, v2

    :goto_3
    if-nez v4, :cond_e

    :goto_4
    move v4, v2

    goto :goto_5

    :cond_e
    invoke-virtual {p0, v6, v1}, Lںڍڒڸ/ٵ;->ـ(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V

    move v4, v3

    :goto_5
    if-eqz v4, :cond_4

    :cond_f
    :goto_6
    sget-object p1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    goto :goto_7

    :cond_10
    new-instance v5, Lںڍڒڸ/خ;

    invoke-direct {v5, v2, v1}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    invoke-virtual {p0, v4, v5}, Lںڍڒڸ/ٵ;->ن(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-eq v5, v6, :cond_11

    sget-object v4, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;

    if-eq v5, v4, :cond_4

    move-object v0, v5

    goto :goto_8

    :cond_11
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot happen in "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_12
    sget-object p1, Lںڍڒڸ/ش;->ة:Lئٱنۃؖۊڄئ/آ;

    :goto_7
    move-object v0, p1

    :cond_13
    :goto_8
    sget-object p1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p1, :cond_14

    goto :goto_9

    :cond_14
    sget-object p1, Lںڍڒڸ/ش;->ا:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p1, :cond_15

    goto :goto_9

    :cond_15
    sget-object p1, Lںڍڒڸ/ش;->ة:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p1, :cond_16

    goto :goto_a

    :cond_16
    invoke-virtual {p0, v0}, Lںڍڒڸ/ٵ;->ة(Ljava/lang/Object;)V

    :goto_9
    move v2, v3

    :goto_a
    return v2
.end method

.method public ج(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ث(Ljava/lang/Object;)Z

    return-void
.end method

.method public final ح(Ljava/lang/Throwable;)Z
    .locals 4

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ؼ()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    sget-object v2, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lںڍڒڸ/ة;

    if-eqz v2, :cond_4

    sget-object v3, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    if-ne v2, v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {v2, p1}, Lںڍڒڸ/ة;->ؠ(Ljava/lang/Throwable;)Z

    move-result p1

    if-nez p1, :cond_3

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_0
    return v1

    :cond_4
    :goto_1
    return v0
.end method

.method public خ()Ljava/lang/String;
    .locals 1

    const-string v0, "Job was cancelled"

    return-object v0
.end method

.method public د(Ljava/lang/Throwable;)Z
    .locals 2

    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ث(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ش()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final ذ(Lںڍڒڸ/م;Ljava/lang/Object;)V
    .locals 7

    sget-object v0, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ة;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lںڍڒڸ/ػ;->dispose()V

    sget-object v1, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    instance-of v0, p2, Lںڍڒڸ/خ;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p2, Lںڍڒڸ/خ;

    goto :goto_0

    :cond_1
    move-object p2, v1

    :goto_0
    if-eqz p2, :cond_2

    iget-object p2, p2, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    goto :goto_1

    :cond_2
    move-object p2, v1

    :goto_1
    instance-of v0, p1, Lںڍڒڸ/ٱ;

    const-string v2, " for "

    const-string v3, "Exception in completion handler "

    if-eqz v0, :cond_3

    :try_start_0
    move-object v0, p1

    check-cast v0, Lںڍڒڸ/ٱ;

    invoke-virtual {v0, p2}, Lںڍڒڸ/ٱ;->ة(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception p2

    new-instance v0, Lرسٗ/ؠ;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lںڍڒڸ/ٵ;->ع(Lرسٗ/ؠ;)V

    goto :goto_4

    :cond_3
    invoke-interface {p1}, Lںڍڒڸ/م;->ء()Lںڍڒڸ/ٸ;

    move-result-object p1

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v0

    const-string v4, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode{ kotlinx.coroutines.internal.LockFreeLinkedListKt.Node }"

    invoke-static {v0, v4}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lھۥٓڍچ/ب;

    :goto_2
    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    instance-of v4, v0, Lںڍڒڸ/ٱ;

    if-eqz v4, :cond_5

    move-object v4, v0

    check-cast v4, Lںڍڒڸ/ٱ;

    :try_start_1
    invoke-virtual {v4, p2}, Lںڍڒڸ/ٱ;->ة(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v5

    if-eqz v1, :cond_4

    invoke-static {v1, v5}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_4
    new-instance v1, Lرسٗ/ؠ;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v5}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_3
    invoke-virtual {v0}, Lھۥٓڍچ/ب;->إ()Lھۥٓڍچ/ب;

    move-result-object v0

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_7

    invoke-virtual {p0, v1}, Lںڍڒڸ/ٵ;->ع(Lرسٗ/ؠ;)V

    :cond_7
    :goto_4
    return-void
.end method

.method public final ر(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 4

    instance-of v0, p1, Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/Throwable;

    goto :goto_1

    :cond_0
    check-cast p1, Lںڍڒڸ/ٻ;

    check-cast p1, Lںڍڒڸ/ٵ;

    invoke-virtual {p1}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/ٳ;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lںڍڒڸ/ٳ;

    invoke-virtual {v1}, Lںڍڒڸ/ٳ;->آ()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_0

    :cond_1
    instance-of v1, v0, Lںڍڒڸ/خ;

    if-eqz v1, :cond_2

    move-object v1, v0

    check-cast v1, Lںڍڒڸ/خ;

    iget-object v1, v1, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    goto :goto_0

    :cond_2
    instance-of v1, v0, Lںڍڒڸ/م;

    if-nez v1, :cond_5

    move-object v1, v2

    :goto_0
    instance-of v3, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v3, :cond_3

    move-object v2, v1

    check-cast v2, Ljava/util/concurrent/CancellationException;

    :cond_3
    if-nez v2, :cond_4

    new-instance v2, Lںڍڒڸ/ي;

    invoke-static {v0}, Lںڍڒڸ/ٵ;->م(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Parent job is "

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1, p1}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    :cond_4
    move-object p1, v2

    :goto_1
    return-object p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cannot be cancelling child in this state: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ز(Lںڍڒڸ/ٳ;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    instance-of v0, p2, Lںڍڒڸ/خ;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lںڍڒڸ/خ;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, v0, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    monitor-enter p1

    :try_start_0
    invoke-virtual {p1}, Lںڍڒڸ/ٳ;->أ()Z

    invoke-virtual {p1, v0}, Lںڍڒڸ/ٳ;->إ(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lںڍڒڸ/ٳ;->أ()Z

    move-result v3

    if-eqz v3, :cond_6

    new-instance v3, Lںڍڒڸ/ي;

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->خ()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, v1, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    move-object v1, v3

    goto :goto_2

    :cond_2
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/Throwable;

    instance-of v7, v7, Ljava/util/concurrent/CancellationException;

    xor-int/2addr v7, v4

    if-eqz v7, :cond_3

    move-object v1, v6

    :cond_4
    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    :cond_6
    :goto_2
    if-eqz v1, :cond_9

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-gt v3, v4, :cond_7

    goto :goto_4

    :cond_7
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-instance v6, Ljava/util/IdentityHashMap;

    invoke-direct {v6, v3}, Ljava/util/IdentityHashMap;-><init>(I)V

    invoke-static {v6}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Throwable;

    if-eq v6, v1, :cond_8

    if-eq v6, v1, :cond_8

    instance-of v7, v6, Ljava/util/concurrent/CancellationException;

    if-nez v7, :cond_8

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-static {v1, v6}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :cond_9
    :goto_4
    monitor-exit p1

    if-nez v1, :cond_a

    goto :goto_5

    :cond_a
    if-ne v1, v0, :cond_b

    goto :goto_5

    :cond_b
    new-instance p2, Lںڍڒڸ/خ;

    invoke-direct {p2, v5, v1}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    :goto_5
    if-eqz v1, :cond_e

    invoke-virtual {p0, v1}, Lںڍڒڸ/ٵ;->ح(Ljava/lang/Throwable;)Z

    move-result v0

    if-nez v0, :cond_d

    invoke-virtual {p0, v1}, Lںڍڒڸ/ٵ;->ظ(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_c

    goto :goto_6

    :cond_c
    move v0, v5

    goto :goto_7

    :cond_d
    :goto_6
    move v0, v4

    :goto_7
    if-eqz v0, :cond_e

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p2

    check-cast v0, Lںڍڒڸ/خ;

    sget-object v1, Lںڍڒڸ/خ;->ؠ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v1, v0, v5, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    :cond_e
    invoke-virtual {p0, p2}, Lںڍڒڸ/ٵ;->ف(Ljava/lang/Object;)V

    sget-object v0, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    instance-of v1, p2, Lںڍڒڸ/م;

    if-eqz v1, :cond_f

    new-instance v1, Lںڍڒڸ/ن;

    move-object v2, p2

    check-cast v2, Lںڍڒڸ/م;

    invoke-direct {v1, v2}, Lںڍڒڸ/ن;-><init>(Lںڍڒڸ/م;)V

    goto :goto_8

    :cond_f
    move-object v1, p2

    :cond_10
    :goto_8
    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    goto :goto_9

    :cond_11
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_10

    :goto_9
    invoke-virtual {p0, p1, p2}, Lںڍڒڸ/ٵ;->ذ(Lںڍڒڸ/م;Ljava/lang/Object;)V

    return-object p2

    :catchall_0
    move-exception p2

    monitor-exit p1

    throw p2
.end method

.method public final س()Ljava/util/concurrent/CancellationException;
    .locals 4

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/ٳ;

    const/4 v2, 0x0

    const-string v3, "Job is still new or active: "

    if-eqz v1, :cond_3

    check-cast v0, Lںڍڒڸ/ٳ;

    invoke-virtual {v0}, Lںڍڒڸ/ٳ;->آ()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v3, " is cancelling"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    instance-of v3, v0, Ljava/util/concurrent/CancellationException;

    if-eqz v3, :cond_0

    move-object v2, v0

    check-cast v2, Ljava/util/concurrent/CancellationException;

    :cond_0
    if-nez v2, :cond_6

    new-instance v2, Lںڍڒڸ/ي;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->خ()Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-direct {v2, v1, v0, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    instance-of v1, v0, Lںڍڒڸ/م;

    if-nez v1, :cond_7

    instance-of v1, v0, Lںڍڒڸ/خ;

    if-eqz v1, :cond_5

    check-cast v0, Lںڍڒڸ/خ;

    iget-object v0, v0, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    instance-of v1, v0, Ljava/util/concurrent/CancellationException;

    if-eqz v1, :cond_4

    move-object v2, v0

    check-cast v2, Ljava/util/concurrent/CancellationException;

    :cond_4
    if-nez v2, :cond_6

    new-instance v1, Lںڍڒڸ/ي;

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->خ()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    move-object v2, v1

    goto :goto_0

    :cond_5
    new-instance v0, Lںڍڒڸ/ي;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v3, " has completed normally"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v2, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    move-object v2, v0

    :cond_6
    :goto_0
    return-object v2

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public ش()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public ص()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final ض(Lںڍڒڸ/م;)Lںڍڒڸ/ٸ;
    .locals 3

    invoke-interface {p1}, Lںڍڒڸ/م;->ء()Lںڍڒڸ/ٸ;

    move-result-object v0

    if-nez v0, :cond_2

    instance-of v0, p1, Lںڍڒڸ/ؼ;

    if-eqz v0, :cond_0

    new-instance v0, Lںڍڒڸ/ٸ;

    invoke-direct {v0}, Lںڍڒڸ/ٸ;-><init>()V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lںڍڒڸ/ٱ;

    if-eqz v0, :cond_1

    check-cast p1, Lںڍڒڸ/ٱ;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ك(Lںڍڒڸ/ٱ;)V

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "State should have list: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    return-object v0
.end method

.method public final ط()Ljava/lang/Object;
    .locals 2

    :goto_0
    sget-object v0, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

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

.method public ظ(Ljava/lang/Throwable;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public ع(Lرسٗ/ؠ;)V
    .locals 0

    throw p1
.end method

.method public final غ(Lںڍڒڸ/ى;)V
    .locals 5

    sget-object v0, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    sget-object v1, Lںڍڒڸ/ٵ;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    if-nez p1, :cond_0

    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_0
    check-cast p1, Lںڍڒڸ/ٵ;

    :goto_0
    invoke-virtual {p1}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Lںڍڒڸ/ٵ;->ل(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    if-eq v2, v3, :cond_1

    goto :goto_0

    :cond_1
    new-instance v2, Lںڍڒڸ/ت;

    invoke-direct {v2, p0}, Lںڍڒڸ/ت;-><init>(Lںڍڒڸ/ٵ;)V

    const/4 v4, 0x2

    invoke-static {p1, v3, v2, v4}, Lڗًقڔ/؋;->ف(Lںڍڒڸ/ى;ZLںڍڒڸ/ٱ;I)Lںڍڒڸ/ػ;

    move-result-object p1

    check-cast p1, Lںڍڒڸ/ة;

    invoke-virtual {v1, p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lںڍڒڸ/م;

    xor-int/2addr v2, v3

    if-eqz v2, :cond_2

    invoke-interface {p1}, Lںڍڒڸ/ػ;->dispose()V

    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public final ػ(ZZLڲٱۘۑدٿٰ/ت;)Lںڍڒڸ/ػ;
    .locals 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    instance-of v2, p3, Lںڍڒڸ/ٮ;

    if-eqz v2, :cond_0

    move-object v2, p3

    check-cast v2, Lںڍڒڸ/ٮ;

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    if-nez v2, :cond_4

    new-instance v2, Lںڍڒڸ/ه;

    invoke-direct {v2, p3}, Lںڍڒڸ/ه;-><init>(Lڲٱۘۑدٿٰ/ت;)V

    goto :goto_2

    :cond_1
    instance-of v2, p3, Lںڍڒڸ/ٱ;

    if-eqz v2, :cond_2

    move-object v2, p3

    check-cast v2, Lںڍڒڸ/ٱ;

    goto :goto_1

    :cond_2
    move-object v2, v1

    :goto_1
    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    new-instance v2, Lںڍڒڸ/و;

    invoke-direct {v2, v0, p3}, Lںڍڒڸ/و;-><init>(ILjava/lang/Object;)V

    :cond_4
    :goto_2
    iput-object p0, v2, Lںڍڒڸ/ٱ;->إ:Lںڍڒڸ/ٵ;

    :cond_5
    :goto_3
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Lںڍڒڸ/ؼ;

    if-eqz v4, :cond_c

    move-object v4, v3

    check-cast v4, Lںڍڒڸ/ؼ;

    iget-boolean v5, v4, Lںڍڒڸ/ؼ;->آ:Z

    if-eqz v5, :cond_8

    sget-object v5, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    :cond_6
    invoke-virtual {v5, p0, v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    const/4 v3, 0x1

    goto :goto_4

    :cond_7
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v3, :cond_6

    move v3, v0

    :goto_4
    if-eqz v3, :cond_5

    return-object v2

    :cond_8
    new-instance v3, Lںڍڒڸ/ٸ;

    invoke-direct {v3}, Lںڍڒڸ/ٸ;-><init>()V

    iget-boolean v5, v4, Lںڍڒڸ/ؼ;->آ:Z

    if-eqz v5, :cond_9

    goto :goto_5

    :cond_9
    new-instance v5, Lںڍڒڸ/ل;

    invoke-direct {v5, v3}, Lںڍڒڸ/ل;-><init>(Lںڍڒڸ/ٸ;)V

    move-object v3, v5

    :cond_a
    :goto_5
    sget-object v5, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, p0, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    goto :goto_3

    :cond_b
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v4, :cond_a

    goto :goto_3

    :cond_c
    instance-of v4, v3, Lںڍڒڸ/م;

    if-eqz v4, :cond_15

    move-object v4, v3

    check-cast v4, Lںڍڒڸ/م;

    invoke-interface {v4}, Lںڍڒڸ/م;->ء()Lںڍڒڸ/ٸ;

    move-result-object v4

    if-nez v4, :cond_d

    const-string v4, "null cannot be cast to non-null type kotlinx.coroutines.JobNode"

    invoke-static {v3, v4}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Lںڍڒڸ/ٱ;

    invoke-virtual {p0, v3}, Lںڍڒڸ/ٵ;->ك(Lںڍڒڸ/ٱ;)V

    goto :goto_3

    :cond_d
    sget-object v5, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    if-eqz p1, :cond_12

    instance-of v6, v3, Lںڍڒڸ/ٳ;

    if-eqz v6, :cond_12

    monitor-enter v3

    :try_start_0
    move-object v6, v3

    check-cast v6, Lںڍڒڸ/ٳ;

    invoke-virtual {v6}, Lںڍڒڸ/ٳ;->آ()Ljava/lang/Throwable;

    move-result-object v6

    if-eqz v6, :cond_e

    instance-of v7, p3, Lںڍڒڸ/ت;

    if-eqz v7, :cond_11

    move-object v7, v3

    check-cast v7, Lںڍڒڸ/ٳ;

    invoke-virtual {v7}, Lںڍڒڸ/ٳ;->ؤ()Z

    move-result v7

    if-nez v7, :cond_11

    :cond_e
    invoke-virtual {p0, v3, v4, v2}, Lںڍڒڸ/ٵ;->ب(Ljava/lang/Object;Lںڍڒڸ/ٸ;Lںڍڒڸ/ٱ;)Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_f

    monitor-exit v3

    goto/16 :goto_3

    :cond_f
    if-nez v6, :cond_10

    monitor-exit v3

    return-object v2

    :cond_10
    move-object v5, v2

    :cond_11
    monitor-exit v3

    goto :goto_6

    :catchall_0
    move-exception p1

    monitor-exit v3

    throw p1

    :cond_12
    move-object v6, v1

    :goto_6
    if-eqz v6, :cond_14

    if-eqz p2, :cond_13

    invoke-interface {p3, v6}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    return-object v5

    :cond_14
    invoke-virtual {p0, v3, v4, v2}, Lںڍڒڸ/ٵ;->ب(Ljava/lang/Object;Lںڍڒڸ/ٸ;Lںڍڒڸ/ٱ;)Z

    move-result v3

    if-eqz v3, :cond_5

    return-object v2

    :cond_15
    if-eqz p2, :cond_18

    instance-of p1, v3, Lںڍڒڸ/خ;

    if-eqz p1, :cond_16

    check-cast v3, Lںڍڒڸ/خ;

    goto :goto_7

    :cond_16
    move-object v3, v1

    :goto_7
    if-eqz v3, :cond_17

    iget-object v1, v3, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    :cond_17
    invoke-interface {p3, v1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    sget-object p1, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    return-object p1
.end method

.method public ؼ()Z
    .locals 0

    instance-of p0, p0, Lںڍڒڸ/ء;

    return p0
.end method

.method public final ؽ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    :cond_0
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lںڍڒڸ/ٵ;->ن(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v1, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Job "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is already complete or completing, but is being completed with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    instance-of v2, p1, Lںڍڒڸ/خ;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    check-cast p1, Lںڍڒڸ/خ;

    goto :goto_0

    :cond_1
    move-object p1, v3

    :goto_0
    if-eqz p1, :cond_2

    iget-object v3, p1, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    :cond_2
    invoke-direct {v0, v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_3
    sget-object v1, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v1, :cond_0

    return-object v0
.end method

.method public ؾ()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ـ(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V
    .locals 6

    invoke-virtual {p1}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode{ kotlinx.coroutines.internal.LockFreeLinkedListKt.Node }"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lھۥٓڍچ/ب;

    const/4 v1, 0x0

    :goto_0
    invoke-static {v0, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    instance-of v2, v0, Lںڍڒڸ/ٮ;

    if-eqz v2, :cond_1

    move-object v2, v0

    check-cast v2, Lںڍڒڸ/ٱ;

    :try_start_0
    invoke-virtual {v2, p2}, Lںڍڒڸ/ٱ;->ة(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v3

    if-eqz v1, :cond_0

    invoke-static {v1, v3}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    new-instance v1, Lرسٗ/ؠ;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Exception in completion handler "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    invoke-virtual {v0}, Lھۥٓڍچ/ب;->إ()Lھۥٓڍچ/ب;

    move-result-object v0

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {p0, v1}, Lںڍڒڸ/ٵ;->ع(Lرسٗ/ؠ;)V

    :cond_3
    invoke-virtual {p0, p2}, Lںڍڒڸ/ٵ;->ح(Ljava/lang/Throwable;)Z

    return-void
.end method

.method public ف(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public ق()V
    .locals 0

    return-void
.end method

.method public final ك(Lںڍڒڸ/ٱ;)V
    .locals 3

    new-instance v0, Lںڍڒڸ/ٸ;

    invoke-direct {v0}, Lںڍڒڸ/ٸ;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lھۥٓڍچ/ب;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lھۥٓڍچ/ب;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p1}, Lھۥٓڍچ/ب;->ؤ()Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v1, p1, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_1

    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_0

    invoke-virtual {v0, p1}, Lھۥٓڍچ/ب;->أ(Lھۥٓڍچ/ب;)V

    :goto_1
    invoke-virtual {p1}, Lھۥٓڍچ/ب;->إ()Lھۥٓڍچ/ب;

    move-result-object v2

    :cond_3
    sget-object v0, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0, p1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_3

    :goto_2
    return-void
.end method

.method public final ل(Ljava/lang/Object;)I
    .locals 6

    instance-of v0, p1, Lںڍڒڸ/ؼ;

    const/4 v1, -0x1

    sget-object v2, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lںڍڒڸ/ؼ;

    iget-boolean v0, v0, Lںڍڒڸ/ؼ;->آ:Z

    if-eqz v0, :cond_0

    return v4

    :cond_0
    sget-object v0, Lںڍڒڸ/ش;->ج:Lںڍڒڸ/ؼ;

    :cond_1
    invoke-virtual {v2, p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v4, v3

    goto :goto_0

    :cond_2
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, p1, :cond_1

    :goto_0
    if-nez v4, :cond_3

    return v1

    :cond_3
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ق()V

    return v3

    :cond_4
    instance-of v0, p1, Lںڍڒڸ/ل;

    if-eqz v0, :cond_8

    move-object v0, p1

    check-cast v0, Lںڍڒڸ/ل;

    iget-object v0, v0, Lںڍڒڸ/ل;->آ:Lںڍڒڸ/ٸ;

    :cond_5
    invoke-virtual {v2, p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    move v4, v3

    goto :goto_1

    :cond_6
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, p1, :cond_5

    :goto_1
    if-nez v4, :cond_7

    return v1

    :cond_7
    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ق()V

    return v3

    :cond_8
    return v4
.end method

.method public final ن(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    instance-of v0, p1, Lںڍڒڸ/م;

    if-nez v0, :cond_0

    sget-object p1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    return-object p1

    :cond_0
    instance-of v0, p1, Lںڍڒڸ/ؼ;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    instance-of v0, p1, Lںڍڒڸ/ٱ;

    if-eqz v0, :cond_7

    :cond_1
    instance-of v0, p1, Lںڍڒڸ/ت;

    if-nez v0, :cond_7

    instance-of v0, p2, Lںڍڒڸ/خ;

    if-nez v0, :cond_7

    move-object v0, p1

    check-cast v0, Lںڍڒڸ/م;

    instance-of p1, p2, Lںڍڒڸ/م;

    if-eqz p1, :cond_2

    new-instance p1, Lںڍڒڸ/ن;

    move-object v3, p2

    check-cast v3, Lںڍڒڸ/م;

    invoke-direct {p1, v3}, Lںڍڒڸ/ن;-><init>(Lںڍڒڸ/م;)V

    move-object v3, p1

    goto :goto_0

    :cond_2
    move-object v3, p2

    :cond_3
    :goto_0
    sget-object p1, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p0, v0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move p1, v1

    goto :goto_1

    :cond_4
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_3

    move p1, v2

    :goto_1
    if-nez p1, :cond_5

    move v1, v2

    goto :goto_2

    :cond_5
    invoke-virtual {p0, p2}, Lںڍڒڸ/ٵ;->ف(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p2}, Lںڍڒڸ/ٵ;->ذ(Lںڍڒڸ/م;Ljava/lang/Object;)V

    :goto_2
    if-eqz v1, :cond_6

    return-object p2

    :cond_6
    sget-object p1, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;

    return-object p1

    :cond_7
    check-cast p1, Lںڍڒڸ/م;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ض(Lںڍڒڸ/م;)Lںڍڒڸ/ٸ;

    move-result-object v0

    if-nez v0, :cond_8

    sget-object p1, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;

    goto/16 :goto_a

    :cond_8
    instance-of v3, p1, Lںڍڒڸ/ٳ;

    const/4 v4, 0x0

    if-eqz v3, :cond_9

    move-object v3, p1

    check-cast v3, Lںڍڒڸ/ٳ;

    goto :goto_3

    :cond_9
    move-object v3, v4

    :goto_3
    if-nez v3, :cond_a

    new-instance v3, Lںڍڒڸ/ٳ;

    invoke-direct {v3, v0, v4}, Lںڍڒڸ/ٳ;-><init>(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V

    :cond_a
    monitor-enter v3

    :try_start_0
    invoke-virtual {v3}, Lںڍڒڸ/ٳ;->ؤ()Z

    move-result v5

    if-eqz v5, :cond_b

    sget-object p1, Lںڍڒڸ/ش;->ئ:Lئٱنۃؖۊڄئ/آ;

    goto :goto_5

    :cond_b
    sget-object v5, Lںڍڒڸ/ٳ;->أ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v5, v3, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    if-eq v3, p1, :cond_e

    sget-object v5, Lںڍڒڸ/ٵ;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    :cond_c
    invoke-virtual {v5, p0, p1, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    move v2, v1

    goto :goto_4

    :cond_d
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, p1, :cond_c

    :goto_4
    if-nez v2, :cond_e

    sget-object p1, Lںڍڒڸ/ش;->ب:Lئٱنۃؖۊڄئ/آ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_5
    monitor-exit v3

    goto :goto_a

    :cond_e
    :try_start_1
    invoke-virtual {v3}, Lںڍڒڸ/ٳ;->أ()Z

    move-result v2

    instance-of v5, p2, Lںڍڒڸ/خ;

    if-eqz v5, :cond_f

    move-object v5, p2

    check-cast v5, Lںڍڒڸ/خ;

    goto :goto_6

    :cond_f
    move-object v5, v4

    :goto_6
    if-eqz v5, :cond_10

    iget-object v5, v5, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    invoke-virtual {v3, v5}, Lںڍڒڸ/ٳ;->ؠ(Ljava/lang/Throwable;)V

    :cond_10
    invoke-virtual {v3}, Lںڍڒڸ/ٳ;->آ()Ljava/lang/Throwable;

    move-result-object v5

    xor-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_11

    goto :goto_7

    :cond_11
    move-object v5, v4

    :goto_7
    monitor-exit v3

    if-eqz v5, :cond_12

    invoke-virtual {p0, v0, v5}, Lںڍڒڸ/ٵ;->ـ(Lںڍڒڸ/ٸ;Ljava/lang/Throwable;)V

    :cond_12
    instance-of v0, p1, Lںڍڒڸ/ت;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lںڍڒڸ/ت;

    goto :goto_8

    :cond_13
    move-object v0, v4

    :goto_8
    if-nez v0, :cond_14

    invoke-interface {p1}, Lںڍڒڸ/م;->ء()Lںڍڒڸ/ٸ;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-static {p1}, Lںڍڒڸ/ٵ;->ؿ(Lھۥٓڍچ/ب;)Lںڍڒڸ/ت;

    move-result-object v4

    goto :goto_9

    :cond_14
    move-object v4, v0

    :cond_15
    :goto_9
    if-eqz v4, :cond_16

    invoke-virtual {p0, v3, v4, p2}, Lںڍڒڸ/ٵ;->ه(Lںڍڒڸ/ٳ;Lںڍڒڸ/ت;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_16

    sget-object p1, Lںڍڒڸ/ش;->ا:Lئٱنۃؖۊڄئ/آ;

    goto :goto_a

    :cond_16
    invoke-virtual {p0, v3, p2}, Lںڍڒڸ/ٵ;->ز(Lںڍڒڸ/ٳ;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_a
    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v3

    throw p1
.end method

.method public final ه(Lںڍڒڸ/ٳ;Lںڍڒڸ/ت;Ljava/lang/Object;)Z
    .locals 4

    :cond_0
    new-instance v0, Lںڍڒڸ/ٲ;

    invoke-direct {v0, p0, p1, p2, p3}, Lںڍڒڸ/ٲ;-><init>(Lںڍڒڸ/ٵ;Lںڍڒڸ/ٳ;Lںڍڒڸ/ت;Ljava/lang/Object;)V

    iget-object v1, p2, Lںڍڒڸ/ت;->ئ:Lںڍڒڸ/ث;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v2, v0, v3}, Lڗًقڔ/؋;->ف(Lںڍڒڸ/ى;ZLںڍڒڸ/ٱ;I)Lںڍڒڸ/ػ;

    move-result-object v0

    sget-object v1, Lںڍڒڸ/ٹ;->آ:Lںڍڒڸ/ٹ;

    if-eq v0, v1, :cond_1

    return v3

    :cond_1
    invoke-static {p2}, Lںڍڒڸ/ٵ;->ؿ(Lھۥٓڍچ/ب;)Lںڍڒڸ/ت;

    move-result-object p2

    if-nez p2, :cond_0

    return v2
.end method
