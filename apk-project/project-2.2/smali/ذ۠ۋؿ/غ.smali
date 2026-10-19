.class public final Lذ۠ۋؿ/غ;
.super Lذ۠ۋؿ/ز;
.source "SourceFile"


# instance fields
.field public final synthetic إ:Lذ۠ۋؿ/إ;


# direct methods
.method public constructor <init>(Lذ۠ۋؿ/إ;I)V
    .locals 1

    iput-object p1, p0, Lذ۠ۋؿ/غ;->إ:Lذ۠ۋؿ/إ;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lذ۠ۋؿ/ز;-><init>(Lذ۠ۋؿ/إ;ILandroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public final ؋(Lحۨٸڮؐێ/؋;)V
    .locals 1

    iget-object v0, p0, Lذ۠ۋؿ/غ;->إ:Lذ۠ۋؿ/إ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    invoke-interface {v0, p1}, Lذ۠ۋؿ/ؠ;->؋(Lحۨٸڮؐێ/؋;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void
.end method

.method public final ؠ()Z
    .locals 2

    iget-object v0, p0, Lذ۠ۋؿ/غ;->إ:Lذ۠ۋؿ/إ;

    iget-object v0, v0, Lذ۠ۋؿ/إ;->ا:Lذ۠ۋؿ/ؠ;

    sget-object v1, Lحۨٸڮؐێ/؋;->ئ:Lحۨٸڮؐێ/؋;

    invoke-interface {v0, v1}, Lذ۠ۋؿ/ؠ;->؋(Lحۨٸڮؐێ/؋;)V

    const/4 v0, 0x1

    return v0
.end method
