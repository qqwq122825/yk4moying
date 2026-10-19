.class public final Lڒڦٶ٣٧/إ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/إ;


# instance fields
.field public ؋:Z

.field public ؠ:Z

.field public ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public final آ:Lڒڦٶ٣٧/ؤ;


# direct methods
.method public constructor <init>(Lڒڦٶ٣٧/ؤ;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lڒڦٶ٣٧/إ;->؋:Z

    iput-boolean v0, p0, Lڒڦٶ٣٧/إ;->ؠ:Z

    iput-object p1, p0, Lڒڦٶ٣٧/إ;->آ:Lڒڦٶ٣٧/ؤ;

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/إ;
    .locals 3

    iget-boolean v0, p0, Lڒڦٶ٣٧/إ;->؋:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lڒڦٶ٣٧/إ;->؋:Z

    iget-object v0, p0, Lڒڦٶ٣٧/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-boolean v1, p0, Lڒڦٶ٣٧/إ;->ؠ:Z

    iget-object v2, p0, Lڒڦٶ٣٧/إ;->آ:Lڒڦٶ٣٧/ؤ;

    invoke-virtual {v2, v0, p1, v1}, Lڒڦٶ٣٧/ؤ;->ء(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)Lڒڦٶ٣٧/ؤ;

    return-object p0

    :cond_0
    new-instance p1, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string v0, "Cannot encode a second value in the ValueEncoderContext"

    invoke-direct {p1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ء(Z)Lڑ٘ڰ٩ۓ۲ىښ/إ;
    .locals 3

    iget-boolean v0, p0, Lڒڦٶ٣٧/إ;->؋:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lڒڦٶ٣٧/إ;->؋:Z

    iget-object v0, p0, Lڒڦٶ٣٧/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-boolean v1, p0, Lڒڦٶ٣٧/إ;->ؠ:Z

    iget-object v2, p0, Lڒڦٶ٣٧/إ;->آ:Lڒڦٶ٣٧/ؤ;

    invoke-virtual {v2, v0, p1, v1}, Lڒڦٶ٣٧/ؤ;->أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V

    return-object p0

    :cond_0
    new-instance p1, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string v0, "Cannot encode a second value in the ValueEncoderContext"

    invoke-direct {p1, v0}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1
.end method
