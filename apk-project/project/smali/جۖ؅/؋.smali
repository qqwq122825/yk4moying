.class public final Lجۖ؅/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic ؋:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lجۖ؅/؋;->؋:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ؋(Lذ۠ۋؿ/ؤ;Landroid/os/Parcel;I)V
    .locals 3

    const/16 v0, 0x4f45

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v0

    iget v1, p0, Lذ۠ۋؿ/ؤ;->آ:I

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x2

    iget v2, p0, Lذ۠ۋؿ/ؤ;->أ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x3

    iget v2, p0, Lذ۠ۋؿ/ؤ;->ؤ:I

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/4 v1, 0x4

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->إ:Ljava/lang/String;

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    iget-object v1, p0, Lذ۠ۋؿ/ؤ;->ئ:Landroid/os/IBinder;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x5

    invoke-static {p1, v2}, Lسۄھؤۏ۫/؋;->ؿ(Landroid/os/Parcel;I)I

    move-result v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    invoke-static {p1, v2}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    :goto_0
    const/4 v1, 0x6

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->ا:[Lcom/google/android/gms/common/api/Scope;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ؽ(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/4 v1, 0x7

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->ب:Landroid/os/Bundle;

    invoke-static {p1, v1, v2}, Lسۄھؤۏ۫/؋;->ع(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    const/16 v1, 0x8

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->ة:Landroid/accounts/Account;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ػ(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    const/16 v1, 0xa

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->ت:[Lحۨٸڮؐێ/ء;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ؽ(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/16 v1, 0xb

    iget-object v2, p0, Lذ۠ۋؿ/ؤ;->ث:[Lحۨٸڮؐێ/ء;

    invoke-static {p1, v1, v2, p2}, Lسۄھؤۏ۫/؋;->ؽ(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/16 p2, 0xc

    iget-boolean v1, p0, Lذ۠ۋؿ/ؤ;->ج:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/16 p2, 0xd

    iget v1, p0, Lذ۠ۋؿ/ؤ;->ح:I

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->غ(Landroid/os/Parcel;II)V

    const/16 p2, 0xe

    iget-boolean v1, p0, Lذ۠ۋؿ/ؤ;->خ:Z

    invoke-static {p1, p2, v1}, Lسۄھؤۏ۫/؋;->ظ(Landroid/os/Parcel;IZ)V

    const/16 p2, 0xf

    iget-object p0, p0, Lذ۠ۋؿ/ؤ;->د:Ljava/lang/String;

    invoke-static {p1, p2, p0}, Lسۄھؤۏ۫/؋;->ؼ(Landroid/os/Parcel;ILjava/lang/String;)V

    invoke-static {p1, v0}, Lسۄھؤۏ۫/؋;->ـ(Landroid/os/Parcel;I)V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 28

    move-object/from16 v0, p1

    const/16 v1, 0x8

    move-object/from16 v2, p0

    iget v3, v2, Lجۖ؅/؋;->؋:I

    const/4 v4, 0x5

    const-wide/16 v5, 0x0

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_13

    :pswitch_0
    new-instance v1, Lcom/google/android/material/timepicker/إ;

    invoke-direct {v1, v0}, Lcom/google/android/material/timepicker/إ;-><init>(Landroid/os/Parcel;)V

    return-object v1

    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v1, v0}, Lcom/google/android/material/datepicker/ز;->؋(II)Lcom/google/android/material/datepicker/ز;

    move-result-object v0

    return-object v0

    :pswitch_2
    new-instance v1, Lcom/google/android/material/datepicker/آ;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    invoke-direct {v1, v3, v4}, Lcom/google/android/material/datepicker/آ;-><init>(J)V

    return-object v1

    :pswitch_3
    const-class v1, Lcom/google/android/material/datepicker/ز;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/google/android/material/datepicker/ز;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/google/android/material/datepicker/ز;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/google/android/material/datepicker/ز;

    const-class v1, Lcom/google/android/material/datepicker/ؠ;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/google/android/material/datepicker/ؠ;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v9

    new-instance v0, Lcom/google/android/material/datepicker/ء;

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Lcom/google/android/material/datepicker/ء;-><init>(Lcom/google/android/material/datepicker/ز;Lcom/google/android/material/datepicker/ز;Lcom/google/android/material/datepicker/ؠ;Lcom/google/android/material/datepicker/ز;I)V

    return-object v0

    :pswitch_4
    new-instance v1, Lٯژ؄ۮ/ؠ;

    invoke-direct {v1, v0}, Lٯژ؄ۮ/ؠ;-><init>(Landroid/os/Parcel;)V

    return-object v1

    :pswitch_5
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move-object v3, v12

    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v1, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    int-to-char v5, v4

    if-eq v5, v10, :cond_2

    if-eq v5, v9, :cond_1

    if-eq v5, v8, :cond_0

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_0

    :cond_0
    sget-object v3, Lذ۠ۋؿ/ر;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4, v3}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lذ۠ۋؿ/ر;

    goto :goto_0

    :cond_1
    sget-object v5, Lحۨٸڮؐێ/؋;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4, v5}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lحۨٸڮؐێ/؋;

    goto :goto_0

    :cond_2
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_0

    :cond_3
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lؼۿعڽٵۄٙ؀/ا;

    invoke-direct {v0, v11, v12, v3}, Lؼۿعڽٵۄٙ؀/ا;-><init>(ILحۨٸڮؐێ/؋;Lذ۠ۋؿ/ر;)V

    return-object v0

    :pswitch_6
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_6

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v4, v3

    if-eq v4, v10, :cond_5

    if-eq v4, v9, :cond_4

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_1

    :cond_4
    sget-object v4, Lذ۠ۋؿ/ذ;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lذ۠ۋؿ/ذ;

    goto :goto_1

    :cond_5
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_1

    :cond_6
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lؼۿعڽٵۄٙ؀/ئ;

    invoke-direct {v0, v11, v12}, Lؼۿعڽٵۄٙ؀/ئ;-><init>(ILذ۠ۋؿ/ذ;)V

    return-object v0

    :pswitch_7
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move-object v3, v12

    move-object v4, v3

    :goto_2
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-ge v5, v1, :cond_a

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    int-to-char v6, v5

    if-eq v6, v10, :cond_8

    if-eq v6, v9, :cond_7

    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_2

    :cond_7
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_8
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-nez v4, :cond_9

    move-object v4, v12

    goto :goto_2

    :cond_9
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v6

    add-int/2addr v5, v4

    invoke-virtual {v0, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v4, v6

    goto :goto_2

    :cond_a
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lؼۿعڽٵۄٙ؀/إ;

    invoke-direct {v0, v3, v4}, Lؼۿعڽٵۄٙ؀/إ;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v0

    :pswitch_8
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v3, v11

    :goto_3
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v1, :cond_e

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    int-to-char v5, v4

    if-eq v5, v10, :cond_d

    if-eq v5, v9, :cond_c

    if-eq v5, v8, :cond_b

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_3

    :cond_b
    sget-object v5, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4, v5}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Landroid/content/Intent;

    goto :goto_3

    :cond_c
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_3

    :cond_d
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_3

    :cond_e
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lؼۿعڽٵۄٙ؀/ؠ;

    invoke-direct {v0, v11, v3, v12}, Lؼۿعڽٵۄٙ؀/ؠ;-><init>(IILandroid/content/Intent;)V

    return-object v0

    :pswitch_9
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v3

    const-wide/16 v4, -0x1

    :goto_4
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v6

    if-ge v6, v3, :cond_12

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    int-to-char v7, v6

    if-eq v7, v10, :cond_11

    if-eq v7, v9, :cond_10

    if-eq v7, v8, :cond_f

    invoke-static {v0, v6}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_4

    :cond_f
    invoke-static {v0, v6, v1}, Lںڍڒڸ/ش;->څ(Landroid/os/Parcel;II)V

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    goto :goto_4

    :cond_10
    invoke-static {v0, v6}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_4

    :cond_11
    invoke-static {v0, v6}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v12

    goto :goto_4

    :cond_12
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lحۨٸڮؐێ/ء;

    invoke-direct {v0, v12, v11, v4, v5}, Lحۨٸڮؐێ/ء;-><init>(Ljava/lang/String;IJ)V

    return-object v0

    :pswitch_a
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v3, v11

    move-object v4, v12

    :goto_5
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-ge v5, v1, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    int-to-char v6, v5

    if-eq v6, v10, :cond_16

    if-eq v6, v9, :cond_15

    if-eq v6, v8, :cond_14

    if-eq v6, v7, :cond_13

    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_5

    :cond_13
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    :cond_14
    sget-object v6, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v6}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Landroid/app/PendingIntent;

    goto :goto_5

    :cond_15
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_5

    :cond_16
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_5

    :cond_17
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lحۨٸڮؐێ/؋;

    invoke-direct {v0, v11, v3, v12, v4}, Lحۨٸڮؐێ/؋;-><init>(IILandroid/app/PendingIntent;Ljava/lang/String;)V

    return-object v0

    :pswitch_b
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    sget-object v3, Lذ۠ۋؿ/ؤ;->ذ:[Lcom/google/android/gms/common/api/Scope;

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    sget-object v5, Lذ۠ۋؿ/ؤ;->ر:[Lحۨٸڮؐێ/ء;

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v22, v5

    move-object/from16 v23, v22

    move v14, v11

    move v15, v14

    move/from16 v16, v15

    move/from16 v24, v16

    move/from16 v25, v24

    move/from16 v26, v25

    move-object/from16 v17, v12

    move-object/from16 v18, v17

    move-object/from16 v21, v18

    move-object/from16 v27, v21

    :goto_6
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_19

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v4, v3

    packed-switch v4, :pswitch_data_1

    :pswitch_c
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_6

    :pswitch_d
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v27

    goto :goto_6

    :pswitch_e
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v26

    goto :goto_6

    :pswitch_f
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v25

    goto :goto_6

    :pswitch_10
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v24

    goto :goto_6

    :pswitch_11
    sget-object v4, Lحۨٸڮؐێ/ء;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->ذ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v23, v3

    check-cast v23, [Lحۨٸڮؐێ/ء;

    goto :goto_6

    :pswitch_12
    sget-object v4, Lحۨٸڮؐێ/ء;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->ذ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, [Lحۨٸڮؐێ/ء;

    goto :goto_6

    :pswitch_13
    sget-object v4, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    move-object/from16 v21, v3

    check-cast v21, Landroid/accounts/Account;

    goto :goto_6

    :pswitch_14
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ج(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v20

    goto :goto_6

    :pswitch_15
    sget-object v4, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->ذ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, [Lcom/google/android/gms/common/api/Scope;

    goto :goto_6

    :pswitch_16
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-nez v3, :cond_18

    move-object/from16 v18, v12

    goto :goto_6

    :cond_18
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v5

    add-int/2addr v4, v3

    invoke-virtual {v0, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object/from16 v18, v5

    goto :goto_6

    :pswitch_17
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v17

    goto :goto_6

    :pswitch_18
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v16

    goto :goto_6

    :pswitch_19
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v15

    goto :goto_6

    :pswitch_1a
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v14

    goto/16 :goto_6

    :cond_19
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ؤ;

    move-object v13, v0

    invoke-direct/range {v13 .. v27}, Lذ۠ۋؿ/ؤ;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lحۨٸڮؐێ/ء;[Lحۨٸڮؐێ/ء;ZIZLjava/lang/String;)V

    return-object v0

    :pswitch_1b
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v5, v11

    move v6, v5

    move v8, v6

    move-object v4, v12

    move-object v7, v4

    move-object v9, v7

    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_1c

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v10, v3

    packed-switch v10, :pswitch_data_2

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_7

    :pswitch_1c
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v9

    if-nez v3, :cond_1a

    move-object v9, v12

    goto :goto_7

    :cond_1a
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v10

    add-int/2addr v9, v3

    invoke-virtual {v0, v9}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v9, v10

    goto :goto_7

    :pswitch_1d
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v8

    goto :goto_7

    :pswitch_1e
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v7

    if-nez v3, :cond_1b

    move-object v7, v12

    goto :goto_7

    :cond_1b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v10

    add-int/2addr v7, v3

    invoke-virtual {v0, v7}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v7, v10

    goto :goto_7

    :pswitch_1f
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v6

    goto :goto_7

    :pswitch_20
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v5

    goto :goto_7

    :pswitch_21
    sget-object v4, Lذ۠ۋؿ/ة;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lذ۠ۋؿ/ة;

    goto :goto_7

    :cond_1c
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/أ;

    move-object v3, v0

    invoke-direct/range {v3 .. v9}, Lذ۠ۋؿ/أ;-><init>(Lذ۠ۋؿ/ة;ZZ[II[I)V

    return-object v0

    :pswitch_22
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move-object v3, v12

    move-object v4, v3

    :goto_8
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-ge v5, v1, :cond_21

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    int-to-char v6, v5

    if-eq v6, v10, :cond_20

    if-eq v6, v9, :cond_1f

    if-eq v6, v8, :cond_1e

    if-eq v6, v7, :cond_1d

    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_8

    :cond_1d
    sget-object v4, Lذ۠ۋؿ/أ;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lذ۠ۋؿ/أ;

    goto :goto_8

    :cond_1e
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_8

    :cond_1f
    sget-object v3, Lحۨٸڮؐێ/ء;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v3}, Lںڍڒڸ/ش;->ذ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lحۨٸڮؐێ/ء;

    goto :goto_8

    :cond_20
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ج(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v12

    goto :goto_8

    :cond_21
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ػ;

    invoke-direct {v0, v12, v3, v11, v4}, Lذ۠ۋؿ/ػ;-><init>(Landroid/os/Bundle;[Lحۨٸڮؐێ/ء;ILذ۠ۋؿ/أ;)V

    return-object v0

    :pswitch_23
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v13, v11

    move v14, v13

    move v15, v14

    move/from16 v16, v15

    move/from16 v17, v16

    :goto_9
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_27

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v5, v3

    if-eq v5, v10, :cond_26

    if-eq v5, v9, :cond_25

    if-eq v5, v8, :cond_24

    if-eq v5, v7, :cond_23

    if-eq v5, v4, :cond_22

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_9

    :cond_22
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v17

    goto :goto_9

    :cond_23
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v16

    goto :goto_9

    :cond_24
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v15

    goto :goto_9

    :cond_25
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v14

    goto :goto_9

    :cond_26
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v13

    goto :goto_9

    :cond_27
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ة;

    move-object v12, v0

    invoke-direct/range {v12 .. v17}, Lذ۠ۋؿ/ة;-><init>(IZZII)V

    return-object v0

    :pswitch_24
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v14, v11

    move/from16 v17, v14

    move/from16 v18, v17

    move-object v15, v12

    move-object/from16 v16, v15

    :goto_a
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_2e

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v5, v3

    if-eq v5, v10, :cond_2d

    if-eq v5, v9, :cond_2b

    if-eq v5, v8, :cond_2a

    if-eq v5, v7, :cond_29

    if-eq v5, v4, :cond_28

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_a

    :cond_28
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v18

    goto :goto_a

    :cond_29
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٮ(Landroid/os/Parcel;I)Z

    move-result v17

    goto :goto_a

    :cond_2a
    sget-object v5, Lحۨٸڮؐێ/؋;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v5}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Lحۨٸڮؐێ/؋;

    goto :goto_a

    :cond_2b
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-nez v3, :cond_2c

    move-object v15, v12

    goto :goto_a

    :cond_2c
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v6

    add-int/2addr v5, v3

    invoke-virtual {v0, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v15, v6

    goto :goto_a

    :cond_2d
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v14

    goto :goto_a

    :cond_2e
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ر;

    move-object v13, v0

    invoke-direct/range {v13 .. v18}, Lذ۠ۋؿ/ر;-><init>(ILandroid/os/IBinder;Lحۨٸڮؐێ/؋;ZZ)V

    return-object v0

    :pswitch_25
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move v3, v11

    move-object v4, v12

    :goto_b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-ge v5, v1, :cond_33

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    int-to-char v6, v5

    if-eq v6, v10, :cond_32

    if-eq v6, v9, :cond_31

    if-eq v6, v8, :cond_30

    if-eq v6, v7, :cond_2f

    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_b

    :cond_2f
    sget-object v4, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    goto :goto_b

    :cond_30
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_b

    :cond_31
    sget-object v6, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v6}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Landroid/accounts/Account;

    goto :goto_b

    :cond_32
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_b

    :cond_33
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ذ;

    invoke-direct {v0, v11, v12, v3, v4}, Lذ۠ۋؿ/ذ;-><init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    return-object v0

    :pswitch_26
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v3

    const/4 v4, -0x1

    move/from16 v24, v4

    move-wide/from16 v17, v5

    move-wide/from16 v19, v17

    move v14, v11

    move v15, v14

    move/from16 v16, v15

    move/from16 v23, v16

    move-object/from16 v21, v12

    move-object/from16 v22, v21

    :goto_c
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v3, :cond_34

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    int-to-char v5, v4

    packed-switch v5, :pswitch_data_3

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_c

    :pswitch_27
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v24

    goto :goto_c

    :pswitch_28
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v23

    goto :goto_c

    :pswitch_29
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v22

    goto :goto_c

    :pswitch_2a
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v21

    goto :goto_c

    :pswitch_2b
    invoke-static {v0, v4, v1}, Lںڍڒڸ/ش;->څ(Landroid/os/Parcel;II)V

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v19

    goto :goto_c

    :pswitch_2c
    invoke-static {v0, v4, v1}, Lںڍڒڸ/ش;->څ(Landroid/os/Parcel;II)V

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v17

    goto :goto_c

    :pswitch_2d
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v16

    goto :goto_c

    :pswitch_2e
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v15

    goto :goto_c

    :pswitch_2f
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v14

    goto :goto_c

    :cond_34
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ا;

    move-object v13, v0

    invoke-direct/range {v13 .. v24}, Lذ۠ۋؿ/ا;-><init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V

    return-object v0

    :pswitch_30
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    :goto_d
    move-object v3, v12

    :goto_e
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v1, :cond_38

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    int-to-char v5, v4

    if-eq v5, v10, :cond_37

    if-eq v5, v9, :cond_35

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_e

    :cond_35
    sget-object v3, Lذ۠ۋؿ/ا;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-nez v4, :cond_36

    goto :goto_d

    :cond_36
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v3

    add-int/2addr v5, v4

    invoke-virtual {v0, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    goto :goto_e

    :cond_37
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_e

    :cond_38
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lذ۠ۋؿ/ت;

    invoke-direct {v0, v11, v3}, Lذ۠ۋؿ/ت;-><init>(ILjava/util/List;)V

    return-object v0

    :pswitch_31
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    move-object v3, v12

    move-object v4, v3

    :goto_f
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    if-ge v5, v1, :cond_3d

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    int-to-char v6, v5

    if-eq v6, v10, :cond_3c

    if-eq v6, v9, :cond_3b

    if-eq v6, v8, :cond_3a

    if-eq v6, v7, :cond_39

    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_f

    :cond_39
    sget-object v4, Lحۨٸڮؐێ/؋;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lحۨٸڮؐێ/؋;

    goto :goto_f

    :cond_3a
    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v5, v3}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/app/PendingIntent;

    goto :goto_f

    :cond_3b
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v12

    goto :goto_f

    :cond_3c
    invoke-static {v0, v5}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_f

    :cond_3d
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-direct {v0, v11, v12, v3, v4}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;Lحۨٸڮؐێ/؋;)V

    return-object v0

    :pswitch_32
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    :goto_10
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_40

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v4, v3

    if-eq v4, v10, :cond_3f

    if-eq v4, v9, :cond_3e

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_10

    :cond_3e
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v12

    goto :goto_10

    :cond_3f
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v11

    goto :goto_10

    :cond_40
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    invoke-direct {v0, v11, v12}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    return-object v0

    :pswitch_33
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    new-instance v1, Lحظتۢۋۜآظ/إ;

    invoke-direct {v1, v0}, Lحظتۢۋۜآظ/إ;-><init>(Landroid/os/IBinder;)V

    return-object v1

    :pswitch_34
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    :goto_11
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_42

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v4, v3

    if-eq v4, v10, :cond_41

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_11

    :cond_41
    sget-object v4, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v3, v4}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Landroid/content/Intent;

    goto :goto_11

    :cond_42
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lحظتۢۋۜآظ/؋;

    invoke-direct {v0, v12}, Lحظتۢۋۜآظ/؋;-><init>(Landroid/content/Intent;)V

    return-object v0

    :pswitch_35
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v3

    move-wide/from16 v21, v5

    move v14, v11

    move-object v15, v12

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move-object/from16 v23, v20

    move-object/from16 v24, v23

    move-object/from16 v25, v24

    move-object/from16 v26, v25

    :goto_12
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v3, :cond_44

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    int-to-char v5, v4

    packed-switch v5, :pswitch_data_4

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_12

    :pswitch_36
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v26

    goto :goto_12

    :pswitch_37
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v25

    goto :goto_12

    :pswitch_38
    sget-object v5, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٱ(Landroid/os/Parcel;I)I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v6

    if-nez v4, :cond_43

    move-object/from16 v24, v12

    goto :goto_12

    :cond_43
    invoke-virtual {v0, v5}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v5

    add-int/2addr v6, v4

    invoke-virtual {v0, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object/from16 v24, v5

    goto :goto_12

    :pswitch_39
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v23

    goto :goto_12

    :pswitch_3a
    invoke-static {v0, v4, v1}, Lںڍڒڸ/ش;->څ(Landroid/os/Parcel;II)V

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v21

    goto :goto_12

    :pswitch_3b
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v20

    goto :goto_12

    :pswitch_3c
    sget-object v5, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {v0, v4, v5}, Lںڍڒڸ/ش;->خ(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Landroid/net/Uri;

    goto :goto_12

    :pswitch_3d
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v18

    goto :goto_12

    :pswitch_3e
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v17

    goto :goto_12

    :pswitch_3f
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v16

    goto :goto_12

    :pswitch_40
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->د(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v15

    goto :goto_12

    :pswitch_41
    invoke-static {v0, v4}, Lںڍڒڸ/ش;->ٯ(Landroid/os/Parcel;I)I

    move-result v14

    goto :goto_12

    :cond_44
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-object v13, v0

    invoke-direct/range {v13 .. v26}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;JLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :goto_13
    invoke-static/range {p1 .. p1}, Lںڍڒڸ/ش;->ڃ(Landroid/os/Parcel;)I

    move-result v1

    :goto_14
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-ge v3, v1, :cond_46

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    int-to-char v4, v3

    if-eq v4, v9, :cond_45

    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ٻ(Landroid/os/Parcel;I)V

    goto :goto_14

    :cond_45
    invoke-static {v0, v3}, Lںڍڒڸ/ش;->ج(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v12

    goto :goto_14

    :cond_46
    invoke-static {v0, v1}, Lںڍڒڸ/ش;->ز(Landroid/os/Parcel;I)V

    new-instance v0, Lژة۪ڦضۆۿۡ/س;

    invoke-direct {v0, v12}, Lژة۪ڦضۆۿۡ/س;-><init>(Landroid/os/Bundle;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_1b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_c
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lجۖ؅/؋;->؋:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-array p1, p1, [Lcom/google/android/material/timepicker/إ;

    return-object p1

    :pswitch_1
    new-array p1, p1, [Lcom/google/android/material/datepicker/ز;

    return-object p1

    :pswitch_2
    new-array p1, p1, [Lcom/google/android/material/datepicker/آ;

    return-object p1

    :pswitch_3
    new-array p1, p1, [Lcom/google/android/material/datepicker/ء;

    return-object p1

    :pswitch_4
    new-array p1, p1, [Lٯژ؄ۮ/ؠ;

    return-object p1

    :pswitch_5
    new-array p1, p1, [Lؼۿعڽٵۄٙ؀/ا;

    return-object p1

    :pswitch_6
    new-array p1, p1, [Lؼۿعڽٵۄٙ؀/ئ;

    return-object p1

    :pswitch_7
    new-array p1, p1, [Lؼۿعڽٵۄٙ؀/إ;

    return-object p1

    :pswitch_8
    new-array p1, p1, [Lؼۿعڽٵۄٙ؀/ؠ;

    return-object p1

    :pswitch_9
    new-array p1, p1, [Lحۨٸڮؐێ/ء;

    return-object p1

    :pswitch_a
    new-array p1, p1, [Lحۨٸڮؐێ/؋;

    return-object p1

    :pswitch_b
    new-array p1, p1, [Lذ۠ۋؿ/ؤ;

    return-object p1

    :pswitch_c
    new-array p1, p1, [Lذ۠ۋؿ/أ;

    return-object p1

    :pswitch_d
    new-array p1, p1, [Lذ۠ۋؿ/ػ;

    return-object p1

    :pswitch_e
    new-array p1, p1, [Lذ۠ۋؿ/ة;

    return-object p1

    :pswitch_f
    new-array p1, p1, [Lذ۠ۋؿ/ر;

    return-object p1

    :pswitch_10
    new-array p1, p1, [Lذ۠ۋؿ/ذ;

    return-object p1

    :pswitch_11
    new-array p1, p1, [Lذ۠ۋؿ/ا;

    return-object p1

    :pswitch_12
    new-array p1, p1, [Lذ۠ۋؿ/ت;

    return-object p1

    :pswitch_13
    new-array p1, p1, [Lcom/google/android/gms/common/api/Status;

    return-object p1

    :pswitch_14
    new-array p1, p1, [Lcom/google/android/gms/common/api/Scope;

    return-object p1

    :pswitch_15
    new-array p1, p1, [Lحظتۢۋۜآظ/إ;

    return-object p1

    :pswitch_16
    new-array p1, p1, [Lحظتۢۋۜآظ/؋;

    return-object p1

    :pswitch_17
    new-array p1, p1, [Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    return-object p1

    :goto_0
    new-array p1, p1, [Lژة۪ڦضۆۿۡ/س;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
