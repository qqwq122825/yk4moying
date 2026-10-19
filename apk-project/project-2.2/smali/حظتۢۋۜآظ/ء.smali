.class public final synthetic Lحظتۢۋۜآظ/ء;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lؾپۑ۟ڂڷ/؋;


# static fields
.field public static final synthetic آ:Lحظتۢۋۜآظ/ء;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lحظتۢۋۜآظ/ء;

    invoke-direct {v0}, Lحظتۢۋۜآظ/ء;-><init>()V

    sput-object v0, Lحظتۢۋۜآظ/ء;->آ:Lحظتۢۋۜآظ/ء;

    return-void
.end method


# virtual methods
.method public final آ(Lؾپۑ۟ڂڷ/ح;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p1}, Lؾپۑ۟ڂڷ/ح;->ؤ()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    const-string v0, "notification_data"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    if-eqz p1, :cond_0

    new-instance v0, Lحظتۢۋۜآظ/؋;

    invoke-direct {v0, p1}, Lحظتۢۋۜآظ/؋;-><init>(Landroid/content/Intent;)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
