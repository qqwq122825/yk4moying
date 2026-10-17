.class public final synthetic Lږٍڔڴٝ/ؠ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic آ:I

.field public final synthetic أ:Ljava/lang/Object;

.field public final synthetic ؤ:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ZI)V
    .locals 0

    iput p3, p0, Lږٍڔڴٝ/ؠ;->آ:I

    iput-object p1, p0, Lږٍڔڴٝ/ؠ;->أ:Ljava/lang/Object;

    iput-boolean p2, p0, Lږٍڔڴٝ/ؠ;->ؤ:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    iget v0, p0, Lږٍڔڴٝ/ؠ;->آ:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_c

    :pswitch_0
    iget-object v0, p0, Lږٍڔڴٝ/ؠ;->أ:Ljava/lang/Object;

    check-cast v0, Lږٍڔڴٝ/ء;

    iget-boolean v2, p0, Lږٍڔڴٝ/ؠ;->ؤ:Z

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lږٍڔڴٝ/ء;->ث:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v4, v0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v4}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v4, v4, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-static {v4}, Lآۋۻؾ۹/ة;->ؠ(Landroid/content/Context;)Lآۋۻؾ۹/ة;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    :try_start_1
    iget-object v5, v0, Lږٍڔڴٝ/ء;->ء:Lآۋۻؾ۹/ة;

    invoke-virtual {v5}, Lآۋۻؾ۹/ة;->ب()Lږۄڙ/؋;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    if-eqz v4, :cond_0

    :try_start_2
    invoke-virtual {v4}, Lآۋۻؾ۹/ة;->ة()V

    :cond_0
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    :try_start_3
    sget-object v4, Lږۄڙ/ء;->ئ:Lږۄڙ/ء;

    iget-object v6, v5, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    const/4 v7, 0x0

    if-ne v6, v4, :cond_1

    move v8, v1

    goto :goto_0

    :cond_1
    move v8, v7

    :goto_0
    if-nez v8, :cond_5

    sget-object v8, Lږۄڙ/ء;->ؤ:Lږۄڙ/ء;

    if-ne v6, v8, :cond_2

    move v6, v1

    goto :goto_1

    :cond_2
    move v6, v7

    :goto_1
    if-eqz v6, :cond_3

    goto :goto_2

    :cond_3
    if-nez v2, :cond_4

    iget-object v2, v0, Lږٍڔڴٝ/ء;->آ:Lږٍڔڴٝ/ب;

    invoke-virtual {v2, v5}, Lږٍڔڴٝ/ب;->؋(Lږۄڙ/؋;)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_4
    invoke-virtual {v0, v5}, Lږٍڔڴٝ/ء;->ؠ(Lږۄڙ/؋;)Lږۄڙ/؋;

    move-result-object v2

    goto :goto_3

    :catch_0
    move-exception v1

    goto/16 :goto_9

    :cond_5
    :goto_2
    invoke-virtual {v0, v5}, Lږٍڔڴٝ/ء;->إ(Lږۄڙ/؋;)Lږۄڙ/؋;

    move-result-object v2
    :try_end_3
    .catch Lږٍڔڴٝ/أ; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    monitor-enter v3

    :try_start_4
    iget-object v6, v0, Lږٍڔڴٝ/ء;->؋:Lڃٷښـ۝ۼ/إ;

    invoke-virtual {v6}, Lڃٷښـ۝ۼ/إ;->؋()V

    iget-object v6, v6, Lڃٷښـ۝ۼ/إ;->؋:Landroid/content/Context;

    invoke-static {v6}, Lآۋۻؾ۹/ة;->ؠ(Landroid/content/Context;)Lآۋۻؾ۹/ة;

    move-result-object v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    :try_start_5
    iget-object v8, v0, Lږٍڔڴٝ/ء;->ء:Lآۋۻؾ۹/ة;

    invoke-virtual {v8, v2}, Lآۋۻؾ۹/ة;->ا(Lږۄڙ/؋;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v6, :cond_6

    :try_start_6
    invoke-virtual {v6}, Lآۋۻؾ۹/ة;->ة()V

    :cond_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    monitor-enter v0

    :try_start_7
    iget-object v3, v0, Lږٍڔڴٝ/ء;->ة:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    if-eqz v3, :cond_8

    iget-object v3, v5, Lږۄڙ/؋;->؋:Ljava/lang/String;

    iget-object v5, v2, Lږۄڙ/؋;->؋:Ljava/lang/String;

    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, v0, Lږٍڔڴٝ/ء;->ة:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_7

    goto :goto_4

    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const/4 v1, 0x0

    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :cond_8
    :goto_4
    monitor-exit v0

    sget-object v3, Lږۄڙ/ء;->إ:Lږۄڙ/ء;

    iget-object v5, v2, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    if-ne v5, v3, :cond_9

    move v3, v1

    goto :goto_5

    :cond_9
    move v3, v7

    :goto_5
    if-eqz v3, :cond_a

    iget-object v3, v2, Lږۄڙ/؋;->؋:Ljava/lang/String;

    monitor-enter v0

    :try_start_8
    iput-object v3, v0, Lږٍڔڴٝ/ء;->ب:Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit v0

    goto :goto_6

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :cond_a
    :goto_6
    iget-object v3, v2, Lږۄڙ/؋;->ؠ:Lږۄڙ/ء;

    if-ne v3, v4, :cond_b

    move v4, v1

    goto :goto_7

    :cond_b
    move v4, v7

    :goto_7
    if-eqz v4, :cond_c

    new-instance v1, Lږٍڔڴٝ/أ;

    invoke-direct {v1}, Lږٍڔڴٝ/أ;-><init>()V

    goto :goto_9

    :cond_c
    sget-object v4, Lږۄڙ/ء;->أ:Lږۄڙ/ء;

    if-eq v3, v4, :cond_e

    sget-object v4, Lږۄڙ/ء;->آ:Lږۄڙ/ء;

    if-ne v3, v4, :cond_d

    goto :goto_8

    :cond_d
    move v1, v7

    :cond_e
    :goto_8
    if-eqz v1, :cond_f

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Installation ID could not be validated with the Firebase servers (maybe it was deleted). Firebase Installations will need to create a new Installation ID and auth token. Please retry your last request."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    :cond_f
    invoke-virtual {v0, v2}, Lږٍڔڴٝ/ء;->ئ(Lږۄڙ/؋;)V

    goto :goto_b

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1

    :catchall_2
    move-exception v0

    if-eqz v6, :cond_10

    :try_start_9
    invoke-virtual {v6}, Lآۋۻؾ۹/ة;->ة()V

    :cond_10
    throw v0

    :catchall_3
    move-exception v0

    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    throw v0

    :goto_9
    iget-object v2, v0, Lږٍڔڴٝ/ء;->إ:Ljava/lang/Object;

    monitor-enter v2

    :try_start_a
    iget-object v0, v0, Lږٍڔڴٝ/ء;->ت:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lږٍڔڴٝ/ا;

    invoke-interface {v3, v1}, Lږٍڔڴٝ/ا;->؋(Ljava/lang/Exception;)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_a

    :cond_12
    monitor-exit v2

    :cond_13
    :goto_b
    return-void

    :catchall_4
    move-exception v0

    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw v0

    :catchall_5
    move-exception v0

    if-eqz v4, :cond_14

    :try_start_b
    invoke-virtual {v4}, Lآۋۻؾ۹/ة;->ة()V

    :cond_14
    throw v0

    :catchall_6
    move-exception v0

    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    throw v0

    :pswitch_1
    iget-object v0, p0, Lږٍڔڴٝ/ؠ;->أ:Ljava/lang/Object;

    check-cast v0, Lږٍڔڴٝ/ء;

    iget-boolean v1, p0, Lږٍڔڴٝ/ؠ;->ؤ:Z

    invoke-virtual {v0, v1}, Lږٍڔڴٝ/ء;->؋(Z)V

    return-void

    :goto_c
    iget-object v0, p0, Lږٍڔڴٝ/ؠ;->أ:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-boolean v2, p0, Lږٍڔڴٝ/ؠ;->ؤ:Z

    if-eqz v2, :cond_15

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getWindowInsetsController(Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;

    move-result-object v2

    if-eqz v2, :cond_15

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v0

    invoke-virtual {v2, v0}, Landroidx/core/view/WindowInsetsControllerCompat;->show(I)V

    goto :goto_d

    :cond_15
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Landroid/view/inputmethod/InputMethodManager;

    invoke-static {v2, v3}, Landroidx/core/content/ContextCompat;->getSystemService(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v2, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :goto_d
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
