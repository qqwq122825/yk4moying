.class public final Lھڳۄ٧ڕڊ/ز;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lھٳ۰ڌ؄غڎۦ/ئ;


# instance fields
.field public final آ:Lڽتٺۊڗ؜/ش;


# direct methods
.method public constructor <init>(Lڽتٺۊڗ؜/ش;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lھڳۄ٧ڕڊ/ز;->آ:Lڽتٺۊڗ؜/ش;

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lھڳۄ٧ڕڊ/ز;->آ:Lڽتٺۊڗ؜/ش;

    invoke-interface {v0, p1, p2}, Lڽتٺۊڗ؜/ش;->ا(Ljava/lang/Object;Lڨڡئٸت/أ;)Ljava/lang/Object;

    move-result-object p1

    sget-object p2, Lڪؿر٤ڦ۶٣ٙ/؋;->آ:Lڪؿر٤ڦ۶٣ٙ/؋;

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method
