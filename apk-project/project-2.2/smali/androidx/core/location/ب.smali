.class public final synthetic Landroidx/core/location/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/Object;I)V
    .locals 0

    iput p3, p0, Landroidx/core/location/ب;->آ:I

    iput-object p1, p0, Landroidx/core/location/ب;->أ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

    iput-object p2, p0, Landroidx/core/location/ب;->ؤ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Landroidx/core/location/ب;->آ:I

    iget-object v1, p0, Landroidx/core/location/ب;->أ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

    iget-object v2, p0, Landroidx/core/location/ب;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v2, Ljava/util/List;

    invoke-static {v1, v2}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->ء(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/util/List;)V

    return-void

    :goto_0
    check-cast v2, Landroid/location/Location;

    invoke-static {v1, v2}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->ؤ(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Landroid/location/Location;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
