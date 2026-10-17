.class public final Lذ۠ۋؿ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lذ۠ۋؿ/ؠ;


# instance fields
.field public final ؋:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋(Lحۨٸڮؐێ/؋;)V
    .locals 2

    iget v0, p1, Lحۨٸڮؐێ/؋;->أ:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    check-cast v1, Lذ۠ۋؿ/إ;

    if-eqz v0, :cond_1

    iget-object p1, v1, Lذ۠ۋؿ/إ;->ص:Ljava/util/Set;

    const/4 v0, 0x0

    invoke-virtual {v1, v0, p1}, Lذ۠ۋؿ/إ;->ؤ(Lذ۠ۋؿ/ئ;Ljava/util/Set;)V

    return-void

    :cond_1
    iget-object v0, v1, Lذ۠ۋؿ/إ;->ح:Lذ۠ۋؿ/ء;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lذ۠ۋؿ/ء;->؋:Ljava/lang/Object;

    check-cast v0, Lذ٨ۍ/ا;

    invoke-interface {v0, p1}, Lذ٨ۍ/ا;->ء(Lحۨٸڮؐێ/؋;)V

    :cond_2
    return-void
.end method
