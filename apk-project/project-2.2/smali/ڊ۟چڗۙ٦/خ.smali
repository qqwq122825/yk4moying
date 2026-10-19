.class public final Lڊ۟چڗۙ٦/خ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڕۇۅؑۨؼ۫ە/؋;


# static fields
.field public static final ء:Ljava/lang/Object;


# instance fields
.field public volatile ؋:Ljava/lang/Object;

.field public volatile ؠ:Lڕۇۅؑۨؼ۫ە/؋;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lڊ۟چڗۙ٦/خ;->ء:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lڕۇۅؑۨؼ۫ە/؋;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lڊ۟چڗۙ٦/خ;->ء:Ljava/lang/Object;

    iput-object v0, p0, Lڊ۟چڗۙ٦/خ;->؋:Ljava/lang/Object;

    iput-object p1, p0, Lڊ۟چڗۙ٦/خ;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lڊ۟چڗۙ٦/خ;->؋:Ljava/lang/Object;

    sget-object v1, Lڊ۟چڗۙ٦/خ;->ء:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lڊ۟چڗۙ٦/خ;->؋:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lڊ۟چڗۙ٦/خ;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    invoke-interface {v0}, Lڕۇۅؑۨؼ۫ە/؋;->get()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lڊ۟چڗۙ٦/خ;->؋:Ljava/lang/Object;

    const/4 v1, 0x0

    iput-object v1, p0, Lڊ۟چڗۙ٦/خ;->ؠ:Lڕۇۅؑۨؼ۫ە/؋;

    :cond_0
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :goto_0
    return-object v0
.end method
