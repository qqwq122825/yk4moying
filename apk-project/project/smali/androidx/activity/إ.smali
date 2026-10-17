.class public final synthetic Landroidx/activity/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# instance fields
.field public final synthetic ؋:Lڲٱۘۑدٿٰ/؋;


# direct methods
.method public synthetic constructor <init>(Lڲٱۘۑدٿٰ/؋;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/activity/إ;->؋:Lڲٱۘۑدٿٰ/؋;

    return-void
.end method


# virtual methods
.method public final onBackInvoked()V
    .locals 1

    iget-object v0, p0, Landroidx/activity/إ;->؋:Lڲٱۘۑدٿٰ/؋;

    invoke-static {v0}, Landroidx/activity/OnBackPressedDispatcher$Api33Impl;->؋(Lڲٱۘۑدٿٰ/؋;)V

    return-void
.end method
