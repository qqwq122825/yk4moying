.class public Lio/socket/client/Manager;
.super Lio/socket/emitter/Emitter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/socket/client/Manager$Options;,
        Lio/socket/client/Manager$Engine;,
        Lio/socket/client/Manager$OpenCallback;,
        Lio/socket/client/Manager$ReadyState;
    }
.end annotation


# static fields
.field public static final EVENT_CLOSE:Ljava/lang/String; = "close"

.field public static final EVENT_CONNECT_ERROR:Ljava/lang/String; = "connect_error"

.field public static final EVENT_CONNECT_TIMEOUT:Ljava/lang/String; = "connect_timeout"

.field public static final EVENT_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_OPEN:Ljava/lang/String; = "open"

.field public static final EVENT_PACKET:Ljava/lang/String; = "packet"

.field public static final EVENT_PING:Ljava/lang/String; = "ping"

.field public static final EVENT_PONG:Ljava/lang/String; = "pong"

.field public static final EVENT_RECONNECT:Ljava/lang/String; = "reconnect"

.field public static final EVENT_RECONNECTING:Ljava/lang/String; = "reconnecting"

.field public static final EVENT_RECONNECT_ATTEMPT:Ljava/lang/String; = "reconnect_attempt"

.field public static final EVENT_RECONNECT_ERROR:Ljava/lang/String; = "reconnect_error"

.field public static final EVENT_RECONNECT_FAILED:Ljava/lang/String; = "reconnect_failed"

.field public static final EVENT_TRANSPORT:Ljava/lang/String; = "transport"

.field static defaultCallFactory:Lokhttp3/Call$Factory;

.field static defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private _randomizationFactor:D

.field private _reconnection:Z

.field private _reconnectionAttempts:I

.field private _reconnectionDelay:J

.field private _reconnectionDelayMax:J

.field private _timeout:J

.field private backoff:Lio/socket/backo/Backoff;

.field private connecting:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private decoder:Lio/socket/parser/Parser$Decoder;

.field private encoder:Lio/socket/parser/Parser$Encoder;

.field private encoding:Z

.field engine:Lio/socket/engineio/client/Socket;

.field private lastPing:Ljava/util/Date;

.field nsps:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lio/socket/client/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private opts:Lio/socket/client/Manager$Options;

.field private packetBuffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/socket/parser/Packet;",
            ">;"
        }
    .end annotation
.end field

.field readyState:Lio/socket/client/Manager$ReadyState;

.field private reconnecting:Z

.field private skipReconnect:Z

.field private subs:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/socket/client/On$Handle;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Ljava/net/URI;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/socket/client/Manager;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Lio/socket/client/Manager$Options;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/socket/client/Manager;-><init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lio/socket/client/Manager$Options;)V
    .locals 5

    invoke-direct {p0}, Lio/socket/emitter/Emitter;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    if-nez p2, :cond_0

    new-instance p2, Lio/socket/client/Manager$Options;

    invoke-direct {p2}, Lio/socket/client/Manager$Options;-><init>()V

    :cond_0
    iget-object v0, p2, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "/socket.io"

    iput-object v0, p2, Lio/socket/engineio/client/Transport$Options;->path:Ljava/lang/String;

    :cond_1
    iget-object v0, p2, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    if-nez v0, :cond_2

    sget-object v0, Lio/socket/client/Manager;->defaultWebSocketFactory:Lokhttp3/WebSocket$Factory;

    iput-object v0, p2, Lio/socket/engineio/client/Transport$Options;->webSocketFactory:Lokhttp3/WebSocket$Factory;

    :cond_2
    iget-object v0, p2, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    if-nez v0, :cond_3

    sget-object v0, Lio/socket/client/Manager;->defaultCallFactory:Lokhttp3/Call$Factory;

    iput-object v0, p2, Lio/socket/engineio/client/Transport$Options;->callFactory:Lokhttp3/Call$Factory;

    :cond_3
    iput-object p2, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    iget-boolean v0, p2, Lio/socket/client/Manager$Options;->reconnection:Z

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnection(Z)Lio/socket/client/Manager;

    iget v0, p2, Lio/socket/client/Manager$Options;->reconnectionAttempts:I

    if-eqz v0, :cond_4

    goto :goto_0

    :cond_4
    const v0, 0x7fffffff

    :goto_0
    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->reconnectionAttempts(I)Lio/socket/client/Manager;

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelay:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_5

    goto :goto_1

    :cond_5
    const-wide/16 v0, 0x3e8

    :goto_1
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelay(J)Lio/socket/client/Manager;

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->reconnectionDelayMax:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_6

    goto :goto_2

    :cond_6
    const-wide/16 v0, 0x1388

    :goto_2
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->reconnectionDelayMax(J)Lio/socket/client/Manager;

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->randomizationFactor:D

    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-eqz v2, :cond_7

    goto :goto_3

    :cond_7
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    :goto_3
    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->randomizationFactor(D)Lio/socket/client/Manager;

    new-instance v0, Lio/socket/backo/Backoff;

    invoke-direct {v0}, Lio/socket/backo/Backoff;-><init>()V

    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelay()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    move-result-object v0

    invoke-virtual {p0}, Lio/socket/client/Manager;->reconnectionDelayMax()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    move-result-object v0

    invoke-virtual {p0}, Lio/socket/client/Manager;->randomizationFactor()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    move-result-object v0

    iput-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    iget-wide v0, p2, Lio/socket/client/Manager$Options;->timeout:J

    invoke-virtual {p0, v0, v1}, Lio/socket/client/Manager;->timeout(J)Lio/socket/client/Manager;

    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    iput-object p1, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/socket/client/Manager;->encoding:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    iget-object p1, p2, Lio/socket/client/Manager$Options;->encoder:Lio/socket/parser/Parser$Encoder;

    if-eqz p1, :cond_8

    goto :goto_4

    :cond_8
    new-instance p1, Lio/socket/parser/IOParser$Encoder;

    invoke-direct {p1}, Lio/socket/parser/IOParser$Encoder;-><init>()V

    :goto_4
    iput-object p1, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    iget-object p1, p2, Lio/socket/client/Manager$Options;->decoder:Lio/socket/parser/Parser$Decoder;

    if-eqz p1, :cond_9

    goto :goto_5

    :cond_9
    new-instance p1, Lio/socket/parser/IOParser$Decoder;

    invoke-direct {p1}, Lio/socket/parser/IOParser$Decoder;-><init>()V

    :goto_5
    iput-object p1, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    return-void
.end method

.method public static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method public static synthetic access$100(Lio/socket/client/Manager;)Ljava/net/URI;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->uri:Ljava/net/URI;

    return-object p0
.end method

.method public static synthetic access$1000(Lio/socket/client/Manager;)Lio/socket/parser/Parser$Decoder;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    return-object p0
.end method

.method public static synthetic access$1100(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->onping()V

    return-void
.end method

.method public static synthetic access$1200(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->onpong()V

    return-void
.end method

.method public static synthetic access$1300(Lio/socket/client/Manager;Ljava/lang/Exception;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onerror(Ljava/lang/Exception;)V

    return-void
.end method

.method public static synthetic access$1400(Lio/socket/client/Manager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/socket/client/Manager;->onclose(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$1500(Lio/socket/client/Manager;Lio/socket/parser/Packet;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/socket/client/Manager;->ondecoded(Lio/socket/parser/Packet;)V

    return-void
.end method

.method public static synthetic access$1600(Lio/socket/client/Manager;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    return-object p0
.end method

.method public static synthetic access$1700(Lio/socket/client/Manager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lio/socket/client/Manager;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic access$1802(Lio/socket/client/Manager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/socket/client/Manager;->encoding:Z

    return p1
.end method

.method public static synthetic access$1900(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->processPacketQueue()V

    return-void
.end method

.method public static synthetic access$200(Lio/socket/client/Manager;)Lio/socket/client/Manager$Options;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->opts:Lio/socket/client/Manager$Options;

    return-object p0
.end method

.method public static synthetic access$2000(Lio/socket/client/Manager;)Lio/socket/backo/Backoff;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    return-object p0
.end method

.method public static synthetic access$2102(Lio/socket/client/Manager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/socket/client/Manager;->reconnecting:Z

    return p1
.end method

.method public static synthetic access$2200(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    return-void
.end method

.method public static synthetic access$2300(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->onreconnect()V

    return-void
.end method

.method public static synthetic access$300(Lio/socket/client/Manager;)Z
    .locals 0

    iget-boolean p0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return p0
.end method

.method public static synthetic access$302(Lio/socket/client/Manager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lio/socket/client/Manager;->skipReconnect:Z

    return p1
.end method

.method public static synthetic access$400(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->onopen()V

    return-void
.end method

.method public static synthetic access$500(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    return-void
.end method

.method public static synthetic access$600(Lio/socket/client/Manager;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic access$700(Lio/socket/client/Manager;)V
    .locals 0

    invoke-direct {p0}, Lio/socket/client/Manager;->maybeReconnectOnOpen()V

    return-void
.end method

.method public static synthetic access$800(Lio/socket/client/Manager;)J
    .locals 2

    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method public static synthetic access$900(Lio/socket/client/Manager;)Ljava/util/Queue;
    .locals 0

    iget-object p0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    return-object p0
.end method

.method private cleanup()V
    .locals 2

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "cleanup"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/On$Handle;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/socket/client/On$Handle;->destroy()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lio/socket/parser/Parser$Decoder;->onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V

    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    iput-object v1, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    invoke-interface {v0}, Lio/socket/parser/Parser$Decoder;->destroy()V

    return-void
.end method

.method private varargs emitAll(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p0, p1, p2}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/socket/client/Socket;

    invoke-virtual {v1, p1, p2}, Lio/socket/client/Socket;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private generateId(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    const-string v1, "#"

    invoke-static {p1, v1}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    invoke-virtual {p1}, Lio/socket/engineio/client/Socket;->id()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private maybeReconnectOnOpen()V
    .locals 1

    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    :cond_0
    return-void
.end method

.method private onclose(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "onclose"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    const-string v0, "close"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    iget-boolean p1, p0, Lio/socket/client/Manager;->_reconnection:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-nez p1, :cond_0

    invoke-direct {p0}, Lio/socket/client/Manager;->reconnect()V

    :cond_0
    return-void
.end method

.method private ondecoded(Lio/socket/parser/Packet;)V
    .locals 1

    const-string v0, "packet"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    return-void
.end method

.method private onerror(Ljava/lang/Exception;)V
    .locals 3

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "error"

    invoke-virtual {v0, v1, v2, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v2, p1}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onopen()V
    .locals 4

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "open"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    sget-object v0, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lio/socket/emitter/Emitter;->emit(Ljava/lang/String;[Ljava/lang/Object;)Lio/socket/emitter/Emitter;

    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$2;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$2;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "data"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$3;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$3;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "ping"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$4;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$4;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "pong"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$5;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$5;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "error"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v2, Lio/socket/client/Manager$6;

    invoke-direct {v2, p0}, Lio/socket/client/Manager$6;-><init>(Lio/socket/client/Manager;)V

    const-string v3, "close"

    invoke-static {v0, v3, v2}, Lio/socket/client/On;->on(Lio/socket/emitter/Emitter;Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/client/On$Handle;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lio/socket/client/Manager;->decoder:Lio/socket/parser/Parser$Decoder;

    new-instance v1, Lio/socket/client/Manager$7;

    invoke-direct {v1, p0}, Lio/socket/client/Manager$7;-><init>(Lio/socket/client/Manager;)V

    invoke-interface {v0, v1}, Lio/socket/parser/Parser$Decoder;->onDecoded(Lio/socket/parser/Parser$Decoder$Callback;)V

    return-void
.end method

.method private onping()V
    .locals 2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "ping"

    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onpong()V
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-object v3, p0, Lio/socket/client/Manager;->lastPing:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x0

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "pong"

    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private onreconnect()V
    .locals 2

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/socket/client/Manager;->reconnecting:Z

    iget-object v1, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v1}, Lio/socket/backo/Backoff;->reset()V

    invoke-direct {p0}, Lio/socket/client/Manager;->updateSocketIds()V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "reconnect"

    invoke-direct {p0, v1, v0}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private processPacketQueue()V
    .locals 2

    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/parser/Packet;

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->packet(Lio/socket/parser/Packet;)V

    :cond_0
    return-void
.end method

.method private reconnect()V
    .locals 5

    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->getAttempts()I

    move-result v0

    iget v1, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    if-lt v0, v1, :cond_1

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "reconnect failed"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    const-string v0, "reconnect_failed"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v2}, Lio/socket/client/Manager;->emitAll(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v1, p0, Lio/socket/client/Manager;->reconnecting:Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->duration()J

    move-result-wide v0

    sget-object v2, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "will wait %dms before reconnect attempt"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/socket/client/Manager;->reconnecting:Z

    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    new-instance v3, Lio/socket/client/Manager$11;

    invoke-direct {v3, p0, p0}, Lio/socket/client/Manager$11;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-virtual {v2, v3, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    iget-object v0, p0, Lio/socket/client/Manager;->subs:Ljava/util/Queue;

    new-instance v1, Lio/socket/client/Manager$12;

    invoke-direct {v1, p0, v2}, Lio/socket/client/Manager$12;-><init>(Lio/socket/client/Manager;Ljava/util/Timer;)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    return-void
.end method

.method private updateSocketIds()V
    .locals 3

    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/socket/client/Socket;

    invoke-direct {p0, v2}, Lio/socket/client/Manager;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lio/socket/client/Socket;->id:Ljava/lang/String;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/client/Manager;->skipReconnect:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    iget-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    sget-object v1, Lio/socket/client/Manager$ReadyState;->OPEN:Lio/socket/client/Manager$ReadyState;

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lio/socket/client/Manager;->cleanup()V

    :cond_0
    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    invoke-virtual {v0}, Lio/socket/backo/Backoff;->reset()V

    sget-object v0, Lio/socket/client/Manager$ReadyState;->CLOSED:Lio/socket/client/Manager$ReadyState;

    iput-object v0, p0, Lio/socket/client/Manager;->readyState:Lio/socket/client/Manager$ReadyState;

    iget-object v0, p0, Lio/socket/client/Manager;->engine:Lio/socket/engineio/client/Socket;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/socket/engineio/client/Socket;->close()Lio/socket/engineio/client/Socket;

    :cond_1
    return-void
.end method

.method public destroy(Lio/socket/client/Socket;)V
    .locals 1

    iget-object v0, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lio/socket/client/Manager;->connecting:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lio/socket/client/Manager;->close()V

    return-void
.end method

.method public isReconnecting()Z
    .locals 1

    iget-boolean v0, p0, Lio/socket/client/Manager;->reconnecting:Z

    return v0
.end method

.method public open()Lio/socket/client/Manager;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/socket/client/Manager;->open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;

    move-result-object v0

    return-object v0
.end method

.method public open(Lio/socket/client/Manager$OpenCallback;)Lio/socket/client/Manager;
    .locals 1

    new-instance v0, Lio/socket/client/Manager$1;

    invoke-direct {v0, p0, p1}, Lio/socket/client/Manager$1;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager$OpenCallback;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-object p0
.end method

.method public packet(Lio/socket/parser/Packet;)V
    .locals 3

    sget-object v0, Lio/socket/client/Manager;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "writing packet %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p1, Lio/socket/parser/Packet;->query:Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lio/socket/parser/Packet;->type:I

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lio/socket/parser/Packet;->query:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lio/socket/parser/Packet;->nsp:Ljava/lang/String;

    :cond_1
    iget-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/socket/client/Manager;->encoding:Z

    iget-object v0, p0, Lio/socket/client/Manager;->encoder:Lio/socket/parser/Parser$Encoder;

    new-instance v1, Lio/socket/client/Manager$10;

    invoke-direct {v1, p0, p0}, Lio/socket/client/Manager$10;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V

    invoke-interface {v0, p1, v1}, Lio/socket/parser/Parser$Encoder;->encode(Lio/socket/parser/Packet;Lio/socket/parser/Parser$Encoder$Callback;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lio/socket/client/Manager;->packetBuffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public final randomizationFactor()D
    .locals 2

    iget-wide v0, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    return-wide v0
.end method

.method public randomizationFactor(D)Lio/socket/client/Manager;
    .locals 1

    iput-wide p1, p0, Lio/socket/client/Manager;->_randomizationFactor:D

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setJitter(D)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public reconnection(Z)Lio/socket/client/Manager;
    .locals 0

    iput-boolean p1, p0, Lio/socket/client/Manager;->_reconnection:Z

    return-object p0
.end method

.method public reconnection()Z
    .locals 1

    iget-boolean v0, p0, Lio/socket/client/Manager;->_reconnection:Z

    return v0
.end method

.method public reconnectionAttempts()I
    .locals 1

    iget v0, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    return v0
.end method

.method public reconnectionAttempts(I)Lio/socket/client/Manager;
    .locals 0

    iput p1, p0, Lio/socket/client/Manager;->_reconnectionAttempts:I

    return-object p0
.end method

.method public final reconnectionDelay()J
    .locals 2

    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    return-wide v0
.end method

.method public reconnectionDelay(J)Lio/socket/client/Manager;
    .locals 1

    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelay:J

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMin(J)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public final reconnectionDelayMax()J
    .locals 2

    iget-wide v0, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    return-wide v0
.end method

.method public reconnectionDelayMax(J)Lio/socket/client/Manager;
    .locals 1

    iput-wide p1, p0, Lio/socket/client/Manager;->_reconnectionDelayMax:J

    iget-object v0, p0, Lio/socket/client/Manager;->backoff:Lio/socket/backo/Backoff;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lio/socket/backo/Backoff;->setMax(J)Lio/socket/backo/Backoff;

    :cond_0
    return-object p0
.end method

.method public socket(Ljava/lang/String;)Lio/socket/client/Socket;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/socket/client/Manager;->socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;

    move-result-object p1

    return-object p1
.end method

.method public socket(Ljava/lang/String;Lio/socket/client/Manager$Options;)Lio/socket/client/Socket;
    .locals 2

    iget-object v0, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/socket/client/Socket;

    if-nez v0, :cond_1

    new-instance v0, Lio/socket/client/Socket;

    invoke-direct {v0, p0, p1, p2}, Lio/socket/client/Socket;-><init>(Lio/socket/client/Manager;Ljava/lang/String;Lio/socket/client/Manager$Options;)V

    iget-object p2, p0, Lio/socket/client/Manager;->nsps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/socket/client/Socket;

    if-eqz p2, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    new-instance p2, Lio/socket/client/Manager$8;

    invoke-direct {p2, p0, p0, v0}, Lio/socket/client/Manager$8;-><init>(Lio/socket/client/Manager;Lio/socket/client/Manager;Lio/socket/client/Socket;)V

    const-string v1, "connecting"

    invoke-virtual {v0, v1, p2}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    new-instance p2, Lio/socket/client/Manager$9;

    invoke-direct {p2, p0, v0, p0, p1}, Lio/socket/client/Manager$9;-><init>(Lio/socket/client/Manager;Lio/socket/client/Socket;Lio/socket/client/Manager;Ljava/lang/String;)V

    const-string p1, "connect"

    invoke-virtual {v0, p1, p2}, Lio/socket/emitter/Emitter;->on(Ljava/lang/String;Lio/socket/emitter/Emitter$Listener;)Lio/socket/emitter/Emitter;

    :cond_1
    :goto_0
    return-object v0
.end method

.method public timeout()J
    .locals 2

    iget-wide v0, p0, Lio/socket/client/Manager;->_timeout:J

    return-wide v0
.end method

.method public timeout(J)Lio/socket/client/Manager;
    .locals 0

    iput-wide p1, p0, Lio/socket/client/Manager;->_timeout:J

    return-object p0
.end method
