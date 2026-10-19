.class public final Lأۺؘٻڣ/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/آ;


# static fields
.field public static final ؋:Lأۺؘٻڣ/إ;

.field public static final ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lأۺؘٻڣ/إ;

    invoke-direct {v0}, Lأۺؘٻڣ/إ;-><init>()V

    sput-object v0, Lأۺؘٻڣ/إ;->؋:Lأۺؘٻڣ/إ;

    const-string v0, "startMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/إ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "endMs"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lأۺؘٻڣ/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    check-cast p1, Lإۺهؑڋڻ/إ;

    check-cast p2, Lڑ٘ڰ٩ۓ۲ىښ/أ;

    iget-wide v0, p1, Lإۺهؑڋڻ/إ;->؋:J

    sget-object v2, Lأۺؘٻڣ/إ;->ؠ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-interface {p2, v2, v0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    sget-object v0, Lأۺؘٻڣ/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-wide v1, p1, Lإۺهؑڋڻ/إ;->ؠ:J

    invoke-interface {p2, v0, v1, v2}, Lڑ٘ڰ٩ۓ۲ىښ/أ;->؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;

    return-void
.end method
