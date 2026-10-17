.class public abstract Lھۥٓڍچ/أ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ؋:Ljava/util/List;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    invoke-static {}, Landroidx/activity/result/؋;->ج()Ljava/util/Iterator;

    move-result-object v0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lڗًقڔ/؋;->ت(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lڡپٔۯ/خ;

    const/4 v2, 0x2

    invoke-direct {v1, v2, v0}, Lڡپٔۯ/خ;-><init>(ILjava/lang/Object;)V

    instance-of v0, v1, Lڸڈڲ/؋;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lڸڈڲ/؋;

    invoke-direct {v0, v1}, Lڸڈڲ/؋;-><init>(Lڡپٔۯ/خ;)V

    move-object v1, v0

    :goto_0
    invoke-static {v1}, Lڸڈڲ/ت;->ل(Lڸڈڲ/ا;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lھۥٓڍچ/أ;->؋:Ljava/util/List;

    return-void
.end method
