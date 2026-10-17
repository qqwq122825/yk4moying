.class public final Landroidx/work/impl/model/WorkSpec$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/impl/model/WorkSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/أ;)V
    .locals 0

    invoke-direct {p0}, Landroidx/work/impl/model/WorkSpec$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final calculateNextRunTime(ZILandroidx/work/BackoffPolicy;JJIZJJJJ)J
    .locals 8

    move v0, p2

    move-object v1, p3

    move-wide v2, p4

    const-string v4, "backoffPolicy"

    invoke-static {p3, v4}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v6, p16, v4

    if-eqz v6, :cond_2

    if-eqz p9, :cond_2

    if-nez p8, :cond_1

    :cond_0
    move-wide/from16 v0, p16

    goto :goto_0

    :cond_1
    const-wide/32 v0, 0xdbba0

    add-long/2addr v0, p6

    cmp-long v2, p16, v0

    if-gez v2, :cond_0

    :goto_0
    return-wide v0

    :cond_2
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz p1, :cond_6

    sget-object v4, Landroidx/work/BackoffPolicy;->LINEAR:Landroidx/work/BackoffPolicy;

    if-ne v1, v4, :cond_3

    move v6, v7

    :cond_3
    if-eqz v6, :cond_4

    int-to-long v0, v0

    mul-long/2addr v0, v2

    goto :goto_1

    :cond_4
    long-to-float v1, v2

    sub-int/2addr v0, v7

    invoke-static {v1, v0}, Ljava/lang/Math;->scalb(FI)F

    move-result v0

    float-to-long v0, v0

    :goto_1
    const-wide/32 v2, 0x112a880

    cmp-long v4, v0, v2

    if-lez v4, :cond_5

    move-wide v0, v2

    :cond_5
    add-long v4, p6, v0

    goto :goto_3

    :cond_6
    if-eqz p9, :cond_a

    if-nez p8, :cond_7

    add-long v0, p6, p10

    goto :goto_2

    :cond_7
    add-long v0, p6, p14

    :goto_2
    cmp-long v2, p12, p14

    if-eqz v2, :cond_8

    move v6, v7

    :cond_8
    if-eqz v6, :cond_9

    if-nez p8, :cond_9

    sub-long v2, p14, p12

    add-long/2addr v2, v0

    move-wide v4, v2

    goto :goto_3

    :cond_9
    move-wide v4, v0

    goto :goto_3

    :cond_a
    const-wide/16 v0, -0x1

    cmp-long v0, p6, v0

    if-nez v0, :cond_b

    goto :goto_3

    :cond_b
    add-long v4, p6, p10

    :goto_3
    return-wide v4
.end method
