.class public abstract Lڸڈڲ/ة;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final ؋(Lڸڈڲ/ا;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 3

    invoke-interface {p1}, Lڸڈڲ/ا;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object v0, p0

    check-cast v0, Lڸڈڲ/ب;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    sget-object v2, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    if-nez v1, :cond_0

    move-object p1, v2

    goto :goto_0

    :cond_0
    iput-object p1, v0, Lڸڈڲ/ب;->ؤ:Ljava/util/Iterator;

    const/4 p1, 0x2

    iput p1, v0, Lڸڈڲ/ب;->آ:I

    iput-object p2, v0, Lڸڈڲ/ب;->إ:Lڨڡئٸت/أ;

    sget-object p1, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    const-string v0, "frame"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_1

    return-object p1

    :cond_1
    return-object v2
.end method
