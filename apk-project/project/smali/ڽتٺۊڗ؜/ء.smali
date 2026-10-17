.class public final Lڽتٺۊڗ؜/ء;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/ت;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Ljava/lang/Object;

.field public final synthetic إ:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lڨڡئٸت/ا;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lڽتٺۊڗ؜/ء;->آ:I

    iput-object p1, p0, Lڽتٺۊڗ؜/ء;->ؤ:Ljava/lang/Object;

    iput-object p2, p0, Lڽتٺۊڗ؜/ء;->أ:Ljava/lang/Object;

    iput-object p3, p0, Lڽتٺۊڗ؜/ء;->إ:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    iget v1, p0, Lڽتٺۊڗ؜/ء;->آ:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lڽتٺۊڗ؜/ء;->invoke(Ljava/lang/Throwable;)V

    return-object v0

    :goto_0
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lڽتٺۊڗ؜/ء;->invoke(Ljava/lang/Throwable;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Throwable;)V
    .locals 4

    const/4 p1, 0x0

    iget v0, p0, Lڽتٺۊڗ؜/ء;->آ:I

    iget-object v1, p0, Lڽتٺۊڗ؜/ء;->إ:Ljava/lang/Object;

    iget-object v2, p0, Lڽتٺۊڗ؜/ء;->ؤ:Ljava/lang/Object;

    iget-object v3, p0, Lڽتٺۊڗ؜/ء;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lڽتٺۊڗ؜/ئ;->ت:Lئٱنۃؖۊڄئ/آ;

    if-ne v3, v0, :cond_0

    return-void

    :cond_0
    check-cast v2, Lڽتٺۊڗ؜/ؤ;

    iget-object v0, v2, Lڽتٺۊڗ؜/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    invoke-static {v1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    throw p1

    :goto_0
    check-cast v2, Lڲٱۘۑدٿٰ/ت;

    check-cast v1, Lڨڡئٸت/ا;

    invoke-static {v2, v3, p1}, Lسۄھؤۏ۫/؋;->ء(Lڲٱۘۑدٿٰ/ت;Ljava/lang/Object;Lرسٗ/ؠ;)Lرسٗ/ؠ;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {v1, p1}, Lںڍڒڸ/ش;->ؿ(Lڨڡئٸت/ا;Ljava/lang/Throwable;)V

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
