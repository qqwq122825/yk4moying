.class public abstract Lھۥٓڍچ/ز;
.super Lھۥٓڍچ/ء;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ٺ;


# static fields
.field public static final إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile cleanedAndPointers:I

.field public final ؤ:J


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lھۥٓڍچ/ز;

    const-string v1, "cleanedAndPointers"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/ز;->إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(JLھۥٓڍچ/ز;I)V
    .locals 0

    invoke-direct {p0, p3}, Lھۥٓڍچ/ء;-><init>(Lھۥٓڍچ/ء;)V

    iput-wide p1, p0, Lھۥٓڍچ/ز;->ؤ:J

    shl-int/lit8 p1, p4, 0x10

    iput p1, p0, Lھۥٓڍچ/ز;->cleanedAndPointers:I

    return-void
.end method


# virtual methods
.method public final ء()Z
    .locals 3

    sget-object v0, Lھۥٓڍچ/ز;->إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0}, Lھۥٓڍچ/ز;->ؤ()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_1

    move v2, v1

    :cond_1
    return v2
.end method

.method public final أ()Z
    .locals 3

    sget-object v0, Lھۥٓڍچ/ز;->إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/high16 v1, -0x10000

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->addAndGet(Ljava/lang/Object;I)I

    move-result v0

    invoke-virtual {p0}, Lھۥٓڍچ/ز;->ؤ()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_1

    move v2, v1

    :cond_1
    return v2
.end method

.method public abstract ؤ()I
.end method

.method public abstract إ(ILڨڡئٸت/ا;)V
.end method

.method public final ئ()V
    .locals 2

    sget-object v0, Lھۥٓڍچ/ز;->إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I

    move-result v0

    sget v1, Lڽتٺۊڗ؜/ئ;->ؠ:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lھۥٓڍچ/ء;->آ()V

    :cond_0
    return-void
.end method

.method public final ا()Z
    .locals 5

    :cond_0
    sget-object v0, Lھۥٓڍچ/ز;->إ:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0}, Lھۥٓڍچ/ز;->ؤ()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Lھۥٓڍچ/ء;->ؠ()Lھۥٓڍچ/ء;

    move-result-object v2

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    move v2, v4

    :goto_0
    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move v2, v4

    goto :goto_2

    :cond_3
    :goto_1
    move v2, v3

    :goto_2
    if-nez v2, :cond_4

    move v3, v4

    goto :goto_3

    :cond_4
    const/high16 v2, 0x10000

    add-int/2addr v2, v1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_3
    return v3
.end method
