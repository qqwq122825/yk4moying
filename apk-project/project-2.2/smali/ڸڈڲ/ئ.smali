.class public final Lڸڈڲ/ئ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڸڈڲ/ا;


# instance fields
.field public final synthetic ؋:I

.field public final ؠ:Lڲٱۘۑدٿٰ/ت;

.field public final ء:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lڸڈڲ/ا;Lڲٱۘۑدٿٰ/ت;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lڸڈڲ/ئ;->؋:I

    const-string v0, "transformer"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڸڈڲ/ئ;->ء:Ljava/lang/Object;

    iput-object p2, p0, Lڸڈڲ/ئ;->ؠ:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method

.method public constructor <init>(Lڸڈڲ/ث;Lڲٱۘۑدٿٰ/ت;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lڸڈڲ/ئ;->؋:I

    const-string v0, "getNextValue"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڸڈڲ/ئ;->ء:Ljava/lang/Object;

    iput-object p2, p0, Lڸڈڲ/ئ;->ؠ:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    iget v0, p0, Lڸڈڲ/ئ;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lڸڈڲ/إ;

    invoke-direct {v0, p0}, Lڸڈڲ/إ;-><init>(Lڸڈڲ/ئ;)V

    return-object v0

    :goto_0
    new-instance v0, Lڸڈڲ/خ;

    invoke-direct {v0, p0}, Lڸڈڲ/خ;-><init>(Lڸڈڲ/ئ;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
