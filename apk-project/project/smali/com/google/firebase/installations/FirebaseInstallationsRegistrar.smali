.class public Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-installations"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static lambda$getComponents$0(Lڊ۟چڗۙ٦/آ;)Lږٍڔڴٝ/آ;
    .locals 7

    new-instance v0, Lږٍڔڴٝ/ء;

    const-class v1, Lڃٷښـ۝ۼ/إ;

    invoke-interface {p0, v1}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڃٷښـ۝ۼ/إ;

    const-class v2, Lړجإٖټض/ؤ;

    invoke-interface {p0, v2}, Lڊ۟چڗۙ٦/آ;->ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object v2

    new-instance v3, Lڊ۟چڗۙ٦/س;

    const-class v4, Lڊ؄ړ۰ګۚڝ/؋;

    const-class v5, Ljava/util/concurrent/ExecutorService;

    invoke-direct {v3, v4, v5}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-interface {p0, v3}, Lڊ۟چڗۙ٦/آ;->آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lڊ۟چڗۙ٦/س;

    const-class v5, Lڊ؄ړ۰ګۚڝ/ؠ;

    const-class v6, Ljava/util/concurrent/Executor;

    invoke-direct {v4, v5, v6}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-interface {p0, v4}, Lڊ۟چڗۙ٦/آ;->آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    new-instance v4, Lڍڤٜڞڽۧ/ا;

    invoke-direct {v4, p0}, Lڍڤٜڞڽۧ/ا;-><init>(Ljava/util/concurrent/Executor;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lږٍڔڴٝ/ء;-><init>(Lڃٷښـ۝ۼ/إ;Lڕۇۅؑۨؼ۫ە/؋;Ljava/util/concurrent/ExecutorService;Lڍڤٜڞڽۧ/ا;)V

    return-object v0
.end method

.method public static synthetic ؋(Lآۋۻؾ۹/ث;)Lږٍڔڴٝ/آ;
    .locals 0

    invoke-static {p0}, Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;->lambda$getComponents$0(Lڊ۟چڗۙ٦/آ;)Lږٍڔڴٝ/آ;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "L\u068a\u06df\u0686\u0697\u06d9\u0666/\u0621;",
            ">;"
        }
    .end annotation

    new-instance v0, Lڊ۟چڗۙ٦/ؠ;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Lږٍڔڴٝ/آ;

    invoke-direct {v0, v3, v2}, Lڊ۟چڗۙ٦/ؠ;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    const-string v2, "fire-installations"

    iput-object v2, v0, Lڊ۟چڗۙ٦/ؠ;->؋:Ljava/lang/String;

    const-class v3, Lڃٷښـ۝ۼ/إ;

    invoke-static {v3}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v3

    invoke-virtual {v0, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/ت;

    const/4 v4, 0x1

    const-class v5, Lړجإٖټض/ؤ;

    invoke-direct {v3, v1, v4, v5}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v0, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/س;

    const-class v5, Lڊ؄ړ۰ګۚڝ/؋;

    const-class v6, Ljava/util/concurrent/ExecutorService;

    invoke-direct {v3, v5, v6}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v5, v3, v4, v1}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v0, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/س;

    const-class v5, Lڊ؄ړ۰ګۚڝ/ؠ;

    const-class v6, Ljava/util/concurrent/Executor;

    invoke-direct {v3, v5, v6}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v5, v3, v4, v1}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v0, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Landroidx/constraintlayout/core/state/ؠ;

    const/4 v4, 0x7

    invoke-direct {v3, v4}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iput-object v3, v0, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v0}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    new-instance v3, Lړجإٖټض/أ;

    invoke-direct {v3, v1}, Lړجإٖټض/أ;-><init>(I)V

    const/4 v5, 0x0

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    const/4 v8, 0x0

    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    const-class v7, Lړجإٖټض/أ;

    invoke-static {v7}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v9, 0x1

    new-instance v10, Lڊ۟چڗۙ٦/؋;

    invoke-direct {v10, v1, v3}, Lڊ۟چڗۙ٦/؋;-><init>(ILjava/lang/Object;)V

    new-instance v1, Lڊ۟چڗۙ٦/ء;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object v4, v1

    move-object v6, v3

    invoke-direct/range {v4 .. v11}, Lڊ۟چڗۙ٦/ء;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILڊ۟چڗۙ٦/ؤ;Ljava/util/Set;)V

    const-string v3, "18.0.0"

    invoke-static {v2, v3}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
