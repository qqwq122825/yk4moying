.class public final Lںڍڒڸ/ٲ;
.super Lںڍڒڸ/ٱ;
.source "SourceFile"


# instance fields
.field public final ئ:Lںڍڒڸ/ٵ;

.field public final ا:Lںڍڒڸ/ٳ;

.field public final ب:Lںڍڒڸ/ت;

.field public final ة:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lںڍڒڸ/ٵ;Lںڍڒڸ/ٳ;Lںڍڒڸ/ت;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Lںڍڒڸ/ٱ;-><init>()V

    iput-object p1, p0, Lںڍڒڸ/ٲ;->ئ:Lںڍڒڸ/ٵ;

    iput-object p2, p0, Lںڍڒڸ/ٲ;->ا:Lںڍڒڸ/ٳ;

    iput-object p3, p0, Lںڍڒڸ/ٲ;->ب:Lںڍڒڸ/ت;

    iput-object p4, p0, Lںڍڒڸ/ٲ;->ة:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lںڍڒڸ/ٲ;->ة(Ljava/lang/Throwable;)V

    sget-object p1, Lڡُؑڨ/ا;->؋:Lڡُؑڨ/ا;

    return-object p1
.end method

.method public final ة(Ljava/lang/Throwable;)V
    .locals 3

    iget-object p1, p0, Lںڍڒڸ/ٲ;->ئ:Lںڍڒڸ/ٵ;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lںڍڒڸ/ٲ;->ب:Lںڍڒڸ/ت;

    invoke-static {v0}, Lںڍڒڸ/ٵ;->ؿ(Lھۥٓڍچ/ب;)Lںڍڒڸ/ت;

    move-result-object v0

    iget-object v1, p0, Lںڍڒڸ/ٲ;->ا:Lںڍڒڸ/ٳ;

    iget-object v2, p0, Lںڍڒڸ/ٲ;->ة:Ljava/lang/Object;

    if-eqz v0, :cond_0

    invoke-virtual {p1, v1, v0, v2}, Lںڍڒڸ/ٵ;->ه(Lںڍڒڸ/ٳ;Lںڍڒڸ/ت;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v1, v2}, Lںڍڒڸ/ٵ;->ز(Lںڍڒڸ/ٳ;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lںڍڒڸ/ٵ;->ة(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
