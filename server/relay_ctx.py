#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道服务端「状态门户」：把账号 / 设备 / 封禁 / 构建 / 审计的真读写集中到一处，
供 relay_api 的各端点调用（这些端点此前只回 200、不改任何状态 —— 见 F-66）。

数据落点：
  · 账号   -> SQLite users 表（api_impl.db()）+ 内存 S['users']
  · 设备   -> STATE['devices']（refc2）+ SQLite devices 表
  · 封禁   -> 内存 banned 列表 + SQLite（复用 kv）
  · 构建   -> state/relay_builds.json（与构建流水线同一份）
  · 审计   -> SQLite audit 表
"""
import hashlib
import io
import json
import os
import secrets
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)


def _now():
    return int(time.time())


def _pw_hash(pw, salt=None):
    salt = salt or secrets.token_hex(8)
    return '%s$%s' % (salt, hashlib.sha256((salt + pw).encode()).hexdigest())


def _pw_check(pw, stored):
    if not stored or '$' not in stored:
        return False
    salt, h = stored.split('$', 1)
    return hashlib.sha256((salt + pw).encode()).hexdigest() == h


class RelayCtx:
    """把 refc2 的运行时状态与 api_impl 的持久层包成统一门户"""

    def __init__(self, state, api_impl):
        self.state = state
        self.ai = api_impl
        self._banned = None

    # ---------------- 设备 ----------------
    def devices(self):
        try:
            return self.ai.devices() if self.ai else []
        except Exception:
            return []

    def raw(self, pid):
        return (self.state.get('devices') or {}).get(pid)

    def device(self, pid):
        for r in self.devices():
            if r.get('deviceId') == pid or r.get('phone_id') == pid:
                return r
        return None

    def delete_device(self, pid):
        """真删：内存 + DB + 审计；返回**是否删到了**（此前用 DB 执行成功当结果，导致重复删除也报成功）"""
        devs = self.state.get('devices') or {}
        existed = pid in devs or bool(self.device(pid))
        rec = devs.pop(pid, None)
        if rec is not None:
            existed = True
        try:
            d = self.ai.db() if self.ai else None
            if d:
                d.x('DELETE FROM devices WHERE device_id=?', (pid,))
        except Exception:
            pass
        self.audit('device_delete', '%s existed=%s' % (pid, existed))
        return existed

    def reassign(self, pid, target):
        """真转派：写归属 + **落库**（重启/设备重连后仍生效，见 F-70）"""
        rec = (self.state.get('devices') or {}).get(pid)
        if rec is not None:
            rec['assigned_to'] = target
        try:
            S = self.ai.S
            S.setdefault('transfers', []).append(
                {'ts': _now(), 'deviceId': pid, 'target': target})
            d = self.ai.db() if self.ai else None
            if d:
                d.add_event(pid, 'reassign', {'target': target})
                d.kv_set('assign_%s' % pid, target)      # 持久化归属
            self.ai.save()
        except Exception:
            pass
        self.audit('device_reassign', '%s -> %s' % (pid, target))
        return True

    def assigned_to(self, pid):
        """设备归属：内存优先，落空查 DB（设备重连/服务端重启后恢复）"""
        rec = (self.state.get('devices') or {}).get(pid) or {}
        if rec.get('assigned_to'):
            return rec['assigned_to']
        try:
            d = self.ai.db() if self.ai else None
            return (d.kv_get('assign_%s' % pid) if d else None) or ''
        except Exception:
            return ''

    # ---------------- 封禁 ----------------
    def banned(self):
        if self._banned is None:
            self._banned = []
            try:
                S = self.ai.S
                self._banned = list(S.get('relay_banned') or [])
                if not self._banned:
                    # 内存没有就查 DB（重启后恢复封禁列表，见 F-70）
                    d = self.ai.db() if self.ai else None
                    raw = d.kv_get('relay_banned') if d else None
                    if raw:
                        self._banned = json.loads(raw)
            except Exception:
                self._banned = []
        return self._banned

    def ban(self, pid, reason=''):
        if pid not in self.banned():
            self.banned().append({'phone_id': pid, 'reason': reason, 'ts': _now()})
            self._persist_banned()
        self.audit('device_ban', '%s %s' % (pid, reason))
        return True

    def unban(self, pid):
        before = len(self.banned())
        self._banned = [x for x in self.banned() if x.get('phone_id') != pid]
        if len(self._banned) != before:
            self._persist_banned()
        self.audit('device_unban', pid)
        return len(self._banned) != before

    def _persist_banned(self):
        try:
            self.ai.S['relay_banned'] = self.banned()
            d = self.ai.db() if self.ai else None
            if d:
                d.kv_set('relay_banned', json.dumps(self.banned(), ensure_ascii=False))
            self.ai.save()          # 同时落盘 store.json（否则重启后内存态丢失，见 F-70）
        except Exception:
            pass

    # ---------------- 账号 ----------------
    def users(self):
        """账号列表（含密码哈希，仅供内部校验）"""
        try:
            d = self.ai.db() if self.ai else None
            if d:
                rows = d.users()
                if rows:
                    return rows
        except Exception:
            pass
        return list((self.ai.S.get('users') or []))

    def find_user(self, name):
        for u in self.users():
            if (u.get('username') or u.get('usrname')) == name:
                return u
        return None

    def add_user(self, username, email, password, role='user', expire='2099-12-31'):
        if self.find_user(username):
            return None, '账号已存在'
        salt_h = _pw_hash(password)
        try:
            S = self.ai.S
            S.setdefault('relay_users', []).append({
                'usrname': username, 'email': email or '', 'authorty': role,
                'expire_date': expire, 'pw': salt_h, 'created': _now()})
            d = self.ai.db() if self.ai else None
            if d:
                d.ensure_user(username, role)
                d.kv_set('pw_%s' % username, salt_h)          # 密码哈希落库（重启后仍可登录）
                d.kv_set('profile_%s' % username, json.dumps(
                    {'email': email or '', 'authorty': role, 'expire_date': expire,
                     'created': _now()}, ensure_ascii=False))
            # 内存也落盘（否则重启后 S['relay_users'] 丢失，账号"建了却登不进去"，见 F-69）
            try:
                self.ai.save()
            except Exception:
                pass
        except Exception as e:
            return None, str(e)[:80]
        self.audit('account_add', '%s %s' % (username, email))
        return {'usrname': username, 'email': email, 'authorty': role,
                'expire_date': expire}, None

    def user_profile(self, username):
        """账号资料（优先内存，落空读 DB kv）——重启后仍能取到 email/角色"""
        for u in (self.ai.S.get('relay_users') or []):
            if u.get('usrname') == username:
                return u
        try:
            d = self.ai.db() if self.ai else None
            raw = d.kv_get('profile_%s' % username) if d else None
            if raw:
                p = json.loads(raw)
                p['usrname'] = username
                p['pw'] = d.kv_get('pw_%s' % username)
                return p
        except Exception:
            pass
        return None

    def del_user(self, username):
        if username == 'admin':
            return False, '不能删除主账号'
        ok = False
        try:
            S = self.ai.S
            before = len(S.get('relay_users') or [])
            S['relay_users'] = [u for u in (S.get('relay_users') or [])
                                 if u.get('usrname') != username]
            ok = len(S['relay_users']) != before
            d = self.ai.db() if self.ai else None
            if d:
                d.x('DELETE FROM users WHERE username=?', (username,))
        except Exception:
            pass
        self.audit('account_del', username)
        return ok, None

    def renew_user(self, username, expire):
        u = self.find_user(username)
        if not u:
            # 也允许续期服务端内存里的子账号
            for x in (self.ai.S.get('relay_users') or []):
                if x.get('usrname') == username:
                    x['expire_date'] = expire
                    self.audit('account_renew', '%s -> %s' % (username, expire))
                    return True, None
            return False, '账号不存在'
        try:
            d = self.ai.db() if self.ai else None
            if d:
                d.kv_set('expire_%s' % username, expire)
        except Exception:
            pass
        self.audit('account_renew', '%s -> %s' % (username, expire))
        return True, None

    def set_password(self, username, old, new):
        """真改密：校验旧密码（主账号比对运营口令，子账号比对存放的哈希）"""
        if not old:
            return False, '请输入旧密码'
        if not new or len(new) < 6:
            return False, '新密码至少 6 位'
        stored = None
        try:
            d = self.ai.db() if self.ai else None
            stored = d.kv_get('pw_%s' % username) if d else None
        except Exception:
            stored = None
        if stored:
            if not _pw_check(old, stored):
                return False, '旧密码错误'
        else:
            import os as _os
            if old != _os.environ.get('REFC2_PASS', ''):
                return False, '旧密码错误'
        h = _pw_hash(new)
        try:
            d = self.ai.db() if self.ai else None
            if d:
                d.kv_set('pw_%s' % username, h)
            self.ai.S.setdefault('pw_changes', []).append(
                {'ts': _now(), 'user': username})
        except Exception:
            pass
        self.audit('password_change', username)
        return True, None

    # ---------------- 构建 ----------------
    def builds(self):
        """真构建库（与构建流水线同一份 relay_builds.json）"""
        try:
            import relay_private
            return relay_private._load_builds()
        except Exception:
            return []

    # ---------------- 审计 ----------------
    def audit(self, action, detail=''):
        try:
            d = self.ai.db() if self.ai else None
            if d:
                d.add_audit('relay', action, str(detail)[:200])
        except Exception:
            pass
