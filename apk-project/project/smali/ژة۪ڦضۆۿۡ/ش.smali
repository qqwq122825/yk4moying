.class public final Lژة۪ڦضۆۿۡ/ش;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/util/concurrent/Executor;

.field public final ؠ:Landroidx/collection/ArrayMap;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Lژة۪ڦضۆۿۡ/ش;->ؠ:Landroidx/collection/ArrayMap;

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ش;->؋:Ljava/util/concurrent/Executor;

    return-void
.end method
