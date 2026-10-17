.class Lio/socket/client/Url$ParsedURI;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/socket/client/Url;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParsedURI"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final uri:Ljava/net/URI;


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/socket/client/Url$ParsedURI;->uri:Ljava/net/URI;

    iput-object p2, p0, Lio/socket/client/Url$ParsedURI;->id:Ljava/lang/String;

    return-void
.end method
