.class public final synthetic Landroidx/core/view/ؤ;
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

    iput p1, p0, Landroidx/core/view/ؤ;->آ:I

    iput-object p2, p0, Landroidx/core/view/ؤ;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/core/view/ؤ;->آ:I

    iget-object v1, p0, Landroidx/core/view/ؤ;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Landroidx/core/view/SoftwareKeyboardControllerCompat$Impl20;->؋(Landroid/view/View;)V

    return-void

    :goto_0
    check-cast v1, Lڲٱۘۑدٿٰ/؋;

    invoke-static {v1}, Landroidx/core/view/ViewKt;->؋(Lڲٱۘۑدٿٰ/؋;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
