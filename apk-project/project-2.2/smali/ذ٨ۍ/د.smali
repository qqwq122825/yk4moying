.class public final Lذ٨ۍ/د;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lخڝٻؽؐ/ؤ;
.implements Lخڝٻؽؐ/إ;


# instance fields
.field public final ؠ:Ljava/util/LinkedList;

.field public final ء:Lذ۠ۋؿ/إ;

.field public final آ:Lذ٨ۍ/؋;

.field public final أ:Lآۋۻؾ۹/ة;

.field public final ؤ:Ljava/util/HashSet;

.field public final إ:Ljava/util/HashMap;

.field public final ئ:I

.field public final ا:Lذ٨ۍ/ظ;

.field public ب:Z

.field public final ة:Ljava/util/ArrayList;

.field public ت:Lحۨٸڮؐێ/؋;

.field public final synthetic ث:Lذ٨ۍ/أ;


# direct methods
.method public constructor <init>(Lذ٨ۍ/أ;Lخڝٻؽؐ/أ;)V
    .locals 9

    iput-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lذ٨ۍ/د;->ؤ:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-object v0, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    iget-object v1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {p2}, Lخڝٻؽؐ/أ;->؋()Lأۺؘٻڣ/ب;

    move-result-object v1

    invoke-virtual {v1}, Lأۺؘٻڣ/ب;->؋()Lذ۠ۋؿ/آ;

    move-result-object v5

    iget-object v1, p2, Lخڝٻؽؐ/أ;->ء:Lةؽڗںۍټ٘/ء;

    iget-object v1, v1, Lةؽڗںۍټ٘/ء;->آ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lڗًقڔ/؋;

    invoke-static {v2}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v3, p2, Lخڝٻؽؐ/أ;->؋:Landroid/content/Context;

    iget-object v6, p2, Lخڝٻؽؐ/أ;->آ:Lخڝٻؽؐ/؋;

    move-object v7, p0

    move-object v8, p0

    invoke-virtual/range {v2 .. v8}, Lڗًقڔ/؋;->إ(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Lخڝٻؽؐ/؋;Lخڝٻؽؐ/ؤ;Lخڝٻؽؐ/إ;)Lذ۠ۋؿ/إ;

    move-result-object v1

    iget-object v2, p2, Lخڝٻؽؐ/أ;->ؠ:Ljava/lang/String;

    if-eqz v2, :cond_0

    iput-object v2, v1, Lذ۠ۋؿ/إ;->ذ:Ljava/lang/String;

    :cond_0
    iput-object v1, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    iget-object v2, p2, Lخڝٻؽؐ/أ;->أ:Lذ٨ۍ/؋;

    iput-object v2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    new-instance v2, Lآۋۻؾ۹/ة;

    const/16 v3, 0xb

    invoke-direct {v2, v3}, Lآۋۻؾ۹/ة;-><init>(I)V

    iput-object v2, p0, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    iget v2, p2, Lخڝٻؽؐ/أ;->ؤ:I

    iput v2, p0, Lذ٨ۍ/د;->ئ:I

    invoke-interface {v1}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p1, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v1, Lذ٨ۍ/ظ;

    invoke-virtual {p2}, Lخڝٻؽؐ/أ;->؋()Lأۺؘٻڣ/ب;

    move-result-object p2

    invoke-virtual {p2}, Lأۺؘٻڣ/ب;->؋()Lذ۠ۋؿ/آ;

    move-result-object p2

    invoke-direct {v1, v0, p1, p2}, Lذ٨ۍ/ظ;-><init>(Landroid/content/Context;Lصٝتږۗ/آ;Lذ۠ۋؿ/آ;)V

    iput-object v1, p0, Lذ٨ۍ/د;->ا:Lذ٨ۍ/ظ;

    return-void

    :cond_1
    iput-object v0, p0, Lذ٨ۍ/د;->ا:Lذ٨ۍ/ظ;

    return-void
.end method


# virtual methods
.method public final ؋(I)V
    .locals 3

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v2, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v0, v2, :cond_0

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->ا(I)V

    return-void

    :cond_0
    iget-object v0, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v1, Lذ٨ۍ/ح;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lذ٨ۍ/ح;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final ؠ()V
    .locals 3

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v2, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v0, v2, :cond_0

    invoke-virtual {p0}, Lذ٨ۍ/د;->ئ()V

    return-void

    :cond_0
    iget-object v0, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v1, Lذ٨ۍ/ط;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p0}, Lذ٨ۍ/ط;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final ء(Lحۨٸڮؐێ/؋;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V

    return-void
.end method

.method public final آ(Lحۨٸڮؐێ/؋;)V
    .locals 3

    iget-object v0, p0, Lذ٨ۍ/د;->ؤ:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    sget-object v0, Lحۨٸڮؐێ/؋;->ئ:Lحۨٸڮؐێ/؋;

    invoke-static {p1, v0}, Lںڍڒڸ/ش;->س(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {p1}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lذ۠ۋؿ/إ;->ؠ:Lڜأِجطّثٮ/؋;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Failed to connect when checking package"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    throw p1

    :cond_2
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    return-void
.end method

.method public final أ(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lذ٨ۍ/د;->ؤ(Lcom/google/android/gms/common/api/Status;Ljava/lang/RuntimeException;Z)V

    return-void
.end method

.method public final ؤ(Lcom/google/android/gms/common/api/Status;Ljava/lang/RuntimeException;Z)V
    .locals 4

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    if-eq v2, v0, :cond_6

    iget-object v0, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lذ٨ۍ/س;

    if-eqz p3, :cond_3

    iget v2, v1, Lذ٨ۍ/س;->؋:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    :cond_3
    if-eqz p1, :cond_4

    invoke-virtual {v1, p1}, Lذ٨ۍ/س;->ء(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v1, p2}, Lذ٨ۍ/س;->آ(Ljava/lang/RuntimeException;)V

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_5
    return-void

    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Status XOR exception should be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final إ()V
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lذ٨ۍ/س;

    iget-object v5, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v5}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, v4}, Lذ٨ۍ/د;->ة(Lذ٨ۍ/س;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v1, v4}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public final ئ()V
    .locals 5

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    sget-object v2, Lحۨٸڮؐێ/؋;->ئ:Lحۨٸڮؐێ/؋;

    invoke-virtual {p0, v2}, Lذ٨ۍ/د;->آ(Lحۨٸڮؐێ/؋;)V

    iget-boolean v2, p0, Lذ٨ۍ/د;->ب:Z

    if-eqz v2, :cond_0

    iget-object v2, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v3, 0xb

    iget-object v4, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-virtual {v2, v3, v4}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v2, 0x9

    invoke-virtual {v0, v2, v4}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lذ٨ۍ/د;->ب:Z

    :cond_0
    iget-object v0, p0, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lذ٨ۍ/د;->إ()V

    invoke-virtual {p0}, Lذ٨ۍ/د;->ب()V

    return-void

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v1
.end method

.method public final ا(I)V
    .locals 6

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lذ٨ۍ/د;->ب:Z

    iget-object v2, p0, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    iget-object v3, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    iget-object v3, v3, Lذ۠ۋؿ/إ;->؋:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "The connection to Google Play services was lost"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-ne p1, v1, :cond_0

    const-string p1, " due to service disconnection."

    goto :goto_0

    :cond_0
    const/4 v5, 0x3

    if-ne p1, v5, :cond_1

    const-string p1, " due to dead object exception."

    :goto_0
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    if-eqz v3, :cond_2

    const-string p1, " Last reason for disconnect: "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x14

    invoke-direct {p1, v4, v3, v0, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    invoke-virtual {v2, v1, p1}, Lآۋۻؾ۹/ة;->ح(ZLcom/google/android/gms/common/api/Status;)V

    iget-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v1, 0x9

    iget-object v2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p1, v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object v2, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v2, 0x1388

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v1, 0xb

    iget-object v2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p1, v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object v2, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/32 v2, 0x1d4c0

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->إ:Lآۋۻؾ۹/ة;

    iget-object p1, p1, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast p1, Landroid/util/SparseIntArray;

    invoke-virtual {p1}, Landroid/util/SparseIntArray;->clear()V

    iget-object p1, p0, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    return-void

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw v0
.end method

.method public final ب()V
    .locals 5

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v2, 0xc

    iget-object v3, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    iget-wide v3, v0, Lذ٨ۍ/أ;->؋:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method public final ة(Lذ٨ۍ/س;)Z
    .locals 13

    instance-of v0, p1, Lذ٨ۍ/س;

    const-string v1, "DeadObjectException thrown while running ApiCallRunner."

    const/4 v2, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-interface {v0}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v3

    iget-object v4, p0, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    invoke-virtual {p1, v4, v3}, Lذ٨ۍ/س;->ؤ(Lآۋۻؾ۹/ة;Z)V

    :try_start_0
    invoke-virtual {p1, p0}, Lذ٨ۍ/س;->أ(Lذ٨ۍ/د;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    invoke-virtual {p0, v2}, Lذ٨ۍ/د;->؋(I)V

    invoke-virtual {v0, v1}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    :goto_0
    return v2

    :cond_0
    invoke-virtual {p1, p0}, Lذ٨ۍ/س;->ؠ(Lذ٨ۍ/د;)[Lحۨٸڮؐێ/ء;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_6

    array-length v5, v0

    if-nez v5, :cond_1

    goto :goto_4

    :cond_1
    iget-object v5, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    iget-object v5, v5, Lذ۠ۋؿ/إ;->س:Lذ۠ۋؿ/ػ;

    if-nez v5, :cond_2

    move-object v5, v4

    goto :goto_1

    :cond_2
    iget-object v5, v5, Lذ۠ۋؿ/ػ;->أ:[Lحۨٸڮؐێ/ء;

    :goto_1
    if-nez v5, :cond_3

    new-array v5, v3, [Lحۨٸڮؐێ/ء;

    :cond_3
    array-length v6, v5

    new-instance v7, Landroidx/collection/ArrayMap;

    invoke-direct {v7, v6}, Landroidx/collection/ArrayMap;-><init>(I)V

    move v8, v3

    :goto_2
    if-ge v8, v6, :cond_4

    aget-object v9, v5, v8

    iget-object v10, v9, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    invoke-virtual {v9}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v7, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_4
    array-length v5, v0

    move v6, v3

    :goto_3
    if-ge v6, v5, :cond_6

    aget-object v8, v0, v6

    iget-object v9, v8, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    invoke-interface {v7, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    if-eqz v9, :cond_7

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-virtual {v8}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-gez v9, :cond_5

    goto :goto_5

    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    :cond_6
    :goto_4
    move-object v8, v4

    :cond_7
    :goto_5
    if-nez v8, :cond_8

    iget-object v0, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-interface {v0}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v3

    iget-object v4, p0, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    invoke-virtual {p1, v4, v3}, Lذ٨ۍ/س;->ؤ(Lآۋۻؾ۹/ة;Z)V

    :try_start_1
    invoke-virtual {p1, p0}, Lذ٨ۍ/س;->أ(Lذ٨ۍ/د;)V
    :try_end_1
    .catch Landroid/os/DeadObjectException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_6

    :catch_1
    invoke-virtual {p0, v2}, Lذ٨ۍ/د;->؋(I)V

    invoke-virtual {v0, v1}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    :goto_6
    return v2

    :cond_8
    iget-object v0, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, v8, Lحۨٸڮؐێ/ء;->آ:Ljava/lang/String;

    invoke-virtual {v8}, Lحۨٸڮؐێ/ء;->؋()J

    move-result-wide v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    new-instance v10, Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x4d

    add-int/2addr v7, v9

    invoke-direct {v10, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " could not execute call because it requires feature ("

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ")."

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "GoogleApiManager"

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-boolean v0, v0, Lذ٨ۍ/أ;->ج:Z

    if-eqz v0, :cond_b

    invoke-virtual {p1, p0}, Lذ٨ۍ/س;->؋(Lذ٨ۍ/د;)Z

    move-result v0

    if-eqz v0, :cond_b

    new-instance p1, Lذ٨ۍ/ذ;

    iget-object v0, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-direct {p1, v0, v8}, Lذ٨ۍ/ذ;-><init>(Lذ٨ۍ/؋;Lحۨٸڮؐێ/ء;)V

    iget-object v0, p0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const-wide/16 v1, 0x1388

    const/16 v5, 0xf

    if-ltz v0, :cond_9

    iget-object p1, p0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lذ٨ۍ/ذ;

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-virtual {v0, v5, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0, v5, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object v4, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_7

    :cond_9
    iget-object v0, p0, Lذ٨ۍ/د;->ة:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0, v5, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    iget-object v6, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v5, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v1, 0x10

    invoke-static {v0, v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object v1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/32 v1, 0x1d4c0

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    new-instance p1, Lحۨٸڮؐێ/؋;

    const/4 v0, 0x2

    invoke-direct {p1, v0, v4}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->ت(Lحۨٸڮؐێ/؋;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget v1, p0, Lذ٨ۍ/د;->ئ:I

    invoke-virtual {v0, p1, v1}, Lذ٨ۍ/أ;->ؠ(Lحۨٸڮؐێ/؋;I)Z

    :cond_a
    :goto_7
    return v3

    :cond_b
    new-instance v0, Lخڝٻؽؐ/ا;

    invoke-direct {v0, v8}, Lخڝٻؽؐ/ا;-><init>(Lحۨٸڮؐێ/ء;)V

    invoke-virtual {p1, v0}, Lذ٨ۍ/س;->آ(Ljava/lang/RuntimeException;)V

    return v2
.end method

.method public final ت(Lحۨٸڮؐێ/؋;)Z
    .locals 1

    sget-object p1, Lذ٨ۍ/أ;->د:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    monitor-exit p1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final ث()V
    .locals 13

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-object v1, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v1}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {v1}, Lذ۠ۋؿ/إ;->د()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_3

    :cond_0
    const/16 v2, 0xa

    :try_start_0
    iget-object v3, v0, Lذ٨ۍ/أ;->إ:Lآۋۻؾ۹/ة;

    iget-object v4, v0, Lذ٨ۍ/أ;->أ:Landroid/content/Context;

    invoke-virtual {v3, v4, v1}, Lآۋۻؾ۹/ة;->ج(Landroid/content/Context;Lذ۠ۋؿ/إ;)I

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    new-instance v0, Lحۨٸڮؐێ/؋;

    invoke-direct {v0, v3, v4}, Lحۨٸڮؐێ/؋;-><init>(ILandroid/app/PendingIntent;)V

    const-string v3, "GoogleApiManager"

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lحۨٸڮؐێ/؋;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x23

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "The service for "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " is not available: "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v0, v4}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    return-void

    :cond_1
    new-instance v3, Lذ٨ۍ/ر;

    iget-object v5, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-direct {v3, v0, v1, v5}, Lذ٨ۍ/ر;-><init>(Lذ٨ۍ/أ;Lذ۠ۋؿ/إ;Lذ٨ۍ/؋;)V

    invoke-interface {v1}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lذ٨ۍ/د;->ا:Lذ٨ۍ/ظ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v5, v0, Lذ٨ۍ/ظ;->إ:Lؼۄٿأ/ء;

    if-eqz v5, :cond_2

    invoke-interface {v5}, Lخڝٻؽؐ/ؠ;->أ()V

    :cond_2
    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v8, v0, Lذ٨ۍ/ظ;->ؤ:Lذ۠ۋؿ/آ;

    iput-object v5, v8, Lذ۠ۋؿ/آ;->إ:Ljava/lang/Integer;

    iget-object v5, v0, Lذ٨ۍ/ظ;->آ:Lز؃ۉؾؚۖڿڨ/ؠ;

    iget-object v6, v0, Lذ٨ۍ/ظ;->ؠ:Landroid/content/Context;

    iget-object v12, v0, Lذ٨ۍ/ظ;->ء:Landroid/os/Handler;

    invoke-virtual {v12}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v7

    iget-object v9, v8, Lذ۠ۋؿ/آ;->ؤ:Lؼۄٿأ/؋;

    move-object v10, v0

    move-object v11, v0

    invoke-virtual/range {v5 .. v11}, Lز؃ۉؾؚۖڿڨ/ؠ;->إ(Landroid/content/Context;Landroid/os/Looper;Lذ۠ۋؿ/آ;Lخڝٻؽؐ/؋;Lخڝٻؽؐ/ؤ;Lخڝٻؽؐ/إ;)Lذ۠ۋؿ/إ;

    move-result-object v5

    iput-object v5, v0, Lذ٨ۍ/ظ;->إ:Lؼۄٿأ/ء;

    iput-object v3, v0, Lذ٨ۍ/ظ;->ئ:Lذ٨ۍ/ر;

    iget-object v5, v0, Lذ٨ۍ/ظ;->أ:Ljava/util/Set;

    if-eqz v5, :cond_4

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_0

    :cond_3
    iget-object v0, v0, Lذ٨ۍ/ظ;->إ:Lؼۄٿأ/ء;

    invoke-interface {v0}, Lؼۄٿأ/ء;->ئ()V

    goto :goto_1

    :cond_4
    :goto_0
    new-instance v5, Lذ٨ۍ/ط;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v0}, Lذ٨ۍ/ط;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v12, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_5
    :goto_1
    :try_start_1
    iput-object v3, v1, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    const/4 v0, 0x2

    invoke-virtual {v1, v4, v0}, Lذ۠ۋؿ/إ;->ر(Landroid/os/IInterface;I)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lحۨٸڮؐێ/؋;

    invoke-direct {v1, v2}, Lحۨٸڮؐێ/؋;-><init>(I)V

    goto :goto_2

    :catch_1
    move-exception v0

    new-instance v1, Lحۨٸڮؐێ/؋;

    invoke-direct {v1, v2}, Lحۨٸڮؐێ/؋;-><init>(I)V

    :goto_2
    invoke-virtual {p0, v1, v0}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V

    :cond_6
    :goto_3
    return-void
.end method

.method public final ج(Lذ٨ۍ/س;)V
    .locals 2

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-object v0, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v0

    iget-object v1, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->ة(Lذ٨ۍ/س;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lذ٨ۍ/د;->ب()V

    return-void

    :cond_0
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    if-eqz p1, :cond_3

    iget v0, p1, Lحۨٸڮؐێ/؋;->أ:I

    if-eqz v0, :cond_2

    iget-object v0, p1, Lحۨٸڮؐێ/؋;->ؤ:Landroid/app/PendingIntent;

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V

    return-void

    :cond_3
    invoke-virtual {p0}, Lذ٨ۍ/د;->ث()V

    return-void
.end method

.method public final ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V
    .locals 6

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    iget-object v0, p0, Lذ٨ۍ/د;->ا:Lذ٨ۍ/ظ;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lذ٨ۍ/ظ;->إ:Lؼۄٿأ/ء;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lخڝٻؽؐ/ؠ;->أ()V

    :cond_0
    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v0}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    iget-object v1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v1, Lذ٨ۍ/أ;->إ:Lآۋۻؾ۹/ة;

    iget-object v1, v1, Lآۋۻؾ۹/ة;->أ:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseIntArray;

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->clear()V

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->آ(Lحۨٸڮؐێ/؋;)V

    iget-object v1, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    instance-of v1, v1, Lز؃ۉؾؚۖڿڨ/آ;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    iget v1, p1, Lحۨٸڮؐێ/؋;->أ:I

    const/16 v3, 0x18

    if-eq v1, v3, :cond_1

    iget-object v1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iput-boolean v2, v1, Lذ٨ۍ/أ;->ؠ:Z

    iget-object v1, v1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 v3, 0x13

    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    const-wide/32 v4, 0x493e0

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_1
    iget v1, p1, Lحۨٸڮؐێ/؋;->أ:I

    const/4 v3, 0x4

    if-ne v1, v3, :cond_2

    sget-object p1, Lذ٨ۍ/أ;->خ:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    return-void

    :cond_2
    iget-object v1, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    iput-object p1, p0, Lذ٨ۍ/د;->ت:Lحۨٸڮؐێ/؋;

    return-void

    :cond_3
    if-eqz p2, :cond_4

    iget-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {p1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p2, p1}, Lذ٨ۍ/د;->ؤ(Lcom/google/android/gms/common/api/Status;Ljava/lang/RuntimeException;Z)V

    return-void

    :cond_4
    iget-object p2, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-boolean p2, p2, Lذ٨ۍ/أ;->ج:Z

    if-eqz p2, :cond_a

    iget-object p2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p2, p1}, Lذ٨ۍ/أ;->ء(Lذ٨ۍ/؋;Lحۨٸڮؐێ/؋;)Lcom/google/android/gms/common/api/Status;

    move-result-object p2

    invoke-virtual {p0, p2, v0, v2}, Lذ٨ۍ/د;->ؤ(Lcom/google/android/gms/common/api/Status;Ljava/lang/RuntimeException;Z)V

    iget-object p2, p0, Lذ٨ۍ/د;->ؠ:Ljava/util/LinkedList;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->ت(Lحۨٸڮؐێ/؋;)Z

    move-result p2

    if-eqz p2, :cond_6

    return-void

    :cond_6
    iget-object p2, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget v0, p0, Lذ٨ۍ/د;->ئ:I

    invoke-virtual {p2, p1, v0}, Lذ٨ۍ/أ;->ؠ(Lحۨٸڮؐێ/؋;I)Z

    move-result p2

    if-nez p2, :cond_9

    iget p2, p1, Lحۨٸڮؐێ/؋;->أ:I

    const/16 v0, 0x12

    if-ne p2, v0, :cond_7

    iput-boolean v2, p0, Lذ٨ۍ/د;->ب:Z

    :cond_7
    iget-boolean p2, p0, Lذ٨ۍ/د;->ب:Z

    if-eqz p2, :cond_8

    iget-object p1, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/16 p2, 0x9

    iget-object v0, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p1, p2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x1388

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    :cond_8
    iget-object p2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p2, p1}, Lذ٨ۍ/أ;->ء(Lذ٨ۍ/؋;Lحۨٸڮؐێ/؋;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    :cond_9
    return-void

    :cond_a
    iget-object p2, p0, Lذ٨ۍ/د;->آ:Lذ٨ۍ/؋;

    invoke-static {p2, p1}, Lذ٨ۍ/أ;->ء(Lذ٨ۍ/؋;Lحۨٸڮؐێ/؋;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    invoke-virtual {p0, p1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final خ()V
    .locals 6

    iget-object v0, p0, Lذ٨ۍ/د;->ث:Lذ٨ۍ/أ;

    iget-object v1, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    invoke-static {v1}, Lسۄھؤۏ۫/؋;->أ(Lصٝتږۗ/آ;)V

    sget-object v1, Lذ٨ۍ/أ;->ح:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v1}, Lذ٨ۍ/د;->أ(Lcom/google/android/gms/common/api/Status;)V

    iget-object v2, p0, Lذ٨ۍ/د;->أ:Lآۋۻؾ۹/ة;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Lآۋۻؾ۹/ة;->ح(ZLcom/google/android/gms/common/api/Status;)V

    iget-object v1, p0, Lذ٨ۍ/د;->إ:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    new-array v2, v3, [Lذ٨ۍ/ئ;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lذ٨ۍ/ئ;

    array-length v2, v1

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    new-instance v4, Lذ٨ۍ/غ;

    new-instance v5, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v5}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    invoke-direct {v4, v5}, Lذ٨ۍ/غ;-><init>(Lؾپۑ۟ڂڷ/ا;)V

    invoke-virtual {p0, v4}, Lذ٨ۍ/د;->ج(Lذ٨ۍ/س;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Lحۨٸڮؐێ/؋;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lحۨٸڮؐێ/؋;-><init>(I)V

    invoke-virtual {p0, v1}, Lذ٨ۍ/د;->آ(Lحۨٸڮؐێ/؋;)V

    iget-object v1, p0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v1}, Lذ۠ۋؿ/إ;->خ()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Lذ٨ۍ/خ;

    invoke-direct {v2, p0}, Lذ٨ۍ/خ;-><init>(Lذ٨ۍ/د;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    new-instance v1, Lذ٨ۍ/ط;

    const/4 v3, 0x2

    invoke-direct {v1, v3, v2}, Lذ٨ۍ/ط;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method
