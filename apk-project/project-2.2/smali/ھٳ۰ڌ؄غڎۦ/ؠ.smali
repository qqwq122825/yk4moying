.class public final Lھٳ۰ڌ؄غڎۦ/ؠ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public آ:Lڽتٺۊڗ؜/ر;

.field public synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Lھٳ۰ڌ؄غڎۦ/ء;

.field public إ:I


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ء;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ؠ;->ؤ:Lھٳ۰ڌ؄غڎۦ/ء;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ؠ;->أ:Ljava/lang/Object;

    iget p1, p0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/ؠ;->إ:I

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ؠ;->ؤ:Lھٳ۰ڌ؄غڎۦ/ء;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lھٳ۰ڌ؄غڎۦ/ء;->ؠ(Lڽتٺۊڗ؜/ر;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
