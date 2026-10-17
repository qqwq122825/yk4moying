.class public final Lںڍڒڸ/و;
.super Lںڍڒڸ/ٱ;
.source "SourceFile"


# instance fields
.field public final synthetic ئ:I

.field public final ا:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lںڍڒڸ/و;->ئ:I

    invoke-direct {p0}, Lںڍڒڸ/ٱ;-><init>()V

    iput-object p2, p0, Lںڍڒڸ/و;->ا:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget v1, p0, Lںڍڒڸ/و;->ئ:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lںڍڒڸ/و;->ة(Ljava/lang/Throwable;)V

    return-object v0

    :goto_0
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lںڍڒڸ/و;->ة(Ljava/lang/Throwable;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final ة(Ljava/lang/Throwable;)V
    .locals 2

    iget v0, p0, Lںڍڒڸ/و;->ئ:I

    iget-object v1, p0, Lںڍڒڸ/و;->ا:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v1, Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v1, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :goto_0
    check-cast v1, Lڨڡئٸت/أ;

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    invoke-interface {v1, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
