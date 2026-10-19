.class public final Lڽتٺۊڗ؜/ذ;
.super Lںڍڒڸ/؋;
.source "SourceFile"

# interfaces
.implements Lڽتٺۊڗ؜/ر;
.implements Lڽتٺۊڗ؜/ب;


# instance fields
.field public final إ:Lڽتٺۊڗ؜/ب;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ا;Lڽتٺۊڗ؜/ؤ;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lںڍڒڸ/؋;-><init>(Lڨڡئٸت/ا;Z)V

    iput-object p2, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    return-void
.end method


# virtual methods
.method public final iterator()Lڽتٺۊڗ؜/ؠ;
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0}, Lڽتٺۊڗ؜/س;->iterator()Lڽتٺۊڗ؜/ؠ;

    move-result-object v0

    return-object v0
.end method

.method public final ؋()Z
    .locals 1

    invoke-super {p0}, Lںڍڒڸ/؋;->؋()Z

    move-result v0

    return v0
.end method

.method public final ؠ(Ljava/lang/Throwable;)Z
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/ش;->ؠ(Ljava/lang/Throwable;)Z

    move-result p1

    return p1
.end method

.method public final ء(Ljava/util/concurrent/CancellationException;)V
    .locals 2

    invoke-virtual {p0}, Lںڍڒڸ/ٵ;->ط()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lںڍڒڸ/خ;

    if-nez v1, :cond_1

    instance-of v1, v0, Lںڍڒڸ/ٳ;

    if-eqz v1, :cond_0

    check-cast v0, Lںڍڒڸ/ٳ;

    invoke-virtual {v0}, Lںڍڒڸ/ٳ;->أ()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    if-nez p1, :cond_3

    new-instance p1, Lںڍڒڸ/ي;

    invoke-virtual {p0}, Lںڍڒڸ/؋;->خ()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1, p0}, Lںڍڒڸ/ي;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lںڍڒڸ/ى;)V

    :cond_3
    invoke-virtual {p0, p1}, Lڽتٺۊڗ؜/ذ;->ج(Ljava/util/concurrent/CancellationException;)V

    :goto_2
    return-void
.end method

.method public final آ(Lڡپٔۯ/؋;)V
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/ش;->آ(Lڡپٔۯ/؋;)V

    return-void
.end method

.method public final أ()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0}, Lڽتٺۊڗ؜/س;->أ()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final ؤ(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/ش;->ؤ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final إ()Z
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0}, Lڽتٺۊڗ؜/ش;->إ()Z

    move-result v0

    return v0
.end method

.method public final ئ(Lھڳۄ٧ڕڊ/ة;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/س;->ئ(Lھڳۄ٧ڕڊ/ة;)Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    return-object p1
.end method

.method public final ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1, p2}, Lڽتٺۊڗ؜/ش;->ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final ج(Ljava/util/concurrent/CancellationException;)V
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/س;->ء(Ljava/util/concurrent/CancellationException;)V

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٵ;->ث(Ljava/lang/Object;)Z

    return-void
.end method

.method public final و(ZLjava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p2}, Lڽتٺۊڗ؜/ش;->ؠ(Ljava/lang/Throwable;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    iget-object p1, p0, Lںڍڒڸ/؋;->ؤ:Lڨڡئٸت/ا;

    invoke-static {p1, p2}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final ى(Ljava/lang/Object;)V
    .locals 1

    check-cast p1, Lڡُؑڨ/ا;

    const/4 p1, 0x0

    iget-object v0, p0, Lڽتٺۊڗ؜/ذ;->إ:Lڽتٺۊڗ؜/ب;

    invoke-interface {v0, p1}, Lڽتٺۊڗ؜/ش;->ؠ(Ljava/lang/Throwable;)Z

    return-void
.end method
