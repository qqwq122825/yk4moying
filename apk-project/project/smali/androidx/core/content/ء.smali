.class public final synthetic Landroidx/core/content/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/core/util/Predicate;


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    iput p2, p0, Landroidx/core/content/ء;->؋:I

    iput-object p1, p0, Landroidx/core/content/ء;->ؠ:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 2

    iget v0, p0, Landroidx/core/content/ء;->؋:I

    iget-object v1, p0, Landroidx/core/content/ء;->ؠ:Ljava/lang/String;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Landroid/net/Uri;

    invoke-static {v1, p1}, Landroidx/core/content/IntentSanitizer$Builder;->ة(Ljava/lang/String;Landroid/net/Uri;)Z

    move-result p1

    return p1

    :pswitch_1
    check-cast p1, Landroid/content/ComponentName;

    invoke-static {v1, p1}, Landroidx/core/content/IntentSanitizer$Builder;->ث(Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result p1

    return p1

    :pswitch_2
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :pswitch_3
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :pswitch_4
    check-cast p1, Landroid/net/Uri;

    invoke-static {v1, p1}, Landroidx/core/content/IntentSanitizer$Builder;->ج(Ljava/lang/String;Landroid/net/Uri;)Z

    move-result p1

    return p1

    :pswitch_5
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :pswitch_6
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :pswitch_7
    check-cast p1, Landroid/net/Uri;

    invoke-static {v1, p1}, Landroidx/core/content/IntentSanitizer$Builder;->إ(Ljava/lang/String;Landroid/net/Uri;)Z

    move-result p1

    return p1

    :goto_0
    check-cast p1, Landroid/net/Uri;

    invoke-static {v1, p1}, Landroidx/core/content/IntentSanitizer$Builder;->ء(Ljava/lang/String;Landroid/net/Uri;)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
