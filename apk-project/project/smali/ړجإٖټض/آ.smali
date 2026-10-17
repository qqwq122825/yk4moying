.class public final Lړجإٖټض/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lړجإٖټض/ؤ;
.implements Lړجإٖټض/إ;


# instance fields
.field public final ؋:Lڕۇۅؑۨؼ۫ە/؋;

.field public final ؠ:Landroid/content/Context;

.field public final ء:Lڕۇۅؑۨؼ۫ە/؋;

.field public final آ:Ljava/util/Set;

.field public final أ:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Lڕۇۅؑۨؼ۫ە/؋;Ljava/util/concurrent/Executor;)V
    .locals 1

    new-instance v0, Lڃٷښـ۝ۼ/ء;

    invoke-direct {v0, p1, p2}, Lڃٷښـ۝ۼ/ء;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lړجإٖټض/آ;->؋:Lڕۇۅؑۨؼ۫ە/؋;

    iput-object p3, p0, Lړجإٖټض/آ;->آ:Ljava/util/Set;

    iput-object p5, p0, Lړجإٖټض/آ;->أ:Ljava/util/concurrent/Executor;

    iput-object p4, p0, Lړجإٖټض/آ;->ء:Lڕۇۅؑۨؼ۫ە/؋;

    iput-object p1, p0, Lړجإٖټض/آ;->ؠ:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final ؋()Lؾپۑ۟ڂڷ/ح;
    .locals 2

    iget-object v0, p0, Lړجإٖټض/آ;->ؠ:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/os/UserManagerCompat;->isUserUnlocked(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const-string v0, ""

    invoke-static {v0}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Lړجإٖټض/ء;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lړجإٖټض/ء;-><init>(ILjava/lang/Object;)V

    iget-object v1, p0, Lړجإٖټض/آ;->أ:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lڃٷښـ۝ۼ/ؠ;->ؤ(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lؾپۑ۟ڂڷ/ح;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ()V
    .locals 3

    iget-object v0, p0, Lړجإٖټض/آ;->آ:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    invoke-static {v1}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    return-void

    :cond_0
    iget-object v0, p0, Lړجإٖټض/آ;->ؠ:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/os/UserManagerCompat;->isUserUnlocked(Landroid/content/Context;)Z

    move-result v0

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    if-eqz v0, :cond_1

    invoke-static {v1}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    return-void

    :cond_1
    new-instance v0, Lړجإٖټض/ء;

    invoke-direct {v0, v2, p0}, Lړجإٖټض/ء;-><init>(ILjava/lang/Object;)V

    iget-object v1, p0, Lړجإٖټض/آ;->أ:Ljava/util/concurrent/Executor;

    invoke-static {v1, v0}, Lڃٷښـ۝ۼ/ؠ;->ؤ(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lؾپۑ۟ڂڷ/ح;

    return-void
.end method
