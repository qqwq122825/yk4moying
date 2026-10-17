.class public abstract Landroidx/lifecycle/LifecycleCoroutineScope;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/س;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract synthetic getCoroutineContext()Lڨڡئٸت/ا;
.end method

.method public abstract getLifecycle$lifecycle_common()Landroidx/lifecycle/Lifecycle;
.end method

.method public final launchWhenCreated(Lڲٱۘۑدٿٰ/خ;)Lںڍڒڸ/ى;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            ")",
            "L\u06ba\u068d\u0692\u06b8/\u0649;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenCreated$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenCreated$1;-><init>(Landroidx/lifecycle/LifecycleCoroutineScope;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    move-result-object p1

    return-object p1
.end method

.method public final launchWhenResumed(Lڲٱۘۑدٿٰ/خ;)Lںڍڒڸ/ى;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            ")",
            "L\u06ba\u068d\u0692\u06b8/\u0649;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenResumed$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenResumed$1;-><init>(Landroidx/lifecycle/LifecycleCoroutineScope;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    move-result-object p1

    return-object p1
.end method

.method public final launchWhenStarted(Lڲٱۘۑدٿٰ/خ;)Lںڍڒڸ/ى;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062e;",
            ")",
            "L\u06ba\u068d\u0692\u06b8/\u0649;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenStarted$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Landroidx/lifecycle/LifecycleCoroutineScope$launchWhenStarted$1;-><init>(Landroidx/lifecycle/LifecycleCoroutineScope;Lڲٱۘۑدٿٰ/خ;Lڨڡئٸت/أ;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, Lںڍڒڸ/ش;->ل(Lںڍڒڸ/س;Lڨڡئٸت/ؤ;Lڲٱۘۑدٿٰ/خ;I)Lںڍڒڸ/ټ;

    move-result-object p1

    return-object p1
.end method
