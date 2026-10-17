.class Lio/socket/engineio/client/transports/WebSocket$1;
.super Lokhttp3/WebSocketListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/client/transports/WebSocket;->doOpen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/engineio/client/transports/WebSocket;

.field final synthetic val$self:Lio/socket/engineio/client/transports/WebSocket;


# direct methods
.method public constructor <init>(Lio/socket/engineio/client/transports/WebSocket;Lio/socket/engineio/client/transports/WebSocket;)V
    .locals 0

    iput-object p1, p0, Lio/socket/engineio/client/transports/WebSocket$1;->this$0:Lio/socket/engineio/client/transports/WebSocket;

    iput-object p2, p0, Lio/socket/engineio/client/transports/WebSocket$1;->val$self:Lio/socket/engineio/client/transports/WebSocket;

    invoke-direct {p0}, Lokhttp3/WebSocketListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Lokhttp3/WebSocket;ILjava/lang/String;)V
    .locals 0

    new-instance p1, Lio/socket/engineio/client/transports/WebSocket$1$4;

    invoke-direct {p1, p0}, Lio/socket/engineio/client/transports/WebSocket$1$4;-><init>(Lio/socket/engineio/client/transports/WebSocket$1;)V

    invoke-static {p1}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onFailure(Lokhttp3/WebSocket;Ljava/lang/Throwable;Lokhttp3/Response;)V
    .locals 0

    instance-of p1, p2, Ljava/lang/Exception;

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lio/socket/engineio/client/transports/WebSocket$1$5;

    invoke-direct {p1, p0, p2}, Lio/socket/engineio/client/transports/WebSocket$1$5;-><init>(Lio/socket/engineio/client/transports/WebSocket$1;Ljava/lang/Throwable;)V

    invoke-static {p1}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMessage(Lokhttp3/WebSocket;Ljava/lang/String;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lio/socket/engineio/client/transports/WebSocket$1$2;

    invoke-direct {p1, p0, p2}, Lio/socket/engineio/client/transports/WebSocket$1$2;-><init>(Lio/socket/engineio/client/transports/WebSocket$1;Ljava/lang/String;)V

    invoke-static {p1}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMessage(Lokhttp3/WebSocket;Lۀۗ۱/ث;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lio/socket/engineio/client/transports/WebSocket$1$3;

    invoke-direct {p1, p0, p2}, Lio/socket/engineio/client/transports/WebSocket$1$3;-><init>(Lio/socket/engineio/client/transports/WebSocket$1;Lۀۗ۱/ث;)V

    invoke-static {p1}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onOpen(Lokhttp3/WebSocket;Lokhttp3/Response;)V
    .locals 0

    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object p1

    new-instance p2, Lio/socket/engineio/client/transports/WebSocket$1$1;

    invoke-direct {p2, p0, p1}, Lio/socket/engineio/client/transports/WebSocket$1$1;-><init>(Lio/socket/engineio/client/transports/WebSocket$1;Ljava/util/Map;)V

    invoke-static {p2}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method
