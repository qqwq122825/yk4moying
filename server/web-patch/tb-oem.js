/* 保活策略（oem policy）面板注入
 * 1) 侧边栏加「保活」入口
 * 2) 表单里列出每台设备当前的机型适配结果（来自 deviceOnline 上报的 oem 字段）
 * 3) 可直接改电池/自启动路径与点击延迟，保存即下发到设备（POST /api/oem-policy）
 */
(() => {
  if (window.__tbOemLoaded) return;
  window.__tbOemLoaded = true;

  const TOKEN = () => localStorage.getItem('token') || '';
  const api = async (path, opt = {}) => {
    const r = await fetch(path, {
      ...opt,
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${TOKEN()}`, ...(opt.headers || {}) },
    });
    return r.json().catch(() => ({}));
  };

  const CSS = `
  .tb-oem-mask{position:fixed;inset:0;background:rgba(8,12,20,.45);backdrop-filter:blur(2px);z-index:99999;display:flex;align-items:center;justify-content:center}
  .tb-oem-box{width:min(920px,94vw);max-height:86vh;overflow:auto;background:var(--bg1,#fff);color:var(--fg,#111);
    border:1px solid var(--border,#e5e7eb);border-radius:14px;box-shadow:0 18px 50px rgba(0,0,0,.25);padding:18px 20px}
  .tb-oem-h{display:flex;align-items:center;justify-content:space-between;margin-bottom:12px}
  .tb-oem-h b{font-size:15px}
  .tb-oem-x{cursor:pointer;opacity:.6;font-size:18px;line-height:1}
  .tb-oem-tabs{display:flex;gap:6px;flex-wrap:wrap;margin-bottom:12px}
  .tb-oem-tab{padding:6px 10px;border:1px solid var(--border,#e5e7eb);border-radius:9px;cursor:pointer;font-size:12px;background:var(--bg2,#f7f8fa)}
  .tb-oem-tab.on{background:#2563eb;color:#fff;border-color:#2563eb}
  .tb-oem-row{display:grid;grid-template-columns:150px 1fr;gap:10px;align-items:start;margin:8px 0;font-size:12px}
  .tb-oem-row label{opacity:.75;padding-top:6px}
  .tb-oem-row input,.tb-oem-row textarea,.tb-oem-row select{width:100%;padding:7px 9px;border:1px solid var(--border,#e5e7eb);
    border-radius:8px;background:var(--bg2,#fbfbfc);color:inherit;font:inherit;font-family:ui-monospace,Menlo,monospace;font-size:12px}
  .tb-oem-row textarea{min-height:76px;resize:vertical}
  .tb-oem-meta{font-family:ui-monospace,Menlo,monospace;font-size:11px;opacity:.72;margin:2px 0 10px;white-space:pre-wrap}
  .tb-oem-actions{display:flex;gap:8px;justify-content:flex-end;margin-top:14px}
  .tb-oem-btn{padding:8px 14px;border-radius:9px;border:1px solid var(--border,#e5e7eb);background:var(--bg2,#f5f6f8);cursor:pointer;font-size:13px}
  .tb-oem-btn.pri{background:#2563eb;color:#fff;border-color:#2563eb}
  .tb-oem-tip{font-size:11px;opacity:.6;margin-top:8px}
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

  async function openPanel() {
    injectCss();
    const mask = el('div', 'tb-oem-mask');
    const box = el('div', 'tb-oem-box');
    const head = el('div', 'tb-oem-h');
    head.appendChild(el('b', null, '保活策略（机型适配）'));
    const x = el('div', 'tb-oem-x', '✕');
    x.onclick = () => mask.remove();
    head.appendChild(x);
    box.appendChild(head);

    const tabs = el('div', 'tb-oem-tabs');
    box.appendChild(tabs);
    const body = el('div');
    box.appendChild(body);
    const tip = el('div', 'tb-oem-tip', '保存后会通过 /api/oem-policy 下发到设备，设备下次上线也会拉取；未知机型留空即使用默认 AOSP 流程。');
    box.appendChild(tip);
    mask.appendChild(box);
    mask.addEventListener('click', (e) => { if (e.target === mask) mask.remove(); });
    document.body.appendChild(mask);

    let devices = [];
    let cur = null;

    const renderForm = (d) => {
      body.innerHTML = '';
      if (!d) { body.appendChild(el('div', null, '没有在线设备')); return; }
      const info = (d.extra && d.extra.deviceInfo) || {};
      const oem = info.oem || {};
      const meta = el('div', 'tb-oem-meta');
      meta.textContent =
        `设备   ${d.deviceId}\n` +
        `机型   ${oem.manufacturer || info.manufacturer || ''} / ${oem.brand || info.brand || ''} / ${oem.model || info.model || ''}\n` +
        `已用   ${info.batteryPathUsed || '(尚未跑过引导)'}\n` +
        `首选   ${info.batteryPath || '(未上报)'}\n` +
        `在线   ${d.online ? '是' : '否'}    版本 ${info.apkVer || ''}`;
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
      ta.value = ((oem.battery && oem.battery.length ? oem.battery : [])).join('\n');

      const delay = mkRow('点击延迟 ms', el('input'));
      delay.value = oem.clickDelayMs || 400;

      const admin = mkRow('管理员流程', el('select'));
      ['standard'].forEach((v) => { const o = el('option', null, v); o.value = v; admin.appendChild(o); });
      admin.value = oem.adminFlow || 'standard';

      const noti = mkRow('通知流程', el('select'));
      ['standard'].forEach((v) => { const o = el('option', null, v); o.value = v; noti.appendChild(o); });
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
          battery: ta.value.split('\n').map((s) => s.trim()).filter(Boolean),
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
    };

    const load = async () => {
      const r = await api('/api/devices');
      devices = (r && r.devices) || [];
      tabs.innerHTML = '';
      devices.forEach((d, i) => {
        const t = el('div', 'tb-oem-tab' + (i === 0 ? ' on' : ''),
          `${(d.extra && d.extra.deviceInfo && d.extra.deviceInfo.model) || d.displayId || d.deviceId} · ${d.online ? '在线' : '离线'}`);
        t.onclick = () => {
          [...tabs.children].forEach((c) => c.classList.remove('on'));
          t.classList.add('on');
          cur = d;
          renderForm(d);
        };
        tabs.appendChild(t);
      });
      cur = devices[0] || null;
      renderForm(cur);
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
    item.onclick = openPanel;
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
