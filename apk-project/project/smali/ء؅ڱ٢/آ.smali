.class public final Lء؅ڱ٢/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lإٿ٢/ئ;


# instance fields
.field public final ؋:Lڙڧا/ء;

.field public final ؠ:Landroid/net/ConnectivityManager;

.field public final ء:Landroid/content/Context;

.field public final آ:Ljava/net/URL;

.field public final أ:Lثڈا/؋;

.field public final ؤ:Lثڈا/؋;

.field public final إ:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lثڈا/؋;Lثڈا/؋;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lڒ٠ئڿؕکڡ/آ;

    invoke-direct {v0}, Lڒ٠ئڿؕکڡ/آ;-><init>()V

    sget-object v1, Lذ۠ۋؿ/ب;->أ:Lذ۠ۋؿ/ب;

    invoke-virtual {v1, v0}, Lذ۠ۋؿ/ب;->ؠ(Lڑۣػٻٷج/؋;)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lڒ٠ئڿؕکڡ/آ;->آ:Z

    new-instance v1, Lڙڧا/ء;

    invoke-direct {v1, v0}, Lڙڧا/ء;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lء؅ڱ٢/آ;->؋:Lڙڧا/ء;

    iput-object p1, p0, Lء؅ڱ٢/آ;->ء:Landroid/content/Context;

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lء؅ڱ٢/آ;->ؠ:Landroid/net/ConnectivityManager;

    sget-object p1, Lء؅ڱ٢/؋;->ء:Ljava/lang/String;

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    iput-object v0, p0, Lء؅ڱ٢/آ;->آ:Ljava/net/URL;

    iput-object p3, p0, Lء؅ڱ٢/آ;->أ:Lثڈا/؋;

    iput-object p2, p0, Lء؅ڱ٢/آ;->ؤ:Lثڈا/؋;

    const p1, 0x1fbd0

    iput p1, p0, Lء؅ڱ٢/آ;->إ:I

    return-void

    :catch_0
    move-exception p2

    new-instance p3, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid url: "

    invoke-static {v0, p1}, Landroidx/activity/result/؋;->س(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p3
.end method


# virtual methods
.method public final ؋(Lأۺؘٻڣ/ا;)Lأۺؘٻڣ/ا;
    .locals 5

    iget-object v0, p0, Lء؅ڱ٢/آ;->ؠ:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {p1}, Lأۺؘٻڣ/ا;->ء()Lأۺؘٻڣ/ئ;

    move-result-object p1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p1}, Lأۺؘٻڣ/ئ;->آ()Ljava/util/Map;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "sdk-version"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "model"

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "hardware"

    sget-object v2, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "device"

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "product"

    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "os-uild"

    sget-object v2, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "manufacturer"

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "fingerprint"

    sget-object v2, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v1

    div-int/lit16 v1, v1, 0x3e8

    int-to-long v1, v1

    invoke-virtual {p1}, Lأۺؘٻڣ/ئ;->آ()Ljava/util/Map;

    move-result-object v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "tz-offset"

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    sget-object v2, Lآۋۻؾ۹/ض;->آ:Landroid/util/SparseArray;

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    :goto_0
    invoke-virtual {p1}, Lأۺؘٻڣ/ئ;->آ()Ljava/util/Map;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "net-type"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez v0, :cond_1

    sget-object v0, Lآۋۻؾ۹/ص;->آ:Landroid/util/SparseArray;

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    if-ne v0, v1, :cond_2

    sget-object v0, Lآۋۻؾ۹/ص;->آ:Landroid/util/SparseArray;

    const/16 v0, 0x64

    goto :goto_2

    :cond_2
    sget-object v3, Lآۋۻؾ۹/ص;->آ:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lآۋۻؾ۹/ص;

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    :goto_1
    move v0, v2

    :goto_2
    invoke-virtual {p1}, Lأۺؘٻڣ/ئ;->آ()Ljava/util/Map;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v4, "mobile-subtype"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    const-string v3, "country"

    invoke-virtual {p1, v3, v0}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v3, "locale"

    invoke-virtual {p1, v3, v0}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lء؅ڱ٢/آ;->ء:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mcc_mnc"

    invoke-virtual {p1, v4, v3}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    const-string v2, "CctTransportBackend"

    const-string v3, "Unable to find version code for package"

    invoke-static {v2, v3, v0}, Lسۄھؤۏ۫/؋;->ح(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_3
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "application_build"

    invoke-virtual {p1, v1, v0}, Lأۺؘٻڣ/ئ;->؋(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lأۺؘٻڣ/ئ;->ؠ()Lأۺؘٻڣ/ا;

    move-result-object p1

    return-object p1
.end method
