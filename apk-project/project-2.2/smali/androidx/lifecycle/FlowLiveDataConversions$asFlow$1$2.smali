.class final Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/؋;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/\u0628;",
        "L\u06b2\u0671\u06d8\u06d1\u062f\u067f\u0670/\u060b;"
    }
.end annotation


# instance fields
.field final synthetic $observer:Landroidx/lifecycle/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/Observer<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic $this_asFlow:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/lifecycle/LiveData;Landroidx/lifecycle/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/LiveData<",
            "TT;>;",
            "Landroidx/lifecycle/Observer<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;->$this_asFlow:Landroidx/lifecycle/LiveData;

    iput-object p2, p0, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;->$observer:Landroidx/lifecycle/Observer;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;->invoke()V

    sget-object v0, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object v0
.end method

.method public final invoke()V
    .locals 9

    sget-object v0, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    sget-object v0, Lھۥٓڍچ/ح;->؋:Lںڍڒڸ/ٷ;

    check-cast v0, Lںڏۑڎڔٙ۰/آ;

    iget-object v0, v0, Lںڏۑڎڔٙ۰/آ;->إ:Lںڏۑڎڔٙ۰/آ;

    new-instance v1, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2$1;

    iget-object v2, p0, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;->$this_asFlow:Landroidx/lifecycle/LiveData;

    iget-object v3, p0, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2;->$observer:Landroidx/lifecycle/Observer;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Landroidx/lifecycle/FlowLiveDataConversions$asFlow$1$2$1;-><init>(Landroidx/lifecycle/LiveData;Landroidx/lifecycle/Observer;Lڨڡئٸت/أ;)V

    const/4 v2, 0x2

    const/4 v3, 0x1

    and-int/2addr v2, v3

    sget-object v5, Lڨڡئٸت/ب;->آ:Lڨڡئٸت/ب;

    if-eqz v2, :cond_0

    move-object v0, v5

    :cond_0
    const/4 v2, 0x2

    and-int v6, v2, v2

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    move v6, v3

    goto :goto_0

    :cond_1
    move v6, v7

    :goto_0
    invoke-static {v5, v0, v3}, Lڗًقڔ/ء;->ح(Lڨڡئٸت/ا;Lڨڡئٸت/ا;Z)Lڨڡئٸت/ا;

    move-result-object v0

    sget-object v5, Lںڍڒڸ/غ;->؋:Lڿدڮۀڸة/آ;

    if-eq v0, v5, :cond_2

    sget-object v8, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    invoke-interface {v0, v8}, Lڨڡئٸت/ا;->get(Lڨڡئٸت/ئ;)Lڨڡئٸت/إ;

    move-result-object v8

    if-nez v8, :cond_2

    invoke-interface {v0, v5}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object v0

    :cond_2
    if-eqz v6, :cond_5

    if-ne v6, v2, :cond_3

    move v7, v3

    :cond_3
    if-eqz v7, :cond_4

    new-instance v2, Lںڍڒڸ/ٶ;

    invoke-direct {v2, v0, v1}, Lںڍڒڸ/ٶ;-><init>(Lڨڡئٸت/ا;Lڲٱۘۑدٿٰ/خ;)V

    goto :goto_1

    :cond_4
    new-instance v2, Lںڍڒڸ/ټ;

    invoke-direct {v2, v0, v3}, Lںڍڒڸ/ټ;-><init>(Lڨڡئٸت/ا;Z)V

    :goto_1
    invoke-virtual {v2, v6, v2, v1}, Lںڍڒڸ/؋;->ي(ILںڍڒڸ/؋;Lڲٱۘۑدٿٰ/خ;)V

    return-void

    :cond_5
    throw v4
.end method
