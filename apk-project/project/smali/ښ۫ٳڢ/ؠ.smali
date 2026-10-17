.class public final synthetic Lښ۫ٳڢ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field public final synthetic ؋:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lښ۫ٳڢ/ؠ;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 0

    iget p1, p0, Lښ۫ٳڢ/ؠ;->؋:I

    const/4 p2, 0x1

    packed-switch p1, :pswitch_data_0

    return p2

    :pswitch_0
    sget-object p1, Lcom/lite/cloudfinder/App;->؋:Ljava/util/concurrent/ExecutorService;

    return p2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
