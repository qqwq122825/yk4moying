.class public Lھۥٓڍچ/ر;
.super Lںڍڒڸ/؋;
.source "SourceFile"

# interfaces
.implements Lګؓ۝ؒڄس/آ;


# instance fields
.field public final إ:Lڨڡئٸت/أ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/أ;Lڨڡئٸت/ا;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lںڍڒڸ/؋;-><init>(Lڨڡئٸت/ا;Z)V

    iput-object p1, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    return-void
.end method


# virtual methods
.method public final getCallerFrame()Lګؓ۝ؒڄس/آ;
    .locals 2

    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    instance-of v1, v0, Lګؓ۝ؒڄس/آ;

    if-eqz v1, :cond_0

    check-cast v0, Lګؓ۝ؒڄس/آ;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public ة(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    invoke-static {v0}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v0

    invoke-static {p1}, Lڗًقڔ/؋;->ٵ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lڃٷښـ۝ۼ/ؠ;->ر(Lڨڡئٸت/أ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V

    return-void
.end method

.method public ت(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lھۥٓڍچ/ر;->إ:Lڨڡئٸت/أ;

    invoke-static {p1}, Lڗًقڔ/؋;->ٵ(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lڨڡئٸت/أ;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public final ؼ()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
