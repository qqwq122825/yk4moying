.class public final Lږٍڔڴٝ/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lږٍڔڴٝ/ا;


# instance fields
.field public final ؋:Lؾپۑ۟ڂڷ/ا;


# direct methods
.method public constructor <init>(Lؾپۑ۟ڂڷ/ا;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lږٍڔڴٝ/إ;->؋:Lؾپۑ۟ڂڷ/ا;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Exception;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public final ؠ(Lږۄڙ/؋;)Z
    .locals 4

    sget-object v0, Lږۄڙ/ء;->ؤ:Lږۄڙ/ء;

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p1, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    if-ne v3, v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_4

    sget-object v0, Lږۄڙ/ء;->إ:Lږۄڙ/ء;

    if-ne v3, v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    if-nez v0, :cond_4

    sget-object v0, Lږۄڙ/ء;->ئ:Lږۄڙ/ء;

    if-ne v3, v0, :cond_2

    move v0, v1

    goto :goto_2

    :cond_2
    move v0, v2

    :goto_2
    if-eqz v0, :cond_3

    goto :goto_3

    :cond_3
    return v2

    :cond_4
    :goto_3
    iget-object v0, p0, Lږٍڔڴٝ/إ;->؋:Lؾپۑ۟ڂڷ/ا;

    iget-object p1, p1, Lږۄڙ/؋;->؋:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    return v1
.end method
