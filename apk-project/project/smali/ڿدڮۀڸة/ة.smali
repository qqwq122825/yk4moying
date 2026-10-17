.class public final Lڿدڮۀڸة/ة;
.super Lںڍڒڸ/ر;
.source "SourceFile"


# static fields
.field public static final آ:Lڿدڮۀڸة/ة;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lڿدڮۀڸة/ة;

    invoke-direct {v0}, Lڿدڮۀڸة/ة;-><init>()V

    sput-object v0, Lڿدڮۀڸة/ة;->آ:Lڿدڮۀڸة/ة;

    return-void
.end method


# virtual methods
.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    sget-object p1, Lڿدڮۀڸة/آ;->أ:Lڿدڮۀڸة/آ;

    sget-object v0, Lڿدڮۀڸة/ب;->ئ:Lٽچڃ/أ;

    iget-object p1, p1, Lڿدڮۀڸة/إ;->آ:Lڿدڮۀڸة/ؠ;

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lڿدڮۀڸة/ؠ;->ء(Ljava/lang/Runnable;Lٽچڃ/أ;Z)V

    return-void
.end method

.method public final dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    sget-object p1, Lڿدڮۀڸة/آ;->أ:Lڿدڮۀڸة/آ;

    sget-object v0, Lڿدڮۀڸة/ب;->ئ:Lٽچڃ/أ;

    iget-object p1, p1, Lڿدڮۀڸة/إ;->آ:Lڿدڮۀڸة/ؠ;

    const/4 v1, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lڿدڮۀڸة/ؠ;->ء(Ljava/lang/Runnable;Lٽچڃ/أ;Z)V

    return-void
.end method

.method public final limitedParallelism(I)Lںڍڒڸ/ر;
    .locals 1

    invoke-static {p1}, Lڗًقڔ/؋;->ث(I)V

    sget v0, Lڿدڮۀڸة/ب;->آ:I

    if-lt p1, v0, :cond_0

    return-object p0

    :cond_0
    invoke-super {p0, p1}, Lںڍڒڸ/ر;->limitedParallelism(I)Lںڍڒڸ/ر;

    move-result-object p1

    return-object p1
.end method
