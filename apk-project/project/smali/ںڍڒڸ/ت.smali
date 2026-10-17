.class public final Lںڍڒڸ/ت;
.super Lںڍڒڸ/ٮ;
.source "SourceFile"

# interfaces
.implements Lںڍڒڸ/ة;


# instance fields
.field public final ئ:Lںڍڒڸ/ث;


# direct methods
.method public constructor <init>(Lںڍڒڸ/ٵ;)V
    .locals 0

    invoke-direct {p0}, Lںڍڒڸ/ٮ;-><init>()V

    iput-object p1, p0, Lںڍڒڸ/ت;->ئ:Lںڍڒڸ/ث;

    return-void
.end method


# virtual methods
.method public final bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ت;->ة(Ljava/lang/Throwable;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final ؠ(Ljava/lang/Throwable;)Z
    .locals 1

    invoke-virtual {p0}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object v0

    invoke-virtual {v0, p1}, Lںڍڒڸ/ٵ;->د(Ljava/lang/Throwable;)Z

    move-result p1

    return p1
.end method

.method public final ة(Ljava/lang/Throwable;)V
    .locals 1

    invoke-virtual {p0}, Lںڍڒڸ/ٱ;->ب()Lںڍڒڸ/ٵ;

    move-result-object p1

    iget-object v0, p0, Lںڍڒڸ/ت;->ئ:Lںڍڒڸ/ث;

    check-cast v0, Lںڍڒڸ/ٵ;

    invoke-virtual {v0, p1}, Lںڍڒڸ/ٵ;->ث(Ljava/lang/Object;)Z

    return-void
.end method
