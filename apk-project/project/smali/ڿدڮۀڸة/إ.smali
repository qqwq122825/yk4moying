.class public abstract Lڿدڮۀڸة/إ;
.super Lںڍڒڸ/ق;
.source "SourceFile"


# instance fields
.field public final آ:Lڿدڮۀڸة/ؠ;


# direct methods
.method public constructor <init>(IIJLjava/lang/String;)V
    .locals 7

    invoke-direct {p0}, Lںڍڒڸ/ق;-><init>()V

    new-instance v6, Lڿدڮۀڸة/ؠ;

    move-object v0, v6

    move v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lڿدڮۀڸة/ؠ;-><init>(IIJLjava/lang/String;)V

    iput-object v6, p0, Lڿدڮۀڸة/إ;->آ:Lڿدڮۀڸة/ؠ;

    return-void
.end method


# virtual methods
.method public final dispatch(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    sget-object p1, Lڿدڮۀڸة/ؠ;->ة:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    sget-object p1, Lڿدڮۀڸة/ب;->إ:Lٽچڃ/أ;

    const/4 v0, 0x0

    iget-object v1, p0, Lڿدڮۀڸة/إ;->آ:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v1, p2, p1, v0}, Lڿدڮۀڸة/ؠ;->ء(Ljava/lang/Runnable;Lٽچڃ/أ;Z)V

    return-void
.end method

.method public final dispatchYield(Lڨڡئٸت/ا;Ljava/lang/Runnable;)V
    .locals 2

    sget-object p1, Lڿدڮۀڸة/ؠ;->ة:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    sget-object p1, Lڿدڮۀڸة/ب;->إ:Lٽچڃ/أ;

    const/4 v0, 0x1

    iget-object v1, p0, Lڿدڮۀڸة/إ;->آ:Lڿدڮۀڸة/ؠ;

    invoke-virtual {v1, p2, p1, v0}, Lڿدڮۀڸة/ؠ;->ء(Ljava/lang/Runnable;Lٽچڃ/أ;Z)V

    return-void
.end method
