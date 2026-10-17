.class public final synthetic Landroidx/profileinstaller/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

.field public final synthetic ؤ:I

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;ILjava/lang/Object;I)V
    .locals 0

    iput p4, p0, Landroidx/profileinstaller/ؠ;->آ:I

    iput-object p1, p0, Landroidx/profileinstaller/ؠ;->أ:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    iput p2, p0, Landroidx/profileinstaller/ؠ;->ؤ:I

    iput-object p3, p0, Landroidx/profileinstaller/ؠ;->إ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Landroidx/profileinstaller/ؠ;->آ:I

    iget-object v1, p0, Landroidx/profileinstaller/ؠ;->أ:Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;

    iget-object v2, p0, Landroidx/profileinstaller/ؠ;->إ:Ljava/lang/Object;

    iget v3, p0, Landroidx/profileinstaller/ؠ;->ؤ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1, v3, v2}, Landroidx/profileinstaller/ProfileInstaller;->ؠ(Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;ILjava/lang/Object;)V

    return-void

    :goto_0
    invoke-static {v1, v3, v2}, Landroidx/profileinstaller/ProfileInstaller;->؋(Landroidx/profileinstaller/ProfileInstaller$DiagnosticsCallback;ILjava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
