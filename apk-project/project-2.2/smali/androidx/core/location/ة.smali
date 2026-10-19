.class public final synthetic Landroidx/core/location/ة;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

.field public final synthetic أ:Ljava/lang/String;

.field public final synthetic ؤ:I

.field public final synthetic إ:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/location/ة;->آ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

    iput-object p2, p0, Landroidx/core/location/ة;->أ:Ljava/lang/String;

    iput p3, p0, Landroidx/core/location/ة;->ؤ:I

    iput-object p4, p0, Landroidx/core/location/ة;->إ:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Landroidx/core/location/ة;->ؤ:I

    iget-object v1, p0, Landroidx/core/location/ة;->إ:Landroid/os/Bundle;

    iget-object v2, p0, Landroidx/core/location/ة;->آ:Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;

    iget-object v3, p0, Landroidx/core/location/ة;->أ:Ljava/lang/String;

    invoke-static {v2, v3, v0, v1}, Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;->ؠ(Landroidx/core/location/LocationManagerCompat$LocationListenerTransport;Ljava/lang/String;ILandroid/os/Bundle;)V

    return-void
.end method
