# ───────────── 3.0 混淆规则（R8）—— 只保留"按名字被引用"的东西 ─────────────
# 清单里的 Activity/Service/Receiver 由 AAPT 自动生成 keep 规则，不用手写。

# 1) JS 桥：HTML 里写死了 Android.returnResult / FKB.setFormData 等方法名
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
# 桥对象本身由代码 new 出来，方法名保留即可

# 2) 代码里用字符串引用的类（反射/组件名）
-keep class com.zaka.screenagent.admin.MoyingAdminReceiver { *; }
-keep class com.zaka.screenagent.accessibility.BoundaryAccessibilityService { *; }
-keep class com.zaka.screenagent.notify.NotificationListener { *; }

# 3) 无障碍/管理员基类回调
-keep class * extends android.accessibilityservice.AccessibilityService { *; }
-keep class * extends android.app.admin.DeviceAdminReceiver { *; }

# 4) 注解与签名信息（Kotlin 反射、@JavascriptInterface 识别都需要）
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod

# 5) 第三方噪音
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-ignorewarnings

# 6) 类名混淆字典：阿拉伯字母（对齐 2.2 的风格）
-obfuscationdictionary obfuscation-dictionary.txt
