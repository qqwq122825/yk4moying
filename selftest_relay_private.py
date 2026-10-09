#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道「私有端点族」端到端判据：上传 → 列表 → 构建 → 进度 → 下载 → 取链 → 删除 → 静态路径。
判据：全部通过 exit 0。
"""
import io, json, os, subprocess, sys, time, urllib.error, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8804
BASE = 'http://%s:%d' % (HOST, PORT)
PKG = 'com.demo.video'
EMAIL, TOK = 'admin@local', 'probe-token'


def post(path, body=None, raw=None, ctype='application/json'):
    data = raw if raw is not None else json.dumps(body or {}).encode()
    req = urllib.request.Request(BASE + path, method='POST', data=data)
    req.add_header('Content-Type', ctype)
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            return r.status, r.read(), r.headers.get('Content-Type', '')
    except urllib.error.HTTPError as e:
        return e.code, e.read(), ''


def get(path):
    try:
        with urllib.request.urlopen(BASE + path, timeout=20) as r:
            return r.status, r.read(), r.headers.get('Content-Type', '')
    except urllib.error.HTTPError as e:
        return e.code, e.read(), ''


def j(b):
    try:
        return json.loads(b.decode('utf-8', 'replace'))
    except Exception:
        return None


def main():
    env = dict(os.environ, REFC2_USER='admin', REFC2_PASS='CHANGE_ME',
               PYTHONIOENCODING='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
    try:
        for _ in range(60):
            try:
                if get('/api/health')[0] == 200:
                    break
            except Exception:
                pass
            time.sleep(0.25)
        return _run()
    finally:
        srv.terminate()


def _run():
    fails = []
    checks = []

    def ck(name, cond, detail=''):
        checks.append({'check': name, 'ok': bool(cond), 'detail': str(detail)[:160]})
        if not cond:
            fails.append(name)
        print('%-34s %s %s' % (name, 'OK' if cond else 'FAIL', str(detail)[:80]))

    # 1) 上传图标（multipart）
    boundary = '----probe%d' % int(time.time())
    png = bytes.fromhex('89504e470d0a1a0a0000000d4948445200000001000000010802000000907753'
                        'de0000000c4944415408d763f8cfc0000003010100' '18dd8db00000000049454e44ae426082')
    body = ((('--%s\r\nContent-Disposition: form-data; name="email"\r\n\r\n%s\r\n' % (boundary, EMAIL)) +
             ('--%s\r\nContent-Disposition: form-data; name="token"\r\n\r\n%s\r\n' % (boundary, TOK)) +
             ('--%s\r\nContent-Disposition: form-data; name="type"\r\n\r\nico\r\n' % boundary) +
             ('--%s\r\nContent-Disposition: form-data; name="file"; filename="probe.png"\r\n'
              'Content-Type: image/png\r\n\r\n' % boundary)).encode() + png + b'\r\n' +
            ('--%s--\r\n' % boundary).encode())
    st, b, _ = post('/private/Eaod45071.php', raw=body,
                    ctype='multipart/form-data; boundary=%s' % boundary)
    up = j(b) or {}
    ck('上传图标(type=ico)', st == 200 and up.get('Success'), st)
    icon_path = up.get('Success', '')

    # 2) 列表
    st, b, _ = post('/private/Eaod45071.php', {'email': EMAIL, 'token': TOK, 'type': 'listico'})
    lst = (j(b) or {}).get('Success', '')
    ck('列图标(type=listico)', st == 200 and isinstance(lst, str), repr(lst)[:60])

    # 3) 静态访问
    if icon_path:
        st, b, ct = get('/user/storage/' + icon_path)
        ck('静态访问上传件', st == 200 and len(b) == len(png), '%s %s' % (st, ct))

    # 4) 构建
    st, b, _ = post('/private/Eaod36921.php',
                    {'email': EMAIL, 'token': TOK, 'appid': PKG, 'appname': '参考应用',
                     'appversion': '1.0.0', 'icoid': icon_path, 'btype': 'C', 'uhost': 'host',
                     'appurl': 'https://ref.invalid/app', 'nottitle': '加载中~请勿操作'})
    bb = j(b) or {}
    ck('提交构建(Eaod36921)', st == 200 and bb.get('Success'), bb.get('Success', '')[:40])

    # 5) 缺参校验（源码里前端会先拦，服务端也应拒）
    st, b, _ = post('/private/Eaod36921.php', {'appid': PKG, 'appversion': '1.0.0'})
    ck('缺图标被拒', st == 200 and (j(b) or {}).get('Fail'), (j(b) or {}).get('Fail', ''))

    # 6) 进度推进
    state, prog = '', 0
    for _ in range(12):
        time.sleep(1)
        st, b, _ = post('/private/Eaod91328.php', {'email': EMAIL, 'token': TOK, 'subcom': 'load'})
        rows = j(b) or []
        row = next((r for r in rows if r.get('app_package') == PKG), None)
        if row:
            state, prog = row.get('build_state'), row.get('progress')
        if state == 'finished':
            break
    ck('构建进度推进到 finished', state == 'finished' and prog == 100, '%s %s%%' % (state, prog))

    # 6b) 产物是**真构建**：解包核对结构、配置、AXML/DEX 魔数
    import zipfile
    st, apk, ct = post('/private/Eaod91328.php',
                       {'email': EMAIL, 'token': TOK, 'subcom': 'download', 'appid': PKG})
    try:
        zf = zipfile.ZipFile(io.BytesIO(apk))
        names = zf.namelist()
        ck('产物含 AndroidManifest.xml / classes.dex',
           'AndroidManifest.xml' in names and 'classes.dex' in names, ','.join(names[:6]))
        axml = zf.read('AndroidManifest.xml')
        ck('AndroidManifest 为二进制 AXML（魔数 03000800）',
           axml[:4] == bytes.fromhex('03000800'), axml[:4].hex())
        dex = zf.read('classes.dex')
        ck('classes.dex 为合法 DEX（魔数 dex\\n035）', dex[:8] == b'dex\n035\x00', repr(dex[:8]))
        cfg = json.loads(zf.read('assets/config.json'))
        ck('提交的配置被真正写进产物',
           cfg.get('appurl') == 'https://ref.invalid/app' and cfg.get('nottitle') == '加载中~请勿操作'
           and not cfg.get('token'),
           'appurl=%s nottitle=%s token=%s' % (cfg.get('appurl'), cfg.get('nottitle'),
                                               cfg.get('token')))
        ck('产物含 OEM 下发脚本', 'assets/oem_script.json' in names, ','.join(names))
    except Exception as e:
        ck('产物解包核对', False, '异常 %s' % e)

    # 7) 下载（APK blob）
    st, b, ct = post('/private/Eaod91328.php',
                     {'email': EMAIL, 'token': TOK, 'subcom': 'download', 'appid': PKG})
    ck('下载构建产物(blob)', st == 200 and len(b) > 100 and b[:2] == b'PK', '%s %s %dB' % (st, ct, len(b)))

    # 8) 取链
    st, b, _ = post('/private/Eaod91328.php',
                    {'email': EMAIL, 'token': TOK, 'subcom': 'getlink', 'appid': PKG})
    lk = (j(b) or {}).get('link', '')
    ck('取下载链接', st == 200 and lk.endswith('.apk'), lk)

    # 9) 静态取产物
    st, b, ct = get('/user/storage/%s.apk' % PKG)
    ck('静态取 APK', st == 200 and b[:2] == b'PK', '%s %s' % (st, ct))

    # 10) 删除
    st, b, _ = post('/private/Eaod91328.php',
                    {'email': EMAIL, 'token': TOK, 'subcom': 'delete', 'appid': PKG})
    ck('删除构建记录', st == 200 and (j(b) or {}).get('Success'), (j(b) or {}).get('Success', ''))
    st, b, _ = post('/private/Eaod91328.php', {'email': EMAIL, 'token': TOK, 'subcom': 'load'})
    rows = j(b) or []
    ck('删除后列表已移除', all(r.get('app_package') != PKG for r in rows), 'rows=%d' % len(rows))

    # 11) 设备异常上报（gv.java 契约：POST x-www-form-urlencoded，devicename + log，200 即成功）
    import urllib.parse
    body = urllib.parse.urlencode({'devicename': 'REF-PROBE-DEVICE',
                                   'log': 'probe stack trace\n at probe'}).encode()
    st, b, _ = post('/api/Error.php', raw=body,
                    ctype='application/x-www-form-urlencoded; charset=UTF-8')
    ck('异常上报 /api/Error.php', st == 200, '%s %s' % (st, b[:20]))

    # 12) 假锁屏上报必须**落盘**（只写内存的话，重启后读它就没了 —— 见 F-76）
    probe_title = '私有面闸门-%d' % int(time.time())
    st, b, _ = post('/api/lockscreen/report',
                    {'pid': 'gate-priv-dev', 'template': 2, 'kind': 'pin',
                     'title': probe_title, 'trigger': 'phonepass', 'stage': 'shown'})
    ck('假锁屏上报被接受', st == 200 and (j(b) or {}).get('ok') is True, '%s %s' % (st, b[:40]))
    store = os.environ.get('REFC2_STORE') or os.path.join(HERE, 'state', 'store.json')
    try:
        S = json.load(io.open(store, encoding='utf-8'))
        rows = S.get('lock_reports') or []
        hit = next((r for r in rows if r.get('title') == probe_title), None)
    except Exception as e:
        hit = None
        ck('隔离库可读', False, str(e))
    ck('上报已落盘（重读库文件可见，含中文标题原样）', bool(hit), str(hit)[:80])

    print('\n私有端点族：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'evidence',
                       '147_relay_private_e2e.json')
    json.dump({'passed': len(checks) - len(fails), 'total': len(checks), 'checks': checks},
              io.open(out, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    print('->', os.path.normpath(out))
    return 0 if not fails else 1


if __name__ == '__main__':
    sys.exit(main())
