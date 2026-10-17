.class public final Lآۋۻؾ۹/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lآۋۻؾ۹/ء;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lآۋۻؾ۹/ء;

    invoke-direct {v0}, Lآۋۻؾ۹/ء;-><init>()V

    sput-object v0, Lآۋۻؾ۹/ء;->؋:Lآۋۻؾ۹/ء;

    const-string v0, "logRequest"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lآۋۻؾ۹/ء;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    check-cast p1, Lآۋۻؾ۹/ذ;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    check-cast p1, Lآۋۻؾ۹/ب;

    iget-object p1, p1, Lآۋۻؾ۹/ب;->؋:Ljava/util/List;

    sget-object v0, Lآۋۻؾ۹/ء;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
