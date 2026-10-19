.class public final synthetic Landroidx/constraintlayout/core/state/؋;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/constraintlayout/core/state/Interpolator;
.implements Landroidx/core/view/inputmethod/InputConnectionCompat$OnCommitContentListener;
.implements Lةڈۑۂٝےآذ/ؠ;
.implements Lةٌخ/ا;
.implements Landroidx/core/view/accessibility/AccessibilityManagerCompat$TouchExplorationStateChangeListener;
.implements Lؾپۑ۟ڂڷ/؋;
.implements Lؾپۑ۟ڂڷ/آ;
.implements Lؾپۑ۟ڂڷ/ؤ;
.implements Lokhttp3/EventListener$Factory;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/constraintlayout/core/state/؋;->آ:I

    iput-object p2, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    iget v0, p0, Landroidx/constraintlayout/core/state/؋;->آ:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_9

    :pswitch_0
    check-cast v3, Lء؅ڱ٢/آ;

    check-cast p1, Lء؅ڱ٢/ؠ;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lء؅ڱ٢/ؠ;->؋:Ljava/net/URL;

    const-string v5, "CctTransportBackend"

    invoke-static {v5}, Lسۄھؤۏ۫/؋;->ر(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v8, "Making request to: %s"

    invoke-static {v8, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p1, Lء؅ڱ٢/ؠ;->؋:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const/16 v6, 0x7530

    invoke-virtual {v0, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    iget v6, v3, Lء؅ڱ٢/آ;->إ:I

    invoke-virtual {v0, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setDoOutput(Z)V

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v1, "POST"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v1, "3.1.9"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "datatransport/%s android/"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "User-Agent"

    invoke-virtual {v0, v2, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Content-Encoding"

    const-string v2, "gzip"

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "application/json"

    const-string v8, "Content-Type"

    invoke-virtual {v0, v8, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "Accept-Encoding"

    invoke-virtual {v0, v6, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, p1, Lء؅ڱ٢/ؠ;->ء:Ljava/lang/String;

    if-eqz v6, :cond_1

    const-string v9, "X-Goog-Api-Key"

    invoke-virtual {v0, v9, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-wide/16 v9, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lڑ٘ڰ٩ۓ۲ىښ/ؠ; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    new-instance v11, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v11, v6}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    :try_start_2
    iget-object v3, v3, Lء؅ڱ٢/آ;->؋:Lڙڧا/ء;

    iget-object p1, p1, Lء؅ڱ٢/ؠ;->ؠ:Lآۋۻؾ۹/ذ;

    new-instance v12, Ljava/io/BufferedWriter;

    new-instance v13, Ljava/io/OutputStreamWriter;

    invoke-direct {v13, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v12, v13}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v3, p1, v12}, Lڙڧا/ء;->أ(Lآۋۻؾ۹/ذ;Ljava/io/BufferedWriter;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    if-eqz v6, :cond_2

    :try_start_4
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/net/ConnectException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lڑ٘ڰ٩ۓ۲ىښ/ؠ; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :cond_2
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v5}, Lسۄھؤۏ۫/؋;->ر(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v7, "Status Code: %d"

    invoke-static {v7, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    const-string v3, "Content-Type: %s"

    invoke-virtual {v0, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v3, v6}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "Content-Encoding: %s"

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v3, v6}, Lسۄھؤۏ۫/؋;->ج(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/16 v3, 0x12e

    if-eq p1, v3, :cond_b

    const/16 v3, 0x12d

    if-eq p1, v3, :cond_b

    const/16 v3, 0x133

    if-ne p1, v3, :cond_4

    goto :goto_3

    :cond_4
    const/16 v3, 0xc8

    if-eq p1, v3, :cond_5

    new-instance v0, Lء؅ڱ٢/ء;

    invoke-direct {v0, p1, v4, v9, v10}, Lء؅ڱ٢/ء;-><init>(ILjava/net/URL;J)V

    goto/16 :goto_8

    :cond_5
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    :try_start_5
    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, v3}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_0

    :cond_6
    move-object v0, v3

    :goto_0
    :try_start_6
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-static {v1}, Lآۋۻؾ۹/خ;->؋(Ljava/io/BufferedReader;)Lآۋۻؾ۹/خ;

    move-result-object v1

    iget-wide v1, v1, Lآۋۻؾ۹/خ;->؋:J

    new-instance v5, Lء؅ڱ٢/ء;

    invoke-direct {v5, p1, v4, v1, v2}, Lء؅ڱ٢/ء;-><init>(ILjava/net/URL;J)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v0, :cond_7

    :try_start_7
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :cond_7
    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_8
    move-object v0, v5

    goto :goto_8

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_9

    :try_start_8
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_9
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    :goto_1
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v3, :cond_a

    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v0

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_2
    throw p1

    :cond_b
    :goto_3
    const-string v1, "Location"

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lء؅ڱ٢/ء;

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, p1, v2, v9, v10}, Lء؅ڱ٢/ء;-><init>(ILjava/net/URL;J)V

    move-object v0, v1

    goto :goto_8

    :catchall_4
    move-exception p1

    :try_start_b
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto :goto_4

    :catchall_5
    move-exception v0

    :try_start_c
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    :catchall_6
    move-exception p1

    if-eqz v6, :cond_c

    :try_start_d
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    goto :goto_5

    :catchall_7
    move-exception v0

    :try_start_e
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c
    :goto_5
    throw p1
    :try_end_e
    .catch Ljava/net/ConnectException; {:try_start_e .. :try_end_e} :catch_3
    .catch Ljava/net/UnknownHostException; {:try_start_e .. :try_end_e} :catch_2
    .catch Lڑ٘ڰ٩ۓ۲ىښ/ؠ; {:try_start_e .. :try_end_e} :catch_1
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0

    :catch_0
    move-exception p1

    goto :goto_6

    :catch_1
    move-exception p1

    :goto_6
    const-string v0, "Couldn\'t encode request, returning with 400"

    invoke-static {v5, v0, p1}, Lسۄھؤۏ۫/؋;->ح(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    new-instance v0, Lء؅ڱ٢/ء;

    const/16 p1, 0x190

    invoke-direct {v0, p1, v4, v9, v10}, Lء؅ڱ٢/ء;-><init>(ILjava/net/URL;J)V

    goto :goto_8

    :catch_2
    move-exception p1

    goto :goto_7

    :catch_3
    move-exception p1

    :goto_7
    const-string v0, "Couldn\'t open connection, returning with 500"

    invoke-static {v5, v0, p1}, Lسۄھؤۏ۫/؋;->ح(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    new-instance v0, Lء؅ڱ٢/ء;

    const/16 p1, 0x1f4

    invoke-direct {v0, p1, v4, v9, v10}, Lء؅ڱ٢/ء;-><init>(ILjava/net/URL;J)V

    :goto_8
    return-object v0

    :goto_9
    check-cast v3, Ljava/util/Map;

    check-cast p1, Landroid/database/Cursor;

    sget-object v0, Lةٌخ/ة;->ا:L؋ڽبژ٦ښيل/ء;

    :goto_a
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v3, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    new-instance v5, Lةٌخ/ب;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lةٌخ/ب;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_e
    return-object v4

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public final create(Lokhttp3/Call;)Lokhttp3/EventListener;
    .locals 1

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lokhttp3/EventListener;

    invoke-static {v0, p1}, Lokhttp3/internal/Util;->؋(Lokhttp3/EventListener;Lokhttp3/Call;)Lokhttp3/EventListener;

    move-result-object p1

    return-object p1
.end method

.method public final execute()Ljava/lang/Object;
    .locals 7

    iget v0, p0, Landroidx/constraintlayout/core/state/؋;->آ:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v4, Lةٌخ/ء;

    check-cast v4, Lةٌخ/ة;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v0, Lإۺهؑڋڻ/؋;->أ:I

    new-instance v0, Lژة۪ڦضۆۿۡ/ص;

    invoke-direct {v0, v1}, Lژة۪ڦضۆۿۡ/ص;-><init>(I)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "SELECT log_source, reason, events_dropped_count FROM log_event_dropped"

    invoke-virtual {v4}, Lةٌخ/ة;->؋()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v5, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    new-instance v3, Lئٱنۃؖۊڄئ/؋;

    const/4 v6, 0x3

    invoke-direct {v3, v4, v1, v0, v6}, Lئٱنۃؖۊڄئ/؋;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {v2, v3}, Lةٌخ/ة;->ف(Landroid/database/Cursor;Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lإۺهؑڋڻ/؋;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :pswitch_1
    check-cast v4, Lةؽڗںۍټ٘/ت;

    iget-object v0, v4, Lةؽڗںۍټ٘/ت;->ا:Lةٌخ/ء;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lةٌخ/إ;

    invoke-direct {v1, v0, v3}, Lةٌخ/إ;-><init>(Lةٌخ/ة;I)V

    invoke-virtual {v0, v1}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    return-object v2

    :pswitch_2
    check-cast v4, Lةٌخ/آ;

    check-cast v4, Lةٌخ/ة;

    iget-object v0, v4, Lةٌخ/ة;->أ:Lثڈا/؋;

    check-cast v0, Lثڈا/ؠ;

    invoke-virtual {v0}, Lثڈا/ؠ;->؋()J

    move-result-wide v0

    iget-object v2, v4, Lةٌخ/ة;->إ:Lةٌخ/؋;

    iget-wide v2, v2, Lةٌخ/؋;->آ:J

    sub-long/2addr v0, v2

    new-instance v2, Lةٌخ/أ;

    invoke-direct {v2, v4, v0, v1}, Lةٌخ/أ;-><init>(Lةٌخ/ة;J)V

    invoke-virtual {v4, v2}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :goto_0
    check-cast v4, Lةؽڗںۍټ٘/ج;

    iget-object v0, v4, Lةؽڗںۍټ٘/ج;->ؠ:Lةٌخ/آ;

    check-cast v0, Lةٌخ/ة;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Landroidx/constraintlayout/core/state/ؠ;

    const/16 v6, 0xb

    invoke-direct {v5, v6}, Landroidx/constraintlayout/core/state/ؠ;-><init>(I)V

    invoke-virtual {v0, v5}, Lةٌخ/ة;->ر(Lةٌخ/ا;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lأۺؘٻڣ/ز;

    iget-object v6, v4, Lةؽڗںۍټ٘/ج;->ء:Lةؽڗںۍټ٘/ح;

    check-cast v6, Lةؽڗںۍټ٘/أ;

    invoke-virtual {v6, v5, v1, v3}, Lةؽڗںۍټ٘/أ;->؋(Lأۺؘٻڣ/ز;IZ)V

    goto :goto_1

    :cond_0
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final getInterpolation(F)F
    .locals 1

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Landroidx/constraintlayout/core/state/Transition;->ؤ(Ljava/lang/String;F)F

    move-result p1

    return p1
.end method

.method public final onCommitContent(Landroidx/core/view/inputmethod/InputContentInfoCompat;ILandroid/os/Bundle;)Z
    .locals 1

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-static {v0, p1, p2, p3}, Landroidx/core/view/inputmethod/InputConnectionCompat;->؋(Landroid/view/View;Landroidx/core/view/inputmethod/InputContentInfoCompat;ILandroid/os/Bundle;)Z

    move-result p1

    return p1
.end method

.method public final onTouchExplorationStateChanged(Z)V
    .locals 3

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lٿخ۴۟ؽ/ة;

    iget-object v1, v0, Lٿخ۴۟ؽ/ة;->ئ:Landroid/widget/AutoCompleteTextView;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/widget/TextView;->getInputType()I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    if-eqz p1, :cond_1

    const/4 v2, 0x2

    :cond_1
    iget-object p1, v0, Lٿخ۴۟ؽ/د;->آ:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {p1, v2}, Landroidx/core/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :cond_2
    return-void
.end method

.method public final ؋(Lؾپۑ۟ڂڷ/ح;)V
    .locals 1

    iget p1, p0, Landroidx/constraintlayout/core/state/؋;->آ:I

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    check-cast v0, Lژة۪ڦضۆۿۡ/ف;

    sget p1, Lژة۪ڦضۆۿۡ/ـ;->ء:I

    iget-object p1, v0, Lژة۪ڦضۆۿۡ/ف;->ؠ:Lؾپۑ۟ڂڷ/ا;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lؾپۑ۟ڂڷ/ا;->ء(Ljava/lang/Object;)V

    return-void

    :pswitch_1
    check-cast v0, Landroid/content/Intent;

    invoke-static {v0}, Lژة۪ڦضۆۿۡ/ؿ;->؋(Landroid/content/Intent;)V

    return-void

    :goto_0
    check-cast v0, Ljava/util/concurrent/ScheduledFuture;

    const/4 p1, 0x0

    invoke-interface {v0, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    return-void

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final ء(Ljava/lang/Object;)V
    .locals 4

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lڜٟٱڀ/د;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "fcmToken"

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v3, v0, Lڜٟٱڀ/د;->آ:Lةؽڗںۍټ٘/ء;

    if-eqz v3, :cond_0

    invoke-virtual {v3, v1, v2}, Lةؽڗںۍټ٘/ء;->آ(Ljava/lang/String;Lorg/json/JSONObject;)Z

    :cond_0
    iget-object v0, v0, Lڜٟٱڀ/د;->؋:Landroid/content/Context;

    const-string v1, "fcm"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "token"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public final آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Landroidx/constraintlayout/core/state/؋;->أ:Ljava/lang/Object;

    check-cast v0, Lأۺؘٻڣ/ئ;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v0, Ljava/io/IOException;

    iget-object v1, p1, Lؾپۑ۟ڂڷ/ح;->؋:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v2, p1, Lؾپۑ۟ڂڷ/ح;->ء:Z

    const-string v3, "Task is not yet complete"

    invoke-static {v3, v2}, Lسۄھؤۏ۫/؋;->ة(Ljava/lang/String;Z)V

    iget-boolean v2, p1, Lؾپۑ۟ڂڷ/ح;->آ:Z

    if-nez v2, :cond_7

    iget-object v2, p1, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v0, p1, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    if-nez v0, :cond_5

    iget-object p1, p1, Lؾپۑ۟ڂڷ/ح;->أ:Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    check-cast p1, Landroid/os/Bundle;

    const-string v0, "SERVICE_NOT_AVAILABLE"

    if-eqz p1, :cond_4

    const-string v1, "registration_id"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "unregistered"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    :goto_0
    return-object v1

    :cond_1
    const-string v1, "error"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "RST"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz v1, :cond_2

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected response: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    const-string v2, "FirebaseMessaging"

    invoke-static {v2, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "INSTANCE_ID_RESET"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :try_start_1
    new-instance p1, Lؾپۑ۟ڂڷ/إ;

    invoke-direct {p1, v0}, Lؾپۑ۟ڂڷ/إ;-><init>(Ljava/lang/Exception;)V

    throw p1

    :cond_6
    iget-object p1, p1, Lؾپۑ۟ڂڷ/ح;->ؤ:Ljava/lang/Exception;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Throwable;

    throw p1

    :cond_7
    new-instance p1, Ljava/util/concurrent/CancellationException;

    const-string v0, "Task is already canceled."

    invoke-direct {p1, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw p1

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method
