.class public final synthetic Landroidx/lifecycle/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleEventObserver;


# instance fields
.field public final synthetic آ:Landroidx/lifecycle/LifecycleController;

.field public final synthetic أ:Lںڍڒڸ/ى;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/LifecycleController;Lںڍڒڸ/ى;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/ء;->آ:Landroidx/lifecycle/LifecycleController;

    iput-object p2, p0, Landroidx/lifecycle/ء;->أ:Lںڍڒڸ/ى;

    return-void
.end method


# virtual methods
.method public final onStateChanged(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 2

    iget-object v0, p0, Landroidx/lifecycle/ء;->آ:Landroidx/lifecycle/LifecycleController;

    iget-object v1, p0, Landroidx/lifecycle/ء;->أ:Lںڍڒڸ/ى;

    invoke-static {v0, v1, p1, p2}, Landroidx/lifecycle/LifecycleController;->؋(Landroidx/lifecycle/LifecycleController;Lںڍڒڸ/ى;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method
