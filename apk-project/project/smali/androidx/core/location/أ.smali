.class public final synthetic Landroidx/core/location/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/util/concurrent/Executor;

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;Ljava/lang/Object;I)V
    .locals 0

    iput p4, p0, Landroidx/core/location/أ;->آ:I

    iput-object p1, p0, Landroidx/core/location/أ;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/core/location/أ;->أ:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Landroidx/core/location/أ;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Landroidx/core/location/أ;->آ:I

    iget-object v1, p0, Landroidx/core/location/أ;->أ:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Landroidx/core/location/أ;->إ:Ljava/lang/Object;

    iget-object v3, p0, Landroidx/core/location/أ;->ؤ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v3, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;

    check-cast v2, Landroidx/core/location/GnssStatusCompat;

    invoke-static {v3, v1, v2}, Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;->ؠ(Landroidx/core/location/LocationManagerCompat$GpsStatusTransport;Ljava/util/concurrent/Executor;Landroidx/core/location/GnssStatusCompat;)V

    return-void

    :pswitch_1
    check-cast v3, Landroidx/core/location/LocationManagerCompat$GnssMeasurementsTransport;

    check-cast v2, Landroid/location/GnssMeasurementsEvent;

    invoke-static {v3, v1, v2}, Landroidx/core/location/LocationManagerCompat$GnssMeasurementsTransport;->ؠ(Landroidx/core/location/LocationManagerCompat$GnssMeasurementsTransport;Ljava/util/concurrent/Executor;Landroid/location/GnssMeasurementsEvent;)V

    return-void

    :goto_0
    check-cast v3, Landroidx/core/location/LocationManagerCompat$PreRGnssStatusTransport;

    check-cast v2, Landroid/location/GnssStatus;

    invoke-static {v3, v1, v2}, Landroidx/core/location/LocationManagerCompat$PreRGnssStatusTransport;->ؠ(Landroidx/core/location/LocationManagerCompat$PreRGnssStatusTransport;Ljava/util/concurrent/Executor;Landroid/location/GnssStatus;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
