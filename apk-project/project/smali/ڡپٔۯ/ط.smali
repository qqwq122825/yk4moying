.class public abstract Lڡپٔۯ/ط;
.super Lڗًقڔ/ء;
.source "SourceFile"


# direct methods
.method public static final ـ(Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Lڸڈڲ/ا;
    .locals 2

    const-string v0, "nextFunction"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p0, :cond_0

    sget-object p0, Lڸڈڲ/آ;->؋:Lڸڈڲ/آ;

    goto :goto_0

    :cond_0
    new-instance v0, Lڸڈڲ/ئ;

    new-instance v1, Lڸڈڲ/ث;

    invoke-direct {v1, p0}, Lڸڈڲ/ث;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, p1}, Lڸڈڲ/ئ;-><init>(Lڸڈڲ/ث;Lڲٱۘۑدٿٰ/ت;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method public static final ف(Ljava/util/Set;Ljava/util/Set;)Ljava/util/LinkedHashSet;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "elements"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    add-int/2addr v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v0

    mul-int/lit8 v1, v0, 0x2

    :goto_0
    invoke-static {v1}, Lڗًقڔ/؋;->م(I)I

    move-result v0

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1, v0}, Ljava/util/LinkedHashSet;-><init>(I)V

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-static {p1, v1}, Lڡپٔۯ/ح;->ڇ(Ljava/util/Collection;Ljava/util/Collection;)V

    return-object v1
.end method
