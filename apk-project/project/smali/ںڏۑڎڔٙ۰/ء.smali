.class public final Lںڏۑڎڔٙ۰/ء;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/ت;


# instance fields
.field public final synthetic آ:Lںڏۑڎڔٙ۰/آ;

.field public final synthetic أ:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lںڏۑڎڔٙ۰/آ;Lحظتۢۋۜآظ/ة;)V
    .locals 0

    iput-object p1, p0, Lںڏۑڎڔٙ۰/ء;->آ:Lںڏۑڎڔٙ۰/آ;

    iput-object p2, p0, Lںڏۑڎڔٙ۰/ء;->أ:Ljava/lang/Runnable;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Ljava/lang/Throwable;

    iget-object p1, p0, Lںڏۑڎڔٙ۰/ء;->آ:Lںڏۑڎڔٙ۰/آ;

    iget-object p1, p1, Lںڏۑڎڔٙ۰/آ;->آ:Landroid/os/Handler;

    iget-object v0, p0, Lںڏۑڎڔٙ۰/ء;->أ:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
