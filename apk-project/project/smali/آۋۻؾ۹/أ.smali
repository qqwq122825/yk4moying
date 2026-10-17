.class public final Lآۋۻؾ۹/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lآۋۻؾ۹/أ;

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

    new-instance v0, Lآۋۻؾ۹/أ;

    invoke-direct {v0}, Lآۋۻؾ۹/أ;-><init>()V

    sput-object v0, Lآۋۻؾ۹/أ;->؋:Lآۋۻؾ۹/أ;

    const-string v0, "eventTimeMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "eventCode"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "eventUptimeMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "sourceExtension"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "sourceExtensionJsonProto3"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->ؤ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "timezoneOffsetSeconds"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "networkConnectionInfo"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/أ;->ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    check-cast p1, Lآۋۻؾ۹/س;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    check-cast p1, Lآۋۻؾ۹/ج;

    iget-wide v0, p1, Lآۋۻؾ۹/ج;->؋:J

    sget-object v2, Lآۋۻؾ۹/أ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    iget-object v0, p1, Lآۋۻؾ۹/ج;->ؠ:Ljava/lang/Integer;

    sget-object v1, Lآۋۻؾ۹/أ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/أ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-wide v1, p1, Lآۋۻؾ۹/ج;->ء:J

    invoke-interface {p2, v0, v1, v2}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/أ;->أ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ج;->آ:[B

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/أ;->ؤ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lآۋۻؾ۹/ج;->أ:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/أ;->إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-wide v1, p1, Lآۋۻؾ۹/ج;->ؤ:J

    invoke-interface {p2, v0, v1, v2}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/أ;->ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object p1, p1, Lآۋۻؾ۹/ج;->إ:Lآۋۻؾ۹/ط;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
