.class public final Lڽتٺۊڗ؜/ا;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic ؋:Lڽتٺۊڗ؜/ا;

.field public static final ؠ:I


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    new-instance v0, Lڽتٺۊڗ؜/ا;

    invoke-direct {v0}, Lڽتٺۊڗ؜/ا;-><init>()V

    sput-object v0, Lڽتٺۊڗ؜/ا;->؋:Lڽتٺۊڗ؜/ا;

    const-string v7, "kotlinx.coroutines.channels.defaultBuffer"

    const/16 v0, 0x40

    int-to-long v1, v0

    const/4 v0, 0x1

    int-to-long v3, v0

    const v0, 0x7ffffffe

    int-to-long v5, v0

    invoke-static/range {v1 .. v7}, Lڗًقڔ/؋;->ځ(JJJLjava/lang/String;)J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lڽتٺۊڗ؜/ا;->ؠ:I

    return-void
.end method
