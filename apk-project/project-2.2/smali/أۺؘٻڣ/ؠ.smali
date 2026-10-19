.class public final Lأۺؘٻڣ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lأۺؘٻڣ/ؠ;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lأۺؘٻڣ/ؠ;

    invoke-direct {v0}, Lأۺؘٻڣ/ؠ;-><init>()V

    sput-object v0, Lأۺؘٻڣ/ؠ;->؋:Lأۺؘٻڣ/ؠ;

    const-string v0, "storageMetrics"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/ؠ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    check-cast p1, Lإۺهؑڋڻ/ؠ;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    iget-object p1, p1, Lإۺهؑڋڻ/ؠ;->؋:Lإۺهؑڋڻ/ؤ;

    sget-object v0, Lأۺؘٻڣ/ؠ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v0, p1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
