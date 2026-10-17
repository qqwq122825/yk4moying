.class public final synthetic Landroidx/lifecycle/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/lifecycle/آ;->آ:I

    iput-object p2, p0, Landroidx/lifecycle/آ;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onStateChanged(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 2

    iget v0, p0, Landroidx/lifecycle/آ;->آ:I

    iget-object v1, p0, Landroidx/lifecycle/آ;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Lڽتٺۊڗ؜/ر;

    invoke-static {v1, p1, p2}, Landroidx/lifecycle/LifecycleKt$eventFlow$1;->؋(Lڽتٺۊڗ؜/ر;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void

    :goto_0
    check-cast v1, Lھٳ۰ڌ؄غڎۦ/ب;

    invoke-static {v1, p1, p2}, Landroidx/lifecycle/Lifecycle;->؋(Lھٳ۰ڌ؄غڎۦ/ب;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
