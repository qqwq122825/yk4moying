.class final Lio/socket/engineio/parser/Parser$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/socket/engineio/parser/Parser$EncodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/socket/engineio/parser/Parser;->encodeOneBinaryPacket(Lio/socket/engineio/parser/Packet;Lio/socket/engineio/parser/Parser$EncodeCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$doneCallback:Lio/socket/engineio/parser/Parser$EncodeCallback;


# direct methods
.method public constructor <init>(Lio/socket/engineio/parser/Parser$EncodeCallback;)V
    .locals 0

    iput-object p1, p0, Lio/socket/engineio/parser/Parser$4;->val$doneCallback:Lio/socket/engineio/parser/Parser$EncodeCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)V
    .locals 7

    instance-of v0, p1, Ljava/lang/String;

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    new-array v5, v4, [B

    aput-byte v3, v5, v3

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_0

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v5, v6

    move v3, v6

    goto :goto_0

    :cond_0
    sub-int/2addr v4, v2

    aput-byte v1, v5, v4

    iget-object v0, p0, Lio/socket/engineio/parser/Parser$4;->val$doneCallback:Lio/socket/engineio/parser/Parser$EncodeCallback;

    invoke-static {p1}, Lio/socket/engineio/parser/Parser;->access$100(Ljava/lang/String;)[B

    move-result-object p1

    filled-new-array {v5, p1}, [[B

    move-result-object p1

    invoke-static {p1}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object p1

    invoke-interface {v0, p1}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void

    :cond_1
    check-cast p1, [B

    array-length v0, p1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    new-array v5, v4, [B

    aput-byte v2, v5, v3

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_2

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v5, v6

    move v3, v6

    goto :goto_1

    :cond_2
    sub-int/2addr v4, v2

    aput-byte v1, v5, v4

    iget-object v0, p0, Lio/socket/engineio/parser/Parser$4;->val$doneCallback:Lio/socket/engineio/parser/Parser$EncodeCallback;

    filled-new-array {v5, p1}, [[B

    move-result-object p1

    invoke-static {p1}, Lio/socket/engineio/parser/Buffer;->concat([[B)[B

    move-result-object p1

    invoke-interface {v0, p1}, Lio/socket/engineio/parser/Parser$EncodeCallback;->call(Ljava/lang/Object;)V

    return-void
.end method
