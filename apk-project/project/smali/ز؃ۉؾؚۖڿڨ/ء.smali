.class public final Lز؃ۉؾؚۖڿڨ/ء;
.super Lخڝٻؽؐ/أ;
.source "SourceFile"


# static fields
.field public static final ا:Lةؽڗںۍټ٘/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    new-instance v0, Lړجإٖټض/أ;

    invoke-direct {v0}, Lړجإٖټض/أ;-><init>()V

    new-instance v1, Lز؃ۉؾؚۖڿڨ/ؠ;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lز؃ۉؾؚۖڿڨ/ؠ;-><init>(I)V

    new-instance v2, Lةؽڗںۍټ٘/ء;

    invoke-direct {v2, v1, v0}, Lةؽڗںۍټ٘/ء;-><init>(Lز؃ۉؾؚۖڿڨ/ؠ;Lړجإٖټض/أ;)V

    sput-object v2, Lز؃ۉؾؚۖڿڨ/ء;->ا:Lةؽڗںۍټ٘/ء;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lز؃ۉؾؚۖڿڨ/ء;->ا:Lةؽڗںۍټ٘/ء;

    sget-object v1, Lخڝٻؽؐ/آ;->ؠ:Lخڝٻؽؐ/آ;

    invoke-direct {p0, p1, v0, v1}, Lخڝٻؽؐ/أ;-><init>(Landroid/content/Context;Lةؽڗںۍټ٘/ء;Lخڝٻؽؐ/آ;)V

    return-void
.end method


# virtual methods
.method public final ؠ(Lذ۠ۋؿ/ت;)Lؾپۑ۟ڂڷ/ح;
    .locals 13

    new-instance v0, Lذ٨ۍ/ب;

    invoke-direct {v0}, Lذ٨ۍ/ب;-><init>()V

    sget-object v1, Lسۄھؤۏ۫/؋;->أ:Lحۨٸڮؐێ/ء;

    filled-new-array {v1}, [Lحۨٸڮؐێ/ء;

    move-result-object v1

    iput-object v1, v0, Lذ٨ۍ/ب;->ؠ:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lذ٨ۍ/ب;->ء:Z

    new-instance v3, Lڙڧا/ء;

    invoke-direct {v3, p1}, Lڙڧا/ء;-><init>(Ljava/lang/Object;)V

    iput-object v3, v0, Lذ٨ۍ/ب;->أ:Ljava/lang/Object;

    new-instance p1, Lذ٨ۍ/ب;

    check-cast v1, [Lحۨٸڮؐێ/ء;

    iget v3, v0, Lذ٨ۍ/ب;->آ:I

    invoke-direct {p1, v0, v1, v2, v3}, Lذ٨ۍ/ب;-><init>(Lذ٨ۍ/ب;[Lحۨٸڮؐێ/ء;ZI)V

    new-instance v0, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    iget-object v9, p0, Lخڝٻؽؐ/أ;->ئ:Lذ٨ۍ/أ;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v3, p1, Lذ٨ۍ/ب;->آ:I

    iget-object v10, v9, Lذ٨ۍ/أ;->ث:Lصٝتږۗ/آ;

    iget-object v11, v0, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    if-eqz v3, :cond_1

    iget-object v4, p0, Lخڝٻؽؐ/أ;->أ:Lذ٨ۍ/؋;

    invoke-virtual {v9}, Lذ٨ۍ/أ;->؋()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {}, Lذ۠ۋؿ/ب;->أ()Lذ۠ۋؿ/ب;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v12, Lذ٨ۍ/ش;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    move-object v1, v12

    move-object v2, v9

    invoke-direct/range {v1 .. v8}, Lذ٨ۍ/ش;-><init>(Lذ٨ۍ/أ;ILذ٨ۍ/؋;JJ)V

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lذ٨ۍ/ث;

    invoke-direct {v2, v10}, Lذ٨ۍ/ث;-><init>(Lصٝتږۗ/آ;)V

    invoke-virtual {v11, v2, v1}, Lؾپۑ۟ڂڷ/ح;->؋(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    :cond_1
    new-instance v1, Lذ٨ۍ/ع;

    iget-object v2, p0, Lخڝٻؽؐ/أ;->إ:Lٽچڃ/أ;

    invoke-direct {v1, p1, v0, v2}, Lذ٨ۍ/ع;-><init>(Lذ٨ۍ/ب;Lؾپۑ۟ڂڷ/ا;Lٽچڃ/أ;)V

    new-instance p1, Lذ٨ۍ/ض;

    iget-object v0, v9, Lذ٨ۍ/أ;->ا:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-direct {p1, v1, v0, p0}, Lذ٨ۍ/ض;-><init>(Lذ٨ۍ/ع;ILخڝٻؽؐ/أ;)V

    const/4 v0, 0x4

    invoke-virtual {v10, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v10, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-object v11
.end method
