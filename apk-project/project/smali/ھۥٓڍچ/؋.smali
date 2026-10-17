.class public abstract Lھۥٓڍچ/؋;
.super Lھۥٓڍچ/خ;
.source "SourceFile"


# static fields
.field public static final ؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile _consensus:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-class v0, Ljava/lang/Object;

    const-string v1, "_consensus"

    const-class v2, Lھۥٓڍچ/؋;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/؋;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lھۥٓڍچ/خ;-><init>()V

    sget-object v0, Lںڍڒڸ/ش;->ح:Lئٱنۃؖۊڄئ/آ;

    iput-object v0, p0, Lھۥٓڍچ/؋;->_consensus:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, Lھۥٓڍچ/؋;->؋:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lںڍڒڸ/ش;->ح:Lئٱنۃؖۊڄئ/آ;

    if-ne v1, v2, :cond_3

    invoke-virtual {p0, p1}, Lھۥٓڍچ/؋;->ء(Ljava/lang/Object;)Lئٱنۃؖۊڄئ/آ;

    move-result-object v3

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0, p0, v2, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    move-object v1, v3

    goto :goto_1

    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-virtual {p0, p1, v1}, Lھۥٓڍچ/؋;->ؠ(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public abstract ؠ(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public abstract ء(Ljava/lang/Object;)Lئٱنۃؖۊڄئ/آ;
.end method
