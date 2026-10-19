.class public final Lںڏۑڎڔٙ۰/آ;
.super Lںڍڒڸ/ٷ;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ط;


# instance fields
.field private volatile _immediate:Lںڏۑڎڔٙ۰/آ;

.field public final آ:Landroid/os/Handler;

.field public final أ:Ljava/lang/String;

.field public final ؤ:Z

.field public final إ:Lںڏۑڎڔٙ۰/آ;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lںڏۑڎڔٙ۰/آ;-><init>(Landroid/os/Handler;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Ljava/lang/String;Z)V
    .locals 1

    invoke-direct {p0}, Lںڍڒڸ/ٷ;-><init>()V

    iput-object p1, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    iput-object p2, p0, Lںڏۑڎڔٙ۰/آ;->أ:Ljava/lang/String;

    iput-boolean p3, p0, Lںڏۑڎڔٙ۰/آ;->ؤ:Z

    if-eqz p3, :cond_0

    move-object p3, p0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iput-object p3, p0, Lںڏۑڎڔٙ۰/آ;->_immediate:Lںڏۑڎڔٙ۰/آ;

    iget-object p3, p0, Lںڏۑڎڔٙ۰/آ;->_immediate:Lںڏۑڎڔٙ۰/آ;

    if-nez p3, :cond_1

    new-instance p3, Lںڏۑڎڔٙ۰/آ;

    const/4 v0, 0x1

    invoke-direct {p3, p1, p2, v0}, Lںڏۑڎڔٙ۰/آ;-><init>(Landroid/os/Handler;Ljava/lang/String;Z)V

    iput-object p3, p0, Lںڏۑڎڔٙ۰/آ;->_immediate:Lںڏۑڎڔٙ۰/آ;

    :cond_1
    iput-object p3, p0, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;

    return-void
.end method


# virtual methods
.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    invoke-virtual {v0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lںڏۑڎڔٙ۰/آ;->ؾ(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lںڏۑڎڔٙ۰/آ;

    if-eqz v0, :cond_0

    check-cast p1, Lںڏۑڎڔٙ۰/آ;

    iget-object p1, p1, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final isDispatchNeeded(Lڨڡئٸت/ا;)Z
    .locals 1

    iget-boolean p1, p0, Lںڏۑڎڔٙ۰/آ;->ؤ:Z

    if-eqz p1, :cond_1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    sget-object v0, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    sget-object v0, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    if-ne p0, v0, :cond_0

    const-string v0, "Dispatchers.Main"

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    check-cast v0, Lںڏۑڎڔٙ۰/آ;

    iget-object v0, v0, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v0, v1

    :goto_0
    if-ne p0, v0, :cond_1

    const-string v0, "Dispatchers.Main.immediate"

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    if-nez v0, :cond_3

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->أ:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    iget-boolean v1, p0, Lںڏۑڎڔٙ۰/آ;->ؤ:Z

    if-eqz v1, :cond_3

    const-string v1, ".immediate"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    return-object v0
.end method

.method public final ر(JLںڍڒڸ/ئ;)V
    .locals 4

    new-instance v0, Lحظتۢۋۜآظ/ة;

    const/16 v1, 0xf

    invoke-direct {v0, v1, p3, p0}, Lحظتۢۋۜآظ/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const-wide v1, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long v3, p1, v1

    if-lez v3, :cond_0

    move-wide p1, v1

    :cond_0
    iget-object v1, p0, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    invoke-virtual {v1, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Lںڏۑڎڔٙ۰/ء;

    invoke-direct {p1, p0, v0}, Lںڏۑڎڔٙ۰/ء;-><init>(Lںڏۑڎڔٙ۰/آ;Lحظتۢۋۜآظ/ة;)V

    invoke-virtual {p3, p1}, Lںڍڒڸ/ئ;->د(Lڲٱۘۑدٿٰ/ت;)V

    goto :goto_0

    :cond_1
    iget-object p1, p3, Lںڍڒڸ/ئ;->ئ:Lڨڡئٸت/ا;

    invoke-virtual {p0, p1, v0}, Lںڏۑڎڔٙ۰/آ;->ؾ(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public final ؾ(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 3

    new-instance v0, Ljava/util/concurrent/CancellationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "The task was rejected, the handler underlying the dispatcher \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\' was closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    sget-object v1, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {p1, v1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    check-cast v1, Lںڍڒڸ/ى;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    :cond_0
    sget-object v0, Lںڍڒڸ/غ;->ؠ:Lڿدڮۀڸة/ء;

    invoke-virtual {v0, p1, p2}, Lڿدڮۀڸة/ء;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    return-void
.end method
