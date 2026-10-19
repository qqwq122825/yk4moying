.class public final synthetic Lةؽڗںۍټ٘/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lةڈۑۂٝےآذ/ؠ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Lةؽڗںۍټ٘/ت;

.field public final synthetic ؤ:Lأۺؘٻڣ/ز;


# direct methods
.method public synthetic constructor <init>(Lةؽڗںۍټ٘/ت;Lأۺؘٻڣ/ز;I)V
    .locals 0

    iput p3, p0, Lةؽڗںۍټ٘/ئ;->آ:I

    iput-object p1, p0, Lةؽڗںۍټ٘/ئ;->أ:Lةؽڗںۍټ٘/ت;

    iput-object p2, p0, Lةؽڗںۍټ٘/ئ;->ؤ:Lأۺؘٻڣ/ز;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .locals 4

    iget v0, p0, Lةؽڗںۍټ٘/ئ;->آ:I

    iget-object v1, p0, Lةؽڗںۍټ٘/ئ;->ؤ:Lأۺؘٻڣ/ز;

    iget-object v2, p0, Lةؽڗںۍټ٘/ئ;->أ:Lةؽڗںۍټ٘/ت;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, v2, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lةٌخ/ؤ;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Lةٌخ/ؤ;-><init>(Lةٌخ/ة;Lأۺؘٻڣ/ز;I)V

    invoke-virtual {v0, v2}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :goto_0
    iget-object v0, v2, Lةؽڗںۍټ٘/ت;->ء:Lةٌخ/آ;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lةٌخ/ؤ;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v1, v3}, Lةٌخ/ؤ;-><init>(Lةٌخ/ة;Lأۺؘٻڣ/ز;I)V

    invoke-virtual {v0, v2}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
