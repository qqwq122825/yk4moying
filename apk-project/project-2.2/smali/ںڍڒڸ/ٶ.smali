.class public final Lںڍڒڸ/ٶ;
.super Lںڍڒڸ/ټ;
.source "SourceFile"


# instance fields
.field public final إ:Lڨڡئٸت/أ;


# direct methods
.method public constructor <init>(Lڨڡئٸت/ا;Lڲٱۘۑدٿٰ/خ;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lںڍڒڸ/ټ;-><init>(Lڨڡئٸت/ا;Z)V

    invoke-static {p0, p0, p2}, Lںڍڒڸ/ش;->ح(Ljava/lang/Object;Lڨڡئٸت/أ;Lڲٱۘۑدٿٰ/خ;)Lڨڡئٸت/أ;

    move-result-object p1

    iput-object p1, p0, Lںڍڒڸ/ٶ;->إ:Lڨڡئٸت/أ;

    return-void
.end method


# virtual methods
.method public final ق()V
    .locals 3

    iget-object v0, p0, Lںڍڒڸ/ٶ;->إ:Lڨڡئٸت/أ;

    :try_start_0
    invoke-static {v0}, Lںڍڒڸ/ش;->ف(Lڨڡئٸت/أ;)Lڨڡئٸت/أ;

    move-result-object v0

    sget-object v1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lڃٷښـ۝ۼ/ؠ;->ر(Lڨڡئٸت/أ;Ljava/lang/Object;Lڲٱۘۑدٿٰ/ت;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    invoke-static {v0}, Lڗًقڔ/ء;->ؤ(Ljava/lang/Throwable;)Lڡُؑڨ/أ;

    move-result-object v1

    invoke-virtual {p0, v1}, Lںڍڒڸ/؋;->resumeWith(Ljava/lang/Object;)V

    throw v0
.end method
