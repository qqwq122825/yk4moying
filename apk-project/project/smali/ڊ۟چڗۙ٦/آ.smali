.class public interface abstract Lڊ۟چڗۙ٦/آ;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public ؋(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object p1

    invoke-interface {p0, p1}, Lڊ۟چڗۙ٦/آ;->آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;
    .locals 0

    invoke-static {p1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object p1

    invoke-interface {p0, p1}, Lڊ۟چڗۙ٦/آ;->ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    return-object p1
.end method

.method public abstract ء(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;
.end method

.method public آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p0, p1}, Lڊ۟چڗۙ٦/آ;->ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-interface {p1}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public أ(Lڊ۟چڗۙ٦/س;)Ljava/util/Set;
    .locals 0

    invoke-interface {p0, p1}, Lڊ۟چڗۙ٦/آ;->ء(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    invoke-interface {p1}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    return-object p1
.end method

.method public abstract ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;
.end method
