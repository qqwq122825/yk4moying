.class public final Lڹےف/إ;
.super Lkotlin/jvm/internal/ب;
.source "SourceFile"

# interfaces
.implements Lڲٱۘۑدٿٰ/خ;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Z

.field public final synthetic ؤ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ZI)V
    .locals 0

    iput p3, p0, Lڹےف/إ;->آ:I

    iput-object p1, p0, Lڹےف/إ;->ؤ:Ljava/lang/Object;

    iput-boolean p2, p0, Lڹےف/إ;->أ:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/ب;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lڹےف/إ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast p1, Ljava/lang/CharSequence;

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lڹےف/إ;->؋(Ljava/lang/CharSequence;I)Lڡُؑڨ/آ;

    move-result-object p1

    return-object p1

    :pswitch_1
    check-cast p1, Ljava/lang/CharSequence;

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lڹےف/إ;->؋(Ljava/lang/CharSequence;I)Lڡُؑڨ/آ;

    move-result-object p1

    return-object p1

    :goto_0
    check-cast p1, Lڨڡئٸت/ا;

    check-cast p2, Lڨڡئٸت/إ;

    invoke-interface {p1, p2}, Lڨڡئٸت/ا;->plus(Lڨڡئٸت/ا;)Lڨڡئٸت/ا;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final ؋(Ljava/lang/CharSequence;I)Lڡُؑڨ/آ;
    .locals 13

    iget v0, p0, Lڹےف/إ;->آ:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lڹےف/إ;->ؤ:Ljava/lang/Object;

    const-string v4, "$this$$receiver"

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-static {p1, v4}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, [C

    iget-boolean v0, p0, Lڹےف/إ;->أ:Z

    invoke-static {p2, p1, v0, v3}, Lڹےف/ئ;->ڡ(ILjava/lang/CharSequence;Z[C)I

    move-result p1

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance v1, Lڡُؑڨ/آ;

    invoke-direct {v1, p1, p2}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-object v1

    :goto_1
    invoke-static {p1, v4}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/util/List;

    iget-boolean v0, p0, Lڹےف/إ;->أ:Z

    const/4 v4, 0x0

    if-nez v0, :cond_4

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v5

    if-ne v5, v2, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_3

    if-ne v0, v2, :cond_2

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v2, 0x4

    invoke-static {p1, v0, p2, v4, v2}, Lڹےف/ئ;->ڠ(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result p1

    if-gez p1, :cond_1

    goto/16 :goto_6

    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lڡُؑڨ/آ;

    invoke-direct {p2, p1, v0}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_7

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "List has more than one element."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/util/NoSuchElementException;

    const-string p2, "List is empty."

    invoke-direct {p1, p2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance v2, Lڶڍۭۗ/آ;

    if-gez p2, :cond_5

    move p2, v4

    :cond_5
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-direct {v2, p2, v4}, Lڶڍۭۗ/آ;-><init>(II)V

    instance-of v4, p1, Ljava/lang/String;

    iget v10, v2, Lڶڍۭۗ/ؠ;->ؤ:I

    iget v2, v2, Lڶڍۭۗ/ؠ;->أ:I

    if-eqz v4, :cond_b

    if-lez v10, :cond_6

    if-le p2, v2, :cond_7

    :cond_6
    if-gez v10, :cond_11

    if-gt v2, p2, :cond_11

    :cond_7
    :goto_2
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_8
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v4, v12

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    move v6, v0

    move v8, p2

    invoke-static/range {v4 .. v9}, Lڹےف/ئ;->ڥ(Ljava/lang/String;IZLjava/lang/String;II)Z

    move-result v4

    if-eqz v4, :cond_8

    goto :goto_3

    :cond_9
    move-object v12, v1

    :goto_3
    check-cast v12, Ljava/lang/String;

    if-eqz v12, :cond_a

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lڡُؑڨ/آ;

    invoke-direct {p2, p1, v12}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_7

    :cond_a
    if-eq p2, v2, :cond_11

    add-int/2addr p2, v10

    goto :goto_2

    :cond_b
    if-lez v10, :cond_c

    if-le p2, v2, :cond_d

    :cond_c
    if-gez v10, :cond_11

    if-gt v2, p2, :cond_11

    :cond_d
    :goto_4
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v4, v12

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    move-object v6, p1

    move v7, p2

    move v9, v0

    invoke-static/range {v4 .. v9}, Lڹےف/ئ;->ڦ(Ljava/lang/CharSequence;ILjava/lang/CharSequence;IIZ)Z

    move-result v4

    if-eqz v4, :cond_e

    goto :goto_5

    :cond_f
    move-object v12, v1

    :goto_5
    check-cast v12, Ljava/lang/String;

    if-eqz v12, :cond_10

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lڡُؑڨ/آ;

    invoke-direct {p2, p1, v12}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_7

    :cond_10
    if-eq p2, v2, :cond_11

    add-int/2addr p2, v10

    goto :goto_4

    :cond_11
    :goto_6
    move-object p2, v1

    :goto_7
    if-eqz p2, :cond_12

    iget-object p1, p2, Lڡُؑڨ/آ;->أ:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance v1, Lڡُؑڨ/آ;

    iget-object p2, p2, Lڡُؑڨ/آ;->آ:Ljava/lang/Object;

    invoke-direct {v1, p2, p1}, Lڡُؑڨ/آ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_12
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
