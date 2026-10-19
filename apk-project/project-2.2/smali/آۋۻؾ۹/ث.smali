.class public final Lآۋۻؾ۹/ث;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڊ۟چڗۙ٦/آ;


# instance fields
.field public ؋:Ljava/lang/Object;

.field public ؠ:Ljava/lang/Object;

.field public ء:Ljava/lang/Object;

.field public آ:Ljava/lang/Object;

.field public أ:Ljava/lang/Object;

.field public ؤ:Ljava/lang/Object;

.field public إ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lڊ۟چڗۙ٦/ء;Lڊ۟چڗۙ٦/ا;)V
    .locals 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iget-object v5, p1, Lڊ۟چڗۙ٦/ء;->ء:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lڊ۟چڗۙ٦/ت;

    iget v7, v6, Lڊ۟چڗۙ٦/ت;->ء:I

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-nez v7, :cond_0

    move v10, v8

    goto :goto_1

    :cond_0
    move v10, v9

    :goto_1
    const/4 v11, 0x2

    iget v12, v6, Lڊ۟چڗۙ٦/ت;->ؠ:I

    iget-object v6, v6, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    if-eqz v10, :cond_3

    if-ne v12, v11, :cond_1

    goto :goto_2

    :cond_1
    move v8, v9

    :goto_2
    if-eqz v8, :cond_2

    invoke-virtual {v3, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    if-ne v7, v11, :cond_4

    move v7, v8

    goto :goto_3

    :cond_4
    move v7, v9

    :goto_3
    if-eqz v7, :cond_5

    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    if-ne v12, v11, :cond_6

    goto :goto_4

    :cond_6
    move v8, v9

    :goto_4
    if-eqz v8, :cond_7

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_7
    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_8
    iget-object p1, p1, Lڊ۟چڗۙ٦/ء;->إ:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_9

    const-class v5, Lڒڬؾۓؾ/؋;

    invoke-static {v5}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_9
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    iput-object p1, p0, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    iput-object p2, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lږۄڙ/؋;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lږۄڙ/؋;->؋:Ljava/lang/String;

    iput-object v0, p0, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    iget-object v0, p1, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    iput-object v0, p0, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    iget-object v0, p1, Lږۄڙ/؋;->ء:Ljava/lang/String;

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    iget-object v0, p1, Lږۄڙ/؋;->آ:Ljava/lang/String;

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    iget-wide v0, p1, Lږۄڙ/؋;->أ:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    iget-wide v0, p1, Lږۄڙ/؋;->ؤ:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    iget-object p1, p1, Lږۄڙ/؋;->إ:Ljava/lang/String;

    iput-object p1, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    check-cast v0, Lڊ۟چڗۙ٦/آ;

    invoke-interface {v0, p1}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    const-class v1, Lڒڬؾۓؾ/؋;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    new-instance p1, Lڊ۟چڗۙ٦/ش;

    check-cast v0, Lڒڬؾۓؾ/؋;

    invoke-direct {p1}, Lڊ۟چڗۙ٦/ش;-><init>()V

    return-object p1

    :cond_1
    new-instance v0, Lرسٗ/ؠ;

    const-string v1, "Attempting to request an undeclared dependency %s."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;
    .locals 0

    invoke-static {p1}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object p1

    invoke-virtual {p0, p1}, Lآۋۻؾ۹/ث;->ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    return-object p1
.end method

.method public final ء(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;
    .locals 2

    iget-object v0, p0, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    check-cast v0, Lڊ۟چڗۙ٦/آ;

    invoke-interface {v0, p1}, Lڊ۟چڗۙ٦/آ;->ء(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Lرسٗ/ؠ;

    const-string v1, "Attempting to request an undeclared dependency Provider<Set<%s>>."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    check-cast v0, Lڊ۟چڗۙ٦/آ;

    invoke-interface {v0, p1}, Lڊ۟چڗۙ٦/آ;->آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Lرسٗ/ؠ;

    const-string v1, "Attempting to request an undeclared dependency %s."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final أ(Lڊ۟چڗۙ٦/س;)Ljava/util/Set;
    .locals 2

    iget-object v0, p0, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    check-cast v0, Lڊ۟چڗۙ٦/آ;

    invoke-interface {v0, p1}, Lڊ۟چڗۙ٦/آ;->أ(Lڊ۟چڗۙ٦/س;)Ljava/util/Set;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Lرسٗ/ؠ;

    const-string v1, "Attempting to request an undeclared dependency Set<%s>."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;
    .locals 2

    iget-object v0, p0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    check-cast v0, Lڊ۟چڗۙ٦/آ;

    invoke-interface {v0, p1}, Lڊ۟چڗۙ٦/آ;->ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Lرسٗ/ؠ;

    const-string v1, "Attempting to request an undeclared dependency Provider<%s>."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lرسٗ/ؠ;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final إ()Lږۄڙ/؋;
    .locals 12

    iget-object v0, p0, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    check-cast v0, Lږۄڙ/ء;

    if-nez v0, :cond_0

    const-string v0, " registrationStatus"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iget-object v1, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_1

    const-string v1, " expiresInSecs"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    iget-object v1, p0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_2

    const-string v1, " tokenCreationEpochInSecs"

    invoke-static {v0, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v0, Lږۄڙ/؋;

    iget-object v1, p0, Lآۋۻؾ۹/ث;->آ:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    iget-object v1, p0, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lږۄڙ/ء;

    iget-object v1, p0, Lآۋۻؾ۹/ث;->ء:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    iget-object v1, p0, Lآۋۻؾ۹/ث;->ؤ:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    iget-object v1, p0, Lآۋۻؾ۹/ث;->؋:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    iget-object v1, p0, Lآۋۻؾ۹/ث;->ؠ:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    iget-object v1, p0, Lآۋۻؾ۹/ث;->إ:Ljava/lang/Object;

    move-object v11, v1

    check-cast v11, Ljava/lang/String;

    move-object v2, v0

    invoke-direct/range {v2 .. v11}, Lږۄڙ/؋;-><init>(Ljava/lang/String;Lږۄڙ/ء;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V

    return-object v0

    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Missing required properties:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final ئ(Lږۄڙ/ء;)V
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lآۋۻؾ۹/ث;->أ:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null registrationStatus"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
