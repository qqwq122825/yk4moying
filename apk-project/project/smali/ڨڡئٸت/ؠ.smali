.class public abstract Lڨڡئٸت/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڨڡئٸت/ئ;


# instance fields
.field public final آ:Lڲٱۘۑدٿٰ/ت;

.field public final أ:Lڨڡئٸت/ئ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ئ;Lڸڈڲ/ح;)V
    .locals 1

    const-string v0, "baseKey"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lڨڡئٸت/ؠ;->آ:Lڲٱۘۑدٿٰ/ت;

    instance-of p2, p1, Lڨڡئٸت/ؠ;

    if-eqz p2, :cond_0

    check-cast p1, Lڨڡئٸت/ؠ;

    iget-object p1, p1, Lڨڡئٸت/ؠ;->أ:Lڨڡئٸت/ئ;

    :cond_0
    iput-object p1, p0, Lڨڡئٸت/ؠ;->أ:Lڨڡئٸت/ئ;

    return-void
.end method
