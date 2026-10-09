#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""状态卫生闸门（F-73 家族的机械判据）：
  在一个**独立的临时库**里先塞进各类脏数据（布尔被字符串化、列表被写成字符串、
  未知键混进配置、黑名单被单字符塞满），再启动服务，断言：
    A) 读出来的布尔一律是**真布尔**（前端 `enabled === true` 才成立）
    B) 列表型字段一律是**真列表**（字符串按逗号切，绝不按字符展开）
    C) 未知键被丢弃、合法键保留
    D) 写入路径同样归一（POST 'yes' 不落成字符串）
    E) fail-safe：没有密钥时 AI/翻译必须报告为关闭
  独立库 = 环境变量 REFC2_STORE，跑完删除，不碰 repro/state/store.json。
判据：全部通过 exit 0。
"""
import io
import json
import os
import shutil
import subprocess
import sys
import time
import urllib.error
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
HOST, PORT = '127.0.0.1', 8816
BASE = 'http://%s:%d' % (HOST, PORT)
USER, PASS = 'admin', os.environ.get('REFC2_PASS', '')
TMPDIR = os.path.join(HERE, 'state', '_hygiene')
STORE = os.path.join(TMPDIR, 'store.json')

# 故意塞进去的脏数据（全部是畸形输入扫描实测能打进状态的那几种）
DIRTY = {
    'translate_config': {'enabled': 'yes', 'from': 'zh', 'to': 'en', 'deviceId': {'a': 1}, 'zzz': 'junk'},
    'ai_config': {'enabled': 'yes', 'provider': 'openai', 'api_key': '', 'nonsense': [1, 2, 3]},
    'lockscreen': {'enabled': 'yes', 'title': '脏锁屏', 'pin_length': '6', 'langs': 'zh', 'junk': 'x'},
    'push_config': {'enabled': 'on', 'title': '脏推送', 'body': 'b', 'url': 'u', 'noise': {}},
    'list_load_settings': {'enabled': 'true', 'threshold': '3', 'x': 1},
    'tg': {'bound': 'yes', 'chat_id': '1', 'whatever': 'y'},
    'blacklist': ['abcd1234', 'n', 'o', 't', 'closure-keep-me'],
    'marks': {'dev1234': {'ts': 1}, 'a': {'ts': 1}, 'null': {'ts': 1},
              'x' * 2000: {'ts': 1}, 'undefined': {'ts': 1}},
    'pins': {'dev1234': True, 'q': True, 'null': True, 'y' * 300: True},
    'notes': {'dev1234': 'note', 'z': 'note', 'none': 'note', 'w' * 300: 'note'},
    'inj_track': {'dev1234': {'state': 'idle'}, 'null': {'state': 'idle'}, 'v' * 300: {'state': 'idle'}},
    'groups': [{'id': 'g1', 'name': '脏组', 'deviceIds': 'dev0001,dev0002'},
               {'id': 'g2', 'name': '坏组', 'deviceIds': 'notalist'}],
    'banners': [{'title': 't', 'targets': 'dev0001,dev0002'}],
    'users': [{'username': 'admin', 'role': 'admin', 'apkId': '10020', 'childUsers': [], 'created': 0}],
}


def call(path, method='GET', body=None, tok=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, method=method, data=data)
    if data:
        req.add_header('Content-Type', 'application/json')
    if tok:
        req.add_header('Authorization', 'Bearer ' + tok)
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            return r.status, json.loads(r.read().decode('utf-8', 'replace') or '{}')
    except urllib.error.HTTPError as e:
        try:
            return e.code, json.loads(e.read().decode('utf-8', 'replace') or '{}')
        except Exception:
            return e.code, {}
    except Exception as e:
        return 0, {'error': str(e)[:80]}


def wait_up(timeout=60):
    for _ in range(timeout * 4):
        try:
            if call('/api/health')[0] == 200:
                return True
        except Exception:
            pass
        time.sleep(0.25)
    return False


def main():
    os.makedirs(TMPDIR, exist_ok=True)
    with io.open(STORE, 'w', encoding='utf-8') as fh:
        json.dump(DIRTY, fh, ensure_ascii=False)
    env = dict(os.environ, REFC2_USER=USER, REFC2_PASS=PASS, PYTHONIOENCODING='utf-8',
               REFC2_STORE=STORE)
    log = io.open(os.path.join(HERE, 'evidence', '158_state_hygiene_server.log'), 'w',
                  encoding='utf-8')
    srv = subprocess.Popen([sys.executable, os.path.join(HERE, 'server', 'refc2.py'),
                            '--host', HOST, '--port', str(PORT)],
                           stdout=log, stderr=subprocess.STDOUT, env=env)
    checks, fails = [], []

    def ck(name, ok, detail=''):
        checks.append({'check': name, 'ok': bool(ok), 'detail': str(detail)[:180]})
        if not ok:
            fails.append(name)
        print('%-52s %s  %s' % (name, 'OK' if ok else 'FAIL', str(detail)[:80]))

    try:
        if not wait_up():
            ck('服务可用', False, 'health 未通')
            raise SystemExit(1)
        tok = call('/api/login', 'POST', {'username': USER, 'password': PASS})[1].get('token')
        ck('登录拿到令牌', bool(tok))

        # ---------- A/B/C) 读路径：布尔归真、列表归真、未知键清掉 ----------
        tr = call('/api/translate-config', tok=tok)[1]
        trc = tr.get('config') or tr
        ck('翻译 enabled 是真布尔 False（无 key → fail-safe）',
           trc.get('enabled') is False, 'enabled=%r' % (trc.get('enabled'),))
        ck('翻译配置无未知键残留',
           not any(k in trc for k in ('deviceId', 'zzz')), sorted(trc.keys()))
        ck('翻译合法键保留（from/to）', trc.get('from') == 'zh' and trc.get('to') == 'en', str(trc)[:60])

        ai = call('/api/ai-config', tok=tok)[1]
        aic = ai.get('config') or ai
        ck('AI enabled 是真布尔 False（无 key → fail-safe）',
           aic.get('enabled') is False, 'enabled=%r note=%s' % (aic.get('enabled'), aic.get('note')))
        ck('AI 配置无未知键残留', 'nonsense' not in aic, sorted(aic.keys())[:8])

        lk = call('/api/lockscreen', tok=tok)[1]
        lkc = lk.get('config') or lk
        ck('锁屏 enabled="yes" 归真布尔 True', lkc.get('enabled') is True,
           'enabled=%r' % (lkc.get('enabled'),))
        ck('锁屏 pin_length 归整数', lkc.get('pin_length') == 6, 'pin_length=%r' % (lkc.get('pin_length'),))
        ck('锁屏 langs 归真列表', lkc.get('langs') == ['zh'], 'langs=%r' % (lkc.get('langs'),))
        ck('锁屏未知键清掉 / 标题保留',
           'junk' not in lkc and lkc.get('title') == '脏锁屏', str(lkc)[:70])

        pc = call('/api/push-config', tok=tok)[1]
        pcc = pc.get('config') or pc
        ck('推送 enabled=on 归真布尔 True', pcc.get('enabled') is True, 'enabled=%r' % (pcc.get('enabled'),))
        ck('推送未知键清掉', 'noise' not in pcc, sorted(pcc.keys()))

        ls = call('/api/list-load-settings', tok=tok)[1]
        lsc = ls.get('settings') or ls
        ck('列表加载 enabled 归真布尔', lsc.get('enabled') is True, 'enabled=%r' % (lsc.get('enabled'),))
        ck('列表加载 threshold 归整数', lsc.get('threshold') == 3, 'threshold=%r' % (lsc.get('threshold'),))

        tg = call('/api/tg-set', 'POST', {}, tok)[1]        # 空写入 = 只做归一后回显（无读端点）
        tgc = tg.get('tg') or tg.get('config') or tg
        ck('TG bound="yes" 归真布尔 True', tgc.get('bound') is True, 'bound=%r' % (tgc.get('bound'),))
        ck('TG 未知键清掉', 'whatever' not in tgc, sorted(tgc.keys()))

        # 黑名单：单字符脏条目被清，合法 id 保留
        bl = call('/api/blacklist', tok=tok)[1]
        rows = bl.get('list') or bl.get('deviceIds') or []
        ck('黑名单单字符脏条目被清', all(len(str(x)) >= 4 for x in rows), 'rows=%s' % (rows[:6],))
        ck('黑名单合法 id 保留', any('closure-keep-me' in str(x) for x in rows), 'rows=%s' % (rows[:6],))

        # 标记/固定/备注/注入跟踪：'null' / 'undefined' / 超长(>64) 键必须被清，合法 deviceId 保留。
        # 读法：触发一次写（save 落盘）后直接读**隔离库文件** —— 这是"内存已自愈且已持久化"的机械证据
        call('/api/blacklist', 'POST', {'deviceIds': ['hygiene-flush-01'], 'enable': True}, tok)
        try:
            disk = json.load(io.open(STORE, encoding='utf-8'))
        except Exception as e:
            disk = {}
            ck('隔离库可读（写后落盘）', False, str(e))
        def _keys(name):
            v = disk.get(name)
            return sorted(v) if isinstance(v, dict) else []
        for name in ('marks', 'pins', 'notes', 'inj_track'):
            ks = _keys(name)
            good = all(4 <= len(k) <= 64 and k.lower() not in ('null', 'undefined', 'none') for k in ks)
            ck('%s 键全部合法（null/undefined/超长已清）' % name, good, 'keys=%s' % (ks[:5],))
        ck('合法 deviceId 在 marks/notes 里保留',
           'dev1234' in _keys('marks') and 'dev1234' in _keys('notes'),
           'marks=%s notes=%s' % (_keys('marks')[:4], _keys('notes')[:4]))
        tr2 = call('/api/device-inject-track?deviceId=dev1234', tok=tok)[1]
        ck('注入跟踪：合法 deviceId 仍可读', tr2.get('ok') is True, str(tr2)[:60])
        bad_pin = call('/api/device-pin', 'POST', {'deviceId': 'null', 'pinned': True}, tok)[1]
        ck('写入路径：非法 deviceId 被拒（不再写进置顶表）',
           bad_pin.get('ok') is False, str(bad_pin)[:60])

        # 分组/公告：deviceIds 是真列表（字符串按逗号切成 2 条，不是按字符展开）
        gs = call('/api/device-groups', tok=tok)[1]
        grows = gs.get('groups') or []
        gid1 = [g for g in grows if g.get('id') == 'g1']
        gid2 = [g for g in grows if g.get('id') == 'g2']
        ck('分组 deviceIds 字符串→真列表（2 条）',
           bool(gid1) and gid1[0].get('deviceIds') == ['dev0001', 'dev0002'],
           str(gid1[0].get('deviceIds')) if gid1 else 'g1 丢失')
        ck('分组 deviceIds="notalist" 不被按字符展开',
           bool(gid2) and gid2[0].get('deviceIds') == ['notalist'],
           str(gid2[0].get('deviceIds')) if gid2 else 'g2 丢失')

        # ---------- D) 写路径：POST 脏值也不落成字符串 ----------
        w = call('/api/translate-config', 'POST',
                 {'enabled': 'yes', 'api_key': '', 'from': 'zh', 'to': 'ja', 'evil': {'x': 1}}, tok)[1]
        wc = w.get('config') or w
        ck('写入路径：enabled 不落成字符串', wc.get('enabled') is False, 'enabled=%r' % (wc.get('enabled'),))
        ck('写入路径：未知键被丢弃', 'evil' not in wc, sorted(wc.keys()))
        ck('写入路径：合法键生效', wc.get('to') == 'ja', str(wc)[:60])

        # 有密钥时应能开启（fail-safe 不能反向禁止正常使用）
        w2 = call('/api/translate-config', 'POST',
                  {'enabled': True, 'api_key': 'sk-fake-not-a-real-key', 'provider': 'local'}, tok)[1]
        w2c = w2.get('config') or w2
        ck('配了密钥后 enabled 可开启（True）', w2c.get('enabled') is True, 'enabled=%r' % (w2c.get('enabled'),))
        ck('密钥回显被打码', w2c.get('api_key') == '***', 'api_key=%r' % (w2c.get('api_key'),))
        # 复位，别把假密钥留在库里
        call('/api/translate-config', 'POST', {'enabled': False, 'api_key': ''}, tok)

        # 新建分组不带 id（带不存在 id 的写入按 F-68 语义应被拒），只验 deviceIds 归一
        g2 = call('/api/device-groups', 'POST', {'name': '写测试', 'deviceIds': 'd0001,d0002'}, tok)[1]
        g2g = g2.get('group') or {}
        ck('写入路径：分组 deviceIds 字符串→真列表',
           g2g.get('deviceIds') == ['d0001', 'd0002'], str(g2g.get('deviceIds')))
        if g2g.get('id'):
            call('/api/device-groups', 'DELETE', {'id': g2g['id']}, tok)
        g2b = call('/api/device-groups', 'POST',
                   {'id': 'no-such-%s' % int(time.time()), 'name': 'x'}, tok)[1]
        ck('不存在的分组 id 写入被拒（不能凭空建同 id 分组，F-68）',
           g2b.get('ok') is False, str(g2b)[:70])

    finally:
        try:
            srv.terminate()
            srv.wait(timeout=15)
        except Exception:
            try:
                srv.kill()
            except Exception:
                pass
        log.close()
        shutil.rmtree(TMPDIR, ignore_errors=True)

    out = {'gate': 'state_hygiene', 'total': len(checks), 'passed': len(checks) - len(fails),
           'failed': fails, 'checks': checks, 'ts': int(time.time())}
    with io.open(os.path.join(HERE, 'evidence', '158_state_hygiene.json'), 'w',
                 encoding='utf-8') as fh:
        json.dump(out, fh, ensure_ascii=False, indent=1)
    print('\n状态卫生闸门：%d/%d 通过' % (len(checks) - len(fails), len(checks)))
    print('-> %s' % os.path.join(HERE, 'evidence', '158_state_hygiene.json'))
    return 1 if fails else 0


if __name__ == '__main__':
    sys.exit(main())
