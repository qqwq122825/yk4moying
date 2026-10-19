.class Lio/socket/client/Manager$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/socket/client/On$Handle;


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

.field final synthetic val$timer:Ljava/util/Timer;


# direct methods
.method public constructor <init>(Lio/socket/client/Manager;Ljava/util/Timer;)V
    .locals 0

    iput-object p1, p0, Lio/socket/client/Manager$12;->this$0:Lio/socket/client/Manager;

    iput-object p2, p0, Lio/socket/client/Manager$12;->val$timer:Ljava/util/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    iget-object v0, p0, Lio/socket/client/Manager$12;->val$timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    return-void
.end method
