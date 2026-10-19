.class public final Lڒڦٶ٣٧/ؤ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑ٘ڰ٩ۓ۲ىښ/أ;


# static fields
.field public static final ؤ:Ljava/nio/charset/Charset;

.field public static final إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

.field public static final ا:Lڒ٠ئڿؕکڡ/؋;


# instance fields
.field public ؋:Ljava/io/OutputStream;

.field public final ؠ:Ljava/util/Map;

.field public final ء:Ljava/util/Map;

.field public final آ:Lڑ٘ڰ٩ۓ۲ىښ/آ;

.field public final أ:Lڒڦٶ٣٧/إ;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lڒڦٶ٣٧/ؤ;->ؤ:Ljava/nio/charset/Charset;

    const-string v0, "key"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lڒڦٶ٣٧/ؤ;->إ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    const-string v0, "value"

    invoke-static {v0}, Lڑ٘ڰ٩ۓ۲ىښ/ء;->؋(Ljava/lang/String;)Lآۋۻؾ۹/ة;

    move-result-object v0

    const/4 v2, 0x2

    invoke-static {v2, v0}, Landroidx/activity/result/؋;->ح(ILآۋۻؾ۹/ة;)Lڑ٘ڰ٩ۓ۲ىښ/ء;

    move-result-object v0

    sput-object v0, Lڒڦٶ٣٧/ؤ;->ئ:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    new-instance v0, Lڒ٠ئڿؕکڡ/؋;

    invoke-direct {v0, v1}, Lڒ٠ئڿؕکڡ/؋;-><init>(I)V

    sput-object v0, Lڒڦٶ٣٧/ؤ;->ا:Lڒ٠ئڿؕکڡ/؋;

    return-void
.end method

.method public constructor <init>(Ljava/io/ByteArrayOutputStream;Ljava/util/Map;Ljava/util/Map;Lڑ٘ڰ٩ۓ۲ىښ/آ;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lڒڦٶ٣٧/إ;

    invoke-direct {v0, p0}, Lڒڦٶ٣٧/إ;-><init>(Lڒڦٶ٣٧/ؤ;)V

    iput-object v0, p0, Lڒڦٶ٣٧/ؤ;->أ:Lڒڦٶ٣٧/إ;

    iput-object p1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    iput-object p2, p0, Lڒڦٶ٣٧/ؤ;->ؠ:Ljava/util/Map;

    iput-object p3, p0, Lڒڦٶ٣٧/ؤ;->ء:Ljava/util/Map;

    iput-object p4, p0, Lڒڦٶ٣٧/ؤ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/آ;

    return-void
.end method

.method public static إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I
    .locals 1

    const-class v0, Lڒڦٶ٣٧/أ;

    iget-object p0, p0, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/annotation/Annotation;

    check-cast p0, Lڒڦٶ٣٧/أ;

    if-eqz p0, :cond_0

    check-cast p0, Lڒڦٶ٣٧/؋;

    iget p0, p0, Lڒڦٶ٣٧/؋;->؋:I

    return p0

    :cond_0
    new-instance p0, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string v0, "Field has no @Protobuf config"

    invoke-direct {p0, v0}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final ؋(Lڑ٘ڰ٩ۓ۲ىښ/ء;J)Lڑ٘ڰ٩ۓ۲ىښ/أ;
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-class v0, Lڒڦٶ٣٧/أ;

    iget-object p1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/annotation/Annotation;

    check-cast p1, Lڒڦٶ٣٧/أ;

    if-eqz p1, :cond_1

    check-cast p1, Lڒڦٶ٣٧/؋;

    iget p1, p1, Lڒڦٶ٣٧/؋;->؋:I

    shl-int/lit8 p1, p1, 0x3

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    invoke-virtual {p0, p2, p3}, Lڒڦٶ٣٧/ؤ;->ا(J)V

    :goto_0
    return-object p0

    :cond_1
    new-instance p1, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string p2, "Field has no @Protobuf config"

    invoke-direct {p1, p2}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؠ(Lڑ٘ڰ٩ۓ۲ىښ/ء;I)Lڑ٘ڰ٩ۓ۲ىښ/أ;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lڒڦٶ٣٧/ؤ;->أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V

    return-object p0
.end method

.method public final ء(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)Lڒڦٶ٣٧/ؤ;
    .locals 4

    if-nez p2, :cond_0

    return-object p0

    :cond_0
    instance-of v0, p2, Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    check-cast p2, Ljava/lang/CharSequence;

    if-eqz p3, :cond_1

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p3

    if-nez p3, :cond_1

    return-object p0

    :cond_1
    invoke-static {p1}, Lڒڦٶ٣٧/ؤ;->إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I

    move-result p1

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lڒڦٶ٣٧/ؤ;->ؤ:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    array-length p2, p1

    invoke-virtual {p0, p2}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    iget-object p2, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    invoke-virtual {p2, p1}, Ljava/io/OutputStream;->write([B)V

    return-object p0

    :cond_2
    instance-of v0, p2, Ljava/util/Collection;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p0, p1, p3, v1}, Lڒڦٶ٣٧/ؤ;->ء(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)Lڒڦٶ٣٧/ؤ;

    goto :goto_0

    :cond_3
    return-object p0

    :cond_4
    instance-of v0, p2, Ljava/util/Map;

    if-eqz v0, :cond_6

    check-cast p2, Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    sget-object v0, Lڒڦٶ٣٧/ؤ;->ا:Lڒ٠ئڿؕکڡ/؋;

    invoke-virtual {p0, v0, p1, p3, v1}, Lڒڦٶ٣٧/ؤ;->ؤ(Lڑ٘ڰ٩ۓ۲ىښ/آ;Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)V

    goto :goto_1

    :cond_5
    return-object p0

    :cond_6
    instance-of v0, p2, Ljava/lang/Double;

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    if-eqz p3, :cond_7

    const-wide/16 p2, 0x0

    cmpl-double p2, v0, p2

    if-nez p2, :cond_7

    goto :goto_2

    :cond_7
    invoke-static {p1}, Lڒڦٶ٣٧/ؤ;->إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I

    move-result p1

    shl-int/lit8 p1, p1, 0x3

    or-int/2addr p1, v2

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    iget-object p1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    const/16 p2, 0x8

    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    sget-object p3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    :goto_2
    return-object p0

    :cond_8
    instance-of v0, p2, Ljava/lang/Float;

    if-eqz v0, :cond_a

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    if-eqz p3, :cond_9

    const/4 p3, 0x0

    cmpl-float p3, p2, p3

    if-nez p3, :cond_9

    goto :goto_3

    :cond_9
    invoke-static {p1}, Lڒڦٶ٣٧/ؤ;->إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I

    move-result p1

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x5

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    iget-object p1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    const/4 p3, 0x4

    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p3

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    :goto_3
    return-object p0

    :cond_a
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_d

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    if-eqz p3, :cond_b

    const-wide/16 p2, 0x0

    cmp-long p2, v0, p2

    if-nez p2, :cond_b

    goto :goto_4

    :cond_b
    const-class p2, Lڒڦٶ٣٧/أ;

    iget-object p1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/annotation/Annotation;

    check-cast p1, Lڒڦٶ٣٧/أ;

    if-eqz p1, :cond_c

    check-cast p1, Lڒڦٶ٣٧/؋;

    iget p1, p1, Lڒڦٶ٣٧/؋;->؋:I

    shl-int/lit8 p1, p1, 0x3

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    invoke-virtual {p0, v0, v1}, Lڒڦٶ٣٧/ؤ;->ا(J)V

    :goto_4
    return-object p0

    :cond_c
    new-instance p1, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string p2, "Field has no @Protobuf config"

    invoke-direct {p1, p2}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_d
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p0, p1, p2, p3}, Lڒڦٶ٣٧/ؤ;->أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V

    return-object p0

    :cond_e
    instance-of v0, p2, [B

    if-eqz v0, :cond_10

    check-cast p2, [B

    if-eqz p3, :cond_f

    array-length p3, p2

    if-nez p3, :cond_f

    return-object p0

    :cond_f
    invoke-static {p1}, Lڒڦٶ٣٧/ؤ;->إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I

    move-result p1

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    array-length p1, p2

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    iget-object p1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    return-object p0

    :cond_10
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v3, p0, Lڒڦٶ٣٧/ؤ;->ؠ:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڑ٘ڰ٩ۓ۲ىښ/آ;

    if-eqz v0, :cond_11

    invoke-virtual {p0, v0, p1, p2, p3}, Lڒڦٶ٣٧/ؤ;->ؤ(Lڑ٘ڰ٩ۓ۲ىښ/آ;Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)V

    return-object p0

    :cond_11
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v3, p0, Lڒڦٶ٣٧/ؤ;->ء:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lڑ٘ڰ٩ۓ۲ىښ/ؤ;

    if-eqz v0, :cond_12

    iget-object v2, p0, Lڒڦٶ٣٧/ؤ;->أ:Lڒڦٶ٣٧/إ;

    iput-boolean v1, v2, Lڒڦٶ٣٧/إ;->؋:Z

    iput-object p1, v2, Lڒڦٶ٣٧/إ;->ء:Lڑ٘ڰ٩ۓ۲ىښ/ء;

    iput-boolean p3, v2, Lڒڦٶ٣٧/إ;->ؠ:Z

    invoke-interface {v0, p2, v2}, Lڑ٘ڰ٩ۓ۲ىښ/؋;->؋(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_12
    instance-of v0, p2, Lڒڦٶ٣٧/ء;

    if-eqz v0, :cond_13

    check-cast p2, Lڒڦٶ٣٧/ء;

    invoke-interface {p2}, Lڒڦٶ٣٧/ء;->؋()I

    move-result p2

    invoke-virtual {p0, p1, p2, v2}, Lڒڦٶ٣٧/ؤ;->أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V

    return-object p0

    :cond_13
    instance-of v0, p2, Ljava/lang/Enum;

    if-eqz v0, :cond_14

    check-cast p2, Ljava/lang/Enum;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p0, p1, p2, v2}, Lڒڦٶ٣٧/ؤ;->أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V

    return-object p0

    :cond_14
    iget-object v0, p0, Lڒڦٶ٣٧/ؤ;->آ:Lڑ٘ڰ٩ۓ۲ىښ/آ;

    invoke-virtual {p0, v0, p1, p2, p3}, Lڒڦٶ٣٧/ؤ;->ؤ(Lڑ٘ڰ٩ۓ۲ىښ/آ;Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)V

    return-object p0
.end method

.method public final آ(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;)Lڑ٘ڰ٩ۓ۲ىښ/أ;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lڒڦٶ٣٧/ؤ;->ء(Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)Lڒڦٶ٣٧/ؤ;

    return-object p0
.end method

.method public final أ(Lڑ٘ڰ٩ۓ۲ىښ/ء;IZ)V
    .locals 0

    if-eqz p3, :cond_0

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-class p3, Lڒڦٶ٣٧/أ;

    iget-object p1, p1, Lڑ٘ڰ٩ۓ۲ىښ/ء;->ؠ:Ljava/util/Map;

    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/annotation/Annotation;

    check-cast p1, Lڒڦٶ٣٧/أ;

    if-eqz p1, :cond_1

    check-cast p1, Lڒڦٶ٣٧/؋;

    iget p1, p1, Lڒڦٶ٣٧/؋;->؋:I

    shl-int/lit8 p1, p1, 0x3

    invoke-virtual {p0, p1}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    invoke-virtual {p0, p2}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    return-void

    :cond_1
    new-instance p1, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;

    const-string p2, "Field has no @Protobuf config"

    invoke-direct {p1, p2}, Lڑ٘ڰ٩ۓ۲ىښ/ؠ;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final ؤ(Lڑ٘ڰ٩ۓ۲ىښ/آ;Lڑ٘ڰ٩ۓ۲ىښ/ء;Ljava/lang/Object;Z)V
    .locals 5

    new-instance v0, Lڒڦٶ٣٧/ؠ;

    invoke-direct {v0}, Lڒڦٶ٣٧/ؠ;-><init>()V

    :try_start_0
    iget-object v1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    iput-object v0, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {p1, p3, p0}, Lڑ٘ڰ٩ۓ۲ىښ/؋;->؋(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iput-object v1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    iget-wide v1, v0, Lڒڦٶ٣٧/ؠ;->آ:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    if-eqz p4, :cond_0

    const-wide/16 v3, 0x0

    cmp-long p4, v1, v3

    if-nez p4, :cond_0

    return-void

    :cond_0
    invoke-static {p2}, Lڒڦٶ٣٧/ؤ;->إ(Lڑ٘ڰ٩ۓ۲ىښ/ء;)I

    move-result p2

    shl-int/lit8 p2, p2, 0x3

    or-int/lit8 p2, p2, 0x2

    invoke-virtual {p0, p2}, Lڒڦٶ٣٧/ؤ;->ئ(I)V

    invoke-virtual {p0, v1, v2}, Lڒڦٶ٣٧/ؤ;->ا(J)V

    invoke-interface {p1, p3, p0}, Lڑ٘ڰ٩ۓ۲ىښ/؋;->؋(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_3
    iput-object v1, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p1
.end method

.method public final ئ(I)V
    .locals 4

    :goto_0
    and-int/lit8 v0, p1, -0x80

    int-to-long v0, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    and-int/lit8 v1, p1, 0x7f

    or-int/lit16 v1, v1, 0x80

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    ushr-int/lit8 p1, p1, 0x7

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    and-int/lit8 p1, p1, 0x7f

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void
.end method

.method public final ا(J)V
    .locals 4

    :goto_0
    const-wide/16 v0, -0x80

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    long-to-int v1, p1

    and-int/lit8 v1, v1, 0x7f

    or-int/lit16 v1, v1, 0x80

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    const/4 v0, 0x7

    ushr-long/2addr p1, v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lڒڦٶ٣٧/ؤ;->؋:Ljava/io/OutputStream;

    long-to-int p1, p1

    and-int/lit8 p1, p1, 0x7f

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void
.end method
