import zipfile,io,os,re,json
BASE=r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk"
orig=open(os.path.join(BASE,"dex_strings.txt"),encoding="utf-8",errors="replace").read().split("\n")
reb=zipfile.ZipFile(os.path.join(BASE,"rebuilt","signed","a0dcf711.rebuilt-aligned-debugSigned.apk")).read("classes.dex")
# rebuilt string pool via dexstrings
import importlib.util
spec=importlib.util.spec_from_file_location("ds", os.path.join(BASE,"scripts","dexstrings.py"))
ds=importlib.util.module_from_spec(spec); spec.loader.exec_module(ds)
reb_pool=ds.parse_dex_strings(reb)
native=open(os.path.join(BASE,"extracted","lib","arm64-v8a","libnative-guard.so.strings.txt"),encoding="utf-8",errors="replace").read()
jadx_idx=""
for root,_,fs in os.walk(os.path.join(BASE,"jadx_src","sources")):
    for f in fs:
        if f.endswith(".java"):
            jadx_idx+=open(os.path.join(root,f),encoding="utf-8",errors="replace").read()
consts=[
 ("引导接口","https://www.cohuducox.com/adv.php?apk=10068&device="),
 ("WS 路径","/ws/binary-device?deviceId="),
 ("WS 协议前缀","wss://"),
 ("Socket.IO 路径前缀","/io"),
 ("Socket.IO 查询串","apkid=10068&line="),
 ("查询串续","&cmode=test&device="),
 ("版本参数","&ver=v4.0"),
 ("AES 密钥","0623U25KTT3YO8P9"),
 ("AES 变换","AES/ECB/PKCS5Padding"),
 ("出站事件","enc msg"),
 ("入站事件","new_msg"),
 ("上线包","deviceOnline"),
 ("登录事件","binary_ws_connected"),
 ("诊断上报","https://www.cohuducox.com/api/device_log"),
 ("OCR 接口","https://cohuducox.com/api/ocr-captcha"),
 ("电池配置","https://www.cohuducox.com/api/battery_config?brand="),
 ("TG Bot","https://api.telegram.org/bot8798681434"),
 ("TG chat","{\"chat_id\":\"-5238151960\""),
 ("钓鱼落地","https://www.kisskissly.com/v?scene=pe95ss"),
 ("apkId","apkId"),
]
rows=[]
for name,c in consts:
    a=any(c in s for s in orig); b=any(c in s for s in reb_pool); d=(c in jadx_idx); e=(c in native)
    rows.append((name,c,a,b,d,e))
print("%-16s %-52s %-7s %-7s %-6s %-6s"%("项目","常量","原始dex","重编dex","jadx源","native"))
for r in rows:
    print("%-16s %-52s %-8s %-8s %-7s %-6s"%(r[0],r[1][:52],r[2],r[3],r[4],r[5]))
print("\n一致(orig==rebuilt):", all(r[2]==r[3] for r in rows))
