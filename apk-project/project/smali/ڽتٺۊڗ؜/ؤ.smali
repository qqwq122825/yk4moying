.class public Lڽتٺۊڗ؜/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڽتٺۊڗ؜/ب;


# static fields
.field public static final ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final ئ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final ا:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ث:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final ج:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _closeCause:Ljava/lang/Object;

.field private volatile bufferEnd:J

.field private volatile bufferEndSegment:Ljava/lang/Object;

.field private volatile closeHandler:Ljava/lang/Object;

.field private volatile completedExpandBuffersAndPauseFlag:J

.field private volatile receiveSegment:Ljava/lang/Object;

.field private volatile receivers:J

.field private volatile sendSegment:Ljava/lang/Object;

.field private volatile sendersAndCloseStatus:J

.field public final آ:I

.field public final أ:Lڲٱۘۑدٿٰ/ت;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-string v0, "sendersAndCloseStatus"

    const-class v1, Lڽتٺۊڗ؜/ؤ;

    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-string v0, "receivers"

    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-string v0, "bufferEnd"

    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ئ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-string v0, "completedExpandBuffersAndPauseFlag"

    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ا:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-string v0, "sendSegment"

    const-class v2, Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "receiveSegment"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "bufferEndSegment"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_closeCause"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ث:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "closeHandler"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lڽتٺۊڗ؜/ؤ;->ج:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(ILڲٱۘۑدٿٰ/ت;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lڽتٺۊڗ؜/ؤ;->آ:I

    iput-object p2, p0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-ltz p1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_4

    sget-object p2, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    if-eqz p1, :cond_2

    const p2, 0x7fffffff

    if-eq p1, p2, :cond_1

    int-to-long p1, p1

    goto :goto_1

    :cond_1
    const-wide p1, 0x7fffffffffffffffL

    goto :goto_1

    :cond_2
    const-wide/16 p1, 0x0

    :goto_1
    iput-wide p1, p0, Lڽتٺۊڗ؜/ؤ;->bufferEnd:J

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide p1

    iput-wide p1, p0, Lڽتٺۊڗ؜/ؤ;->completedExpandBuffersAndPauseFlag:J

    new-instance p1, Lڽتٺۊڗ؜/ج;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x3

    move-object v0, p1

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lڽتٺۊڗ؜/ج;-><init>(JLڽتٺۊڗ؜/ج;Lڽتٺۊڗ؜/ؤ;I)V

    iput-object p1, p0, Lڽتٺۊڗ؜/ؤ;->sendSegment:Ljava/lang/Object;

    iput-object p1, p0, Lڽتٺۊڗ؜/ؤ;->receiveSegment:Ljava/lang/Object;

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ظ()Z

    move-result p2

    if-eqz p2, :cond_3

    sget-object p1, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    const-string p2, "null cannot be cast to non-null type kotlinx.coroutines.channels.ChannelSegment<E of kotlinx.coroutines.channels.BufferedChannel>"

    invoke-static {p1, p2}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3
    iput-object p1, p0, Lڽتٺۊڗ؜/ؤ;->bufferEndSegment:Ljava/lang/Object;

    sget-object p1, Lڽتٺۊڗ؜/ئ;->ر:Lئٱنۃؖۊڄئ/آ;

    iput-object p1, p0, Lڽتٺۊڗ؜/ؤ;->_closeCause:Ljava/lang/Object;

    return-void

    :cond_4
    const-string p2, "Invalid channel capacity: "

    const-string v0, ", should be >=0"

    invoke-static {p2, p1, v0}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static final ؋(Lڽتٺۊڗ؜/ؤ;JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;
    .locals 8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    sget-object v0, Lڽتٺۊڗ؜/إ;->آ:Lڽتٺۊڗ؜/إ;

    :cond_0
    invoke-static {p3, p1, p2}, Lسۄھؤۏ۫/؋;->د(Lھۥٓڍچ/ز;J)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object v1

    :cond_1
    :goto_0
    sget-object v2, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lھۥٓڍچ/ز;

    iget-wide v4, v3, Lھۥٓڍچ/ز;->ؤ:J

    iget-wide v6, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v4, v4, v6

    const/4 v5, 0x1

    if-ltz v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Lھۥٓڍچ/ز;->ا()Z

    move-result v4

    const/4 v6, 0x0

    if-nez v4, :cond_3

    move v5, v6

    goto :goto_2

    :cond_3
    invoke-virtual {v2, p0, v3, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move v6, v5

    goto :goto_1

    :cond_4
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v3, :cond_3

    :goto_1
    if-eqz v6, :cond_6

    invoke-virtual {v3}, Lھۥٓڍچ/ز;->أ()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v3}, Lھۥٓڍچ/ء;->آ()V

    :cond_5
    :goto_2
    if-eqz v5, :cond_0

    goto :goto_3

    :cond_6
    invoke-virtual {v1}, Lھۥٓڍچ/ز;->أ()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lھۥٓڍچ/ء;->آ()V

    goto :goto_0

    :cond_7
    :goto_3
    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->إ()Z

    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v0, p1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-gez p0, :cond_b

    goto :goto_5

    :cond_8
    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object p3

    check-cast p3, Lڽتٺۊڗ؜/ج;

    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long p1, v0, p1

    if-lez p1, :cond_c

    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    mul-long/2addr v0, p1

    :cond_9
    sget-object v2, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    const-wide p1, 0xfffffffffffffffL

    and-long/2addr p1, v4

    cmp-long v3, p1, v0

    if-ltz v3, :cond_a

    goto :goto_4

    :cond_a
    const/16 v3, 0x3c

    shr-long v6, v4, v3

    long-to-int v6, v6

    sget-object v7, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    int-to-long v6, v6

    shl-long/2addr v6, v3

    add-long/2addr v6, p1

    move-object v3, p0

    invoke-virtual/range {v2 .. v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result p1

    if-eqz p1, :cond_9

    :goto_4
    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v0, p1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-gez p0, :cond_b

    :goto_5
    invoke-virtual {p3}, Lھۥٓڍچ/ء;->؋()V

    :cond_b
    const/4 p3, 0x0

    :cond_c
    return-object p3
.end method

.method public static final ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p2, p3}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    if-eqz p7, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_3

    invoke-virtual {p0, p4, p5}, Lڽتٺۊڗ؜/ؤ;->ة(J)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v2, v0}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_1

    :cond_1
    if-nez p6, :cond_2

    const/4 v1, 0x3

    goto :goto_1

    :cond_2
    invoke-virtual {p1, p2, v2, p6}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v1, 0x2

    goto :goto_1

    :cond_3
    instance-of v3, v0, Lںڍڒڸ/ڃ;

    if-eqz v3, :cond_6

    invoke-virtual {p1, p2, v2}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    invoke-virtual {p0, v0, p3}, Lڽتٺۊڗ؜/ؤ;->ؾ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    sget-object p0, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, p0}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    const/4 v1, 0x0

    goto :goto_1

    :cond_4
    sget-object p0, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    iget-object p3, p1, Lڽتٺۊڗ؜/ج;->ا:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    mul-int/lit8 p4, p2, 0x2

    add-int/2addr p4, v1

    invoke-virtual {p3, p4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    if-eq p3, p0, :cond_5

    invoke-virtual {p1, p2, v1}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    :cond_5
    const/4 v1, 0x5

    goto :goto_1

    :cond_6
    :goto_0
    invoke-virtual/range {p0 .. p7}, Lڽتٺۊڗ؜/ؤ;->ف(Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v1

    :goto_1
    return v1
.end method

.method public static ػ(Lڽتٺۊڗ؜/ؤ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 14

    instance-of v0, p1, Lڽتٺۊڗ؜/آ;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lڽتٺۊڗ؜/آ;

    iget v1, v0, Lڽتٺۊڗ؜/آ;->ؤ:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lڽتٺۊڗ؜/آ;->ؤ:I

    goto :goto_0

    :cond_0
    new-instance v0, Lڽتٺۊڗ؜/آ;

    invoke-direct {v0, p0, p1}, Lڽتٺۊڗ؜/آ;-><init>(Lڽتٺۊڗ؜/ؤ;Lڨڡئٸت/أ;)V

    :goto_0
    move-object v6, v0

    iget-object p1, v6, Lڽتٺۊڗ؜/آ;->آ:Ljava/lang/Object;

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v1, v6, Lڽتٺۊڗ؜/آ;->ؤ:I

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    if-ne v1, v2, :cond_1

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    check-cast p1, Lڽتٺۊڗ؜/ث;

    iget-object p0, p1, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    goto/16 :goto_3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    const/4 p1, 0x0

    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    :goto_1
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ض()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object p0

    new-instance p1, Lڽتٺۊڗ؜/ة;

    invoke-direct {p1, p0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    goto :goto_3

    :cond_3
    sget-object v3, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v4

    sget v3, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v7, v3

    div-long v9, v4, v7

    rem-long v7, v4, v7

    long-to-int v3, v7

    iget-wide v7, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v7, v7, v9

    if-eqz v7, :cond_5

    invoke-virtual {p0, v9, v10, v1}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v7

    if-nez v7, :cond_4

    goto :goto_1

    :cond_4
    move-object v13, v7

    goto :goto_2

    :cond_5
    move-object v13, v1

    :goto_2
    move-object v7, p0

    move-object v8, v13

    move v9, v3

    move-wide v10, v4

    move-object v12, p1

    invoke-virtual/range {v7 .. v12}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v7, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v7, :cond_a

    sget-object v7, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v7, :cond_7

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v7

    cmp-long v1, v4, v7

    if-gez v1, :cond_6

    invoke-virtual {v13}, Lھۥٓڍچ/ء;->؋()V

    :cond_6
    move-object v1, v13

    goto :goto_1

    :cond_7
    sget-object p1, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, p1, :cond_8

    iput v2, v6, Lڽتٺۊڗ؜/آ;->ؤ:I

    move-object v1, p0

    move-object v2, v13

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ؼ(Lڽتٺۊڗ؜/ج;IJLڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_9

    return-object v0

    :cond_8
    invoke-virtual {v13}, Lھۥٓڍچ/ء;->؋()V

    move-object p0, v1

    :cond_9
    :goto_3
    return-object p0

    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "unexpected"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ؿ(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p0, Lںڍڒڸ/إ;

    if-eqz v0, :cond_0

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<kotlin.Unit>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Lںڍڒڸ/إ;

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lڽتٺۊڗ؜/ئ;->؋(Lںڍڒڸ/إ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Z

    move-result p0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected waiter: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final iterator()Lڽتٺۊڗ؜/ؠ;
    .locals 1

    new-instance v0, Lڽتٺۊڗ؜/ؠ;

    invoke-direct {v0, p0}, Lڽتٺۊڗ؜/ؠ;-><init>(Lڽتٺۊڗ؜/ؤ;)V

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 16

    move-object/from16 v0, p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    const/16 v4, 0x3c

    shr-long/2addr v2, v4

    long-to-int v2, v2

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eq v2, v4, :cond_1

    if-eq v2, v3, :cond_0

    goto :goto_1

    :cond_0
    const-string v2, "cancelled,"

    goto :goto_0

    :cond_1
    const-string v2, "closed,"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "capacity="

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v0, Lڽتٺۊڗ؜/ؤ;->آ:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v5, 0x2c

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "data=["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v2, v3, [Lڽتٺۊڗ؜/ج;

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v6, 0x0

    aput-object v3, v2, v6

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v7, 0x1

    aput-object v3, v2, v7

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v2}, Lںڍڒڸ/ش;->ن([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lڽتٺۊڗ؜/ج;

    sget-object v9, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    if-eq v8, v9, :cond_3

    move v8, v7

    goto :goto_3

    :cond_3
    move v8, v6

    :goto_3
    if-eqz v8, :cond_2

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_4

    :cond_5
    move-object v4, v3

    check-cast v4, Lڽتٺۊڗ؜/ج;

    iget-wide v8, v4, Lھۥٓڍچ/ز;->ؤ:J

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lڽتٺۊڗ؜/ج;

    iget-wide v10, v10, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v12, v8, v10

    if-lez v12, :cond_7

    move-object v3, v4

    move-wide v8, v10

    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_6

    :goto_4
    check-cast v3, Lڽتٺۊڗ؜/ج;

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v10

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v12

    :goto_5
    sget v2, Lڽتٺۊڗ؜/ئ;->ؠ:I

    move v4, v6

    :goto_6
    if-ge v4, v2, :cond_18

    iget-wide v8, v3, Lھۥٓڍچ/ز;->ؤ:J

    sget v14, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v14, v14

    mul-long/2addr v8, v14

    int-to-long v14, v4

    add-long/2addr v8, v14

    cmp-long v14, v8, v12

    if-ltz v14, :cond_8

    cmp-long v15, v8, v10

    if-gez v15, :cond_19

    :cond_8
    invoke-virtual {v3, v4}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v15

    iget-object v6, v3, Lڽتٺۊڗ؜/ج;->ا:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    mul-int/lit8 v7, v4, 0x2

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v15, Lںڍڒڸ/إ;

    if-eqz v7, :cond_b

    cmp-long v7, v8, v10

    if-gez v7, :cond_9

    if-ltz v14, :cond_9

    const-string v7, "receive"

    goto/16 :goto_e

    :cond_9
    if-gez v14, :cond_a

    if-ltz v7, :cond_a

    const-string v7, "send"

    goto/16 :goto_e

    :cond_a
    const-string v7, "cont"

    goto/16 :goto_e

    :cond_b
    instance-of v7, v15, Lڽتٺۊڗ؜/ز;

    if-eqz v7, :cond_c

    const-string v7, "receiveCatching"

    goto/16 :goto_e

    :cond_c
    instance-of v7, v15, Lڽتٺۊڗ؜/ص;

    if-eqz v7, :cond_d

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EB("

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v8, 0x29

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_e

    :cond_d
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    const/4 v7, 0x1

    goto :goto_7

    :cond_e
    sget-object v7, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_7
    if-eqz v7, :cond_f

    const-string v7, "resuming_sender"

    goto :goto_e

    :cond_f
    if-nez v15, :cond_10

    const/4 v7, 0x1

    goto :goto_8

    :cond_10
    sget-object v7, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_8
    if-eqz v7, :cond_11

    const/4 v7, 0x1

    goto :goto_9

    :cond_11
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_9
    if-eqz v7, :cond_12

    const/4 v7, 0x1

    goto :goto_a

    :cond_12
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_a
    if-eqz v7, :cond_13

    const/4 v7, 0x1

    goto :goto_b

    :cond_13
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_b
    if-eqz v7, :cond_14

    const/4 v7, 0x1

    goto :goto_c

    :cond_14
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_c
    if-eqz v7, :cond_15

    const/4 v7, 0x1

    goto :goto_d

    :cond_15
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-static {v15, v7}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    :goto_d
    if-nez v7, :cond_17

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_e
    if-eqz v6, :cond_16

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "("

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, "),"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_f

    :cond_16
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_f
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_17
    add-int/lit8 v4, v4, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_6

    :cond_18
    invoke-virtual {v3}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lڽتٺۊڗ؜/ج;

    if-nez v3, :cond_1d

    :cond_19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_1a

    const/4 v6, 0x1

    goto :goto_10

    :cond_1a
    const/4 v6, 0x0

    :goto_10
    if-nez v6, :cond_1c

    invoke-static {v1}, Lڹےف/ئ;->ڜ(Ljava/lang/CharSequence;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    if-ne v2, v5, :cond_1b

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/4 v4, 0x1

    sub-int/2addr v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "this.deleteCharAt(index)"

    invoke-static {v2, v3}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_1b
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_1c
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Char sequence is empty."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1d
    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_5

    :cond_1e
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public final ؠ(Ljava/lang/Throwable;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lڽتٺۊڗ؜/ؤ;->ت(ZLjava/lang/Throwable;)Z

    move-result p1

    return p1
.end method

.method public final ء(Ljava/util/concurrent/CancellationException;)V
    .locals 1

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/concurrent/CancellationException;

    const-string v0, "Channel was cancelled"

    invoke-direct {p1, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lڽتٺۊڗ؜/ؤ;->ت(ZLjava/lang/Throwable;)Z

    return-void
.end method

.method public final آ(Lڡپٔۯ/؋;)V
    .locals 6

    :cond_0
    const/4 v0, 0x0

    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ج:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    move v0, v3

    goto :goto_0

    :cond_1
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    move v0, v2

    :goto_0
    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v4, Lڽتٺۊڗ؜/ئ;->د:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_5

    sget-object v5, Lڽتٺۊڗ؜/ئ;->ذ:Lئٱنۃؖۊڄئ/آ;

    :cond_3
    invoke-virtual {v1, p0, v4, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    move v0, v3

    goto :goto_1

    :cond_4
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v4, :cond_3

    move v0, v2

    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lڡپٔۯ/؋;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_5
    sget-object p1, Lڽتٺۊڗ؜/ئ;->ذ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p1, :cond_6

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Another handler was already registered and successfully invoked"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Another handler is already registered: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final أ()Ljava/lang/Object;
    .locals 13

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v1

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v3

    const/4 v5, 0x1

    invoke-virtual {p0, v3, v4, v5}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    new-instance v1, Lڽتٺۊڗ؜/ة;

    invoke-direct {v1, v0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    return-object v1

    :cond_0
    const-wide v5, 0xfffffffffffffffL

    and-long/2addr v3, v5

    cmp-long v1, v1, v3

    sget-object v2, Lڽتٺۊڗ؜/ث;->ؠ:Lڽتٺۊڗ؜/ت;

    if-ltz v1, :cond_1

    return-object v2

    :cond_1
    sget-object v1, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lڽتٺۊڗ؜/ج;

    :goto_0
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ض()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    new-instance v2, Lڽتٺۊڗ؜/ة;

    invoke-direct {v2, v0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v9

    sget v4, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v4, v4

    div-long v6, v9, v4

    rem-long v4, v9, v4

    long-to-int v11, v4

    iget-wide v4, v3, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v4, v4, v6

    if-eqz v4, :cond_4

    invoke-virtual {p0, v6, v7, v3}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v4

    if-nez v4, :cond_3

    goto :goto_0

    :cond_3
    move-object v12, v4

    goto :goto_1

    :cond_4
    move-object v12, v3

    :goto_1
    move-object v3, p0

    move-object v4, v12

    move v5, v11

    move-wide v6, v9

    move-object v8, v1

    invoke-virtual/range {v3 .. v8}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-ne v3, v4, :cond_7

    instance-of v0, v1, Lںڍڒڸ/ڃ;

    if-eqz v0, :cond_5

    check-cast v1, Lںڍڒڸ/ڃ;

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_6

    invoke-interface {v1, v12, v11}, Lںڍڒڸ/ڃ;->؋(Lھۥٓڍچ/ز;I)V

    :cond_6
    invoke-virtual {p0, v9, v10}, Lڽتٺۊڗ؜/ؤ;->ق(J)V

    invoke-virtual {v12}, Lھۥٓڍچ/ز;->ئ()V

    goto :goto_3

    :cond_7
    sget-object v4, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v3, v4, :cond_9

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v3

    cmp-long v3, v9, v3

    if-gez v3, :cond_8

    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    :cond_8
    move-object v3, v12

    goto :goto_0

    :cond_9
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-eq v3, v0, :cond_a

    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    move-object v2, v3

    :goto_3
    return-object v2

    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unexpected"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public ؤ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22

    move-object/from16 v8, p0

    sget-object v9, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v9, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v10, 0x0

    invoke-virtual {v8, v0, v1, v10}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v2

    const/4 v11, 0x1

    const-wide v12, 0xfffffffffffffffL

    if-eqz v2, :cond_0

    move v0, v10

    goto :goto_0

    :cond_0
    and-long/2addr v0, v12

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ة(J)Z

    move-result v0

    xor-int/2addr v0, v11

    :goto_0
    sget-object v14, Lڽتٺۊڗ؜/ث;->ؠ:Lڽتٺۊڗ؜/ت;

    if-eqz v0, :cond_1

    return-object v14

    :cond_1
    sget-object v15, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    :cond_2
    :goto_1
    invoke-virtual {v9, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v1

    and-long v16, v1, v12

    invoke-virtual {v8, v1, v2, v10}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v18

    sget v7, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v1, v7

    div-long v3, v16, v1

    rem-long v1, v16, v1

    long-to-int v6, v1

    iget-wide v1, v0, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4

    invoke-static {v8, v3, v4, v0}, Lڽتٺۊڗ؜/ؤ;->؋(Lڽتٺۊڗ؜/ؤ;JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v1

    if-nez v1, :cond_3

    if-eqz v18, :cond_2

    goto :goto_4

    :cond_3
    move-object v4, v1

    goto :goto_2

    :cond_4
    move-object v4, v0

    :goto_2
    move-object/from16 v0, p0

    move-object v1, v4

    move v2, v6

    move-object/from16 v3, p1

    move-object/from16 v19, v4

    move-wide/from16 v4, v16

    move/from16 v20, v6

    move-object v6, v15

    move/from16 v21, v7

    move/from16 v7, v18

    invoke-static/range {v0 .. v7}, Lڽتٺۊڗ؜/ؤ;->ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v0

    sget-object v1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-eqz v0, :cond_d

    if-eq v0, v11, :cond_e

    const/4 v1, 0x2

    if-eq v0, v1, :cond_8

    const/4 v1, 0x3

    if-eq v0, v1, :cond_7

    const/4 v1, 0x4

    if-eq v0, v1, :cond_6

    const/4 v1, 0x5

    if-eq v0, v1, :cond_5

    goto :goto_3

    :cond_5
    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    :goto_3
    move-object/from16 v0, v19

    goto :goto_1

    :cond_6
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v0

    cmp-long v0, v16, v0

    if-gez v0, :cond_9

    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_4

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unexpected"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    if-eqz v18, :cond_a

    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ز;->ئ()V

    :cond_9
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object v0

    new-instance v14, Lڽتٺۊڗ؜/ة;

    invoke-direct {v14, v0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    goto :goto_7

    :cond_a
    instance-of v0, v15, Lںڍڒڸ/ڃ;

    if-eqz v0, :cond_b

    check-cast v15, Lںڍڒڸ/ڃ;

    goto :goto_5

    :cond_b
    const/4 v15, 0x0

    :goto_5
    if-eqz v15, :cond_c

    add-int v6, v20, v21

    move-object/from16 v0, v19

    invoke-interface {v15, v0, v6}, Lںڍڒڸ/ڃ;->؋(Lھۥٓڍچ/ز;I)V

    goto :goto_6

    :cond_c
    move-object/from16 v0, v19

    :goto_6
    invoke-virtual {v0}, Lھۥٓڍچ/ز;->ئ()V

    goto :goto_7

    :cond_d
    move-object/from16 v0, v19

    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    :cond_e
    move-object v14, v1

    :goto_7
    return-object v14
.end method

.method public final إ()Z
    .locals 3

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v0

    return v0
.end method

.method public final ئ(Lھڳۄ٧ڕڊ/ة;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1}, Lڽتٺۊڗ؜/ؤ;->ػ(Lڽتٺۊڗ؜/ؤ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 24

    move-object/from16 v9, p0

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    :cond_0
    :goto_0
    const/4 v7, 0x0

    sget-object v10, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v10, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v2

    const-wide v11, 0xfffffffffffffffL

    and-long v13, v2, v11

    const/4 v15, 0x0

    invoke-virtual {v9, v2, v3, v15}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v16

    sget v8, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v2, v8

    div-long v4, v13, v2

    rem-long v2, v13, v2

    long-to-int v6, v2

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    sget-object v3, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-eqz v2, :cond_3

    invoke-static {v9, v4, v5, v1}, Lڽتٺۊڗ؜/ؤ;->؋(Lڽتٺۊڗ؜/ؤ;JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v2

    if-nez v2, :cond_2

    if-eqz v16, :cond_0

    invoke-virtual/range {p0 .. p2}, Lڽتٺۊڗ؜/ؤ;->غ(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne v0, v1, :cond_1

    goto/16 :goto_b

    :cond_1
    move-object v0, v3

    goto/16 :goto_b

    :cond_2
    move-object v5, v2

    goto :goto_1

    :cond_3
    move-object v5, v1

    :goto_1
    move-object/from16 v1, p0

    move-object v2, v5

    move-object v4, v3

    move v3, v6

    move-object/from16 v17, v4

    move-object/from16 v4, p1

    move-object/from16 v19, v5

    move/from16 v18, v6

    move-wide v5, v13

    move/from16 v20, v8

    move/from16 v8, v16

    invoke-static/range {v1 .. v8}, Lڽتٺۊڗ؜/ؤ;->ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v1

    if-eqz v1, :cond_1c

    const/4 v8, 0x1

    if-eq v1, v8, :cond_1b

    const/4 v7, 0x2

    if-eq v1, v7, :cond_1a

    const/4 v5, 0x3

    const/4 v6, 0x5

    const/4 v4, 0x4

    if-eq v1, v5, :cond_7

    if-eq v1, v4, :cond_5

    if-eq v1, v6, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    :goto_2
    move-object/from16 v1, v19

    goto :goto_0

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v0

    cmp-long v0, v13, v0

    if-gez v0, :cond_6

    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    :cond_6
    invoke-virtual/range {p0 .. p2}, Lڽتٺۊڗ؜/ؤ;->غ(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object v3

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne v3, v0, :cond_1b

    goto/16 :goto_c

    :cond_7
    invoke-static/range {p2 .. p2}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v1

    invoke-static {v1}, Lںڍڒڸ/ش;->ؽ(Lڨڡئٸت/أ;)Lںڍڒڸ/ئ;

    move-result-object v3

    const/16 v16, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, v19

    move-object/from16 p2, v3

    move/from16 v3, v18

    move v15, v4

    move-object/from16 v4, p1

    move v11, v6

    move-wide v5, v13

    move v12, v7

    move-object/from16 v7, p2

    move v11, v8

    move/from16 v8, v16

    :try_start_0
    invoke-static/range {v1 .. v8}, Lڽتٺۊڗ؜/ؤ;->ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_18

    if-eq v1, v11, :cond_17

    if-eq v1, v12, :cond_16

    if-eq v1, v15, :cond_13

    const-string v13, "unexpected"

    const/4 v2, 0x5

    if-ne v1, v2, :cond_12

    :try_start_1
    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    invoke-virtual {v0, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    :cond_8
    :goto_3
    invoke-virtual {v10, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v1

    const-wide v18, 0xfffffffffffffffL

    and-long v22, v1, v18

    const/4 v14, 0x0

    invoke-virtual {v9, v1, v2, v14}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v16

    sget v8, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v1, v8

    div-long v3, v22, v1

    rem-long v1, v22, v1

    long-to-int v7, v1

    iget-wide v1, v0, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_a

    invoke-static {v9, v3, v4, v0}, Lڽتٺۊڗ؜/ؤ;->؋(Lڽتٺۊڗ؜/ؤ;JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v1

    if-nez v1, :cond_9

    if-eqz v16, :cond_8

    goto :goto_4

    :cond_9
    move-object v0, v1

    :cond_a
    move-object/from16 v1, p0

    move-object v2, v0

    move v3, v7

    move-object/from16 v4, p1

    move-wide/from16 v5, v22

    move/from16 v20, v7

    move-object/from16 v7, p2

    move/from16 v21, v8

    move/from16 v8, v16

    invoke-static/range {v1 .. v8}, Lڽتٺۊڗ؜/ؤ;->ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v1

    if-eqz v1, :cond_11

    if-eq v1, v11, :cond_17

    if-eq v1, v12, :cond_e

    const/4 v2, 0x3

    if-eq v1, v2, :cond_d

    if-eq v1, v15, :cond_c

    const/4 v3, 0x5

    if-eq v1, v3, :cond_b

    goto :goto_3

    :cond_b
    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_3

    :cond_c
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v1

    cmp-long v1, v22, v1

    if-gez v1, :cond_f

    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_4

    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    if-eqz v16, :cond_10

    invoke-virtual {v0}, Lھۥٓڍچ/ز;->ئ()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_f
    :goto_4
    move-object/from16 v1, p2

    goto :goto_5

    :cond_10
    add-int v7, v20, v21

    move-object/from16 v1, p2

    :try_start_2
    invoke-virtual {v1, v0, v7}, Lںڍڒڸ/ئ;->؋(Lھۥٓڍچ/ز;I)V

    goto :goto_6

    :catchall_0
    move-exception v0

    goto/16 :goto_a

    :cond_11
    move-object/from16 v1, p2

    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_7

    :cond_12
    move-object/from16 v1, p2

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v2

    cmp-long v0, v13, v2

    if-gez v0, :cond_14

    invoke-virtual/range {v19 .. v19}, Lھۥٓڍچ/ء;->؋()V

    :cond_14
    :goto_5
    iget-object v0, v9, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz v0, :cond_15

    const/4 v2, 0x0

    move-object/from16 v3, p1

    invoke-static {v0, v3, v2}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object v0

    if-eqz v0, :cond_15

    iget-object v2, v1, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-static {v2, v0}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :cond_15
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v0

    invoke-virtual {v1, v0}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    goto :goto_6

    :cond_16
    move-object/from16 v1, p2

    add-int v6, v18, v20

    move-object/from16 v2, v19

    invoke-virtual {v1, v2, v6}, Lںڍڒڸ/ئ;->؋(Lھۥٓڍچ/ز;I)V

    :goto_6
    move-object/from16 v0, v17

    goto :goto_8

    :cond_17
    move-object/from16 v1, p2

    goto :goto_7

    :cond_18
    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-virtual {v2}, Lھۥٓڍچ/ء;->؋()V

    :goto_7
    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_8
    invoke-virtual {v1}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object v3

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne v3, v1, :cond_19

    goto :goto_9

    :cond_19
    move-object v3, v0

    :goto_9
    if-ne v3, v1, :cond_1d

    goto :goto_c

    :catchall_1
    move-exception v0

    move-object/from16 v1, p2

    :goto_a
    invoke-virtual {v1}, Lںڍڒڸ/ئ;->س()V

    throw v0

    :cond_1a
    move-object/from16 v3, p1

    move-object/from16 v0, v17

    move-object/from16 v2, v19

    if-eqz v16, :cond_1d

    invoke-virtual {v2}, Lھۥٓڍچ/ز;->ئ()V

    invoke-virtual/range {p0 .. p2}, Lڽتٺۊڗ؜/ؤ;->غ(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object v3

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne v3, v1, :cond_1d

    goto :goto_c

    :cond_1b
    move-object/from16 v0, v17

    goto :goto_b

    :cond_1c
    move-object/from16 v0, v17

    move-object/from16 v2, v19

    invoke-virtual {v2}, Lھۥٓڍچ/ء;->؋()V

    :cond_1d
    :goto_b
    move-object v3, v0

    :goto_c
    return-object v3
.end method

.method public final ة(J)Z
    .locals 4

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v0

    iget v2, p0, Lڽتٺۊڗ؜/ؤ;->آ:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    cmp-long p1, p1, v0

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final ت(ZLjava/lang/Throwable;)Z
    .locals 15

    move-object v6, p0

    const-wide v7, 0xfffffffffffffffL

    const/16 v9, 0x3c

    sget-object v10, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const/4 v11, 0x1

    if-eqz p1, :cond_1

    :cond_0
    invoke-virtual {v10, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    shr-long v0, v2, v9

    long-to-int v0, v0

    if-nez v0, :cond_1

    and-long v0, v2, v7

    sget-object v4, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    int-to-long v4, v11

    shl-long/2addr v4, v9

    add-long/2addr v4, v0

    move-object v0, v10

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_1
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ر:Lئٱنۃؖۊڄئ/آ;

    :cond_2
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ث:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-object/from16 v2, p2

    invoke-virtual {v1, p0, v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v12, 0x0

    if-eqz v3, :cond_3

    move v13, v11

    goto :goto_0

    :cond_3
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_2

    move v13, v12

    :goto_0
    const/4 v14, 0x3

    if-eqz p1, :cond_5

    :cond_4
    invoke-virtual {v10, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    and-long v0, v2, v7

    sget-object v4, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    int-to-long v4, v14

    shl-long/2addr v4, v9

    add-long/2addr v4, v0

    move-object v0, v10

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_5
    invoke-virtual {v10, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    shr-long v0, v2, v9

    long-to-int v0, v0

    if-eqz v0, :cond_7

    if-eq v0, v11, :cond_6

    goto :goto_2

    :cond_6
    and-long v0, v2, v7

    sget-object v4, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    move v4, v14

    goto :goto_1

    :cond_7
    and-long v0, v2, v7

    sget-object v4, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    const/4 v4, 0x2

    :goto_1
    int-to-long v4, v4

    shl-long/2addr v4, v9

    add-long/2addr v4, v0

    move-object v0, v10

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_2
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->إ()Z

    if-eqz v13, :cond_d

    :cond_8
    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ج:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_9

    sget-object v2, Lڽتٺۊڗ؜/ئ;->د:Lئٱنۃؖۊڄئ/آ;

    goto :goto_3

    :cond_9
    sget-object v2, Lڽتٺۊڗ؜/ئ;->ذ:Lئٱنۃؖۊڄئ/آ;

    :cond_a
    :goto_3
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v0, v11

    goto :goto_4

    :cond_b
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v1, :cond_a

    move v0, v12

    :goto_4
    if-eqz v0, :cond_8

    if-nez v1, :cond_c

    goto :goto_5

    :cond_c
    invoke-static {v11, v1}, Lڗًقڔ/ء;->ء(ILjava/lang/Object;)V

    check-cast v1, Lڲٱۘۑدٿٰ/ت;

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    invoke-interface {v1, v0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    :goto_5
    return v13
.end method

.method public final ث(J)Lڽتٺۊڗ؜/ج;
    .locals 12

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    move-object v4, v0

    check-cast v4, Lڽتٺۊڗ؜/ج;

    iget-wide v4, v4, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    move-object v0, v1

    :cond_0
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    move-object v4, v0

    check-cast v4, Lڽتٺۊڗ؜/ج;

    iget-wide v4, v4, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    move-object v0, v1

    :cond_1
    check-cast v0, Lھۥٓڍچ/ء;

    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lھۥٓڍچ/ء;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lسۄھؤۏ۫/؋;->ظ:Lئٱنۃؖۊڄئ/آ;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v1, v2, :cond_3

    goto :goto_2

    :cond_3
    check-cast v1, Lھۥٓڍچ/ء;

    if-nez v1, :cond_16

    :cond_4
    sget-object v1, Lھۥٓڍچ/ء;->آ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, v4, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    move v1, v3

    goto :goto_1

    :cond_5
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    :goto_2
    check-cast v0, Lڽتٺۊڗ؜/ج;

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ط()Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_c

    move-object v1, v0

    :cond_6
    sget v5, Lڽتٺۊڗ؜/ئ;->ؠ:I

    add-int/2addr v5, v2

    :goto_3
    const-wide/16 v6, -0x1

    if-ge v2, v5, :cond_b

    sget v8, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v8, v8

    iget-wide v10, v1, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v10, v8

    int-to-long v8, v5

    add-long/2addr v10, v8

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v8

    cmp-long v8, v10, v8

    if-gez v8, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {v1, v5}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_9

    sget-object v9, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-ne v8, v9, :cond_8

    goto :goto_4

    :cond_8
    sget-object v9, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    if-ne v8, v9, :cond_a

    goto :goto_6

    :cond_9
    :goto_4
    sget-object v9, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v1, v5, v8, v9}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v1}, Lھۥٓڍچ/ز;->ئ()V

    :cond_a
    add-int/lit8 v5, v5, -0x1

    goto :goto_3

    :cond_b
    sget-object v5, Lھۥٓڍچ/ء;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lھۥٓڍچ/ء;

    check-cast v1, Lڽتٺۊڗ؜/ج;

    if-nez v1, :cond_6

    :goto_5
    move-wide v10, v6

    :goto_6
    cmp-long v1, v10, v6

    if-eqz v1, :cond_c

    invoke-virtual {p0, v10, v11}, Lڽتٺۊڗ؜/ؤ;->ج(J)V

    :cond_c
    move-object v1, v0

    :goto_7
    if-eqz v1, :cond_13

    sget v5, Lڽتٺۊڗ؜/ئ;->ؠ:I

    sub-int/2addr v5, v3

    :goto_8
    if-ge v2, v5, :cond_12

    sget v6, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v6, v6

    iget-wide v8, v1, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v8, v6

    int-to-long v6, v5

    add-long/2addr v8, v6

    cmp-long v6, v8, p1

    if-ltz v6, :cond_13

    :cond_d
    invoke-virtual {v1, v5}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_10

    sget-object v7, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-ne v6, v7, :cond_e

    goto :goto_a

    :cond_e
    instance-of v7, v6, Lڽتٺۊڗ؜/ص;

    if-eqz v7, :cond_f

    sget-object v7, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v1, v5, v6, v7}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    check-cast v6, Lڽتٺۊڗ؜/ص;

    iget-object v6, v6, Lڽتٺۊڗ؜/ص;->؋:Lںڍڒڸ/ڃ;

    goto :goto_9

    :cond_f
    instance-of v7, v6, Lںڍڒڸ/ڃ;

    if-eqz v7, :cond_11

    sget-object v7, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v1, v5, v6, v7}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    :goto_9
    invoke-static {v4, v6}, Lڃٷښـ۝ۼ/ؠ;->ذ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v5, v3}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    goto :goto_b

    :cond_10
    :goto_a
    sget-object v7, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v1, v5, v6, v7}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-virtual {v1}, Lھۥٓڍچ/ز;->ئ()V

    :cond_11
    :goto_b
    add-int/lit8 v5, v5, -0x1

    goto :goto_8

    :cond_12
    sget-object v5, Lھۥٓڍچ/ء;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lھۥٓڍچ/ء;

    check-cast v1, Lڽتٺۊڗ؜/ج;

    goto :goto_7

    :cond_13
    if-eqz v4, :cond_15

    instance-of p1, v4, Ljava/util/ArrayList;

    if-nez p1, :cond_14

    check-cast v4, Lںڍڒڸ/ڃ;

    invoke-virtual {p0, v4, v3}, Lڽتٺۊڗ؜/ؤ;->ؽ(Lںڍڒڸ/ڃ;Z)V

    goto :goto_d

    :cond_14
    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v3

    :goto_c
    if-ge v2, p1, :cond_15

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lںڍڒڸ/ڃ;

    invoke-virtual {p0, p2, v3}, Lڽتٺۊڗ؜/ؤ;->ؽ(Lںڍڒڸ/ڃ;Z)V

    add-int/lit8 p1, p1, -0x1

    goto :goto_c

    :cond_15
    :goto_d
    return-object v0

    :cond_16
    move-object v0, v1

    goto/16 :goto_0
.end method

.method public final ج(J)V
    .locals 10

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    :cond_0
    :goto_0
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v8

    iget v2, p0, Lڽتٺۊڗ؜/ؤ;->آ:I

    int-to-long v2, v2

    add-long/2addr v2, v8

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-gez v2, :cond_1

    return-void

    :cond_1
    const-wide/16 v2, 0x1

    add-long v5, v8, v2

    move-object v2, p0

    move-wide v3, v8

    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v1

    if-eqz v1, :cond_0

    sget v1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v1, v1

    div-long v3, v8, v1

    rem-long v1, v8, v1

    long-to-int v1, v1

    iget-wide v5, v0, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v5, v3

    if-eqz v2, :cond_3

    invoke-virtual {p0, v3, v4, v0}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    move-object v0, v2

    :cond_3
    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, v0

    move v4, v1

    move-wide v5, v8

    invoke-virtual/range {v2 .. v7}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_4

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, v8, v1

    if-gez v1, :cond_0

    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lھۥٓڍچ/ء;->؋()V

    iget-object v2, p0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    throw v1
.end method

.method public final ح()V
    .locals 17

    move-object/from16 v6, p0

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ظ()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v7, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    move-object v8, v0

    :cond_1
    :goto_0
    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ئ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v9

    sget v0, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v0, v0

    div-long v0, v9, v0

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v2

    cmp-long v2, v2, v9

    const-wide/16 v11, 0x1

    if-gtz v2, :cond_3

    iget-wide v2, v8, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_2

    invoke-virtual {v8}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v6, v0, v1, v8}, Lڽتٺۊڗ؜/ؤ;->ع(JLڽتٺۊڗ؜/ج;)V

    :cond_2
    invoke-virtual {v6, v11, v12}, Lڽتٺۊڗ؜/ؤ;->ش(J)V

    return-void

    :cond_3
    iget-wide v2, v8, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v0

    if-eqz v2, :cond_10

    sget-object v2, Lڽتٺۊڗ؜/إ;->آ:Lڽتٺۊڗ؜/إ;

    :goto_1
    invoke-static {v8, v0, v1}, Lسۄھؤۏ۫/؋;->د(Lھۥٓڍچ/ز;J)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    invoke-static {v2}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object v3

    :goto_2
    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lھۥٓڍچ/ز;

    iget-wide v13, v4, Lھۥٓڍچ/ز;->ؤ:J

    iget-wide v11, v3, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v5, v13, v11

    if-ltz v5, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v3}, Lھۥٓڍچ/ز;->ا()Z

    move-result v5

    if-nez v5, :cond_5

    const/4 v3, 0x0

    goto :goto_5

    :cond_5
    invoke-virtual {v7, v6, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/4 v5, 0x1

    goto :goto_3

    :cond_6
    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v4, :cond_5

    const/4 v5, 0x0

    :goto_3
    if-eqz v5, :cond_9

    invoke-virtual {v4}, Lھۥٓڍچ/ز;->أ()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v4}, Lھۥٓڍچ/ء;->آ()V

    :cond_7
    :goto_4
    const/4 v3, 0x1

    :goto_5
    if-eqz v3, :cond_8

    goto :goto_6

    :cond_8
    const-wide/16 v11, 0x1

    goto :goto_1

    :cond_9
    invoke-virtual {v3}, Lھۥٓڍچ/ز;->أ()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-virtual {v3}, Lھۥٓڍچ/ء;->آ()V

    :cond_a
    const-wide/16 v11, 0x1

    goto :goto_2

    :cond_b
    :goto_6
    invoke-static {v2}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->إ()Z

    invoke-virtual {v6, v0, v1, v8}, Lڽتٺۊڗ؜/ؤ;->ع(JLڽتٺۊڗ؜/ج;)V

    goto :goto_7

    :cond_c
    invoke-static {v2}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lڽتٺۊڗ؜/ج;

    iget-wide v2, v11, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v0, v2, v0

    if-lez v0, :cond_e

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ئ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/16 v4, 0x1

    add-long v12, v9, v4

    sget v1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v4, v1

    mul-long v15, v4, v2

    move-object/from16 v1, p0

    move-wide v2, v12

    move-wide v12, v4

    move-wide v4, v15

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-wide v0, v11, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v0, v12

    sub-long/2addr v0, v9

    invoke-virtual {v6, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ش(J)V

    goto :goto_8

    :cond_d
    :goto_7
    const-wide/16 v0, 0x1

    invoke-virtual {v6, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ش(J)V

    :goto_8
    const/4 v11, 0x0

    :cond_e
    if-nez v11, :cond_f

    goto/16 :goto_0

    :cond_f
    move-object v8, v11

    :cond_10
    sget v0, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v0, v0

    rem-long v0, v9, v0

    long-to-int v0, v0

    invoke-virtual {v8, v0}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ڃ;

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    if-eqz v2, :cond_12

    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    cmp-long v2, v9, v4

    if-ltz v2, :cond_12

    sget-object v2, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1, v2}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-static {v1}, Lڽتٺۊڗ؜/ؤ;->ؿ(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v1, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    goto/16 :goto_b

    :cond_11
    sget-object v1, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    const/4 v1, 0x0

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    const/4 v13, 0x0

    goto/16 :goto_c

    :cond_12
    :goto_9
    invoke-virtual {v8, v0}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ڃ;

    if-eqz v2, :cond_15

    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    cmp-long v2, v9, v4

    if-gez v2, :cond_13

    new-instance v2, Lڽتٺۊڗ؜/ص;

    move-object v4, v1

    check-cast v4, Lںڍڒڸ/ڃ;

    invoke-direct {v2, v4}, Lڽتٺۊڗ؜/ص;-><init>(Lںڍڒڸ/ڃ;)V

    invoke-virtual {v8, v0, v1, v2}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    goto/16 :goto_b

    :cond_13
    sget-object v2, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1, v2}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-static {v1}, Lڽتٺۊڗ؜/ؤ;->ؿ(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    sget-object v1, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    goto :goto_b

    :cond_14
    sget-object v1, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    const/4 v2, 0x0

    invoke-virtual {v8, v0, v2}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    goto :goto_a

    :cond_15
    const/4 v2, 0x0

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v4, :cond_16

    :goto_a
    move v13, v2

    goto :goto_c

    :cond_16
    if-nez v1, :cond_17

    sget-object v4, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v8, v0, v1, v4}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_b

    :cond_17
    sget-object v4, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v4, :cond_18

    goto :goto_b

    :cond_18
    sget-object v4, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v4, :cond_1c

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v4, :cond_1c

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v4, :cond_19

    goto :goto_b

    :cond_19
    sget-object v4, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v4, :cond_1a

    goto :goto_b

    :cond_1a
    sget-object v4, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v4, :cond_1b

    goto :goto_9

    :cond_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected cell state: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    :goto_b
    const/4 v13, 0x1

    :goto_c
    const-wide/16 v0, 0x1

    invoke-virtual {v6, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ش(J)V

    if-eqz v13, :cond_1

    return-void
.end method

.method public final خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;
    .locals 12

    sget-object v0, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    sget-object v0, Lڽتٺۊڗ؜/إ;->آ:Lڽتٺۊڗ؜/إ;

    :cond_0
    invoke-static {p3, p1, p2}, Lسۄھؤۏ۫/؋;->د(Lھۥٓڍچ/ز;J)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_7

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object v1

    :cond_1
    :goto_0
    sget-object v4, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lھۥٓڍچ/ز;

    iget-wide v6, v5, Lھۥٓڍچ/ز;->ؤ:J

    iget-wide v8, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Lھۥٓڍچ/ز;->ا()Z

    move-result v6

    if-nez v6, :cond_3

    move v1, v2

    goto :goto_3

    :cond_3
    invoke-virtual {v4, p0, v5, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v4, v3

    goto :goto_1

    :cond_4
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v5, :cond_3

    move v4, v2

    :goto_1
    if-eqz v4, :cond_6

    invoke-virtual {v5}, Lھۥٓڍچ/ز;->أ()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v5}, Lھۥٓڍچ/ء;->آ()V

    :cond_5
    :goto_2
    move v1, v3

    :goto_3
    if-eqz v1, :cond_0

    goto :goto_4

    :cond_6
    invoke-virtual {v1}, Lھۥٓڍچ/ز;->أ()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1}, Lھۥٓڍچ/ء;->آ()V

    goto :goto_0

    :cond_7
    :goto_4
    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ح(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->إ()Z

    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v0, p1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide p1

    cmp-long p1, v0, p1

    if-gez p1, :cond_10

    :goto_5
    invoke-virtual {p3}, Lھۥٓڍچ/ء;->؋()V

    goto/16 :goto_a

    :cond_8
    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;

    move-result-object p3

    check-cast p3, Lڽتٺۊڗ؜/ج;

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ظ()Z

    move-result v0

    iget-wide v4, p3, Lھۥٓڍچ/ز;->ؤ:J

    if-nez v0, :cond_d

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v0

    sget v6, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v6, v6

    div-long/2addr v0, v6

    cmp-long v0, p1, v0

    if-gtz v0, :cond_d

    :cond_9
    :goto_6
    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lھۥٓڍچ/ز;

    iget-wide v6, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v6, v6, v4

    if-gez v6, :cond_d

    invoke-virtual {p3}, Lھۥٓڍچ/ز;->ا()Z

    move-result v6

    if-eqz v6, :cond_d

    :cond_a
    invoke-virtual {v0, p0, v1, p3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    move v0, v3

    goto :goto_7

    :cond_b
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v1, :cond_a

    move v0, v2

    :goto_7
    if-eqz v0, :cond_c

    invoke-virtual {v1}, Lھۥٓڍچ/ز;->أ()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {v1}, Lھۥٓڍچ/ء;->آ()V

    goto :goto_8

    :cond_c
    invoke-virtual {p3}, Lھۥٓڍچ/ز;->أ()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p3}, Lھۥٓڍچ/ء;->آ()V

    goto :goto_6

    :cond_d
    :goto_8
    cmp-long p1, v4, p1

    if-lez p1, :cond_11

    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    mul-long/2addr v4, p1

    :cond_e
    sget-object v6, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v6, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v8

    cmp-long p1, v8, v4

    if-ltz p1, :cond_f

    goto :goto_9

    :cond_f
    move-object v7, p0

    move-wide v10, v4

    invoke-virtual/range {v6 .. v11}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result p1

    if-eqz p1, :cond_e

    :goto_9
    sget p1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long p1, p1

    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v0, p1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide p1

    cmp-long p1, v0, p1

    if-gez p1, :cond_10

    goto/16 :goto_5

    :cond_10
    :goto_a
    const/4 p3, 0x0

    :cond_11
    return-object p3
.end method

.method public final د()J
    .locals 2

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ئ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final ذ()Ljava/lang/Throwable;
    .locals 1

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ث:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    return-object v0
.end method

.method public final ر()J
    .locals 2

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final ز()Ljava/lang/Throwable;
    .locals 1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lؾپۑ۟ڂڷ/ؠ;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ؠ;-><init>()V

    :cond_0
    return-object v0
.end method

.method public final س()J
    .locals 4

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    const-wide v2, 0xfffffffffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public final ش(J)V
    .locals 8

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ا:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide p1

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    and-long/2addr p1, v1

    const-wide/16 v3, 0x0

    cmp-long p1, p1, v3

    const/4 p2, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_0

    move p1, p2

    goto :goto_0

    :cond_0
    move p1, v5

    :goto_0
    if-eqz p1, :cond_3

    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v6

    and-long/2addr v6, v1

    cmp-long p1, v6, v3

    if-eqz p1, :cond_2

    move p1, p2

    goto :goto_1

    :cond_2
    move p1, v5

    :goto_1
    if-nez p1, :cond_1

    :cond_3
    return-void
.end method

.method public final ص(JZ)Z
    .locals 17

    move-object/from16 v6, p0

    const/16 v0, 0x3c

    shr-long v0, p1, v0

    long-to-int v0, v0

    const/4 v7, 0x0

    if-eqz v0, :cond_22

    const/4 v8, 0x1

    if-eq v0, v8, :cond_22

    const/4 v1, 0x2

    const-wide v2, 0xfffffffffffffffL

    if-eq v0, v1, :cond_11

    const/4 v1, 0x3

    if-ne v0, v1, :cond_10

    and-long v0, p1, v2

    invoke-virtual {v6, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ث(J)Lڽتٺۊڗ؜/ج;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    move-object v3, v2

    :cond_0
    sget v4, Lڽتٺۊڗ؜/ئ;->ؠ:I

    const/4 v5, -0x1

    add-int/2addr v4, v5

    :goto_0
    if-ge v5, v4, :cond_b

    sget v9, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v9, v9

    iget-wide v11, v0, Lھۥٓڍچ/ز;->ؤ:J

    mul-long/2addr v11, v9

    int-to-long v9, v4

    add-long/2addr v11, v9

    :cond_1
    invoke-virtual {v0, v4}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v9

    sget-object v10, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    if-eq v9, v10, :cond_c

    sget-object v10, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    iget-object v13, v0, Lڽتٺۊڗ؜/ج;->ا:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    iget-object v14, v6, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-ne v9, v10, :cond_2

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v15

    cmp-long v10, v11, v15

    if-ltz v10, :cond_c

    sget-object v10, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v0, v4, v9, v10}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    if-eqz v14, :cond_9

    mul-int/lit8 v9, v4, 0x2

    invoke-virtual {v13, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v14, v9, v3}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object v3

    goto :goto_3

    :cond_2
    sget-object v10, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-eq v9, v10, :cond_a

    if-nez v9, :cond_3

    goto :goto_4

    :cond_3
    instance-of v10, v9, Lںڍڒڸ/ڃ;

    if-nez v10, :cond_6

    instance-of v10, v9, Lڽتٺۊڗ؜/ص;

    if-eqz v10, :cond_4

    goto :goto_1

    :cond_4
    sget-object v10, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    if-eq v9, v10, :cond_c

    sget-object v13, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    if-ne v9, v13, :cond_5

    goto :goto_7

    :cond_5
    if-eq v9, v10, :cond_1

    goto :goto_6

    :cond_6
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v15

    cmp-long v10, v11, v15

    if-ltz v10, :cond_c

    instance-of v10, v9, Lڽتٺۊڗ؜/ص;

    if-eqz v10, :cond_7

    move-object v10, v9

    check-cast v10, Lڽتٺۊڗ؜/ص;

    iget-object v10, v10, Lڽتٺۊڗ؜/ص;->؋:Lںڍڒڸ/ڃ;

    goto :goto_2

    :cond_7
    move-object v10, v9

    check-cast v10, Lںڍڒڸ/ڃ;

    :goto_2
    sget-object v15, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v0, v4, v9, v15}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    if-eqz v14, :cond_8

    mul-int/lit8 v9, v4, 0x2

    invoke-virtual {v13, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v14, v9, v3}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object v3

    :cond_8
    invoke-static {v2, v10}, Lڃٷښـ۝ۼ/ؠ;->ذ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :cond_9
    :goto_3
    invoke-virtual {v0, v4, v1}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    goto :goto_5

    :cond_a
    :goto_4
    sget-object v10, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v0, v4, v9, v10}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    :goto_5
    invoke-virtual {v0}, Lھۥٓڍچ/ز;->ئ()V

    :goto_6
    add-int/lit8 v4, v4, -0x1

    goto/16 :goto_0

    :cond_b
    sget-object v4, Lھۥٓڍچ/ء;->أ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lھۥٓڍچ/ء;

    check-cast v0, Lڽتٺۊڗ؜/ج;

    if-nez v0, :cond_0

    :cond_c
    :goto_7
    if-eqz v2, :cond_e

    instance-of v0, v2, Ljava/util/ArrayList;

    if-nez v0, :cond_d

    check-cast v2, Lںڍڒڸ/ڃ;

    invoke-virtual {v6, v2, v7}, Lڽتٺۊڗ؜/ؤ;->ؽ(Lںڍڒڸ/ڃ;Z)V

    goto :goto_9

    :cond_d
    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v0, v5

    :goto_8
    if-ge v5, v0, :cond_e

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ڃ;

    invoke-virtual {v6, v1, v7}, Lڽتٺۊڗ؜/ؤ;->ؽ(Lںڍڒڸ/ڃ;Z)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_e
    :goto_9
    if-nez v3, :cond_f

    goto/16 :goto_11

    :cond_f
    throw v3

    :cond_10
    const-string v1, "unexpected close status: "

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ء(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_11
    and-long v0, p1, v2

    invoke-virtual {v6, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ث(J)Lڽتٺۊڗ؜/ج;

    if-eqz p3, :cond_21

    :cond_12
    :goto_a
    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v2

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v4

    cmp-long v4, v4, v2

    if-gtz v4, :cond_13

    goto :goto_b

    :cond_13
    sget v4, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v4, v4

    div-long v9, v2, v4

    iget-wide v11, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v11, v11, v9

    if-eqz v11, :cond_14

    invoke-virtual {v6, v9, v10, v1}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v1

    if-nez v1, :cond_14

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    iget-wide v0, v0, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v0, v0, v9

    if-gez v0, :cond_12

    :goto_b
    move v0, v7

    goto :goto_10

    :cond_14
    invoke-virtual {v1}, Lھۥٓڍچ/ء;->؋()V

    rem-long v4, v2, v4

    long-to-int v0, v4

    :cond_15
    invoke-virtual {v1, v0}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1e

    sget-object v5, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v5, :cond_16

    goto :goto_d

    :cond_16
    sget-object v0, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_17

    goto :goto_c

    :cond_17
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_18

    goto :goto_e

    :cond_18
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_19

    goto :goto_e

    :cond_19
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_1a

    goto :goto_e

    :cond_1a
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_1b

    goto :goto_e

    :cond_1b
    sget-object v0, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_1c

    goto :goto_c

    :cond_1c
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    if-ne v4, v0, :cond_1d

    goto :goto_e

    :cond_1d
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-nez v0, :cond_1f

    :goto_c
    move v0, v8

    goto :goto_f

    :cond_1e
    :goto_d
    sget-object v5, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v1, v0, v4, v5}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    :cond_1f
    :goto_e
    move v0, v7

    :goto_f
    if-eqz v0, :cond_20

    move v0, v8

    :goto_10
    if-nez v0, :cond_22

    goto :goto_11

    :cond_20
    sget-object v0, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    move-object/from16 v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    goto/16 :goto_a

    :cond_21
    :goto_11
    move v7, v8

    :cond_22
    return v7
.end method

.method public final ض()Z
    .locals 3

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v0

    return v0
.end method

.method public ط()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final ظ()Z
    .locals 4

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public final ع(JLڽتٺۊڗ؜/ج;)V
    .locals 4

    :goto_0
    iget-wide v0, p3, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_1

    invoke-virtual {p3}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    move-object p3, v0

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p3}, Lھۥٓڍچ/ز;->ء()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p3}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object p1

    check-cast p1, Lڽتٺۊڗ؜/ج;

    if-nez p1, :cond_2

    goto :goto_2

    :cond_2
    move-object p3, p1

    goto :goto_1

    :cond_3
    :goto_2
    sget-object p1, Lڽتٺۊڗ؜/ؤ;->ت:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lھۥٓڍچ/ز;

    iget-wide v0, p2, Lھۥٓڍچ/ز;->ؤ:J

    iget-wide v2, p3, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    if-ltz v0, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {p3}, Lھۥٓڍچ/ز;->ا()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_5

    move v1, v2

    goto :goto_4

    :cond_5
    invoke-virtual {p1, p0, p2, p3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v2, v1

    goto :goto_3

    :cond_6
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p2, :cond_5

    :goto_3
    if-eqz v2, :cond_8

    invoke-virtual {p2}, Lھۥٓڍچ/ز;->أ()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {p2}, Lھۥٓڍچ/ء;->آ()V

    :cond_7
    :goto_4
    if-eqz v1, :cond_1

    return-void

    :cond_8
    invoke-virtual {p3}, Lھۥٓڍچ/ز;->أ()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p3}, Lھۥٓڍچ/ء;->آ()V

    goto :goto_2
.end method

.method public final غ(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lںڍڒڸ/ئ;

    invoke-static {p2}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p2

    const/4 v1, 0x1

    invoke-direct {v0, v1, p2}, Lںڍڒڸ/ئ;-><init>(ILڨڡئٸت/أ;)V

    invoke-virtual {v0}, Lںڍڒڸ/ئ;->ح()V

    iget-object p2, p0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz p2, :cond_0

    const/4 v1, 0x0

    invoke-static {p2, p1, v1}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object p2

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object p1

    invoke-virtual {v0, p1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_1

    return-object p1

    :cond_1
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final ؼ(Lڽتٺۊڗ؜/ج;IJLڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 17

    move-object/from16 v7, p0

    move-object/from16 v0, p5

    instance-of v1, v0, Lڽتٺۊڗ؜/أ;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lڽتٺۊڗ؜/أ;

    iget v2, v1, Lڽتٺۊڗ؜/أ;->ؤ:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_0

    sub-int/2addr v2, v3

    iput v2, v1, Lڽتٺۊڗ؜/أ;->ؤ:I

    goto :goto_0

    :cond_0
    new-instance v1, Lڽتٺۊڗ؜/أ;

    invoke-direct {v1, v7, v0}, Lڽتٺۊڗ؜/أ;-><init>(Lڽتٺۊڗ؜/ؤ;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object v0, v1, Lڽتٺۊڗ؜/أ;->آ:Ljava/lang/Object;

    sget-object v8, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v2, v1, Lڽتٺۊڗ؜/أ;->ؤ:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    goto/16 :goto_6

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput v3, v1, Lڽتٺۊڗ؜/أ;->ؤ:I

    invoke-static {v1}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v0

    invoke-static {v0}, Lںڍڒڸ/ش;->ؽ(Lڨڡئٸت/أ;)Lںڍڒڸ/ئ;

    move-result-object v9

    :try_start_0
    new-instance v0, Lڽتٺۊڗ؜/ز;

    invoke-direct {v0, v9}, Lڽتٺۊڗ؜/ز;-><init>(Lںڍڒڸ/ئ;)V

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-wide/from16 v4, p3

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_3

    move-object/from16 v1, p1

    move/from16 v15, p2

    goto :goto_3

    :cond_3
    sget-object v2, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v10, 0x0

    iget-object v11, v7, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    iget-object v12, v9, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    if-ne v1, v2, :cond_c

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, p3, v1

    if-gez v1, :cond_4

    invoke-virtual/range {p1 .. p1}, Lھۥٓڍچ/ء;->؋()V

    :cond_4
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v7}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ض()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    new-instance v1, Lڽتٺۊڗ؜/ة;

    invoke-direct {v1, v0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lڽتٺۊڗ؜/ث;

    invoke-direct {v0, v1}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v9, v0}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    goto/16 :goto_5

    :cond_5
    sget-object v2, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v13

    sget v2, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v2, v2

    div-long v4, v13, v2

    rem-long v2, v13, v2

    long-to-int v15, v2

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_7

    invoke-virtual {v7, v4, v5, v1}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v2

    if-nez v2, :cond_6

    goto :goto_1

    :cond_6
    move-object/from16 v16, v2

    goto :goto_2

    :cond_7
    move-object/from16 v16, v1

    :goto_2
    move-object/from16 v1, p0

    move-object/from16 v2, v16

    move v3, v15

    move-wide v4, v13

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_8

    move-object/from16 v1, v16

    :goto_3
    invoke-virtual {v0, v1, v15}, Lڽتٺۊڗ؜/ز;->؋(Lھۥٓڍچ/ز;I)V

    goto :goto_5

    :cond_8
    sget-object v2, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_a

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, v13, v1

    if-gez v1, :cond_9

    invoke-virtual/range {v16 .. v16}, Lھۥٓڍچ/ء;->؋()V

    :cond_9
    move-object/from16 v1, v16

    goto :goto_1

    :cond_a
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v0, :cond_b

    invoke-virtual/range {v16 .. v16}, Lھۥٓڍچ/ء;->؋()V

    new-instance v0, Lڽتٺۊڗ؜/ث;

    invoke-direct {v0, v1}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    if-eqz v11, :cond_d

    new-instance v10, Lڽتٺۊڗ؜/ء;

    invoke-direct {v10, v11, v1, v12}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    goto :goto_4

    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unexpected"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    invoke-virtual/range {p1 .. p1}, Lھۥٓڍچ/ء;->؋()V

    new-instance v0, Lڽتٺۊڗ؜/ث;

    invoke-direct {v0, v1}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    if-eqz v11, :cond_d

    new-instance v10, Lڽتٺۊڗ؜/ء;

    invoke-direct {v10, v11, v1, v12}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    :cond_d
    :goto_4
    invoke-virtual {v9, v0, v10}, Lںڍڒڸ/ئ;->ش(Ljava/lang/Object;Lڽتٺۊڗ؜/ء;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_5
    invoke-virtual {v9}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne v0, v8, :cond_e

    return-object v8

    :cond_e
    :goto_6
    check-cast v0, Lڽتٺۊڗ؜/ث;

    iget-object v0, v0, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v9}, Lںڍڒڸ/ئ;->س()V

    throw v0
.end method

.method public final ؽ(Lںڍڒڸ/ڃ;Z)V
    .locals 2

    instance-of v0, p1, Lںڍڒڸ/إ;

    if-eqz v0, :cond_2

    check-cast p1, Lڨڡئٸت/أ;

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object p2

    if-nez p2, :cond_1

    new-instance p2, Lڽتٺۊڗ؜/ح;

    invoke-direct {p2}, Lڽتٺۊڗ؜/ح;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-static {p2}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object p2

    invoke-interface {p1, p2}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    instance-of p2, p1, Lڽتٺۊڗ؜/ز;

    if-eqz p2, :cond_3

    check-cast p1, Lڽتٺۊڗ؜/ز;

    iget-object p1, p1, Lڽتٺۊڗ؜/ز;->آ:Lںڍڒڸ/ئ;

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object p2

    new-instance v0, Lڽتٺۊڗ؜/ة;

    invoke-direct {v0, p2}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    new-instance p2, Lڽتٺۊڗ؜/ث;

    invoke-direct {p2, v0}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    goto :goto_2

    :cond_3
    instance-of p2, p1, Lڽتٺۊڗ؜/ؠ;

    if-eqz p2, :cond_5

    check-cast p1, Lڽتٺۊڗ؜/ؠ;

    iget-object p2, p1, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    invoke-static {p2}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p1, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    sget-object v0, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    iput-object v0, p1, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    iget-object p1, p1, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    invoke-virtual {p1}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object p1

    if-nez p1, :cond_4

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1

    :cond_4
    invoke-static {p1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object p1

    :goto_1
    invoke-virtual {p2, p1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    :goto_2
    return-void

    :cond_5
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected waiter: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ؾ(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 4

    instance-of v0, p1, Lڽتٺۊڗ؜/ز;

    iget-object v1, p0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.channels.ReceiveCatching<E of kotlinx.coroutines.channels.BufferedChannel>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lڽتٺۊڗ؜/ز;

    sget-object v0, Lڽتٺۊڗ؜/ث;->ؠ:Lڽتٺۊڗ؜/ت;

    new-instance v0, Lڽتٺۊڗ؜/ث;

    invoke-direct {v0, p2}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    iget-object p1, p1, Lڽتٺۊڗ؜/ز;->آ:Lںڍڒڸ/ئ;

    if-eqz v1, :cond_0

    iget-object v2, p1, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    new-instance v3, Lڽتٺۊڗ؜/ء;

    invoke-direct {v3, v1, p2, v2}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    move-object v2, v3

    :cond_0
    invoke-static {p1, v0, v2}, Lڽتٺۊڗ؜/ئ;->؋(Lںڍڒڸ/إ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Z

    move-result p1

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lڽتٺۊڗ؜/ؠ;

    if-eqz v0, :cond_3

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.channels.BufferedChannel.BufferedChannelIterator<E of kotlinx.coroutines.channels.BufferedChannel>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lڽتٺۊڗ؜/ؠ;

    iget-object v0, p1, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iput-object v2, p1, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    iput-object p2, p1, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p1, p1, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    iget-object p1, p1, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz p1, :cond_2

    new-instance v2, Lڽتٺۊڗ؜/ء;

    iget-object v3, v0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-direct {v2, p1, p2, v3}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    :cond_2
    invoke-static {v0, v1, v2}, Lڽتٺۊڗ؜/ئ;->؋(Lںڍڒڸ/إ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Z

    move-result p1

    goto :goto_0

    :cond_3
    instance-of v0, p1, Lںڍڒڸ/إ;

    if-eqz v0, :cond_5

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<E of kotlinx.coroutines.channels.BufferedChannel>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lںڍڒڸ/إ;

    if-eqz v1, :cond_4

    move-object v0, p1

    check-cast v0, Lںڍڒڸ/ئ;

    new-instance v2, Lڽتٺۊڗ؜/ء;

    iget-object v0, v0, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-direct {v2, v1, p2, v0}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    :cond_4
    invoke-static {p1, p2, v2}, Lڽتٺۊڗ؜/ئ;->؋(Lںڍڒڸ/إ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Z

    move-result p1

    :goto_0
    return p1

    :cond_5
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected receiver type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;
    .locals 6

    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v0

    const-wide v1, 0xfffffffffffffffL

    sget-object v3, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    if-nez v0, :cond_1

    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    and-long/2addr v4, v1

    cmp-long v4, p3, v4

    if-ltz v4, :cond_2

    if-nez p5, :cond_0

    sget-object p1, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    return-object p1

    :cond_0
    invoke-virtual {p1, p2, v0, p5}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    sget-object p1, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    return-object p1

    :cond_1
    sget-object v4, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_2

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v0, v4}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ث(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_2
    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    sget-object v4, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_3

    goto :goto_1

    :cond_3
    sget-object v4, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_4

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v0, v4}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_4
    sget-object v4, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_5

    goto :goto_3

    :cond_5
    sget-object v5, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v5, :cond_6

    goto :goto_3

    :cond_6
    sget-object v5, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v5, :cond_7

    goto :goto_2

    :cond_7
    sget-object v5, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v5, :cond_2

    sget-object v5, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v0, v5}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    instance-of p3, v0, Lڽتٺۊڗ؜/ص;

    if-eqz p3, :cond_8

    check-cast v0, Lڽتٺۊڗ؜/ص;

    iget-object v0, v0, Lڽتٺۊڗ؜/ص;->؋:Lںڍڒڸ/ڃ;

    :cond_8
    invoke-static {v0}, Lڽتٺۊڗ؜/ؤ;->ؿ(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_9

    sget-object p3, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, p3}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    :goto_0
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ث(I)Ljava/lang/Object;

    move-result-object p1

    goto :goto_4

    :cond_9
    invoke-virtual {p1, p2, v4}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    const/4 p4, 0x0

    invoke-virtual {p1, p2, p4}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    if-eqz p3, :cond_b

    goto :goto_2

    :cond_a
    :goto_1
    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    and-long/2addr v4, v1

    cmp-long v4, p3, v4

    if-gez v4, :cond_c

    sget-object v4, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v0, v4}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    :cond_b
    :goto_3
    sget-object p1, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    goto :goto_4

    :cond_c
    if-nez p5, :cond_d

    sget-object p1, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    goto :goto_4

    :cond_d
    invoke-virtual {p1, p2, v0, p5}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ح()V

    sget-object p1, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    :goto_4
    return-object p1
.end method

.method public final ف(Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 6

    :cond_0
    invoke-virtual {p1, p2}, Lڽتٺۊڗ؜/ج;->ة(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-nez v0, :cond_4

    invoke-virtual {p0, p4, p5}, Lڽتٺۊڗ؜/ؤ;->ة(J)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p7, :cond_1

    sget-object v0, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v4, v0}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_1
    if-eqz p7, :cond_2

    sget-object v0, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v4, v0}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2, v3}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    return v2

    :cond_2
    if-nez p6, :cond_3

    const/4 p1, 0x3

    return p1

    :cond_3
    invoke-virtual {p1, p2, v4, p6}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x2

    return p1

    :cond_4
    sget-object v5, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v5, :cond_5

    sget-object v2, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, v0, v2}, Lڽتٺۊڗ؜/ج;->ب(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_5
    sget-object p4, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    const/4 p5, 0x5

    if-ne v0, p4, :cond_6

    invoke-virtual {p1, p2, v4}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    return p5

    :cond_6
    sget-object p6, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p6, :cond_7

    invoke-virtual {p1, p2, v4}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    return p5

    :cond_7
    sget-object p6, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, p6, :cond_8

    invoke-virtual {p1, p2, v4}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->إ()Z

    return v2

    :cond_8
    invoke-virtual {p1, p2, v4}, Lڽتٺۊڗ؜/ج;->ج(ILjava/lang/Object;)V

    instance-of p6, v0, Lڽتٺۊڗ؜/ص;

    if-eqz p6, :cond_9

    check-cast v0, Lڽتٺۊڗ؜/ص;

    iget-object v0, v0, Lڽتٺۊڗ؜/ص;->؋:Lںڍڒڸ/ڃ;

    :cond_9
    invoke-virtual {p0, v0, p3}, Lڽتٺۊڗ؜/ؤ;->ؾ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_a

    sget-object p3, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {p1, p2, p3}, Lڽتٺۊڗ؜/ج;->ح(ILئٱنۃؖۊڄئ/آ;)V

    goto :goto_0

    :cond_a
    iget-object p3, p1, Lڽتٺۊڗ؜/ج;->ا:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    mul-int/lit8 p6, p2, 0x2

    add-int/2addr p6, v1

    invoke-virtual {p3, p6, p4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    if-eq p3, p4, :cond_b

    invoke-virtual {p1, p2, v1}, Lڽتٺۊڗ؜/ج;->ت(IZ)V

    :cond_b
    move v3, p5

    :goto_0
    return v3
.end method

.method public final ق(J)V
    .locals 19

    move-object/from16 v6, p0

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ظ()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    sget v0, Lڽتٺۊڗ؜/ئ;->ء:I

    const/4 v7, 0x0

    move v1, v7

    :goto_0
    sget-object v8, Lڽتٺۊڗ؜/ؤ;->ا:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide v9, 0x3fffffffffffffffL    # 1.9999999999999998

    if-ge v1, v0, :cond_2

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v2

    invoke-virtual {v8, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    and-long/2addr v4, v9

    cmp-long v4, v2, v4

    if-nez v4, :cond_1

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v8, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    and-long v0, v2, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    add-long v4, v11, v0

    move-object v0, v8

    move-object/from16 v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_3
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v0

    invoke-virtual {v8, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    and-long v4, v2, v9

    and-long v13, v2, v11

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-eqz v13, :cond_4

    const/4 v13, 0x1

    goto :goto_2

    :cond_4
    move v13, v7

    :goto_2
    cmp-long v14, v0, v4

    if-nez v14, :cond_6

    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->د()J

    move-result-wide v17

    cmp-long v0, v0, v17

    if-nez v0, :cond_6

    :cond_5
    invoke-virtual {v8, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v2

    and-long v0, v2, v9

    add-long v4, v15, v0

    move-object v0, v8

    move-object/from16 v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_5

    return-void

    :cond_6
    if-nez v13, :cond_3

    add-long/2addr v4, v11

    move-object v0, v8

    move-object/from16 v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    goto :goto_1
.end method
