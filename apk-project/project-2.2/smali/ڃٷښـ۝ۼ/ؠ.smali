.class public abstract Lڃٷښـ۝ۼ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static ؋:Ljava/lang/Boolean; = null

.field public static ؠ:Ljava/lang/Boolean; = null

.field public static ء:Ljava/lang/Boolean; = null

.field public static آ:Ljava/lang/Boolean; = null

.field public static final أ:Lړجإٖټض/أ;

.field public static final ؤ:Lٽچڃ/أ;

.field public static إ:Z = false

.field public static volatile ئ:Z = false

.field public static ا:Landroid/os/Handler;

.field public static final ب:Lةؽڗںۍټ٘/ء;

.field public static ة:Lةؽڗںۍټ٘/ء;

.field public static final ت:Lئٱنۃؖۊڄئ/آ;

.field public static final ث:Lئٱنۃؖۊڄئ/آ;

.field public static final ج:Lۀۗ۱/ئ;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    new-instance v0, Lړجإٖټض/أ;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lړجإٖټض/أ;-><init>(I)V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->أ:Lړجإٖټض/أ;

    new-instance v0, Lٽچڃ/أ;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lٽچڃ/أ;-><init>(I)V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->ؤ:Lٽچڃ/أ;

    new-instance v0, Lةؽڗںۍټ٘/ء;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lةؽڗںۍټ٘/ء;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->ب:Lةؽڗںۍټ٘/ء;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const/16 v1, 0x9

    const-string v2, "UNDEFINED"

    invoke-direct {v0, v1, v2}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->ت:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v2, "REUSABLE_CLAIMED"

    invoke-direct {v0, v1, v2}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->ث:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lۀۗ۱/ئ;

    invoke-direct {v0}, Lۀۗ۱/ئ;-><init>()V

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->ج:Lۀۗ۱/ئ;

    return-void
.end method

.method public static final ؋(III[B[B)Z
    .locals 4

    const-string v0, "a"

    invoke-static {p3, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "b"

    invoke-static {p4, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p2, :cond_1

    add-int v2, v1, p0

    aget-byte v2, p3, v2

    add-int v3, v1, p1

    aget-byte v3, p4, v3

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static ؠ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 4

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_3

    invoke-static {}, Lسۄھؤۏ۫/؋;->ئ()V

    const-string v0, "Task must not be null"

    if-eqz p0, :cond_2

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lڃٷښـ۝ۼ/ؠ;->ظ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance v0, Lڙڧا/ء;

    invoke-direct {v0, v2}, Lڙڧا/ء;-><init>(I)V

    sget-object v1, Lؾپۑ۟ڂڷ/ب;->ؠ:Lؾپۑ۟ڂڷ/ج;

    invoke-virtual {p0, v1, v0}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    new-instance v2, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v2, v1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/أ;)V

    iget-object v3, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v3, v2}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    new-instance v2, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v2, v1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/ء;)V

    invoke-virtual {v3, v2}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    iget-object v0, v0, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    invoke-static {p0}, Lڃٷښـ۝ۼ/ؠ;->ظ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Must not be called on the main application thread"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ء(Lؾپۑ۟ڂڷ/ح;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 4

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_4

    invoke-static {}, Lسۄھؤۏ۫/؋;->ئ()V

    const-string v0, "TimeUnit must not be null"

    if-eqz p3, :cond_3

    iget-object v1, p0, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lؾپۑ۟ڂڷ/ح;->ء:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lڃٷښـ۝ۼ/ؠ;->ظ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance v0, Lڙڧا/ء;

    invoke-direct {v0, v2}, Lڙڧا/ء;-><init>(I)V

    sget-object v1, Lؾپۑ۟ڂڷ/ب;->ؠ:Lؾپۑ۟ڂڷ/ج;

    invoke-virtual {p0, v1, v0}, Lؾپۑ۟ڂڷ/ح;->ؠ(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/ؤ;)V

    new-instance v2, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v2, v1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/أ;)V

    iget-object v3, p0, Lؾپۑ۟ڂڷ/ح;->ؠ:Lڜأِجطّثٮ/؋;

    invoke-virtual {v3, v2}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    new-instance v2, Lؾپۑ۟ڂڷ/ت;

    invoke-direct {v2, v1, v0}, Lؾپۑ۟ڂڷ/ت;-><init>(Lؾپۑ۟ڂڷ/ج;Lؾپۑ۟ڂڷ/ء;)V

    invoke-virtual {v3, v2}, Lڜأِجطّثٮ/؋;->أ(Lؾپۑ۟ڂڷ/ث;)V

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ث()V

    iget-object v0, v0, Lڙڧا/ء;->آ:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {p0}, Lڃٷښـ۝ۼ/ؠ;->ظ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/util/concurrent/TimeoutException;

    const-string p1, "Timed out waiting for Task"

    invoke-direct {p0, p1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Must not be called on the main application thread"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final آ(Lۀۗ۱/غ;)Lۀۗ۱/ص;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lۀۗ۱/ص;

    invoke-direct {v0, p0}, Lۀۗ۱/ص;-><init>(Lۀۗ۱/غ;)V

    return-object v0
.end method

.method public static final أ(Lۀۗ۱/ؼ;)Lۀۗ۱/ض;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lۀۗ۱/ض;

    invoke-direct {v0, p0}, Lۀۗ۱/ض;-><init>(Lۀۗ۱/ؼ;)V

    return-object v0
.end method

.method public static ؤ(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lؾپۑ۟ڂڷ/ح;
    .locals 3

    if-eqz p0, :cond_0

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    new-instance v1, Lحظتۢۋۜآظ/ة;

    const/16 v2, 0xb

    invoke-direct {v1, v2, v0, p1}, Lحظتۢۋۜآظ/ة;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "Executor must not be null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final إ(JJJ)V
    .locals 4

    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    cmp-long v0, p2, p0

    if-gtz v0, :cond_0

    sub-long v0, p0, p2

    cmp-long v0, v0, p4

    if-ltz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "size="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " offset="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " byteCount="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;
    .locals 1

    new-instance v0, Lؾپۑ۟ڂڷ/ح;

    invoke-direct {v0}, Lؾپۑ۟ڂڷ/ح;-><init>()V

    invoke-virtual {v0, p0}, Lؾپۑ۟ڂڷ/ح;->ب(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static synthetic ا(Lھڳۄ٧ڕڊ/ج;Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;I)Lھٳ۰ڌ؄غڎۦ/إ;
    .locals 1

    and-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_0

    sget-object p1, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    :cond_0
    and-int/lit8 v0, p4, 0x2

    if-eqz v0, :cond_1

    const/4 p2, -0x3

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    sget-object p3, Lڽتٺۊڗ؜/؋;->آ:Lڽتٺۊڗ؜/؋;

    :cond_2
    invoke-interface {p0, p1, p2, p3}, Lھڳۄ٧ڕڊ/ج;->؋(Lڨڡئٸت/ا;ILڽتٺۊڗ؜/؋;)Lھٳ۰ڌ؄غڎۦ/إ;

    move-result-object p0

    return-object p0
.end method

.method public static ب(FFF)F
    .locals 0

    sub-float/2addr p0, p2

    sub-float/2addr p1, p2

    div-float/2addr p0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    sub-float/2addr p1, p0

    return p1
.end method

.method public static final ت(Ljava/lang/Object;)Lھۥٓڍچ/ز;
    .locals 1

    sget-object v0, Lسۄھؤۏ۫/؋;->ظ:Lئٱنۃؖۊڄئ/آ;

    if-eq p0, v0, :cond_0

    const-string v0, "null cannot be cast to non-null type S of kotlinx.coroutines.internal.SegmentOrClosed"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Lھۥٓڍچ/ز;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Does not contain segment"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ث(Landroid/content/Context;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 6

    const-string v0, "Permitir"

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto/16 :goto_1

    :cond_0
    const/16 p0, 0x1d

    :try_start_0
    new-array v1, p0, [Ljava/lang/String;

    const-string v2, "Allow"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "ALLOW"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "\u5141\u8bb8"

    const/4 v4, 0x2

    aput-object v2, v1, v4

    const-string v2, "\u5141\u8a31"

    const/4 v4, 0x3

    aput-object v2, v1, v4

    const-string v2, "\u0905\u0928\u0941\u092e\u0924\u093f"

    const/4 v4, 0x4

    aput-object v2, v1, v4

    const-string v2, "\u0905\u0928\u0941\u092e\u0924\u093f \u0926\u0947\u0902"

    const/4 v4, 0x5

    aput-object v2, v1, v4

    const-string v2, "Izinkan"

    const/4 v4, 0x6

    aput-object v2, v1, v4

    const-string v2, "Bolehkan"

    const/4 v4, 0x7

    aput-object v2, v1, v4

    const-string v2, "\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15"

    const/16 v4, 0x8

    aput-object v2, v1, v4

    const/16 v2, 0x9

    aput-object v0, v1, v2

    const/16 v2, 0xa

    aput-object v0, v1, v2

    const-string v0, "Autoriser"

    const/16 v2, 0xb

    aput-object v0, v1, v2

    const-string v0, "Erlauben"

    const/16 v2, 0xc

    aput-object v0, v1, v2

    const-string v0, "Zulassen"

    const/16 v2, 0xd

    aput-object v0, v1, v2

    const-string v0, "Consenti"

    const/16 v2, 0xe

    aput-object v0, v1, v2

    const-string v0, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c"

    const/16 v2, 0xf

    aput-object v0, v1, v2

    const-string v0, "Cho ph\u00e9p"

    const/16 v2, 0x10

    aput-object v0, v1, v2

    const-string v0, "\ud5c8\uc6a9"

    const/16 v4, 0x11

    aput-object v0, v1, v4

    const-string v0, "\u8a31\u53ef"

    const/16 v4, 0x12

    aput-object v0, v1, v4

    const-string v0, "\u0130zin ver"

    const/16 v4, 0x13

    aput-object v0, v1, v4

    const-string v0, "\u0627\u0644\u0633\u0645\u0627\u062d"

    const/16 v4, 0x14

    aput-object v0, v1, v4

    const-string v0, "\u0633\u0645\u0627\u062d"

    const/16 v4, 0x15

    aput-object v0, v1, v4

    const-string v0, "Benarkan"

    const/16 v4, 0x16

    aput-object v0, v1, v4

    const-string v0, "\u0985\u09a8\u09c1\u09ae\u09a4\u09bf \u09a6\u09bf\u09a8"

    const/16 v4, 0x17

    aput-object v0, v1, v4

    const-string v0, "\u0627\u062c\u0627\u0632\u062a \u062f\u06cc\u06ba"

    const/16 v4, 0x18

    aput-object v0, v1, v4

    const-string v0, "Payagan"

    const/16 v4, 0x19

    aput-object v0, v1, v4

    const-string v0, "Toestaan"

    const/16 v4, 0x1a

    aput-object v0, v1, v4

    const-string v0, "Zezw\u00f3l"

    const/16 v4, 0x1b

    aput-object v0, v1, v4

    const-string v0, "\u1001\u103d\u1004\u1037\u103a\u1015\u103c\u102f\u101b\u1014\u103a"

    const/16 v4, 0x1c

    aput-object v0, v1, v4

    :goto_0
    if-ge v3, p0, :cond_3

    aget-object v0, v1, v3

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByText(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v4, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "BatteryAutoGranter"

    const-string v0, "handleOppoBatteryDialog error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_1
    return-void
.end method

.method public static final ج(Ljava/lang/AssertionError;)Z
    .locals 2

    sget-object v0, Lۀۗ۱/ز;->؋:Ljava/util/logging/Logger;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "getsockname failed"

    invoke-static {p0, v0, v1}, Lڹےف/ئ;->ژ(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z

    move-result p0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    if-eqz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public static final ح(Ljava/lang/Object;)Z
    .locals 1

    sget-object v0, Lسۄھؤۏ۫/؋;->ظ:Lئٱنۃؖۊڄئ/آ;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static خ(Landroid/content/Context;)Z
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lڃٷښـ۝ۼ/ؠ;->؋:Ljava/lang/Boolean;

    if-nez v1, :cond_0

    const-string v1, "android.hardware.type.watch"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lڃٷښـ۝ۼ/ؠ;->؋:Ljava/lang/Boolean;

    :cond_0
    sget-object v0, Lڃٷښـ۝ۼ/ؠ;->؋:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    sget-object v0, Lڃٷښـ۝ۼ/ؠ;->ؠ:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "cn.google"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lڃٷښـ۝ۼ/ؠ;->ؠ:Ljava/lang/Boolean;

    :cond_1
    sget-object p0, Lڃٷښـ۝ۼ/ؠ;->ؠ:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x1

    if-lt p0, v1, :cond_2

    move p0, v2

    goto :goto_0

    :cond_2
    move p0, v0

    :goto_0
    if-eqz p0, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public static final ذ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    if-nez p0, :cond_0

    move-object p0, p1

    goto :goto_0

    :cond_0
    instance-of v0, p0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method public static final ر(Lڨڡئٸت/أ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V
    .locals 7

    instance-of v0, p0, Lھۥٓڍچ/إ;

    if-eqz v0, :cond_a

    check-cast p0, Lھۥٓڍچ/إ;

    invoke-static {p1}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    new-instance v0, Lںڍڒڸ/د;

    invoke-direct {v0, p1, p2}, Lںڍڒڸ/د;-><init>(Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V

    goto :goto_0

    :cond_0
    move-object v0, p1

    goto :goto_0

    :cond_1
    new-instance p2, Lںڍڒڸ/خ;

    invoke-direct {p2, v1, v0}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    move-object v0, p2

    :goto_0
    iget-object p2, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    invoke-virtual {p0}, Lھۥٓڍچ/إ;->getContext()Lڨڡئٸت/ا;

    move-result-object v2

    iget-object v3, p0, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    invoke-virtual {v3, v2}, Lںڍڒڸ/ر;->isDispatchNeeded(Lڨڡئٸت/ا;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    iput-object v0, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v4, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {p0}, Lھۥٓڍچ/إ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    invoke-virtual {v3, p1, p0}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto/16 :goto_6

    :cond_2
    invoke-static {}, Lںڍڒڸ/ٿ;->؋()Lںڍڒڸ/ف;

    move-result-object v2

    invoke-virtual {v2}, Lںڍڒڸ/ف;->ق()Z

    move-result v3

    if-eqz v3, :cond_3

    iput-object v0, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v4, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {v2, p0}, Lںڍڒڸ/ف;->ؿ(Lںڍڒڸ/ع;)V

    goto/16 :goto_6

    :cond_3
    invoke-virtual {v2, v4}, Lںڍڒڸ/ف;->ف(Z)V

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0}, Lھۥٓڍچ/إ;->getContext()Lڨڡئٸت/ا;

    move-result-object v5

    sget-object v6, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    invoke-interface {v5, v6}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v5

    check-cast v5, Lںڍڒڸ/ى;

    if-eqz v5, :cond_4

    invoke-interface {v5}, Lںڍڒڸ/ى;->؋()Z

    move-result v6

    if-nez v6, :cond_4

    check-cast v5, Lںڍڒڸ/ٵ;

    invoke-virtual {v5}, Lںڍڒڸ/ٵ;->س()Ljava/util/concurrent/CancellationException;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lھۥٓڍچ/إ;->ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V

    invoke-static {v1}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v0

    invoke-virtual {p0, v0}, Lھۥٓڍچ/إ;->resumeWith(Ljava/lang/Object;)V

    move v1, v4

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_4

    :cond_4
    :goto_1
    if-nez v1, :cond_9

    iget-object v0, p0, Lھۥٓڍچ/إ;->ب:Ljava/lang/Object;

    invoke-interface {p2}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    invoke-static {v1, v0}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v5, Lںڍڒڸ/ش;->خ:Lئٱنۃؖۊڄئ/آ;

    if-eq v0, v5, :cond_5

    invoke-static {p2, v1, v0}, Lڗًقڔ/ء;->ؿ(Lڨڡئٸت/أ;Lڨڡئٸت/ا;Ljava/lang/Object;)Lںڍڒڸ/ځ;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_5
    move-object v5, v3

    :goto_2
    :try_start_1
    invoke-interface {p2, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v5, :cond_6

    :try_start_2
    invoke-virtual {v5}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result p1

    if-eqz p1, :cond_9

    :cond_6
    invoke-static {v1, v0}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    goto :goto_3

    :catchall_1
    move-exception p1

    if-eqz v5, :cond_7

    invoke-virtual {v5}, Lںڍڒڸ/ځ;->ٮ()Z

    move-result p2

    if-eqz p2, :cond_8

    :cond_7
    invoke-static {v1, v0}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_8
    throw p1

    :cond_9
    :goto_3
    invoke-virtual {v2}, Lںڍڒڸ/ف;->ل()Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez p1, :cond_9

    goto :goto_5

    :goto_4
    :try_start_3
    invoke-virtual {p0, p1, v3}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_5
    invoke-virtual {v2, v4}, Lںڍڒڸ/ف;->ؾ(Z)V

    goto :goto_6

    :catchall_2
    move-exception p0

    invoke-virtual {v2, v4}, Lںڍڒڸ/ف;->ؾ(Z)V

    throw p0

    :cond_a
    invoke-interface {p0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    :goto_6
    return-void
.end method

.method public static final س(Ljava/net/Socket;)Lۀۗ۱/غ;
    .locals 3

    sget-object v0, Lۀۗ۱/ز;->؋:Ljava/util/logging/Logger;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lۀۗ۱/ػ;

    invoke-direct {v0, p0}, Lۀۗ۱/ػ;-><init>(Ljava/net/Socket;)V

    new-instance v1, Lۀۗ۱/آ;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    const-string v2, "getOutputStream(...)"

    invoke-static {p0, v2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, p0, v0}, Lۀۗ۱/آ;-><init>(Ljava/io/OutputStream;Lۀۗ۱/ؿ;)V

    invoke-virtual {v0, v1}, Lۀۗ۱/ؤ;->sink(Lۀۗ۱/غ;)Lۀۗ۱/غ;

    move-result-object p0

    return-object p0
.end method

.method public static final ش(Ljava/net/Socket;)Lۀۗ۱/ؼ;
    .locals 3

    sget-object v0, Lۀۗ۱/ز;->؋:Ljava/util/logging/Logger;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lۀۗ۱/ػ;

    invoke-direct {v0, p0}, Lۀۗ۱/ػ;-><init>(Ljava/net/Socket;)V

    new-instance v1, Lۀۗ۱/أ;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    const-string v2, "getInputStream(...)"

    invoke-static {p0, v2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, p0, v0}, Lۀۗ۱/أ;-><init>(Ljava/io/InputStream;Lۀۗ۱/ؿ;)V

    invoke-virtual {v0, v1}, Lۀۗ۱/ؤ;->source(Lۀۗ۱/ؼ;)Lۀۗ۱/ؼ;

    move-result-object p0

    return-object p0
.end method

.method public static ص(Landroid/content/Context;)V
    .locals 7

    sget-boolean v0, Lڃٷښـ۝ۼ/ؠ;->إ:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lڃٷښـ۝ۼ/ؠ;->إ:Z

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "START|brand="

    const-string v3, "|model="

    invoke-static {v2, v1, v3}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|sdk="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "battery_auto"

    invoke-static {v3, v2}, Lڝږ؁ڋ/ر;->؋(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    sput-boolean v0, Lڃٷښـ۝ۼ/ؠ;->ئ:Z

    sget-object v2, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    new-instance v3, Lڝږ؁ڋ/ؤ;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    const-wide/16 v5, 0x3e8

    invoke-virtual {v2, v3, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget-object v2, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    new-instance v3, Lڝږ؁ڋ/ؤ;

    invoke-direct {v3, p0, v0}, Lڝږ؁ڋ/ؤ;-><init>(Landroid/content/Context;I)V

    const-wide/16 v5, 0xbb8

    invoke-virtual {v2, v3, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget-object v2, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    new-instance v3, Lڝږ؁ڋ/إ;

    invoke-direct {v3, p0, v1, v4}, Lڝږ؁ڋ/إ;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    const-wide/16 v4, 0x1f40

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget-object v2, Lڃٷښـ۝ۼ/ؠ;->ا:Landroid/os/Handler;

    new-instance v3, Lڝږ؁ڋ/إ;

    invoke-direct {v3, p0, v1, v0}, Lڝږ؁ڋ/إ;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    const-wide/16 v0, 0x3a98

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static ض(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final ط(Lڨڡئٸت/ا;Ljava/lang/Object;Ljava/lang/Object;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    invoke-static {p0, p2}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    :try_start_0
    new-instance v0, Lھڳۄ٧ڕڊ/س;

    invoke-direct {v0, p4, p0}, Lھڳۄ٧ڕڊ/س;-><init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V

    const/4 v1, 0x2

    invoke-static {v1, p3}, Lڗًقڔ/ء;->ء(ILjava/lang/Object;)V

    invoke-interface {p3, p1, v0}, Lڲٱۘۑدٿٰ/خ;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p0, p2}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    sget-object p0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p0, :cond_0

    const-string p0, "frame"

    invoke-static {p4, p0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {p0, p2}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    throw p1
.end method

.method public static ظ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->إ()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    iget-boolean v0, p0, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-eqz v0, :cond_1

    new-instance p0, Ljava/util/concurrent/CancellationException;

    const-string v0, "Task is already canceled"

    invoke-direct {p0, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    invoke-virtual {p0}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public abstract ة(FFLٽچڃ/ز;)V
.end method

.method public abstract د(Lنٍصے/ؠ;Landroid/view/View;)Lنٍصے/ت;
.end method

.method public abstract ز(Lنٍصے/ؠ;I)Z
.end method
