.class public abstract Lںڍڒڸ/؋;
.super Lںڍڒڸ/ٵ;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/أ;
.implements Lںڍڒڸ/س;


# instance fields
.field public final ؤ:Lڨڡئٸت/ا;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ا;Z)V
    .locals 0

    invoke-direct {p0, p2}, Lںڍڒڸ/ٵ;-><init>(Z)V

    sget-object p2, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {p1, p2}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p2

    check-cast p2, Lںڍڒڸ/ى;

    invoke-virtual {p0, p2}, Lںڍڒڸ/ٵ;->غ(Lںڍڒڸ/ى;)V

    invoke-interface {p1, p0}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    iput-object p1, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    return-void
.end method


# virtual methods
.method public final getContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    return-object v0
.end method

.method public final getCoroutineContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    return-object v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 2

    invoke-static {p1}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lںڍڒڸ/خ;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v0}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    :goto_0
    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ؽ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lںڍڒڸ/ش;->ا:Lئٱنۃؖۊڄئ/آ;

    if-ne p1, v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p1}, Lںڍڒڸ/؋;->ت(Ljava/lang/Object;)V

    return-void
.end method

.method public ؋()Z
    .locals 1

    invoke-super {p0}, Lںڍڒڸ/ٵ;->؋()Z

    move-result v0

    return v0
.end method

.method public final خ()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, " was cancelled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ع(Lرسٗ/ؠ;)V
    .locals 1

    iget-object v0, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    invoke-static {v0, p1}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final ؾ()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Lںڍڒڸ/ٵ;->ؾ()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ف(Ljava/lang/Object;)V
    .locals 2

    instance-of v0, p1, Lںڍڒڸ/خ;

    if-eqz v0, :cond_1

    check-cast p1, Lںڍڒڸ/خ;

    iget-object v0, p1, Lںڍڒڸ/خ;->؋:Ljava/lang/Throwable;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lںڍڒڸ/خ;->ؠ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1, v0}, Lںڍڒڸ/؋;->و(ZLjava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1}, Lںڍڒڸ/؋;->ى(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public و(ZLjava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public ى(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public final ي(ILںڍڒڸ/؋;Lڲٱۘۑدٿٰ/خ;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    add-int/lit8 p1, p1, -0x1

    sget-object v1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-eqz p1, :cond_2

    const/4 v2, 0x1

    if-eq p1, v2, :cond_3

    const/4 v2, 0x2

    if-eq p1, v2, :cond_1

    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    :try_start_0
    iget-object p1, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    invoke-static {p1, v0}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {v2, p3}, Lڗًقڔ/ء;->ء(ILjava/lang/Object;)V

    invoke-interface {p3, p2, p0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-static {p1, v0}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    sget-object p1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-eq p2, p1, :cond_3

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p2

    :try_start_3
    invoke-static {p1, v0}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    invoke-static {p1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object p2

    :goto_1
    invoke-virtual {p0, p2}, Lںڍڒڸ/؋;->resumeWith(Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    new-instance p1, Lرسٗ/ؠ;

    invoke-direct {p1}, Lرسٗ/ؠ;-><init>()V

    throw p1

    :cond_1
    invoke-static {p2, p0, p3}, Lںڍڒڸ/ش;->ح(Ljava/lang/Object;Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/خ;)Lڨڡئٸت/أ;

    move-result-object p1

    invoke-static {p1}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    invoke-interface {p1, v1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    :try_start_4
    invoke-static {p2, p0, p3}, Lںڍڒڸ/ش;->ح(Ljava/lang/Object;Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/خ;)Lڨڡئٸت/أ;

    move-result-object p1

    invoke-static {p1}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object p1

    invoke-static {p1, v1, v0}, Lڃٷښـ۝ۼ/ؠ;->ر(Lڨڡئٸت/أ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_3
    :goto_2
    return-void

    :catchall_2
    move-exception p1

    invoke-static {p1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object p2

    invoke-virtual {p0, p2}, Lںڍڒڸ/؋;->resumeWith(Ljava/lang/Object;)V

    throw p1

    :cond_4
    throw v0
.end method
