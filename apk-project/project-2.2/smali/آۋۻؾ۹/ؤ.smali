.class public final Lآۋۻؾ۹/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lآۋۻؾ۹/ؤ;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ؤ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lآۋۻؾ۹/ؤ;

    invoke-direct {v0}, Lآۋۻؾ۹/ؤ;-><init>()V

    sput-object v0, Lآۋۻؾ۹/ؤ;->؋:Lآۋۻؾ۹/ؤ;

    const-string v0, "requestTimeMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "requestUptimeMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "clientInfo"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "logSource"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "logSourceName"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->ؤ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "logEvent"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "qosTier"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ؤ;->ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    check-cast p1, Lآۋۻؾ۹/ش;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    check-cast p1, Lآۋۻؾ۹/ح;

    iget-wide v0, p1, Lآۋۻؾ۹/ح;->؋:J

    sget-object v2, Lآۋۻؾ۹/ؤ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    iget-wide v0, p1, Lآۋۻؾ۹/ح;->ؠ:J

    sget-object v2, Lآۋۻؾ۹/ؤ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/ؤ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ح;->ء:Lآۋۻؾ۹/ز;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/ؤ;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ح;->آ:Ljava/lang/Integer;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/ؤ;->ؤ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ح;->أ:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/ؤ;->إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ح;->ؤ:Ljava/util/List;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/ؤ;->ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object p1, p1, Lآۋۻؾ۹/ح;->إ:Lآۋۻؾ۹/ظ;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
