.class public final synthetic Lژة۪ڦضۆۿۡ/ز;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/ؤ;


# instance fields
.field public final synthetic آ:Landroid/content/Context;

.field public final synthetic أ:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lژة۪ڦضۆۿۡ/ز;->آ:Landroid/content/Context;

    iput-boolean p2, p0, Lژة۪ڦضۆۿۡ/ز;->أ:Z

    return-void
.end method


# virtual methods
.method public final ء(Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lژة۪ڦضۆۿۡ/ز;->آ:Landroid/content/Context;

    invoke-static {p1}, Lڗًقڔ/؋;->ؽ(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "proxy_retention"

    iget-boolean v1, p0, Lژة۪ڦضۆۿۡ/ز;->أ:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
