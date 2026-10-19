.class public final Lڹےف/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lڲږڠ/؋;


# instance fields
.field public آ:I

.field public أ:I

.field public ؤ:I

.field public إ:Lڶڍۭۗ/آ;

.field public ئ:I

.field public final synthetic ا:Lڹےف/ء;


# direct methods
.method public constructor <init>(Lڹےف/ء;)V
    .locals 3

    iput-object p1, p0, Lڹےف/ؠ;->ا:Lڹےف/ء;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lڹےف/ؠ;->آ:I

    iget v0, p1, Lڹےف/ء;->ؠ:I

    iget-object p1, p1, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-ltz p1, :cond_2

    if-gez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    if-le v0, p1, :cond_1

    move v0, p1

    :cond_1
    :goto_0
    iput v0, p0, Lڹےف/ؠ;->أ:I

    iput v0, p0, Lڹےف/ؠ;->ؤ:I

    return-void

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot coerce value to an empty range: maximum "

    const-string v2, " is less than minimum 0."

    invoke-static {v1, p1, v2}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final hasNext()Z
    .locals 2

    iget v0, p0, Lڹےف/ؠ;->آ:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lڹےف/ؠ;->؋()V

    :cond_0
    iget v0, p0, Lڹےف/ؠ;->آ:I

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

    iget v0, p0, Lڹےف/ؠ;->آ:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lڹےف/ؠ;->؋()V

    :cond_0
    iget v0, p0, Lڹےف/ؠ;->آ:I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lڹےف/ؠ;->إ:Lڶڍۭۗ/آ;

    const-string v2, "null cannot be cast to non-null type kotlin.ranges.IntRange"

    invoke-static {v0, v2}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    iput-object v2, p0, Lڹےف/ؠ;->إ:Lڶڍۭۗ/آ;

    iput v1, p0, Lڹےف/ؠ;->آ:I

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
    .locals 7

    iget v0, p0, Lڹےف/ؠ;->ؤ:I

    const/4 v1, 0x0

    if-gez v0, :cond_0

    iput v1, p0, Lڹےف/ؠ;->آ:I

    const/4 v0, 0x0

    iput-object v0, p0, Lڹےف/ؠ;->إ:Lڶڍۭۗ/آ;

    goto :goto_2

    :cond_0
    iget-object v2, p0, Lڹےف/ؠ;->ا:Lڹےف/ء;

    iget v3, v2, Lڹےف/ء;->ء:I

    const/4 v4, -0x1

    const/4 v5, 0x1

    if-lez v3, :cond_1

    iget v6, p0, Lڹےف/ؠ;->ئ:I

    add-int/2addr v6, v5

    iput v6, p0, Lڹےف/ؠ;->ئ:I

    if-ge v6, v3, :cond_2

    :cond_1
    iget-object v3, v2, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-le v0, v3, :cond_3

    :cond_2
    new-instance v0, Lڶڍۭۗ/آ;

    iget v1, p0, Lڹےف/ؠ;->أ:I

    iget-object v2, v2, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    invoke-static {v2}, Lڹےف/ئ;->ڜ(Ljava/lang/CharSequence;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lڶڍۭۗ/آ;-><init>(II)V

    :goto_0
    iput-object v0, p0, Lڹےف/ؠ;->إ:Lڶڍۭۗ/آ;

    iput v4, p0, Lڹےف/ؠ;->ؤ:I

    goto :goto_1

    :cond_3
    iget-object v0, v2, Lڹےف/ء;->آ:Lڲٱۘۑدٿٰ/خ;

    iget-object v3, v2, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    iget v6, p0, Lڹےف/ؠ;->ؤ:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v3, v6}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڡُؑڨ/آ;

    if-nez v0, :cond_4

    new-instance v0, Lڶڍۭۗ/آ;

    iget v1, p0, Lڹےف/ؠ;->أ:I

    iget-object v2, v2, Lڹےف/ء;->؋:Ljava/lang/CharSequence;

    invoke-static {v2}, Lڹےف/ئ;->ڜ(Ljava/lang/CharSequence;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lڶڍۭۗ/آ;-><init>(II)V

    goto :goto_0

    :cond_4
    iget-object v2, v0, Lڡُؑڨ/آ;->آ:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v0, v0, Lڡُؑڨ/آ;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget v3, p0, Lڹےف/ؠ;->أ:I

    invoke-static {v3, v2}, Lڗًقڔ/؋;->ڋ(II)Lڶڍۭۗ/آ;

    move-result-object v3

    iput-object v3, p0, Lڹےف/ؠ;->إ:Lڶڍۭۗ/آ;

    add-int/2addr v2, v0

    iput v2, p0, Lڹےف/ؠ;->أ:I

    if-nez v0, :cond_5

    move v1, v5

    :cond_5
    add-int/2addr v2, v1

    iput v2, p0, Lڹےف/ؠ;->ؤ:I

    :goto_1
    iput v5, p0, Lڹےف/ؠ;->آ:I

    :goto_2
    return-void
.end method
