.class public final Lڨڡئٸت/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/ا;
.implements Ljava/io/Serializable;


# instance fields
.field public final آ:Lڨڡئٸت/ا;

.field public final أ:Lڨڡئٸت/إ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/إ;Lڨڡئٸت/ا;)V
    .locals 1

    const-string v0, "left"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "element"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    iput-object p1, p0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 6

    if-eq p0, p1, :cond_6

    instance-of v0, p1, Lڨڡئٸت/آ;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    check-cast p1, Lڨڡئٸت/آ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    move-object v2, p1

    move v3, v0

    :goto_0
    iget-object v2, v2, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    instance-of v4, v2, Lڨڡئٸت/آ;

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    check-cast v2, Lڨڡئٸت/آ;

    goto :goto_1

    :cond_0
    move-object v2, v5

    :goto_1
    if-nez v2, :cond_5

    move-object v2, p0

    :goto_2
    iget-object v2, v2, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    instance-of v4, v2, Lڨڡئٸت/آ;

    if-eqz v4, :cond_1

    check-cast v2, Lڨڡئٸت/آ;

    goto :goto_3

    :cond_1
    move-object v2, v5

    :goto_3
    if-nez v2, :cond_4

    if-ne v3, v0, :cond_7

    move-object v0, p0

    :goto_4
    iget-object v2, v0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    invoke-interface {v2}, Lڨڡئٸت/إ;->getKey()Lڨڡئٸت/ئ;

    move-result-object v3

    invoke-virtual {p1, v3}, Lڨڡئٸت/آ;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v3

    invoke-static {v3, v2}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    move p1, v1

    goto :goto_5

    :cond_2
    iget-object v0, v0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    instance-of v2, v0, Lڨڡئٸت/آ;

    if-eqz v2, :cond_3

    check-cast v0, Lڨڡئٸت/آ;

    goto :goto_4

    :cond_3
    const-string v2, "null cannot be cast to non-null type kotlin.coroutines.CoroutineContext.Element"

    invoke-static {v0, v2}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lڨڡئٸت/إ;

    invoke-interface {v0}, Lڨڡئٸت/إ;->getKey()Lڨڡئٸت/ئ;

    move-result-object v2

    invoke-virtual {p1, v2}, Lڨڡئٸت/آ;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ؤ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    :goto_5
    if-eqz p1, :cond_7

    goto :goto_6

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    :goto_6
    const/4 v1, 0x1

    :cond_7
    return v1
.end method

.method public final fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    invoke-interface {v0, p1, p2}, Lڨڡئٸت/ا;->fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    invoke-interface {p2, p1, v0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 2

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    :goto_0
    iget-object v1, v0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    invoke-interface {v1, p1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_0
    iget-object v0, v0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    instance-of v1, v0, Lڨڡئٸت/آ;

    if-eqz v1, :cond_1

    check-cast v0, Lڨڡئٸت/آ;

    goto :goto_0

    :cond_1
    invoke-interface {v0, p1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object p1

    return-object p1
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public final minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 3

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lڨڡئٸت/آ;->أ:Lڨڡئٸت/إ;

    invoke-interface {v0, p1}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v1

    iget-object v2, p0, Lڨڡئٸت/آ;->آ:Lڨڡئٸت/ا;

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    invoke-interface {v2, p1}, Lڨڡئٸت/ا;->minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;

    move-result-object p1

    if-ne p1, v2, :cond_1

    move-object v0, p0

    goto :goto_0

    :cond_1
    sget-object v1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    if-ne p1, v1, :cond_2

    goto :goto_0

    :cond_2
    new-instance v1, Lڨڡئٸت/آ;

    invoke-direct {v1, v0, p1}, Lڨڡئٸت/آ;-><init>(Lڨڡئٸت/إ;Lڨڡئٸت/ا;)V

    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method public final plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;
    .locals 0

    invoke-static {p0, p1}, Lڗًقڔ/؋;->و(Lڨڡئٸت/ا;Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lڨڡئٸت/ء;->أ:Lڨڡئٸت/ء;

    const-string v2, ""

    invoke-virtual {p0, v2, v1}, Lڨڡئٸت/آ;->fold(Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
