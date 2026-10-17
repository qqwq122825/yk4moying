.class public final synthetic Landroidx/lifecycle/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public final synthetic ؋:Lڽتٺۊڗ؜/ر;


# direct methods
.method public synthetic constructor <init>(Lڽتٺۊڗ؜/ر;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/ؠ;->؋:Lڽتٺۊڗ؜/ر;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Landroidx/lifecycle/ؠ;->؋:Lڽتٺۊڗ؜/ر;

    invoke-static {v0, p1}, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1;->؋(Lڽتٺۊڗ؜/ر;Ljava/lang/Object;)V

    return-void
.end method
