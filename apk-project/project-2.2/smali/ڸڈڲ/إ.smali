.class public final Lڸڈڲ/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lڲږڠ/؋;


# instance fields
.field public آ:Ljava/lang/Object;

.field public أ:I

.field public final synthetic ؤ:Lڸڈڲ/ئ;


# direct methods
.method public constructor <init>(Lڸڈڲ/ئ;)V
    .locals 0

    iput-object p1, p0, Lڸڈڲ/إ;->ؤ:Lڸڈڲ/ئ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, -0x2

    iput p1, p0, Lڸڈڲ/إ;->أ:I

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 2

    iget v0, p0, Lڸڈڲ/إ;->أ:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lڸڈڲ/إ;->؋()V

    :cond_0
    iget v0, p0, Lڸڈڲ/إ;->أ:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final next()Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lڸڈڲ/إ;->أ:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lڸڈڲ/إ;->؋()V

    :cond_0
    iget v0, p0, Lڸڈڲ/إ;->أ:I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڸڈڲ/إ;->آ:Ljava/lang/Object;

    const-string v1, "null cannot be cast to non-null type T of kotlin.sequences.GeneratorSequence"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, -0x1

    iput v1, p0, Lڸڈڲ/إ;->أ:I

    return-object v0

    :cond_1
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

.method public final ؋()V
    .locals 3

    iget v0, p0, Lڸڈڲ/إ;->أ:I

    const/4 v1, -0x2

    iget-object v2, p0, Lڸڈڲ/إ;->ؤ:Lڸڈڲ/ئ;

    if-ne v0, v1, :cond_0

    iget-object v0, v2, Lڸڈڲ/ئ;->ء:Ljava/lang/Object;

    check-cast v0, Lڲٱۘۑدٿٰ/؋;

    invoke-interface {v0}, Lڲٱۘۑدٿٰ/؋;->invoke()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, v2, Lڸڈڲ/ئ;->ؠ:Lڲٱۘۑدٿٰ/ت;

    iget-object v1, p0, Lڸڈڲ/إ;->آ:Ljava/lang/Object;

    invoke-static {v1}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lڸڈڲ/إ;->آ:Ljava/lang/Object;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    :goto_1
    iput v0, p0, Lڸڈڲ/إ;->أ:I

    return-void
.end method
