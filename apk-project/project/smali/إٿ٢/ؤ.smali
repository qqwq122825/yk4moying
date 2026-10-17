.class public final Lإٿ٢/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lإۊ۲ڽِٓر/ؠ;


# instance fields
.field public final synthetic آ:I

.field public final أ:Lڡحڠبںۨږۛ/؋;

.field public final ؤ:Lڡحڠبںۨږۛ/؋;

.field public final إ:Lڡحڠبںۨږۛ/؋;


# direct methods
.method public synthetic constructor <init>(Lڡحڠبںۨږۛ/؋;Lإۊ۲ڽِٓر/ؠ;Lإۊ۲ڽِٓر/ؠ;I)V
    .locals 0

    iput p4, p0, Lإٿ٢/ؤ;->آ:I

    iput-object p1, p0, Lإٿ٢/ؤ;->أ:Lڡحڠبںۨږۛ/؋;

    iput-object p2, p0, Lإٿ٢/ؤ;->ؤ:Lڡحڠبںۨږۛ/؋;

    iput-object p3, p0, Lإٿ٢/ؤ;->إ:Lڡحڠبںۨږۛ/؋;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 4

    iget v0, p0, Lإٿ٢/ؤ;->آ:I

    iget-object v1, p0, Lإٿ٢/ؤ;->إ:Lڡحڠبںۨږۛ/؋;

    iget-object v2, p0, Lإٿ٢/ؤ;->ؤ:Lڡحڠبںۨږۛ/؋;

    iget-object v3, p0, Lإٿ٢/ؤ;->أ:Lڡحڠبںۨږۛ/؋;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-interface {v3}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-interface {v2}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lثڈا/؋;

    invoke-interface {v1}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lثڈا/؋;

    new-instance v3, Lإٿ٢/أ;

    invoke-direct {v3, v0, v2, v1}, Lإٿ٢/أ;-><init>(Landroid/content/Context;Lثڈا/؋;Lثڈا/؋;)V

    return-object v3

    :goto_0
    invoke-interface {v3}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-interface {v2}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    new-instance v3, Lةٌخ/ج;

    invoke-direct {v3, v0, v2, v1}, Lةٌخ/ج;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
