.class public Lcom/google/firebase/FirebaseCommonRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ؋(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x20

    const/16 v1, 0x5f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getComponents()Ljava/util/List;
    .locals 14

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    const/4 v8, 0x0

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    const-class v11, Lڙڧا/ؠ;

    invoke-static {v11}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    array-length v6, v2

    move v7, v8

    :goto_0
    if-ge v7, v6, :cond_1

    aget-object v9, v2, v7

    if-eqz v9, :cond_0

    invoke-static {v9}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null interface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v2, Lڊ۟چڗۙ٦/ت;

    const/4 v12, 0x2

    const-class v6, Lڙڧا/؋;

    invoke-direct {v2, v12, v1, v6}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    iget-object v6, v2, Lڊ۟چڗۙ٦/ت;->؋:Lڊ۟چڗۙ٦/س;

    invoke-virtual {v3, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    const/4 v13, 0x1

    xor-int/2addr v6, v13

    if-eqz v6, :cond_3

    invoke-virtual {v5, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v9, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x8

    invoke-direct {v9, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    new-instance v2, Lڊ۟چڗۙ٦/ء;

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object v3, v2

    move-object v5, v6

    move-object v6, v7

    move v7, v8

    invoke-direct/range {v3 .. v10}, Lڊ۟چڗۙ٦/ء;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILڊ۟چڗۙ٦/ؤ;Ljava/util/Set;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lڊ۟چڗۙ٦/س;

    const-class v3, Lڊ؄ړ۰ګۚڝ/؋;

    const-class v4, Ljava/util/concurrent/Executor;

    invoke-direct {v2, v3, v4}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    const-class v3, Lړجإٖټض/ؤ;

    const-class v4, Lړجإٖټض/إ;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    new-instance v4, Lڊ۟چڗۙ٦/ؠ;

    const-class v5, Lړجإٖټض/آ;

    invoke-direct {v4, v5, v3}, Lڊ۟چڗۙ٦/ؠ;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    const-class v3, Landroid/content/Context;

    invoke-static {v3}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v3

    invoke-virtual {v4, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    const-class v3, Lڃٷښـ۝ۼ/إ;

    invoke-static {v3}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v3

    invoke-virtual {v4, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/ت;

    const-class v5, Lړجإٖټض/أ;

    invoke-direct {v3, v12, v1, v5}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v4, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v3, v13, v13, v11}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v4, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v3, v2, v13, v1}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v4, v3}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v3, Lړجإٖټض/ؠ;

    invoke-direct {v3, v2, v1}, Lړجإٖټض/ؠ;-><init>(Lڊ۟چڗۙ٦/س;I)V

    iput-object v3, v4, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    invoke-virtual {v4}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "fire-android"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "fire-core"

    const-string v2, "21.0.0"

    invoke-static {v1, v2}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "device-name"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "device-model"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->؋(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "device-brand"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    const-string v2, "android-target-sdk"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ظ(Ljava/lang/String;Landroidx/constraintlayout/core/state/ؠ;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    const-string v2, "android-min-sdk"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ظ(Ljava/lang/String;Landroidx/constraintlayout/core/state/ؠ;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x17

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    const-string v2, "android-platform"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ظ(Ljava/lang/String;Landroidx/constraintlayout/core/state/ؠ;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    const-string v2, "android-installer"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ظ(Ljava/lang/String;Landroidx/constraintlayout/core/state/ؠ;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :try_start_0
    sget-object v1, Lڡُؑڨ/ؠ;->أ:Lڡُؑڨ/ؠ;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "1.9.10"
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    const-string v2, "kotlin"

    invoke-static {v2, v1}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Components are not allowed to depend on interfaces they themselves provide."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
