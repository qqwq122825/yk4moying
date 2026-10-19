.class public final Lھٳ۰ڌ؄غڎۦ/؋;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public آ:Lھڳۄ٧ڕڊ/خ;

.field public synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Lھٳ۰ڌ؄غڎۦ/ت;

.field public إ:I


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ت;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/؋;->ؤ:Lھٳ۰ڌ؄غڎۦ/ت;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/؋;->أ:Ljava/lang/Object;

    iget p1, p0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/؋;->إ:I

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/؋;->ؤ:Lھٳ۰ڌ؄غڎۦ/ت;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lھٳ۰ڌ؄غڎۦ/ت;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
