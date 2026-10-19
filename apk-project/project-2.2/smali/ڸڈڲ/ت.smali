.class public abstract Lڸڈڲ/ت;
.super Lڡپٔۯ/ط;
.source "SourceFile"


# direct methods
.method public static final ق(Lڸڈڲ/ؤ;)Ljava/lang/Object;
    .locals 1

    new-instance v0, Lڸڈڲ/أ;

    invoke-direct {v0, p0}, Lڸڈڲ/أ;-><init>(Lڸڈڲ/ؤ;)V

    invoke-virtual {v0}, Lڸڈڲ/أ;->hasNext()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Lڸڈڲ/أ;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final ك(Lڸڈڲ/ا;Lڲٱۘۑدٿٰ/ت;)Lڸڈڲ/ؤ;
    .locals 1

    const-string v0, "transform"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lڸڈڲ/ئ;

    invoke-direct {v0, p0, p1}, Lڸڈڲ/ئ;-><init>(Lڸڈڲ/ا;Lڲٱۘۑدٿٰ/ت;)V

    new-instance p0, Lڸڈڲ/ؤ;

    invoke-direct {p0, v0}, Lڸڈڲ/ؤ;-><init>(Lڸڈڲ/ئ;)V

    return-object p0
.end method

.method public static final ل(Lڸڈڲ/ا;)Ljava/util/List;
    .locals 2

    invoke-interface {p0}, Lڸڈڲ/ا;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object p0, Lڡپٔۯ/ر;->آ:Lڡپٔۯ/ر;

    return-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {v0}, Lںڍڒڸ/ش;->م(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_2
    return-object v1
.end method
