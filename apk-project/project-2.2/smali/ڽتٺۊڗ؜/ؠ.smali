.class public final Lڽتٺۊڗ؜/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ڃ;


# instance fields
.field public آ:Ljava/lang/Object;

.field public أ:Lںڍڒڸ/ئ;

.field public final synthetic ؤ:Lڽتٺۊڗ؜/ؤ;


# direct methods
.method public constructor <init>(Lڽتٺۊڗ؜/ؤ;)V
    .locals 0

    iput-object p1, p0, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object p1, Lڽتٺۊڗ؜/ئ;->خ:Lئٱنۃؖۊڄئ/آ;

    iput-object p1, p0, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Lھۥٓڍچ/ز;I)V
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lںڍڒڸ/ئ;->؋(Lھۥٓڍچ/ز;I)V

    :cond_0
    return-void
.end method

.method public final ؠ(Lګؓ۝ؒڄس/ء;)Ljava/lang/Object;
    .locals 17

    move-object/from16 v7, p0

    const/4 v0, 0x0

    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    iget-object v8, v7, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    invoke-virtual {v1, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    :goto_0
    invoke-virtual {v8}, Lڽتٺۊڗ؜/ؤ;->ض()Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v0, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    iput-object v0, v7, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    invoke-virtual {v8}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_7

    :cond_0
    sget v1, Lھۥٓڍچ/س;->؋:I

    throw v0

    :cond_1
    sget-object v2, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v9

    sget v2, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v2, v2

    div-long v4, v9, v2

    rem-long v2, v9, v2

    long-to-int v11, v2

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    invoke-virtual {v8, v4, v5, v1}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    move-object v12, v2

    goto :goto_1

    :cond_3
    move-object v12, v1

    :goto_1
    move-object v1, v8

    move-object v2, v12

    move v3, v11

    move-wide v4, v9

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v13, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v13, :cond_13

    sget-object v14, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v14, :cond_5

    invoke-virtual {v8}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, v9, v1

    if-gez v1, :cond_4

    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    :cond_4
    move-object v1, v12

    goto :goto_0

    :cond_5
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v0, :cond_12

    iget-object v0, v7, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v1

    invoke-static {v1}, Lںڍڒڸ/ش;->ؽ(Lڨڡئٸت/أ;)Lںڍڒڸ/ئ;

    move-result-object v15

    :try_start_0
    iput-object v15, v7, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    move-object v1, v0

    move-object v2, v12

    move v3, v11

    move-wide v4, v9

    move-object/from16 v6, p0

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v13, :cond_6

    invoke-virtual {v7, v12, v11}, Lڽتٺۊڗ؜/ؠ;->؋(Lھۥٓڍچ/ز;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_6

    :cond_6
    const/4 v11, 0x0

    iget-object v13, v15, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    iget-object v6, v0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-ne v1, v14, :cond_10

    :try_start_1
    invoke-virtual {v0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, v9, v1

    if-gez v1, :cond_7

    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    :cond_7
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڽتٺۊڗ؜/ج;

    :goto_2
    invoke-virtual {v0}, Lڽتٺۊڗ؜/ؤ;->ض()Z

    move-result v2

    if-eqz v2, :cond_9

    iget-object v0, v7, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iput-object v11, v7, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    sget-object v1, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    iput-object v1, v7, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    invoke-virtual {v8}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_8

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_3

    :cond_8
    invoke-static {v1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v1

    :goto_3
    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    goto/16 :goto_6

    :cond_9
    sget-object v2, Lڽتٺۊڗ؜/ؤ;->إ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v9

    sget v2, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v2, v2

    div-long v4, v9, v2

    rem-long v2, v9, v2

    long-to-int v12, v2

    iget-wide v2, v1, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_b

    invoke-virtual {v0, v4, v5, v1}, Lڽتٺۊڗ؜/ؤ;->خ(JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v2

    if-nez v2, :cond_a

    goto :goto_2

    :cond_a
    move-object v14, v2

    goto :goto_4

    :cond_b
    move-object v14, v1

    :goto_4
    move-object v1, v0

    move-object v2, v14

    move v3, v12

    move-wide v4, v9

    move-object/from16 v16, v6

    move-object/from16 v6, p0

    invoke-virtual/range {v1 .. v6}, Lڽتٺۊڗ؜/ؤ;->ـ(Lڽتٺۊڗ؜/ج;IJLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_c

    invoke-virtual {v7, v14, v12}, Lڽتٺۊڗ؜/ؠ;->؋(Lھۥٓڍچ/ز;I)V

    goto :goto_6

    :cond_c
    sget-object v2, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_e

    invoke-virtual {v0}, Lڽتٺۊڗ؜/ؤ;->س()J

    move-result-wide v1

    cmp-long v1, v9, v1

    if-gez v1, :cond_d

    invoke-virtual {v14}, Lھۥٓڍچ/ء;->؋()V

    :cond_d
    move-object v1, v14

    move-object/from16 v6, v16

    goto :goto_2

    :cond_e
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v0, :cond_f

    invoke-virtual {v14}, Lھۥٓڍچ/ء;->؋()V

    iput-object v1, v7, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    iput-object v11, v7, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v2, v16

    if-eqz v2, :cond_11

    new-instance v11, Lڽتٺۊڗ؜/ء;

    invoke-direct {v11, v2, v1, v13}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    goto :goto_5

    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unexpected"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    move-object v2, v6

    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    iput-object v1, v7, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    iput-object v11, v7, Lڽتٺۊڗ؜/ؠ;->أ:Lںڍڒڸ/ئ;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-eqz v2, :cond_11

    new-instance v11, Lڽتٺۊڗ؜/ء;

    invoke-direct {v11, v2, v1, v13}, Lڽتٺۊڗ؜/ء;-><init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V

    :cond_11
    :goto_5
    invoke-virtual {v15, v0, v11}, Lںڍڒڸ/ئ;->ش(Ljava/lang/Object;Lڽتٺۊڗ؜/ء;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_6
    invoke-virtual {v15}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v15}, Lںڍڒڸ/ئ;->س()V

    throw v0

    :cond_12
    invoke-virtual {v12}, Lھۥٓڍچ/ء;->؋()V

    iput-object v1, v7, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_7
    return-object v0

    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unreachable"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ء()Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    sget-object v1, Lڽتٺۊڗ؜/ئ;->خ:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_3

    iput-object v1, p0, Lڽتٺۊڗ؜/ؠ;->آ:Ljava/lang/Object;

    sget-object v1, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v1, :cond_1

    return-object v0

    :cond_1
    iget-object v0, p0, Lڽتٺۊڗ؜/ؠ;->ؤ:Lڽتٺۊڗ؜/ؤ;

    invoke-virtual {v0}, Lڽتٺۊڗ؜/ؤ;->ذ()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Lڽتٺۊڗ؜/ح;

    invoke-direct {v0}, Lڽتٺۊڗ؜/ح;-><init>()V

    :cond_2
    sget v1, Lھۥٓڍچ/س;->؋:I

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "`hasNext()` has not been invoked"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
