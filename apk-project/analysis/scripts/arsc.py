import sys, struct
sys.path.insert(0, r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk\scripts")
from axml import RES_STRING_POOL, u16, u32, parse_string_pool
data = open(r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk\extracted\resources.arsc","rb").read()
off = 12  # skip ResTable header (type,headerSize,size,packageCount)
strings=[]
while off < len(data):
    typ = u16(data,off); hs = u16(data,off+2); size = u32(data,off+4)
    if size == 0: break
    if typ == RES_STRING_POOL:
        strings,_ = parse_string_pool(data, off)
        break
    off += size
print("count", len(strings))
with open(r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk\res_strings.txt","w",encoding="utf-8",errors="replace") as f:
    for s in strings:
        f.write(s.replace("\n","\\n")+"\n")
