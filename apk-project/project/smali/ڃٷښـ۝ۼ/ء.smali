.class public final synthetic Lڃٷښـ۝ۼ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڕۇۅؑۨؼ۫ە/؋;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;

.field public final synthetic ء:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Lڃٷښـ۝ۼ/ء;->؋:I

    iput-object p2, p0, Lڃٷښـ۝ۼ/ء;->ؠ:Ljava/lang/Object;

    iput-object p3, p0, Lڃٷښـ۝ۼ/ء;->ء:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lڃٷښـ۝ۼ/ء;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڃٷښـ۝ۼ/ء;->ء:Ljava/lang/Object;

    iput-object p2, p0, Lڃٷښـ۝ۼ/ء;->ؠ:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 5

    iget v0, p0, Lڃٷښـ۝ۼ/ء;->؋:I

    iget-object v1, p0, Lڃٷښـ۝ۼ/ء;->ء:Ljava/lang/Object;

    iget-object v2, p0, Lڃٷښـ۝ۼ/ء;->ؠ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v2, Lڊ۟چڗۙ٦/ا;

    check-cast v1, Lڊ۟چڗۙ٦/ء;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v1, Lڊ۟چڗۙ٦/ء;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    new-instance v3, Lآۋۻؾ۹/ث;

    invoke-direct {v3, v1, v2}, Lآۋۻؾ۹/ث;-><init>(Lڊ۟چڗۙ٦/ء;Lڊ۟چڗۙ٦/ا;)V

    invoke-interface {v0, v3}, Lڊ۟چڗۙ٦/ؤ;->ؠ(Lآۋۻؾ۹/ث;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1
    check-cast v2, Lڃٷښـ۝ۼ/إ;

    check-cast v1, Landroid/content/Context;

    new-instance v0, Lڗښ۸/؋;

    invoke-virtual {v2}, Lڃٷښـ۝ۼ/إ;->ء()Ljava/lang/String;

    move-result-object v3

    iget-object v2, v2, Lڃٷښـ۝ۼ/إ;->آ:Lڊ۟چڗۙ٦/ا;

    const-class v4, Lڒڬؾۓؾ/؋;

    invoke-interface {v2, v4}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lڒڬؾۓؾ/؋;

    invoke-direct {v0, v1, v3}, Lڗښ۸/؋;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0

    :goto_0
    check-cast v1, Landroid/content/Context;

    check-cast v2, Ljava/lang/String;

    new-instance v0, Lړجإٖټض/ئ;

    invoke-direct {v0, v1, v2}, Lړجإٖټض/ئ;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
