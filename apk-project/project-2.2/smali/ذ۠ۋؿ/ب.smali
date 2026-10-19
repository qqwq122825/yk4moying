.class public final Lذ۠ۋؿ/ب;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/؋;
.implements Lؾپۑ۟ڂڷ/ئ;
.implements Lڨڡئٸت/ئ;


# static fields
.field public static آ:Lذ۠ۋؿ/ب;

.field public static final أ:Lذ۠ۋؿ/ب;

.field public static final synthetic ؤ:Lذ۠ۋؿ/ب;

.field public static final synthetic إ:Lذ۠ۋؿ/ب;

.field public static final ئ:Lذ۠ۋؿ/ب;

.field public static final ا:Lذ۠ۋؿ/ب;

.field public static final synthetic ب:Lذ۠ۋؿ/ب;

.field public static final synthetic ة:Lذ۠ۋؿ/ب;

.field public static final synthetic ت:Lذ۠ۋؿ/ب;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->أ:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ؤ:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->إ:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ئ:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ا:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ب:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ة:Lذ۠ۋؿ/ب;

    new-instance v0, Lذ۠ۋؿ/ب;

    invoke-direct {v0}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v0, Lذ۠ۋؿ/ب;->ت:Lذ۠ۋؿ/ب;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILٽچڃ/ب;Landroid/graphics/Rect;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget p1, p6, Landroid/graphics/Rect;->left:I

    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    iget p1, p6, Landroid/graphics/Rect;->top:I

    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    iget p1, p6, Landroid/graphics/Rect;->right:I

    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    iget p1, p6, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkArgumentNonnegative(I)I

    return-void
.end method

.method public static ء(Landroid/content/Context;I)Lذ۠ۋؿ/ب;
    .locals 12

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const-string v3, "Cannot create a CalendarItemStyle with a styleResId of 0"

    invoke-static {v2, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    sget-object v2, Lؾٿټڷ/؋;->ث:[I

    invoke-virtual {p0, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    const/4 v4, 0x3

    invoke-virtual {p1, v4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11, v2, v3, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v0, 0x4

    invoke-static {p0, p1, v0}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    const/16 v0, 0x9

    invoke-static {p0, p1, v0}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v7

    const/4 v0, 0x7

    invoke-static {p0, p1, v0}, Lٹۧ٥ؐح/ء;->؋(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/16 v0, 0x8

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    const/4 v0, 0x5

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    const/4 v2, 0x6

    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    new-instance v3, Lٽچڃ/؋;

    int-to-float v1, v1

    invoke-direct {v3, v1}, Lٽچڃ/؋;-><init>(F)V

    invoke-static {p0, v0, v2, v3}, Lٽچڃ/ب;->؋(Landroid/content/Context;IILٽچڃ/؋;)Lآۋۻؾ۹/ئ;

    move-result-object p0

    new-instance v10, Lٽچڃ/ب;

    invoke-direct {v10, p0}, Lٽچڃ/ب;-><init>(Lآۋۻؾ۹/ئ;)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p0, Lذ۠ۋؿ/ب;

    move-object v5, p0

    invoke-direct/range {v5 .. v11}, Lذ۠ۋؿ/ب;-><init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILٽچڃ/ب;Landroid/graphics/Rect;)V

    return-object p0
.end method

.method public static declared-synchronized أ()Lذ۠ۋؿ/ب;
    .locals 2

    const-class v0, Lذ۠ۋؿ/ب;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lذ۠ۋؿ/ب;->آ:Lذ۠ۋؿ/ب;

    if-nez v1, :cond_0

    new-instance v1, Lذ۠ۋؿ/ب;

    invoke-direct {v1}, Lذ۠ۋؿ/ب;-><init>()V

    sput-object v1, Lذ۠ۋؿ/ب;->آ:Lذ۠ۋؿ/ب;

    :cond_0
    sget-object v1, Lذ۠ۋؿ/ب;->آ:Lذ۠ۋؿ/ب;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public ؋(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;
    .locals 1

    check-cast p1, Landroid/os/Bundle;

    sget v0, Lحظتۢۋۜآظ/ؠ;->ئ:I

    if-eqz p1, :cond_0

    const-string v0, "google.messenger"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/4 p1, 0x0

    :cond_1
    invoke-static {p1}, Lڃٷښـ۝ۼ/ؠ;->ئ(Ljava/lang/Object;)Lؾپۑ۟ڂڷ/ح;

    move-result-object p1

    return-object p1
.end method

.method public ؠ(Lڑۣػٻٷج/؋;)V
    .locals 2

    sget-object v0, Lآۋۻؾ۹/ء;->؋:Lآۋۻؾ۹/ء;

    check-cast p1, Lڒ٠ئڿؕکڡ/آ;

    const-class v1, Lآۋۻؾ۹/ذ;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/ب;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    sget-object v0, Lآۋۻؾ۹/ؤ;->؋:Lآۋۻؾ۹/ؤ;

    const-class v1, Lآۋۻؾ۹/ش;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/ح;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    sget-object v0, Lآۋۻؾ۹/آ;->؋:Lآۋۻؾ۹/آ;

    const-class v1, Lآۋۻؾ۹/ز;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/ت;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    sget-object v0, Lآۋۻؾ۹/ؠ;->؋:Lآۋۻؾ۹/ؠ;

    const-class v1, Lآۋۻؾ۹/؋;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/ا;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    sget-object v0, Lآۋۻؾ۹/أ;->؋:Lآۋۻؾ۹/أ;

    const-class v1, Lآۋۻؾ۹/س;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/ج;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    sget-object v0, Lآۋۻؾ۹/إ;->؋:Lآۋۻؾ۹/إ;

    const-class v1, Lآۋۻؾ۹/ط;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    const-class v1, Lآۋۻؾ۹/د;

    invoke-virtual {p1, v1, v0}, Lڒ٠ئڿؕکڡ/آ;->؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;

    return-void
.end method

.method public آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 3

    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->إ()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    return-object p1

    :cond_0
    const-string v0, "Rpc"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error making request: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->أ()Ljava/lang/Exception;

    move-result-object p1

    const-string v1, "SERVICE_NOT_AVAILABLE"

    invoke-direct {v0, v1, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
