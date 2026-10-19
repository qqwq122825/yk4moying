.class public final synthetic Landroidx/room/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/room/MultiInstanceInvalidationClient;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/MultiInstanceInvalidationClient;I)V
    .locals 0

    iput p2, p0, Landroidx/room/ؠ;->آ:I

    iput-object p1, p0, Landroidx/room/ؠ;->أ:Landroidx/room/MultiInstanceInvalidationClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/room/ؠ;->آ:I

    iget-object v1, p0, Landroidx/room/ؠ;->أ:Landroidx/room/MultiInstanceInvalidationClient;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/room/MultiInstanceInvalidationClient;->؋(Landroidx/room/MultiInstanceInvalidationClient;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/room/MultiInstanceInvalidationClient;->ؠ(Landroidx/room/MultiInstanceInvalidationClient;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
