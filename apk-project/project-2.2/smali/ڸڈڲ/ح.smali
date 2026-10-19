.class public final Lڸڈڲ/ح;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/ت;


# static fields
.field public static final أ:Lڸڈڲ/ح;

.field public static final ؤ:Lڸڈڲ/ح;

.field public static final إ:Lڸڈڲ/ح;


# instance fields
.field public final synthetic آ:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    new-instance v0, Lڸڈڲ/ح;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lڸڈڲ/ح;-><init>(I)V

    sput-object v0, Lڸڈڲ/ح;->أ:Lڸڈڲ/ح;

    new-instance v0, Lڸڈڲ/ح;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lڸڈڲ/ح;-><init>(I)V

    sput-object v0, Lڸڈڲ/ح;->ؤ:Lڸڈڲ/ح;

    new-instance v0, Lڸڈڲ/ح;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lڸڈڲ/ح;-><init>(I)V

    sput-object v0, Lڸڈڲ/ح;->إ:Lڸڈڲ/ح;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lڸڈڲ/ح;->آ:I

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lڸڈڲ/ح;->آ:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    return-object p1

    :pswitch_1
    check-cast p1, Lڨڡئٸت/إ;

    instance-of v0, p1, Lںڍڒڸ/ق;

    if-eqz v0, :cond_0

    move-object v1, p1

    check-cast v1, Lںڍڒڸ/ق;

    :cond_0
    return-object v1

    :pswitch_2
    check-cast p1, Lڨڡئٸت/إ;

    instance-of v0, p1, Lںڍڒڸ/ر;

    if-eqz v0, :cond_1

    move-object v1, p1

    check-cast v1, Lںڍڒڸ/ر;

    :cond_1
    return-object v1

    :pswitch_3
    check-cast p1, Ljava/lang/String;

    const-string v0, "line"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    :pswitch_4
    if-nez p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :goto_1
    check-cast p1, Ljava/lang/Throwable;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
