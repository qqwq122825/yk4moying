.class public final synthetic Lٿخ۴۟ؽ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Lٿخ۴۟ؽ/د;


# direct methods
.method public synthetic constructor <init>(Lٿخ۴۟ؽ/د;I)V
    .locals 0

    iput p2, p0, Lٿخ۴۟ؽ/ؠ;->؋:I

    iput-object p1, p0, Lٿخ۴۟ؽ/ؠ;->ؠ:Lٿخ۴۟ؽ/د;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 1

    iget p1, p0, Lٿخ۴۟ؽ/ؠ;->؋:I

    iget-object v0, p0, Lٿخ۴۟ؽ/ؠ;->ؠ:Lٿخ۴۟ؽ/د;

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v0, Lٿخ۴۟ؽ/آ;

    invoke-virtual {v0}, Lٿخ۴۟ؽ/آ;->س()Z

    move-result p1

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/آ;->ز(Z)V

    return-void

    :goto_0
    check-cast v0, Lٿخ۴۟ؽ/ة;

    iput-boolean p2, v0, Lٿخ۴۟ؽ/ة;->ت:Z

    invoke-virtual {v0}, Lٿخ۴۟ؽ/د;->د()V

    if-nez p2, :cond_0

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lٿخ۴۟ؽ/ة;->ز(Z)V

    iput-boolean p1, v0, Lٿخ۴۟ؽ/ة;->ث:Z

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
