.class public final synthetic Landroidx/room/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/room/AutoCloser;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/AutoCloser;I)V
    .locals 0

    iput p2, p0, Landroidx/room/؋;->آ:I

    iput-object p1, p0, Landroidx/room/؋;->أ:Landroidx/room/AutoCloser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/room/؋;->آ:I

    iget-object v1, p0, Landroidx/room/؋;->أ:Landroidx/room/AutoCloser;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/room/AutoCloser;->؋(Landroidx/room/AutoCloser;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/room/AutoCloser;->ؠ(Landroidx/room/AutoCloser;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
