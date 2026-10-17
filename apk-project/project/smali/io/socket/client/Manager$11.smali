.class Lio/socket/client/Manager$11;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/client/Manager;->reconnect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/socket/client/Manager;

.field final synthetic val$self:Lio/socket/client/Manager;


# direct methods
.method public constructor <init>(Lio/socket/client/Manager;Lio/socket/client/Manager;)V
    .locals 0

    iput-object p1, p0, Lio/socket/client/Manager$11;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$11;->val$self:Lio/socket/client/Manager;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    new-instance v0, Lio/socket/client/Manager$11$1;

    invoke-direct {v0, p0}, Lio/socket/client/Manager$11$1;-><init>(Lio/socket/client/Manager$11;)V

    invoke-static {v0}, Lio/socket/thread/EventThread;->exec(Ljava/lang/Runnable;)V

    return-void
.end method
