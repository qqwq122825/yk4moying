.class public final synthetic Landroidx/room/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/room/QueryInterceptorStatement;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/QueryInterceptorStatement;I)V
    .locals 0

    iput p2, p0, Landroidx/room/إ;->آ:I

    iput-object p1, p0, Landroidx/room/إ;->أ:Landroidx/room/QueryInterceptorStatement;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/room/إ;->آ:I

    iget-object v1, p0, Landroidx/room/إ;->أ:Landroidx/room/QueryInterceptorStatement;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/room/QueryInterceptorStatement;->ؿ(Landroidx/room/QueryInterceptorStatement;)V

    return-void

    :pswitch_1
    invoke-static {v1}, Landroidx/room/QueryInterceptorStatement;->ؾ(Landroidx/room/QueryInterceptorStatement;)V

    return-void

    :pswitch_2
    invoke-static {v1}, Landroidx/room/QueryInterceptorStatement;->ء(Landroidx/room/QueryInterceptorStatement;)V

    return-void

    :pswitch_3
    invoke-static {v1}, Landroidx/room/QueryInterceptorStatement;->ر(Landroidx/room/QueryInterceptorStatement;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/room/QueryInterceptorStatement;->؋(Landroidx/room/QueryInterceptorStatement;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
