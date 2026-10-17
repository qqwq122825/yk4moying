.class public final Lھٳ۰ڌ؄غڎۦ/ج;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public آ:Lھٳ۰ڌ؄غڎۦ/ح;

.field public أ:Lھٳ۰ڌ؄غڎۦ/ئ;

.field public ؤ:Lھٳ۰ڌ؄غڎۦ/خ;

.field public إ:Lںڍڒڸ/ى;

.field public ئ:Ljava/lang/Object;

.field public synthetic ا:Ljava/lang/Object;

.field public final synthetic ب:Lھٳ۰ڌ؄غڎۦ/ح;

.field public ة:I


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/ح;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ج;->ب:Lھٳ۰ڌ؄غڎۦ/ح;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ج;->ا:Ljava/lang/Object;

    iget p1, p0, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lھٳ۰ڌ؄غڎۦ/ج;->ة:I

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ج;->ب:Lھٳ۰ڌ؄غڎۦ/ح;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lھٳ۰ڌ؄غڎۦ/ح;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
