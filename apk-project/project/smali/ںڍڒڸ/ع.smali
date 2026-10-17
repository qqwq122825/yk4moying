.class public abstract Lںڍڒڸ/ع;
.super Lڿدڮۀڸة/ئ;
.source "SourceFile"


# instance fields
.field public ؤ:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    const-wide/16 v0, 0x0

    sget-object v2, Lڿدڮۀڸة/ب;->إ:Lٽچڃ/أ;

    invoke-direct {p0, v0, v1, v2}, Lڿدڮۀڸة/ئ;-><init>(JLٽچڃ/أ;)V

    iput p1, p0, Lںڍڒڸ/ع;->ؤ:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget-object v1, p0, Lڿدڮۀڸة/ئ;->أ:Lٽچڃ/أ;

    :try_start_0
    invoke-virtual {p0}, Lںڍڒڸ/ع;->ء()Lڨڡئٸت/أ;

    move-result-object v2

    const-string v3, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<T of kotlinx.coroutines.DispatchedTask>"

    invoke-static {v2, v3}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lھۥٓڍچ/إ;

    iget-object v3, v2, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    iget-object v2, v2, Lھۥٓڍچ/إ;->ب:Ljava/lang/Object;

    invoke-interface {v3}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v4

    invoke-static {v4, v2}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    sget-object v5, Lںڍڒڸ/ش;->خ:Lئٱنۃؖۊڄئ/آ;

    const/4 v6, 0x0

    if-eq v2, v5, :cond_0

    invoke-static {v3, v4, v2}, Lڗًقڔ/ء;->ؿ(Lڨڡئٸت/أ;Lڨڡئٸت/ا;Ljava/lang/Object;)Lںڍڒڸ/ځ;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    goto :goto_0

    :cond_0
    move-object v5, v6

    :goto_0
    :try_start_1
    invoke-interface {v3}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v7

    invoke-virtual {p0}, Lںڍڒڸ/ع;->إ()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p0, v8}, Lںڍڒڸ/ع;->آ(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v9

    if-nez v9, :cond_3

    iget v10, p0, Lںڍڒڸ/ع;->ؤ:I

    const/4 v11, 0x1

    if-eq v10, v11, :cond_2

    const/4 v12, 0x2

    if-ne v10, v12, :cond_1

    goto :goto_1

    :cond_1
    const/4 v11, 0x0

    :cond_2
    :goto_1
    if-eqz v11, :cond_3

    sget-object v10, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {v7, v10}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v7

    check-cast v7, Lںڍڒڸ/ى;

    goto :goto_2

    :cond_3
    move-object v7, v6

    :goto_2
    if-eqz v7, :cond_4

    invoke-interface {v7}, Lںڍڒڸ/ى;->؋()Z

    move-result v10

    if-nez v10, :cond_4

    check-cast v7, Lںڍڒڸ/ٵ;

    invoke-virtual {v7}, Lںڍڒڸ/ٵ;->س()Ljava/util/concurrent/CancellationException;

    move-result-object v7

    invoke-virtual {p0, v8, v7}, Lںڍڒڸ/ع;->ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V

    invoke-static {v7}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v7

    goto :goto_3

    :catchall_0
    move-exception v3

    goto :goto_5

    :cond_4
    if-eqz v9, :cond_5

    invoke-static {v9}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v7

    goto :goto_3

    :cond_5
    invoke-virtual {p0, v8}, Lںڍڒڸ/ع;->أ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    :goto_3
    invoke-interface {v3, v7}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v5, :cond_6

    :try_start_2
    invoke-virtual {v5}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result v3

    if-eqz v3, :cond_7

    :cond_6
    invoke-static {v4, v2}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_7
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    invoke-static {v0}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v0

    :goto_4
    invoke-static {v0}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, v6, v0}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_7

    :goto_5
    if-eqz v5, :cond_8

    :try_start_4
    invoke-virtual {v5}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result v5

    if-eqz v5, :cond_9

    :cond_8
    invoke-static {v4, v2}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_9
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception v2

    :try_start_5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    invoke-static {v0}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v0

    :goto_6
    invoke-static {v0}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_7
    return-void
.end method

.method public abstract ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V
.end method

.method public abstract ء()Lڨڡئٸت/أ;
.end method

.method public آ(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 2

    instance-of v0, p1, Lںڍڒڸ/خ;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lںڍڒڸ/خ;

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_1

    iget-object v1, p1, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    :cond_1
    return-object v1
.end method

.method public أ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    return-object p1
.end method

.method public final ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 2

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؠ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_1
    if-nez p1, :cond_2

    move-object p1, p2

    :cond_2
    new-instance p2, Lڲایڙؕ/؋;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Fatal exception in coroutines machinery for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ". Please read KDoc to \'handleFatalException\' method and report this incident to maintainers"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-direct {p2, v0, p1}, Lڲایڙؕ/؋;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lںڍڒڸ/ع;->ء()Lڨڡئٸت/أ;

    move-result-object p1

    invoke-interface {p1}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    return-void
.end method

.method public abstract إ()Ljava/lang/Object;
.end method
