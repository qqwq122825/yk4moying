.class public final synthetic Lژة۪ڦضۆۿۡ/ا;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/؋;


# instance fields
.field public final synthetic آ:Landroid/content/Context;

.field public final synthetic أ:Landroid/content/Intent;

.field public final synthetic ؤ:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/Intent;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ا;->آ:Landroid/content/Context;

    iput-object p2, p0, Lژة۪ڦضۆۿۡ/ا;->أ:Landroid/content/Intent;

    iput-boolean p3, p0, Lژة۪ڦضۆۿۡ/ا;->ؤ:Z

    return-void
.end method


# virtual methods
.method public final آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 3

    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x192

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ا;->أ:Landroid/content/Intent;

    iget-boolean v0, p0, Lژة۪ڦضۆۿۡ/ا;->ؤ:Z

    iget-object v1, p0, Lژة۪ڦضۆۿۡ/ا;->آ:Landroid/content/Context;

    invoke-static {v1, p1, v0}, Lژة۪ڦضۆۿۡ/ب;->؋(Landroid/content/Context;Landroid/content/Intent;Z)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    new-instance v0, Landroidx/arch/core/executor/؋;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroidx/arch/core/executor/؋;-><init>(I)V

    new-instance v1, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v2, 0x1b

    invoke-direct {v1, v2}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lؾپۑ۟ڂڷ/ح;->ء(Ljava/util/concurrent/Executor;Lؾپۑ۟ڂڷ/؋;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    :goto_0
    return-object p1
.end method
