.class public abstract Lںڍڒڸ/ر;
.super Lڨڡئٸت/؋;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/ؤ;


# static fields
.field public static final Key:Lںڍڒڸ/ذ;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lںڍڒڸ/ذ;

    invoke-direct {v0}, Lںڍڒڸ/ذ;-><init>()V

    sput-object v0, Lںڍڒڸ/ر;->Key:Lںڍڒڸ/ذ;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    sget-object v0, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-direct {p0, v0}, Lڨڡئٸت/؋;-><init>(Lڨڡئٸت/ئ;)V

    return-void
.end method


# virtual methods
.method public abstract dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
.end method

.method public dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lںڍڒڸ/ر;->dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V

    return-void
.end method

.method public get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0625;",
            ">(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;",
            ")TE;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v1, p1, Lڨڡئٸت/ؠ;

    if-eqz v1, :cond_2

    check-cast p1, Lڨڡئٸت/ؠ;

    invoke-interface {p0}, Lڨڡئٸت/إ;->getKey()Lڨڡئٸت/ئ;

    move-result-object v1

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    if-eq v1, p1, :cond_1

    iget-object v0, p1, Lڨڡئٸت/ؠ;->أ:Lڨڡئٸت/ئ;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    iget-object p1, p1, Lڨڡئٸت/ؠ;->آ:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {p1, p0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lڨڡئٸت/إ;

    instance-of v0, p1, Lڨڡئٸت/إ;

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_2
    sget-object v0, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    if-ne v0, p1, :cond_3

    move-object p1, p0

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    :goto_2
    return-object p1
.end method

.method public final interceptContinuation(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;"
        }
    .end annotation

    new-instance v0, Lھۥٓڍچ/إ;

    invoke-direct {v0, p0, p1}, Lھۥٓڍچ/إ;-><init>(Lںڍڒڸ/ر;Lڨڡئٸت/أ;)V

    return-object v0
.end method

.method public isDispatchNeeded(Lڨڡئٸت/ا;)Z
    .locals 0

    instance-of p0, p0, Lںڍڒڸ/ڀ;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    invoke-static {p1}, Lڗًقڔ/؋;->ث(I)V

    new-instance v0, Lھۥٓڍچ/ئ;

    invoke-direct {v0, p0, p1}, Lھۥٓڍچ/ئ;-><init>(Lںڍڒڸ/ر;I)V

    return-object v0
.end method

.method public minusKey(Lڨڡئٸت/ئ;)Lڨڡئٸت/ا;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0626;",
            ")",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0627;"
        }
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v1, p1, Lڨڡئٸت/ؠ;

    sget-object v2, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    if-eqz v1, :cond_2

    check-cast p1, Lڨڡئٸت/ؠ;

    invoke-interface {p0}, Lڨڡئٸت/إ;->getKey()Lڨڡئٸت/ئ;

    move-result-object v1

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    if-eq v1, p1, :cond_1

    iget-object v0, p1, Lڨڡئٸت/ؠ;->أ:Lڨڡئٸت/ئ;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    iget-object p1, p1, Lڨڡئٸت/ؠ;->آ:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {p1, p0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lڨڡئٸت/إ;

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_2
    sget-object v0, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    if-ne v0, p1, :cond_3

    goto :goto_2

    :cond_3
    move-object v2, p0

    :goto_2
    return-object v2
.end method

.method public final plus(Lںڍڒڸ/ر;)Lںڍڒڸ/ر;
    .locals 0

    return-object p1
.end method

.method public final releaseInterceptedContinuation(Lڨڡئٸت/أ;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06a8\u06a1\u0626\u0678\u062a/\u0623;",
            ")V"
        }
    .end annotation

    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<*>"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ب(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lھۥٓڍچ/إ;

    :cond_0
    sget-object v0, Lھۥٓڍچ/إ;->ة:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lڃٷښـ۝ۼ/ؠ;->ث:Lئٱنۃؖۊڄئ/آ;

    if-eq v1, v2, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Lںڍڒڸ/ئ;

    if-eqz v0, :cond_1

    check-cast p1, Lںڍڒڸ/ئ;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lںڍڒڸ/ئ;->ت()V

    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lںڍڒڸ/ش;->ط(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
