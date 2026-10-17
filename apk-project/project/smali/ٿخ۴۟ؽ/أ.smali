.class public final Lٿخ۴۟ؽ/أ;
.super Lٿخ۴۟ؽ/د;
.source "SourceFile"


# instance fields
.field public final synthetic أ:I


# direct methods
.method public synthetic constructor <init>(Lٿخ۴۟ؽ/خ;I)V
    .locals 0

    iput p2, p0, Lٿخ۴۟ؽ/أ;->أ:I

    invoke-direct {p0, p1}, Lٿخ۴۟ؽ/د;-><init>(Lٿخ۴۟ؽ/خ;)V

    return-void
.end method


# virtual methods
.method public final ذ()V
    .locals 2

    iget v0, p0, Lٿخ۴۟ؽ/أ;->أ:I

    packed-switch v0, :pswitch_data_0

    return-void

    :pswitch_0
    iget-object v0, p0, Lٿخ۴۟ؽ/د;->ؠ:Lٿخ۴۟ؽ/خ;

    const/4 v1, 0x0

    iput-object v1, v0, Lٿخ۴۟ؽ/خ;->ح:Landroid/view/View$OnLongClickListener;

    iget-object v0, v0, Lٿخ۴۟ؽ/خ;->إ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ٺ(Lcom/google/android/material/internal/CheckableImageButton;Landroid/view/View$OnLongClickListener;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
