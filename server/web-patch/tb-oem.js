/* 保活策略（oem policy）面板注入
 * 1) 侧边栏加「保活」入口
 * 2) 表单里列出每台设备当前的机型适配结果（来自 deviceOnline 上报的 oem 字段）
 * 3) 可直接改电池/自启动路径与点击延迟，保存即下发到设备（POST /api/oem-policy）
 */
(() => {
  if (window.__tbOemLoaded) return;
  window.__tbOemLoaded = true;

  // 面板的 token 存储方式不固定（有的版本存原始串，有的 JSON.stringify 过，
  // 有的换了 key），这里做一次"能拿到就用"的兜底扫描
  // 服务端 token 是 32 位随机串（不是 JWT），所以只校验"像令牌的短串"
  const looksToken = (v) => typeof v === 'string' && /^[A-Za-z0-9_.-]{16,128}$/.test(v);
  const clean = (v) => String(v || '').trim().replace(/^"+|"+$/g, '');
  function findToken() {
    const keys = ['token', 'c2token', 'access_token', 'auth', 'tk'];
    for (const k of keys) {
      const v = clean(localStorage.getItem(k) || sessionStorage.getItem(k));
      if (looksToken(v)) return v;
      if (v) { try { const o = JSON.parse(v); const t = o && (o.token || o.access_token); if (looksToken(t)) return t; } catch (e) {} }
    }
    for (const st of [localStorage, sessionStorage]) {
      for (let i = 0; i < st.length; i++) {
        const k = st.key(i), raw = st.getItem(k) || '';
        const v = clean(raw);
        if (looksToken(v)) return v;
        try {
          const o = JSON.parse(raw);
          if (o && typeof o === 'object') {
            for (const kk in o) { const vv = clean(o[kk]); if (looksToken(vv)) return vv; }
          }
        } catch (e) {}
      }
    }
    return '';
  }
  const TOKEN = () => findToken();
  const api = async (path, opt = {}) => {
    const r = await fetch(path, {
      ...opt,
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${TOKEN()}`, ...(opt.headers || {}) },
    });
    return r.json().catch(() => ({}));
  };

  const CSS = `
  .tb-oem-page{position:fixed;inset:0;z-index:99998;background:var(--bg1,#f8f9fb);color:var(--fg,#111);
    display:flex;flex-direction:column;font-size:13px}
  .tb-oem-top{display:flex;align-items:center;gap:12px;padding:14px 20px;border-bottom:1px solid var(--border,#e5e7eb);
    background:var(--bg1,#fff)}
  .tb-oem-top h2{margin:0;font-size:15px;font-weight:600}
  .tb-oem-back{padding:6px 12px;border:1px solid var(--border,#e5e7eb);border-radius:8px;cursor:pointer;
    background:var(--bg2,#f5f6f8);font-size:12px}
  .tb-oem-main{flex:1;display:flex;min-height:0}
  .tb-oem-list{width:250px;border-right:1px solid var(--border,#e5e7eb);overflow:auto;background:var(--bg1,#fff)}
  .tb-oem-dev{padding:10px 14px;border-bottom:1px solid var(--border,#f0f1f3);cursor:pointer}
  .tb-oem-dev.on{background:rgba(37,99,235,.1);border-left:3px solid #2563eb}
  .tb-oem-dev .m{font-weight:600;font-size:12px}
  .tb-oem-dev .s{font-size:11px;opacity:.65;margin-top:2px;font-family:ui-monospace,Menlo,monospace}
  .tb-oem-body{flex:1;overflow:auto;padding:18px 22px}
  .tb-oem-row{display:grid;grid-template-columns:160px 1fr;gap:12px;align-items:start;margin:10px 0}
  .tb-oem-row label{opacity:.72;padding-top:7px;font-size:12px}
  .tb-oem-row input,.tb-oem-row textarea,.tb-oem-row select{width:100%;box-sizing:border-box;padding:8px 10px;
    border:1px solid var(--border,#e5e7eb);border-radius:8px;background:var(--bg2,#fbfbfc);color:inherit;
    font-family:ui-monospace,Menlo,monospace;font-size:12px}
  .tb-oem-row textarea{min-height:96px;resize:vertical}
  .tb-oem-meta{font-family:ui-monospace,Menlo,monospace;font-size:11.5px;opacity:.78;white-space:pre-wrap;
    background:var(--bg2,#f6f7f9);border:1px solid var(--border,#eceef1);border-radius:10px;padding:10px 12px;margin-bottom:14px}
  .tb-oem-actions{display:flex;gap:10px;justify-content:flex-end;margin-top:18px;padding-top:14px;
    border-top:1px solid var(--border,#eceef1)}
  .tb-oem-btn{padding:8px 16px;border-radius:9px;border:1px solid var(--border,#e5e7eb);background:var(--bg2,#f5f6f8);
    cursor:pointer;font-size:13px}
  .tb-oem-btn.pri{background:#2563eb;color:#fff;border-color:#2563eb}
  .tb-oem-tip{font-size:11.5px;opacity:.6;margin-top:10px}
  .tb-oem-empty{padding:40px;text-align:center;opacity:.6}
  `;

  const injectCss = () => {
    if (document.getElementById('tb-oem-css')) return;
    const s = document.createElement('style');
    s.id = 'tb-oem-css';
    s.textContent = CSS;
    document.head.appendChild(s);
  };

  const el = (tag, cls, txt) => {
    const n = document.createElement(tag);
    if (cls) n.className = cls;
    if (txt != null) n.textContent = txt;
    return n;
  };

  async function openPage() {
    injectCss();
    document.getElementById('tb-oem-page')?.remove();

    const page = el('div', 'tb-oem-page');
    page.id = 'tb-oem-page';

    const top = el('div', 'tb-oem-top');
    const back = el('div', 'tb-oem-back', '← 返回');
    back.onclick = () => page.remove();
    top.appendChild(back);
    top.appendChild(el('h2', null, '保活策略 · 机型适配'));
    page.appendChild(top);

    const main = el('div', 'tb-oem-main');
    const list = el('div', 'tb-oem-list');
    const body = el('div', 'tb-oem-body');
    main.appendChild(list);
    main.appendChild(body);
    page.appendChild(main);
    document.body.appendChild(page);

    let devices = [];

    const renderForm = (d) => {
      body.innerHTML = '';
      if (!d) { body.appendChild(el('div', 'tb-oem-empty', '没有设备')); return; }
      const info = (d.extra && d.extra.deviceInfo) || {};
      const oem = info.oem || {};
      const meta = el('div', 'tb-oem-meta');
      meta.textContent =
        `设备   ${d.deviceId}\n` +
        `机型   ${oem.manufacturer || info.manufacturer || ''} / ${oem.brand || info.brand || ''} / ${oem.model || info.model || ''}\n` +
        `已用   ${info.batteryPathUsed || '(尚未跑过引导)'}\n` +
        `首选   ${info.batteryPath || '(未上报)'}\n` +
        `在线   ${d.online ? '是' : '否'}     版本 ${info.apkVer || ''}`;
      body.appendChild(meta);

      const mkRow = (label, node) => {
        const r = el('div', 'tb-oem-row');
        r.appendChild(el('label', null, label));
        r.appendChild(node);
        body.appendChild(r);
        return node;
      };

      const ta = mkRow('电池/自启动页面', el('textarea'));
      ta.placeholder = '每行一条，例如：\ncom.miui.powerkeeper/com.miui.powerkeeper.ui.HiddenAppsConfigActivity\naosp/request-ignore\naosp/list';
      ta.value = (oem.battery && oem.battery.length ? oem.battery : []).join('\n');

      const delay = mkRow('点击延迟 ms', el('input'));
      delay.value = oem.clickDelayMs || 400;

      const admin = mkRow('管理员流程', el('input'));
      admin.value = oem.adminFlow || 'standard';
      const noti = mkRow('通知流程', el('input'));
      noti.value = oem.notificationFlow || 'standard';
      const notes = mkRow('备注', el('input'));
      notes.value = oem.notes || '';

      const acts = el('div', 'tb-oem-actions');
      const reset = el('button', 'tb-oem-btn', '清除覆盖（回默认表）');
      reset.onclick = async () => {
        await api('/api/oem-policy', { method: 'POST', body: JSON.stringify({ deviceId: d.deviceId, policy: { clear: true } }) });
        alert('已清除该设备的覆盖策略');
      };
      const save = el('button', 'tb-oem-btn pri', '保存并下发');
      save.onclick = async () => {
        const policy = {
          battery: ta.value.split('\n').map((x) => x.trim()).filter(Boolean),
          clickDelayMs: Number(delay.value) || 400,
          adminFlow: admin.value,
          notificationFlow: noti.value,
          notes: notes.value,
        };
        const r = await api('/api/oem-policy', { method: 'POST', body: JSON.stringify({ deviceId: d.deviceId, policy }) });
        alert(r && r.ok ? '已下发：' + JSON.stringify(r.policy) : '保存失败：' + JSON.stringify(r));
      };
      acts.appendChild(reset);
      acts.appendChild(save);
      body.appendChild(acts);
      body.appendChild(el('div', 'tb-oem-tip',
        '保存后立刻下发到设备（oemPolicy），设备下次上线也会主动拉取。未知机型留空即使用默认 AOSP 流程。'));
    };

    const load = async () => {
      const r = await api('/api/devices');
      if (!r || r.ok === false || r.error) {
        list.innerHTML = '';
        const e = el('div', 'tb-oem-empty', '读取设备失败：' + (r && (r.error || r.msg) || '未登录/令牌已过期，请刷新面板重新登录'));
        list.appendChild(e);
        body.innerHTML = '';
        return;
      }
      devices = (r && r.devices) || [];
      list.innerHTML = '';
      if (!devices.length) { list.appendChild(el('div', 'tb-oem-empty', '暂无设备')); return; }
      devices.forEach((d, i) => {
        const info = (d.extra && d.extra.deviceInfo) || {};
        const oem = info.oem || {};
        const row = el('div', 'tb-oem-dev' + (i === 0 ? ' on' : ''));
        row.appendChild(el('div', 'm', `${oem.model || info.model || d.displayId || d.deviceId} ${d.online ? '· 在线' : '· 离线'}`));
        row.appendChild(el('div', 's', `${info.batteryPathUsed || '未跑引导'}`));
        row.onclick = () => {
          [...list.children].forEach((c) => c.classList.remove('on'));
          row.classList.add('on');
          renderForm(d);
        };
        list.appendChild(row);
      });
      renderForm(devices[0]);
    };
    load().catch((e) => { body.textContent = '加载失败：' + e; });
  }

  function addNav() {
    if (document.getElementById('tb-oem-nav')) return;
    // 侧边栏：找含「设备 / 用户 / 注入」文字的最小容器
    const all = [...document.querySelectorAll('nav, aside, div')];
    let bar = null;
    for (const n of all) {
      const t = n.textContent || '';
      if (t.includes('设备') && t.includes('注入') && n.children.length >= 3 && n.clientWidth < 140) {
        bar = n; break;
      }
    }
    if (!bar) return;
    const item = el('div', 'tb-oem-tab');
    item.id = 'tb-oem-nav';
    item.style.cssText = 'display:flex;flex-direction:column;align-items:center;gap:2px;padding:10px 6px;cursor:pointer;border:0;background:transparent;font-size:11px';
    item.innerHTML = '<span style="font-size:18px">🛡</span><span>保活</span>';
    item.onclick = openPage;
    bar.appendChild(item);
  }

  const obs = new MutationObserver(() => addNav());
  const boot = () => {
    injectCss();
    addNav();
    obs.observe(document.body, { childList: true, subtree: true });
  };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot);
  else boot();
})();
