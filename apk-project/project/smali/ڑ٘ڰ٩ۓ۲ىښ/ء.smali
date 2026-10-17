.class public final Lڑ٘ڰ٩ۓ۲ىښ/ء;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final ؋:Ljava/lang/String;

.field public final ؠ:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋:Ljava/lang/String;

    iput-object p2, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    return-void
.end method

.method public static ؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;
    .locals 2

    new-instance v0, Lآۋۻؾ۹/ة;

    const/16 v1, 0x13

    invoke-direct {v0, v1, p0}, Lآۋۻؾ۹/ة;-><init>(ILjava/lang/Object;)V

    return-object v0
.end method

.method public static ؠ(Ljava/lang/String;)Lڑ٘ڰ٩ۓ۲ىښ/ء;
    .locals 2

    new-instance v0, Lڑ٘ڰ٩ۓ۲ىښ/ء;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lڑ٘ڰ٩ۓ۲ىښ/ء;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iget-object v1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋:Ljava/lang/String;

    iget-object v3, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    iget-object p1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FieldDescriptor{name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", properties="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
