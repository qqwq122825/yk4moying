.class public abstract Lھۥٓڍچ/ح;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Lںڍڒڸ/ٷ;


# direct methods
.method public static constructor <clinit>()V
    .locals 7

    const-string v0, "kotlinx.coroutines.fast.service.loader"

    sget v1, Lھۥٓڍچ/ش;->؋:I

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    :cond_0
    :try_start_1
    invoke-static {}, Landroidx/activity/result/؋;->ش()Ljava/util/Iterator;

    move-result-object v0

    const-string v2, "<this>"

    invoke-static {v0, v2}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lڡپٔۯ/خ;

    const/4 v3, 0x2

    invoke-direct {v2, v3, v0}, Lڡپٔۯ/خ;-><init>(ILjava/lang/Object;)V

    instance-of v0, v2, Lڸڈڲ/؋;

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Lڸڈڲ/؋;

    invoke-direct {v0, v2}, Lڸڈڲ/؋;-><init>(Lڡپٔۯ/خ;)V

    move-object v2, v0

    :goto_1
    invoke-static {v2}, Lڸڈڲ/ت;->ل(Lڸڈڲ/ا;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    move-object v3, v1

    goto :goto_2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    move-object v4, v3

    check-cast v4, Lھۥٓڍچ/ج;

    invoke-interface {v4}, Lھۥٓڍچ/ج;->ء()I

    move-result v4

    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lھۥٓڍچ/ج;

    invoke-interface {v6}, Lھۥٓڍچ/ج;->ء()I

    move-result v6

    if-ge v4, v6, :cond_5

    move-object v3, v5

    move v4, v6

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    :goto_2
    check-cast v3, Lھۥٓڍچ/ج;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v3, :cond_6

    :try_start_2
    invoke-interface {v3, v0}, Lھۥٓڍچ/ج;->ؠ(Ljava/util/List;)Lںڍڒڸ/ٷ;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :catchall_0
    :try_start_3
    invoke-interface {v3}, Lھۥٓڍچ/ج;->؋()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_3
    if-eqz v1, :cond_6

    sput-object v1, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    return-void

    :cond_6
    :try_start_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. \'kotlinx-coroutines-android\' and ensure it has the same version as \'kotlinx-coroutines-core\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    throw v0
.end method
