import struct,os
p=os.path.join(r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk","extracted","lib","arm64-v8a","libnative-guard.so")
d=open(p,"rb").read()
shoff=struct.unpack_from("<Q",d,0x28)[0]; shentsize=struct.unpack_from("<H",d,0x3a)[0]; shnum=struct.unpack_from("<H",d,0x3c)[0]
secs=[]
for i in range(shnum):
    o=shoff+i*shentsize
    name,typ,flags,addr,off,size,link,info,align,entsize=struct.unpack_from("<IIQQQQIIQQ",d,o)
    secs.append(dict(name=name,addr=addr,off=off,size=size,link=link,entsize=entsize))
shstr=secs[struct.unpack_from("<H",d,0x3e)[0]]
def sname(n):
    e=d.index(b"\x00",shstr["off"]+n); return d[shstr["off"]+n:e].decode()
for s in secs:
    if sname(s["name"])==".dynsym":
        strtab=secs[s["link"]]; cnt=s["size"]//24
        for k in range(cnt):
            o=s["off"]+k*24
            nameo,info,other,shndx,value,size=struct.unpack_from("<IBBHQQ",d,o)
            e=d.index(b"\x00",strtab["off"]+nameo) if nameo else 0
            n=d[strtab["off"]+nameo:e].decode() if nameo else ""
            print("%-52s 0x%-5x size=%-5d type=%d"%(n,value,size,info&0xf))
