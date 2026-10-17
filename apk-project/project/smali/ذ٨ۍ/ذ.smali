.class public final Lذ٨ۍ/ذ;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Lذ٨ۍ/؋;

.field public final ؠ:Lحۨٸڮؐێ/ء;


# direct methods
.method public synthetic constructor <init>(Lذ٨ۍ/؋;Lحۨٸڮؐێ/ء;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    iput-object p2, p0, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    instance-of v1, p1, Lذ٨ۍ/ذ;

    if-eqz v1, :cond_0

    check-cast p1, Lذ٨ۍ/ذ;

    iget-object v1, p0, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    iget-object v2, p1, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-static {v1, v2}, Lںڍڒڸ/ش;->س(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    iget-object p1, p1, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    invoke-static {v1, p1}, Lںڍڒڸ/ش;->س(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    iget-object v1, p0, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Lآۋۻؾ۹/ة;

    invoke-direct {v0, p0}, Lآۋۻؾ۹/ة;-><init>(Ljava/lang/Object;)V

    const-string v1, "key"

    iget-object v2, p0, Lذ٨ۍ/ذ;->؋:Lذ٨ۍ/؋;

    invoke-virtual {v0, v2, v1}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "feature"

    iget-object v2, p0, Lذ٨ۍ/ذ;->ؠ:Lحۨٸڮؐێ/ء;

    invoke-virtual {v0, v2, v1}, Lآۋۻؾ۹/ة;->ء(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lآۋۻؾ۹/ة;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
