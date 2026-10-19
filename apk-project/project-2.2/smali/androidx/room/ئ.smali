.class public final synthetic Landroidx/room/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/room/RoomTrackingLiveData;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/RoomTrackingLiveData;I)V
    .locals 0

    iput p2, p0, Landroidx/room/ئ;->آ:I

    iput-object p1, p0, Landroidx/room/ئ;->أ:Landroidx/room/RoomTrackingLiveData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/room/ئ;->آ:I

    iget-object v1, p0, Landroidx/room/ئ;->أ:Landroidx/room/RoomTrackingLiveData;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/room/RoomTrackingLiveData;->؋(Landroidx/room/RoomTrackingLiveData;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/room/RoomTrackingLiveData;->ؠ(Landroidx/room/RoomTrackingLiveData;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
