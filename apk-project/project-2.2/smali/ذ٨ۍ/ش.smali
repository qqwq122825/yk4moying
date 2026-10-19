.class public final Lذ٨ۍ/ش;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/آ;


# instance fields
.field public final آ:Lذ٨ۍ/أ;

.field public final أ:I

.field public final ؤ:Lذ٨ۍ/؋;

.field public final إ:J

.field public final ئ:J


# direct methods
.method public constructor <init>(Lذ٨ۍ/أ;ILذ٨ۍ/؋;JJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lذ٨ۍ/ش;->آ:Lذ٨ۍ/أ;

    iput p2, p0, Lذ٨ۍ/ش;->أ:I

    iput-object p3, p0, Lذ٨ۍ/ش;->ؤ:Lذ٨ۍ/؋;

    iput-wide p4, p0, Lذ٨ۍ/ش;->إ:J

    iput-wide p6, p0, Lذ٨ۍ/ش;->ئ:J

    return-void
.end method


# virtual methods
.method public final ؋(Lؾپۑ۟ڂڷ/ح;)V
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lذ٨ۍ/ش;->آ:Lذ٨ۍ/أ;

    invoke-virtual {v1}, Lذ٨ۍ/أ;->؋()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lذ۠ۋؿ/ب;->أ()Lذ۠ۋؿ/ب;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lذ٨ۍ/ش;->آ:Lذ٨ۍ/أ;

    iget-object v2, v0, Lذ٨ۍ/ش;->ؤ:Lذ٨ۍ/؋;

    iget-object v1, v1, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ٨ۍ/د;

    if-eqz v1, :cond_8

    iget-object v1, v1, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    instance-of v2, v1, Lذ۠ۋؿ/إ;

    if-nez v2, :cond_1

    goto/16 :goto_5

    :cond_1
    iget-wide v2, v0, Lذ٨ۍ/ش;->إ:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    const/4 v3, 0x0

    if-lez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    iget v1, v1, Lذ۠ۋؿ/إ;->خ:I

    const/16 v18, 0x0

    const/16 v19, 0x64

    iget-object v15, v0, Lذ٨ۍ/ش;->آ:Lذ٨ۍ/أ;

    invoke-virtual/range {p1 .. p1}, Lؾپۑ۟ڂڷ/ح;->إ()Z

    move-result v6

    const/4 v7, -0x1

    if-eqz v6, :cond_3

    move v8, v3

    move v9, v8

    goto :goto_3

    :cond_3
    move-object/from16 v3, p1

    iget-boolean v6, v3, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-eqz v6, :cond_4

    const/16 v3, 0x64

    goto :goto_2

    :cond_4
    invoke-virtual/range {p1 .. p1}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object v3

    instance-of v6, v3, Lخڝٻؽؐ/ء;

    if-eqz v6, :cond_6

    check-cast v3, Lخڝٻؽؐ/ء;

    iget-object v3, v3, Lخڝٻؽؐ/ء;->آ:Lcom/google/android/gms/common/api/Status;

    iget v6, v3, Lcom/google/android/gms/common/api/Status;->آ:I

    iget-object v3, v3, Lcom/google/android/gms/common/api/Status;->إ:Lحۨٸڮؐێ/؋;

    if-nez v3, :cond_5

    move v3, v7

    goto :goto_1

    :cond_5
    iget v3, v3, Lحۨٸڮؐێ/؋;->أ:I

    :goto_1
    move v9, v3

    move v8, v6

    goto :goto_3

    :cond_6
    const/16 v3, 0x65

    :goto_2
    move v8, v3

    move v9, v7

    :goto_3
    if-eqz v2, :cond_7

    iget-wide v4, v0, Lذ٨ۍ/ش;->إ:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v10, v0, Lذ٨ۍ/ش;->ئ:J

    sub-long/2addr v6, v10

    long-to-int v6, v6

    move-wide v12, v2

    move-wide v10, v4

    move/from16 v17, v6

    goto :goto_4

    :cond_7
    move-wide v10, v4

    move-wide v12, v10

    move/from16 v17, v7

    :goto_4
    new-instance v2, Lذ۠ۋؿ/ا;

    iget v7, v0, Lذ٨ۍ/ش;->أ:I

    const/4 v14, 0x0

    const/4 v3, 0x0

    move-object v6, v2

    move-object v4, v15

    move-object v15, v3

    move/from16 v16, v1

    invoke-direct/range {v6 .. v17}, Lذ۠ۋؿ/ا;-><init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V

    const/16 v1, 0x1388

    int-to-long v9, v1

    iget-object v1, v4, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v3, Lذ٨ۍ/ص;

    move-object v6, v3

    move-object v7, v2

    move/from16 v8, v18

    move/from16 v11, v19

    invoke-direct/range {v6 .. v11}, Lذ٨ۍ/ص;-><init>(Lذ۠ۋؿ/ا;IJI)V

    const/16 v2, 0x12

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_8
    :goto_5
    return-void
.end method
