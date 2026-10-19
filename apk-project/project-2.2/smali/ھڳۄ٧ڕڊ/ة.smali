.class public final Lھڳۄ٧ڕڊ/ة;
.super Lګؓ۝ؒڄس/ئ;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public آ:Lڽتٺۊڗ؜/ب;

.field public أ:[B

.field public ؤ:I

.field public إ:I

.field public ئ:I

.field public synthetic ا:Ljava/lang/Object;

.field public final synthetic ب:[Lھٳ۰ڌ؄غڎۦ/إ;

.field public final synthetic ة:Lڲٱۘۑدٿٰ/؋;

.field public final synthetic ت:Lڲٱۘۑدٿٰ/د;

.field public final synthetic ث:Lھٳ۰ڌ؄غڎۦ/ئ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/؋;Lڲٱۘۑدٿٰ/د;Lھٳ۰ڌ؄غڎۦ/ئ;[Lھٳ۰ڌ؄غڎۦ/إ;)V
    .locals 0

    iput-object p5, p0, Lھڳۄ٧ڕڊ/ة;->ب:[Lھٳ۰ڌ؄غڎۦ/إ;

    iput-object p2, p0, Lھڳۄ٧ڕڊ/ة;->ة:Lڲٱۘۑدٿٰ/؋;

    iput-object p3, p0, Lھڳۄ٧ڕڊ/ة;->ت:Lڲٱۘۑدٿٰ/د;

    iput-object p4, p0, Lھڳۄ٧ڕڊ/ة;->ث:Lھٳ۰ڌ؄غڎۦ/ئ;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, Lګؓ۝ؒڄس/ئ;-><init>(ILڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 7

    new-instance v6, Lھڳۄ٧ڕڊ/ة;

    iget-object v5, p0, Lھڳۄ٧ڕڊ/ة;->ب:[Lھٳ۰ڌ؄غڎۦ/إ;

    iget-object v2, p0, Lھڳۄ٧ڕڊ/ة;->ة:Lڲٱۘۑدٿٰ/؋;

    iget-object v3, p0, Lھڳۄ٧ڕڊ/ة;->ت:Lڲٱۘۑدٿٰ/د;

    iget-object v4, p0, Lھڳۄ٧ڕڊ/ة;->ث:Lھٳ۰ڌ؄غڎۦ/ئ;

    move-object v0, v6

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lھڳۄ٧ڕڊ/ة;-><init>(Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/؋;Lڲٱۘۑدٿٰ/د;Lھٳ۰ڌ؄غڎۦ/ئ;[Lھٳ۰ڌ؄غڎۦ/إ;)V

    iput-object p1, v6, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    return-object v6
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lںڍڒڸ/س;

    check-cast p2, Lڨڡئٸت/أ;

    invoke-virtual {p0, p1, p2}, Lھڳۄ٧ڕڊ/ة;->create(Ljava/lang/Object;Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    check-cast p1, Lھڳۄ٧ڕڊ/ة;

    sget-object p2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {p1, p2}, Lھڳۄ٧ڕڊ/ة;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 21

    move-object/from16 v0, p0

    sget-object v1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v2, v0, Lھڳۄ٧ڕڊ/ة;->ئ:I

    sget-object v3, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    sget-object v4, Lڗًقڔ/ء;->ا:Lئٱنۃؖۊڄئ/آ;

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v9, :cond_3

    if-eq v2, v8, :cond_2

    if-ne v2, v7, :cond_1

    iget v2, v0, Lھڳۄ٧ڕڊ/ة;->إ:I

    iget v10, v0, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iget-object v11, v0, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iget-object v12, v0, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iget-object v13, v0, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    check-cast v13, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    move-object v5, v0

    :cond_0
    const/4 v9, 0x0

    goto/16 :goto_7

    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    iget v2, v0, Lھڳۄ٧ڕڊ/ة;->إ:I

    iget v10, v0, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iget-object v11, v0, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iget-object v12, v0, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iget-object v13, v0, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    check-cast v13, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    move-object v5, v0

    goto :goto_1

    :cond_3
    iget v2, v0, Lھڳۄ٧ڕڊ/ة;->إ:I

    iget v10, v0, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iget-object v11, v0, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iget-object v12, v0, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iget-object v13, v0, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    check-cast v13, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    move-object/from16 v14, p1

    check-cast v14, Lڽتٺۊڗ؜/ث;

    iget-object v14, v14, Lڽتٺۊڗ؜/ث;->؋:Ljava/lang/Object;

    move-object v5, v0

    goto :goto_2

    :cond_4
    invoke-static/range {p1 .. p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    iget-object v2, v0, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    check-cast v2, Lںڍڒڸ/س;

    iget-object v10, v0, Lھڳۄ٧ڕڊ/ة;->ب:[Lھٳ۰ڌ؄غڎۦ/إ;

    array-length v10, v10

    if-nez v10, :cond_5

    return-object v3

    :cond_5
    new-array v13, v10, [Ljava/lang/Object;

    invoke-static {v13, v4}, Lڡپٔۯ/ة;->ڐ([Ljava/lang/Object;Lئٱنۃؖۊڄئ/آ;)V

    const/4 v11, 0x6

    invoke-static {v10, v6, v11}, Lںڍڒڸ/ش;->؋(ILڽتٺۊڗ؜/؋;I)Lڽتٺۊڗ؜/ؤ;

    move-result-object v12

    new-instance v11, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v11, v10}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    const/4 v15, 0x0

    :goto_0
    if-ge v15, v10, :cond_6

    new-instance v14, Lھڳۄ٧ڕڊ/ب;

    iget-object v5, v0, Lھڳۄ٧ڕڊ/ة;->ب:[Lھٳ۰ڌ؄غڎۦ/إ;

    const/16 v19, 0x0

    move-object/from16 p1, v14

    move/from16 v20, v15

    move-object v15, v5

    move/from16 v16, v20

    move-object/from16 v17, v11

    move-object/from16 v18, v12

    invoke-direct/range {v14 .. v19}, Lھڳۄ٧ڕڊ/ب;-><init>([Lھٳ۰ڌ؄غڎۦ/إ;ILjava/util/concurrent/atomic/AtomicInteger;Lڽتٺۊڗ؜/ب;Lڨڡئٸت/أ;)V

    move-object/from16 v5, p1

    invoke-static {v2, v6, v5, v7}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    add-int/lit8 v15, v20, 0x1

    goto :goto_0

    :cond_6
    new-array v11, v10, [B

    move-object v5, v0

    const/4 v2, 0x0

    :goto_1
    add-int/2addr v2, v9

    int-to-byte v2, v2

    iput-object v13, v5, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    iput-object v12, v5, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iput-object v11, v5, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iput v10, v5, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iput v2, v5, Lھڳۄ٧ڕڊ/ة;->إ:I

    iput v9, v5, Lھڳۄ٧ڕڊ/ة;->ئ:I

    invoke-interface {v12, v5}, Lڽتٺۊڗ؜/س;->ئ(Lھڳۄ٧ڕڊ/ة;)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v1, :cond_7

    return-object v1

    :cond_7
    :goto_2
    instance-of v15, v14, Lڽتٺۊڗ؜/ت;

    if-nez v15, :cond_8

    goto :goto_3

    :cond_8
    move-object v14, v6

    :goto_3
    check-cast v14, Lڡپٔۯ/ش;

    if-nez v14, :cond_9

    return-object v3

    :cond_9
    :goto_4
    iget v15, v14, Lڡپٔۯ/ش;->؋:I

    aget-object v6, v13, v15

    iget-object v14, v14, Lڡپٔۯ/ش;->ؠ:Ljava/lang/Object;

    aput-object v14, v13, v15

    if-ne v6, v4, :cond_a

    add-int/lit8 v10, v10, -0x1

    :cond_a
    aget-byte v6, v11, v15

    if-eq v6, v2, :cond_d

    int-to-byte v6, v2

    aput-byte v6, v11, v15

    invoke-interface {v12}, Lڽتٺۊڗ؜/س;->أ()Ljava/lang/Object;

    move-result-object v6

    instance-of v14, v6, Lڽتٺۊڗ؜/ت;

    if-nez v14, :cond_b

    goto :goto_5

    :cond_b
    const/4 v6, 0x0

    :goto_5
    move-object v14, v6

    check-cast v14, Lڡپٔۯ/ش;

    if-nez v14, :cond_c

    goto :goto_6

    :cond_c
    const/4 v6, 0x0

    goto :goto_4

    :cond_d
    :goto_6
    if-nez v10, :cond_0

    iget-object v6, v5, Lھڳۄ٧ڕڊ/ة;->ة:Lڲٱۘۑدٿٰ/؋;

    invoke-interface {v6}, Lڲٱۘۑدٿٰ/؋;->invoke()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    iget-object v14, v5, Lھڳۄ٧ڕڊ/ة;->ث:Lھٳ۰ڌ؄غڎۦ/ئ;

    iget-object v15, v5, Lھڳۄ٧ڕڊ/ة;->ت:Lڲٱۘۑدٿٰ/د;

    if-nez v6, :cond_e

    iput-object v13, v5, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    iput-object v12, v5, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iput-object v11, v5, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iput v10, v5, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iput v2, v5, Lھڳۄ٧ڕڊ/ة;->إ:I

    iput v8, v5, Lھڳۄ٧ڕڊ/ة;->ئ:I

    invoke-interface {v15, v14, v13, v5}, Lڲٱۘۑدٿٰ/د;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v1, :cond_0

    return-object v1

    :cond_e
    array-length v8, v13

    const/4 v9, 0x0

    invoke-static {v13, v6, v9, v9, v8}, Lڡپٔۯ/ة;->ڏ([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iput-object v13, v5, Lھڳۄ٧ڕڊ/ة;->ا:Ljava/lang/Object;

    iput-object v12, v5, Lھڳۄ٧ڕڊ/ة;->آ:Lڽتٺۊڗ؜/ب;

    iput-object v11, v5, Lھڳۄ٧ڕڊ/ة;->أ:[B

    iput v10, v5, Lھڳۄ٧ڕڊ/ة;->ؤ:I

    iput v2, v5, Lھڳۄ٧ڕڊ/ة;->إ:I

    iput v7, v5, Lھڳۄ٧ڕڊ/ة;->ئ:I

    invoke-interface {v15, v14, v6, v5}, Lڲٱۘۑدٿٰ/د;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v1, :cond_f

    return-object v1

    :cond_f
    :goto_7
    const/4 v6, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x1

    goto/16 :goto_1
.end method
