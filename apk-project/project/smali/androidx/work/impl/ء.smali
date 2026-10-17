.class public final synthetic Landroidx/work/impl/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;

.field public final synthetic ئ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p5, p0, Landroidx/work/impl/ء;->آ:I

    iput-object p1, p0, Landroidx/work/impl/ء;->أ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/work/impl/ء;->ؤ:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/work/impl/ء;->إ:Ljava/lang/Object;

    iput-object p4, p0, Landroidx/work/impl/ء;->ئ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    iget v0, p0, Landroidx/work/impl/ء;->آ:I

    iget-object v1, p0, Landroidx/work/impl/ء;->ئ:Ljava/lang/Object;

    iget-object v2, p0, Landroidx/work/impl/ء;->إ:Ljava/lang/Object;

    iget-object v3, p0, Landroidx/work/impl/ء;->ؤ:Ljava/lang/Object;

    iget-object v4, p0, Landroidx/work/impl/ء;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    check-cast v4, Lئٱنۃؖۊڄئ/ؠ;

    check-cast v3, Lأۺؘٻڣ/ز;

    check-cast v2, Landroidx/constraintlayout/core/state/ؠ;

    check-cast v1, Lأۺؘٻڣ/ا;

    sget-object v0, Lئٱنۃؖۊڄئ/ؠ;->ؤ:Ljava/util/logging/Logger;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lئٱنۃؖۊڄئ/ؠ;->ؤ:Ljava/util/logging/Logger;

    :try_start_0
    iget-object v5, v4, Lئٱنۃؖۊڄئ/ؠ;->ء:Lإٿ٢/إ;

    move-object v6, v3

    check-cast v6, Lأۺؘٻڣ/ت;

    iget-object v6, v6, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lإٿ٢/إ;->؋(Ljava/lang/String;)Lإٿ٢/ئ;

    move-result-object v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    const-string v1, "Transport backend \'%s\' is not registered"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    check-cast v3, Lأۺؘٻڣ/ت;

    iget-object v3, v3, Lأۺؘٻڣ/ت;->؋:Ljava/lang/String;

    aput-object v3, v4, v6

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    check-cast v5, Lء؅ڱ٢/آ;

    invoke-virtual {v5, v1}, Lء؅ڱ٢/آ;->؋(Lأۺؘٻڣ/ا;)Lأۺؘٻڣ/ا;

    move-result-object v1

    iget-object v5, v4, Lئٱنۃؖۊڄئ/ؠ;->أ:Lةڈۑۂٝےآذ/ء;

    new-instance v7, Lئٱنۃؖۊڄئ/؋;

    invoke-direct {v7, v4, v3, v1, v6}, Lئٱنۃؖۊڄئ/؋;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    check-cast v5, Lةٌخ/ة;

    invoke-virtual {v5, v7}, Lةٌخ/ة;->ؿ(Lةڈۑۂٝےآذ/ؠ;)Ljava/lang/Object;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error scheduling event "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_1
    return-void

    :pswitch_1
    check-cast v4, Ljava/util/List;

    check-cast v3, Landroidx/work/impl/model/WorkGenerationalId;

    check-cast v2, Landroidx/work/Configuration;

    check-cast v1, Landroidx/work/impl/WorkDatabase;

    invoke-static {v4, v3, v2, v1}, Landroidx/work/impl/Schedulers;->ؠ(Ljava/util/List;Landroidx/work/impl/model/WorkGenerationalId;Landroidx/work/Configuration;Landroidx/work/impl/WorkDatabase;)V

    return-void

    :goto_2
    check-cast v4, Lڜٟٱڀ/ة;

    check-cast v3, Landroid/content/Context;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v3, v2}, Lڜٟٱڀ/ة;->ؠ(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
