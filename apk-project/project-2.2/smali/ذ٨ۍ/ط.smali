.class public final Lذ٨ۍ/ط;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lذ٨ۍ/ط;->آ:I

    iput-object p2, p0, Lذ٨ۍ/ط;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lذ٨ۍ/ط;->آ:I

    iget-object v1, p0, Lذ٨ۍ/ط;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Lذ٨ۍ/د;

    invoke-virtual {v1}, Lذ٨ۍ/د;->ئ()V

    return-void

    :pswitch_1
    check-cast v1, Lذ٨ۍ/ظ;

    iget-object v0, v1, Lذ٨ۍ/ظ;->ئ:Lذ٨ۍ/ر;

    new-instance v1, Lحۨٸڮؐێ/؋;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lحۨٸڮؐێ/؋;-><init>(I)V

    invoke-virtual {v0, v1}, Lذ٨ۍ/ر;->آ(Lحۨٸڮؐێ/؋;)V

    return-void

    :goto_0
    check-cast v1, Lذ٨ۍ/خ;

    iget-object v0, v1, Lذ٨ۍ/خ;->؋:Lذ٨ۍ/د;

    iget-object v0, v0, Lذ٨ۍ/د;->ء:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, " disconnecting because it was signed out."

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lذ۠ۋؿ/إ;->ء(Ljava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
