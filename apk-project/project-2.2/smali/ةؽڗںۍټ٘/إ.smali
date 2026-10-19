.class public final synthetic Lةؽڗںۍټ٘/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:Lةؽڗںۍټ٘/ت;

.field public final synthetic أ:Lأۺؘٻڣ/ز;

.field public final synthetic ؤ:I

.field public final synthetic إ:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lةؽڗںۍټ٘/ت;Lأۺؘٻڣ/ت;ILjava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lةؽڗںۍټ٘/إ;->آ:Lةؽڗںۍټ٘/ت;

    iput-object p2, p0, Lةؽڗںۍټ٘/إ;->أ:Lأۺؘٻڣ/ز;

    iput p3, p0, Lةؽڗںۍټ٘/إ;->ؤ:I

    iput-object p4, p0, Lةؽڗںۍټ٘/إ;->إ:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 17

    move-object/from16 v1, p0

    iget-object v2, v1, Lةؽڗںۍټ٘/إ;->أ:Lأۺؘٻڣ/ز;

    iget v3, v1, Lةؽڗںۍټ٘/إ;->ؤ:I

    iget-object v4, v1, Lةؽڗںۍټ٘/إ;->إ:Ljava/lang/Runnable;

    iget-object v0, v1, Lةؽڗںۍټ٘/إ;->آ:Lةؽڗںۍټ٘/ت;

    iget-object v5, v0, Lةؽڗںۍټ٘/ت;->آ:Lةؽڗںۍټ٘/ح;

    iget-object v6, v0, Lةؽڗںۍټ٘/ت;->ؤ:Lةڈۑۂٝےآذ/ء;

    :try_start_0
    iget-object v9, v0, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Landroidx/constraintlayout/core/state/؋;

    const/4 v11, 0x3

    invoke-direct {v10, v11, v9}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    move-object v9, v6

    check-cast v9, Lةٌخ/ة;

    invoke-virtual {v9, v10}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    iget-object v9, v0, Lةؽڗںۍټ٘/ت;->؋:Landroid/content/Context;

    const-string v10, "connectivity"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/ConnectivityManager;

    invoke-virtual {v9}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v9

    if-eqz v9, :cond_0

    invoke-virtual {v9}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    :goto_0
    if-nez v9, :cond_2

    check-cast v6, Lةٌخ/ة;

    invoke-virtual {v6}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    new-instance v10, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v0, 0xe

    invoke-direct {v10, v0}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iget-object v0, v6, Lةٌخ/ة;->ؤ:Lثڈا/؋;

    move-object v11, v0

    check-cast v11, Lثڈا/ؠ;

    invoke-virtual {v11}, Lثڈا/ؠ;->؋()J

    move-result-wide v12
    :try_end_0
    .catch Lةڈۑۂٝےآذ/؋; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    :try_start_1
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteDatabaseLockedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lةڈۑۂٝےآذ/؋; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_4

    :catch_0
    move-exception v0

    move-object v14, v0

    :try_start_2
    invoke-virtual {v11}, Lثڈا/ؠ;->؋()J

    move-result-wide v15

    iget-object v0, v6, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget v0, v0, Lةٌخ/؋;->ء:I

    int-to-long v7, v0

    add-long/2addr v7, v12

    cmp-long v0, v15, v7

    if-ltz v0, :cond_1

    invoke-virtual {v10, v14}, Landroidx/constraintlayout/core/state/ؠ;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lةڈۑۂٝےآذ/؋; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    add-int/lit8 v0, v3, 0x1

    :try_start_3
    move-object v6, v5

    check-cast v6, Lةؽڗںۍټ٘/أ;

    const/4 v7, 0x0

    invoke-virtual {v6, v2, v0, v7}, Lةؽڗںۍټ٘/أ;->؋(Lأۺؘٻڣ/ز;IZ)V

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_3

    :catchall_1
    move-exception v0

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_1
    const-wide/16 v7, 0x32

    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v2, v3}, Lةؽڗںۍټ٘/ت;->؋(Lأۺؘٻڣ/ز;I)V
    :try_end_4
    .catch Lةڈۑۂٝےآذ/؋; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    :catch_1
    const/4 v6, 0x1

    add-int/2addr v3, v6

    :try_start_5
    check-cast v5, Lةؽڗںۍټ٘/أ;

    const/4 v6, 0x0

    invoke-virtual {v5, v2, v3, v6}, Lةؽڗںۍټ٘/أ;->؋(Lأۺؘٻڣ/ز;IZ)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_3
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    return-void

    :goto_4
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    throw v0
.end method
