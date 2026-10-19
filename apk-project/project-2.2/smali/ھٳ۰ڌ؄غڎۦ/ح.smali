.class public final Lھٳ۰ڌ؄غڎۦ/ح;
.super Lھڳۄ٧ڕڊ/؋;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/ب;
.implements Lھٳ۰ڌ؄غڎۦ/إ;
.implements Lھڳۄ٧ڕڊ/ج;


# static fields
.field public static final ئ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _state:Ljava/lang/Object;

.field public إ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-class v0, Ljava/lang/Object;

    const-string v1, "_state"

    const-class v2, Lھٳ۰ڌ؄غڎۦ/ح;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھٳ۰ڌ؄غڎۦ/ح;->ئ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Lھڳۄ٧ڕڊ/؋;-><init>()V

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->_state:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    instance-of v2, v0, Lھٳ۰ڌ؄غڎۦ/ج;

    if-eqz v2, :cond_0

    move-object v2, v0

    check-cast v2, Lھٳ۰ڌ؄غڎۦ/ج;

    iget v3, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_0

    sub-int/2addr v3, v4

    iput v3, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    goto :goto_0

    :cond_0
    new-instance v2, Lھٳ۰ڌ؄غڎۦ/ج;

    invoke-direct {v2, v1, v0}, Lھٳ۰ڌ؄غڎۦ/ج;-><init>(Lھٳ۰ڌ؄غڎۦ/ح;Lڨڡئٸت/أ;)V

    :goto_0
    iget-object v0, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ا:Ljava/lang/Object;

    sget-object v3, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    iget v4, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    const/4 v5, 0x2

    const/4 v6, 0x3

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    if-eqz v4, :cond_4

    if-eq v4, v7, :cond_3

    if-eq v4, v5, :cond_2

    if-ne v4, v6, :cond_1

    iget-object v4, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ئ:Ljava/lang/Object;

    iget-object v10, v2, Lھٳ۰ڌ؄غڎۦ/ج;->إ:Lںڍڒڸ/ى;

    iget-object v11, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

    iget-object v12, v2, Lھٳ۰ڌ؄غڎۦ/ج;->أ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iget-object v13, v2, Lھٳ۰ڌ؄غڎۦ/ج;->آ:Lھٳ۰ڌ؄غڎۦ/ح;

    :try_start_0
    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_4

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-object v4, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ئ:Ljava/lang/Object;

    iget-object v10, v2, Lھٳ۰ڌ؄غڎۦ/ج;->إ:Lںڍڒڸ/ى;

    iget-object v11, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

    iget-object v12, v2, Lھٳ۰ڌ؄غڎۦ/ج;->أ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iget-object v13, v2, Lھٳ۰ڌ؄غڎۦ/ج;->آ:Lھٳ۰ڌ؄غڎۦ/ح;

    :try_start_1
    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_7

    :cond_3
    iget-object v11, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

    iget-object v4, v2, Lھٳ۰ڌ؄غڎۦ/ج;->أ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iget-object v13, v2, Lھٳ۰ڌ؄غڎۦ/ج;->آ:Lھٳ۰ڌ؄غڎۦ/ح;

    :try_start_2
    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :cond_4
    invoke-static {v0}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    monitor-enter p0

    :try_start_3
    iget-object v0, v1, Lھڳۄ٧ڕڊ/؋;->آ:[Lھڳۄ٧ڕڊ/ؠ;

    if-nez v0, :cond_5

    new-array v0, v5, [Lھٳ۰ڌ؄غڎۦ/خ;

    iput-object v0, v1, Lھڳۄ٧ڕڊ/؋;->آ:[Lھڳۄ٧ڕڊ/ؠ;

    goto :goto_1

    :cond_5
    iget v4, v1, Lھڳۄ٧ڕڊ/؋;->أ:I

    array-length v10, v0

    if-lt v4, v10, :cond_6

    array-length v4, v0

    mul-int/2addr v4, v5

    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v4, "copyOf(this, newSize)"

    invoke-static {v0, v4}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, v0

    check-cast v4, [Lھڳۄ٧ڕڊ/ؠ;

    iput-object v4, v1, Lھڳۄ٧ڕڊ/؋;->آ:[Lھڳۄ٧ڕڊ/ؠ;

    check-cast v0, [Lھڳۄ٧ڕڊ/ؠ;

    :cond_6
    :goto_1
    iget v4, v1, Lھڳۄ٧ڕڊ/؋;->ؤ:I

    :cond_7
    aget-object v10, v0, v4

    if-nez v10, :cond_8

    new-instance v10, Lھٳ۰ڌ؄غڎۦ/خ;

    invoke-direct {v10}, Lھٳ۰ڌ؄غڎۦ/خ;-><init>()V

    aput-object v10, v0, v4

    :cond_8
    add-int/lit8 v4, v4, 0x1

    array-length v11, v0

    if-lt v4, v11, :cond_9

    move v4, v8

    :cond_9
    move-object v11, v10

    check-cast v11, Lھٳ۰ڌ؄غڎۦ/خ;

    sget-object v12, Lھٳ۰ڌ؄غڎۦ/خ;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v12, v11}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_a

    move v11, v8

    goto :goto_2

    :cond_a
    sget-object v13, Lڗًقڔ/؋;->ف:Lئٱنۃؖۊڄئ/آ;

    invoke-virtual {v12, v11, v13}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    move v11, v7

    :goto_2
    if-eqz v11, :cond_7

    iput v4, v1, Lھڳۄ٧ڕڊ/؋;->ؤ:I

    iget v0, v1, Lھڳۄ٧ڕڊ/؋;->أ:I

    add-int/2addr v0, v7

    iput v0, v1, Lھڳۄ٧ڕڊ/؋;->أ:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    check-cast v10, Lھٳ۰ڌ؄غڎۦ/خ;

    move-object/from16 v4, p1

    move-object v13, v1

    move-object v11, v10

    :goto_3
    :try_start_4
    invoke-interface {v2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    sget-object v10, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {v0, v10}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lںڍڒڸ/ى;

    move-object v12, v4

    move-object v4, v9

    :cond_b
    :goto_4
    sget-object v0, Lھٳ۰ڌ؄غڎۦ/ح;->ئ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, v13}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v10, :cond_d

    invoke-interface {v10}, Lںڍڒڸ/ى;->؋()Z

    move-result v14

    if-eqz v14, :cond_c

    goto :goto_5

    :cond_c
    check-cast v10, Lںڍڒڸ/ٵ;

    invoke-virtual {v10}, Lںڍڒڸ/ٵ;->س()Ljava/util/concurrent/CancellationException;

    move-result-object v0

    throw v0

    :catchall_0
    move-exception v0

    goto/16 :goto_a

    :cond_d
    :goto_5
    if-eqz v4, :cond_e

    invoke-static {v4, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_11

    :cond_e
    sget-object v4, Lڗًقڔ/ء;->ئ:Lئٱنۃؖۊڄئ/آ;

    if-ne v0, v4, :cond_f

    move-object v4, v9

    goto :goto_6

    :cond_f
    move-object v4, v0

    :goto_6
    iput-object v13, v2, Lھٳ۰ڌ؄غڎۦ/ج;->آ:Lھٳ۰ڌ؄غڎۦ/ح;

    iput-object v12, v2, Lھٳ۰ڌ؄غڎۦ/ج;->أ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iput-object v11, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

    iput-object v10, v2, Lھٳ۰ڌ؄غڎۦ/ج;->إ:Lںڍڒڸ/ى;

    iput-object v0, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ئ:Ljava/lang/Object;

    iput v5, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    invoke-interface {v12, v4, v2}, Lھٳ۰ڌ؄غڎۦ/ئ;->emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v3, :cond_10

    return-object v3

    :cond_10
    move-object v4, v0

    :cond_11
    :goto_7
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lڗًقڔ/؋;->ف:Lئٱنۃؖۊڄئ/آ;

    sget-object v14, Lھٳ۰ڌ؄غڎۦ/خ;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v14, v11, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->getAndSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    sget-object v15, Lڗًقڔ/؋;->ق:Lئٱنۃؖۊڄئ/آ;

    if-ne v14, v15, :cond_12

    move v14, v7

    goto :goto_8

    :cond_12
    move v14, v8

    :goto_8
    if-nez v14, :cond_b

    iput-object v13, v2, Lھٳ۰ڌ؄غڎۦ/ج;->آ:Lھٳ۰ڌ؄غڎۦ/ح;

    iput-object v12, v2, Lھٳ۰ڌ؄غڎۦ/ج;->أ:Lھٳ۰ڌ؄غڎۦ/ئ;

    iput-object v11, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

    iput-object v10, v2, Lھٳ۰ڌ؄غڎۦ/ج;->إ:Lںڍڒڸ/ى;

    iput-object v4, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ئ:Ljava/lang/Object;

    iput v6, v2, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    new-instance v14, Lںڍڒڸ/ئ;

    invoke-static {v2}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v15

    invoke-direct {v14, v7, v15}, Lںڍڒڸ/ئ;-><init>(ILڨڡئٸت/أ;)V

    invoke-virtual {v14}, Lںڍڒڸ/ئ;->ح()V

    :cond_13
    sget-object v15, Lھٳ۰ڌ؄غڎۦ/خ;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v15, v11, v0, v14}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_14

    move v0, v7

    goto :goto_9

    :cond_14
    invoke-virtual {v15, v11}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    if-eq v15, v0, :cond_13

    move v0, v8

    :goto_9
    sget-object v15, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-nez v0, :cond_15

    invoke-virtual {v14, v15}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    :cond_15
    invoke-virtual {v14}, Lںڍڒڸ/ئ;->ج()Ljava/lang/Object;

    move-result-object v0

    sget-object v14, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-ne v0, v14, :cond_16

    move-object v15, v0

    :cond_16
    if-ne v15, v3, :cond_b

    return-object v3

    :goto_a
    monitor-enter v13

    :try_start_5
    iget v2, v13, Lھڳۄ٧ڕڊ/؋;->أ:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v13, Lھڳۄ٧ڕڊ/؋;->أ:I

    if-nez v2, :cond_17

    iput v8, v13, Lھڳۄ٧ڕڊ/؋;->ؤ:I

    :cond_17
    const-string v2, "null cannot be cast to non-null type kotlinx.coroutines.flow.internal.AbstractSharedFlowSlot<kotlin.Any>"

    invoke-static {v11, v2}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lھٳ۰ڌ؄غڎۦ/خ;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v2, v11, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    monitor-exit v13

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v13

    throw v0

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lھٳ۰ڌ؄غڎۦ/ح;->ؠ(Ljava/lang/Object;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final getValue()Ljava/lang/Object;
    .locals 2

    sget-object v0, Lڗًقڔ/ء;->ئ:Lئٱنۃؖۊڄئ/آ;

    sget-object v1, Lھٳ۰ڌ؄غڎۦ/ح;->ئ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    const/4 v1, 0x0

    :cond_0
    return-object v1
.end method

.method public final ؋(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lڗًقڔ/؋;->ع(Lھٳ۰ڌ؄غڎۦ/ث;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p1

    return-object p1
.end method

.method public final ؠ(Ljava/lang/Object;)V
    .locals 11

    if-nez p1, :cond_0

    sget-object p1, Lڗًقڔ/ء;->ئ:Lئٱنۃؖۊڄئ/آ;

    :cond_0
    monitor-enter p0

    :try_start_0
    sget-object v0, Lھٳ۰ڌ؄غڎۦ/ح;->ئ:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, p1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_1

    :goto_0
    monitor-exit p0

    goto/16 :goto_6

    :cond_1
    :try_start_1
    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    iget p1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->إ:I

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_c

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->إ:I

    iget-object v1, p0, Lھڳۄ٧ڕڊ/؋;->آ:[Lھڳۄ٧ڕڊ/ؠ;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p0

    :goto_1
    check-cast v1, [Lھٳ۰ڌ؄غڎۦ/خ;

    if-eqz v1, :cond_a

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_2
    if-ge v4, v2, :cond_a

    aget-object v5, v1, v4

    if-eqz v5, :cond_9

    :cond_2
    sget-object v6, Lھٳ۰ڌ؄غڎۦ/خ;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3

    goto :goto_5

    :cond_3
    sget-object v8, Lڗًقڔ/؋;->ق:Lئٱنۃؖۊڄئ/آ;

    if-ne v7, v8, :cond_4

    goto :goto_5

    :cond_4
    sget-object v9, Lڗًقڔ/؋;->ف:Lئٱنۃؖۊڄئ/آ;

    if-ne v7, v9, :cond_7

    :cond_5
    invoke-virtual {v6, v5, v7, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    move v6, v0

    goto :goto_3

    :cond_6
    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v7, :cond_5

    move v6, v3

    :goto_3
    if-eqz v6, :cond_2

    goto :goto_5

    :cond_7
    invoke-virtual {v6, v5, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    move v6, v0

    goto :goto_4

    :cond_8
    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v7, :cond_7

    move v6, v3

    :goto_4
    if-eqz v6, :cond_2

    check-cast v7, Lںڍڒڸ/ئ;

    sget v5, Lڡُؑڨ/ؤ;->آ:I

    sget-object v5, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-virtual {v7, v5}, Lںڍڒڸ/ئ;->resumeWith(Ljava/lang/Object;)V

    :cond_9
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_a
    monitor-enter p0

    :try_start_2
    iget v1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->إ:I

    if-ne v1, p1, :cond_b

    add-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->إ:I

    goto :goto_0

    :cond_b
    iget-object p1, p0, Lھڳۄ٧ڕڊ/؋;->آ:[Lھڳۄ٧ڕڊ/ؠ;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    move v10, v1

    move-object v1, p1

    move p1, v10

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_c
    add-int/lit8 p1, p1, 0x2

    :try_start_3
    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/ح;->إ:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :goto_6
    return-void

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method
