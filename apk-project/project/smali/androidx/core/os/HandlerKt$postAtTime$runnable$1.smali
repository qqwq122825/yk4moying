.class public final Landroidx/core/os/HandlerKt$postAtTime$runnable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/os/HandlerKt;->postAtTime(Landroid/os/Handler;JLjava/lang/Object;Lڲٱۘۑدٿٰ/؋;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $action:Lڲٱۘۑدٿٰ/؋;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lڲٱۘۑدٿٰ/؋;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/core/os/HandlerKt$postAtTime$runnable$1;->$action:Lڲٱۘۑدٿٰ/؋;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroidx/core/os/HandlerKt$postAtTime$runnable$1;->$action:Lڲٱۘۑدٿٰ/؋;

    invoke-interface {v0}, Lڲٱۘۑدٿٰ/؋;->invoke()Ljava/lang/Object;

    return-void
.end method
