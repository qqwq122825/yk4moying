.class public final Lئٱنۃؖۊڄئ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lإۊ۲ڽِٓر/ؠ;


# instance fields
.field public final synthetic آ:I

.field public final أ:Lڡحڠبںۨږۛ/؋;

.field public final ؤ:Lڡحڠبںۨږۛ/؋;

.field public final إ:Lڡحڠبںۨږۛ/؋;

.field public final ئ:Lڡحڠبںۨږۛ/؋;


# direct methods
.method public synthetic constructor <init>(Lڡحڠبںۨږۛ/؋;Lڡحڠبںۨږۛ/؋;Lإۊ۲ڽِٓر/ؠ;Lڡحڠبںۨږۛ/؋;I)V
    .locals 0

    iput p5, p0, Lئٱنۃؖۊڄئ/أ;->آ:I

    iput-object p1, p0, Lئٱنۃؖۊڄئ/أ;->أ:Lڡحڠبںۨږۛ/؋;

    iput-object p2, p0, Lئٱنۃؖۊڄئ/أ;->ؤ:Lڡحڠبںۨږۛ/؋;

    iput-object p3, p0, Lئٱنۃؖۊڄئ/أ;->إ:Lڡحڠبںۨږۛ/؋;

    iput-object p4, p0, Lئٱنۃؖۊڄئ/أ;->ئ:Lڡحڠبںۨږۛ/؋;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 5

    iget v0, p0, Lئٱنۃؖۊڄئ/أ;->آ:I

    iget-object v1, p0, Lئٱنۃؖۊڄئ/أ;->ئ:Lڡحڠبںۨږۛ/؋;

    iget-object v2, p0, Lئٱنۃؖۊڄئ/أ;->إ:Lڡحڠبںۨږۛ/؋;

    iget-object v3, p0, Lئٱنۃؖۊڄئ/أ;->ؤ:Lڡحڠبںۨږۛ/؋;

    iget-object v4, p0, Lئٱنۃؖۊڄئ/أ;->أ:Lڡحڠبںۨږۛ/؋;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-interface {v4}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-interface {v3}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lةٌخ/آ;

    invoke-interface {v2}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lةؽڗںۍټ٘/ؠ;

    invoke-interface {v1}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lثڈا/؋;

    new-instance v1, Lةؽڗںۍټ٘/أ;

    invoke-direct {v1, v0, v3, v2}, Lةؽڗںۍټ٘/أ;-><init>(Landroid/content/Context;Lةٌخ/آ;Lةؽڗںۍټ٘/ؠ;)V

    return-object v1

    :goto_0
    invoke-interface {v4}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    invoke-interface {v3}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lةٌخ/آ;

    invoke-interface {v2}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lةؽڗںۍټ٘/ح;

    invoke-interface {v1}, Lڡحڠبںۨږۛ/؋;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lةڈۑۂٝےآذ/ء;

    new-instance v4, Lةؽڗںۍټ٘/ج;

    invoke-direct {v4, v0, v3, v2, v1}, Lةؽڗںۍټ٘/ج;-><init>(Ljava/util/concurrent/Executor;Lةٌخ/آ;Lةؽڗںۍټ٘/ح;Lةڈۑۂٝےآذ/ء;)V

    return-object v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
