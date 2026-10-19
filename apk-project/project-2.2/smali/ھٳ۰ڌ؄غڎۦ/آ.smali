.class public final Lھٳ۰ڌ؄غڎۦ/آ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public synthetic آ:Ljava/lang/Object;

.field public final synthetic أ:Lھٳ۰ڌ؄غڎۦ/أ;

.field public ؤ:I


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/أ;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/آ;->أ:Lھٳ۰ڌ؄غڎۦ/أ;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/آ;->آ:Ljava/lang/Object;

    iget p1, p0, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/آ;->ؤ:I

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/آ;->أ:Lھٳ۰ڌ؄غڎۦ/أ;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lھٳ۰ڌ؄غڎۦ/أ;->emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
