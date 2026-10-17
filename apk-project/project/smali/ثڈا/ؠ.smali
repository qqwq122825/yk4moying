.class public final Lثڈا/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lثڈا/؋;


# instance fields
.field public final synthetic ؋:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lثڈا/ؠ;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋()J
    .locals 2

    iget v0, p0, Lثڈا/ؠ;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
