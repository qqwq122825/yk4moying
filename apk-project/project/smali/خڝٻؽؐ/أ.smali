.class public abstract Lخڝٻؽؐ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Landroid/content/Context;

.field public final ؠ:Ljava/lang/String;

.field public final ء:Lةؽڗںۍټ٘/ء;

.field public final آ:Lخڝٻؽؐ/؋;

.field public final أ:Lذ٨ۍ/؋;

.field public final ؤ:I

.field public final إ:Lٽچڃ/أ;

.field public final ئ:Lذ٨ۍ/أ;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lةؽڗںۍټ٘/ء;Lخڝٻؽؐ/آ;)V
    .locals 5

    sget-object v0, Lذ۠ۋؿ/ث;->ؠ:Lذ۠ۋؿ/ث;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    if-eqz p2, :cond_3

    if-eqz p3, :cond_2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lخڝٻؽؐ/أ;->؋:Landroid/content/Context;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    const/4 v3, 0x0

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    if-eqz v1, :cond_1

    :try_start_0
    const-class v1, Landroid/content/Context;

    const-string v2, "getAttributionTag"

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    :cond_1
    const/4 p1, 0x0

    :goto_1
    iput-object p1, p0, Lخڝٻؽؐ/أ;->ؠ:Ljava/lang/String;

    iput-object p2, p0, Lخڝٻؽؐ/أ;->ء:Lةؽڗںۍټ٘/ء;

    iput-object v0, p0, Lخڝٻؽؐ/أ;->آ:Lخڝٻؽؐ/؋;

    new-instance v0, Lذ٨ۍ/؋;

    invoke-direct {v0, p2, p1}, Lذ٨ۍ/؋;-><init>(Lةؽڗںۍټ٘/ء;Ljava/lang/String;)V

    iput-object v0, p0, Lخڝٻؽؐ/أ;->أ:Lذ٨ۍ/؋;

    new-instance p1, Lذ٨ۍ/ز;

    iget-object p1, p0, Lخڝٻؽؐ/أ;->؋:Landroid/content/Context;

    invoke-static {p1}, Lذ٨ۍ/أ;->أ(Landroid/content/Context;)Lذ٨ۍ/أ;

    move-result-object p1

    iput-object p1, p0, Lخڝٻؽؐ/أ;->ئ:Lذ٨ۍ/أ;

    iget-object p2, p1, Lذ٨ۍ/أ;->ئ:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p2

    iput p2, p0, Lخڝٻؽؐ/أ;->ؤ:I

    iget-object p2, p3, Lخڝٻؽؐ/آ;->؋:Lٽچڃ/أ;

    iput-object p2, p0, Lخڝٻؽؐ/أ;->إ:Lٽچڃ/أ;

    iget-object p1, p1, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    const/4 p2, 0x7

    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Api must not be null."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null context is not permitted."

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final ؋()Lأۺؘٻڣ/ب;
    .locals 3

    new-instance v0, Lأۺؘٻڣ/ب;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lأۺؘٻڣ/ب;-><init>(I)V

    const/4 v1, 0x0

    iput-object v1, v0, Lأۺؘٻڣ/ب;->؋:Ljava/lang/Object;

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    iget-object v2, v0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    check-cast v2, Landroidx/collection/ArraySet;

    if-nez v2, :cond_0

    new-instance v2, Landroidx/collection/ArraySet;

    invoke-direct {v2}, Landroidx/collection/ArraySet;-><init>()V

    iput-object v2, v0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    :cond_0
    iget-object v2, v0, Lأۺؘٻڣ/ب;->أ:Ljava/lang/Object;

    check-cast v2, Landroidx/collection/ArraySet;

    invoke-virtual {v2, v1}, Landroidx/collection/ArraySet;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lخڝٻؽؐ/أ;->؋:Landroid/content/Context;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lأۺؘٻڣ/ب;->آ:Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lأۺؘٻڣ/ب;->ؠ:Ljava/lang/Object;

    return-object v0
.end method
