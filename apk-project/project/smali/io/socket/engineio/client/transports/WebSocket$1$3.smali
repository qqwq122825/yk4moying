.class Lio/socket/engineio/client/transports/WebSocket$1$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/WebSocket$1;->onMessage(Lokhttp3/WebSocket;Lۀۗ۱/ث;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/socket/engineio/client/transports/WebSocket$1;

.field final synthetic val$bytes:Lۀۗ۱/ث;


# direct methods
.method public constructor <init>(Lio/socket/engineio/client/transports/WebSocket$1;Lۀۗ۱/ث;)V
    .locals 0

    iput-object p1, p0, Lio/socket/engineio/client/transports/WebSocket$1$3;->this$1:Lio/socket/engineio/client/transports/WebSocket$1;

    iput-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$1$3;->val$bytes:Lۀۗ۱/ث;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lio/socket/engineio/client/transports/WebSocket$1$3;->this$1:Lio/socket/engineio/client/transports/WebSocket$1;

    iget-object v0, v0, Lio/socket/engineio/client/transports/WebSocket$1;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    iget-object v1, p0, Lio/socket/engineio/client/transports/WebSocket$1$3;->val$bytes:Lۀۗ۱/ث;

    invoke-virtual {v1}, Lۀۗ۱/ث;->ة()[B

    move-result-object v1

    invoke-static {v0, v1}, Lio/socket/engineio/client/transports/WebSocket;->access$200(Lio/socket/engineio/client/transports/WebSocket;[B)V

    return-void
.end method
