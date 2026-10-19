.class public Lٽچڃ/أ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lإۊ۲ڽِٓر/ؠ;
.implements Lڊ۟چڗۙ٦/إ;


# static fields
.field public static أ:Lٽچڃ/أ;


# instance fields
.field public final آ:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lٽچڃ/أ;->آ:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(II)V
    .locals 0

    iput p1, p0, Lٽچڃ/أ;->آ:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 p1, 0x10

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_1
    const/16 p1, 0xf

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_2
    const/16 p1, 0xe

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_3
    const/16 p1, 0xd

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_4
    const/16 p1, 0xc

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_5
    const/16 p1, 0xb

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_6
    const/16 p1, 0xa

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :goto_0
    const/16 p1, 0x9

    invoke-direct {p0, p1}, Lٽچڃ/أ;-><init>(I)V

    return-void

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static ؠ(JLۀۗ۱/ب;ILjava/util/ArrayList;IILjava/util/ArrayList;)V
    .locals 21

    move-object/from16 v0, p2

    move/from16 v1, p3

    move-object/from16 v10, p4

    move/from16 v2, p5

    move/from16 v11, p6

    move-object/from16 v12, p7

    if-ge v2, v11, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const-string v6, "Failed requirement."

    if-eqz v5, :cond_14

    move v5, v2

    :goto_1
    if-ge v5, v11, :cond_3

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lۀۗ۱/ث;

    invoke-virtual {v7}, Lۀۗ۱/ث;->ء()I

    move-result v7

    if-lt v7, v1, :cond_1

    const/4 v7, 0x1

    goto :goto_2

    :cond_1
    const/4 v7, 0x0

    :goto_2
    if-eqz v7, :cond_2

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    invoke-virtual/range {p4 .. p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lۀۗ۱/ث;

    add-int/lit8 v6, v11, -0x1

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lۀۗ۱/ث;

    invoke-virtual {v5}, Lۀۗ۱/ث;->ء()I

    move-result v7

    const/4 v13, -0x1

    if-ne v1, v7, :cond_4

    invoke-interface {v12, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lۀۗ۱/ث;

    move-object/from16 v20, v7

    move v7, v2

    move v2, v5

    move-object/from16 v5, v20

    goto :goto_3

    :cond_4
    move v7, v2

    move v2, v13

    :goto_3
    invoke-virtual {v5, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v8

    invoke-virtual {v6, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v9

    const/4 v14, 0x2

    const/4 v15, 0x4

    if-eq v8, v9, :cond_e

    add-int/lit8 v3, v7, 0x1

    const/4 v4, 0x1

    :goto_4
    if-ge v3, v11, :cond_6

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lۀۗ۱/ث;

    invoke-virtual {v5, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v5

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lۀۗ۱/ث;

    invoke-virtual {v6, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v6

    if-eq v5, v6, :cond_5

    add-int/lit8 v4, v4, 0x1

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_6
    iget-wide v5, v0, Lۀۗ۱/ب;->أ:J

    int-to-long v8, v15

    div-long/2addr v5, v8

    add-long v5, v5, p0

    int-to-long v14, v14

    add-long/2addr v5, v14

    mul-int/lit8 v3, v4, 0x2

    int-to-long v14, v3

    add-long/2addr v14, v5

    invoke-virtual {v0, v4}, Lۀۗ۱/ب;->ٱ(I)V

    invoke-virtual {v0, v2}, Lۀۗ۱/ب;->ٱ(I)V

    move v2, v7

    :goto_5
    if-ge v2, v11, :cond_9

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lۀۗ۱/ث;

    invoke-virtual {v3, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v3

    if-eq v2, v7, :cond_7

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lۀۗ۱/ث;

    invoke-virtual {v4, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v4

    if-eq v3, v4, :cond_8

    :cond_7
    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v0, v3}, Lۀۗ۱/ب;->ٱ(I)V

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_9
    new-instance v6, Lۀۗ۱/ب;

    invoke-direct {v6}, Lۀۗ۱/ب;-><init>()V

    :goto_6
    if-ge v7, v11, :cond_d

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lۀۗ۱/ث;

    invoke-virtual {v2, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v2

    add-int/lit8 v3, v7, 0x1

    move v4, v3

    :goto_7
    if-ge v4, v11, :cond_b

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lۀۗ۱/ث;

    invoke-virtual {v5, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v5

    if-eq v2, v5, :cond_a

    move v5, v4

    goto :goto_8

    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_b
    move v5, v11

    :goto_8
    if-ne v3, v5, :cond_c

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lۀۗ۱/ث;

    invoke-virtual {v3}, Lۀۗ۱/ث;->ء()I

    move-result v3

    if-ne v2, v3, :cond_c

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lۀۗ۱/ب;->ٱ(I)V

    move/from16 v17, v5

    move-object v13, v6

    move-wide/from16 v18, v8

    goto :goto_9

    :cond_c
    iget-wide v2, v6, Lۀۗ۱/ب;->أ:J

    div-long/2addr v2, v8

    add-long/2addr v2, v14

    long-to-int v2, v2

    mul-int/2addr v2, v13

    invoke-virtual {v0, v2}, Lۀۗ۱/ب;->ٱ(I)V

    add-int/lit8 v16, v1, 0x1

    move-wide v2, v14

    move-object v4, v6

    move/from16 v17, v5

    move/from16 v5, v16

    move-object v13, v6

    move-object/from16 v6, p4

    move-wide/from16 v18, v8

    move/from16 v8, v17

    move-object/from16 v9, p7

    invoke-static/range {v2 .. v9}, Lٽچڃ/أ;->ؠ(JLۀۗ۱/ب;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    :goto_9
    move-object v6, v13

    move/from16 v7, v17

    move-wide/from16 v8, v18

    const/4 v13, -0x1

    goto :goto_6

    :cond_d
    move-object v13, v6

    goto/16 :goto_d

    :cond_e
    invoke-virtual {v5}, Lۀۗ۱/ث;->ء()I

    move-result v8

    invoke-virtual {v6}, Lۀۗ۱/ث;->ء()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    move v9, v1

    const/4 v13, 0x0

    :goto_a
    if-ge v9, v8, :cond_f

    invoke-virtual {v5, v9}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v3

    invoke-virtual {v6, v9}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v4

    if-ne v3, v4, :cond_f

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    :cond_f
    iget-wide v3, v0, Lۀۗ۱/ب;->أ:J

    int-to-long v8, v15

    div-long/2addr v3, v8

    add-long v3, v3, p0

    int-to-long v14, v14

    add-long/2addr v3, v14

    int-to-long v14, v13

    add-long/2addr v3, v14

    const-wide/16 v14, 0x1

    add-long/2addr v3, v14

    neg-int v6, v13

    invoke-virtual {v0, v6}, Lۀۗ۱/ب;->ٱ(I)V

    invoke-virtual {v0, v2}, Lۀۗ۱/ب;->ٱ(I)V

    add-int v6, v1, v13

    :goto_b
    if-ge v1, v6, :cond_10

    invoke-virtual {v5, v1}, Lۀۗ۱/ث;->ؤ(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {v0, v2}, Lۀۗ۱/ب;->ٱ(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_10
    add-int/lit8 v1, v7, 0x1

    if-ne v1, v11, :cond_13

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lۀۗ۱/ث;

    invoke-virtual {v1}, Lۀۗ۱/ث;->ء()I

    move-result v1

    if-ne v6, v1, :cond_11

    const/4 v3, 0x1

    goto :goto_c

    :cond_11
    const/4 v3, 0x0

    :goto_c
    if-eqz v3, :cond_12

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lۀۗ۱/ب;->ٱ(I)V

    goto :goto_e

    :cond_12
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    new-instance v13, Lۀۗ۱/ب;

    invoke-direct {v13}, Lۀۗ۱/ب;-><init>()V

    iget-wide v1, v13, Lۀۗ۱/ب;->أ:J

    div-long/2addr v1, v8

    add-long/2addr v1, v3

    long-to-int v1, v1

    const/4 v2, -0x1

    mul-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lۀۗ۱/ب;->ٱ(I)V

    move-wide v1, v3

    move-object v3, v13

    move v4, v6

    move-object/from16 v5, p4

    move v6, v7

    move/from16 v7, p6

    move-object/from16 v8, p7

    invoke-static/range {v1 .. v8}, Lٽچڃ/أ;->ؠ(JLۀۗ۱/ب;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    :goto_d
    invoke-virtual {v0, v13}, Lۀۗ۱/ب;->د(Lۀۗ۱/ؼ;)J

    :goto_e
    return-void

    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static varargs ء([Lۀۗ۱/ث;)Lۀۗ۱/س;
    .locals 14

    array-length v0, p0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const/4 v3, -0x1

    if-eqz v0, :cond_1

    new-instance p0, Lۀۗ۱/س;

    new-array v0, v2, [Lۀۗ۱/ث;

    filled-new-array {v2, v3}, [I

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lۀۗ۱/س;-><init>([Lۀۗ۱/ث;[I)V

    return-object p0

    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    new-instance v0, Lڡپٔۯ/ا;

    invoke-direct {v0, p0, v2}, Lڡپٔۯ/ا;-><init>([Ljava/lang/Object;Z)V

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v1, :cond_2

    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    array-length v4, p0

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    array-length v4, p0

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_3

    aget-object v6, p0, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    new-array v4, v2, [Ljava/lang/Integer;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Integer;

    array-length v4, v0

    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v4, "elements"

    invoke-static {v0, v4}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v4, v0

    if-nez v4, :cond_4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v10, v0

    goto :goto_2

    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    new-instance v5, Lڡپٔۯ/ا;

    invoke-direct {v5, v0, v1}, Lڡپٔۯ/ا;-><init>([Ljava/lang/Object;Z)V

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v10, v4

    :goto_2
    array-length v0, p0

    move v4, v2

    move v5, v4

    :goto_3
    if-ge v4, v0, :cond_d

    aget-object v6, p0, v4

    add-int/lit8 v8, v5, 0x1

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v11

    const-string v12, ")."

    if-ltz v9, :cond_c

    if-gt v9, v11, :cond_b

    add-int/lit8 v9, v9, -0x1

    move v11, v2

    :goto_4
    if-gt v11, v9, :cond_9

    add-int v12, v11, v9

    ushr-int/2addr v12, v1

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Comparable;

    if-ne v13, v6, :cond_5

    move v13, v2

    goto :goto_5

    :cond_5
    if-nez v13, :cond_6

    move v13, v3

    goto :goto_5

    :cond_6
    if-nez v6, :cond_7

    move v13, v1

    goto :goto_5

    :cond_7
    invoke-interface {v13, v6}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v13

    :goto_5
    if-gez v13, :cond_8

    add-int/lit8 v11, v12, 0x1

    goto :goto_4

    :cond_8
    if-lez v13, :cond_a

    add-int/lit8 v9, v12, -0x1

    goto :goto_4

    :cond_9
    add-int/lit8 v11, v11, 0x1

    neg-int v12, v11

    :cond_a
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v10, v12, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    move v5, v8

    goto :goto_3

    :cond_b
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "toIndex ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") is greater than size ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "fromIndex (0) is greater than toIndex ("

    invoke-static {v0, v9, v12}, Landroidx/activity/result/؋;->آ(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lۀۗ۱/ث;

    invoke-virtual {v0}, Lۀۗ۱/ث;->ء()I

    move-result v0

    if-lez v0, :cond_e

    move v0, v1

    goto :goto_6

    :cond_e
    move v0, v2

    :goto_6
    if-eqz v0, :cond_15

    move v0, v2

    :goto_7
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_13

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lۀۗ۱/ث;

    add-int/lit8 v4, v0, 0x1

    move v5, v4

    :goto_8
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_12

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lۀۗ۱/ث;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v8, "prefix"

    invoke-static {v3, v8}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Lۀۗ۱/ث;->ء()I

    move-result v8

    invoke-virtual {v6, v3, v8}, Lۀۗ۱/ث;->ا(Lۀۗ۱/ث;I)Z

    move-result v8

    if-eqz v8, :cond_12

    invoke-virtual {v6}, Lۀۗ۱/ث;->ء()I

    move-result v8

    invoke-virtual {v3}, Lۀۗ۱/ث;->ء()I

    move-result v9

    if-eq v8, v9, :cond_f

    move v8, v1

    goto :goto_9

    :cond_f
    move v8, v2

    :goto_9
    if-eqz v8, :cond_11

    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    if-le v6, v8, :cond_10

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-interface {v10, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_8

    :cond_10
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_11
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "duplicate option: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    move v0, v4

    goto :goto_7

    :cond_13
    new-instance v0, Lۀۗ۱/ب;

    invoke-direct {v0}, Lۀۗ۱/ب;-><init>()V

    const-wide/16 v3, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v9

    move-object v5, v0

    invoke-static/range {v3 .. v10}, Lٽچڃ/أ;->ؠ(JLۀۗ۱/ب;ILjava/util/ArrayList;IILjava/util/ArrayList;)V

    iget-wide v3, v0, Lۀۗ۱/ب;->أ:J

    const/4 v1, 0x4

    int-to-long v5, v1

    div-long/2addr v3, v5

    long-to-int v1, v3

    new-array v1, v1, [I

    :goto_a
    invoke-virtual {v0}, Lۀۗ۱/ب;->ج()Z

    move-result v3

    if-nez v3, :cond_14

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v0}, Lۀۗ۱/ب;->readInt()I

    move-result v4

    aput v4, v1, v2

    move v2, v3

    goto :goto_a

    :cond_14
    new-instance v0, Lۀۗ۱/س;

    array-length v2, p0

    invoke-static {p0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string v2, "copyOf(this, size)"

    invoke-static {p0, v2}, Lڗًقڔ/؋;->ة(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, [Lۀۗ۱/ث;

    invoke-direct {v0, p0, v1}, Lۀۗ۱/س;-><init>([Lۀۗ۱/ث;[I)V

    return-object v0

    :cond_15
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "the empty byte string is not a supported option"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 2

    iget v0, p0, Lٽچڃ/أ;->آ:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lةٌخ/؋;->ؤ:Lةٌخ/؋;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Cannot return null from a non-@Nullable @Provides method"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1
    const-string v0, "com.google.android.datatransport.events"

    return-object v0

    :goto_0
    new-instance v0, Lثڈا/ؠ;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lثڈا/ؠ;-><init>(I)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public ؋(Lcom/google/firebase/components/ComponentRegistrar;)Ljava/util/List;
    .locals 11

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Lcom/google/firebase/components/ComponentRegistrar;->getComponents()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lڊ۟چڗۙ٦/ء;

    iget-object v3, v1, Lڊ۟چڗۙ٦/ء;->؋:Ljava/lang/String;

    if-eqz v3, :cond_0

    new-instance v8, Lڙڧا/آ;

    const/4 v2, 0x1

    invoke-direct {v8, v1, v3, v2}, Lڙڧا/آ;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    new-instance v10, Lڊ۟چڗۙ٦/ء;

    iget-object v4, v1, Lڊ۟چڗۙ٦/ء;->ؠ:Ljava/util/Set;

    iget-object v5, v1, Lڊ۟چڗۙ٦/ء;->ء:Ljava/util/Set;

    iget v6, v1, Lڊ۟چڗۙ٦/ء;->آ:I

    iget v7, v1, Lڊ۟چڗۙ٦/ء;->أ:I

    iget-object v9, v1, Lڊ۟چڗۙ٦/ء;->إ:Ljava/util/Set;

    move-object v2, v10

    invoke-direct/range {v2 .. v9}, Lڊ۟چڗۙ٦/ء;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILڊ۟چڗۙ٦/ؤ;Ljava/util/Set;)V

    move-object v1, v10

    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
