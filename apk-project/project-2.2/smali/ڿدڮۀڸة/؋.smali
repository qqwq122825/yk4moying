.class public final Lڿدڮۀڸة/؋;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field public static final ت:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile indexInArray:I

.field private volatile nextParkedWorker:Ljava/lang/Object;

.field private volatile workerCtl:I

.field public final آ:Lڿدڮۀڸة/ت;

.field public final أ:Lkotlin/jvm/internal/ر;

.field public ؤ:I

.field public إ:J

.field public ئ:J

.field public ا:I

.field public ب:Z

.field public final synthetic ة:Lڿدڮۀڸة/ؠ;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lڿدڮۀڸة/؋;

    const-string v1, "workerCtl"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lڿدڮۀڸة/؋;->ت:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lڿدڮۀڸة/ؠ;I)V
    .locals 0

    iput-object p1, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    new-instance p1, Lڿدڮۀڸة/ت;

    invoke-direct {p1}, Lڿدڮۀڸة/ت;-><init>()V

    iput-object p1, p0, Lڿدڮۀڸة/؋;->آ:Lڿدڮۀڸة/ت;

    new-instance p1, Lkotlin/jvm/internal/ر;

    invoke-direct {p1}, Lkotlin/jvm/internal/ر;-><init>()V

    iput-object p1, p0, Lڿدڮۀڸة/؋;->أ:Lkotlin/jvm/internal/ر;

    const/4 p1, 0x4

    iput p1, p0, Lڿدڮۀڸة/؋;->ؤ:I

    sget-object p1, Lڿدڮۀڸة/ؠ;->ج:Lئٱنۃؖۊڄئ/آ;

    iput-object p1, p0, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    sget-object p1, Lڴۄۓڿڟۅڥؾ/أ;->آ:Lڴۄۓڿڟۅڥؾ/آ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lڴۄۓڿڟۅڥؾ/أ;->أ:Lڴۄۓڿڟۅڥؾ/؋;

    invoke-virtual {p1}, Lڴۄۓڿڟۅڥؾ/؋;->؋()Ljava/util/Random;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Random;->nextInt()I

    move-result p1

    iput p1, p0, Lڿدڮۀڸة/؋;->ا:I

    invoke-virtual {p0, p2}, Lڿدڮۀڸة/؋;->ؤ(I)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 20

    move-object/from16 v1, p0

    :cond_0
    :goto_0
    const/4 v0, 0x0

    move v2, v0

    :cond_1
    :goto_1
    iget-object v3, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lڿدڮۀڸة/ؠ;->ث:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    goto :goto_2

    :cond_2
    move v3, v0

    :goto_2
    const/4 v5, 0x5

    if-nez v3, :cond_19

    iget v3, v1, Lڿدڮۀڸة/؋;->ؤ:I

    if-eq v3, v5, :cond_19

    iget-boolean v3, v1, Lڿدڮۀڸة/؋;->ب:Z

    invoke-virtual {v1, v3}, Lڿدڮۀڸة/؋;->؋(Z)Lڿدڮۀڸة/ئ;

    move-result-object v3

    const-wide/32 v6, -0x200000

    const/4 v8, 0x3

    const-wide/16 v9, 0x0

    if-eqz v3, :cond_9

    iput-wide v9, v1, Lڿدڮۀڸة/؋;->ئ:J

    iget-object v0, v3, Lڿدڮۀڸة/ئ;->أ:Lٽچڃ/أ;

    iget v2, v0, Lٽچڃ/أ;->آ:I

    iput-wide v9, v1, Lڿدڮۀڸة/؋;->إ:J

    iget v0, v1, Lڿدڮۀڸة/؋;->ؤ:I

    const/4 v4, 0x2

    if-ne v0, v8, :cond_3

    iput v4, v1, Lڿدڮۀڸة/؋;->ؤ:I

    :cond_3
    iget-object v8, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    if-nez v2, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v1, v4}, Lڿدڮۀڸة/؋;->ئ(I)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {v8}, Lڿدڮۀڸة/ؠ;->ؿ()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_3

    :cond_5
    sget-object v0, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Lڿدڮۀڸة/ؠ;->ؾ(J)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v8}, Lڿدڮۀڸة/ؠ;->ؿ()Z

    :cond_7
    :goto_3
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_0
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object v3, v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v4

    invoke-interface {v4, v0, v3}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :goto_4
    if-nez v2, :cond_8

    goto :goto_0

    :cond_8
    sget-object v0, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, v8, v6, v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    iget v0, v1, Lڿدڮۀڸة/؋;->ؤ:I

    if-eq v0, v5, :cond_0

    const/4 v0, 0x4

    iput v0, v1, Lڿدڮۀڸة/؋;->ؤ:I

    goto :goto_0

    :cond_9
    iput-boolean v0, v1, Lڿدڮۀڸة/؋;->ب:Z

    iget-wide v11, v1, Lڿدڮۀڸة/؋;->ئ:J

    cmp-long v3, v11, v9

    if-eqz v3, :cond_b

    if-nez v2, :cond_a

    const/4 v2, 0x1

    goto/16 :goto_1

    :cond_a
    invoke-virtual {v1, v8}, Lڿدڮۀڸة/؋;->ئ(I)Z

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    iget-wide v2, v1, Lڿدڮۀڸة/؋;->ئ:J

    invoke-static {v2, v3}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    iput-wide v9, v1, Lڿدڮۀڸة/؋;->ئ:J

    goto/16 :goto_0

    :cond_b
    iget-object v3, v1, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    sget-object v11, Lڿدڮۀڸة/ؠ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-eq v3, v11, :cond_c

    const/4 v3, 0x1

    goto :goto_5

    :cond_c
    move v3, v0

    :goto_5
    const-wide/32 v12, 0x1fffff

    if-nez v3, :cond_e

    iget-object v3, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v1, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    if-eq v4, v11, :cond_d

    goto/16 :goto_1

    :cond_d
    sget-object v14, Lڿدڮۀڸة/ؠ;->ة:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v14, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v16

    and-long v4, v16, v12

    long-to-int v4, v4

    const-wide/32 v8, 0x200000

    add-long v8, v16, v8

    and-long/2addr v8, v6

    iget v5, v1, Lڿدڮۀڸة/؋;->indexInArray:I

    iget-object v10, v3, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    invoke-virtual {v10, v4}, Lھۥٓڍچ/ذ;->ؠ(I)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    int-to-long v4, v5

    or-long v18, v8, v4

    move-object v15, v3

    invoke-virtual/range {v14 .. v19}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v4

    if-eqz v4, :cond_d

    goto/16 :goto_1

    :cond_e
    sget-object v3, Lڿدڮۀڸة/؋;->ت:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v6, -0x1

    invoke-virtual {v3, v1, v6}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    :goto_6
    iget-object v3, v1, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    sget-object v7, Lڿدڮۀڸة/ؠ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-eq v3, v7, :cond_f

    const/4 v3, 0x1

    goto :goto_7

    :cond_f
    move v3, v0

    :goto_7
    if-eqz v3, :cond_1

    sget-object v3, Lڿدڮۀڸة/؋;->ت:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v7

    if-ne v7, v6, :cond_1

    iget-object v7, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, Lڿدڮۀڸة/ؠ;->ث:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v11, v7}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v7

    if-eqz v7, :cond_10

    const/4 v7, 0x1

    goto :goto_8

    :cond_10
    move v7, v0

    :goto_8
    if-nez v7, :cond_1

    iget v7, v1, Lڿدڮۀڸة/؋;->ؤ:I

    if-ne v7, v5, :cond_11

    goto/16 :goto_1

    :cond_11
    invoke-virtual {v1, v8}, Lڿدڮۀڸة/؋;->ئ(I)Z

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    iget-wide v14, v1, Lڿدڮۀڸة/؋;->إ:J

    cmp-long v7, v14, v9

    if-nez v7, :cond_12

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    iget-object v7, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    iget-wide v4, v7, Lڿدڮۀڸة/ؠ;->ؤ:J

    add-long/2addr v14, v4

    iput-wide v14, v1, Lڿدڮۀڸة/؋;->إ:J

    :cond_12
    iget-object v4, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    iget-wide v4, v4, Lڿدڮۀڸة/ؠ;->ؤ:J

    invoke-static {v4, v5}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    iget-wide v14, v1, Lڿدڮۀڸة/؋;->إ:J

    sub-long/2addr v4, v14

    cmp-long v4, v4, v9

    if-ltz v4, :cond_18

    iput-wide v9, v1, Lڿدڮۀڸة/؋;->إ:J

    iget-object v4, v1, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    iget-object v5, v4, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    monitor-enter v5

    :try_start_1
    invoke-virtual {v11, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v7

    if-eqz v7, :cond_13

    const/4 v7, 0x1

    goto :goto_9

    :cond_13
    move v7, v0

    :goto_9
    if-eqz v7, :cond_14

    :goto_a
    const/4 v11, 0x1

    goto :goto_b

    :cond_14
    sget-object v7, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v14

    and-long/2addr v14, v12

    long-to-int v11, v14

    iget v14, v4, Lڿدڮۀڸة/ؠ;->آ:I

    if-gt v11, v14, :cond_15

    goto :goto_a

    :cond_15
    const/4 v11, 0x1

    invoke-virtual {v3, v1, v6, v11}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v3, :cond_16

    :goto_b
    monitor-exit v5

    goto :goto_c

    :cond_16
    :try_start_2
    iget v3, v1, Lڿدڮۀڸة/؋;->indexInArray:I

    invoke-virtual {v1, v0}, Lڿدڮۀڸة/؋;->ؤ(I)V

    invoke-virtual {v4, v1, v3, v0}, Lڿدڮۀڸة/ؠ;->ر(Lڿدڮۀڸة/؋;II)V

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndDecrement(Ljava/lang/Object;)J

    move-result-wide v14

    and-long/2addr v14, v12

    long-to-int v7, v14

    if-eq v7, v3, :cond_17

    iget-object v14, v4, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    invoke-virtual {v14, v7}, Lھۥٓڍچ/ذ;->ؠ(I)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    check-cast v14, Lڿدڮۀڸة/؋;

    iget-object v15, v4, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    invoke-virtual {v15, v3, v14}, Lھۥٓڍچ/ذ;->ء(ILڿدڮۀڸة/؋;)V

    invoke-virtual {v14, v3}, Lڿدڮۀڸة/؋;->ؤ(I)V

    invoke-virtual {v4, v14, v7, v3}, Lڿدڮۀڸة/ؠ;->ر(Lڿدڮۀڸة/؋;II)V

    :cond_17
    iget-object v3, v4, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    const/4 v4, 0x0

    invoke-virtual {v3, v7, v4}, Lھۥٓڍچ/ذ;->ء(ILڿدڮۀڸة/؋;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v5

    const/4 v3, 0x5

    iput v3, v1, Lڿدڮۀڸة/؋;->ؤ:I

    move v5, v3

    goto/16 :goto_6

    :catchall_1
    move-exception v0

    monitor-exit v5

    throw v0

    :cond_18
    :goto_c
    const/4 v5, 0x5

    goto/16 :goto_6

    :cond_19
    move v2, v5

    invoke-virtual {v1, v2}, Lڿدڮۀڸة/؋;->ئ(I)Z

    return-void
.end method

.method public final ؋(Z)Lڿدڮۀڸة/ئ;
    .locals 10

    iget v0, p0, Lڿدڮۀڸة/؋;->ؤ:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    sget-object v9, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    :cond_1
    invoke-virtual {v9, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v5

    const-wide v3, 0x7ffffc0000000000L

    and-long/2addr v3, v5

    const/16 v7, 0x2a

    shr-long/2addr v3, v7

    long-to-int v3, v3

    if-nez v3, :cond_2

    move v0, v2

    goto :goto_0

    :cond_2
    const-wide v3, 0x40000000000L

    sub-long v7, v5, v3

    sget-object v3, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object v4, v0

    invoke-virtual/range {v3 .. v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v3

    if-eqz v3, :cond_1

    move v0, v1

    :goto_0
    if-eqz v0, :cond_3

    iput v1, p0, Lڿدڮۀڸة/؋;->ؤ:I

    :goto_1
    move v0, v1

    goto :goto_2

    :cond_3
    move v0, v2

    :goto_2
    iget-object v3, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    const/4 v4, 0x0

    iget-object v5, p0, Lڿدڮۀڸة/؋;->آ:Lڿدڮۀڸة/ت;

    if-eqz v0, :cond_a

    if-eqz p1, :cond_8

    iget p1, v3, Lڿدڮۀڸة/ؠ;->آ:I

    mul-int/lit8 p1, p1, 0x2

    invoke-virtual {p0, p1}, Lڿدڮۀڸة/؋;->آ(I)I

    move-result p1

    if-nez p1, :cond_4

    goto :goto_3

    :cond_4
    move v1, v2

    :goto_3
    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lڿدڮۀڸة/؋;->أ()Lڿدڮۀڸة/ئ;

    move-result-object p1

    if-eqz p1, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lڿدڮۀڸة/ت;->ؠ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, v5, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->getAndSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lڿدڮۀڸة/ئ;

    if-nez p1, :cond_6

    invoke-virtual {v5}, Lڿدڮۀڸة/ت;->ؠ()Lڿدڮۀڸة/ئ;

    move-result-object p1

    :cond_6
    if-eqz p1, :cond_7

    goto :goto_4

    :cond_7
    if-nez v1, :cond_9

    invoke-virtual {p0}, Lڿدڮۀڸة/؋;->أ()Lڿدڮۀڸة/ئ;

    move-result-object p1

    if-eqz p1, :cond_9

    goto :goto_4

    :cond_8
    invoke-virtual {p0}, Lڿدڮۀڸة/؋;->أ()Lڿدڮۀڸة/ئ;

    move-result-object p1

    if-eqz p1, :cond_9

    goto :goto_4

    :cond_9
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lڿدڮۀڸة/؋;->ا(I)Lڿدڮۀڸة/ئ;

    move-result-object p1

    :goto_4
    return-object p1

    :cond_a
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_b
    sget-object p1, Lڿدڮۀڸة/ت;->ؠ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڿدڮۀڸة/ئ;

    if-nez v0, :cond_c

    goto :goto_7

    :cond_c
    iget-object v6, v0, Lڿدڮۀڸة/ئ;->أ:Lٽچڃ/أ;

    iget v6, v6, Lٽچڃ/أ;->آ:I

    if-ne v6, v1, :cond_d

    move v6, v1

    goto :goto_5

    :cond_d
    move v6, v2

    :goto_5
    if-ne v6, v1, :cond_10

    :cond_e
    invoke-virtual {p1, v5, v0, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    move p1, v1

    goto :goto_6

    :cond_f
    invoke-virtual {p1, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v0, :cond_e

    move p1, v2

    :goto_6
    if-eqz p1, :cond_b

    move-object v4, v0

    goto :goto_8

    :cond_10
    :goto_7
    sget-object p1, Lڿدڮۀڸة/ت;->آ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {p1, v5}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result p1

    sget-object v0, Lڿدڮۀڸة/ت;->ء:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, v5}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    :cond_11
    if-eq p1, v0, :cond_13

    sget-object v2, Lڿدڮۀڸة/ت;->أ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, v5}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_12

    goto :goto_8

    :cond_12
    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v5, v0, v1}, Lڿدڮۀڸة/ت;->ء(IZ)Lڿدڮۀڸة/ئ;

    move-result-object v2

    if-eqz v2, :cond_11

    move-object v4, v2

    :cond_13
    :goto_8
    if-nez v4, :cond_14

    iget-object p1, v3, Lڿدڮۀڸة/ؠ;->ا:Lڿدڮۀڸة/أ;

    invoke-virtual {p1}, Lھۥٓڍچ/ة;->آ()Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lڿدڮۀڸة/ئ;

    if-nez v4, :cond_14

    invoke-virtual {p0, v1}, Lڿدڮۀڸة/؋;->ا(I)Lڿدڮۀڸة/ئ;

    move-result-object v4

    :cond_14
    return-object v4
.end method

.method public final ؠ()I
    .locals 1

    iget v0, p0, Lڿدڮۀڸة/؋;->indexInArray:I

    return v0
.end method

.method public final ء()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    return-object v0
.end method

.method public final آ(I)I
    .locals 3

    iget v0, p0, Lڿدڮۀڸة/؋;->ا:I

    shl-int/lit8 v1, v0, 0xd

    xor-int/2addr v0, v1

    shr-int/lit8 v1, v0, 0x11

    xor-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x5

    xor-int/2addr v0, v1

    iput v0, p0, Lڿدڮۀڸة/؋;->ا:I

    add-int/lit8 v1, p1, -0x1

    and-int v2, v1, p1

    if-nez v2, :cond_0

    and-int p1, v0, v1

    return p1

    :cond_0
    const v1, 0x7fffffff

    and-int/2addr v0, v1

    rem-int/2addr v0, p1

    return v0
.end method

.method public final أ()Lڿدڮۀڸة/ئ;
    .locals 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lڿدڮۀڸة/؋;->آ(I)I

    move-result v0

    iget-object v1, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    if-nez v0, :cond_1

    iget-object v0, v1, Lڿدڮۀڸة/ؠ;->ئ:Lڿدڮۀڸة/أ;

    invoke-virtual {v0}, Lھۥٓڍچ/ة;->آ()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڿدڮۀڸة/ئ;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, v1, Lڿدڮۀڸة/ؠ;->ا:Lڿدڮۀڸة/أ;

    :goto_0
    invoke-virtual {v0}, Lھۥٓڍچ/ة;->آ()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڿدڮۀڸة/ئ;

    return-object v0

    :cond_1
    iget-object v0, v1, Lڿدڮۀڸة/ؠ;->ا:Lڿدڮۀڸة/أ;

    invoke-virtual {v0}, Lھۥٓڍچ/ة;->آ()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڿدڮۀڸة/ئ;

    if-eqz v0, :cond_2

    return-object v0

    :cond_2
    iget-object v0, v1, Lڿدڮۀڸة/ؠ;->ئ:Lڿدڮۀڸة/أ;

    goto :goto_0
.end method

.method public final ؤ(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    iget-object v1, v1, Lڿدڮۀڸة/ؠ;->إ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-worker-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string v1, "TERMINATED"

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    iput p1, p0, Lڿدڮۀڸة/؋;->indexInArray:I

    return-void
.end method

.method public final إ(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lڿدڮۀڸة/؋;->nextParkedWorker:Ljava/lang/Object;

    return-void
.end method

.method public final ئ(I)Z
    .locals 6

    iget v0, p0, Lڿدڮۀڸة/؋;->ؤ:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    sget-object v2, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide v3, 0x40000000000L

    iget-object v5, p0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v2, v5, v3, v4}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    :cond_1
    if-eq v0, p1, :cond_2

    iput p1, p0, Lڿدڮۀڸة/؋;->ؤ:I

    :cond_2
    return v1
.end method

.method public final ا(I)Lڿدڮۀڸة/ئ;
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    sget-object v2, Lڿدڮۀڸة/ؠ;->ت:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    iget-object v3, v0, Lڿدڮۀڸة/؋;->ة:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    move-result-wide v4

    const-wide/32 v6, 0x1fffff

    and-long/2addr v4, v6

    long-to-int v2, v4

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-ge v2, v4, :cond_0

    return-object v5

    :cond_0
    invoke-virtual {v0, v2}, Lڿدڮۀڸة/؋;->آ(I)I

    move-result v6

    const/4 v10, 0x0

    const-wide v11, 0x7fffffffffffffffL

    :goto_0
    if-ge v10, v2, :cond_13

    const/4 v15, 0x1

    add-int/2addr v6, v15

    if-le v6, v2, :cond_1

    move v6, v15

    :cond_1
    iget-object v4, v3, Lڿدڮۀڸة/ؠ;->ب:Lھۥٓڍچ/ذ;

    invoke-virtual {v4, v6}, Lھۥٓڍچ/ذ;->ؠ(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lڿدڮۀڸة/؋;

    if-eqz v4, :cond_11

    if-eq v4, v0, :cond_11

    const/4 v9, 0x3

    iget-object v4, v4, Lڿدڮۀڸة/؋;->آ:Lڿدڮۀڸة/ت;

    if-ne v1, v9, :cond_2

    invoke-virtual {v4}, Lڿدڮۀڸة/ت;->ؠ()Lڿدڮۀڸة/ئ;

    move-result-object v9

    goto :goto_3

    :cond_2
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lڿدڮۀڸة/ت;->آ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v9, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v9

    sget-object v7, Lڿدڮۀڸة/ت;->ء:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v7

    if-ne v1, v15, :cond_3

    move v8, v15

    goto :goto_1

    :cond_3
    const/4 v8, 0x0

    :goto_1
    if-eq v9, v7, :cond_5

    if-eqz v8, :cond_4

    sget-object v13, Lڿدڮۀڸة/ت;->أ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v13, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v13

    if-nez v13, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v13, v9, 0x1

    invoke-virtual {v4, v9, v8}, Lڿدڮۀڸة/ت;->ء(IZ)Lڿدڮۀڸة/ئ;

    move-result-object v9

    if-nez v9, :cond_6

    move v9, v13

    goto :goto_1

    :cond_5
    :goto_2
    move-object v9, v5

    :cond_6
    :goto_3
    iget-object v13, v0, Lڿدڮۀڸة/؋;->أ:Lkotlin/jvm/internal/ر;

    if-eqz v9, :cond_7

    iput-object v9, v13, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    move/from16 v18, v6

    goto :goto_b

    :cond_7
    :goto_4
    sget-object v9, Lڿدڮۀڸة/ت;->ؠ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v9, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lڿدڮۀڸة/ئ;

    if-nez v14, :cond_8

    goto :goto_7

    :cond_8
    iget-object v7, v14, Lڿدڮۀڸة/ئ;->أ:Lٽچڃ/أ;

    iget v7, v7, Lٽچڃ/أ;->آ:I

    if-ne v7, v15, :cond_9

    move v7, v15

    goto :goto_5

    :cond_9
    const/4 v7, 0x0

    :goto_5
    if-eqz v7, :cond_a

    move v7, v15

    goto :goto_6

    :cond_a
    const/4 v7, 0x2

    :goto_6
    and-int/2addr v7, v1

    if-nez v7, :cond_b

    :goto_7
    const-wide/16 v7, -0x2

    move/from16 v18, v6

    :goto_8
    const-wide/16 v5, -0x1

    goto :goto_c

    :cond_b
    sget-object v7, Lڿدڮۀڸة/ب;->ؤ:Lڿدڮۀڸة/ؤ;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    move/from16 v18, v6

    iget-wide v5, v14, Lڿدڮۀڸة/ئ;->آ:J

    sub-long/2addr v7, v5

    sget-wide v5, Lڿدڮۀڸة/ب;->ؠ:J

    cmp-long v19, v7, v5

    if-gez v19, :cond_c

    sub-long v7, v5, v7

    goto :goto_8

    :cond_c
    :goto_9
    const/4 v5, 0x0

    invoke-virtual {v9, v4, v14, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    move v5, v15

    goto :goto_a

    :cond_d
    invoke-virtual {v9, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v14, :cond_10

    const/4 v5, 0x0

    :goto_a
    if-eqz v5, :cond_f

    iput-object v14, v13, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    :goto_b
    const-wide/16 v5, -0x1

    const-wide/16 v7, -0x1

    :goto_c
    cmp-long v4, v7, v5

    if-nez v4, :cond_e

    iget-object v1, v13, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    check-cast v1, Lڿدڮۀڸة/ئ;

    const/4 v2, 0x0

    iput-object v2, v13, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    return-object v1

    :cond_e
    const-wide/16 v16, 0x0

    cmp-long v4, v7, v16

    if-lez v4, :cond_12

    invoke-static {v11, v12, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    goto :goto_d

    :cond_f
    const-wide/16 v16, 0x0

    move/from16 v6, v18

    const/4 v5, 0x0

    goto :goto_4

    :cond_10
    const-wide/16 v16, 0x0

    goto :goto_9

    :cond_11
    move/from16 v18, v6

    :cond_12
    :goto_d
    add-int/lit8 v10, v10, 0x1

    move/from16 v6, v18

    const/4 v4, 0x2

    const/4 v5, 0x0

    goto/16 :goto_0

    :cond_13
    const-wide v4, 0x7fffffffffffffffL

    const-wide/16 v16, 0x0

    cmp-long v1, v11, v4

    if-eqz v1, :cond_14

    goto :goto_e

    :cond_14
    move-wide/from16 v11, v16

    :goto_e
    iput-wide v11, v0, Lڿدڮۀڸة/؋;->ئ:J

    const/4 v1, 0x0

    return-object v1
.end method
