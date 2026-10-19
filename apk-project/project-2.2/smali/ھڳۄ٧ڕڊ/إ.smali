.class public final Lھڳۄ٧ڕڊ/إ;
.super Lھڳۄ٧ڕڊ/أ;
.source "SourceFile"


# instance fields
.field public final إ:Lھٳ۰ڌ؄غڎۦ/إ;


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V
    .locals 0

    invoke-direct {p0, p2, p3, p4}, Lھڳۄ٧ڕڊ/أ;-><init>(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    iput-object p1, p0, Lھڳۄ٧ڕڊ/إ;->إ:Lھٳ۰ڌ؄غڎۦ/إ;

    return-void
.end method

.method public synthetic constructor <init>(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;I)V
    .locals 1

    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_0

    sget-object p2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    :cond_0
    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_1

    const/4 p3, -0x3

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    sget-object p4, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lھڳۄ٧ڕڊ/إ;-><init>(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    return-void
.end method


# virtual methods
.method public final collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 5

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget v1, p0, Lھڳۄ٧ڕڊ/أ;->أ:I

    const/4 v2, -0x3

    if-ne v1, v2, :cond_3

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    iget-object v2, p0, Lھڳۄ٧ڕڊ/أ;->آ:Lڨڡئٸت/ا;

    invoke-interface {v1, v2}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v2

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p1, p2}, Lھڳۄ٧ڕڊ/إ;->آ(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_4

    goto :goto_2

    :cond_0
    sget v3, Lڨڡئٸت/ؤ;->؋:I

    sget-object v3, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {v2, v3}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v4

    invoke-interface {v1, v3}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    invoke-static {v4, v1}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    instance-of v3, p1, Lھڳۄ٧ڕڊ/ز;

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    new-instance v3, Lھٳ۰ڌ؄غڎۦ/أ;

    invoke-direct {v3, p1, v1}, Lھٳ۰ڌ؄غڎۦ/أ;-><init>(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/ا;)V

    move-object p1, v3

    :goto_0
    new-instance v1, Lھڳۄ٧ڕڊ/ؤ;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lھڳۄ٧ڕڊ/ؤ;-><init>(Lھڳۄ٧ڕڊ/إ;Lڨڡئٸت/أ;)V

    invoke-static {v2}, Lںڍڒڸ/ش;->ٽ(Lڨڡئٸت/ا;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, p1, v3, v1, p2}, Lڃٷښـ۝ۼ/ؠ;->ط(Lڨڡئٸت/ا;Ljava/lang/Object;Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_2

    goto :goto_1

    :cond_2
    move-object p1, v0

    :goto_1
    if-ne p1, p2, :cond_4

    goto :goto_2

    :cond_3
    invoke-super {p0, p1, p2}, Lھڳۄ٧ڕڊ/أ;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_4

    :goto_2
    move-object v0, p1

    :cond_4
    return-object v0
.end method

.method public final bridge synthetic toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lھڳۄ٧ڕڊ/إ;->أ()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 1

    new-instance v0, Lھڳۄ٧ڕڊ/ز;

    invoke-direct {v0, p1}, Lھڳۄ٧ڕڊ/ز;-><init>(Lڽتٺۊڗ؜/ش;)V

    invoke-virtual {p0, v0, p2}, Lھڳۄ٧ڕڊ/إ;->آ(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    :goto_0
    return-object p1
.end method

.method public final ء(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھڳۄ٧ڕڊ/أ;
    .locals 2

    new-instance v0, Lھڳۄ٧ڕڊ/إ;

    iget-object v1, p0, Lھڳۄ٧ڕڊ/إ;->إ:Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-direct {v0, v1, p1, p2, p3}, Lھڳۄ٧ڕڊ/إ;-><init>(Lھٳ۰ڌ؄غڎۦ/إ;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V

    return-object v0
.end method

.method public final آ(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lھڳۄ٧ڕڊ/إ;->إ:Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-interface {v0, p1, p2}, Lھٳ۰ڌ؄غڎۦ/إ;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final أ()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lھڳۄ٧ڕڊ/إ;->إ:Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-super {p0}, Lھڳۄ٧ڕڊ/أ;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
