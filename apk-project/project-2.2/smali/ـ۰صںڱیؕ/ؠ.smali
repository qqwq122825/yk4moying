.class public final Lـ۰صںڱیؕ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$ClassLoaderCreator;


# instance fields
.field public final synthetic ؋:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lـ۰صںڱیؕ/ؠ;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lـ۰صںڱیؕ/ؠ;->؋:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lپٲصذ۰۱إ/آ;

    invoke-direct {v0, p1, v1}, Lپٲصذ۰۱إ/آ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_1
    new-instance v0, Lٹ؅ڟ؀ە/؋;

    invoke-direct {v0, p1, v1}, Lٹ؅ڟ؀ە/؋;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_2
    new-instance v0, Lندۑ۠/ؠ;

    invoke-direct {v0, p1, v1}, Lندۑ۠/ؠ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_3
    new-instance v0, Lك۰ێخڊعءآ/ؤ;

    invoke-direct {v0, p1, v1}, Lك۰ێخڊعءآ/ؤ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_4
    new-instance v0, Lـ۰صںڱیؕ/ء;

    invoke-direct {v0, p1, v1}, Lـ۰صںڱیؕ/ء;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :goto_0
    new-instance v0, Lٿخ۴۟ؽ/ػ;

    invoke-direct {v0, p1, v1}, Lٿخ۴۟ؽ/ػ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final createFromParcel(Landroid/os/Parcel;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lـ۰صںڱیؕ/ؠ;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lپٲصذ۰۱إ/آ;

    invoke-direct {v0, p1, p2}, Lپٲصذ۰۱إ/آ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_1
    new-instance v0, Lٹ؅ڟ؀ە/؋;

    invoke-direct {v0, p1, p2}, Lٹ؅ڟ؀ە/؋;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_2
    new-instance v0, Lندۑ۠/ؠ;

    invoke-direct {v0, p1, p2}, Lندۑ۠/ؠ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_3
    new-instance v0, Lك۰ێخڊعءآ/ؤ;

    invoke-direct {v0, p1, p2}, Lك۰ێخڊعءآ/ؤ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_4
    new-instance v0, Lـ۰صںڱیؕ/ء;

    invoke-direct {v0, p1, p2}, Lـ۰صںڱیؕ/ء;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :goto_0
    new-instance v0, Lٿخ۴۟ؽ/ػ;

    invoke-direct {v0, p1, p2}, Lٿخ۴۟ؽ/ػ;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lـ۰صںڱیؕ/ؠ;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-array p1, p1, [Lپٲصذ۰۱إ/آ;

    return-object p1

    :pswitch_1
    new-array p1, p1, [Lٹ؅ڟ؀ە/؋;

    return-object p1

    :pswitch_2
    new-array p1, p1, [Lندۑ۠/ؠ;

    return-object p1

    :pswitch_3
    new-array p1, p1, [Lك۰ێخڊعءآ/ؤ;

    return-object p1

    :pswitch_4
    new-array p1, p1, [Lـ۰صںڱیؕ/ء;

    return-object p1

    :goto_0
    new-array p1, p1, [Lٿخ۴۟ؽ/ػ;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
