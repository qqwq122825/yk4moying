.class public final Lںڍڒڸ/ظ;
.super Lھۥٓڍچ/ر;
.source "SourceFile"


# static fields
.field public static final ئ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile _decision:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lںڍڒڸ/ظ;

    const-string v1, "_decision"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lںڍڒڸ/ظ;->ئ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method


# virtual methods
.method public final ة(Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0, p1}, Lںڍڒڸ/ظ;->ت(Ljava/lang/Object;)V

    return-void
.end method

.method public final ت(Ljava/lang/Object;)V
    .locals 4

    :cond_0
    sget-object v0, Lںڍڒڸ/ظ;->ئ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    if-ne v1, v3, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already resumed"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/4 v1, 0x2

    invoke-virtual {v0, p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    move v2, v3

    :goto_0
    if-eqz v2, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    invoke-static {v0}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v0

    invoke-static {p1}, Lڗًقڔ/؋;->ٵ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lڃٷښـ۝ۼ/ؠ;->ر(Lڨڡئٸت/أ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V

    return-void
.end method
