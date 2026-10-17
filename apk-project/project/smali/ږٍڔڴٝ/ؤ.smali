.class public final Lږٍڔڴٝ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lږٍڔڴٝ/ا;


# instance fields
.field public final ؋:Lږٍڔڴٝ/ب;

.field public final ؠ:Lؾپۑ۟ڂڷ/ا;


# direct methods
.method public constructor <init>(Lږٍڔڴٝ/ب;Lؾپۑ۟ڂڷ/ا;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lږٍڔڴٝ/ؤ;->؋:Lږٍڔڴٝ/ب;

    iput-object p2, p0, Lږٍڔڴٝ/ؤ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Exception;)Z
    .locals 1

    iget-object v0, p0, Lږٍڔڴٝ/ؤ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {v0, p1}, Lؾپۑ۟ڂڷ/ا;->ؠ(Ljava/lang/Exception;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public final ؠ(Lږۄڙ/؋;)Z
    .locals 10

    sget-object v0, Lږۄڙ/ء;->إ:Lږۄڙ/ء;

    iget-object v1, p1, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_5

    iget-object v0, p0, Lږٍڔڴٝ/ؤ;->؋:Lږٍڔڴٝ/ب;

    invoke-virtual {v0, p1}, Lږٍڔڴٝ/ب;->؋(Lږۄڙ/؋;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v5, p1, Lږۄڙ/؋;->ء:Ljava/lang/String;

    if-eqz v5, :cond_4

    iget-wide v0, p1, Lږۄڙ/؋;->أ:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v3, p1, Lږۄڙ/؋;->ؤ:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v1, ""

    if-nez v0, :cond_1

    const-string v3, " tokenExpirationTimestamp"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    if-nez p1, :cond_2

    const-string v3, " tokenCreationTimestamp"

    invoke-static {v1, v3}, Landroidx/activity/result/؋;->إ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    new-instance v1, Lږٍڔڴٝ/؋;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    move-object v4, v1

    invoke-direct/range {v4 .. v9}, Lږٍڔڴٝ/؋;-><init>(Ljava/lang/String;JJ)V

    iget-object p1, p0, Lږٍڔڴٝ/ؤ;->ؠ:Lؾپۑ۟ڂڷ/ا;

    invoke-virtual {p1, v1}, Lؾپۑ۟ڂڷ/ا;->؋(Ljava/lang/Object;)V

    return v2

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Missing required properties:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null token"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    return v3
.end method
