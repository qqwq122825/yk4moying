/* B 包首页地址输入（面板 B 步骤已移除该输入，这里补回来）
 * 做法：不改面板 bundle，只在渲染出的 B 包卡片里插一行输入框，
 *      并在提交 /api/build 时把 homeUrl 带进请求体。
 * 提交后：B 包的 agent_config.homepage 会被写入，A 包构建时会自动继承。
 */
(() => {
  if (window.__tbHomeUrlLoaded) return;
  window.__tbHomeUrlLoaded = true;

  const STORE_KEY = 'tb_home_url';
  const api = (p) => new URL(p, location.origin).href;

  // 1) 拦截 fetch：给 /api/build 补 homeUrl
  const origFetch = window.fetch;
  window.fetch = function (input, init) {
    try {
      const url = typeof input === 'string' ? input : (input && input.url) || '';
      if (url.includes('/api/build') && init && init.body && typeof init.body === 'string') {
        const j = JSON.parse(init.body);
        const v = (localStorage.getItem(STORE_KEY) || '').trim();
        if (j && j.templateId && !j.homeUrl && v) {
          j.homeUrl = v;
          init = { ...init, body: JSON.stringify(j) };
        }
      }
    } catch (e) {}
    return origFetch.call(this, input, init);
  };

  const CSS = `
  .tb-home-row{display:flex;flex-direction:column;gap:8px;margin-top:18px}
  .tb-home-row label{font-size:13px;color:var(--text2)}
  .tb-home-row input{height:40px;padding:0 12px;border:1px solid var(--border);border-radius:var(--radius);
    background:var(--bg2,#fff);color:var(--text);font-size:13px;outline:none}
  .tb-home-row input:focus{border-color:var(--accent)}
  .tb-home-tip{font-size:11px;color:var(--text3)}
  `;

  function injectCss() {
    if (document.getElementById('tb-home-css')) return;
    const s = document.createElement('style');
    s.id = 'tb-home-css';
    s.textContent = CSS;
    document.head.appendChild(s);
  }

  function findBCard() {
    // 找包含「B 包模板版本」的那张卡片容器
    const nodes = [...document.querySelectorAll('div')];
    const label = nodes.filter((n) => (n.textContent || '').trim() === 'B 包模板版本').pop();
    if (!label) return null;
    let box = label;
    for (let i = 0; i < 8 && box.parentElement; i++) {
      box = box.parentElement;
      if (box.querySelector('input,select') && box.getBoundingClientRect().width > 400) return box;
    }
    return label.parentElement;
  }

  function ensureRow() {
    injectCss();
    const card = findBCard();
    if (!card || card.querySelector('.tb-home-row')) return;
    const row = document.createElement('div');
    row.className = 'tb-home-row';
    const lab = document.createElement('label');
    lab.textContent = '首页地址';
    const inp = document.createElement('input');
    inp.type = 'url';
    inp.placeholder = '例如 https://www.example.com/';
    inp.value = localStorage.getItem(STORE_KEY) || '';
    inp.oninput = () => localStorage.setItem(STORE_KEY, inp.value.trim());
    const tip = document.createElement('div');
    tip.className = 'tb-home-tip';
    tip.textContent = '留空则用模板默认首页；A 包会自动继承这里填的地址';
    row.appendChild(lab);
    row.appendChild(inp);
    row.appendChild(tip);
    card.appendChild(row);
  }

  const boot = () => {
    injectCss();
    ensureRow();
    new MutationObserver(() => ensureRow()).observe(document.body, { childList: true, subtree: true });
    setInterval(ensureRow, 1200);
  };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot);
  else boot();
})();
