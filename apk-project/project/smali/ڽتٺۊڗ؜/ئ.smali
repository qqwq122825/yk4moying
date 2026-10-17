.class public abstract Lڽتٺۊڗ؜/ئ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Lڽتٺۊڗ؜/ج;

.field public static final ؠ:I

.field public static final ء:I

.field public static final آ:Lئٱنۃؖۊڄئ/آ;

.field public static final أ:Lئٱنۃؖۊڄئ/آ;

.field public static final ؤ:Lئٱنۃؖۊڄئ/آ;

.field public static final إ:Lئٱنۃؖۊڄئ/آ;

.field public static final ئ:Lئٱنۃؖۊڄئ/آ;

.field public static final ا:Lئٱنۃؖۊڄئ/آ;

.field public static final ب:Lئٱنۃؖۊڄئ/آ;

.field public static final ة:Lئٱنۃؖۊڄئ/آ;

.field public static final ت:Lئٱنۃؖۊڄئ/آ;

.field public static final ث:Lئٱنۃؖۊڄئ/آ;

.field public static final ج:Lئٱنۃؖۊڄئ/آ;

.field public static final ح:Lئٱنۃؖۊڄئ/آ;

.field public static final خ:Lئٱنۃؖۊڄئ/آ;

.field public static final د:Lئٱنۃؖۊڄئ/آ;

.field public static final ذ:Lئٱنۃؖۊڄئ/آ;

.field public static final ر:Lئٱنۃؖۊڄئ/آ;


# direct methods
.method public static constructor <clinit>()V
    .locals 7

    new-instance v6, Lڽتٺۊڗ؜/ج;

    const-wide/16 v1, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lڽتٺۊڗ؜/ج;-><init>(JLڽتٺۊڗ؜/ج;Lڽتٺۊڗ؜/ؤ;I)V

    sput-object v6, Lڽتٺۊڗ؜/ئ;->؋:Lڽتٺۊڗ؜/ج;

    const-string v0, "kotlinx.coroutines.bufferedChannel.segmentSize"

    const/16 v1, 0x20

    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-static {v0, v1, v2, v2, v3}, Lڗًقڔ/؋;->ڂ(Ljava/lang/String;IIII)I

    move-result v0

    sput v0, Lڽتٺۊڗ؜/ئ;->ؠ:I

    const-string v0, "kotlinx.coroutines.bufferedChannel.expandBufferCompletionWaitIterations"

    const/16 v1, 0x2710

    invoke-static {v0, v1, v2, v2, v3}, Lڗًقڔ/؋;->ڂ(Ljava/lang/String;IIII)I

    move-result v0

    sput v0, Lڽتٺۊڗ؜/ئ;->ء:I

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "BUFFERED"

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->آ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "SHOULD_BUFFER"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->أ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "S_RESUMING_BY_RCV"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ؤ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "RESUMING_BY_EB"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->إ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "POISONED"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ئ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "DONE_RCV"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ا:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "INTERRUPTED_SEND"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ب:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "INTERRUPTED_RCV"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ة:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "CHANNEL_CLOSED"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "SUSPEND"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ث:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "SUSPEND_NO_WAITER"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ج:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "FAILED"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ح:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "NO_RECEIVE_RESULT"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->خ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "CLOSE_HANDLER_CLOSED"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->د:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "CLOSE_HANDLER_INVOKED"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ذ:Lئٱنۃؖۊڄئ/آ;

    new-instance v0, Lئٱنۃؖۊڄئ/آ;

    const-string v1, "NO_CLOSE_CAUSE"

    invoke-direct {v0, v2, v1}, Lئٱنۃؖۊڄئ/آ;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lڽتٺۊڗ؜/ئ;->ر:Lئٱنۃؖۊڄئ/آ;

    return-void
.end method

.method public static final ؋(Lںڍڒڸ/إ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)Z
    .locals 7

    check-cast p0, Lںڍڒڸ/ئ;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_0
    sget-object v0, Lںڍڒڸ/ئ;->ب:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lںڍڒڸ/ٺ;

    sget-object v3, Lڗًقڔ/؋;->ـ:Lئٱنۃؖۊڄئ/آ;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_3

    move-object v2, v1

    check-cast v2, Lںڍڒڸ/ٺ;

    iget v6, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-static {v2, p1, v6, p2}, Lںڍڒڸ/ئ;->ط(Lںڍڒڸ/ٺ;Ljava/lang/Object;ILڲٱۘۑدٿٰ/ت;)Ljava/lang/Object;

    move-result-object v2

    :cond_1
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v0, v5

    goto :goto_0

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v1, :cond_1

    move v0, v4

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ر()Z

    move-result p1

    if-nez p1, :cond_4

    invoke-virtual {p0}, Lںڍڒڸ/ئ;->ت()V

    goto :goto_1

    :cond_3
    instance-of p1, v1, Lںڍڒڸ/ح;

    const/4 v3, 0x0

    :cond_4
    :goto_1
    if-eqz v3, :cond_5

    iget p1, p0, Lںڍڒڸ/ع;->ؤ:I

    invoke-virtual {p0, p1}, Lںڍڒڸ/ئ;->ث(I)V

    move v4, v5

    :cond_5
    return v4
.end method
