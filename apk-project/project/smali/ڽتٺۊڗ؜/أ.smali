.class public final Lڽتٺۊڗ؜/أ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public synthetic آ:Ljava/lang/Object;

.field public final synthetic أ:Lڽتٺۊڗ؜/ؤ;

.field public ؤ:I


# direct methods
.method public constructor <init>(Lڽتٺۊڗ؜/ؤ;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lڽتٺۊڗ؜/أ;->أ:Lڽتٺۊڗ؜/ؤ;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    iput-object p1, p0, Lڽتٺۊڗ؜/أ;->آ:Ljava/lang/Object;

    iget p1, p0, Lڽتٺۊڗ؜/أ;->ؤ:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lڽتٺۊڗ؜/أ;->ؤ:I

    iget-object v0, p0, Lڽتٺۊڗ؜/أ;->أ:Lڽتٺۊڗ؜/ؤ;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lڽتٺۊڗ؜/ؤ;->ؼ(Lڽتٺۊڗ؜/ج;IJLڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, v0, :cond_0

    return-object p1

    :cond_0
    new-instance v0, Lڽتٺۊڗ؜/ث;

    invoke-direct {v0, p1}, Lڽتٺۊڗ؜/ث;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method
