import os,hashlib,json
a=os.path.join(r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk","apktool_out","smali")
b=os.path.join(r"C:\Users\Administrator\Documents\deepseek-harness\default-workspace\rea_apk","apktool_out_rebuilt","smali")
def idx(root):
    m={}
    for dp,_,fs in os.walk(root):
        for f in fs:
            if f.endswith(".smali"):
                p=os.path.join(dp,f)
                rel=os.path.relpath(p,root)
                m[rel]=hashlib.sha256(open(p,"rb").read()).hexdigest()
    return m
A,B=idx(a),idx(b)
same=sum(1 for k in A if k in B and A[k]==B[k])
print("smali files: %d vs %d, identical bytes: %d"%(len(A),len(B),same))
diff=[k for k in A if k in B and A[k]!=B[k]]
print("differing files:",len(diff))
for k in diff[:10]: print("  ",k)
onlyA=[k for k in A if k not in B]; onlyB=[k for k in B if k not in A]
print("only-original:",len(onlyA),onlyA[:5]); print("only-rebuilt:",len(onlyB),onlyB[:5])
# show one sample diff
if diff:
    import difflib
    k=diff[0]
    ta=open(os.path.join(a,k),encoding="utf-8",errors="replace").read().splitlines()
    tb=open(os.path.join(b,k),encoding="utf-8",errors="replace").read().splitlines()
    d=list(difflib.unified_diff(ta,tb,lineterm="",n=1))
    print("sample diff",k,"lines",len(d))
    print("\n".join(d[:40]))
