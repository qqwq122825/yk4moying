.class public final Lژة۪ڦضۆۿۡ/ـ;
.super Landroid/os/Binder;
.source "SourceFile"


# static fields
.field public static final synthetic ء:I


# instance fields
.field public final ؠ:Lئٱنۃؖۊڄئ/آ;


# direct methods
.method public constructor <init>(Lئٱنۃؖۊڄئ/آ;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ـ;->ؠ:Lئٱنۃؖۊڄئ/آ;

    return-void
.end method


# virtual methods
.method public final ؋(Lژة۪ڦضۆۿۡ/ف;)V
    .locals 5

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v1

    if-ne v0, v1, :cond_1

    const-string v0, "FirebaseMessaging"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "service received new intent via bind strategy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p1, Lژة۪ڦضۆۿۡ/ف;->؋:Landroid/content/Intent;

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ـ;->ؠ:Lئٱنۃؖۊڄئ/آ;

    iget-object v1, v1, Lئٱنۃؖۊڄئ/آ;->أ:Ljava/lang/Object;

    check-cast v1, Lcom/google/firebase/messaging/EnhancedIntentService;

    sget v2, Lcom/google/firebase/messaging/EnhancedIntentService;->ؤ:I

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lؾپۑ۟ڂڷ/ا;

    invoke-direct {v2}, Lؾپۑ۟ڂڷ/ا;-><init>()V

    new-instance v3, Landroidx/room/أ;

    const/4 v4, 0x4

    invoke-direct {v3, v1, v0, v2, v4}, Landroidx/room/أ;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object v0, v1, Lcom/google/firebase/messaging/EnhancedIntentService;->؋:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    new-instance v0, Landroidx/arch/core/executor/؋;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Landroidx/arch/core/executor/؋;-><init>(I)V

    new-instance v3, Landroidx/constraintlayout/core/state/؋;

    invoke-direct {v3, v1, p1}, Landroidx/constraintlayout/core/state/؋;-><init>(ILjava/lang/Object;)V

    iget-object p1, v2, Lؾپۑ۟ڂڷ/ا;->؋:Lؾپۑ۟ڂڷ/ح;

    invoke-virtual {p1, v0, v3}, Lؾپۑ۟ڂڷ/ح;->؋(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/آ;)V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/SecurityException;

    const-string v0, "Binding only allowed within app"

    invoke-direct {p1, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
