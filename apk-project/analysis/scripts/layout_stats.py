import os
B=r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk"
def sz(p):
    if os.path.isfile(p): return os.path.getsize(p)
    t=0
    for dp,_,fs in os.walk(p):
        for f in fs:
            try: t+=os.path.getsize(os.path.join(dp,f))
            except OSError: pass
    return t
def cnt(p):
    if os.path.isfile(p): return 1
    n=0
    for dp,_,fs in os.walk(p): n+=len(fs)
    return n
tot=0
for e in sorted(os.listdir(B)):
    p=os.path.join(B,e); tot+=sz(p)
    print("%-26s %-4s %8.1f MB  files=%5d"%(e,"DIR" if os.path.isdir(p) else "FILE",sz(p)/1048576,cnt(p)))
print("TOTAL %.1f MB"%(tot/1048576))
print()
for sub in ["apktool_out","jadx_src","extracted","rebuilt","tools","report","scripts"]:
    print("--",sub)
    for e in sorted(os.listdir(os.path.join(B,sub))):
        p=os.path.join(B,sub,e)
        print("   %-28s %-4s %8.2f MB files=%5d"%(e,"DIR" if os.path.isdir(p) else "FILE",sz(p)/1048576,cnt(p)))
