.class public Lokhttp3/internal/cache/FaultHidingSink;
.super Lۀۗ۱/ح;
.source "SourceFile"


# instance fields
.field private hasErrors:Z

.field private final onException:Lڲٱۘۑدٿٰ/ت;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lۀۗ۱/غ;Lڲٱۘۑدٿٰ/ت;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "L\u06c0\u06d7\u06f1/\u063a;",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;",
            ")V"
        }
    .end annotation

    const-string v0, "delegate"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onException"

    invoke-static {p2, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lۀۗ۱/ح;-><init>(Lۀۗ۱/غ;)V

    iput-object p2, p0, Lokhttp3/internal/cache/FaultHidingSink;->onException:Lڲٱۘۑدٿٰ/ت;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    iget-boolean v0, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-super {p0}, Lۀۗ۱/ح;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    iget-object v1, p0, Lokhttp3/internal/cache/FaultHidingSink;->onException:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v1, v0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public flush()V
    .locals 2

    iget-boolean v0, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-super {p0}, Lۀۗ۱/ح;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    iget-object v1, p0, Lokhttp3/internal/cache/FaultHidingSink;->onException:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {v1, v0}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public final getOnException()Lڲٱۘۑدٿٰ/ت;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u062a;"
        }
    .end annotation

    iget-object v0, p0, Lokhttp3/internal/cache/FaultHidingSink;->onException:Lڲٱۘۑدٿٰ/ت;

    return-object v0
.end method

.method public write(Lۀۗ۱/ب;J)V
    .locals 1

    const-string v0, "source"

    invoke-static {p1, v0}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2, p3}, Lۀۗ۱/ب;->skip(J)V

    return-void

    :cond_0
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lۀۗ۱/ح;->write(Lۀۗ۱/ب;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const/4 p2, 0x1

    iput-boolean p2, p0, Lokhttp3/internal/cache/FaultHidingSink;->hasErrors:Z

    iget-object p2, p0, Lokhttp3/internal/cache/FaultHidingSink;->onException:Lڲٱۘۑدٿٰ/ت;

    invoke-interface {p2, p1}, Lڲٱۘۑدٿٰ/ت;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method
