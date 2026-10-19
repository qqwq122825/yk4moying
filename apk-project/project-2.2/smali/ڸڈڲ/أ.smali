.class public final Lڸڈڲ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lڲږڠ/؋;


# instance fields
.field public final آ:Ljava/util/Iterator;

.field public أ:I

.field public ؤ:Ljava/lang/Object;

.field public final synthetic إ:Lڸڈڲ/ؤ;


# direct methods
.method public constructor <init>(Lڸڈڲ/ؤ;)V
    .locals 0

    iput-object p1, p0, Lڸڈڲ/أ;->إ:Lڸڈڲ/ؤ;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object p1, p1, Lڸڈڲ/ؤ;->؋:Lڸڈڲ/ا;

    invoke-interface {p1}, Lڸڈڲ/ا;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lڸڈڲ/أ;->آ:Ljava/util/Iterator;

    const/4 p1, -0x1

    iput p1, p0, Lڸڈڲ/أ;->أ:I

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 2

    iget v0, p0, Lڸڈڲ/أ;->أ:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lڸڈڲ/أ;->؋()V

    :cond_0
    iget v0, p0, Lڸڈڲ/أ;->أ:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڸڈڲ/أ;->أ:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lڸڈڲ/أ;->؋()V

    :cond_0
    iget v0, p0, Lڸڈڲ/أ;->أ:I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڸڈڲ/أ;->ؤ:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-object v2, p0, Lڸڈڲ/أ;->ؤ:Ljava/lang/Object;

    iput v1, p0, Lڸڈڲ/أ;->أ:I

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

    :cond_0
    iget-object v0, p0, Lڸڈڲ/أ;->آ:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lڸڈڲ/أ;->إ:Lڸڈڲ/ؤ;

    iget-object v2, v1, Lڸڈڲ/ؤ;->ء:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v2, v0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-boolean v1, v1, Lڸڈڲ/ؤ;->ؠ:Z

    if-ne v2, v1, :cond_0

    iput-object v0, p0, Lڸڈڲ/أ;->ؤ:Ljava/lang/Object;

    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lڸڈڲ/أ;->أ:I

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
