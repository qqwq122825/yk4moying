.class public final Lڡپٔۯ/خ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڸڈڲ/ا;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lڡپٔۯ/خ;->؋:I

    iput-object p2, p0, Lڡپٔۯ/خ;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 2

    iget v0, p0, Lڡپٔۯ/خ;->؋:I

    iget-object v1, p0, Lڡپٔۯ/خ;->ؠ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Lڲٱۘۑدٿٰ/خ;

    const-string v0, "block"

    invoke-static {v1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lڸڈڲ/ب;

    invoke-direct {v0}, Lڸڈڲ/ب;-><init>()V

    invoke-static {v0, v0, v1}, Lںڍڒڸ/ش;->ح(Ljava/lang/Object;Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/خ;)Lڨڡئٸت/أ;

    move-result-object v1

    iput-object v1, v0, Lڸڈڲ/ب;->إ:Lڨڡئٸت/أ;

    return-object v0

    :pswitch_1
    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0

    :goto_0
    check-cast v1, Ljava/util/Iterator;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
