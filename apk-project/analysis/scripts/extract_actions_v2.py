#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""action -> JSON parameter keys for the C2 command protocol (com.lite.cloudfinder).

Chain: CommandDispatcher switch (action -> case) -> case body -> delegated method ->
delegated Runnable#case -> optString/optInt/optBoolean/has(...) literals.
Resolution depth: 3 (case -> method -> Runnable switch case).
Output: action_table.tsv
"""
import re, os, csv, glob

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(BASE, 'jadx_src', 'sources', 'p086', 'C0797.java')
text = open(SRC, encoding='utf-8').read()
lines = text.splitlines()

# ---------------- action -> case index
pairs = {}
for m in re.finditer(r'if \(!str4\.equals\("([^"]+)"\)\) \{\s*b = -1;\s*\} else \{\s*b = (\d+);', text):
    pairs[m.group(1)] = int(m.group(2))

# ---------------- case index -> body
sw = next(i for i, l in enumerate(lines) if 'switch (b) {' in l)
bodies, pending, buf = {}, [], []
CASE_RE = re.compile(r'case .*?/\* (\d+) \*/\s*:$|case (\d+):$')
for l in lines[sw + 1:]:
    s = l.strip()
    if s.startswith('default:'):
        break
    m = CASE_RE.match(s)
    if m:
        if pending and buf:
            for c in pending:
                bodies[c] = '\n'.join(buf)
        pending.append(int(m.group(1) or m.group(2)))
        buf = []
        continue
    if s == 'break;':
        for c in pending:
            bodies[c] = '\n'.join(buf)
        pending, buf = [], []
        continue
    if pending:
        buf.append(l)

# ---------------- class / method index
files = glob.glob(os.path.join(BASE, 'jadx_src', 'sources', '**', '*.java'), recursive=True)
classpath, methodidx = {}, {}
DECL_RE = re.compile(r'^(?:(?:public|final|abstract|static|synchronized|private|protected) |/\*[^*]*\*/ )*'
                     r'(?:class|interface|enum) ([A-Za-z_$][\w$]*)', re.M)
BODY_RE = re.compile(r'\n    (?:public|private|protected)(?: static)?(?: final)?[^\n]*?'
                     r'\b(m\d+|run|call|doWork|invoke)\(([^)]*)\)[^\n{]*\{')
for fp in files:
    try:
        t = open(fp, encoding='utf-8', errors='replace').read()
    except Exception:
        continue
    for d in DECL_RE.finditer(t):  # noqa
        classpath.setdefault(d.group(1), fp)
    idx = {}
    for m in BODY_RE.finditer(t):
        name = m.group(1)
        if name in idx:
            continue
        i, depth = m.end(), 1
        while i < len(t) and depth:
            if t[i] == '{':
                depth += 1
            elif t[i] == '}':
                depth -= 1
            i += 1
        idx[name] = t[m.end():i]
    methodidx[fp] = idx

OPT_RE = re.compile(r'opt(?:String|Int|Boolean|JSONArray|JSONObject|Long|Double|Float)\("([^"]+)"')
OPT_VAR_RE = re.compile(r'opt(?:String|Int|Boolean|JSONArray|JSONObject|Long|Double|Float)\(\s*(\w+)\b')
HAS_RE = re.compile(r'\.has\("([^"]+)"')


def keys_of(body):
    k = set(OPT_RE.findall(body)) | set(HAS_RE.findall(body))
    varmap = dict(re.findall(r'\b(\w+) = "([^"]{1,40})"', body))
    for var in OPT_VAR_RE.findall(body):
        if var in varmap:
            k.add(varmap[var])
    return k


def case_block(body, num):
    m = re.search(r'\bcase ' + str(num) + r':(.*?)(?=\n\s*case |\n\s*default:)', body, re.S)
    return m.group(1) if m else ''


def resolve(call):
    if '.' not in call:
        return methodidx.get(SRC, {}).get(call, ''), 'C0797.' + call
    cls, meth = call.split('.', 1)
    fp = classpath.get(cls)
    if not fp:
        return '', call
    return methodidx.get(fp, {}).get(meth, ''), os.path.basename(fp)[:-5] + '.' + meth


def scan(body, keys, labels, depth=0):
    """extract keys; follow method calls and Runnable switch cases (bounded depth)"""
    keys |= keys_of(body)
    if depth > 2:
        return
    for c in dict.fromkeys(re.findall(r'\b((?:[A-Z]\w*\.)?m\d+)\s*\(', body)):
        b2, lab = resolve(c)
        labels.append(lab)
        if b2:
            scan(b2, keys, labels, depth + 1)
    for cls, args in re.findall(r'new (RunnableC\d+|C\d+)\(([^)]*)\)', body):
        last = args.split(',')[-1].strip()
        if not last.isdigit():
            continue
        fp = classpath.get(cls)
        if not fp:
            continue
        for meth in ('run', 'call', 'doWork', 'invoke'):
            b = methodidx.get(fp, {}).get(meth)
            if not b:
                continue
            blk = case_block(b, int(last))
            if blk:
                labels.append('%s.%s#case%s' % (os.path.basename(fp)[:-5], meth, last))
                scan(blk, keys, labels, depth + 1)
                break


rows = []
for action, idx in sorted(pairs.items(), key=lambda kv: kv[1]):
    body = bodies.get(idx, '')
    keys, labels = set(), []
    scan(body, keys, labels)
    lits = [x for x in re.findall(r'"([^"]{2,48})"', body)]
    rows.append([idx, action, ','.join(sorted(keys)), ' -> '.join(dict.fromkeys(labels))[:170],
                 ' | '.join(lits[:6]).replace('\t', ' ')[:200]])

out = os.path.join(BASE, 'action_table.tsv')
with open(out, 'w', encoding='utf-8', newline='') as f:
    w = csv.writer(f, delimiter='\t')
    w.writerow(['case', 'action', 'json_keys', 'handler_chain', 'case_literals'])
    w.writerows(rows)
print('rows=%d  with_keys=%d  (files indexed %d)' % (len(rows), sum(1 for r in rows if r[2]), len(methodidx)))
for r in rows:
    if r[1] in ('adbShell', 'inputSend', 'readSmsList', 'readContactList', 'readAlbumList',
                'takeScreen', 'startSilentStream', 'startHD', 'setDomain', 'installApk',
                'sendAlert', 'openUrl', 'touchPinReplay', 'readAlbumThumbnail', 'iconList',
                'admSet', 'camPic', 'startCam', 'openpkg', 'readAlbumLast'):
        print('  %-18s keys=[%s]  chain=%s' % (r[1], r[2], r[3][:74]))
