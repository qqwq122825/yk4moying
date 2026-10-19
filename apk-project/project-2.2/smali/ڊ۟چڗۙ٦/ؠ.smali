.class public final Lڊ۟چڗۙ٦/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public ؋:Ljava/lang/String;

.field public final ؠ:Ljava/util/HashSet;

.field public final ء:Ljava/util/HashSet;

.field public آ:I

.field public أ:I

.field public ؤ:Lڊ۟چڗۙ٦/ؤ;

.field public final إ:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Ljava/lang/Class;[Ljava/lang/Class;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->؋:Ljava/lang/String;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lڊ۟چڗۙ٦/ؠ;->ء:Ljava/util/HashSet;

    const/4 v1, 0x0

    iput v1, p0, Lڊ۟چڗۙ٦/ؠ;->آ:I

    iput v1, p0, Lڊ۟چڗۙ٦/ؠ;->أ:I

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lڊ۟چڗۙ٦/ؠ;->إ:Ljava/util/HashSet;

    invoke-static {p1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    array-length p1, p2

    :goto_0
    if-ge v1, p1, :cond_1

    aget-object v0, p2, v1

    if-eqz v0, :cond_0

    iget-object v2, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    invoke-static {v0}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null interface"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    return-void
.end method

.method public constructor <init>(Lڊ۟چڗۙ٦/س;[Lڊ۟چڗۙ٦/س;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->؋:Ljava/lang/String;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lڊ۟چڗۙ٦/ؠ;->ء:Ljava/util/HashSet;

    const/4 v1, 0x0

    iput v1, p0, Lڊ۟چڗۙ٦/ؠ;->آ:I

    iput v1, p0, Lڊ۟چڗۙ٦/ؠ;->أ:I

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lڊ۟چڗۙ٦/ؠ;->إ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    array-length p1, p2

    :goto_0
    if-ge v1, p1, :cond_1

    aget-object v0, p2, v1

    if-eqz v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null interface"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iget-object p1, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    invoke-static {p1, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final ؋(Lڊ۟چڗۙ٦/ت;)V
    .locals 2

    iget-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    iget-object v1, p1, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->ء:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Components are not allowed to depend on interfaces they themselves provide."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؠ()Lڊ۟چڗۙ٦/ء;
    .locals 9

    iget-object v0, p0, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    new-instance v0, Lڊ۟چڗۙ٦/ء;

    iget-object v2, p0, Lڊ۟چڗۙ٦/ؠ;->؋:Ljava/lang/String;

    new-instance v3, Ljava/util/HashSet;

    iget-object v1, p0, Lڊ۟چڗۙ٦/ؠ;->ؠ:Ljava/util/HashSet;

    invoke-direct {v3, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v4, Ljava/util/HashSet;

    iget-object v1, p0, Lڊ۟چڗۙ٦/ؠ;->ء:Ljava/util/HashSet;

    invoke-direct {v4, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget v5, p0, Lڊ۟چڗۙ٦/ؠ;->آ:I

    iget v6, p0, Lڊ۟چڗۙ٦/ؠ;->أ:I

    iget-object v7, p0, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    iget-object v8, p0, Lڊ۟چڗۙ٦/ؠ;->إ:Ljava/util/HashSet;

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lڊ۟چڗۙ٦/ء;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILڊ۟چڗۙ٦/ؤ;Ljava/util/Set;)V

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Missing required property: factory."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
