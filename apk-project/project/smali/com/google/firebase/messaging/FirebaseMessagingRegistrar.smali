.class public Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-fcm"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static synthetic lambda$getComponents$0(Lڊ۟چڗۙ٦/س;Lڊ۟چڗۙ٦/آ;)Lcom/google/firebase/messaging/FirebaseMessaging;
    .locals 8

    new-instance v7, Lcom/google/firebase/messaging/FirebaseMessaging;

    const-class v0, Lڃٷښـ۝ۼ/إ;

    invoke-interface {p1, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lڃٷښـ۝ۼ/إ;

    const-class v0, Lڔۣٯٿک/؋;

    invoke-interface {p1, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/activity/result/؋;->ذ(Ljava/lang/Object;)V

    const-class v0, Lڙڧا/ؠ;

    invoke-interface {p1, v0}, Lڊ۟چڗۙ٦/آ;->ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object v2

    const-class v0, Lړجإٖټض/إ;

    invoke-interface {p1, v0}, Lڊ۟چڗۙ٦/آ;->ؠ(Ljava/lang/Class;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object v3

    const-class v0, Lږٍڔڴٝ/آ;

    invoke-interface {p1, v0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lږٍڔڴٝ/آ;

    invoke-interface {p1, p0}, Lڊ۟چڗۙ٦/آ;->ؤ(Lڊ۟چڗۙ٦/س;)Lڕۇۅؑۨؼ۫ە/؋;

    move-result-object v5

    const-class p0, Lڒڬؾۓؾ/ؠ;

    invoke-interface {p1, p0}, Lڊ۟چڗۙ٦/آ;->؋(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lڒڬؾۓؾ/ؠ;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/messaging/FirebaseMessaging;-><init>(Lڃٷښـ۝ۼ/إ;Lڕۇۅؑۨؼ۫ە/؋;Lڕۇۅؑۨؼ۫ە/؋;Lږٍڔڴٝ/آ;Lڕۇۅؑۨؼ۫ە/؋;Lڒڬؾۓؾ/ؠ;)V

    return-object v7
.end method

.method public static synthetic ؋(Lڊ۟چڗۙ٦/س;Lآۋۻؾ۹/ث;)Lcom/google/firebase/messaging/FirebaseMessaging;
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;->lambda$getComponents$0(Lڊ۟چڗۙ٦/س;Lڊ۟چڗۙ٦/آ;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 8
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "L\u068a\u06df\u0686\u0697\u06d9\u0666/\u0621;",
            ">;"
        }
    .end annotation

    new-instance v0, Lڊ۟چڗۙ٦/س;

    const-class v1, Lڐضش/ؠ;

    const-class v2, L؋ڽبژ٦ښيل/أ;

    invoke-direct {v0, v1, v2}, Lڊ۟چڗۙ٦/س;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    const/4 v1, 0x2

    new-array v1, v1, [Lڊ۟چڗۙ٦/ء;

    new-instance v2, Lڊ۟چڗۙ٦/ؠ;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-direct {v2, v5, v4}, Lڊ۟چڗۙ٦/ؠ;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    const-string v4, "fire-fcm"

    iput-object v4, v2, Lڊ۟چڗۙ٦/ؠ;->؋:Ljava/lang/String;

    const-class v5, Lڃٷښـ۝ۼ/إ;

    invoke-static {v5}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v5

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    const-class v6, Lڔۣٯٿک/؋;

    invoke-direct {v5, v3, v3, v6}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    const/4 v6, 0x1

    const-class v7, Lڙڧا/ؠ;

    invoke-direct {v5, v3, v6, v7}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    const-class v7, Lړجإٖټض/إ;

    invoke-direct {v5, v3, v6, v7}, Lڊ۟چڗۙ٦/ت;-><init>(IILjava/lang/Class;)V

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    const-class v5, Lږٍڔڴٝ/آ;

    invoke-static {v5}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v5

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v5, Lڊ۟چڗۙ٦/ت;

    invoke-direct {v5, v0, v3, v6}, Lڊ۟چڗۙ٦/ت;-><init>(Lڊ۟چڗۙ٦/س;II)V

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    const-class v5, Lڒڬؾۓؾ/ؠ;

    invoke-static {v5}, Lڊ۟چڗۙ٦/ت;->؋(Ljava/lang/Class;)Lڊ۟چڗۙ٦/ت;

    move-result-object v5

    invoke-virtual {v2, v5}, Lڊ۟چڗۙ٦/ؠ;->؋(Lڊ۟چڗۙ٦/ت;)V

    new-instance v5, Lړجإٖټض/ؠ;

    invoke-direct {v5, v0, v6}, Lړجإٖټض/ؠ;-><init>(Lڊ۟چڗۙ٦/س;I)V

    iput-object v5, v2, Lڊ۟چڗۙ٦/ؠ;->ؤ:Lڊ۟چڗۙ٦/ؤ;

    iget v0, v2, Lڊ۟چڗۙ٦/ؠ;->آ:I

    if-nez v0, :cond_0

    move v0, v6

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_1

    iput v6, v2, Lڊ۟چڗۙ٦/ؠ;->آ:I

    invoke-virtual {v2}, Lڊ۟چڗۙ٦/ؠ;->ؠ()Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    aput-object v0, v1, v3

    const-string v0, "24.0.0"

    invoke-static {v4, v0}, Lڗًقڔ/؋;->ر(Ljava/lang/String;Ljava/lang/String;)Lڊ۟چڗۙ٦/ء;

    move-result-object v0

    aput-object v0, v1, v6

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Instantiation type has already been set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
