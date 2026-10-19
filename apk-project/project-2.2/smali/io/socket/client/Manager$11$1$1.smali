.class Lio/socket/client/Manager$11$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/socket/client/Manager$OpenCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager$11$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/socket/client/Manager$11$1;


# direct methods
.method public constructor <init>(Lio/socket/client/Manager$11$1;)V
    .locals 0

    iput-object p1, p0, Lio/socket/client/Manager$11$1$1;->this$2:Lio/socket/client/Manager$11$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Exception;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "reconnect attempt error"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lio/socket/client/Manager$11$1$1;->this$2:Lio/socket/client/Manager$11$1;

    iget-object v0, v0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v0, v0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/socket/client/Manager;->access$2102(Lio/socket/client/Manager;Z)Z

    iget-object v0, p0, Lio/socket/client/Manager$11$1$1;->this$2:Lio/socket/client/Manager$11$1;

    iget-object v0, v0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v0, v0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {v0}, Lio/socket/client/Manager;->access$2200(Lio/socket/client/Manager;)V

    iget-object v0, p0, Lio/socket/client/Manager$11$1$1;->this$2:Lio/socket/client/Manager$11$1;

    iget-object v0, v0, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object v0, v0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    const-string v1, "reconnect_error"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lio/socket/client/Manager;->access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lio/socket/client/Manager;->access$000()Ljava/util/logging/Logger;

    move-result-object p1

    const-string v0, "reconnect success"

    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object p1, p0, Lio/socket/client/Manager$11$1$1;->this$2:Lio/socket/client/Manager$11$1;

    iget-object p1, p1, Lio/socket/client/Manager$11$1;->this$1:Lio/socket/client/Manager$11;

    iget-object p1, p1, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-static {p1}, Lio/socket/client/Manager;->access$2300(Lio/socket/client/Manager;)V

    :goto_0
    return-void
.end method
