.class public final Lھڳۄ٧ڕڊ/ئ;
.super Lګؓ۝ؒڄس/ء;
.source "SourceFile"


# instance fields
.field public synthetic آ:Ljava/lang/Object;

.field public final synthetic أ:Lھڳۄ٧ڕڊ/ا;

.field public ؤ:I


# direct methods
.method public constructor <init>(Lھڳۄ٧ڕڊ/ا;Lڨڡئٸت/أ;)V
    .locals 0

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ئ;->أ:Lھڳۄ٧ڕڊ/ا;

    invoke-direct {p0, p2}, Lګؓ۝ؒڄس/ء;-><init>(Lڨڡئٸت/أ;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ئ;->آ:Ljava/lang/Object;

    iget p1, p0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lھڳۄ٧ڕڊ/ئ;->ؤ:I

    iget-object p1, p0, Lھڳۄ٧ڕڊ/ئ;->أ:Lھڳۄ٧ڕڊ/ا;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lھڳۄ٧ڕڊ/ا;->emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
