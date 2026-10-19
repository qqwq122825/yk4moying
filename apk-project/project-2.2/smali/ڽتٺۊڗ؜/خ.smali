.class public final Lڽتٺۊڗ؜/خ;
.super Lڽتٺۊڗ؜/ؤ;
.source "SourceFile"


# instance fields
.field public final ح:Lڽتٺۊڗ؜/؋;


# direct methods
.method public constructor <init>(ILڽتٺۊڗ؜/؋;Lڲٱۘۑدٿٰ/ت;)V
    .locals 4

    invoke-direct {p0, p1, p3}, Lڽتٺۊڗ؜/ؤ;-><init>(ILڲٱۘۑدٿٰ/ت;)V

    iput-object p2, p0, Lڽتٺۊڗ؜/خ;->ح:Lڽتٺۊڗ؜/؋;

    sget-object p3, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p2, p3, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    move p2, v0

    :goto_0
    if-nez p2, :cond_8

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "This implementation does not support suspension for senders, use "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p2, Lkotlin/jvm/internal/ز;->؋:Lkotlin/jvm/internal/س;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lkotlin/jvm/internal/آ;

    const-class p3, Lڽتٺۊڗ؜/ؤ;

    invoke-direct {p2, p3}, Lkotlin/jvm/internal/آ;-><init>(Ljava/lang/Class;)V

    const-string p3, "jClass"

    iget-object p2, p2, Lkotlin/jvm/internal/آ;->آ:Ljava/lang/Class;

    invoke-static {p2, p3}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result p3

    const/4 v2, 0x0

    if-nez p3, :cond_7

    invoke-virtual {p2}, Ljava/lang/Class;->isLocalClass()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getEnclosingMethod()Ljava/lang/reflect/Method;

    move-result-object p3

    const/16 v3, 0x24

    if-nez p3, :cond_3

    invoke-virtual {p2}, Ljava/lang/Class;->getEnclosingConstructor()Ljava/lang/reflect/Constructor;

    move-result-object p2

    if-nez p2, :cond_2

    const/4 p2, 0x6

    invoke-static {v2, v3, v0, v0, p2}, Lڹےف/ئ;->ڟ(Ljava/lang/CharSequence;CIZI)I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_1

    goto/16 :goto_2

    :cond_1
    add-int/2addr p2, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p3

    invoke-virtual {v2, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string p2, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    invoke-static {v2, p2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/lang/reflect/Constructor;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_1
    invoke-static {v2, p2}, Lڹےف/ئ;->ڱ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_4
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result p3

    sget-object v0, Lkotlin/jvm/internal/آ;->ؤ:Ljava/util/LinkedHashMap;

    if-eqz p3, :cond_6

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result p3

    const-string v1, "Array"

    if-eqz p3, :cond_5

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_5

    invoke-virtual {p2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_5
    if-nez v2, :cond_7

    move-object v2, v1

    goto :goto_2

    :cond_6
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_7

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    :cond_7
    :goto_2
    const-string p2, " instead"

    invoke-static {p1, v2, p2}, Landroidx/activity/result/؋;->ا(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_8
    if-lt p1, v1, :cond_9

    move v0, v1

    :cond_9
    if-eqz v0, :cond_a

    return-void

    :cond_a
    const-string p2, "Buffered channel capacity must be at least 1, but "

    const-string p3, " was specified"

    invoke-static {p2, p1, p3}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public final ؤ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lڽتٺۊڗ؜/خ;->ك(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 1

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lڽتٺۊڗ؜/خ;->ك(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p2

    instance-of v0, p2, Lڽتٺۊڗ؜/ة;

    if-eqz v0, :cond_2

    if-eqz v0, :cond_0

    check-cast p2, Lڽتٺۊڗ؜/ة;

    :cond_0
    iget-object p2, p0, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz p2, :cond_1

    const/4 v0, 0x0

    invoke-static {p2, p1, v0}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object p2

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    throw p1

    :cond_1
    invoke-virtual {p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object p1

    throw p1

    :cond_2
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final ط()Z
    .locals 2

    sget-object v0, Lڽتٺۊڗ؜/؋;->أ:Lڽتٺۊڗ؜/؋;

    iget-object v1, p0, Lڽتٺۊڗ؜/خ;->ح:Lڽتٺۊڗ؜/؋;

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final ك(Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 20

    move-object/from16 v8, p0

    sget-object v0, Lڽتٺۊڗ؜/؋;->ؤ:Lڽتٺۊڗ؜/؋;

    sget-object v9, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget-object v1, v8, Lڽتٺۊڗ؜/خ;->ح:Lڽتٺۊڗ؜/؋;

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-ne v1, v0, :cond_3

    invoke-super/range {p0 .. p1}, Lڽتٺۊڗ؜/ؤ;->ؤ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lڽتٺۊڗ؜/ت;

    xor-int/2addr v1, v11

    if-nez v1, :cond_2

    instance-of v1, v0, Lڽتٺۊڗ؜/ة;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_10

    iget-object v0, v8, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    if-eqz v0, :cond_10

    move-object/from16 v12, p1

    invoke-static {v0, v12, v10}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object v0

    if-nez v0, :cond_1

    goto/16 :goto_6

    :cond_1
    throw v0

    :cond_2
    :goto_0
    move-object v9, v0

    goto/16 :goto_6

    :cond_3
    move-object/from16 v12, p1

    sget-object v13, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    sget-object v0, Lڽتٺۊڗ؜/ؤ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڽتٺۊڗ؜/ج;

    :goto_1
    sget-object v1, Lڽتٺۊڗ؜/ؤ;->ؤ:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v1, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v1

    const-wide v3, 0xfffffffffffffffL

    and-long v14, v1, v3

    const/4 v3, 0x0

    invoke-virtual {v8, v1, v2, v3}, Lڽتٺۊڗ؜/ؤ;->ص(JZ)Z

    move-result v16

    sget v7, Lڽتٺۊڗ؜/ئ;->ؠ:I

    int-to-long v4, v7

    div-long v1, v14, v4

    rem-long v10, v14, v4

    long-to-int v10, v10

    move-wide/from16 v17, v4

    iget-wide v3, v0, Lھۥٓڍچ/ز;->ؤ:J

    cmp-long v3, v3, v1

    if-eqz v3, :cond_6

    invoke-static {v8, v1, v2, v0}, Lڽتٺۊڗ؜/ؤ;->؋(Lڽتٺۊڗ؜/ؤ;JLڽتٺۊڗ؜/ج;)Lڽتٺۊڗ؜/ج;

    move-result-object v1

    if-nez v1, :cond_5

    if-eqz v16, :cond_4

    goto :goto_4

    :cond_4
    const/4 v10, 0x0

    const/4 v11, 0x1

    goto :goto_1

    :cond_5
    move-object v11, v1

    goto :goto_2

    :cond_6
    move-object v11, v0

    :goto_2
    move-object/from16 v0, p0

    move-object v1, v11

    move v2, v10

    move-object/from16 v3, p1

    move-wide v4, v14

    move-object v6, v13

    move/from16 v19, v7

    move/from16 v7, v16

    invoke-static/range {v0 .. v7}, Lڽتٺۊڗ؜/ؤ;->ب(Lڽتٺۊڗ؜/ؤ;Lڽتٺۊڗ؜/ج;ILjava/lang/Object;JLjava/lang/Object;Z)I

    move-result v0

    if-eqz v0, :cond_f

    const/4 v1, 0x1

    if-eq v0, v1, :cond_10

    const/4 v2, 0x2

    if-eq v0, v2, :cond_a

    const/4 v2, 0x3

    if-eq v0, v2, :cond_9

    const/4 v2, 0x4

    if-eq v0, v2, :cond_8

    const/4 v2, 0x5

    if-eq v0, v2, :cond_7

    goto :goto_3

    :cond_7
    invoke-virtual {v11}, Lھۥٓڍچ/ء;->؋()V

    :goto_3
    move-object v0, v11

    const/4 v10, 0x0

    move v11, v1

    goto :goto_1

    :cond_8
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ر()J

    move-result-wide v0

    cmp-long v0, v14, v0

    if-gez v0, :cond_b

    invoke-virtual {v11}, Lھۥٓڍچ/ء;->؋()V

    goto :goto_4

    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unexpected"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    if-eqz v16, :cond_c

    invoke-virtual {v11}, Lھۥٓڍچ/ز;->ئ()V

    :cond_b
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lڽتٺۊڗ؜/ؤ;->ز()Ljava/lang/Throwable;

    move-result-object v0

    new-instance v9, Lڽتٺۊڗ؜/ة;

    invoke-direct {v9, v0}, Lڽتٺۊڗ؜/ة;-><init>(Ljava/lang/Throwable;)V

    goto :goto_6

    :cond_c
    instance-of v0, v13, Lںڍڒڸ/ڃ;

    if-eqz v0, :cond_d

    move-object v0, v13

    check-cast v0, Lںڍڒڸ/ڃ;

    goto :goto_5

    :cond_d
    const/4 v0, 0x0

    :goto_5
    if-eqz v0, :cond_e

    add-int v7, v10, v19

    invoke-interface {v0, v11, v7}, Lںڍڒڸ/ڃ;->؋(Lھۥٓڍچ/ز;I)V

    :cond_e
    iget-wide v0, v11, Lھۥٓڍچ/ز;->ؤ:J

    mul-long v0, v0, v17

    int-to-long v2, v10

    add-long/2addr v0, v2

    invoke-virtual {v8, v0, v1}, Lڽتٺۊڗ؜/ؤ;->ج(J)V

    goto :goto_6

    :cond_f
    invoke-virtual {v11}, Lھۥٓڍچ/ء;->؋()V

    :cond_10
    :goto_6
    return-object v9
.end method
