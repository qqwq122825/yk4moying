.class public final Lسۄھؤۏ۫/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؠ:Lسۄھؤۏ۫/ؠ;


# instance fields
.field public ؋:Lحۨٸڮؐێ/ئ;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lسۄھؤۏ۫/ؠ;

    invoke-direct {v0}, Lسۄھؤۏ۫/ؠ;-><init>()V

    sput-object v0, Lسۄھؤۏ۫/ؠ;->ؠ:Lسۄھؤۏ۫/ؠ;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lسۄھؤۏ۫/ؠ;->؋:Lحۨٸڮؐێ/ئ;

    return-void
.end method

.method public static ؋(Landroid/content/Context;)Lحۨٸڮؐێ/ئ;
    .locals 3

    sget-object v0, Lسۄھؤۏ۫/ؠ;->ؠ:Lسۄھؤۏ۫/ؠ;

    monitor-enter v0

    :try_start_0
    iget-object v1, v0, Lسۄھؤۏ۫/ؠ;->؋:Lحۨٸڮؐێ/ئ;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    :cond_0
    new-instance v1, Lحۨٸڮؐێ/ئ;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lحۨٸڮؐێ/ئ;-><init>(Landroid/content/Context;I)V

    iput-object v1, v0, Lسۄھؤۏ۫/ؠ;->؋:Lحۨٸڮؐێ/ئ;

    :cond_1
    iget-object p0, v0, Lسۄھؤۏ۫/ؠ;->؋:Lحۨٸڮؐێ/ئ;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
