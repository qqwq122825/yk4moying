#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""构建策略层：模板清单 + 参数白名单 + APK ID 归属。

思路照搬 yuankon 的构建中心（`backend/src/build-templates.js` + `apk-builder.js` +
`account-apk.js`），但落在我们这套**注入式**构建上：基座包在本地用源码建好
（apk-project 出的 v2.1.apk 之类），服务器只做"取基座 → 注入参数/图标 → 重签"，
不需要 Gradle、不需要 Android SDK。

三件事：
1. 模板清单 `materials/templates/templates.json` —— 管理员维护的"可选基座"仓库，
   普通用户只能选，不能传包。清单缺失时按目录里的 *.apk 自动兜底（并标记 unregistered）。
2. 参数白名单 —— 多余字段直接拒；长度/正则/域名格式全部校验。
3. APK ID 归属 —— 一个账号一个固定编号；构建时填的编号必须能归到某个账号，
   没填就用调用者自己的编号；写入包内的 assets/config.json。
"""

import hashlib
import io
import json
import os
import re
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, '..'))
TEMPLATE_DIR = os.path.normpath(os.path.join(ROOT, 'materials', 'templates'))
MANIFEST = os.path.join(TEMPLATE_DIR, 'templates.json')
SOURCE_ROOT = os.path.normpath(os.path.join(ROOT, 'apk-project'))

# ---------------------------------------------------------------- 参数白名单
# 只认这些键；其余一律拒绝（对齐 yuankon 的 zod .strict()）
ALLOWED_KEYS = {
    'templateId', 'apkVersion', 'appName', 'domain', 'homeUrl', 'apkId',
    'batch', 'packageName', 'requestId', 'icon', 'appurl', 'package_name',
    'homepage',
    # 面板构建页现有的能力开关（只记录进 config，不改变基座 dex 行为）
    'enableCrashLog', 'enableWebrtc', 'enableForeground', 'enableSilentAudio',
    'enableFastReconnect', 'showIcon',
}
FEATURE_KEYS = ('enableCrashLog', 'enableWebrtc', 'enableForeground',
                'enableSilentAudio', 'enableFastReconnect', 'showIcon')

RE_TEMPLATE_ID = re.compile(r'^[a-zA-Z0-9][a-zA-Z0-9._-]{0,63}$')
RE_APK_ID = re.compile(r'^[A-Za-z0-9_-]{0,64}$')
RE_PACKAGE = re.compile(r'^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$')
RE_UUID = re.compile(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
RE_CTRL = re.compile(r'[\u0000-\u001f\u007f]')


class BuildInputError(ValueError):
    """参数不合规 —— 上层直接回 400，不要进构建队列。"""


def _text(value, name, max_len, required=False):
    v = '' if value is None else str(value).strip()
    if not v:
        if required:
            raise BuildInputError('缺少 %s' % name)
        return ''
    if len(v) > max_len:
        raise BuildInputError('%s 超长（上限 %d）' % (name, max_len))
    if RE_CTRL.search(v):
        raise BuildInputError('%s 含控制字符' % name)
    return v


def validate_input(payload):
    """校验并规范化构建参数；返回干净的 dict。

    拒绝策略：
      - 出现白名单外的键 → 直接拒（防止有人塞 `template_file` 之类改到服务器路径）
      - 首页必须 https（和我们注入的 assets/app_url.txt 同口径）
      - 包名只做记录用，格式必须像 Java 包名
    """
    if not isinstance(payload, dict):
        raise BuildInputError('请求体必须是 JSON 对象')
    extra = sorted(set(payload) - ALLOWED_KEYS)
    if extra:
        raise BuildInputError('不支持的参数: %s' % ', '.join(extra[:6]))

    template_id = _text(payload.get('templateId') or payload.get('apkVersion'),
                        'templateId', 64, required=True)
    if not RE_TEMPLATE_ID.match(template_id):
        raise BuildInputError('templateId 只能由字母/数字/._- 组成')
    template_id = template_id.lstrip('vV') if template_id[:1] in 'vV' else template_id

    app_name = _text(payload.get('appName'), 'appName', 80, required=True)
    domain = _text(payload.get('domain'), 'domain', 255)
    home_url = _text(payload.get('homeUrl') or payload.get('homepage') or payload.get('appurl'),
                     'homeUrl', 2048)
    if home_url:
        if not re.match(r'^https://', home_url, re.I):
            raise BuildInputError('首页地址必须是 https:// 开头')
        if re.search(r'[\s]', home_url):
            raise BuildInputError('首页地址不能含空白')
    apk_id = _text(payload.get('apkId'), 'apkId', 64)
    if not RE_APK_ID.match(apk_id):
        raise BuildInputError('apkId 只能由字母/数字/_- 组成')
    batch = _text(payload.get('batch'), 'batch', 80)
    package_name = _text(payload.get('packageName') or payload.get('package_name'),
                         'packageName', 180)
    if package_name and not RE_PACKAGE.match(package_name):
        raise BuildInputError('packageName 不是合法的 Java 包名')
    request_id = _text(payload.get('requestId'), 'requestId', 64)
    if request_id and not RE_UUID.match(request_id):
        raise BuildInputError('requestId 必须是 UUID')
    icon = _text(payload.get('icon'), 'icon', 512)

    features = {}
    for k in FEATURE_KEYS:
        if k in payload:
            features[k] = bool(payload.get(k))
    return {'templateId': template_id, 'appName': app_name, 'domain': domain,
            'homeUrl': home_url, 'apkId': apk_id, 'batch': batch,
            'packageName': package_name, 'requestId': request_id, 'icon': icon,
            'features': features}


# ---------------------------------------------------------------- 模板清单
def _sha256_file(path):
    h = hashlib.sha256()
    with open(path, 'rb') as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()


def _real_apk(path, min_dex=256 * 1024):
    try:
        with zipfile.ZipFile(path) as z:
            info = {i.filename: i.file_size for i in z.infolist()}
    except Exception:
        return False
    return (info.get('classes.dex', 0) >= min_dex
            and info.get('resources.arsc', 0) >= 64 * 1024
            and 'AndroidManifest.xml' in info)


def resource_style(apk_path):
    """基座的资源是可定位的语义名，还是 R8 混淆过的名字？

    直接决定"能不能换图标"：语义化基座有 res/mipmap-*/ic_launcher.png，
    混淆基座只有 res/0C.png 这种，按名字改必然改不到。
    """
    try:
        with zipfile.ZipFile(apk_path) as z:
            names = z.namelist()
    except Exception:
        return 'unknown'
    icons = [n for n in names if n.startswith('res/mipmap') and n.endswith('/ic_launcher.png')]
    return 'semantic' if icons else 'obfuscated'


def _source_ok(path):
    """源码模板是否可用：apktool 工程三件套（清单 / apktool.yml / smali 目录）。"""
    return (os.path.isdir(path)
            and os.path.isfile(os.path.join(path, 'AndroidManifest.xml'))
            and os.path.isfile(os.path.join(path, 'apktool.yml'))
            and os.path.isdir(os.path.join(path, 'smali')))


def _source_fingerprint(path):
    """源码模板指纹：清单 + apktool.yml + smali 文件数（够判"变没变"）。"""
    h = hashlib.sha256()
    for rel in ('AndroidManifest.xml', 'apktool.yml'):
        p = os.path.join(path, rel)
        if os.path.isfile(p):
            h.update(open(p, 'rb').read())
    n = 0
    for dp, _d, files in os.walk(os.path.join(path, 'smali')):
        n += sum(1 for f in files if f.endswith('.smali'))
    h.update(str(n).encode())
    return h.hexdigest()


def _auto_manifest():
    """清单缺失时，按目录里的 *.apk 兜底生成（标记 unregistered）。"""
    out = []
    if not os.path.isdir(TEMPLATE_DIR):
        return out
    for fn in sorted(os.listdir(TEMPLATE_DIR)):
        if not fn.lower().endswith('.apk'):
            continue
        path = os.path.join(TEMPLATE_DIR, fn)
        if not os.path.isfile(path) or not _real_apk(path):
            continue
        tid = os.path.splitext(fn)[0]
        ver = tid[1:] if tid[:1] in 'vV' else tid
        out.append({'id': tid, 'name': '%s（未登记）' % tid, 'versionName': ver,
                    'versionCode': 0, 'file': fn, 'kind': 'screenagent',
                    'visibleLauncher': True, 'unregistered': True,
                    'resourceStyle': resource_style(path),
                    'description': '目录兜底发现，未在 templates.json 登记'})
    return out


def load_manifest():
    """返回模板列表（每项补上 sha256 / resourceStyle / 可换图标标记）。"""
    rows, source = [], 'auto'
    if os.path.isfile(MANIFEST):
        try:
            with io.open(MANIFEST, encoding='utf-8') as fh:
                raw = json.load(fh)
            if isinstance(raw, dict):
                raw = raw.get('templates') or []
            rows = [r for r in raw if isinstance(r, dict) and (r.get('file') or r.get('sourceDir'))]
            source = 'manifest'
        except Exception:
            rows, source = [], 'auto'
    if not rows:
        rows = _auto_manifest()
    out = []
    for r in rows[:40]:                      # 上限 40 项，和 yuankon 一致
        src = r.get('sourceDir')
        if src:
            # 源码模板：从 apktool 工程编译（应用名/图标/版本/包名都能改）
            spath = os.path.normpath(os.path.join(ROOT, str(src)))
            if not spath.startswith(ROOT + os.sep):
                continue                      # 防目录穿越
            ok = _source_ok(spath)
            out.append({'id': str(r.get('id') or src),
                        'name': str(r.get('name') or r.get('id') or ''),
                        'versionName': str(r.get('versionName') or ''),
                        'versionCode': int(r.get('versionCode') or 0),
                        'mode': 'source',
                        'sourceDir': os.path.relpath(spath, ROOT),
                        'file': '',
                        'kind': str(r.get('kind') or 'screenagent'),
                        'visibleLauncher': bool(r.get('visibleLauncher', True)),
                        'resourceStyle': 'semantic',
                        'iconReplaceable': True,
                        'unregistered': bool(r.get('unregistered')),
                        'description': str(r.get('description') or ''),
                        'exists': ok,
                        'size': 0,
                        'sha256': _source_fingerprint(spath) if ok else ''})
            continue
        path = os.path.normpath(os.path.join(TEMPLATE_DIR, str(r.get('file'))))
        if not path.startswith(TEMPLATE_DIR + os.sep):
            continue                          # 防目录穿越
        exists = os.path.isfile(path) and _real_apk(path)
        style = r.get('resourceStyle') or (resource_style(path) if exists else 'unknown')
        out.append({'id': str(r.get('id') or os.path.splitext(os.path.basename(path))[0]),
                    'name': str(r.get('name') or r.get('id') or ''),
                    'mode': 'inject',
                    'sourceDir': '',
                    'versionName': str(r.get('versionName') or ''),
                    'versionCode': int(r.get('versionCode') or 0),
                    'file': os.path.basename(path),
                    'kind': str(r.get('kind') or 'screenagent'),
                    'visibleLauncher': bool(r.get('visibleLauncher', True)),
                    'resourceStyle': style,
                    'iconReplaceable': style == 'semantic',
                    'unregistered': bool(r.get('unregistered')),
                    'description': str(r.get('description') or ''),
                    'exists': exists,
                    'size': os.path.getsize(path) if exists else 0,
                    'sha256': _sha256_file(path) if exists else ''})
    return {'ok': True, 'source': source, 'dir': TEMPLATE_DIR, 'templates': out}


def _norm_id(value):
    """模板 id 归一化：`v2.1` / `2.1` / `src-2.1` 都归到 `2.1`。"""
    s = str(value or '').strip().lstrip('vV')
    m = re.search(r'(\d+(?:\.\d+)*)$', s)
    return m.group(1) if m else s


def resolve_template(template_id):
    """按 id 取模板；不存在或文件缺失直接抛错（不让构建静默回退到别的包）。"""
    man = load_manifest()
    tid = str(template_id or '').strip()
    want = _norm_id(tid)
    for t in man['templates']:
        if t['id'] == tid or _norm_id(t['id']) == want:
            if not t['exists']:
                raise BuildInputError('模板 %s 不可用：%s'
                                      % (tid, t.get('sourceDir') or t.get('file')))
            t = dict(t)
            t['path'] = (os.path.join(ROOT, t['sourceDir']) if t.get('mode') == 'source'
                         else os.path.join(TEMPLATE_DIR, t['file']))
            return t
    raise BuildInputError('没有这个模板：%s（可选：%s）'
                          % (tid, ', '.join(t['id'] for t in man['templates'][:8]) or '无'))


# ---------------------------------------------------------------- APK ID 归属
def _children(users, actor):
    me = next((u for u in users if u.get('username') == actor), None)
    kids = list(me.get('childUsers') or []) if me else []
    return me, kids


def resolve_recipient(users, actor, apk_id):
    """决定"这个包发给谁"。

    返回 {'apkId','account','matched','role','note'}：
      - 没填 apkId → 用调用者自己的编号
      - 填了：超管可指向任意账号；其他角色只能指向自己或自己的子账号
      - 编号没匹配到任何账号：超管接受（记为自定义编号），其他角色拒绝
    """
    users = users or []
    me, _kids = _children(users, actor)
    if not me:
        raise BuildInputError('调用者账号不存在')
    my_id = str(me.get('apkId') or '')
    role = str(me.get('role') or 'user')
    want = str(apk_id or '').strip()

    if not want:
        return {'apkId': my_id, 'account': actor, 'matched': True, 'role': role,
                'note': '未填编号，用调用者自己的 APK ID'}

    # Multiple accounts may intentionally share one APK ID. Prefer the caller's
    # own profile before looking for another account with the same ID; otherwise
    # an operator such as ``mtx`` can be attributed to the older ``admin`` row.
    if my_id == want:
        return {'apkId': want, 'account': actor, 'matched': True, 'role': role,
                'note': '归属 %s' % actor}

    hit = next((u for u in users if str(u.get('apkId') or '') == want), None)
    if hit:
        if role == 'admin' or hit.get('username') == actor or \
                hit.get('username') in (me.get('childUsers') or []):
            return {'apkId': want, 'account': hit.get('username'), 'matched': True,
                    'role': role, 'note': '归属 %s' % hit.get('username')}
        raise BuildInputError('APK ID %s 属于其他账号，不能用来构建' % want)

    if role == 'admin':
        return {'apkId': want, 'account': actor, 'matched': False, 'role': role,
                'note': '编号未匹配任何账号，按自定义编号记录（超管）'}
    raise BuildInputError('APK ID %s 未匹配任何账号' % want)


# ---------------------------------------------------------------- 注入用配置
def inject_values(clean, recipient, template, build_id):
    """组装写进产物 assets/config.json 的字段（对齐 yuankon 的 agent_config.json 语义）。"""
    server = (clean.get('domain') or '').strip()
    if server and not re.match(r'^(https?|wss?)://', server, re.I):
        server = 'https://' + server
    return {
        'appid': clean.get('packageName') or '',
        'appname': clean.get('appName'),
        'appversion': template.get('versionName') or clean.get('templateId'),
        'appurl': clean.get('homeUrl'),
        'serverUrl': re.sub(r'^http', 'ws', server) if server else '',
        'domain': server,
        'apkId': recipient.get('apkId'),
        'batch': clean.get('batch'),
        'buildId': build_id,
        'templateId': template.get('id'),
        'templateFile': template.get('file'),
        'templateSha256': template.get('sha256'),
        'packageName': clean.get('packageName'),
        'features': clean.get('features') or {},
    }
