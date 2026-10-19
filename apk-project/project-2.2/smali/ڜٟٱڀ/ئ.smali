.class public final synthetic Lڜٟٱڀ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڜٟٱڀ/ة;


# direct methods
.method public synthetic constructor <init>(Lڜٟٱڀ/ة;I)V
    .locals 0

    iput p2, p0, Lڜٟٱڀ/ئ;->آ:I

    iput-object p1, p0, Lڜٟٱڀ/ئ;->أ:Lڜٟٱڀ/ة;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lڜٟٱڀ/ئ;->آ:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    iget-object v0, p0, Lڜٟٱڀ/ئ;->أ:Lڜٟٱڀ/ة;

    invoke-virtual {v0}, Lڜٟٱڀ/ة;->؋()V

    return-void

    :pswitch_1
    iget-object v0, p0, Lڜٟٱڀ/ئ;->أ:Lڜٟٱڀ/ة;

    iget-boolean v1, v0, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Lڜٟٱڀ/ة;->أ:Z

    if-nez v1, :cond_0

    iget-object v1, v0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    if-eqz v1, :cond_0

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lڜٟٱڀ/ة;->أ:Z

    :cond_0
    return-void

    :pswitch_2
    iget-object v0, p0, Lڜٟٱڀ/ئ;->أ:Lڜٟٱڀ/ة;

    iget-boolean v1, v0, Lڜٟٱڀ/ة;->آ:Z

    if-eqz v1, :cond_1

    iget-boolean v1, v0, Lڜٟٱڀ/ة;->أ:Z

    if-eqz v1, :cond_1

    iget-object v1, v0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lڜٟٱڀ/ة;->ة:Ljava/util/HashSet;

    iget-object v2, v0, Lڜٟٱڀ/ة;->ئ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, v0, Lڜٟٱڀ/ة;->ؠ:Lڛڜڕڰڑ/أ;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v2, v0, Lڜٟٱڀ/ة;->أ:Z

    :cond_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
