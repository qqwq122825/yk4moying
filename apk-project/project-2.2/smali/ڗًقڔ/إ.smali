.class public final Lڗًقڔ/إ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final آ:J

.field public static final أ:J


# instance fields
.field public final ؋:Lږٍڔڴٝ/ب;

.field public ؠ:J

.field public ء:I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lڗًقڔ/إ;->آ:J

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lڗًقڔ/إ;->أ:J

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    if-nez v0, :cond_0

    sget-object v0, Lږٍڔڴٝ/ب;->ء:Ljava/util/regex/Pattern;

    new-instance v0, Lٽچڃ/أ;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lٽچڃ/أ;-><init>(I)V

    sput-object v0, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    :cond_0
    sget-object v0, Lٽچڃ/أ;->أ:Lٽچڃ/أ;

    sget-object v1, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    if-nez v1, :cond_1

    new-instance v1, Lږٍڔڴٝ/ب;

    invoke-direct {v1, v0}, Lږٍڔڴٝ/ب;-><init>(Lٽچڃ/أ;)V

    sput-object v1, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    :cond_1
    sget-object v0, Lږٍڔڴٝ/ب;->آ:Lږٍڔڴٝ/ب;

    iput-object v0, p0, Lڗًقڔ/إ;->؋:Lږٍڔڴٝ/ب;

    return-void
.end method


# virtual methods
.method public final declared-synchronized ؋(I)V
    .locals 6

    monitor-enter p0

    const/16 v0, 0xc8

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0x12c

    if-lt p1, v0, :cond_2

    :cond_0
    const/16 v0, 0x191

    if-eq p1, v0, :cond_2

    const/16 v0, 0x194

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    if-eqz v0, :cond_3

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    iput v1, p0, Lڗًقڔ/إ;->ء:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0

    throw p1

    :cond_3
    iget v0, p0, Lڗًقڔ/إ;->ء:I

    add-int/2addr v0, v2

    iput v0, p0, Lڗًقڔ/إ;->ء:I

    monitor-enter p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/16 v0, 0x1ad

    if-eq p1, v0, :cond_4

    const/16 v0, 0x1f4

    if-lt p1, v0, :cond_5

    const/16 v0, 0x258

    if-ge p1, v0, :cond_5

    :cond_4
    move v1, v2

    :cond_5
    if-nez v1, :cond_6

    :try_start_4
    sget-wide v0, Lڗًقڔ/إ;->آ:J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_2
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_3

    :cond_6
    :try_start_6
    iget p1, p0, Lڗًقڔ/إ;->ء:I

    int-to-double v0, p1

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    iget-object p1, p0, Lڗًقڔ/إ;->؋:Lږٍڔڴٝ/ب;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    double-to-long v2, v2

    long-to-double v2, v2

    add-double/2addr v0, v2

    sget-wide v2, Lڗًقڔ/إ;->أ:J

    long-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    double-to-long v0, v0

    goto :goto_2

    :goto_3
    :try_start_7
    iget-object p1, p0, Lڗًقڔ/إ;->؋:Lږٍڔڴٝ/ب;

    iget-object p1, p1, Lږٍڔڴٝ/ب;->؋:Lٽچڃ/أ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lڗًقڔ/إ;->ؠ:J
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    :try_start_8
    monitor-exit p0

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method
