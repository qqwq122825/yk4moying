.class public Lcom/google/firebase/datatransport/TransportRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-transport"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static synthetic lambda$getComponents$0(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;
    .locals 1

    const-class v0, Landroid/content/Context;

    invoke-interface {p0, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lأۺؘٻڣ/ص;->ؠ(Landroid/content/Context;)V

    invoke-static {}, Lأۺؘٻڣ/ص;->؋()Lأۺؘٻڣ/ص;

    move-result-object p0

    sget-object v0, Lء؅ڱ٢/؋;->ؤ:Lء؅ڱ٢/؋;

    invoke-virtual {p0, v0}, Lأۺؘٻڣ/ص;->ء(Lء؅ڱ٢/؋;)Lأۺؘٻڣ/س;

    move-result-object p0

    return-object p0
.end method

.method private static synthetic lambda$getComponents$1(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;
    .locals 1

    const-class v0, Landroid/content/Context;

    invoke-interface {p0, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lأۺؘٻڣ/ص;->ؠ(Landroid/content/Context;)V

    invoke-static {}, Lأۺؘٻڣ/ص;->؋()Lأۺؘٻڣ/ص;

    move-result-object p0

    sget-object v0, Lء؅ڱ٢/؋;->ؤ:Lء؅ڱ٢/؋;

    invoke-virtual {p0, v0}, Lأۺؘٻڣ/ص;->ء(Lء؅ڱ٢/؋;)Lأۺؘٻڣ/س;

    move-result-object p0

    return-object p0
.end method

.method private static synthetic lambda$getComponents$2(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;
    .locals 1

    const-class v0, Landroid/content/Context;

    invoke-interface {p0, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lأۺؘٻڣ/ص;->ؠ(Landroid/content/Context;)V

    invoke-static {}, Lأۺؘٻڣ/ص;->؋()Lأۺؘٻڣ/ص;

    move-result-object p0

    sget-object v0, Lء؅ڱ٢/؋;->أ:Lء؅ڱ٢/؋;

    invoke-virtual {p0, v0}, Lأۺؘٻڣ/ص;->ء(Lء؅ڱ٢/؋;)Lأۺؘٻڣ/س;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ؋(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;
    .locals 0

    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$2(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ؠ(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;
    .locals 0

    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$0(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic ء(Lآۋۻؾ۹/ث;)L؋ڽبژ٦ښيل/أ;
    .locals 0

    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$1(Lڊ۟چڗۙ٦/آ;)L؋ڽبژ٦ښيل/أ;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 14
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "L\u068a\u06df\u0686\u0697\u06d9\u0666/\u0621;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    const/4 v8, 0x0

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    const-class v11, L؋ڽبژ٦ښيل/أ;

    invoke-static {v11}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    array-length v3, v0

    move v4, v8

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v0, v4

    if-eqz v5, :cond_0

    invoke-static {v5}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null interface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "fire-transport"

    const-class v12, Landroid/content/Context;

    invoke-static {v12}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v3

    iget-object v4, v3, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_2

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v9, Landroidx/constraintlayout/core/state/ؠ;

    const/4 v3, 0x4

    invoke-direct {v9, v3}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    new-instance v13, Lڊ۟چڗۙ٦/ء;

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object v3, v13

    move-object v4, v0

    move v7, v8

    invoke-direct/range {v3 .. v10}, Lڊ۟چڗۙ٦/ء;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILڊ۟چڗۙ٦/ؤ;Ljava/util/Set;)V

    new-instance v1, Lڊ۟چڗۙ٦/س;

    const-class v2, Lڐضش/؋;

    invoke-direct {v1, v2, v11}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v1}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v1

    invoke-static {v12}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v2

    invoke-virtual {v1, v2}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v2, Landroidx/constraintlayout/core/state/ؠ;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iput-object v2, v1, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v1}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    new-instance v2, Lڊ۟چڗۙ٦/س;

    const-class v3, Lڐضش/ؠ;

    invoke-direct {v2, v3, v11}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-static {v2}, Lڊ۟چڗۙ٦/ء;->؋(Lڊ۟چڗۙ٦/س;)Lڊ۟چڗۙ٦/ؠ;

    move-result-object v2

    invoke-static {v12}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v3

    invoke-virtual {v2, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Landroidx/constraintlayout/core/state/ؠ;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    iput-object v3, v2, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v2}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v2

    const-string v3, "18.2.0"

    invoke-static {v0, v3}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    filled-new-array {v13, v1, v2, v0}, [Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Components are not allowed to depend on interfaces they themselves provide."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
