.class public final Lذ۠ۋؿ/خ;
.super Lذ۠ۋؿ/د;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:Landroid/content/Intent;

.field public final synthetic ؠ:Lذ٨ۍ/إ;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Lذ٨ۍ/إ;)V
    .locals 0

    iput-object p1, p0, Lذ۠ۋؿ/خ;->؋:Landroid/content/Intent;

    iput-object p2, p0, Lذ۠ۋؿ/خ;->ؠ:Lذ٨ۍ/إ;

    invoke-direct {p0}, Lذ۠ۋؿ/د;-><init>()V

    return-void
.end method


# virtual methods
.method public final ؋()V
    .locals 3

    iget-object v0, p0, Lذ۠ۋؿ/خ;->؋:Landroid/content/Intent;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lذ۠ۋؿ/خ;->ؠ:Lذ٨ۍ/إ;

    const/4 v2, 0x2

    invoke-interface {v1, v0, v2}, Lذ٨ۍ/إ;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method
