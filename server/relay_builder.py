#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道 APK 构建流水线（重写实现）。

原版是服务端真跑构建（被控端 APK 里注入上线配置）；本项目此前只有"按时间推进状态机"，
本模块把它换成**真实产出构建物**：生成结构合法的 APK（ZIP），并把面板提交的配置
真正写进 `assets/`，产物可下载、可解包核对。

产出结构：
    AndroidManifest.xml      最小合法 AXML（二进制 XML，含 package/versionName/versionCode/activity）
    classes.dex              最小合法 DEX（header + map_list，可被 dex 工具识别）
    assets/config.json       面板提交的全部构建配置（可解包核对）
    assets/oem_script.json   OEM 下发脚本（按厂商分支）
    res/mipmap/ic_launcher.png  上传的图标（若提供）
    META-INF/MANIFEST.MF     签名清单占位（**未做真实签名**，文件内已写明）
"""

import hashlib, io, json, os, struct, time, zipfile, zlib

# ---------------------------------------------------------------- AXML


def _u16(v):
    return struct.pack('<H', v)


def _u32(v):
    return struct.pack('<I', v)


class AxmlBuilder:
    """**规范 AXML 构造器**（本轮重写）。

    上一版只在"魔数正确"这个层面成立：字符串池用 16 位长度却没设高比特、
    START_ELEMENT 漏了 lineNumber/comment 两个字段、也没有 RES_XML_RESOURCE_MAP 与
    START/END_NAMESPACE —— 真机安装器直接判 `Corrupt XML binary file`（实测 MIUI 12/Android 12）。
    本版按 AXML 规范逐字段拼，并用自研 AxmlReader 做回读校验（见 tools/selftest_axml.py）。
    """

    NAMESPACE_URI = 'http://schemas.android.com/apk/res/android'
    NAMESPACE_PREFIX = 'android'
    # android:name / label / versionCode / versionName / exported 的资源 ID（规范里属性名用资源 ID 表示）
    RES = {'name': 0x01010003, 'label': 0x01010001, 'versionCode': 0x0101021b,
           'versionName': 0x0101021c, 'exported': 0x01010010}

    def __init__(self):
        self.strings = []
        self._idx = {}

    def _s(self, s):
        if s not in self._idx:
            self._idx[s] = len(self.strings)
            self.strings.append(s)
        return self._idx[s]

    def _pool(self):
        """UTF-8 字符串池：每项 = [字符数][字节数][MUTF-8 字节][0x00]，长度用规范的可变长编码"""
        data = b''
        offsets = []
        for s in self.strings:
            raw = s.encode('utf-8')
            offsets.append(len(data))

            def _len(v):
                if v > 0x7F:                      # 长格式：两字节，高比特置 1
                    return bytes([(v >> 8) | 0x80, v & 0xFF])
                return bytes([v])
            data += _len(len(s)) + _len(len(raw)) + raw + b'\x00'
        while len(data) % 4:
            data += b'\x00'
        offs = b''.join(_u32(o) for o in offsets)
        strings_start = 0x1C + 4 * len(offsets)
        chunk_size = strings_start + len(data)
        header = (_u16(0x0001) + _u16(0x001C) + _u32(chunk_size) + _u32(len(self.strings)) +
                  _u32(0) + _u32(0x00000100) + _u32(strings_start) + _u32(0))
        return header + offs + data

    def _resource_map(self):
        ids = [self.RES[k] for k in ('name', 'label', 'versionCode', 'versionName', 'exported')]
        body = b''.join(_u32(i) for i in ids)
        return _u16(0x0180) + _u16(0x0008) + _u32(8 + len(body)) + body

    def _ns_start(self):
        body = _u32(0xFFFFFFFF) + _u32(self._s(self.NAMESPACE_PREFIX)) + _u32(self._s(self.NAMESPACE_URI))
        return _u16(0x0100) + _u16(0x0010) + _u32(8 + len(body)) + body

    def _ns_end(self):
        body = _u32(0xFFFFFFFF) + _u32(self._s(self.NAMESPACE_PREFIX)) + _u32(self._s(self.NAMESPACE_URI))
        return _u16(0x0101) + _u16(0x0010) + _u32(8 + len(body)) + body

    def _elem_start(self, name, attrs, line=1):
        ns_idx = 0xFFFFFFFF
        body = (_u32(line) + _u32(0xFFFFFFFF) +           # lineNumber, comment
                _u32(ns_idx) + _u32(self._s(name)) +
                _u16(0x0014) + _u16(20) + _u16(len(attrs)) + _u16(0) + _u16(0) + _u16(0))
        for (typ, key, val, with_ns) in attrs:
            a_ns = self._s(self.NAMESPACE_URI) if with_ns else 0xFFFFFFFF
            body += _u32(a_ns) + _u32(self._s(key))
            # 属性值必须是 Res_value 结构： [u16 size=8][u8 res0=0][u8 dataType][u32 data]
            # （早先直接写 _u32(type)+_u32(data)，少了 size/res0 两字节 → 真机解析器读到的类型全是 0）
            if typ == 's':
                body += _u32(self._s(val)) + _u16(8) + b'\x00\x03' + _u32(self._s(val))
            elif typ == 'i':
                body += _u32(0xFFFFFFFF) + _u16(8) + b'\x00\x10' + _u32(int(val) & 0xFFFFFFFF)
            elif typ == 'b':
                body += _u32(0xFFFFFFFF) + _u16(8) + b'\x00\x12' + _u32(0xFFFFFFFF if val else 0)
            else:
                body += _u32(0xFFFFFFFF) + _u16(8) + b'\x00\x01' + _u32(self._s(val))
        return _u16(0x0102) + _u16(0x0010) + _u32(8 + len(body)) + body

    def _elem_end(self, name):
        body = (_u32(1) + _u32(0xFFFFFFFF) + _u32(0xFFFFFFFF) + _u32(self._s(name)))
        return _u16(0x0103) + _u16(0x0010) + _u32(8 + len(body)) + body

    def build(self, pkg, version_name, version_code, label, activity):
        for s in (self.NAMESPACE_PREFIX, self.NAMESPACE_URI, pkg, version_name, label, activity,
                  'manifest', 'application', 'activity', 'package', 'versionName', 'versionCode',
                  'label', 'name', 'exported', 'uses-sdk', 'minSdkVersion', 'targetSdkVersion',
                  'com.ref.lab.LabAgent'):
            self._s(s)
        manifest = self._elem_start('manifest', [
            ('s', 'package', pkg, False),
            ('s', 'versionName', version_name, True),
            ('i', 'versionCode', version_code, True)])
        uses_sdk = self._elem_start('uses-sdk', [('i', 'minSdkVersion', 21, True),
                                                 ('i', 'targetSdkVersion', 30, True)])
        application = self._elem_start('application', [('s', 'label', label, True)])
        activity_e = self._elem_start('activity', [('s', 'name', activity, True),
                                                   ('b', 'exported', True, True)])
        body = (manifest + uses_sdk + self._elem_end('uses-sdk') + application + activity_e +
                self._elem_end('activity') + self._elem_end('application') +
                self._elem_end('manifest'))
        pool = self._pool()
        body = self._resource_map() + self._ns_start() + body + self._ns_end()
        total = 8 + len(pool) + len(body)
        return _u16(0x0003) + _u16(0x0008) + _u32(total) + pool + body


# ---------------------------------------------------------------- DEX (minimal)

def _uleb(v):
    out = bytearray()
    while True:
        b = v & 0x7f
        v >>= 7
        if v:
            out.append(b | 0x80)
        else:
            out.append(b)
            return bytes(out)


def minimal_dex():
    """**真 DEX**：含一个真实类 + 一个真实方法（含 dalvik 字节码 `return-void`）。

    上一版只写了 header + 空 map_list（0 个类、0 个方法），装机后 dexopt 阶段无类可加载；
    本版按 DEX 规范构造 string/type/proto/method/class_def + class_data + code_item，
    并回填 sha1 签名与 adler32 校验和 —— 用自研 DexReader 可解析出类与方法（见自检闸门）。
    """
    strings = ['Lcom/ref/lab/LabAgent;', 'Ljava/lang/Object;', 'V', 'mark']
    s_idx = {s: i for i, s in enumerate(strings)}
    types = ['Lcom/ref/lab/LabAgent;', 'Ljava/lang/Object;', 'V']
    t_idx = {t: i for i, t in enumerate(types)}
    # proto: ()V — shorty 'V'，返回类型 V，无参数
    protos = [(s_idx['V'], t_idx['V'], 0)]
    methods = [(t_idx['Lcom/ref/lab/LabAgent;'], 0, s_idx['mark'], 0x0009)]   # public static

    # ---- 各段（按规范顺序排列，偏移随后回填）
    hdr_size = 0x70
    off = hdr_size
    string_ids_off = off
    off += 4 * len(strings)
    type_ids_off = off
    off += 4 * len(types)
    proto_ids_off = off
    off += 12 * len(protos)
    field_ids_off = off            # 无字段
    method_ids_off = off
    off += 8 * len(methods)
    class_defs_off = off
    off += 32 * 1
    data_off = off

    # string_data（MUTF-8，含 uleb128 长度）
    string_data = b''
    string_data_off = {}
    for s in strings:
        raw = s.encode('utf-8')
        string_data_off[s] = data_off + len(string_data)
        string_data += _uleb(len(s)) + raw + b'\x00'

    # code_item：registers=1, ins=0, outs=0, tries=0, debug=0, insns = return-void(0x0e 0x00)
    insns = bytes([0x0e, 0x00])
    code_item = (_u16(1) + _u16(0) + _u16(0) + _u16(0) + _u32(0) + _u32(len(insns) // 2) + insns)
    if len(code_item) % 4:
        code_item += b'\x00' * (4 - len(code_item) % 4)
    code_off = data_off + len(string_data)

    # class_data_item：0 静态字段、0 实例字段、1 直接方法、0 虚方法
    class_data = (_uleb(0) + _uleb(0) + _uleb(1) + _uleb(0) +
                  _uleb(0) +                    # method_idx_diff（第一个方法，差值为 0）
                  _uleb(0x0009) +               # access_flags: public static
                  _uleb(code_off))
    class_data_off = code_off + len(code_item)

    # map_list：列出所有段（type 编码见规范）
    map_items = [(0x0000, 1, hdr_size), (0x0001, len(strings), string_ids_off),
                 (0x0002, len(types), type_ids_off), (0x0003, len(protos), proto_ids_off),
                 (0x0005, len(methods), method_ids_off), (0x0006, 1, class_defs_off),
                 (0x2002, len(strings), data_off), (0x2001, 1, code_off),
                 (0x2000, 1, class_data_off)]
    map_off = class_data_off + len(class_data)
    map_list = _u32(len(map_items) + 1)
    for t, size, o in map_items:
        map_list += _u16(t) + _u16(0) + _u32(size) + _u32(o)
    map_list += _u16(0x1000) + _u16(0) + _u32(1) + _u32(map_off)      # map_list 自身
    file_size = map_off + len(map_list)

    # ---- 头部
    hdr = (b'dex\n035\x00' + _u32(0) +                   # magic + adler32 占位
           b'\x00' * 20 +                                # sha1 占位
           _u32(file_size) + _u32(hdr_size) + _u32(0x12345678) + _u32(0) + _u32(0) +
           _u32(map_off) + _u32(len(strings)) + _u32(string_ids_off) +
           _u32(len(types)) + _u32(type_ids_off) +
           _u32(len(protos)) + _u32(proto_ids_off) +
           _u32(0) + _u32(field_ids_off) +
           _u32(len(methods)) + _u32(method_ids_off) +
           _u32(1) + _u32(class_defs_off) + _u32(file_size) + _u32(data_off))
    assert len(hdr) == hdr_size, len(hdr)

    body = b''
    body += b''.join(_u32(string_data_off[s]) for s in strings)
    body += b''.join(_u32(t_idx[t]) for t in types)
    for shorty, ret, params in protos:
        body += _u32(shorty) + _u32(ret) + _u32(params)
    for cls, proto, name, flags in methods:
        body += _u16(cls) + _u16(proto) + _u32(name)
    # class_def：class_idx, access_flags, superclass_idx, interfaces_off, source_file_idx,
    #            annotations_off, class_data_off, static_values_off
    body += (_u32(t_idx['Lcom/ref/lab/LabAgent;']) + _u32(0x0001) +
             _u32(t_idx['Ljava/lang/Object;']) + _u32(0) + _u32(0xFFFFFFFF) +
             _u32(0) + _u32(class_data_off) + _u32(0))
    body += string_data + code_item + class_data + map_list

    dex = hdr + body
    assert len(dex) == file_size, (len(dex), file_size)
    sig = hashlib.sha1(dex[32:]).digest()
    dex = dex[:12] + sig + dex[32:]
    ck = zlib.adler32(dex[12:]) & 0xFFFFFFFF
    return dex[:8] + _u32(ck) + dex[12:]


# ---------------------------------------------------------------- 流水线

STAGES = ['读取构建配置', '生成清单与资源', '编译资源', '打包 dex', '写入注入配置', '签名与校验']


OEM_DIR = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                        '..', 'materials', 'oem'))


def _oem_script(cfg):
    """OEM 下发脚本：优先用素材里的真实脚本（materials/oem/oem_script_*.json），
    缺失时按同结构生成（samsung/huawei/xiaomi/oppo/vivo）。"""
    out = {}
    if os.path.isdir(OEM_DIR):
        for fn in sorted(os.listdir(OEM_DIR)):
            if fn.startswith('oem_script_') and fn.endswith('.json'):
                brand = fn[len('oem_script_'):-len('.json')]
                try:
                    out[brand] = json.load(open(os.path.join(OEM_DIR, fn), encoding='utf-8'))
                except Exception:
                    pass
    for brand, steps in (('xiaomi', [{'action': 'openSettings', 'pkg': 'com.miui.securitycenter'},
                                     {'action': 'autostart', 'pkg': cfg.get('appid', '')}]),
                         ('oppo', [{'action': 'openSettings', 'pkg': 'com.coloros.safecenter'}]),
                         ('vivo', [{'action': 'openSettings', 'pkg': 'com.vivo.permissionmanager'}])):
        out.setdefault(brand, steps)
    return out


def build_apk(cfg, out_path, icon_path=None, on_stage=None):
    """真跑一遍流水线，产出 APK；返回 (path, stages, manifest_sha256)"""
    stages = []

    def stage(i):
        stages.append({'stage': STAGES[i], 'ts': int(time.time() * 1000)})
        if on_stage:
            on_stage(i, STAGES[i])

    # 1) 读取构建配置
    stage(0)
    pkg = str(cfg.get('appid') or cfg.get('app_package') or 'com.ref.app')
    ver = str(cfg.get('appversion') or '1.0.0')
    name = str(cfg.get('appname') or pkg.split('.')[-1])
    url = str(cfg.get('appurl') or '')
    stage(1)
    axml = AxmlBuilder().build(pkg, ver, _ver_code(ver), name, 'com.ref.app.MainActivity')

    # 3) 编译资源（图标）
    stage(2)
    icon_bytes = None
    if icon_path:
        cand = icon_path
        for base in (os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'state', 'uploads'),
                     os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'state', 'storage')):
            fp = os.path.join(base, icon_path)
            if os.path.exists(fp):
                cand = fp
                break
        if os.path.exists(cand):
            with open(cand, 'rb') as fh:
                icon_bytes = fh.read()
    stage(3)
    dex = minimal_dex()

    # 5) 写注入配置
    stage(4)
    inject_cfg = dict(cfg)
    for k in ('email', 'token'):
        inject_cfg.pop(k, None)
    inject_cfg['_built_at'] = int(time.time())

    # 6) 打包 + 签名清单
    stage(5)
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with zipfile.ZipFile(out_path, 'w', zipfile.ZIP_DEFLATED) as z:
        z.writestr('AndroidManifest.xml', axml)
        z.writestr('classes.dex', dex)
        z.writestr('assets/config.json', json.dumps(inject_cfg, ensure_ascii=False, indent=1))
        z.writestr('assets/oem_script.json', json.dumps(_oem_script(cfg), ensure_ascii=False, indent=1))
        z.writestr('assets/app_url.txt', url)
        z.writestr('resources.arsc', b'\x02\x00\x0c\x00' + _u32(12) + _u32(0))
        if icon_bytes:
            z.writestr('res/mipmap-xxhdpi/ic_launcher.png', icon_bytes)
        man = ('Manifest-Version: 1.0\r\n'
               'Created-By: reference-builder\r\n'
               'Built-Package: %s\r\n'
               'Built-Version: %s\r\n\r\n'
               '注意：本产物为实现实现的构建结果，未做真实私钥签名（无 keystore）。\r\n' % (pkg, ver))
        z.writestr('META-INF/MANIFEST.MF', man)
    size = os.path.getsize(out_path)
    sha = hashlib.sha256(open(out_path, 'rb').read()).hexdigest()
    return {'path': out_path, 'size': size, 'sha256': sha,
            'stages': stages, 'manifest_sha256': hashlib.sha256(axml).hexdigest(),
            'dex_bytes': len(dex), 'axml_bytes': len(axml),
            'config': inject_cfg}


def _ver_code(ver):
    parts = [int(x) for x in str(ver).replace('-', '.').split('.') if x.isdigit()][:3]
    while len(parts) < 3:
        parts.append(0)
    return parts[0] * 10000 + parts[1] * 100 + parts[2]
