.class public abstract Lھڳۄ٧ڕڊ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھڳۄ٧ڕڊ/ج;


# instance fields
.field public final آ:Lڨڡئٸت/ا;

.field public final أ:I

.field public final ؤ:Lڽتٺۊڗ؜/؋;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھڳۄ٧ڕڊ/أ;->آ:Lڨڡئٸت/ا;

    iput p2, p0, Lھڳۄ٧ڕڊ/أ;->أ:I

    iput-object p3, p0, Lھڳۄ٧ڕڊ/أ;->ؤ:Lڽتٺۊڗ؜/؋;

    return-void
.end method


# virtual methods
.method public collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lھڳۄ٧ڕڊ/ء;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, p0}, Lھڳۄ٧ڕڊ/ء;-><init>(Lڨڡئٸت/أ;Lھٳ۰ڌ؄غڎۦ/ئ;Lھڳۄ٧ڕڊ/أ;)V

    new-instance p1, Lھۥٓڍچ/ر;

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    invoke-direct {p1, p2, v1}, Lھۥٓڍچ/ر;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    invoke-static {p1, p1, v0}, Lسۄھؤۏ۫/؋;->ش(Lھۥٓڍچ/ر;Lھۥٓڍچ/ر;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    :goto_0
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sget-object v1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    iget-object v2, p0, Lھڳۄ٧ڕڊ/أ;->آ:Lڨڡئٸت/ا;

    if-eq v2, v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "context="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v1, -0x3

    iget v2, p0, Lھڳۄ٧ڕڊ/أ;->أ:I

    if-eq v2, v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "capacity="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    sget-object v1, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    iget-object v2, p0, Lھڳۄ٧ڕڊ/أ;->ؤ:Lڽتٺۊڗ؜/؋;

    if-eq v2, v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "onBufferOverflow="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5b

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", "

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x3e

    invoke-static/range {v0 .. v5}, Lڡپٔۯ/د;->ڌ(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lڲٱۘۑدٿٰ/ت;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x5d

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؋(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 4

    iget-object v0, p0, Lھڳۄ٧ڕڊ/أ;->آ:Lڨڡئٸت/ا;

    invoke-interface {p1, v0}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    sget-object v1, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    iget-object v2, p0, Lھڳۄ٧ڕڊ/أ;->ؤ:Lڽتٺۊڗ؜/؋;

    iget v3, p0, Lھڳۄ٧ڕڊ/أ;->أ:I

    if-eq p3, v1, :cond_0

    goto :goto_2

    :cond_0
    const/4 p3, -0x3

    if-ne v3, p3, :cond_1

    goto :goto_1

    :cond_1
    if-ne p2, p3, :cond_2

    goto :goto_0

    :cond_2
    const/4 p3, -0x2

    if-ne v3, p3, :cond_3

    goto :goto_1

    :cond_3
    if-ne p2, p3, :cond_4

    :goto_0
    move p2, v3

    goto :goto_1

    :cond_4
    add-int/2addr p2, v3

    if-ltz p2, :cond_5

    goto :goto_1

    :cond_5
    const p2, 0x7fffffff

    :goto_1
    move-object p3, v2

    :goto_2
    invoke-static {p1, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    if-ne p2, v3, :cond_6

    if-ne p3, v2, :cond_6

    return-object p0

    :cond_6
    invoke-virtual {p0, p1, p2, p3}, Lھڳۄ٧ڕڊ/أ;->ء(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھڳۄ٧ڕڊ/أ;

    move-result-object p1

    return-object p1
.end method

.method public abstract ؠ(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;
.end method

.method public abstract ء(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھڳۄ٧ڕڊ/أ;
.end method
