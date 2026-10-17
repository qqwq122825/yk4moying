.class public final synthetic Lحظتۢۋۜآظ/ة;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public أ:Ljava/lang/Object;

.field public final ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Lحظتۢۋۜآظ/ة;->آ:I

    iput-object p2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    iput-object p3, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p3, p0, Lحظتۢۋۜآظ/ة;->آ:I

    iput-object p1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final ؋()V
    .locals 3

    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ت;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ت;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ت;->إ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lؾپۑ۟ڂڷ/ؤ;

    if-eqz v2, :cond_0

    check-cast v1, Lؾپۑ۟ڂڷ/ؤ;

    iget-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v2}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lؾپۑ۟ڂڷ/ؤ;->ء(Ljava/lang/Object;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public final run()V
    .locals 8

    iget v0, p0, Lحظتۢۋۜآظ/ة;->آ:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_14

    :pswitch_0
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lںڍڒڸ/إ;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lںڏۑڎڔٙ۰/آ;

    check-cast v0, Lںڍڒڸ/ئ;

    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->ض(Lںڍڒڸ/ر;)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lںڍڒڸ/إ;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v1, Lںڍڒڸ/ر;

    check-cast v0, Lںڍڒڸ/ئ;

    invoke-virtual {v0, v1}, Lںڍڒڸ/ئ;->ض(Lںڍڒڸ/ر;)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/widget/EditText;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    :cond_0
    return-void

    :pswitch_3
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void

    :pswitch_4
    :try_start_0
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ح;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/Callable;

    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lؾپۑ۟ڂڷ/ح;->ب(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ح;

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v1, v0}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_0
    return-void

    :pswitch_5
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    :try_start_1
    move-object v1, v0

    check-cast v1, Lؾپۑ۟ڂڷ/ت;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ت;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ئ;

    iget-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v2}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lؾپۑ۟ڂڷ/ئ;->؋(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v1
    :try_end_1
    .catch Lؾپۑ۟ڂڷ/إ; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Continuation returned null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    sget-object v2, Lؾپۑ۟ڂڷ/ب;->ؠ:Lؾپۑ۟ڂڷ/ج;

    invoke-virtual {v1, v2, v0}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    new-instance v3, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v3, v2, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/أ;)V

    iget-object v4, v1, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v4, v3}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {v1}, Lؾپۑ۟ڂڷ/ح;->ث()V

    new-instance v3, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v3, v2, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/ء;)V

    iget-object v0, v1, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v0, v3}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {v1}, Lؾپۑ۟ڂڷ/ح;->ث()V

    goto :goto_2

    :catch_1
    move-exception v1

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    goto :goto_1

    :catch_2
    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    invoke-virtual {v0}, Lؾپۑ۟ڂڷ/ت;->ؠ()V

    goto :goto_2

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Exception;

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/Exception;

    :cond_2
    :goto_1
    invoke-virtual {v0, v1}, Lؾپۑ۟ڂڷ/ت;->آ(Ljava/lang/Exception;)V

    :goto_2
    return-void

    :pswitch_6
    invoke-direct {p0}, Lحظتۢۋۜآظ/ة;->؋()V

    return-void

    :pswitch_7
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ت;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_2
    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ت;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ت;->إ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lؾپۑ۟ڂڷ/أ;

    if-eqz v2, :cond_3

    check-cast v1, Lؾپۑ۟ڂڷ/أ;

    iget-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v2}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object v2

    invoke-static {v2}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lؾپۑ۟ڂڷ/أ;->آ(Ljava/lang/Exception;)V

    :cond_3
    monitor-exit v0

    return-void

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    :pswitch_8
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ت;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ت;->ؤ:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ت;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ت;->إ:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lؾپۑ۟ڂڷ/آ;

    if-eqz v2, :cond_4

    check-cast v1, Lؾپۑ۟ڂڷ/آ;

    iget-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ح;

    invoke-interface {v1, v2}, Lؾپۑ۟ڂڷ/آ;->؋(Lؾپۑ۟ڂڷ/ح;)V

    :cond_4
    monitor-exit v0

    return-void

    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1

    :pswitch_9
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    :try_start_4
    move-object v1, v0

    check-cast v1, Lؾپۑ۟ڂڷ/ة;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ة;->ؤ:Lؾپۑ۟ڂڷ/؋;

    iget-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v2, Lؾپۑ۟ڂڷ/ح;

    invoke-interface {v1, v2}, Lؾپۑ۟ڂڷ/؋;->آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lؾپۑ۟ڂڷ/ح;
    :try_end_4
    .catch Lؾپۑ۟ڂڷ/إ; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    check-cast v0, Lؾپۑ۟ڂڷ/ة;

    if-nez v1, :cond_5

    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Continuation returned null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lؾپۑ۟ڂڷ/ة;->آ(Ljava/lang/Exception;)V

    goto :goto_5

    :cond_5
    sget-object v2, Lؾپۑ۟ڂڷ/ب;->ؠ:Lؾپۑ۟ڂڷ/ج;

    invoke-virtual {v1, v2, v0}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    new-instance v3, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v3, v2, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/أ;)V

    iget-object v4, v1, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v4, v3}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {v1}, Lؾپۑ۟ڂڷ/ح;->ث()V

    new-instance v3, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v3, v2, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/ء;)V

    iget-object v0, v1, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v0, v3}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {v1}, Lؾپۑ۟ڂڷ/ح;->ث()V

    goto :goto_5

    :catch_4
    move-exception v1

    check-cast v0, Lؾپۑ۟ڂڷ/ة;

    goto :goto_3

    :catch_5
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Exception;

    check-cast v0, Lؾپۑ۟ڂڷ/ة;

    if-eqz v2, :cond_6

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/Exception;

    goto :goto_4

    :cond_6
    :goto_3
    iget-object v0, v0, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    :goto_4
    invoke-virtual {v0, v1}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_5
    return-void

    :pswitch_a
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ح;

    iget-boolean v0, v0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ة;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v0}, Lؾپۑ۟ڂڷ/ح;->ة()V

    goto :goto_8

    :cond_7
    :try_start_5
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lؾپۑ۟ڂڷ/ة;

    iget-object v0, v0, Lؾپۑ۟ڂڷ/ة;->ؤ:Lؾپۑ۟ڂڷ/؋;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ح;

    invoke-interface {v0, v1}, Lؾپۑ۟ڂڷ/؋;->آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object v0
    :try_end_5
    .catch Lؾپۑ۟ڂڷ/إ; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ة;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v1, v0}, Lؾپۑ۟ڂڷ/ح;->ب(Ljava/lang/Object;)V

    goto :goto_8

    :catch_6
    move-exception v0

    goto :goto_6

    :catch_7
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Exception;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ة;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    goto :goto_7

    :cond_8
    :goto_6
    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lؾپۑ۟ڂڷ/ة;

    iget-object v1, v1, Lؾپۑ۟ڂڷ/ة;->إ:Lؾپۑ۟ڂڷ/ح;

    :goto_7
    invoke-virtual {v1, v0}, Lؾپۑ۟ڂڷ/ح;->ا(Ljava/lang/Exception;)V

    :goto_8
    return-void

    :pswitch_b
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_c
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ظ;

    iget-object v4, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v4, Lؼۿعڽٵۄٙ؀/ا;

    sget-object v5, Lذ٨ۍ/ظ;->ا:Lز؃ۉؾؚۖڿڨ/ؠ;

    iget-object v5, v4, Lؼۿعڽٵۄٙ؀/ا;->أ:Lحۨٸڮؐێ/؋;

    iget v6, v5, Lحۨٸڮؐێ/؋;->أ:I

    if-nez v6, :cond_9

    move v6, v1

    goto :goto_9

    :cond_9
    move v6, v3

    :goto_9
    if-eqz v6, :cond_10

    iget-object v4, v4, Lؼۿعڽٵۄٙ؀/ا;->ؤ:Lذ۠ۋؿ/ر;

    invoke-static {v4}, Lسۄھؤۏ۫/؋;->ا(Ljava/lang/Object;)V

    iget-object v5, v4, Lذ۠ۋؿ/ر;->ؤ:Lحۨٸڮؐێ/؋;

    iget v6, v5, Lحۨٸڮؐێ/؋;->أ:I

    if-nez v6, :cond_a

    goto :goto_a

    :cond_a
    move v1, v3

    :goto_a
    if-nez v1, :cond_b

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    const-string v3, "Sign-in succeeded with resolve account failure: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "SignInCoordinator"

    invoke-static {v3, v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_d

    :cond_b
    iget-object v1, v0, Lذ٨ۍ/ظ;->ئ:Lذ٨ۍ/ر;

    iget-object v3, v4, Lذ۠ۋؿ/ر;->أ:Landroid/os/IBinder;

    if-nez v3, :cond_c

    goto :goto_b

    :cond_c
    sget v2, Lذ۠ۋؿ/؋;->ؠ:I

    const-string v2, "com.google.android.gms.common.internal.IAccountAccessor"

    invoke-interface {v3, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v2

    instance-of v4, v2, Lذ۠ۋؿ/ئ;

    if-eqz v4, :cond_d

    check-cast v2, Lذ۠ۋؿ/ئ;

    goto :goto_b

    :cond_d
    new-instance v2, Lذ۠ۋؿ/ـ;

    invoke-direct {v2, v3}, Lذ۠ۋؿ/ـ;-><init>(Landroid/os/IBinder;)V

    :goto_b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v2, :cond_f

    iget-object v3, v0, Lذ٨ۍ/ظ;->أ:Ljava/util/Set;

    if-nez v3, :cond_e

    goto :goto_c

    :cond_e
    iput-object v2, v1, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    iput-object v3, v1, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    iget-boolean v4, v1, Lذ٨ۍ/ر;->؋:Z

    if-eqz v4, :cond_11

    check-cast v2, Lذ۠ۋؿ/ئ;

    iget-object v1, v1, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast v1, Lخڝٻؽؐ/ؠ;

    check-cast v3, Ljava/util/Set;

    invoke-interface {v1, v2, v3}, Lخڝٻؽؐ/ؠ;->ؤ(Lذ۠ۋؿ/ئ;Ljava/util/Set;)V

    goto :goto_e

    :cond_f
    :goto_c
    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    const-string v3, "GoogleApiManager"

    const-string v4, "Received null response from onSignInSuccess"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v2, Lحۨٸڮؐێ/؋;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lحۨٸڮؐێ/؋;-><init>(I)V

    invoke-virtual {v1, v2}, Lذ٨ۍ/ر;->آ(Lحۨٸڮؐێ/؋;)V

    goto :goto_e

    :cond_10
    :goto_d
    iget-object v1, v0, Lذ٨ۍ/ظ;->ئ:Lذ٨ۍ/ر;

    invoke-virtual {v1, v5}, Lذ٨ۍ/ر;->آ(Lحۨٸڮؐێ/؋;)V

    :cond_11
    :goto_e
    iget-object v0, v0, Lذ٨ۍ/ظ;->إ:Lؼۄٿأ/ء;

    invoke-interface {v0}, Lخڝٻؽؐ/ؠ;->أ()V

    return-void

    :pswitch_d
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lذ٨ۍ/ر;

    iget-object v5, v4, Lذ٨ۍ/ر;->ؤ:Ljava/lang/Object;

    check-cast v5, Lذ٨ۍ/أ;

    iget-object v5, v5, Lذ٨ۍ/أ;->ب:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v6, v4, Lذ٨ۍ/ر;->ء:Ljava/lang/Object;

    check-cast v6, Lذ٨ۍ/؋;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lذ٨ۍ/د;

    if-nez v5, :cond_12

    goto :goto_10

    :cond_12
    iget-object v6, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    move-object v7, v6

    check-cast v7, Lحۨٸڮؐێ/؋;

    iget v7, v7, Lحۨٸڮؐێ/؋;->أ:I

    if-nez v7, :cond_13

    move v3, v1

    :cond_13
    if-eqz v3, :cond_15

    iput-boolean v1, v4, Lذ٨ۍ/ر;->؋:Z

    iget-object v1, v4, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast v1, Lخڝٻؽؐ/ؠ;

    invoke-interface {v1}, Lخڝٻؽؐ/ؠ;->إ()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-boolean v0, v4, Lذ٨ۍ/ر;->؋:Z

    if-eqz v0, :cond_16

    iget-object v0, v4, Lذ٨ۍ/ر;->آ:Ljava/lang/Object;

    check-cast v0, Lذ۠ۋؿ/ئ;

    if-eqz v0, :cond_16

    iget-object v1, v4, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast v1, Lخڝٻؽؐ/ؠ;

    iget-object v2, v4, Lذ٨ۍ/ر;->أ:Ljava/util/Collection;

    check-cast v2, Ljava/util/Set;

    invoke-interface {v1, v0, v2}, Lخڝٻؽؐ/ؠ;->ؤ(Lذ۠ۋؿ/ئ;Ljava/util/Set;)V

    goto :goto_10

    :cond_14
    :try_start_6
    check-cast v0, Lذ٨ۍ/ر;

    iget-object v0, v0, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lخڝٻؽؐ/ؠ;

    check-cast v0, Lخڝٻؽؐ/ؠ;

    invoke-interface {v0}, Lخڝٻؽؐ/ؠ;->؋()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lخڝٻؽؐ/ؠ;->ؤ(Lذ۠ۋؿ/ئ;Ljava/util/Set;)V
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_8

    goto :goto_10

    :catch_8
    move-exception v0

    const-string v1, "GoogleApiManager"

    const-string v3, "Failed to get service from broker. "

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, v4, Lذ٨ۍ/ر;->ؠ:Ljava/lang/Object;

    check-cast v0, Lخڝٻؽؐ/ؠ;

    const-string v1, "Failed to get service from broker."

    invoke-interface {v0, v1}, Lخڝٻؽؐ/ؠ;->ء(Ljava/lang/String;)V

    new-instance v0, Lحۨٸڮؐێ/؋;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lحۨٸڮؐێ/؋;-><init>(I)V

    goto :goto_f

    :cond_15
    move-object v0, v6

    check-cast v0, Lحۨٸڮؐێ/؋;

    :goto_f
    invoke-virtual {v5, v0, v2}, Lذ٨ۍ/د;->ح(Lحۨٸڮؐێ/؋;Ljava/lang/RuntimeException;)V

    :cond_16
    :goto_10
    return-void

    :pswitch_e
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lحظتۢۋۜآظ/ج;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Lحظتۢۋۜآظ/خ;

    iget v1, v1, Lحظتۢۋۜآظ/خ;->؋:I

    const-string v3, "Timing out request: "

    monitor-enter v0

    :try_start_7
    iget-object v4, v0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lحظتۢۋۜآظ/خ;

    if-eqz v4, :cond_17

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "MessengerIpcClient"

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, v0, Lحظتۢۋۜآظ/ج;->أ:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->remove(I)V

    const-string v1, "Timed out waiting for response"

    new-instance v3, Lحظتۢۋۜآظ/د;

    invoke-direct {v3, v1, v2}, Lحظتۢۋۜآظ/د;-><init>(Ljava/lang/String;Ljava/lang/SecurityException;)V

    invoke-virtual {v4, v3}, Lحظتۢۋۜآظ/خ;->؋(Lحظتۢۋۜآظ/د;)V

    invoke-virtual {v0}, Lحظتۢۋۜآظ/ج;->ء()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :cond_17
    monitor-exit v0

    return-void

    :catchall_3
    move-exception v1

    monitor-exit v0

    throw v1

    :pswitch_f
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Lحظتۢۋۜآظ/ج;

    iget-object v1, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v1, Landroid/os/IBinder;

    monitor-enter v0

    if-nez v1, :cond_18

    :try_start_8
    const-string v1, "Null service connection"
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    goto :goto_11

    :cond_18
    :try_start_9
    new-instance v2, Lآۋۻؾ۹/ة;

    invoke-direct {v2, v1}, Lآۋۻؾ۹/ة;-><init>(Landroid/os/IBinder;)V

    iput-object v2, v0, Lحظتۢۋۜآظ/ج;->ء:Lآۋۻؾ۹/ة;
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    const/4 v1, 0x2

    :try_start_a
    iput v1, v0, Lحظتۢۋۜآظ/ج;->؋:I

    iget-object v1, v0, Lحظتۢۋۜآظ/ج;->ؤ:Lحظتۢۋۜآظ/ذ;

    iget-object v1, v1, Lحظتۢۋۜآظ/ذ;->ؠ:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Lحظتۢۋۜآظ/ت;

    invoke-direct {v2, v0, v3}, Lحظتۢۋۜآظ/ت;-><init>(Lحظتۢۋۜآظ/ج;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_12

    :catchall_4
    move-exception v1

    goto :goto_13

    :catch_9
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_11
    invoke-virtual {v0, v3, v1}, Lحظتۢۋۜآظ/ج;->؋(ILjava/lang/String;)V

    :goto_12
    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw v1

    :cond_19
    :goto_14
    :try_start_b
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto :goto_15

    :catchall_5
    move-exception v0

    sget-object v2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    invoke-static {v2, v0}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :goto_15
    iget-object v0, p0, Lحظتۢۋۜآظ/ة;->ؤ:Ljava/lang/Object;

    check-cast v0, Lھۥٓڍچ/ئ;

    sget-object v2, Lھۥٓڍچ/ئ;->ا:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0}, Lھۥٓڍچ/ئ;->ؾ()Ljava/lang/Runnable;

    move-result-object v2

    if-nez v2, :cond_1a

    goto :goto_16

    :cond_1a
    iput-object v2, p0, Lحظتۢۋۜآظ/ة;->أ:Ljava/lang/Object;

    add-int/2addr v3, v1

    const/16 v2, 0x10

    if-lt v3, v2, :cond_19

    iget-object v2, v0, Lھۥٓڍچ/ئ;->آ:Lںڍڒڸ/ر;

    invoke-virtual {v2, v0}, Lںڍڒڸ/ر;->isDispatchNeeded(Lڨڡئٸت/ا;)Z

    move-result v2

    if-eqz v2, :cond_19

    iget-object v1, v0, Lھۥٓڍچ/ئ;->آ:Lںڍڒڸ/ر;

    invoke-virtual {v1, v0, p0}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    :goto_16
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
