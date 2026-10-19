.class public final Lڦڶٛۯ/ء;
.super Lڦڶٛۯ/أ;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lڲږڠ/؋;


# instance fields
.field public final synthetic إ:I


# direct methods
.method public constructor <init>(Lڦڶٛۯ/ؤ;I)V
    .locals 2

    iput p2, p0, Lڦڶٛۯ/ء;->إ:I

    const/4 v0, 0x1

    const-string v1, "map"

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lڦڶٛۯ/أ;-><init>(Lڦڶٛۯ/ؤ;)V

    return-void

    :cond_0
    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lڦڶٛۯ/أ;-><init>(Lڦڶٛۯ/ؤ;)V

    return-void

    :cond_1
    invoke-static {p1, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lڦڶٛۯ/أ;-><init>(Lڦڶٛۯ/ؤ;)V

    return-void
.end method


# virtual methods
.method public final next()Ljava/lang/Object;
    .locals 3

    iget v0, p0, Lڦڶٛۯ/ء;->إ:I

    iget-object v1, p0, Lڦڶٛۯ/أ;->آ:Lڦڶٛۯ/ؤ;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lڦڶٛۯ/أ;->أ:I

    iget v2, v1, Lڦڶٛۯ/ؤ;->ا:I

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lڦڶٛۯ/أ;->أ:I

    iput v0, p0, Lڦڶٛۯ/أ;->ؤ:I

    iget-object v1, v1, Lڦڶٛۯ/ؤ;->آ:[Ljava/lang/Object;

    aget-object v0, v1, v0

    invoke-virtual {p0}, Lڦڶٛۯ/أ;->؋()V

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :pswitch_1
    iget v0, p0, Lڦڶٛۯ/أ;->أ:I

    iget v2, v1, Lڦڶٛۯ/ؤ;->ا:I

    if-ge v0, v2, :cond_1

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lڦڶٛۯ/أ;->أ:I

    iput v0, p0, Lڦڶٛۯ/أ;->ؤ:I

    new-instance v2, Lڦڶٛۯ/آ;

    invoke-direct {v2, v1, v0}, Lڦڶٛۯ/آ;-><init>(Lڦڶٛۯ/ؤ;I)V

    invoke-virtual {p0}, Lڦڶٛۯ/أ;->؋()V

    return-object v2

    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :goto_0
    iget v0, p0, Lڦڶٛۯ/أ;->أ:I

    iget v2, v1, Lڦڶٛۯ/ؤ;->ا:I

    if-ge v0, v2, :cond_2

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lڦڶٛۯ/أ;->أ:I

    iput v0, p0, Lڦڶٛۯ/أ;->ؤ:I

    iget-object v0, v1, Lڦڶٛۯ/ؤ;->أ:[Ljava/lang/Object;

    invoke-static {v0}, Lڗًقڔ/؋;->ا(Ljava/lang/Object;)V

    iget v1, p0, Lڦڶٛۯ/أ;->ؤ:I

    aget-object v0, v0, v1

    invoke-virtual {p0}, Lڦڶٛۯ/أ;->؋()V

    return-object v0

    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
