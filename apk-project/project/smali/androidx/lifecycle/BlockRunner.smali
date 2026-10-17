.class public final Landroidx/lifecycle/BlockRunner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final block:Lڲٱۘۑدٿٰ/خ;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;"
        }
    .end annotation
.end field

.field private cancellationJob:Lںڍڒڸ/ى;

.field private final liveData:Landroidx/lifecycle/CoroutineLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/CoroutineLiveData<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final onDone:Lڲٱۘۑدٿٰ/؋;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;"
        }
    .end annotation
.end field

.field private runningJob:Lںڍڒڸ/ى;

.field private final scope:Lںڍڒڸ/س;

.field private final timeoutInMs:J


# direct methods
.method public constructor <init>(Landroidx/lifecycle/CoroutineLiveData;Lڲٱۘۑدٿٰ/خ;JLںڍڒڸ/س;Lڲٱۘۑدٿٰ/؋;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/CoroutineLiveData<",
            "TT;>;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            "J",
            "L\u06ba\u068d\u0692\u06b8/\u0633;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;",
            ")V"
        }
    .end annotation

    const-string v0, "liveData"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scope"

    invoke-static {p5, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onDone"

    invoke-static {p6, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/BlockRunner;->liveData:Landroidx/lifecycle/CoroutineLiveData;

    iput-object p2, p0, Landroidx/lifecycle/BlockRunner;->block:Lڲٱۘۑدٿٰ/خ;

    iput-wide p3, p0, Landroidx/lifecycle/BlockRunner;->timeoutInMs:J

    iput-object p5, p0, Landroidx/lifecycle/BlockRunner;->scope:Lںڍڒڸ/س;

    iput-object p6, p0, Landroidx/lifecycle/BlockRunner;->onDone:Lڲٱۘۑدٿٰ/؋;

    return-void
.end method

.method public static final synthetic access$getBlock$p(Landroidx/lifecycle/BlockRunner;)Lڲٱۘۑدٿٰ/خ;
    .locals 0

    iget-object p0, p0, Landroidx/lifecycle/BlockRunner;->block:Lڲٱۘۑدٿٰ/خ;

    return-object p0
.end method

.method public static final synthetic access$getLiveData$p(Landroidx/lifecycle/BlockRunner;)Landroidx/lifecycle/CoroutineLiveData;
    .locals 0

    iget-object p0, p0, Landroidx/lifecycle/BlockRunner;->liveData:Landroidx/lifecycle/CoroutineLiveData;

    return-object p0
.end method

.method public static final synthetic access$getOnDone$p(Landroidx/lifecycle/BlockRunner;)Lڲٱۘۑدٿٰ/؋;
    .locals 0

    iget-object p0, p0, Landroidx/lifecycle/BlockRunner;->onDone:Lڲٱۘۑدٿٰ/؋;

    return-object p0
.end method

.method public static final synthetic access$getRunningJob$p(Landroidx/lifecycle/BlockRunner;)Lںڍڒڸ/ى;
    .locals 0

    iget-object p0, p0, Landroidx/lifecycle/BlockRunner;->runningJob:Lںڍڒڸ/ى;

    return-object p0
.end method

.method public static final synthetic access$getTimeoutInMs$p(Landroidx/lifecycle/BlockRunner;)J
    .locals 2

    iget-wide v0, p0, Landroidx/lifecycle/BlockRunner;->timeoutInMs:J

    return-wide v0
.end method

.method public static final synthetic access$setRunningJob$p(Landroidx/lifecycle/BlockRunner;Lںڍڒڸ/ى;)V
    .locals 0

    iput-object p1, p0, Landroidx/lifecycle/BlockRunner;->runningJob:Lںڍڒڸ/ى;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    iget-object v0, p0, Landroidx/lifecycle/BlockRunner;->cancellationJob:Lںڍڒڸ/ى;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/lifecycle/BlockRunner;->scope:Lںڍڒڸ/س;

    sget-object v1, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    sget-object v1, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    check-cast v1, Lںڏۑڎڔٙ۰/آ;

    iget-object v1, v1, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;

    new-instance v2, Landroidx/lifecycle/BlockRunner$cancel$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Landroidx/lifecycle/BlockRunner$cancel$1;-><init>(Landroidx/lifecycle/BlockRunner;Lڨڡئٸت/أ;)V

    const/4 v3, 0x2

    invoke-static {v0, v1, v2, v3}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    move-result-object v0

    iput-object v0, p0, Landroidx/lifecycle/BlockRunner;->cancellationJob:Lںڍڒڸ/ى;

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cancel call cannot happen without a maybeRun"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final maybeRun()V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    iget-object v0, p0, Landroidx/lifecycle/BlockRunner;->cancellationJob:Lںڍڒڸ/ى;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lںڍڒڸ/ى;->ء(Ljava/util/concurrent/CancellationException;)V

    :cond_0
    iput-object v1, p0, Landroidx/lifecycle/BlockRunner;->cancellationJob:Lںڍڒڸ/ى;

    iget-object v0, p0, Landroidx/lifecycle/BlockRunner;->runningJob:Lںڍڒڸ/ى;

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Landroidx/lifecycle/BlockRunner;->scope:Lںڍڒڸ/س;

    new-instance v2, Landroidx/lifecycle/BlockRunner$maybeRun$1;

    invoke-direct {v2, p0, v1}, Landroidx/lifecycle/BlockRunner$maybeRun$1;-><init>(Landroidx/lifecycle/BlockRunner;Lڨڡئٸت/أ;)V

    const/4 v3, 0x3

    invoke-static {v0, v1, v2, v3}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    move-result-object v0

    iput-object v0, p0, Landroidx/lifecycle/BlockRunner;->runningJob:Lںڍڒڸ/ى;

    return-void
.end method
