import os,re,collections
B=r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk\jadx_src\sources"
rows=[]
for e in sorted(os.listdir(B)):
    p=os.path.join(B,e)
    if not (os.path.isdir(p) and re.fullmatch(r"p\d{3}",e)): continue
    files=[f for f in os.listdir(p) if f.endswith(".java")]
    pkgs=collections.Counter()
    for f in files:
        try: t=open(os.path.join(p,f),encoding="utf-8",errors="replace").read(1200)
        except Exception: continue
        m=re.search(r"renamed from: ([^.\s]+)\.",t)
        if m: pkgs[m.group(1)]+=1
    pkg=pkgs.most_common(1)[0][0] if pkgs else "?"
    rows.append((e,pkg,len(files)))
for r in rows: print("%-6s %-24s %3d"%(r[0],r[1],r[2]))
