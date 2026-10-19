.class public abstract Lڴۄۓڿڟۅڥؾ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final آ:Lڴۄۓڿڟۅڥؾ/آ;

.field public static final أ:Lڴۄۓڿڟۅڥؾ/؋;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lڴۄۓڿڟۅڥؾ/آ;

    invoke-direct {v0}, Lڴۄۓڿڟۅڥؾ/آ;-><init>()V

    sput-object v0, Lڴۄۓڿڟۅڥؾ/أ;->آ:Lڴۄۓڿڟۅڥؾ/آ;

    sget-object v0, Lڱإڥۣۣج/؋;->؋:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    new-instance v0, Lڶ؁۝ۺ/؋;

    invoke-direct {v0}, Lڶ؁۝ۺ/؋;-><init>()V

    goto :goto_2

    :cond_2
    new-instance v0, Lڴۄۓڿڟۅڥؾ/ء;

    invoke-direct {v0}, Lڴۄۓڿڟۅڥؾ/ء;-><init>()V

    :goto_2
    sput-object v0, Lڴۄۓڿڟۅڥؾ/أ;->أ:Lڴۄۓڿڟۅڥؾ/؋;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
