.class public final Lأۺؘٻڣ/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lأۺؘٻڣ/؋;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lأۺؘٻڣ/؋;

    invoke-direct {v0}, Lأۺؘٻڣ/؋;-><init>()V

    sput-object v0, Lأۺؘٻڣ/؋;->؋:Lأۺؘٻڣ/؋;

    const-string v0, "window"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/؋;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "logSourceMetrics"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/؋;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "globalMetrics"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/؋;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "appNamespace"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/؋;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Lإۺهؑڋڻ/؋;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    iget-object v0, p1, Lإۺهؑڋڻ/؋;->؋:Lإۺهؑڋڻ/إ;

    sget-object v1, Lأۺؘٻڣ/؋;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lأۺؘٻڣ/؋;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lإۺهؑڋڻ/؋;->ؠ:Ljava/util/List;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lأۺؘٻڣ/؋;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lإۺهؑڋڻ/؋;->ء:Lإۺهؑڋڻ/ؠ;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lأۺؘٻڣ/؋;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object p1, p1, Lإۺهؑڋڻ/؋;->آ:Ljava/lang/String;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
