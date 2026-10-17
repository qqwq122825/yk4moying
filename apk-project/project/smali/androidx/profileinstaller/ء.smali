.class public final synthetic Landroidx/profileinstaller/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;I)V
    .locals 0

    iput p2, p0, Landroidx/profileinstaller/ء;->آ:I

    iput-object p1, p0, Landroidx/profileinstaller/ء;->أ:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Landroidx/profileinstaller/ء;->آ:I

    iget-object v1, p0, Landroidx/profileinstaller/ء;->أ:Landroid/content/Context;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v1}, Landroidx/profileinstaller/ProfileInstallerInitializer;->ؠ(Landroid/content/Context;)V

    return-void

    :goto_0
    invoke-static {v1}, Landroidx/profileinstaller/ProfileInstallerInitializer;->ء(Landroid/content/Context;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
