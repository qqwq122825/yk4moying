.class public final Lھٳ۰ڌ؄غڎۦ/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/إ;


# instance fields
.field public final آ:Lھٳ۰ڌ؄غڎۦ/إ;

.field public final أ:Lڲٱۘۑدٿٰ/ت;

.field public final ؤ:Lڲٱۘۑدٿٰ/خ;


# direct methods
.method public constructor <init>(Lھٳ۰ڌ؄غڎۦ/إ;)V
    .locals 2

    sget-object v0, Lڸڈڲ/ح;->إ:Lڸڈڲ/ح;

    sget-object v1, Lڨڡئٸت/ء;->ا:Lڨڡئٸت/ء;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ؤ;->آ:Lھٳ۰ڌ؄غڎۦ/إ;

    iput-object v0, p0, Lھٳ۰ڌ؄غڎۦ/ؤ;->أ:Lڲٱۘۑدٿٰ/ت;

    iput-object v1, p0, Lھٳ۰ڌ؄غڎۦ/ؤ;->ؤ:Lڲٱۘۑدٿٰ/خ;

    return-void
.end method


# virtual methods
.method public final collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lkotlin/jvm/internal/ر;

    invoke-direct {v0}, Lkotlin/jvm/internal/ر;-><init>()V

    sget-object v1, Lڗًقڔ/ء;->ئ:Lئٱنۃؖۊڄئ/آ;

    iput-object v1, v0, Lkotlin/jvm/internal/ر;->آ:Ljava/lang/Object;

    new-instance v1, Lھٳ۰ڌ؄غڎۦ/أ;

    invoke-direct {v1, p0, v0, p1}, Lھٳ۰ڌ؄غڎۦ/أ;-><init>(Lھٳ۰ڌ؄غڎۦ/ؤ;Lkotlin/jvm/internal/ر;Lھٳ۰ڌ؄غڎۦ/ئ;)V

    iget-object p1, p0, Lھٳ۰ڌ؄غڎۦ/ؤ;->آ:Lھٳ۰ڌ؄غڎۦ/إ;

    invoke-interface {p1, v1, p2}, Lھٳ۰ڌ؄غڎۦ/إ;->collect(Lھٳ۰ڌ؄غڎۦ/ئ;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
