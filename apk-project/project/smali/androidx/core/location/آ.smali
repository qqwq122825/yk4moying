.class public final synthetic Landroidx/core/location/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/core/util/Consumer;

.field public final synthetic ؤ:Landroid/location/Location;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/util/Consumer;Landroid/location/Location;I)V
    .locals 0

    iput p3, p0, Landroidx/core/location/آ;->آ:I

    iput-object p1, p0, Landroidx/core/location/آ;->أ:Landroidx/core/util/Consumer;

    iput-object p2, p0, Landroidx/core/location/آ;->ؤ:Landroid/location/Location;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Landroidx/core/location/آ;->آ:I

    iget-object v1, p0, Landroidx/core/location/آ;->ؤ:Landroid/location/Location;

    iget-object v2, p0, Landroidx/core/location/آ;->أ:Landroidx/core/util/Consumer;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v2, v1}, Landroidx/core/location/LocationManagerCompat$CancellableLocationListener;->؋(Landroidx/core/util/Consumer;Landroid/location/Location;)V

    return-void

    :goto_0
    invoke-static {v2, v1}, Landroidx/core/location/LocationManagerCompat;->؋(Landroidx/core/util/Consumer;Landroid/location/Location;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
