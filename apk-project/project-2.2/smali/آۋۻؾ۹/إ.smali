.class public final Lآۋۻؾ۹/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lآۋۻؾ۹/إ;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lآۋۻؾ۹/إ;

    invoke-direct {v0}, Lآۋۻؾ۹/إ;-><init>()V

    sput-object v0, Lآۋۻؾ۹/إ;->؋:Lآۋۻؾ۹/إ;

    const-string v0, "networkType"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/إ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "mobileSubtype"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Lآۋۻؾ۹/ط;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    check-cast p1, Lآۋۻؾ۹/د;

    iget-object v0, p1, Lآۋۻؾ۹/د;->؋:Lآۋۻؾ۹/ض;

    sget-object v1, Lآۋۻؾ۹/إ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lآۋۻؾ۹/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object p1, p1, Lآۋۻؾ۹/د;->ؠ:Lآۋۻؾ۹/ص;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
