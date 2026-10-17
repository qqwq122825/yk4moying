.class Lio/socket/client/Manager$1$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$1$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/socket/client/Manager$1$4;


# direct methods
.method public constructor <init>(Lio/socket/client/Manager$1$4;)V
    .locals 0

    iput-object p1, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    iget-object v1, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    iget-wide v1, v1, Lio/socket/client/Manager$1$4;->val$timeout:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "connect attempt timed out after %d"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    iget-object v0, v0, Lio/socket/client/Manager$1$4;->val$openSub:Lio/socket/client/On$Handle;

    invoke-interface {v0}, Lio/socket/client/On$Handle;->destroy()V

    iget-object v0, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    iget-object v0, v0, Lio/socket/client/Manager$1$4;->val$socket:Lio/socket/engineio/client/Socket;

    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->close()Lio/socket/engineio/client/Socket;

    iget-object v0, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    iget-object v0, v0, Lio/socket/client/Manager$1$4;->val$socket:Lio/socket/engineio/client/Socket;

    new-instance v1, Lio/socket/client/SocketIOException;

    const-string v2, "timeout"

    invoke-direct {v1, v2}, Lio/socket/client/SocketIOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "error"

    invoke-virtual {v0, v2, v1}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    iget-object v0, p0, Lio/socket/client/Manager$1$4$1;->this$2:Lio/socket/client/Manager$1$4;

    iget-object v1, v0, Lio/socket/client/Manager$1$4;->val$self:Lio/socket/client/Manager;

    iget-wide v2, v0, Lio/socket/client/Manager$1$4;->val$timeout:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "connect_timeout"

    invoke-static {v1, v2, v0}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
