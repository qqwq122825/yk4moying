.class public final synthetic Lڝږ؁ڋ/ت;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(ILandroid/view/View;)V
    .locals 0

    iput p1, p0, Lڝږ؁ڋ/ت;->آ:I

    iput-object p2, p0, Lڝږ؁ڋ/ت;->أ:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Lڝږ؁ڋ/ت;->آ:I

    iget-object v1, p0, Lڝږ؁ڋ/ت;->أ:Landroid/view/View;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Lڝږ؁ڋ/ح;->ؤ(Landroid/view/View;)V

    return-void

    :pswitch_1
    invoke-static {v1}, Lڝږ؁ڋ/ح;->ؤ(Landroid/view/View;)V

    return-void

    :goto_0
    invoke-static {v1}, Lڝږ؁ڋ/ح;->ؤ(Landroid/view/View;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
