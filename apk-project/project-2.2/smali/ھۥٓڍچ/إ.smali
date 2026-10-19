.class public final Lھۥٓڍچ/إ;
.super Lںڍڒڸ/ع;
.source "SourceFile"

# interfaces
.implements Lګؓ۝ؒڄس/آ;
.implements Lڨڡئٸت/أ;


# static fields
.field public static final ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _reusableCancellableContinuation:Ljava/lang/Object;

.field public final إ:Lںڍڒڸ/ر;

.field public final ئ:Lڨڡئٸت/أ;

.field public ا:Ljava/lang/Object;

.field public final ب:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-class v0, Ljava/lang/Object;

    const-string v1, "_reusableCancellableContinuation"

    const-class v2, Lھۥٓڍچ/إ;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/إ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lںڍڒڸ/ر;Lڨڡئٸت/أ;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lںڍڒڸ/ع;-><init>(I)V

    iput-object p1, p0, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    iput-object p2, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    sget-object p1, Lڃٷښـ۝ۼ/ؠ;->ت:Lئٱنۃؖۊڄئ/آ;

    iput-object p1, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    invoke-virtual {p0}, Lھۥٓڍچ/إ;->getContext()Lڨڡئٸت/ا;

    move-result-object p1

    invoke-static {p1}, Lںڍڒڸ/ش;->ٽ(Lڨڡئٸت/ا;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lھۥٓڍچ/إ;->ب:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getCallerFrame()Lګؓ۝ؒڄس/آ;
    .locals 2

    iget-object v0, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    instance-of v1, v0, Lګؓ۝ؒڄس/آ;

    if-eqz v1, :cond_0

    check-cast v0, Lګؓ۝ؒڄس/آ;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getContext()Lڨڡئٸت/ا;
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    invoke-interface {v0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v0

    return-object v0
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    invoke-interface {v0}, Lڨڡئٸت/أ;->getContext()Lڨڡئٸت/ا;

    move-result-object v1

    invoke-static {p1}, Lڡُؑڨ/ؤ;->؋(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move-object v4, p1

    goto :goto_0

    :cond_0
    new-instance v4, Lںڍڒڸ/خ;

    invoke-direct {v4, v3, v2}, Lںڍڒڸ/خ;-><init>(ZLjava/lang/Throwable;)V

    :goto_0
    iget-object v2, p0, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    invoke-virtual {v2, v1}, Lںڍڒڸ/ر;->isDispatchNeeded(Lڨڡئٸت/ا;)Z

    move-result v5

    if-eqz v5, :cond_1

    iput-object v4, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v3, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {v2, v1, p0}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    goto :goto_2

    :cond_1
    invoke-static {}, Lںڍڒڸ/ٿ;->؋()Lںڍڒڸ/ف;

    move-result-object v1

    invoke-virtual {v1}, Lںڍڒڸ/ف;->ق()Z

    move-result v2

    if-eqz v2, :cond_2

    iput-object v4, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    iput v3, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {v1, p0}, Lںڍڒڸ/ف;->ؿ(Lںڍڒڸ/ع;)V

    goto :goto_2

    :cond_2
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lںڍڒڸ/ف;->ف(Z)V

    :try_start_0
    invoke-virtual {p0}, Lھۥٓڍچ/إ;->getContext()Lڨڡئٸت/ا;

    move-result-object v3

    iget-object v4, p0, Lھۥٓڍچ/إ;->ب:Ljava/lang/Object;

    invoke-static {v3, v4}, Lںڍڒڸ/ش;->ڂ(Lڨڡئٸت/ا;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {v0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v3, v4}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    :cond_3
    invoke-virtual {v1}, Lںڍڒڸ/ف;->ل()Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-static {v3, v4}, Lںڍڒڸ/ش;->ٶ(Lڨڡئٸت/ا;Ljava/lang/Object;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {p0, p1, v0}, Lںڍڒڸ/ع;->ؤ(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_1
    invoke-virtual {v1, v2}, Lںڍڒڸ/ف;->ؾ(Z)V

    :goto_2
    return-void

    :catchall_2
    move-exception p1

    invoke-virtual {v1, v2}, Lںڍڒڸ/ف;->ؾ(Z)V

    throw p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DispatchedContinuation["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lھۥٓڍچ/إ;->إ:Lںڍڒڸ/ر;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lھۥٓڍچ/إ;->ئ:Lڨڡئٸت/أ;

    invoke-static {v1}, Lںڍڒڸ/ش;->ڀ(Lڨڡئٸت/أ;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final ؠ(Ljava/lang/Object;Ljava/util/concurrent/CancellationException;)V
    .locals 1

    instance-of v0, p1, Lںڍڒڸ/د;

    if-eqz v0, :cond_0

    check-cast p1, Lںڍڒڸ/د;

    iget-object p1, p1, Lںڍڒڸ/د;->ؠ:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {p1, p2}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public final ء()Lڨڡئٸت/أ;
    .locals 0

    return-object p0
.end method

.method public final إ()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    sget-object v1, Lڃٷښـ۝ۼ/ؠ;->ت:Lئٱنۃؖۊڄئ/آ;

    iput-object v1, p0, Lھۥٓڍچ/إ;->ا:Ljava/lang/Object;

    return-object v0
.end method
