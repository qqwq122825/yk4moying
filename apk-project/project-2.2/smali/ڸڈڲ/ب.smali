.class public final Lڸڈڲ/ب;
.super Lڸڈڲ/ة;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lڨڡئٸت/أ;
.implements Lڲږڠ/؋;


# instance fields
.field public آ:I

.field public أ:Ljava/lang/Object;

.field public ؤ:Ljava/util/Iterator;

.field public إ:Lڨڡئٸت/أ;


# virtual methods
.method public final getContext()Lڨڡئٸت/ا;
    .locals 1

    sget-object v0, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    return-object v0
.end method

.method public final hasNext()Z
    .locals 4

    :goto_0
    iget v0, p0, Lڸڈڲ/ب;->آ:I

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0}, Lڸڈڲ/ب;->ؠ()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    :cond_1
    return v3

    :cond_2
    iget-object v0, p0, Lڸڈڲ/ب;->ؤ:Ljava/util/Iterator;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    iput v2, p0, Lڸڈڲ/ب;->آ:I

    return v3

    :cond_3
    iput-object v1, p0, Lڸڈڲ/ب;->ؤ:Ljava/util/Iterator;

    :cond_4
    const/4 v0, 0x5

    iput v0, p0, Lڸڈڲ/ب;->آ:I

    iget-object v0, p0, Lڸڈڲ/ب;->إ:Lڨڡئٸت/أ;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iput-object v1, p0, Lڸڈڲ/ب;->إ:Lڨڡئٸت/أ;

    sget-object v1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-interface {v0, v1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڸڈڲ/ب;->آ:I

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lڸڈڲ/ب;->آ:I

    iget-object v0, p0, Lڸڈڲ/ب;->أ:Ljava/lang/Object;

    const/4 v1, 0x0

    iput-object v1, p0, Lڸڈڲ/ب;->أ:Ljava/lang/Object;

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lڸڈڲ/ب;->ؠ()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    :cond_1
    iput v1, p0, Lڸڈڲ/ب;->آ:I

    iget-object v0, p0, Lڸڈڲ/ب;->ؤ:Ljava/util/Iterator;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-virtual {p0}, Lڸڈڲ/ب;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lڸڈڲ/ب;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_3
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final remove()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 0

    invoke-static {p1}, Lڗًقڔ/ء;->ؽ(Ljava/lang/Object;)V

    const/4 p1, 0x4

    iput p1, p0, Lڸڈڲ/ب;->آ:I

    return-void
.end method

.method public final ؠ()Ljava/lang/RuntimeException;
    .locals 3

    iget v0, p0, Lڸڈڲ/ب;->آ:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected state of the iterator: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lڸڈڲ/ب;->آ:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Iterator has failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    :goto_0
    return-object v0
.end method
