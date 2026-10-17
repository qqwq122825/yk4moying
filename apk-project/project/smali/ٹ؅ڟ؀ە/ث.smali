.class public abstract Lٹ؅ڟ؀ە/ث;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Lٹ؅ڟ؀ە/ت;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lٹ؅ڟ؀ە/ت;

    invoke-direct {v0}, Lٹ؅ڟ؀ە/ت;-><init>()V

    sput-object v0, Lٹ؅ڟ؀ە/ث;->؋:Lٹ؅ڟ؀ە/ت;

    return-void
.end method

.method public static ؋(Landroidx/appcompat/widget/Toolbar;Ljava/lang/CharSequence;)Ljava/util/ArrayList;
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_0

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method
