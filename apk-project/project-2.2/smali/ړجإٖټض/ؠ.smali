.class public final synthetic Lړجإٖټض/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڊ۟چڗۙ٦/ؤ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lڊ۟چڗۙ٦/س;


# direct methods
.method public synthetic constructor <init>(Lڊ۟چڗۙ٦/س;I)V
    .locals 0

    iput p2, p0, Lړجإٖټض/ؠ;->آ:I

    iput-object p1, p0, Lړجإٖټض/ؠ;->أ:Lڊ۟چڗۙ٦/س;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؠ(Lآۋۻؾ۹/ث;)Ljava/lang/Object;
    .locals 8

    iget v0, p0, Lړجإٖټض/ؠ;->آ:I

    iget-object v1, p0, Lړجإٖټض/ؠ;->أ:Lڊ۟چڗۙ٦/س;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lړجإٖټض/آ;

    const-class v2, Landroid/content/Context;

    invoke-virtual {p1, v2}, Lآۋۻؾ۹/ث;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/content/Context;

    const-class v2, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {p1, v2}, Lآۋۻؾ۹/ث;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v2}, Lڃٷښـ۝ۼ/إ;->ء()Ljava/lang/String;

    move-result-object v4

    const-class v2, Lړجإٖټض/أ;

    invoke-static {v2}, Lڊ۟چڗۙ٦/س;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/س;

    move-result-object v2

    invoke-virtual {p1, v2}, Lآۋۻؾ۹/ث;->أ(Lڊ۟چڗۙ٦/س;)Ljava/util/Set;

    move-result-object v5

    const-class v2, Lڙڧا/ؠ;

    invoke-virtual {p1, v2}, Lآۋۻؾ۹/ث;->ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object v6

    invoke-virtual {p1, v1}, Lآۋۻؾ۹/ث;->آ(Lڊ۟چڗۙ٦/س;)Ljava/lang/Object;

    move-result-object p1

    move-object v7, p1

    check-cast v7, Ljava/util/concurrent/Executor;

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lړجإٖټض/آ;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;Lڕۇۅؑۨؼ۫ە/؋;Ljava/util/concurrent/Executor;)V

    return-object v0

    :goto_0
    invoke-static {v1, p1}, Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;->؋(Lڊ۟چڗۙ٦/س;Lآۋۻؾ۹/ث;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
