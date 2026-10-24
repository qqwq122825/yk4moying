/* 保活策略页（oem policy）—— 视觉完全沿用面板自己的设计令牌（--bg/--bg2/--border/--accent…）
 * 入口：左侧图标栏末尾「保活」
 * 数据：GET /api/devices（deviceInfo.oem 由设备 deviceOnline 上报）
 * 下发：POST /api/oem-policy → 服务端 send_command('oemPolicy')
 */
(() => {
  if (window.__tbOemLoaded) return;
  window.__tbOemLoaded = true;

  const clean = (v) => String(v || '').trim().replace(/^"+|"+$/g, '');
  const looksToken = (v) => typeof v === 'string' && /^[A-Za-z0-9_.-]{16,128}$/.test(v);
  function findToken() {
    for (const k of ['c2token', 'token', 'access_token', 'auth', 'tk']) {
      const v = clean(localStorage.getItem(k) || sessionStorage.getItem(k));
      if (looksToken(v)) return v;
      if (v) { try { const o = JSON.parse(v); const t = o && (o.token || o.access_token); if (looksToken(t)) return t; } catch (e) {} }
    }
    for (const st of [localStorage, sessionStorage]) {
      for (let i = 0; i < st.length; i++) {
        const raw = st.getItem(st.key(i)) || '';
        const v = clean(raw);
        if (looksToken(v)) return v;
        try { const o = JSON.parse(raw); if (o && typeof o === 'object') for (const kk in o) { const vv = clean(o[kk]); if (looksToken(vv)) return vv; } } catch (e) {}
      }
    }
    return '';
  }

  const api = async (path, opt = {}) => {
    const r = await fetch(path, {
      ...opt,
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${findToken()}`, ...(opt.headers || {}) },
    });
    return r.json().catch(() => ({}));
  };

  const CSS = `
  .tb-oem{position:fixed;inset:0;background:var(--bg);color:var(--text);z-index:99998;
    display:flex;flex-direction:column;font-size:13px}
  .tb-oem-bar{display:flex;align-items:center;gap:10px;padding:14px 20px;background:var(--bg2);
    border-bottom:1px solid var(--border)}
  .tb-oem-bar h2{margin:0;font-size:16px;font-weight:600}
  .tb-oem-back{display:inline-flex;align-items:center;gap:6px;height:32px;padding:0 12px;border-radius:var(--radius);
    border:1px solid var(--border);background:var(--bg2);color:var(--text2);cursor:pointer;font-size:13px}
  .tb-oem-back:hover{background:var(--bg3);color:var(--text)}
  .tb-oem-sp{flex:1}
  .tb-oem-btn{height:32px;padding:0 14px;border-radius:var(--radius);border:1px solid var(--border);
    background:var(--bg2);color:var(--text);cursor:pointer;font-size:13px;transition:var(--transition)}
  .tb-oem-btn:hover{background:var(--bg3)}
  .tb-oem-btn.pri{background:var(--accent);border-color:var(--accent);color:#fff}
  .tb-oem-btn.pri:hover{background:var(--accent2)}
  .tb-oem-body{flex:1;overflow:auto;padding:18px 20px 40px}
  .tb-oem-stats{display:flex;gap:12px;flex-wrap:wrap;margin-bottom:16px}
  .tb-oem-stat{min-width:150px;background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius-lg);
    padding:14px 18px;box-shadow:var(--shadow-sm)}
  .tb-oem-stat .n{font-size:22px;font-weight:600;line-height:1.2}
  .tb-oem-stat .l{font-size:12px;color:var(--text2);margin-top:2px}
  .tb-oem-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius-lg);
    box-shadow:var(--shadow-sm);overflow:hidden;margin-bottom:16px}
  .tb-oem-toolbar{display:flex;align-items:center;gap:10px;padding:12px 14px;border-bottom:1px solid var(--border)}
  .tb-oem-toolbar .search{flex:1;max-width:320px;height:32px;padding:0 12px;border-radius:var(--radius);
    border:1px solid var(--border);background:var(--bg);color:var(--text);font-size:13px;outline:none}
  .tb-oem-toolbar .search:focus{border-color:var(--accent)}
  .tb-oem-toolbar .cnt{font-size:12px;color:var(--text2)}
  table.tb-oem-tbl{width:100%;border-collapse:collapse;font-size:13px}
  table.tb-oem-tbl th{text-align:left;font-weight:500;font-size:12px;color:var(--text2);
    background:var(--bg3);padding:10px 14px;white-space:nowrap}
  table.tb-oem-tbl td{padding:11px 14px;border-top:1px solid var(--border);vertical-align:middle}
  table.tb-oem-tbl tr.on td{background:var(--accent-light)}
  .tb-oem-mono{font-family:ui-monospace,Menlo,monospace;font-size:12px;color:var(--text2)}
  .tb-oem-tag{display:inline-flex;align-items:center;height:22px;padding:0 8px;border-radius:999px;font-size:11px}
  .tb-oem-tag.on{background:var(--green-light);color:var(--green)}
  .tb-oem-tag.off{background:var(--bg3);color:var(--text3)}
  .tb-oem-tag.warn{background:var(--orange-light);color:var(--orange)}
  .tb-oem-detail{padding:16px 18px}
  .tb-oem-detail h3{margin:0 0 4px;font-size:14px;font-weight:600}
  .tb-oem-detail .sub{font-size:12px;color:var(--text2);margin-bottom:14px;font-family:ui-monospace,Menlo,monospace;white-space:pre-wrap}
  .tb-oem-form{display:grid;grid-template-columns:150px minmax(0,1fr);gap:10px 14px;align-items:start;max-width:900px}
  .tb-oem-form label{font-size:12px;color:var(--text2);padding-top:8px}
  .tb-oem-form input,.tb-oem-form textarea{width:100%;box-sizing:border-box;padding:8px 10px;border-radius:var(--radius);
    border:1px solid var(--border);background:var(--bg);color:var(--text);font-size:12.5px;
    font-family:ui-monospace,Menlo,monospace;outline:none}
  .tb-oem-form input:focus,.tb-oem-form textarea:focus{border-color:var(--accent)}
  .tb-oem-form textarea{min-height:96px;resize:vertical}
  .tb-oem-form .acts{grid-column:2;display:flex;gap:10px;margin-top:6px}
  .tb-oem-empty{padding:36px;text-align:center;color:var(--text3);font-size:13px}
  .tb-oem-err{padding:12px 14px;border-radius:var(--radius);background:var(--red-light);color:var(--red);font-size:12.5px}
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

  let page = null;
  let devices = [];
  let selected = null;

  function sidebarWidth() {
    const nav = document.querySelector('.sidebar') || document.getElementById('tb-oem-nav')?.parentElement;
    const w = nav ? nav.getBoundingClientRect().width : 0;
    return w > 20 ? w : 64;
  }

  async function openPage() {
    injectCss();
    document.getElementById('tb-oem-page')?.remove();
    page = el('div', 'tb-oem');
    page.id = 'tb-oem-page';

    const bar = el('div', 'tb-oem-bar');
    const back = el('div', 'tb-oem-back', '← 返回');
    back.onclick = () => page.remove();
    bar.appendChild(back);
    bar.appendChild(el('h2', null, '保活策略'));
    bar.appendChild(el('div', 'tb-oem-sp'));
    const refresh = el('button', 'tb-oem-btn', '刷新');
    refresh.onclick = () => load(page);
    bar.appendChild(refresh);
    page.appendChild(bar);
    page.appendChild(el('div', 'tb-oem-body'));
    document.body.appendChild(page);
    page.style.left = sidebarWidth() + 'px';
    page.style.inset = '0 0 0 ' + sidebarWidth() + 'px';
    await load(page);
  }

  async function load(root) {
    const body = root.querySelector('.tb-oem-body');
    body.innerHTML = '';
    let r;
    try { r = await api('/api/devices'); } catch (e) { r = { ok: false, error: String(e) }; }
    if (!r || r.ok === false || r.error) {
      const err = el('div', 'tb-oem-err', '读取设备失败：' + (r && (r.error || r.msg) || '未登录或令牌过期，请刷新面板重新登录'));
      body.appendChild(err);
      return;
    }
    devices = r.devices || [];

    // 统计卡（沿用面板 overview-card 的观感）
    const stats = el('div', 'tb-oem-stats');
    const online = devices.filter((d) => d.online).length;
    const withPolicy = devices.filter((d) => ((d.extra || {}).deviceInfo || {}).oem).length;
    const fallback = devices.filter((d) => {
      const u = (((d.extra || {}).deviceInfo) || {}).batteryPathUsed || '';
      return u.startsWith('aosp/');
    }).length;
    [['设备总数', devices.length], ['在线', online], ['已上报机型策略', withPolicy], ['走 AOSP 兜底', fallback]]
      .forEach(([l, n]) => {
        const c = el('div', 'tb-oem-stat');
        c.appendChild(el('div', 'n', String(n)));
        c.appendChild(el('div', 'l', l));
        stats.appendChild(c);
      });
    body.appendChild(stats);

    // 设备表
    const card = el('div', 'tb-oem-card');
    const tb = el('div', 'tb-oem-toolbar');
    const search = el('input', 'search');
    search.placeholder = '搜索型号 / 厂商 / 设备号…';
    tb.appendChild(search);
    const cnt = el('div', 'cnt', `共 ${devices.length} 台`);
    tb.appendChild(cnt);
    card.appendChild(tb);

    const table = el('table', 'tb-oem-tbl');
    const thead = el('thead');
    const htr = el('tr');
    ['设备', '机型', '状态', '实际路径（batteryPathUsed）', '首选路径', '延迟', ''].forEach((t) => htr.appendChild(el('th', null, t)));
    thead.appendChild(htr);
    table.appendChild(thead);
    const tbody = el('tbody');
    table.appendChild(tbody);
    card.appendChild(table);
    body.appendChild(card);

    const detailCard = el('div', 'tb-oem-card');
    detailCard.appendChild(el('div', 'tb-oem-empty', '选择上方任一设备以查看/修改策略'));
    body.appendChild(detailCard);

    const renderRows = (kw = '') => {
      tbody.innerHTML = '';
      const list = devices.filter((d) => {
        const i = (d.extra || {}).deviceInfo || {};
        const o = i.oem || {};
        const hay = [d.deviceId, o.model, o.manufacturer, o.brand, i.model].join(' ').toLowerCase();
        return !kw || hay.includes(kw.toLowerCase());
      });
      cnt.textContent = `共 ${list.length} 台`;
      if (!list.length) {
        const tr = el('tr');
        const td = el('td');
        td.colSpan = 7;
        td.className = 'tb-oem-empty';
        td.textContent = '没有匹配的设备';
        tr.appendChild(td);
        tbody.appendChild(tr);
        return;
      }
      list.forEach((d) => {
        const i = (d.extra || {}).deviceInfo || {};
        const o = i.oem || {};
        const tr = el('tr');
        if (selected && selected.deviceId === d.deviceId) tr.classList.add('on');
        const tdDev = el('td');
        const mono = el('div', 'tb-oem-mono', (d.displayId || d.deviceId));
        tdDev.appendChild(mono);
        tr.appendChild(tdDev);
        tr.appendChild(el('td', null, `${o.manufacturer || i.manufacturer || ''} ${o.model || i.model || ''}`.trim() || '—'));
        const tdOn = el('td');
        const tag = el('span', 'tb-oem-tag ' + (d.online ? 'on' : 'off'), d.online ? '在线' : '离线');
        tdOn.appendChild(tag);
        tr.appendChild(tdOn);
        const used = i.batteryPathUsed || '';
        const tdUsed = el('td');
        const utag = el('span', 'tb-oem-mono', used || '未跑引导');
        if (used.startsWith('aosp/')) utag.style.color = 'var(--orange)';
        tdUsed.appendChild(utag);
        tr.appendChild(tdUsed);
        tr.appendChild(el('td', 'tb-oem-mono', i.batteryPath || '—'));
        tr.appendChild(el('td', 'tb-oem-mono', String(o.clickDelayMs || '—')));
        const tdAct = el('td');
        const b = el('button', 'tb-oem-btn', '配置');
        b.onclick = () => { selected = d; renderRows(search.value); renderDetail(detailCard, d); };
        tdAct.appendChild(b);
        tr.appendChild(tdAct);
        tr.ondblclick = () => { selected = d; renderRows(search.value); renderDetail(detailCard, d); };
        tbody.appendChild(tr);
      });
    };
    search.oninput = () => renderRows(search.value);
    renderRows();
  }

  function renderDetail(card, d) {
    card.innerHTML = '';
    const i = (d.extra || {}).deviceInfo || {};
    const o = i.oem || {};
    const wrap = el('div', 'tb-oem-detail');
    wrap.appendChild(el('h3', null, `策略 · ${o.model || i.model || d.deviceId}`));
    const sub = el('div', 'sub');
    sub.textContent =
      `设备号  ${d.deviceId}\n` +
      `厂商    ${o.manufacturer || i.manufacturer || ''} / ${o.brand || i.brand || ''}\n` +
      `实际    ${i.batteryPathUsed || '(尚未跑过引导)'}\n` +
      `首选    ${i.batteryPath || '(未上报)'}\n` +
      `版本    ${i.apkVer || ''}    在线 ${d.online ? '是' : '否'}`;
    wrap.appendChild(sub);

    const form = el('div', 'tb-oem-form');
    const mk = (label, node) => { form.appendChild(el('label', null, label)); form.appendChild(node); return node; };

    const ta = mk('电池/自启动页面', el('textarea'));
    ta.placeholder = '每行一条：\ncom.miui.powerkeeper/com.miui.powerkeeper.ui.HiddenAppsConfigActivity\naosp/request-ignore\naosp/list';
    ta.value = (o.battery && o.battery.length ? o.battery : []).join('\n');

    const delay = mk('点击延迟 ms', el('input'));
    delay.value = o.clickDelayMs || 400;
    const admin = mk('管理员流程', el('input'));
    admin.value = o.adminFlow || 'standard';
    const noti = mk('通知流程', el('input'));
    noti.value = o.notificationFlow || 'standard';
    const notes = mk('备注', el('input'));
    notes.value = o.notes || '';

    const acts = el('div', 'acts');
    const resend = el('button', 'tb-oem-btn', '重新下发');
    resend.onclick = async () => {
      const r = await api('/api/oem-policy', { method: 'POST', body: JSON.stringify({ deviceId: d.deviceId }) });
      alert(r && r.ok ? '已重新下发' : '下发失败：' + JSON.stringify(r));
    };
    const clear = el('button', 'tb-oem-btn', '清除覆盖');
    clear.onclick = async () => {
      const r = await api('/api/oem-policy', { method: 'POST', body: JSON.stringify({ deviceId: d.deviceId, policy: { clear: true } }) });
      alert(r && r.ok ? '已清除，回到默认表' : '失败：' + JSON.stringify(r));
    };
    const save = el('button', 'tb-oem-btn pri', '保存并下发');
    save.onclick = async () => {
      const policy = {
        battery: ta.value.split('\n').map((x) => x.trim()).filter(Boolean),
        clickDelayMs: Number(delay.value) || 400,
        adminFlow: admin.value || 'standard',
        notificationFlow: noti.value || 'standard',
        notes: notes.value || '',
      };
      const r = await api('/api/oem-policy', { method: 'POST', body: JSON.stringify({ deviceId: d.deviceId, policy }) });
      if (r && r.ok) {
        alert('已下发到设备');
        if (d.extra && d.extra.deviceInfo) {
          d.extra.deviceInfo.oem = Object.assign({}, d.extra.deviceInfo.oem || {}, policy);
        }
      } else {
        alert('保存失败：' + JSON.stringify(r));
      }
    };
    acts.appendChild(clear);
    acts.appendChild(resend);
    acts.appendChild(save);
    form.appendChild(acts);
    wrap.appendChild(form);
    card.appendChild(wrap);
  }

  function addNav() {
    if (document.getElementById('tb-oem-nav')) return;
    // 优先挂到侧边栏根节点（.sidebar），避免挂进某个 nav 按钮里被它的事件带走
    let bar = document.querySelector('.sidebar') || document.querySelector('aside');
    if (!bar) {
      const cands = [...document.querySelectorAll('nav, aside, div')];
      for (const n of cands) {
        const t = n.textContent || '';
        if (t.includes('设备') && t.includes('注入') && n.children.length >= 3
            && n.clientWidth < 160 && n.clientWidth > 40) { bar = n; break; }
      }
    }
    if (!bar) return;

    const item = el('div');
    item.id = 'tb-oem-nav';
    item.setAttribute('role', 'button');
    item.style.cssText = 'display:flex;flex-direction:column;align-items:center;gap:3px;padding:10px 4px;' +
      'cursor:pointer;color:var(--text2);font-size:11px;border-radius:var(--radius);transition:var(--transition)';
    item.innerHTML = '<span style="font-size:18px;line-height:1">🛡</span><span>保活</span>';

    // 关键：面板的侧边栏按钮是 React 全局事件委托，点我们的节点会冒泡到它的 handler，
    // 于是被带去 /panel/ai。这里在**捕获阶段**全部拦掉，只执行我们自己的 openPage。
    const swallow = (e) => { e.preventDefault(); e.stopPropagation(); e.stopImmediatePropagation(); };
    ['pointerdown', 'mousedown', 'pointerup', 'mouseup', 'touchstart', 'touchend'].forEach((ev) => {
      item.addEventListener(ev, swallow, true);
    });
    item.addEventListener('click', (e) => {
      swallow(e);
      openPage();
    }, true);

    item.onmouseenter = () => { item.style.background = 'var(--bg3)'; item.style.color = 'var(--text)'; };
    item.onmouseleave = () => { item.style.background = 'transparent'; item.style.color = 'var(--text2)'; };
    bar.appendChild(item);
  }

  const boot = () => {
    injectCss();
    addNav();
    new MutationObserver(() => addNav()).observe(document.body, { childList: true, subtree: true });
  };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot);
  else boot();
})();
