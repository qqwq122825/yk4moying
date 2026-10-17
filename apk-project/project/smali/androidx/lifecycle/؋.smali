.class public final synthetic Landroidx/lifecycle/؋;
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

    iput p1, p0, Landroidx/lifecycle/؋;->آ:I

    iput-object p2, p0, Landroidx/lifecycle/؋;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/lifecycle/؋;->آ:I

    iget-object v1, p0, Landroidx/lifecycle/؋;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Landroidx/lifecycle/ComputableLiveData;

    invoke-static {v1}, Landroidx/lifecycle/ComputableLiveData;->ؠ(Landroidx/lifecycle/ComputableLiveData;)V

    return-void

    :pswitch_1
    check-cast v1, Landroidx/lifecycle/ComputableLiveData;

    invoke-static {v1}, Landroidx/lifecycle/ComputableLiveData;->؋(Landroidx/lifecycle/ComputableLiveData;)V

    return-void

    :goto_0
    check-cast v1, Landroidx/lifecycle/ProcessLifecycleOwner;

    invoke-static {v1}, Landroidx/lifecycle/ProcessLifecycleOwner;->؋(Landroidx/lifecycle/ProcessLifecycleOwner;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
