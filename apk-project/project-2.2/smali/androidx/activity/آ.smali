.class public final synthetic Landroidx/activity/آ;
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

    iput p1, p0, Landroidx/activity/آ;->آ:I

    iput-object p2, p0, Landroidx/activity/آ;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/activity/آ;->آ:I

    iget-object v1, p0, Landroidx/activity/آ;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Landroidx/activity/ComponentDialog;

    invoke-static {v1}, Landroidx/activity/ComponentDialog;->؋(Landroidx/activity/ComponentDialog;)V

    return-void

    :pswitch_1
    check-cast v1, Landroidx/activity/ComponentActivity;

    invoke-virtual {v1}, Landroidx/activity/ComponentActivity;->invalidateMenu()V

    return-void

    :pswitch_2
    check-cast v1, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;

    invoke-static {v1}, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->؋(Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;)V

    return-void

    :goto_0
    check-cast v1, Landroidx/activity/FullyDrawnReporter;

    invoke-static {v1}, Landroidx/activity/FullyDrawnReporter;->؋(Landroidx/activity/FullyDrawnReporter;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
