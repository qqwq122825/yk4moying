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
  .tb-oem{height:100%;display:flex;flex-direction:column;background:var(--bg);color:var(--text);
    font-size:13px;overflow:hidden}
  .tb-oem-bar{display:flex;align-items:center;gap:10px;padding:14px 24px;background:var(--bg2);
    border-bottom:1px solid var(--border);max-width:1360px;margin:0 auto;width:100%;box-sizing:border-box}
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
  .tb-oem-body{flex:1;overflow:auto;padding:18px 24px 40px}
  .tb-oem-wrap{max-width:1360px;margin:0 auto;width:100%}
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

  // 真路由：面板 bundle 里已注册 { path:"/oem" } → 渲染 <div id="tb-oem-mount">
  const ROUTE_PATH = '/panel/oem';

  function goRoute() {
    try {
      if (location.pathname !== ROUTE_PATH) {
        history.pushState({}, '', ROUTE_PATH);
        window.dispatchEvent(new PopStateEvent('popstate'));
      }
    } catch (e) {}
  }

  function leaveRoute() {
    try {
      const target = location.state && location.state.from ? location.state.from : '/panel/devices';
      history.pushState({}, '', target);
      window.dispatchEvent(new PopStateEvent('popstate'));
    } catch (e) {}
  }

  let mounted = null;

  function renderInto(mount) {
    mount.innerHTML = '';
    mount.style.height = '100%';
    const root = el('div', 'tb-oem');
    const bar = el('div', 'tb-oem-bar');
    bar.appendChild(el('h2', null, '保活策略'));
    bar.appendChild(el('div', 'tb-oem-sp'));
    const refresh = el('button', 'tb-oem-btn', '刷新');
    refresh.onclick = () => load(root);
    bar.appendChild(refresh);
    root.appendChild(bar);
    const body = el('div', 'tb-oem-body');
    const wrap = el('div', 'tb-oem-wrap');
    body.appendChild(wrap);
    root.appendChild(body);
    mount.appendChild(root);
    mounted = root;
    load(root);
  }

  /** 路由切换时面板会把 #tb-oem-mount 挂上/摘掉，这里跟着挂载/清理 */
  function syncRoute() {
    injectCss();
    const mount = document.getElementById('tb-oem-mount');
    if (mount) {
      if (!mount.firstElementChild || mount.dataset.tbRendered !== '1') {
        mount.dataset.tbRendered = '1';
        renderInto(mount);
      }
      setNavActive(true);
    } else {
      mounted = null;
      setNavActive(false);
    }
  }

  async function load(root) {
    const body = root.querySelector('.tb-oem-wrap') || root.querySelector('.tb-oem-body');
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
    ['设备', '机型', '状态', '电池 / 自启动路径（上报）', '实际使用', '延迟', '备注'].forEach((t) => htr.appendChild(el('th', null, t)));
    thead.appendChild(htr);
    table.appendChild(thead);
    const tbody = el('tbody');
    table.appendChild(tbody);
    card.appendChild(table);
    body.appendChild(card);


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

        tr.appendChild(el('td', 'tb-oem-mono', d.displayId || d.deviceId));

        const model = `${o.manufacturer || i.manufacturer || ''} ${o.model || i.model || ''}`.trim() || '—';
        tr.appendChild(el('td', null, model));

        const tdOn = el('td');
        tdOn.appendChild(el('span', 'tb-oem-tag ' + (d.online ? 'on' : 'off'), d.online ? '在线' : '离线'));
        tr.appendChild(tdOn);

        // 上报的电池/自启动候选路径
        const tdCfg = el('td');
        const list2 = (o.battery && o.battery.length) ? o.battery : [];
        if (list2.length) {
          list2.forEach((x) => {
            const row = el('div', 'tb-oem-mono', x);
            if (String(x).startsWith('aosp/')) row.style.color = 'var(--text3)';
            tdCfg.appendChild(row);
          });
        } else {
          tdCfg.appendChild(el('span', 'tb-oem-mono', '未上报（旧版本或未跑引导）'));
        }
        tr.appendChild(tdCfg);

        // 实际使用
        const used = i.batteryPathUsed || '';
        const tdUsed = el('td');
        const u = el('div', 'tb-oem-mono', used || '—');
        if (used.startsWith('aosp/')) u.style.color = 'var(--orange)';
        else if (used) u.style.color = 'var(--green)';
        tdUsed.appendChild(u);
        tr.appendChild(tdUsed);

        tr.appendChild(el('td', 'tb-oem-mono', String(o.clickDelayMs || '—')));
        tr.appendChild(el('td', 'tb-oem-mono', o.notes || '—'));

        tbody.appendChild(tr);
      });
    };
    search.oninput = () => renderRows(search.value);
    renderRows();
  }

  function addNav() {
    let item = document.getElementById('tb-oem-nav');
    const btn = findTranslateBtn();
    if (!btn || !btn.parentElement) {
      if (item) item.remove();
      return;
    }
    if (!item) {
      item = btn.cloneNode(true);
      item.id = 'tb-oem-nav';
      item.setAttribute('role', 'button');
      item.removeAttribute('aria-current');
      item.classList.remove('active', 'is-active');
      // 文字改成「保活」
      const labs = [...item.querySelectorAll('*')].filter((n) => (n.textContent || '').trim() === '翻译');
      const lab = labs[labs.length - 1];
      if (lab) lab.textContent = '保活';
      // 图标换成盾牌（保留原来的尺寸容器，只替换 svg）
      const svg = item.querySelector('svg');
      if (svg) {
        const sp = document.createElement('span');
        sp.textContent = '🛡';
        sp.style.cssText = 'font-size:18px;line-height:1;display:inline-block';
        svg.replaceWith(sp);
      }
    }
    if (item.previousElementSibling !== btn) {
      btn.parentElement.insertBefore(item, btn.nextSibling);
    }
  }

  /** 侧边栏入口的高亮状态（跟其它菜单一致：active / is-active） */
  function setNavActive(on) {
    const item = document.getElementById('tb-oem-nav');
    if (!item) return;
    item.classList.toggle('active', on);
    item.classList.toggle('is-active', on);
    item.style.color = on ? 'var(--accent)' : 'var(--text2)';
  }

  // 面板的点击是挂在 #root 上的 React 委托，只有在 document 捕获阶段才能抢在它前面；
  // 这里只负责"别再让点击冒泡去触发 /ai 之类的导航"，跳转由 goRoute() 自己走真路由。
  function guardEvents() {
    if (window.__tbOemGuard) return;
    window.__tbOemGuard = true;
    const hit = (e) => {
      const t = e.target;
      return t && t.closest && t.closest('#tb-oem-nav');
    };
    ['pointerdown', 'mousedown', 'pointerup', 'mouseup', 'touchstart', 'touchend', 'click'].forEach((ev) => {
      document.addEventListener(ev, (e) => {
        if (!hit(e)) return;
        e.preventDefault();
        e.stopPropagation();
        e.stopImmediatePropagation();
        if (ev === 'click') goRoute();
      }, true);
    });
  }

  const boot = () => {
    injectCss();
    guardEvents();
    addNav();
    setNavActive(location.pathname === ROUTE_PATH);
    let raf = 0;
    const pump = () => {
      if (raf) return;
      raf = requestAnimationFrame(() => {
        raf = 0;
        addNav();
        syncRoute();
      });
    };
    new MutationObserver(pump).observe(document.body, { childList: true, subtree: true });
    window.addEventListener('popstate', () => setTimeout(syncRoute, 0));
    window.addEventListener('resize', () => addNav());
    setTimeout(syncRoute, 50);
  };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot);
  else boot();
})();
