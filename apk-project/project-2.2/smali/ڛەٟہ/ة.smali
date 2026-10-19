.class public final synthetic Lڛەٟہ/ة;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lcom/lite/cloudfinder/activity/PermissionActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/lite/cloudfinder/activity/PermissionActivity;I)V
    .locals 0

    iput p2, p0, Lڛەٟہ/ة;->آ:I

    iput-object p1, p0, Lڛەٟہ/ة;->أ:Lcom/lite/cloudfinder/activity/PermissionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lڛەٟہ/ة;->آ:I

    iget-object v1, p0, Lڛەٟہ/ة;->أ:Lcom/lite/cloudfinder/activity/PermissionActivity;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, v1, Lcom/lite/cloudfinder/activity/PermissionActivity;->؋:[Ljava/lang/String;

    iget v2, v1, Lcom/lite/cloudfinder/activity/PermissionActivity;->ؠ:I

    aget-object v0, v0, v2

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x97

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    return-void

    :goto_0
    sget v0, Lcom/lite/cloudfinder/activity/PermissionActivity;->آ:I

    invoke-virtual {v1}, Lcom/lite/cloudfinder/activity/PermissionActivity;->ؠ()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
