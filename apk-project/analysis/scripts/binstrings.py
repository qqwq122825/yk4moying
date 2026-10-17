import re,sys
for name in ["lib/arm64-v8a/libnative-guard.so","lib/arm64-v8a/libadb.so"]:
    p = r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk\extracted\\" + name.replace("/","\\")
    data = open(p,"rb").read()
    strs = re.findall(rb"[\x20-\x7e]{5,200}", data)
    out = p + ".strings.txt"
    with open(out,"w",encoding="utf-8",errors="replace") as f:
        for s in strs:
            f.write(s.decode("utf-8","replace")+"\n")
    print(name, len(strs))
