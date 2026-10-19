.class public final synthetic Lڊ۟چڗۙ٦/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڕۇۅؑۨؼ۫ە/؋;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lڊ۟چڗۙ٦/أ;->؋:I

    iput-object p2, p0, Lڊ۟چڗۙ٦/أ;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 8

    iget v0, p0, Lڊ۟چڗۙ٦/أ;->؋:I

    iget-object v1, p0, Lڊ۟چڗۙ٦/أ;->ؠ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    check-cast v1, Lcom/google/firebase/components/ComponentRegistrar;

    return-object v1

    :pswitch_1
    check-cast v1, Ljava/lang/String;

    const-string v0, "Could not instantiate %s"

    const-string v2, "Could not instantiate %s."

    :try_start_0
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Lcom/google/firebase/components/ComponentRegistrar;

    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    new-array v4, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/components/ComponentRegistrar;

    goto :goto_0

    :cond_0
    new-instance v3, Lڊ۟چڗۙ٦/ح;

    const-string v4, "Class %s is not an instance of %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v1, v6, v5

    const-string v5, "com.google.firebase.components.ComponentRegistrar"

    const/4 v7, 0x1

    aput-object v5, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lڊ۟چڗۙ٦/ح;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v2

    new-instance v3, Lڊ۟چڗۙ٦/ح;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, v2}, Lڊ۟چڗۙ٦/ح;-><init>(Ljava/lang/String;Ljava/lang/ReflectiveOperationException;)V

    throw v3

    :catch_1
    move-exception v2

    new-instance v3, Lڊ۟چڗۙ٦/ح;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, v2}, Lڊ۟چڗۙ٦/ح;-><init>(Ljava/lang/String;Ljava/lang/ReflectiveOperationException;)V

    throw v3

    :catch_2
    move-exception v0

    new-instance v3, Lڊ۟چڗۙ٦/ح;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v0}, Lڊ۟چڗۙ٦/ح;-><init>(Ljava/lang/String;Ljava/lang/ReflectiveOperationException;)V

    throw v3

    :catch_3
    move-exception v0

    new-instance v3, Lڊ۟چڗۙ٦/ح;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v0}, Lڊ۟چڗۙ٦/ح;-><init>(Ljava/lang/String;Ljava/lang/ReflectiveOperationException;)V

    throw v3

    :catch_4
    const-string v0, "Class %s is not an found."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ComponentDiscovery"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x0

    :goto_0
    return-object v3

    :goto_1
    check-cast v1, Lڃٷښـ۝ۼ/إ;

    sget-object v0, Lږٍڔڴٝ/ء;->ث:Ljava/lang/Object;

    new-instance v0, Lږۄڙ/ؠ;

    invoke-direct {v0, v1}, Lږۄڙ/ؠ;-><init>(Lڃٷښـ۝ۼ/إ;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
