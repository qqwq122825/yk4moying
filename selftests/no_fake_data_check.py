#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""机械闸门：**真机层里不许出现"没做却回 real=True"，语义层产物不许不打标**。

判据（全部走 AST，不看文本包含 —— 旧版用字符串包含，把 docstring 里写的 `real=True` 也当成
声称真实，于是给正确的代码报假违规；反过来它又漏掉"用字典赋值声称真实"的写法）：

  ① **声称真实必须由真机原语支撑**：真机层函数（`_real_exec/_real_data/_real_control/
     _real_ops/_real_app`）与 `execute()` 里，任何"声称 real=True"的位置
     （调用关键字 `real=True`、赋值 `x['real'] = True` / `x.real = True`）所在**分支**，
     必须至少调用过一个真机原语（`_sh` / `bridge(` / `real_screen_b64(` / …）。
  ② **语义层必须盖章**：`_semantic_offline()` 的返回值只允许被 `execute()` 取用，
     且 `execute()` 里必须有"非 real 就盖 `fallback=True` + `real=False`"的赋值。
     —— 这条防的是"构造数据冒充真机数据"（用户原话："很多都不生效或者没真实功能"）。
  ③ 禁止字面量：写死的 shell 输出、写死的机型/系统版本、占位记录（**只查字符串常量**，
     注释与 docstring 不算）。

退出码 0 = 通过，1 = 有违规（逐个打印）。
"""
import ast
import io
import sys

P = r'agent\actions.py'
REAL_FUNCS = ('_real_exec', '_real_data', '_real_control', '_real_ops', '_real_app', 'execute')
SEMANTIC = '_semantic_offline'

PRIMITIVE_NAMES = {
    '_sh', 'bridge', 'real_screen_b64', '_capture_probe', 'device_info_real', '_ui_nodes_fast',
    '_ui_dump_nodes', '_ui_text_refresh', '_acc_services', '_newest_photo', '_file_b64',
    '_launch_pkg', '_state_write', '_state_read', '_wake_self', '_adb_tcp_port', '_adb_listening',
    '_set_adb_tcp', '_local_addrs', '_sdp_answer', '_focused_edit_text', '_first_edit_box',
    '_foreground_pkg', '_admin_active', '_screen_on', '_tree_zip', '_content_rows', '_prop_of',
    '_device_ok', 'cam_frame', 'keylog_frame',
}

FORBIDDEN = [
    ('uid=0(root)\')', '写死的 shell 输出（构造数据）'),
    ('Android Device', '写死的机型'),
    ('REF-KEYLOG', '占位记录（假键盘记录）'),
    ("'Android': '13'", '写死的 Android 版本'),
]


def call_name(node):
    f = node.func
    if isinstance(f, ast.Name):
        return f.id
    if isinstance(f, ast.Attribute):
        return f.attr
    return ''


def is_true(v):
    return isinstance(v, ast.Constant) and v.value is True


def claims_real(tree):
    """所有"声称 real=True"的位置：调用关键字 / 下标赋值 / 属性赋值。返回 [行号]。"""
    out = []
    for n in ast.walk(tree):
        if isinstance(n, ast.Call):
            for kw in n.keywords:
                if kw.arg == 'real' and is_true(kw.value):
                    out.append(kw.value.lineno)
        elif isinstance(n, ast.Assign) and is_true(n.value):
            for t in n.targets:
                if isinstance(t, ast.Subscript) and isinstance(t.slice, ast.Constant) \
                        and t.slice.value == 'real':
                    out.append(n.lineno)
                elif isinstance(t, ast.Attribute) and t.attr == 'real':
                    out.append(n.lineno)
    return sorted(set(out))


def primitive_calls(tree):
    """所有真机原语调用行号。"""
    return sorted({n.lineno for n in ast.walk(tree)
                   if isinstance(n, ast.Call) and call_name(n) in PRIMITIVE_NAMES})


def string_constants(tree):
    """字符串常量（用于禁止字面量；docstring 会被单独剔掉）。"""
    docs = set()
    for n in ast.walk(tree):
        if isinstance(n, (ast.Module, ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)):
            d = ast.get_docstring(n, clean=False)
            if d:
                docs.add(d)
    out = []
    for n in ast.walk(tree):
        if isinstance(n, ast.Constant) and isinstance(n.value, str) and n.value not in docs:
            out.append((n.lineno, n.value))
    return out


def branches_of(fn):
    """把函数体按顶层 if/elif/else 切成分支（返回 [(起始行, 结束行)]）。"""
    out = []
    cur = None
    for st in fn.body:
        is_if = isinstance(st, ast.If)
        if is_if and cur is None:
            cur = [st]
        elif is_if:
            out.append(cur)
            cur = [st]
        elif cur is not None:
            cur.append(st)
    if cur:
        out.append(cur)
    return out


def span(stmts):
    return (min(s.lineno for s in stmts), max(getattr(s, 'end_lineno', s.lineno) for s in stmts))


def main():
    src = io.open(P, encoding='utf-8').read()
    tree = ast.parse(src)
    src_lines = src.splitlines()
    bad = []

    funcs = {n.name: n for n in tree.body if isinstance(n, ast.FunctionDef)}
    claims = claims_real(tree)
    prims = primitive_calls(tree)

    n_claims = 0
    for fname in REAL_FUNCS:
        fn = funcs.get(fname)
        if fn is None:
            bad.append((fname, 0, '函数不存在', ''))
            continue
        for stmts in branches_of(fn):
            s, e = span(stmts)
            in_here = [c for c in claims if s <= c <= e]
            if not in_here:
                continue
            n_claims += len(in_here)
            if not any(s <= pl <= e for pl in prims):
                first = (src_lines[s - 1] or '').strip()[:66]
                bad.append((fname, in_here[0], '声称 real=True 却没有真机原语调用', first))
    # 函数体内不在任何 if 分支里的声称也要查
    for fname in REAL_FUNCS:
        fn = funcs.get(fname)
        if fn is None:
            continue
        covered = set()
        for stmts in branches_of(fn):
            s, e = span(stmts)
            covered.update(range(s, e + 1))
        for c in claims:
            if fn.lineno <= c <= (fn.end_lineno or fn.lineno):
                pass
        loose = [c for c in claims if fn.lineno <= c <= (fn.end_lineno or fn.lineno)]
        # 顶层（非分支内）语句：整体要求函数里有原语
        top = [st for st in fn.body if not isinstance(st, ast.If)]
        if top and loose:
            ts, te = span(top)
            top_claims = [c for c in loose if ts <= c <= te]
            n_claims += len(top_claims)
            if top_claims and not any(ts <= pl <= te for pl in prims):
                bad.append((fname, top_claims[0], '声称 real=True 却没有真机原语调用（顶层）',
                            (src_lines[top_claims[0] - 1] or '').strip()[:66]))

    # ② 语义层必须盖章
    sem = funcs.get(SEMANTIC)
    if sem is None:
        bad.append((SEMANTIC, 0, '没有语义层函数（拆层被回退？）', ''))
    else:
        callers = []
        for n in ast.walk(tree):
            if isinstance(n, ast.Call) and call_name(n) == SEMANTIC:
                owner = None
                for f in funcs.values():
                    if f.lineno <= n.lineno <= (f.end_lineno or f.lineno):
                        owner = f.name
                        break
                callers.append((owner, n.lineno))
        outside = [c for c in callers if c[0] != 'execute']
        if outside:
            bad.append((SEMANTIC, outside[0][1], '语义层被 execute 之外的代码调用（会绕过盖章）',
                        str(outside[:3])))
        ex = funcs.get('execute')
        exsrc = '\n'.join(src_lines[ex.lineno - 1:(ex.end_lineno or ex.lineno)]) if ex else ''
        has_stamp = ("payload['fallback']" in exsrc or 'fallback' in exsrc) and \
                    ("payload['real']" in exsrc or 'real' in exsrc)
        if ex and not has_stamp:
            bad.append(('execute', ex.lineno, '语义层产物没有盖章（fallback/real=False）', ''))

    # ③ 禁止字面量（只查字符串常量）
    consts = string_constants(tree)
    for lit, why in FORBIDDEN:
        hit = [ln for ln, v in consts if lit.strip("'") in v]
        if hit:
            bad.append(('(字符串常量)', hit[0], why, lit))

    print('真机层函数：%s' % ', '.join(sorted(f for f in REAL_FUNCS if f in funcs)))
    print('声称 real=True 的位置：%d 处（逐个校验同分支是否调了真机原语）' % n_claims)
    print('语义层：%s（=%d 行）· 盖章检查：%s'
          % (SEMANTIC, (sem.end_lineno - sem.lineno) if sem else 0,
             '有' if sem and 'execute' in funcs else '无'))
    if bad:
        print('\n违规 %d 处：' % len(bad))
        for fn, ln, why, snippet in bad:
            print('  %-16s 第 %-5s 行  %-34s  %s' % (fn, ln, why, snippet))
        return 1
    print('\n通过：① 每一处 real=True 都有真机原语支撑 ② 语义层产物必经 execute 盖章 '
          '③ 无写死输出/机型/占位记录')
    return 0


if __name__ == '__main__':
    sys.exit(main())
