.class public final synthetic Lڒ٠ئڿؕکڡ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/ؤ;


# instance fields
.field public final synthetic ؋:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lڒ٠ئڿؕکڡ/ؠ;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    iget v0, p0, Lڒ٠ئڿؕکڡ/ؠ;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/إ;

    invoke-interface {p2, p1}, Lڑ٘ڰ٩ۓ۲ىښ/إ;->add(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/إ;

    return-void

    :goto_0
    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/إ;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {p2, p1}, Lڑ٘ڰ٩ۓ۲ىښ/إ;->ء(Z)Lڑ٘ڰ٩ۓ۲ىښ/إ;

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
