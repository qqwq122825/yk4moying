.class public final Lڒ٠ئڿؕکڡ/آ;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lڑۣػٻٷج/؋;


# static fields
.field public static final أ:Lڒ٠ئڿؕکڡ/؋;

.field public static final ؤ:Lڒ٠ئڿؕکڡ/ؠ;

.field public static final إ:Lڒ٠ئڿؕکڡ/ؠ;

.field public static final ئ:Lڒ٠ئڿؕکڡ/ء;


# instance fields
.field public final ؋:Ljava/util/HashMap;

.field public final ؠ:Ljava/util/HashMap;

.field public final ء:Lڒ٠ئڿؕکڡ/؋;

.field public آ:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    new-instance v0, Lڒ٠ئڿؕکڡ/؋;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lڒ٠ئڿؕکڡ/؋;-><init>(I)V

    sput-object v0, Lڒ٠ئڿؕکڡ/آ;->أ:Lڒ٠ئڿؕکڡ/؋;

    new-instance v0, Lڒ٠ئڿؕکڡ/ؠ;

    invoke-direct {v0, v1}, Lڒ٠ئڿؕکڡ/ؠ;-><init>(I)V

    sput-object v0, Lڒ٠ئڿؕکڡ/آ;->ؤ:Lڒ٠ئڿؕکڡ/ؠ;

    new-instance v0, Lڒ٠ئڿؕکڡ/ؠ;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lڒ٠ئڿؕکڡ/ؠ;-><init>(I)V

    sput-object v0, Lڒ٠ئڿؕکڡ/آ;->إ:Lڒ٠ئڿؕکڡ/ؠ;

    new-instance v0, Lڒ٠ئڿؕکڡ/ء;

    invoke-direct {v0}, Lڒ٠ئڿؕکڡ/ء;-><init>()V

    sput-object v0, Lڒ٠ئڿؕکڡ/آ;->ئ:Lڒ٠ئڿؕکڡ/ء;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lڒ٠ئڿؕکڡ/آ;->؋:Ljava/util/HashMap;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lڒ٠ئڿؕکڡ/آ;->ؠ:Ljava/util/HashMap;

    sget-object v2, Lڒ٠ئڿؕکڡ/آ;->أ:Lڒ٠ئڿؕکڡ/؋;

    iput-object v2, p0, Lڒ٠ئڿؕکڡ/آ;->ء:Lڒ٠ئڿؕکڡ/؋;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lڒ٠ئڿؕکڡ/آ;->آ:Z

    sget-object v2, Lڒ٠ئڿؕکڡ/آ;->ؤ:Lڒ٠ئڿؕکڡ/ؠ;

    const-class v3, Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Lڒ٠ئڿؕکڡ/آ;->إ:Lڒ٠ئڿؕکڡ/ؠ;

    const-class v3, Ljava/lang/Boolean;

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-class v2, Ljava/util/Date;

    sget-object v3, Lڒ٠ئڿؕکڡ/آ;->ئ:Lڒ٠ئڿؕکڡ/ء;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ؋(Ljava/lang/Class;Lڑ٘ڰ٩ۓ۲ىښ/آ;)Lڑۣػٻٷج/؋;
    .locals 1

    iget-object v0, p0, Lڒ٠ئڿؕکڡ/آ;->؋:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lڒ٠ئڿؕکڡ/آ;->ؠ:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
