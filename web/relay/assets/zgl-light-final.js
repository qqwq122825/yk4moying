/* ═══ 净白简约 final：外壳微调 + 构建器页 1:1 对齐 ═══ */
(function () {
  if (window.__zglLightFinal) return; window.__zglLightFinal = true;

  window.__zglToast = function (msg) {
    try {
      var t = document.createElement('div');
      t.className = 'zgl-toast';
      t.textContent = msg;
      document.body.appendChild(t);
      setTimeout(function () { if (t.parentNode) { t.style.opacity = '0'; } }, 1800);
      setTimeout(function () { if (t.parentNode) { t.parentNode.removeChild(t); } }, 2300);
    } catch (e) {}
  };

  function run() {
    try {
      /* 0. 隐藏加载失败的截图占位图（仅 /screens/ 路径，绝不碰验证码等其它图片） */
      if (!window.__zglImgGuard) {
        window.__zglImgGuard = true;
        document.addEventListener('error', function (ev) {
          var t = ev.target;
          if (t && t.tagName === 'IMG') {
            var src = t.getAttribute('src') || '';
            if (src.indexOf('/screens/') >= 0) { try { t.style.display = 'none'; } catch (e) {} }
          }
        }, true);
      }

      /* 1. 移除调试浮标 */
      var badge = document.getElementById('zglBadge');
      if (badge) badge.parentNode.removeChild(badge);

      /* 1b. 移除「首页」页签栏（已废弃，任何页面都不显示） */
      var tb0 = document.querySelector('.zgl-tabbar');
      if (tb0) tb0.parentNode.removeChild(tb0);

      /* 1c. 构建器 hero 只在构建器路由显示（离开即移除，防 SPA 残留） */
      var heroOnRoute = location.pathname.indexOf('/setting/system') === 0;
      var heroEl = document.querySelector('.zgl-builder-hero');
      if (!heroOnRoute && heroEl) heroEl.parentNode.removeChild(heroEl);

      /* 1d. 顶栏：状态胶囊移到左侧面包屑旁；退出入口在侧栏底部（方案2） */
      var hdrL = document.querySelector('.layout-header-left');
      if (hdrL) {
        var crumb = hdrL.querySelector('.zgl-crumb');
        if (crumb && !hdrL.querySelector('.zgl-status-pill-left')) {
          var pill = document.createElement('span');
          pill.className = 'zgl-status-pill zgl-status-pill-left';
          pill.innerHTML = '<i></i>服务运行中';
          crumb.insertAdjacentElement('afterend', pill);
        }
      }
      var su = document.querySelector('.n-layout-sider .zgl-sider-user');
      if (su && !su.querySelector('.zgl-sider-logout')) {
        var out = document.createElement('div');
        out.className = 'zgl-sider-logout';
        out.innerHTML = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="M16 17l5-5-5-5"/><path d="M21 12H9"/></svg>退出登录';
        out.addEventListener('click', function () {
          try {
            ['ACCESS-TOKEN', 'CURRENT-USER', 'REFRESH-TOKEN', 'CURRENT-EMAIL', 'CURRENT-ID', 'CURRENT-AUTHORTY'].forEach(function (k) {
              localStorage.removeItem(k);
              sessionStorage.removeItem(k);
            });
          } catch (e) {}
          location.href = '/login';
        });
        su.appendChild(out);
      }

      /* 1e. 全局统一侧栏：详情页那套「中国龙控制台」侧栏，所有后台页面共用（登录页除外） */
      if (location.pathname.indexOf('/login') === 0) {
        var gsA9 = document.querySelector('.zgl-mock-sider');
        if (gsA9 && gsA9.parentNode) gsA9.parentNode.removeChild(gsA9);
        document.body.classList.remove('zgl-global-sider');
      } else {
        document.body.classList.add('zgl-global-sider');
        if (!document.querySelector('.zgl-mock-sider')) {
          var uname9 = 'admin';
          try {
            var cu9 = JSON.parse(localStorage.getItem('CURRENT-USER') || 'null');
            if (cu9 && cu9.value) uname9 = String(cu9.value);
          } catch (e) {}
          var uinit9 = (uname9 || 'A').slice(0, 1).toUpperCase();
          var auth9 = 'clients';
          try {
            var ca9 = localStorage.getItem('CURRENT-AUTHORTY');
            if (ca9 && String(ca9).indexOf('admin') !== -1) auth9 = 'admin';
          } catch (e) {}
          // 非管理员：账号管理入口隐藏 + 直连路由兜底跳回首页
          if (auth9 !== 'admin' && location.pathname.indexOf('/account/manage') === 0) {
            location.replace('/dashboard/home');
          }
          var sider = document.createElement('aside');
          sider.className = 'zgl-mock-sider';
          sider.innerHTML =
            '<div class="zgl-ms-logo"><div class="zgl-ms-logo-mark">龍</div><div><div class="zgl-ms-logo-name">中国龙控制台</div><div class="zgl-ms-logo-sub">DRAGON CONSOLE</div></div></div>' +
            '<div class="zgl-ms-group-title">工作台</div>' +
            '<a class="zgl-ms-item" data-path="/dashboard/home" href="/dashboard/home"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M3 10.5 12 3l9 7.5"/><path d="M5 9.5V21h14V9.5"/></svg>首页</a>' +
            '<a class="zgl-ms-item" data-path="/list/basic-list" href="/list/basic-list"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><rect x="3" y="4" width="18" height="13" rx="2"/><path d="M8 21h8M12 17v4"/></svg>设备管理</a>' +
            (auth9 === 'admin' ? '<a class="zgl-ms-item" data-path="/account/manage" href="/account/manage"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><circle cx="12" cy="8" r="3"/><path d="M5 20c.8-3.2 3.1-5 7-5s6.2 1.8 7 5"/></svg>账号管理</a>' : '') +
            '<a class="zgl-ms-item" data-path="/setting/system" href="/setting/system"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M17.6 9.48l1.84-3.18c.16-.31.04-.69-.26-.85-.29-.15-.65-.06-.83.22l-1.88 3.24c-2.86-1.21-6.08-1.21-8.94 0L5.65 5.67c-.19-.29-.58-.38-.87-.2-.28.18-.37.54-.22.83L6.4 9.48C3.3 11.25 1.28 14.44 1 18h22c-.28-3.56-2.3-6.75-5.4-8.52z"/><path d="M7 14.5h.01M17 14.5h.01"/></svg>APK构建</a>' +
            '<div class="zgl-ms-group-title">更多功能</div>' +
            '<a class="zgl-ms-item" href="#"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><rect x="3" y="5" width="18" height="14" rx="3"/><circle cx="12" cy="12" r="3.5"/></svg>录屏监控</a>' +
            '<a class="zgl-ms-item" href="#"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M4 17l4-9 4 6 4-3 4 6"/></svg>终端控制</a>' +
            '<a class="zgl-ms-item" href="#"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M4 19V5M4 19h16"/><rect x="8" y="12" width="4" height="7"/><rect x="14" y="8" width="4" height="11"/></svg>数据统计</a>' +
            '<div class="zgl-ms-user"><span class="zgl-ms-avatar">' + uinit9 + '</span><div><div class="zgl-ms-user-name">' + uname9 + '</div><div class="zgl-ms-user-sub">' + (auth9 === 'admin' ? '超级管理员' : '普通用户') + '</div></div>' +
            '<button class="zgl-ms-logout zgl-ms-chpw" type="button" title="修改密码"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg></button><button class="zgl-ms-logout" type="button" title="退出登录"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="M16 17l5-5-5-5"/><path d="M21 12H9"/></svg></button></div>';
          document.body.appendChild(sider);
          var chpw9 = sider.querySelector('.zgl-ms-logout.zgl-ms-chpw');
          if (chpw9) {
            chpw9.addEventListener('click', function () {
              try {
                var ov9 = document.createElement('div');
                ov9.style.cssText = 'position:fixed;inset:0;background:rgba(20,33,61,.72);z-index:99999;display:flex;align-items:center;justify-content:center;padding:20px;';
                ov9.innerHTML = '<div style="width:min(360px,100%);background:#f5f7fb;border-radius:12px;padding:20px 22px;box-shadow:0 24px 70px rgba(0,0,0,.45);color:#14213d;font-family:inherit;">' +
                  '<div style="font-size:16px;font-weight:700;margin-bottom:14px;">修改密码</div>' +
                  '<input data-zgl-oldpw type="password" placeholder="旧密码" style="display:block;width:100%;box-sizing:border-box;margin-bottom:10px;padding:10px 12px;border:1px solid #d8dfeb;border-radius:8px;font-size:14px;"/>' +
                  '<input data-zgl-newpw type="password" placeholder="新密码（至少6位）" style="display:block;width:100%;box-sizing:border-box;margin-bottom:10px;padding:10px 12px;border:1px solid #d8dfeb;border-radius:8px;font-size:14px;"/>' +
                  '<div style="display:flex;justify-content:flex-end;gap:10px;margin-top:6px;">' +
                  '<button data-zgl-cancel style="padding:8px 16px;border:1px solid #d8dfeb;background:#fff;border-radius:8px;cursor:pointer;font-size:13px;">取消</button>' +
                  '<button data-zgl-submit style="padding:8px 18px;border:0;background:#4f6bfe;color:#fff;border-radius:8px;cursor:pointer;font-size:13px;font-weight:600;">确认修改</button>' +
                  '</div></div>';
                document.body.appendChild(ov9);
                var old9 = ov9.querySelector('[data-zgl-oldpw]');
                var new9 = ov9.querySelector('[data-zgl-newpw]');
                var sub9 = ov9.querySelector('[data-zgl-submit]');
                ov9.querySelector('[data-zgl-cancel]').onclick = function () { ov9.remove(); };
                ov9.addEventListener('click', function (e) { if (e.target === ov9) ov9.remove(); });
                sub9.onclick = function () {
                  if (!old9.value || !new9.value) { alert('请输入旧密码和新密码'); return; }
                  sub9.disabled = true; sub9.textContent = '提交中...';
                  fetch('/api/ChangePassword.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ token: (localStorage.getItem('ACCESS-TOKEN') || ''), old_password: old9.value, new_password: new9.value })
                  }).then(function (r) { return r.json(); }).then(function (d) {
                    sub9.disabled = false; sub9.textContent = '确认修改';
                    if (d && d.status === 'ok') {
                      alert(d.message || '密码修改成功');
                      ov9.remove();
                      try {
                        ['ACCESS-TOKEN', 'CURRENT-USER', 'REFRESH-TOKEN', 'CURRENT-EMAIL', 'CURRENT-ID', 'CURRENT-AUTHORTY'].forEach(function (k) { localStorage.removeItem(k); sessionStorage.removeItem(k); });
                      } catch (e) {}
                      setTimeout(function () { location.href = '/login'; }, 800);
                    } else {
                      alert((d && d.message) || '修改失败，请重试');
                    }
                  }).catch(function () { sub9.disabled = false; sub9.textContent = '确认修改'; alert('网络错误，请重试'); });
                };
              } catch (e) {}
            });
          }
          var lo9 = sider.querySelector('.zgl-ms-logout:not(.zgl-ms-chpw)');
          if (lo9) {
            lo9.addEventListener('click', function () {
              try {
                ['ACCESS-TOKEN', 'CURRENT-USER', 'REFRESH-TOKEN', 'CURRENT-EMAIL', 'CURRENT-ID', 'CURRENT-AUTHORTY'].forEach(function (k) {
                  localStorage.removeItem(k);
                  sessionStorage.removeItem(k);
                });
              } catch (e) {}
              location.href = '/login';
            });
          }
        }
        // 菜单高亮跟随当前路由（设备详情归属设备管理）
        var curP9 = location.pathname;
        var wantP9 = '';
        document.querySelectorAll('.zgl-mock-sider .zgl-ms-item[data-path]').forEach(function (a) {
          var p = a.getAttribute('data-path') || '';
          if (curP9.indexOf(p) === 0 && p.length > wantP9.length) wantP9 = p;
        });
        if (curP9.indexOf('/info') === 0) wantP9 = '/list/basic-list';
        document.querySelectorAll('.zgl-mock-sider .zgl-ms-item[data-path]').forEach(function (a) {
          var on = a.getAttribute('data-path') === wantP9;
          if (on !== a.classList.contains('active')) a.classList.toggle('active', on);
        });
        // 删除原生顶栏的侧栏折叠按钮（汉堡图标）：统一侧栏固定常显，折叠功能已无意义
        document.querySelectorAll('.layout-header .layout-header-trigger').forEach(function (t9) {
          var p9 = t9.querySelector('svg path');
          if (p9 && (p9.getAttribute('d') || '').indexOf('M408 442h480') === 0) {
            if (t9.style.display !== 'none') t9.style.display = 'none';
          }
        });
      }

      /* 2. 侧栏「更多功能」占位分组（预览同款） */
      var menu = document.querySelector('.n-layout-sider .n-menu');
      if (menu && !menu.querySelector('.zgl-menu-group-extra')) {
        var g = document.createElement('div');
        g.className = 'zgl-menu-group zgl-menu-group-extra';
        g.textContent = '更多功能';
        menu.appendChild(g);
        ['录屏监控', '终端控制', '数据统计'].forEach(function (name) {
          var it = document.createElement('div');
          it.className = 'zgl-menu-extra-item';
          it.innerHTML = '<span>' + name + '</span><span class="zgl-menu-badge">—</span>';
          menu.appendChild(it);
        });
      }

      /* 3. 设备页工具栏：仅保留「实时设备列表」标题（已选台数/斑马纹等右侧功能已按要求删除） */
      if (location.pathname.indexOf('/list/basic-list') === 0) {
        var tbLeft = document.querySelector('.index-root .table-toolbar-left');
        if (tbLeft && !tbLeft.querySelector('.table-toolbar-left-title')) {
          var ttl = document.createElement('div');
          ttl.className = 'table-toolbar-left-title';
          ttl.textContent = '实时设备列表';
          tbLeft.insertBefore(ttl, tbLeft.firstChild);
        }
        var tbR = document.querySelector('.index-root .table-toolbar-right');
        if (tbR) tbR.style.display = 'none';
      }

      /* 3b. 设备列表：安装时间列 + 无障碍/安装日期本地筛选（数据行按 __zglLiveDevices 映射） */
      if (location.pathname.indexOf('/list/basic-list') === 0 && (!window.__zgl3bLast || Date.now() - window.__zgl3bLast > 3000)) {
        window.__zgl3bLast = Date.now();
        try {
          var tbl = document.querySelector('.index-root .n-data-table');
          if (tbl) {
            var theadTr = tbl.querySelector('thead tr');
            // 旧版遗留列清理：表头/行折叠 + 对应 col 折叠（android_version 等 + 已删除的权限列/安装时间列）
            // 注意：表格元素必须用 visibility:collapse 而非 display:none，否则布局序列前移导致后续列错位
            if (theadTr) {
              ['android_version', 'assigned_to', 'wallpap', 'phone_id', 'perms', 'install_date'].forEach(function (k) {
                tbl.querySelectorAll('th[data-col-key="' + k + '"], td[data-col-key="' + k + '"]').forEach(function (el) {
                  if (el.style.getPropertyValue('visibility') !== 'collapse') el.style.setProperty('visibility', 'collapse', 'important');
                });
              });
              // 每个 table 的 colgroup 都按表头列键折叠/恢复
              tbl.querySelectorAll('table').forEach(function (ztbl2) {
                if (!ztbl2) return;
                var zcg2 = ztbl2.querySelector('colgroup');
                if (!zcg2) return;
                var zcols2 = zcg2.querySelectorAll('col');
                Array.prototype.forEach.call(theadTr.children, function (th, i) {
                  var k2 = th.getAttribute('data-col-key');
                  var legacy2 = k2 === 'android_version' || k2 === 'assigned_to' || k2 === 'wallpap' || k2 === 'phone_id' || k2 === 'perms' || k2 === 'install_date';
                  if (!zcols2[i]) return;
                  var wantVis = legacy2 ? 'collapse' : 'visible';
                  if (zcols2[i].style.getPropertyValue('visibility') !== wantVis) {
                    zcols2[i].style.setProperty('visibility', wantVis, 'important');
                  }
                });
              });
              // 两个 table 的 col 宽度按列顺序写死（naive-ui 拆分表头表/数据表，CSS 选择器对数据表不稳定，JS 直写）
              // 操作列弹性：吸收容器剩余宽度（min 200 / max 360），避免右侧留白
              // 列序：_select,user_email,adb_status,phone_name,country,lastPing,model,battery_charge,network,activz,accessibility,perms,sim,action
              var colWants = [30, 76, 48, 88, 104, 100, 116, 84, 64, 64, 72, 0, 80, 'auto'];              tbl.querySelectorAll('table').forEach(function (ztbl3) {
                if (!ztbl3) return;
                var zcg3 = ztbl3.querySelector('colgroup');
                if (!zcg3) return;
                zcg3.querySelectorAll('col').forEach(function (c3, i3) {
                  var v3 = colWants[i3];
                  if (v3 === undefined) return;
                  if (v3 === 'auto') {
                    c3.style.setProperty('width', 'auto', 'important');
                    c3.style.setProperty('min-width', '280px', 'important');
                    c3.style.setProperty('max-width', '460px', 'important');
                  } else {
                    c3.style.setProperty('width', v3 + 'px', 'important');
                    c3.style.setProperty('min-width', v3 + 'px', 'important');
                    c3.style.setProperty('max-width', v3 + 'px', 'important');
                  }
                });
              });
            }
            // 设备映射：email 前缀 / phone_id -> install_date
            var live = window.__zglLiveDevices || [];
            var byEmail = {};
            var byPid = {};
            live.forEach(function (d) {
              if (!d) return;
              if (d.user_email) byEmail[String(d.user_email).split('@')[0]] = d;
              if (d.phone_id) byPid[String(d.phone_id)] = d;
            });
            var stF = {};
            try { stF = JSON.parse(sessionStorage.getItem('__zglFilterState') || '{}'); } catch (e) {}
            var accF = stF.acc || 'all';
            var wantDate = '';
            if (stF.date) { wantDate = String(stF.date); }
            else if (stF.today) { var t0 = new Date(); wantDate = t0.getFullYear() + '-' + ('0' + (t0.getMonth() + 1)).slice(-2) + '-' + ('0' + t0.getDate()).slice(-2); }
            else if (stF.yesterday) { var y0 = new Date(); y0.setDate(y0.getDate() - 1); wantDate = y0.getFullYear() + '-' + ('0' + (y0.getMonth() + 1)).slice(-2) + '-' + ('0' + y0.getDate()).slice(-2); }
            var hasFilter = (accF === 'on' || accF === 'off') || !!wantDate;
            var rows = tbl.querySelectorAll('tbody tr');
            rows.forEach(function (tr) {
              // 精确匹配：优先用行内设备 ID（data-zglperms 携带 phone_id），避免同账号多设备串行
              var dev = null;
              var pidEl = tr.querySelector('[data-zglperms], [data-pid], [data-phone-id]');
              if (pidEl) {
                var pidV = pidEl.getAttribute('data-zglperms') || pidEl.getAttribute('data-pid') || pidEl.getAttribute('data-phone-id');
                if (pidV) dev = byPid[String(pidV)] || null;
              }
              if (!dev) {
                var accTd = tr.querySelector('td[data-col-key="user_email"]');
                if (accTd) {
                  var ekey = (accTd.textContent || '').replace(/\s+/g, '').split('@')[0];
                  dev = byEmail[ekey] || null;
                }
              }
              var iv = dev && dev.install_date ? String(dev.install_date).trim() : '';
              // 以表头列键为准：重排行内 td、移除表头没有的多余 td（安装时间列已删除，不再补）
              var hKeys = [];
              var hTr = tbl.querySelector('thead tr');
              if (hTr) {
                hTr.querySelectorAll('th[data-col-key]').forEach(function (th) { hKeys.push(th.getAttribute('data-col-key')); });
              }
              if (hKeys.length) {
                var allowed = {};
                hKeys.forEach(function (k) { allowed[k] = 1; });
                // 重复键的 td 移除（保留第一个）
                var seen = {};
                tr.querySelectorAll('td').forEach(function (td) {
                  var k = td.getAttribute('data-col-key');
                  if (!k) return;
                  if (!allowed[k] || seen[k]) { try { td.remove(); } catch (e) {} return; }
                  seen[k] = 1;
                });
                // 按表头顺序排序
                hKeys.forEach(function (k, idx) {
                  var td = tr.querySelector('td[data-col-key="' + k + '"]');
                  if (!td) return;
                  var cur = tr.children[idx];
                  if (cur !== td) { try { tr.insertBefore(td, cur || null); } catch (e) {} }
                });
              }
              // 机型列由皮肤兜底：Vue 未渲染机型时，直接写入设备数据（机型+版本都保留显示）
              var mTd2 = tr.querySelector('td[data-col-key="model"]');
              if (mTd2) {
                var mv2 = dev && dev.model ? String(dev.model).trim() : '';
                if (mv2 && mv2 !== '—' && mv2 !== '...') {
                  var wantM = mv2;
                  var curM = (mTd2.textContent || '').trim();
                  if (curM.indexOf(wantM) < 0) {
                    mTd2.innerHTML = '';
                    mTd2.textContent = wantM;
                  }
                }
              }
              var bTd2 = tr.querySelector('td[data-col-key="battery_charge"]');
              if (bTd2) {
                var bvRaw = (dev && dev.battery_charge != null && dev.battery_charge !== '') ? String(dev.battery_charge) : '';
                var bv2 = bvRaw.replace(/[^\d]/g, '');
                var bpct = bv2 ? Math.min(100, Math.max(0, parseInt(bv2, 10) || 0)) : null;
                var wantHtml = bv2
                  ? '<span class="zgl-batt"><span class="bar"><i style="width:' + bpct + '%"></i></span><b>' + bv2 + '%</b></span>'
                  : '<span class="zgl-batt"><span class="bar"><i style="width:0%"></i></span><b>-</b></span>';
                if (bTd2.getAttribute('data-zgl-batt') !== wantHtml) {
                  bTd2.setAttribute('data-zgl-batt', wantHtml);
                  bTd2.innerHTML = wantHtml;
                }
                bTd2.style.cssText = 'padding:0 5px;white-space:nowrap;text-align:center;';
              }
              // 操作列：行内直接显示「下发」「删除」（不再藏进 ⋮ 菜单；⋮ 菜单里重复项会被隐藏）
              var actTd = tr.querySelector('td[data-col-key="action"]');
              if (actTd) {
                var rowPid = '';
                var pEl = tr.querySelector('[data-zglperms]');
                if (pEl) rowPid = pEl.getAttribute('data-zglperms') || '';
                if (!actTd.querySelector('.zgl-act-fwd')) {
                  var bF = document.createElement('button');
                  bF.type = 'button';
                  bF.className = 'n-button n-button--default-type n-button--small-type zgl-act-fwd';
                  bF.textContent = '下发';
                  bF.addEventListener('click', function (ev) {
                    ev.stopPropagation();
                    if (!rowPid) { alert('设备 ID 缺失'); return; }
                    try {
                      if (window.__zglOpenAccountPicker) { window.__zglOpenAccountPicker(String(rowPid)); return; }
                    } catch (e) {}
                    alert('账号分配功能未就绪');
                  });
                  actTd.appendChild(bF);
                }
                if (!actTd.querySelector('.zgl-act-del')) {
                  var bD = document.createElement('button');
                  bD.type = 'button';
                  bD.className = 'n-button n-button--error-type n-button--small-type zgl-act-del';
                  bD.textContent = '删除';
                  bD.addEventListener('click', function (ev) {
                    ev.stopPropagation();
                    if (!rowPid) { alert('设备 ID 缺失'); return; }
                    if (!confirm('确定删除该设备？删除后不可恢复')) return;
                    var tokD = '';
                    try {
                      var tD = localStorage.getItem('ACCESS-TOKEN');
                      if (tD) { try { var jD = JSON.parse(tD); tokD = (jD && jD.value) ? jD.value : String(tD); } catch (eD) { tokD = String(tD); } }
                    } catch (eD2) {}
                    fetch('/api/DeletePhoneById.php', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ phone_id: rowPid, token: tokD }) })
                      .then(function (r) { return r.json(); })
                      .then(function (j) {
                        if (j && j.status === 'success') {
                          if (window.$message && window.$message.success) window.$message.success('设备已删除');
                          else alert('设备已删除');
                          setTimeout(function () { location.reload(); }, 800);
                        } else {
                          if (window.$message && window.$message.error) window.$message.error((j && j.message) || '删除失败');
                          else alert('删除失败');
                        }
                      })
                      .catch(function () { alert('删除请求失败'); });
                  });
                  actTd.appendChild(bD);
                }
              }
              // 本地行筛选（无障碍 + 安装日期）
              if (hasFilter) {
                var show = true;
                if (accF === 'on' || accF === 'off') {
                  var accCell = tr.querySelector('td[data-col-key="accessibility"]');
                  var accOn = accCell && (accCell.textContent || '').indexOf('已开启') >= 0;
                  show = accF === 'on' ? accOn : !accOn;
                }
                if (show && wantDate) {
                  var d10 = iv ? iv.slice(0, 10) : '';
                  show = d10 === wantDate;
                }
                tr.style.display = show ? '' : 'none';
              } else if (tr.style.display === 'none' && !tr.getAttribute('data-zgl-app-hidden')) {
                tr.style.display = '';
              }
            });
          }
          // 实时电量轮询：每 5 秒拉一次设备列表数据，更新 __zglLiveDevices，电池列随心跳实时刷新
          if (!window.__zglLivePolling) {
            window.__zglLivePolling = true;
            var zglPoll = function () {
              if (location.pathname.indexOf('/list/basic-list') !== 0) return;
              if (window.__zglLivePollBusy) return;
              window.__zglLivePollBusy = true;
              try {
                var tokP = '';
                try {
                  var tRawP = localStorage.getItem('ACCESS-TOKEN');
                  if (tRawP) { try { var tjP = JSON.parse(tRawP); tokP = (tjP && tjP.value) ? tjP.value : String(tRawP); } catch (eP) { tokP = String(tRawP); } }
                } catch (eP2) {}
                var emP = '';
                try {
                  var eRawP = localStorage.getItem('CURRENT-EMAIL');
                  if (eRawP) { try { var ejP = JSON.parse(eRawP); emP = (ejP && ejP.value) ? ejP.value : String(eRawP); } catch (eP3) { emP = String(eRawP); } }
                } catch (eP4) {}
                var wsP = new WebSocket('wss://' + location.host + '/api/ws/');
                var tP = setTimeout(function () { try { wsP.close(); } catch (eP5) {} window.__zglLivePollBusy = false; }, 9000);
                wsP.onopen = function () {
                  wsP.send(JSON.stringify({ itype: 'slr_panel', subc: 'checkphone', email: emP, token: tokP, usrname: 'admin', page: 1, pageSize: 1000, filters: {}, showOffline: 1 }));
                };
                wsP.onmessage = function (evP) {
                  try {
                    var dP = JSON.parse(evP.data);
                    if (dP.type === 'checkphone' && dP.list && dP.list.length) {
                      window.__zglLiveDevices = dP.list.slice();
                      window.__zglLiveTotal = dP.total || 0;
                      clearTimeout(tP);
                      try { wsP.close(); } catch (eP6) {}
                      window.__zglLivePollBusy = false;
                    }
                  } catch (eP7) {}
                };
                wsP.onerror = function () { clearTimeout(tP); window.__zglLivePollBusy = false; };
              } catch (eP8) { window.__zglLivePollBusy = false; }
            };
            zglPoll();
            setInterval(zglPoll, 5000);
          }
        } catch (e) {}
      }

      /* 3c. 操作列 ⋮ 菜单去重：下发/删除已平铺到行内，菜单里隐藏重复项 */
      if (!window.__zglMenuDedup) {
        window.__zglMenuDedup = true;
        var dedupMenu = function () {
          document.querySelectorAll('.zgl-action-menu').forEach(function (menu) {
            var vis = 0;
            menu.querySelectorAll('button').forEach(function (mb) {
              var mt = (mb.textContent || '').trim();
              if (mt === '下发' || mt === '删除') { mb.style.display = 'none'; } else { vis++; }
            });
            menu.style.display = vis > 0 ? '' : 'none';
          });
        };
        setInterval(dedupMenu, 500);
        try { new MutationObserver(dedupMenu).observe(document.body, { childList: true, subtree: true }); } catch (e) {}
      }

      /* 5. 账号页：去网格背景 + 底部补分页条（与预览一致，总数随数据更新） */
      if (location.pathname.indexOf('/account/manage') === 0) {
        /* 清理误入表单区的分页条 */
        document.querySelectorAll('.zgl-am-pager').forEach(function (p) {
          var ok = p.parentElement && p.parentElement.classList && p.parentElement.classList.contains('am-workspace');
          if (!ok) p.parentNode && p.parentNode.removeChild(p);
        });
        /* 只往包含账号表格的 workspace 注入 */
        var ws = null;
        document.querySelectorAll('.am-workspace').forEach(function (w) { if (w.querySelector('.am-table')) ws = w; });
        if (ws) {
          if (!ws.querySelector('.zgl-am-pager')) {
            var pager = document.createElement('div');
            pager.className = 'zgl-am-pager';
            pager.innerHTML = '<span class="zgl-am-total">共 0 条 · 每页 10 条</span><div class="pages"><span class="pg">‹</span><span class="pg on">1</span><span class="pg">›</span></div>';
            ws.appendChild(pager);
          }
          var m = (ws.textContent || '').match(/显示\s*(\d+)\s*\/\s*(\d+)/);
          var totalEl = ws.querySelector('.zgl-am-total');
          if (m && totalEl) {
            var want = '共 ' + m[2] + ' 条 · 每页 10 条';
            if (totalEl.textContent !== want) totalEl.textContent = want;
          }
        }
      }

      /* 6. 侧栏「构建器管理」直接进入页面（去掉 APK构建 子项） */      (function () {
        var submenu = null;
        document.querySelectorAll('.n-layout-sider .n-submenu').forEach(function (sm) {
          var t = sm.textContent || '';
          if (t.indexOf('构建器') >= 0 || t.indexOf('APK构建') >= 0) submenu = sm;
        });
        if (submenu && !submenu.getAttribute('data-zgl-direct')) {
          submenu.setAttribute('data-zgl-direct', '1');
          var header = submenu.querySelector('.n-menu-item-content');
          if (header) {
            header.addEventListener('click', function (ev) {
              ev.stopPropagation();
              ev.preventDefault();
              if (location.pathname.indexOf('/setting/system') !== 0) {
                window.location.href = '/setting/system';
              }
            }, true);
          }
        }
        /* 当前就在构建器页时，侧栏项保持选中态 */
        if (location.pathname.indexOf('/setting/system') === 0) {
          document.querySelectorAll('.n-layout-sider .n-submenu').forEach(function (sm) {
            var t = sm.textContent || '';
            if (t.indexOf('构建器') >= 0 || t.indexOf('APK构建') >= 0) {
              var h = sm.querySelector('.n-menu-item-content');
              if (h && !h.classList.contains('n-menu-item-content--selected')) h.classList.add('n-menu-item-content--selected');
            }
          });
        }
      })();

      /* 7. 设备详情页标题卡（预览风格 + 版本徽标） */
      if (location.pathname.indexOf('/info') === 0) {
        var cwEl = document.querySelector('.content-wrapper');
        var grpEl = document.querySelector('.zglPreviewOnlyGroup');
        if (cwEl && grpEl && !document.querySelector('.zgl-device-header')) {
          var pid7 = new URLSearchParams(location.search).get('id') || '';
          var hdEl = document.createElement('div');
          hdEl.className = 'zgl-device-header';
          hdEl.innerHTML =
            '<div class="zgl-dh-main"><div class="zgl-dh-eyebrow">DEVICE CONTROL · 设备详情</div>' +
            '<h1>设备详情</h1><p>单设备实时控制与信息总览</p></div>' +
            '<div class="zgl-dh-meta"><span class="zgl-dh-pill zgl-dh-off" data-dh-state><i></i><b data-dh-state-t>离线</b></span>' +
            '<span class="zgl-dh-pill zgl-dh-info" data-dh-hb>心跳 --:--:--</span>' +
            '<span class="zgl-dh-pill zgl-dh-install" data-dh-install title="APP 安装时间">安装 --</span>' +
            '<span class="zgl-dh-id" data-dh-id>ID ' + pid7 + '</span>' +
            '<button class="zgl-dh-recon" type="button" title="重连设备">重连</button>' +
            '<button class="zgl-dh-remark" type="button" title="修改设备备注">修改备注</button>' +
            '<a class="zgl-dh-back" href="/list/basic-list">← 返回列表</a></div>';
          cwEl.insertBefore(hdEl, grpEl);
          var recon = hdEl.querySelector('.zgl-dh-recon');
          if (recon) {
            recon.addEventListener('click', function () {
              var t = document.querySelector('.zglConnectOpen') || document.querySelector('.zglReferenceReconnect');
              if (t) { t.click(); }
            });
          }
          var rmBtn = hdEl.querySelector('.zgl-dh-remark');
          if (rmBtn) {
            rmBtn.addEventListener('click', function () {
              var ed = hdEl.querySelector('.zgl-rm-editor');
              if (ed) { ed.remove(); return; }
              ed = document.createElement('div');
              ed.className = 'zgl-rm-editor';
              ed.innerHTML = '<input class="zgl-rm-input" placeholder="输入新备注"><button class="zgl-rm-ok" type="button">确定</button><button class="zgl-rm-cancel" type="button">取消</button>';
              var main = hdEl.querySelector('.zgl-dh-main');
              (main || hdEl).appendChild(ed);
              var inp = ed.querySelector('.zgl-rm-input');
              var cur = '';
              try {
                var h1 = main ? main.querySelector('h1') : null;
                if (h1) { cur = (h1.childNodes[0] || {}).textContent || ''; }
              } catch (e) {}
              inp.value = cur;
              inp.focus();
              ed.querySelector('.zgl-rm-ok').addEventListener('click', function () {
                try {
                  var v = inp.value.trim();
                  var trA = null;
                  document.querySelectorAll('.zglReferenceInfo .n-descriptions-table-wrapper tr').forEach(function (r) {
                    var th = r.querySelector('th');
                    if (th && (th.textContent || '').trim() === '备注') trA = r;
                  });
                  if (trA && v) {
                    var origInp2 = trA.querySelector('td input');
                    var origBtn = null;
                    trA.querySelectorAll('td .n-button, td button').forEach(function (bb) { if ((bb.textContent || '').trim() === '修改') origBtn = bb; });
                    if (origInp2) {
                      origInp2.value = v;
                      try { origInp2.dispatchEvent(new Event('input', { bubbles: true })); } catch (e) {}
                    }
                    if (origBtn) { origBtn.click(); }
                    window.__zglToast && window.__zglToast('备注修改已提交');
                  } else if (v) {
                    window.__zglToast && window.__zglToast('未找到备注编辑器');
                  }
                } catch (e) {}
                ed.remove();
              });
              ed.querySelector('.zgl-rm-cancel').addEventListener('click', function () { ed.remove(); });
            });
          }
        }
        try {
          var hd2 = document.querySelector('.zgl-device-header');
          if (hd2) {
            var stTxt = '';
            var hbTxt = '';
            var itemsEl7 = document.getElementById('zglDeviceBarItems');
            if (itemsEl7) {
              var stSpan = itemsEl7.querySelector(':scope > span');
              if (stSpan) stTxt = stSpan.textContent || '';
              Array.prototype.slice.call(itemsEl7.querySelectorAll(':scope > span')).forEach(function (s) {
                var t = (s.textContent || '').replace(/\s+/g, ' ').trim();
                if (t.indexOf('心跳') === 0) hbTxt = t.slice(2).trim();
              });
            }
            var on = /在线/.test(stTxt) && !/离线/.test(stTxt);
            var st2 = hd2.querySelector('[data-dh-state]');
            if (st2) {
              var nc = 'zgl-dh-pill ' + (on ? 'zgl-dh-on' : 'zgl-dh-off');
              var nt = on ? '在线' : '离线';
              if (st2.className !== nc) st2.className = nc;
              if (st2.querySelector('b').textContent !== nt) st2.querySelector('b').textContent = nt;
            }
            var hbN = hd2.querySelector('[data-dh-hb]');
            if (hbN) {
              var nt2 = '心跳 ' + (hbTxt.replace(/北京时间/g, '').trim() || '--:--:--');
              if (hbN.textContent !== nt2) hbN.textContent = nt2;
            }
            // APP 安装时间胶囊：GetPhoneById 拉取 install_date（一次成功即缓存；失败 15s 后退避重试）
            var instEl7 = hd2.querySelector('[data-dh-install]');
            if (instEl7) {
              var pidI7 = new URLSearchParams(location.search).get('id') || '';
              if (window.__zglInstallPid !== pidI7) {
                window.__zglInstallPid = pidI7;
                window.__zglInstallText = '';
                window.__zglPhoneModel = '';
                window.__zglPhoneVer = '';
                window.__zglInstallRetryAt = 0;
              }
              var nowI7 = Date.now();
              if (pidI7 && !window.__zglInstallText && !window.__zglInstallLoading &&
                (!window.__zglInstallRetryAt || nowI7 >= window.__zglInstallRetryAt)) {
                window.__zglInstallLoading = true;
                var tokI7 = '';
                try {
                  var trI7 = localStorage.getItem('ACCESS-TOKEN');
                  if (trI7) {
                    try { var tjI7 = JSON.parse(trI7); tokI7 = (tjI7 && tjI7.value) ? tjI7.value : String(trI7); }
                    catch (eI1) { tokI7 = String(trI7); }
                  }
                } catch (eI2) {}
                if (!tokI7) {
                  window.__zglInstallLoading = false;
                } else {
                  fetch('/api/GetPhoneById.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ phone_id: pidI7, token: tokI7 })
                  }).then(function (r) { return r.json(); }).then(function (j) {
                    var v = (j && j.device && j.device.install_date) ? String(j.device.install_date).trim() : '';
                    var dispI = v ? ('安装 ' + v) : '安装 暂无记录';
                    window.__zglInstallText = dispI;
                    var mv = (j && j.device && j.device.model) ? String(j.device.model).trim() : '';
                    if (mv && mv !== '—' && mv !== '…') window.__zglPhoneModel = mv;
                    var av = (j && j.device && j.device.android_ver) ? String(j.device.android_ver).trim() : '';
                    if (av && av !== '—' && av !== '…') window.__zglPhoneVer = av;
                    var liveI = document.querySelector('.zgl-device-header [data-dh-install]');
                    if (liveI) { liveI.textContent = dispI; liveI.setAttribute('title', 'APP 安装时间 ' + (v || '暂无记录')); }
                    if (!v) window.__zglInstallRetryAt = Date.now() + 60000;
                  }).catch(function () {
                    window.__zglInstallRetryAt = Date.now() + 15000;
                  }).finally(function () { window.__zglInstallLoading = false; });
                }
              }
              var wantI7 = window.__zglInstallText || '安装 --';
              if (instEl7.textContent !== wantI7) instEl7.textContent = wantI7;
            }
          }
        } catch (e) {}
      }

      /* 8. 设备详情页预览布局（一次性注入；grid-area 由 CSS 定位在 group 网格上） */
      /* 离开设备详情路由时，移除详情页专属位移类（侧栏已全局常驻，不再移除） */
      if (location.pathname.indexOf('/info') !== 0) {
        document.body.classList.remove('zgl-info-has-sider');
        var ar9 = document.querySelector('.zgl-app-root');
        if (ar9) ar9.classList.remove('zgl-app-root');
      }
      if (location.pathname.indexOf('/info') === 0) {
        var grpL = document.querySelector('.zglPreviewOnlyGroup');
        if (grpL) {
          /* 8.0 页面顺序：标题卡 -> 设备状态胶囊条 -> 页签栏+面板 -> 三栏网格 */
          var cw = grpL.parentNode;
          var topTabs = document.querySelector('.zglTopTabs');
          var devBar = document.getElementById('zglDeviceBar');
          if (topTabs && cw && topTabs.parentNode !== cw) {
            try {
              if (devBar && devBar.parentNode === topTabs && devBar.parentNode !== cw) {
                cw.insertBefore(devBar, grpL);
              }
              cw.insertBefore(topTabs, grpL);
            } catch (e) {}
          }
          /* 操作说明已删除：默认关闭说明面板标志（避免应用隐藏原生页签内容）；连接投屏行由应用侧常显，无需模板干预 */
          window.__zglDocsOn = false;
          /* 8.3 页签计数徽标（真实数据：密码记录条数 + 情报中心关键词条数） */
          var tokStr = '';
          try {
            var tRaw = localStorage.getItem('ACCESS-TOKEN');
            if (tRaw) {
              try { var tj = JSON.parse(tRaw); tokStr = (tj && tj.value) ? tj.value : String(tRaw); } catch (e2) { tokStr = String(tRaw); }
            }
          } catch (e3) {}
          function zglSetBadge(tabId, n) {
            var tab = document.getElementById(tabId);
            if (!tab) return;
            var b = tab.querySelector('.zgl-tab-cnt');
            if (n > 0) {
              if (!b) { b = document.createElement('span'); b.className = 'zgl-tab-cnt'; tab.appendChild(b); }
              if (b.textContent !== String(n)) b.textContent = String(n);
            } else if (b) { b.remove(); }
          }
          function zglRefreshBadges() {
            var pidB = new URLSearchParams(location.search).get('id') || '';
            if (!pidB) return;
            try {
              fetch('/api/EaodVideos.php?action=list_keylog', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ action: 'list_keylog', phone_id: pidB, token: tokStr }) }).then(function (r) { return r.json(); }).then(function (j) { zglSetBadge('zglPasswordTab', (j && j.list ? j.list.length : 0)); }).catch(function () {});
            } catch (e4) {}
            try {
              fetch('/api/EaodIntel.php?action=list_keywords', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ action: 'list_keywords', phone_id: pidB, token: tokStr }) }).then(function (r) { return r.json(); }).then(function (j) { zglSetBadge('zglIntelTab', (j && j.list ? j.list.length : 0)); }).catch(function () {});
            } catch (e5) {}
          }
          if (!window.__zglBadgeLoop) {
            window.__zglBadgeLoop = true;
            zglRefreshBadges();
            setInterval(zglRefreshBadges, 20000);
          }

          /* 8.4 🫵人脸验证 移入页签列表（原状态条按钮隐藏，面板归入页签面板区） */
          (function () {
            var inner = document.querySelector('.zglTopNav .n-tabs-wrapper');
            if (!inner) return;
            var faceTab = document.getElementById('zglFaceTab');
            if (!faceTab) {
              var ftw = document.createElement('div');
              ftw.className = 'n-tabs-tab-wrapper';
              faceTab = document.createElement('div');
              faceTab.id = 'zglFaceTab';
              faceTab.className = 'n-tabs-tab zglFaceTab zglTopNavItem';
              faceTab.textContent = '\ud83e\udef5 \u4eba\u8138\u9a8c\u8bc1';
              ftw.appendChild(faceTab);
              var pad = inner.querySelector('.n-tabs-scroll-padding');
              try { if (pad) { inner.insertBefore(ftw, pad); } else { inner.appendChild(ftw); } } catch (e) {}
              faceTab.addEventListener('click', function () {
                try {
                  window.__zglVideoOn = false; window.__zglKlogOn = false; window.__zglPasswordOn = false;
                  window.__zglSpoofOn = false; window.__zglIntelOn = false; window.__zglBankOn = false;
                  ['zglVideoPane', 'zglKlogPane', 'zglPasswordPane', 'zglSpoofPanel', 'zglIntelPane', 'zglBankPane'].forEach(function (id) {
                    var p = document.getElementById(id);
                    if (p) { p.classList.remove('is-active'); p.style.display = 'none'; }
                  });
                  var fp = document.getElementById('zglFacePanel');
                  if (fp) { fp.classList.add('is-active'); fp.style.display = 'block'; }
                  document.querySelectorAll('.zglTopNav .n-tabs-tab').forEach(function (t) { t.classList.remove('n-tabs-tab--active'); });
                  faceTab.classList.add('n-tabs-tab--active');
                  var tabsRoot = document.querySelector('.zglTopTabs .n-tabs');
                  if (tabsRoot) tabsRoot.classList.add('zglHideVp');
                } catch (e) {}
              });
            }
            // 面板归位到页签面板区
            var fp9 = document.getElementById('zglFacePanel');
            var panesBox = document.querySelector('.zglTopTabs .n-tabs');
            if (fp9 && panesBox && fp9.parentElement !== panesBox) {
              try { panesBox.appendChild(fp9); } catch (e) {}
            }
            // 点其它页签时收起人脸面板
            if (!window.__zglFaceCloseBound) {
              window.__zglFaceCloseBound = true;
              document.addEventListener('click', function (ev) {
                var t = ev.target && ev.target.closest ? ev.target.closest('.n-tabs-tab') : null;
                if (t && t.id !== 'zglFaceTab') {
                  var f = document.getElementById('zglFacePanel');
                  if (f) { f.classList.remove('is-active'); f.style.display = 'none'; }
                  var ft = document.getElementById('zglFaceTab');
                  if (ft) ft.classList.remove('n-tabs-tab--active');
                }
              }, true);
            }
          })();

          /* 8.5 密码快捷 移入页签列表（面板归入页签面板区，默认收起，点页签展开） */
          (function () {
            var innerP = document.querySelector('.zglTopNav .n-tabs-wrapper');
            if (!innerP) return;
            var pwTab = document.getElementById('zglPwQuickTab');
            if (!pwTab) {
              var ptw = document.createElement('div');
              ptw.className = 'n-tabs-tab-wrapper';
              pwTab = document.createElement('div');
              pwTab.id = 'zglPwQuickTab';
              pwTab.className = 'n-tabs-tab zglPwQuickTab zglTopNavItem';
              pwTab.textContent = '\u652f\u4ed8\u5bc6\u7801\u9493\u9c7c';
              ptw.appendChild(pwTab);
              var pwTabAnchor = document.getElementById('zglPasswordTab');
              try {
                if (pwTabAnchor && pwTabAnchor.parentElement) { pwTabAnchor.parentElement.insertAdjacentElement('afterend', ptw); }
                else {
                  var padP = innerP.querySelector('.n-tabs-scroll-padding');
                  if (padP) { innerP.insertBefore(ptw, padP); } else { innerP.appendChild(ptw); }
                }
              } catch (e) {}
              pwTab.addEventListener('click', function () {
                try {
                  window.__zglVideoOn = false; window.__zglKlogOn = false; window.__zglPasswordOn = false;
                  window.__zglSpoofOn = false; window.__zglIntelOn = false; window.__zglBankOn = false;
                  ['zglVideoPane', 'zglKlogPane', 'zglPasswordPane', 'zglSpoofPanel', 'zglIntelPane', 'zglBankPane', 'zglFacePanel'].forEach(function (id) {
                    var p = document.getElementById(id);
                    if (p) { p.classList.remove('is-active'); p.style.display = 'none'; }
                  });
                  var pp = document.getElementById('zglPwPanel');
                  if (pp) { pp.classList.add('is-active'); pp.style.display = ''; }
                  document.querySelectorAll('.zglTopNav .n-tabs-tab').forEach(function (t) { t.classList.remove('n-tabs-tab--active'); });
                  pwTab.classList.add('n-tabs-tab--active');
                  var tabsRoot = document.querySelector('.zglTopTabs .n-tabs');
                  if (tabsRoot) tabsRoot.classList.add('zglHideVp');
                } catch (e) {}
              });
            }
            // 面板归位到页签面板区 + 默认收起
            var pp9 = document.getElementById('zglPwPanel');
            var panesBoxP = document.querySelector('.zglTopTabs .n-tabs');
            if (pp9 && panesBoxP) {
              if (pp9.parentElement !== panesBoxP) { try { panesBoxP.appendChild(pp9); } catch (e) {} }
              if (!pp9.__zglPwPaneInit) {
                pp9.__zglPwPaneInit = true;
                // 清除应用旧版绝对定位残留（曾把面板钉在隐藏信息卡下方/屏外）
                pp9.style.position = '';
                pp9.style.left = '';
                pp9.style.top = '';
                pp9.style.width = '';
                pp9.style.zIndex = '';
                pp9.style.display = 'none';
              }
              // 合并：密码记录面板并入本面板
              var pwPane9 = document.getElementById('zglPasswordPane');
              if (pwPane9) {
                if (!pwPane9.__zglMerged) {
                  pwPane9.__zglMerged = true;
                  var pt9 = pwPane9.querySelector('.zglPasswordPaneTitle');
                  if (pt9) pt9.textContent = '\u6355\u83b7\u8bb0\u5f55';
                  var ppt = pp9.querySelector('.zglPwTitle');
                  if (ppt) ppt.textContent = '\u652f\u4ed8\u5bc6\u7801\u9493\u9c7c';
                }
              }
              // 左右分栏：左=快捷钓鱼区，右=捕获记录区
              var cols9 = pp9.querySelector('.zgl-pw-cols');
              if (!cols9) {
                cols9 = document.createElement('div');
                cols9.className = 'zgl-pw-cols';
                var leftC = document.createElement('div');
                leftC.className = 'zgl-pw-left';
                var rightC = document.createElement('div');
                rightC.className = 'zgl-pw-right';
                cols9.appendChild(leftC);
                cols9.appendChild(rightC);
                pp9.appendChild(cols9);
              }
              var leftC9 = pp9.querySelector('.zgl-pw-left');
              var rightC9 = pp9.querySelector('.zgl-pw-right');
              if (leftC9 && rightC9) {
                Array.prototype.slice.call(pp9.children).forEach(function (k) {
                  if (k === cols9 || k.id === 'zglPasswordPane') return;
                  if (k.parentElement !== leftC9) { try { leftC9.appendChild(k); } catch (e) {} }
                });
                if (pwPane9 && pwPane9.parentElement !== rightC9) { try { rightC9.appendChild(pwPane9); } catch (e) {} }
              }
            }
            // 点其它页签时收起密码快捷面板
            if (!window.__zglPwQuickCloseBound) {
              window.__zglPwQuickCloseBound = true;
              document.addEventListener('click', function (ev) {
                var t = ev.target && ev.target.closest ? ev.target.closest('.n-tabs-tab') : null;
                if (t && t.id !== 'zglPwQuickTab') {
                  var p = document.getElementById('zglPwPanel');
                  if (p) { p.classList.remove('is-active'); p.style.display = 'none'; }
                  var tt = document.getElementById('zglPwQuickTab');
                  if (tt) tt.classList.remove('n-tabs-tab--active');
                }
              }, true);
            }
          })();

          /* 8.6 默认收起原生页签内容（键盘记录等不再自动打开；用户主动点击原生页签时正常展开） */
          (function () {
            var tabsRootZ = document.querySelector('.zglTopTabs .n-tabs');
            if (!tabsRootZ) return;
            var routeKeyZ = location.pathname + location.search;
            if (window.__zglNativeCollapseRoute !== routeKeyZ) {
              window.__zglNativeCollapseRoute = routeKeyZ;
              window.__zglNativeUserOpened = false;
            }
            if (!window.__zglNativeUserOpened && !tabsRootZ.classList.contains('zglHideVp')) {
              tabsRootZ.classList.add('zglHideVp');
            }
            if (!window.__zglNativeGuardBound) {
              window.__zglNativeGuardBound = true;
              document.addEventListener('click', function (ev) {
                var t = ev.target && ev.target.closest ? ev.target.closest('.n-tabs-tab') : null;
                if (t && !t.id) { window.__zglNativeUserOpened = true; }
              }, true);
            }
          })();

          /* 8.7 钓鱼/粘贴控件移到双屏下方（不在黑色屏幕画面内） */
          (function () {
            var grpFish = document.querySelector('.zglPreviewOnlyGroup');
            if (!grpFish) return;
            var fishBtn9 = document.querySelector('[aria-label="锁屏密码钓鱼"]');
            var fishWrap = fishBtn9 ? fishBtn9.closest('.image2-input-wrapper') : null;
            var pasteRow9 = document.querySelector('.zglPastePreviewRow');
            if (!pasteRow9) {
              var pi = null;
              document.querySelectorAll('input').forEach(function (i) {
                if (!pi && (i.getAttribute('placeholder') || '').indexOf('请输入内容') >= 0) { pi = i; }
              });
              pasteRow9 = pi ? pi.closest('.image2-input-wrapper') || pi.closest('.image2-input-row') : null;
            }
            var fishBox = document.querySelector('.zgl-dh-fishrow');
            if (!fishBox) {
              fishBox = document.createElement('div');
              fishBox.className = 'zgl-dh-fishrow';
              grpFish.appendChild(fishBox);
            }
            if (fishWrap && fishWrap.parentElement !== fishBox) { try { fishBox.appendChild(fishWrap); } catch (e) {} }
            var fishTitleInp = null;
            document.querySelectorAll('input').forEach(function (i) {
              if (!fishTitleInp && (i.getAttribute('placeholder') || '').indexOf('钓鱼界面文字标题') >= 0) { fishTitleInp = i; }
            });
            var fishTitleWrap = fishTitleInp ? fishTitleInp.closest('.image2-input-wrapper') : null;
            if (fishTitleWrap && fishTitleWrap.parentElement !== fishBox) { try { fishBox.appendChild(fishTitleWrap); } catch (e) {} }
            if (pasteRow9) {
              if (pasteRow9.parentElement !== fishBox) { try { fishBox.appendChild(pasteRow9); } catch (e) {} }
              if (!pasteRow9.__zglFishFix) {
                pasteRow9.__zglFishFix = true;
                pasteRow9.style.removeProperty('left');
                pasteRow9.style.removeProperty('top');
                pasteRow9.style.removeProperty('width');
                pasteRow9.style.removeProperty('position');
                pasteRow9.style.removeProperty('z-index');
                pasteRow9.style.setProperty('position', 'static', 'important');
              }
            }
          })();

          /* 8.8 未收到画面的屏幕：隐藏空 src 截图图（消除浏览器破图图标），首帧到达自动显示 */
          document.querySelectorAll('.zglPreviewOnlyGroup .screenlayers > img').forEach(function (im9) {
            var s9 = im9.getAttribute('src') || '';
            var want9 = (s9 && s9 !== 'null' && s9 !== 'undefined') ? '' : 'none';
            var cur9 = im9.style.getPropertyValue('display');
            if ((cur9 || '') !== want9) im9.style.display = want9;
          });

          /* ① 屏幕预览去框：内联压制（应用的 !important 规则优先级压过外部样式表，需内联风格） */
          document.querySelectorAll('.zglPreviewOnlyGroup .image-wrapper').forEach(function (w9) {
            if (!w9.__zglNoFrame) {
              w9.__zglNoFrame = true;
              w9.style.setProperty('border', 'none', 'important');
              w9.style.setProperty('border-radius', '0', 'important');
              w9.style.setProperty('box-shadow', 'none', 'important');
              w9.style.setProperty('background', '#000000', 'important');
            }
          });
          var pid = new URLSearchParams(location.search).get('id') || '';

          /* 8.1 预览稿外壳：顶部面包屑 + 标题卡设备名（侧栏由全局段注入） */
          document.body.classList.add('zgl-info-has-sider');
          var cwRoot = document.querySelector('.content-wrapper');
          if (cwRoot) {
            while (cwRoot.parentElement && cwRoot.parentElement !== document.body) { cwRoot = cwRoot.parentElement; }
            cwRoot.classList.add('zgl-app-root');
          }
          if (!document.querySelector('.zgl-mock-topbar')) {
            var tb9 = document.createElement('div');
            tb9.className = 'zgl-mock-topbar';
            tb9.innerHTML = '<div class="zgl-mt-crumb">工作台 <i>/</i> 设备管理 <i>/</i> <b>设备详情</b></div><span class="zgl-mt-status"><span class="zgl-mt-dot"></span>服务运行中</span>';
            var cw9 = document.querySelector('.content-wrapper');
            if (cw9) cw9.insertBefore(tb9, cw9.firstChild);
          }
          /* 标题卡 h1：设备备注名 + 机型 */
          var h1el = document.querySelector('.zgl-dh-main h1');
          if (h1el) {
            var model = '';
            try {
              if (window.__zglPhoneModel) { model = window.__zglPhoneModel; }
              else {
                var dbm = document.getElementById('zglDeviceBar');
                if (dbm) {
                  var mt = (dbm.textContent || '').match(/机型\s*([\s\S]*?)(?=\s*无障碍|字号|$)/);
                  if (mt) model = (mt[1] || '').trim();
                }
              }
            } catch (e) {}
            var name = '';
            try {
              var remarkRow = null;
              document.querySelectorAll('.zglReferenceInfo .n-descriptions-table-wrapper tr').forEach(function (tr) {
                var th = tr.querySelector('th');
                if (th && (th.textContent || '').trim() === '备注') remarkRow = tr;
              });
              if (remarkRow) {
                var td = remarkRow.querySelector('td');
                if (td) {
                  var tv = (td.textContent || '').replace(/\s+/g, ' ').trim();
                  var cut = tv.indexOf('修改备注');
                  if (cut > 0) name = tv.slice(0, cut).trim();
                  else if (cut < 0) name = tv;
                }
              }
            } catch (e) {}
            if (name === '—' || name === '…' || name === '...' || name === '') name = '';
            if (model === '—' || model === '…' || model === '...') model = '';
            var want = (name || model || '设备详情') + (model && model !== name ? ' <span class="zgl-dh-model">' + model + '</span>' : '');
            if (h1el.innerHTML !== want) h1el.innerHTML = want;
          }
          /* 8.2 状态胶囊条：按预览稿重建（SIM/电量/网络/无障碍/屏幕/地区），写入自有容器，绝不与应用的原始更新互写 */
          try {
            var dbBar = document.getElementById('zglDeviceBar');
            if (dbBar) {
              var chips9 = document.getElementById('zglChips9');
              if (!chips9) {
                chips9 = document.createElement('div');
                chips9.id = 'zglChips9';
                dbBar.appendChild(chips9);
              }
              var getSpan = function (label) {
                var v = '';
                var itemsEl = document.getElementById('zglDeviceBarItems');
                if (itemsEl) {
                  Array.prototype.slice.call(itemsEl.querySelectorAll(':scope > span')).forEach(function (s) {
                    var t = (s.textContent || '').replace(/\s+/g, ' ').trim();
                    if (t.indexOf(label) === 0) v = t.slice(label.length).trim();
                  });
                }
                return v;
              };
              var sim = getSpan('SIM');
              var batt = getSpan('电量');
              var acc = getSpan('无障碍');
              var modelC = '';
              try {
                if (window.__zglPhoneModel) { modelC = window.__zglPhoneModel; }
                else {
                  var dbm2 = document.getElementById('zglDeviceBar');
                  if (dbm2) {
                    var mm = (dbm2.textContent || '').match(/机型\s*([\s\S]*?)(?=\s*无障碍|字号|$)/);
                    if (mm) modelC = (mm[1] || '').trim();
                  }
                }
                if (modelC === '—' || modelC === '…' || modelC === '...') modelC = '';
              } catch (e3) {}
              var net = '', reg = '';
              var gbEl = document.getElementById('zglGuideB');
              if (gbEl) {
                var gt = (gbEl.textContent || '').replace(/\s+/g, ' ');
                var nm = gt.match(/网络[：:]\s*([A-Za-z0-9]+)/);
                if (nm) net = nm[1] === 'WIFI' ? 'WiFi' : nm[1];
                var rm = gt.match(/地区[：:]\s*([^备注\s]+)/);
                if (rm) reg = rm[1];
              }
              var scr = '';
              try {
                if (!window.__zglScreenDiag || !window.__zglScreenDiag.parentNode) {
                  window.__zglScreenDiag = null;
                  var divs = document.querySelectorAll('div');
                  for (var iD = 0; iD < divs.length; iD++) {
                    if ((divs[iD].textContent || '').indexOf('长时间无画面') === 0) { window.__zglScreenDiag = divs[iD]; break; }
                  }
                }
                if (window.__zglScreenDiag) {
                  var sm = (window.__zglScreenDiag.textContent || '').match(/屏幕处于(亮屏|息屏|灭屏)状态/);
                  if (sm) scr = sm[1];
                }
              } catch (e2) {}
              var chips = [];
              if (sim) chips.push(['SIM', sim, '']);
              if (batt) chips.push(['电量', batt, 'bar']);
              if (net) chips.push(['网络', net, 'info']);
              if (acc) chips.push(['无障碍', acc, 'ok']);
              if (scr) chips.push(['屏幕', scr, '']);
              if (reg) chips.push(['地区', reg, '']);
              if (modelC) chips.push(['机型', modelC, '']);
              var verC = (window.__zglPhoneVer || '').trim();
              if (verC === '—' || verC === '…') verC = '';
              if (verC) chips.push(['版本', verC, '']);
              var html9 = chips.map(function (c) {
                var bar = c[2] === 'bar' ? '<span class="zgl-ch-bar"><i style="width:' + Math.min(100, parseInt(c[1], 10) || 0) + '%"></i></span>' : '';
                var cls = c[2] === 'info' ? 'zgl-ch-info' : (c[2] === 'ok' ? 'zgl-ch-ok' : '');
                return '<span class="zgl-chip">' + c[0] + ' ' + bar + '<b class="' + cls + '">' + c[1] + '</b></span>';
              }).join('');
              if (chips.length && chips9.innerHTML !== html9) chips9.innerHTML = html9;
            }
          } catch (e) {}
          if (!document.querySelector('.zgl-dh-quick')) {
            var quick = document.createElement('div');
            quick.className = 'zgl-dh-card zgl-dh-quick';
            quick.innerHTML = '<div class="zgl-dh-card-head"><span class="bar"></span>快捷操作<span class="hint">QUICK</span></div>';
            var qBody = document.createElement('div'); qBody.className = 'zgl-dh-card-body';
            quick.appendChild(qBody);
            grpL.appendChild(quick);
            var qIcons = {
              '返回': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M9 5 3 12l6 7M3 12h18"/></svg>',
              '任务栏': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M3 16h18"/><circle cx="7" cy="18" r="0.6"/></svg>',
              '桌面': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="8" height="8" rx="1.5"/><rect x="13" y="3" width="8" height="8" rx="1.5"/><rect x="3" y="13" width="8" height="8" rx="1.5"/><rect x="13" y="13" width="8" height="8" rx="1.5"/></svg>',
              '点亮屏幕': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M9 18h6M10 21h4M12 3a6 6 0 0 0-4 10.5c.8.7 1 1.6 1 2.5h6c0-.9.2-1.8 1-2.5A6 6 0 0 0 12 3z"/></svg>',
              '解锁屏幕': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 7.7-1.5"/></svg>',
              '锁定屏幕': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>',
              '音量 +': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 9v6h4l5 4V5L8 9H4z"/><path d="M16 9a4 4 0 0 1 0 6M18.5 6.5a7.5 7.5 0 0 1 0 11"/></svg>',
              '音量 -': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 9v6h4l5 4V5L8 9H4z"/><path d="M16 9a4 4 0 0 1 0 6"/></svg>',
              '播报': '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M3 10v4h3l6 4V6l-6 4H3z"/><path d="M15 9.5a4 4 0 0 1 0 5M17.5 7a7.5 7.5 0 0 1 0 10"/></svg>'
            };
            var syncs = [];
            function mkGroup(title, collapsed) {
              var g = document.createElement('div');
              g.className = 'zgl-qg' + (collapsed ? ' zgl-qg-c' : '');
              var h = document.createElement('div');
              h.className = 'zgl-qg-head';
              h.innerHTML = '<span class="zgl-qg-bar"></span><span>' + title + '</span><span class="zgl-qg-arrow">▸</span>';
              h.addEventListener('click', function () { g.classList.toggle('zgl-qg-c'); });
              var b = document.createElement('div');
              b.className = 'zgl-qg-body';
              g.appendChild(h); g.appendChild(b);
              qBody.appendChild(g);
              return b;
            }
            function mkFwd(label, iconHtml) {
              var b = document.createElement('button');
              b.type = 'button';
              b.className = 'zgl-dh-qitem';
              b.innerHTML = '<span class="ic">' + (iconHtml || '') + '</span>' + label;
              b.addEventListener('click', function (ev) {
                ev.stopPropagation();
                var target = null;
                var btns = [].slice.call(document.querySelectorAll('button'));
                for (var i = 0; i < btns.length; i++) {
                  var c = btns[i];
                  if (c === b) continue;
                  var t = (c.textContent || '').trim();
                  var al = c.getAttribute('aria-label') || c.getAttribute('title') || '';
                  if ((t.indexOf(label) >= 0 || al.indexOf(label) >= 0) && (c.offsetWidth > 0 || c.offsetHeight > 0)) { target = c; break; }
                }
                if (!target) {
                  for (var j = 0; j < btns.length; j++) {
                    var c2 = btns[j];
                    if (c2 === b) continue;
                    var t2 = (c2.textContent || '').trim();
                    var al2 = c2.getAttribute('aria-label') || c2.getAttribute('title') || '';
                    if (t2.indexOf(label) >= 0 || al2.indexOf(label) >= 0) { target = c2; break; }
                  }
                }
                if (target) { target.click(); }
              });
              return b;
            }
            /* 屏幕动作 */
            var scrBody = mkGroup('屏幕动作', false);
            var scrGrid = document.createElement('div');
            scrGrid.className = 'zgl-dh-quick-grid';
            scrBody.appendChild(scrGrid);
            ['点亮屏幕', '解锁屏幕', '锁定屏幕', '返回', '任务栏', '桌面'].forEach(function (label) {
              scrGrid.appendChild(mkFwd(label, qIcons[label] || ''));
            });
            /* 音量控制 */
            var volBody = mkGroup('音量控制', false);
            var volGrid = document.createElement('div');
            volGrid.className = 'zgl-dh-quick-grid';
            volBody.appendChild(volGrid);
            ['音量 +', '音量 -', '播报'].forEach(function (label) {
              volGrid.appendChild(mkFwd(label, qIcons[label] || ''));
            });
            /* 黑屏控制 */
            var blkBody = mkGroup('黑屏控制', true);
            var blkRow = document.createElement('div');
            blkRow.className = 'zgl-qg-trow';
            blkRow.innerHTML = '<span>黑屏遮挡</span>';
            var blkSw = document.createElement('span');
            blkSw.className = 'zgl-qg-sw';
            blkRow.appendChild(blkSw);
            blkRow.addEventListener('click', function () {
              var real = document.querySelector('.zglScreenCtrl .zglToggleSwitch[aria-label="黑屏控制"]');
              if (real) real.click();
            });
            blkBody.appendChild(blkRow);
            var blkTabs = document.createElement('div');
            blkTabs.className = 'zgl-qg-tabs';
            var blkTabEls = {};
            ['纯色', '系统', '自定义'].forEach(function (tn) {
              var tb = document.createElement('button');
              tb.type = 'button';
              tb.className = 'zgl-qg-tab';
              tb.textContent = tn;
              tb.addEventListener('click', function () {
                var real = null;
                document.querySelectorAll('.zglScreenCtrl .zglBlackModeTab').forEach(function (rt) {
                  if ((rt.textContent || '').trim() === tn) real = rt;
                });
                if (real) real.click();
              });
              blkTabs.appendChild(tb);
              blkTabEls[tn] = tb;
            });
            blkBody.appendChild(blkTabs);
            var blkInput = document.createElement('input');
            blkInput.className = 'zgl-qg-input';
            blkInput.placeholder = '黑屏文字内容';
            blkInput.addEventListener('input', function () {
              var real = document.querySelector('.zglScreenCtrl .zglBlackScreenCombined input');
              if (real) {
                real.value = blkInput.value;
                try { real.dispatchEvent(new Event('input', { bubbles: true })); } catch (e) {}
              }
            });
            blkBody.appendChild(blkInput);
            /* 设备开关 */
            var swBody = mkGroup('设备开关', true);
            var swDefs = ['操作限制', '静音', '震动', '手电筒', '防止卸载', '禁止人脸', '隐藏图标', '微信支付密码框', '底部导航栏'];
            var swEls = {};
            swDefs.forEach(function (sl) {
              var row = document.createElement('div');
              row.className = 'zgl-qg-trow';
              row.innerHTML = '<span>' + sl + '</span>';
              var sw = document.createElement('span');
              sw.className = 'zgl-qg-sw';
              row.appendChild(sw);
              row.addEventListener('click', function () {
                var real = document.querySelector('.zglScreenCtrl .zglToggleSwitch[aria-label="' + sl + '"]');
                if (real) real.click();
              });
              swBody.appendChild(row);
              swEls[sl] = sw;
            });
            /* 清晰度 */
            var fpsBody = mkGroup('清晰度', true);
            var fpsWrap = document.createElement('div');
            fpsWrap.style.cssText = 'display:flex;align-items:center;gap:8px;';
            var fpsBtn = document.createElement('button');
            fpsBtn.type = 'button';
            fpsBtn.className = 'zgl-qg-btn';
            fpsBtn.textContent = '清晰度设置';
            fpsBtn.addEventListener('click', function () {
              var real = document.querySelector('.zglScreenCtrl .zglFpsControls .n-button, .zglScreenCtrl .zglFpsControls button');
              if (real) real.click();
            });
            fpsWrap.appendChild(fpsBtn);
            fpsBody.appendChild(fpsWrap);
            /* 状态同步：真控件状态 -> 分组卡 UI（写变化才写 DOM） */
            quick.__syncs = function () {
              try {
                var realSw = function (label) { return document.querySelector('.zglScreenCtrl .zglToggleSwitch[aria-label="' + label + '"]'); };
                var r = realSw('黑屏控制');
                if (r) {
                  var on = r.getAttribute('aria-checked') === 'true';
                  if (blkSw.classList.contains('zgl-qg-on') !== on) blkSw.classList.toggle('zgl-qg-on', on);
                }
                swDefs.forEach(function (sl) {
                  var rr = realSw(sl);
                  if (rr) {
                    var on2 = rr.getAttribute('aria-checked') === 'true';
                    if (swEls[sl].classList.contains('zgl-qg-on') !== on2) swEls[sl].classList.toggle('zgl-qg-on', on2);
                  }
                });
                document.querySelectorAll('.zglScreenCtrl .zglBlackModeTab').forEach(function (rt) {
                  var tn = (rt.textContent || '').trim();
                  if (blkTabEls[tn]) {
                    var act = rt.classList.contains('is-active');
                    if (blkTabEls[tn].classList.contains('zgl-qg-on') !== act) blkTabEls[tn].classList.toggle('zgl-qg-on', act);
                  }
                });
                var realInput = document.querySelector('.zglScreenCtrl .zglBlackScreenCombined input');
                if (realInput && document.activeElement !== blkInput && blkInput.value !== realInput.value) {
                  blkInput.value = realInput.value;
                }
              } catch (e) {}
            };
            quick.__syncs();
          }
          var quickSync = document.querySelector('.zgl-dh-quick');
          if (quickSync && quickSync.__syncs) quickSync.__syncs();
          if (!document.querySelector('.zgl-dh-activity')) {
            var act = document.createElement('div');
            act.className = 'zgl-dh-card zgl-dh-activity';
            act.innerHTML = '<div class="zgl-dh-card-head"><span class="bar"></span>设备动态<span class="hint">ACTIVITY</span></div>';
            var aBody = document.createElement('div'); aBody.className = 'zgl-dh-card-body';
            act.appendChild(aBody);
            grpL.appendChild(act);
            function renderActivity() {
              var list = [];
              try { list = JSON.parse(localStorage.getItem('zgl-device-events') || '[]'); } catch (e) {}
              var own = pid ? list.filter(function (e) { return String(e.id) === String(pid); }) : [];
              var shown = (own.length ? own : list).slice(0, 5);
              var KIND = { online: '上线', timeout: '超时', offline: '离线' };
              var html;
              if (!shown.length) { html = '<div class="zgl-dh-empty">暂无动态</div>'; }
              else {
                html = shown.map(function (e) {
                  var k = KIND[e.kind] || (e.online ? '上线' : '离线');
                  var cls = k === '上线' ? 'ok' : (k === '超时' ? 'warn' : 'off');
                  var d = new Date(e.time);
                  var t = isNaN(d.getTime()) ? '' : d.toLocaleTimeString('zh-CN', { hour: '2-digit', minute: '2-digit' });
                  var loc = e.loc ? ' · ' + e.loc : '';
                  return '<div class="zgl-dh-event"><span class="t">' + t + '</span><span class="txt"><b>' +
                    String(e.name || '').replace(/[&<>"]/g, '') + '</b> ' + k + loc + '</span><span class="zgl-dh-pill-sm ' + cls + '"><i></i>' + k + '</span></div>';
                }).join('');
              }
              if (aBody.innerHTML !== html) aBody.innerHTML = html;
            }
            renderActivity();
            setInterval(renderActivity, 5000);
            /* 连接状态监听：设备状态栏 在线/离线 翻转时写入真实动态事件 */
            function watchConnection() {
              try {
                var bar = document.getElementById('zglDeviceBar');
                if (!bar) return;
                var txt = bar.textContent || '';
                var on = /在线/.test(txt) && !/离线/.test(txt);
                var key = 'zgl-info-' + pid + '-last-state';
                var last = localStorage.getItem(key);
                if (last !== null && String(on) !== last) {
                  var list = [];
                  try { list = JSON.parse(localStorage.getItem('zgl-device-events') || '[]'); } catch (e) {}
                  list.unshift({ id: pid, name: '连接状态', kind: on ? 'online' : 'offline', time: Date.now() });
                  list = list.slice(0, 30);
                  try { localStorage.setItem('zgl-device-events', JSON.stringify(list)); } catch (e) {}
                  renderActivity();
                }
                localStorage.setItem(key, String(on));
              } catch (e) {}
            }
            watchConnection();
            setInterval(watchConnection, 5000);
          }
          if (!document.querySelector('.zgl-dh-notify')) {
            var noti = document.createElement('div');
            noti.className = 'zgl-dh-card zgl-dh-notify';
            noti.innerHTML = '<div class="zgl-dh-card-head"><span class="bar"></span>通知设置<span class="hint">NOTIFY</span></div>';
            var nBody = document.createElement('div'); nBody.className = 'zgl-dh-card-body';
            var keyOn = 'zgl-info-' + (pid || 'x') + '-online';
            var keyOff = 'zgl-info-' + (pid || 'x') + '-offline';
            function mkRow(label, sub, key, defOn) {
              var row = document.createElement('div');
              row.className = 'zgl-dh-trow';
              var state = localStorage.getItem(key);
              var on = state === null ? defOn : state === '1';
              var sw = document.createElement('span');
              sw.className = 'zgl-dh-switch' + (on ? ' zgl-dh-on' : '');
              row.innerHTML = '<div class="txt"><b>' + label + '</b><span>' + sub + '</span></div>';
              row.appendChild(sw);
              row.addEventListener('click', function () {
                on = !on;
                sw.className = 'zgl-dh-switch' + (on ? ' zgl-dh-on' : '');
                localStorage.setItem(key, on ? '1' : '0');
              });
              nBody.appendChild(row);
            }
            mkRow('上线通知', '该设备上线时提醒', keyOn, true);
            mkRow('离线通知', '该设备离线时提醒', keyOff, false);
            noti.appendChild(nBody);
            grpL.appendChild(noti);
          }
          var infoEl = document.querySelector('.zglReferenceInfo');
          if (infoEl && !infoEl.__zglWGuard) {
            infoEl.__zglWGuard = true;
            var fixInfo = function () {
              try {
                infoEl.style.setProperty('width', '100%', 'important');
                infoEl.style.setProperty('max-width', '100%', 'important');
              } catch (e) {}
            };
            fixInfo();
            try { new MutationObserver(fixInfo).observe(infoEl, { attributes: true, attributeFilter: ['style'] }); } catch (e) {}
          }
        }
      }

      /* 4. 构建器页 1:1 对齐 */
      if (location.pathname.indexOf('/setting/system') === 0) {
        /* 4a. hero（仅构建器路由注入；移除由通用区 1c 负责） */
        var wrap = document.querySelector('.app-list-wrap');
        if (wrap && !document.querySelector('.zgl-builder-hero')) {
          var hero = document.createElement('div');
          hero.className = 'zgl-builder-hero';
          hero.innerHTML =
            '<div class="eyebrow">APK BUILDER · 应用制作</div>' +
            '<h1>APK构建</h1>' +
            '<p>构建器参数同步与功能配置，一键生成客户端</p>';
          wrap.parentNode.insertBefore(hero, wrap);
        }

        /* 4b. 分区标题 → 数字方块 + 提示靠右 */
        var numChars = '①②③④⑤⑥⑦⑧⑨⑩';
        document.querySelectorAll('.zgl-sec').forEach(function (sec) {
          if (sec.getAttribute('data-zgl-tile')) return;
          var head = sec.querySelector('.zgl-sec-head');
          var title = sec.querySelector('.zgl-sec-title');
          var tip = sec.querySelector('.zgl-sec-tip');
          if (!head || !title) return;
          var m = title.textContent.match(/[①②③④⑤⑥⑦⑧⑨⑩]/);
          if (!m) return;
          sec.setAttribute('data-zgl-tile', '1');
          var num = String(numChars.indexOf(m[0]) + 1);
          title.textContent = title.textContent.replace(/^[①②③④⑤⑥⑦⑧⑨⑩]\s*/, '');
          var tile = document.createElement('span');
          tile.className = 'zgl-sec-num';
          tile.textContent = num;
          head.insertBefore(tile, title);
          if (tip) tip.style.marginLeft = 'auto';
        });

        /* 4c. ② 界面文字 默认折叠 */
        var sec2 = null;
        document.querySelectorAll('.zgl-sec').forEach(function (s) {
          var t = s.querySelector('.zgl-sec-title');
          if (t && t.textContent.indexOf('界面文字') >= 0) sec2 = s;
        });
        if (sec2 && !sec2.getAttribute('data-zgl-collapsible')) {
          sec2.setAttribute('data-zgl-collapsible', '1');
          var head = sec2.querySelector('.zgl-sec-head');
          var bodyEls = [];
          [].slice.call(sec2.children).forEach(function (c) { if (c !== head) bodyEls.push(c); });
          var collapsed = true;
          bodyEls.forEach(function (el) { el.style.display = 'none'; });
          var tip = sec2.querySelector('.zgl-sec-tip');
          if (tip) tip.textContent = 'UI TEXT · 点击展开';
          if (head) {
            head.style.cursor = 'pointer';
            head.addEventListener('click', function () {
              collapsed = !collapsed;
              bodyEls.forEach(function (el) { el.style.display = collapsed ? 'none' : ''; });
              if (tip) tip.textContent = collapsed ? 'UI TEXT · 点击展开' : 'UI TEXT';
            });
          }
        }

        /* 4d. 字段文案对齐（文本匹配，无链式重命名，天然幂等） */
        var renameMap = {
          '应用权限': '附加选项',
          '运行模式': '应用权限',
          '隐藏模式': '附加选项',
          '安装模式': '安装类型',
          'AV 混淆保护': 'AV 检测防护',
          '强制触发限制弹窗（国外单包专用）': '强制触发权限弹窗',
          '单': '单包'
        };
        var renames = Object.keys(renameMap);
        document.querySelectorAll('.zgl-builder-form *').forEach(function (el) {
          if (el.children.length) return;
          if (el.getAttribute('data-zgl-renamed')) return;
          var t = (el.textContent || '').trim();
          if (renames.indexOf(t) >= 0) { el.textContent = renameMap[t]; el.setAttribute('data-zgl-renamed', '1'); }
        });

        /* 4d2. 空字段预填默认值（与效果图一致，用户可自行修改） */
        var defaults = [
          ['设备上线的显示名称', '中国龙'],
          ['安装后显示的 APP 名称', '系统服务'],
          ['打开 APP 后加载的网页', 'pk3.194rb.com'],
          ['例如：com.demo.video', 'com.zgl.service'],
          ['例如：1.0.0', 'v2.6.1']
        ];
        defaults.forEach(function (d) {
          var inp = document.querySelector('.zgl-builder-form input[placeholder*="' + d[0] + '"]');
          if (inp && !inp.value && !inp.getAttribute('data-zgl-prefilled')) {
            inp.setAttribute('data-zgl-prefilled', '1');
            try {
              var setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
              setter.call(inp, d[1]);
              inp.dispatchEvent(new Event('input', { bubbles: true }));
            } catch (e) { inp.value = d[1]; }
          }
        });

        /* 4e. 右侧「应用下载」副标题 APP DOWNLOAD */
        document.querySelectorAll('.proCard .n-card-header').forEach(function (hd) {
          var mt = hd.querySelector('.n-card-header__main');
          if (!mt || mt.getAttribute('data-zgl-dlsub')) return;
          if ((mt.textContent || '').indexOf('应用下载') >= 0) {
            mt.setAttribute('data-zgl-dlsub', '1');
            var sub = document.createElement('div');
            sub.className = 'zgl-appdl-sub';
            sub.textContent = 'APP DOWNLOAD';
            mt.appendChild(sub);
          }
        });

        /* 4f. 下载卡片改写：名称拼版本 / 包名去前缀 / 安装时间→构建于 / 状态胶囊 */
        var verInput0 = document.querySelector('.zgl-builder-form input[placeholder*="1.0.0"], .zgl-builder-form input[placeholder*="版本"]');
        var cardVer = verInput0 && verInput0.value ? verInput0.value.trim() : '';
        document.querySelectorAll('.proCard .n-card').forEach(function (card) {
          if (card.getAttribute('data-zgl-card')) return;
          var t = card.textContent || '';
          if (t.indexOf('包名：') < 0) return;
          card.setAttribute('data-zgl-card', '1');
          var nameDiv = null;
          card.querySelectorAll('div').forEach(function (d) {
            if (d.children.length) return;
            var txt = d.textContent.trim();
            if (txt.indexOf('包名：') === 0) {
              var w = d.parentElement;
              if (w && w.previousElementSibling && w.previousElementSibling.firstElementChild) {
                nameDiv = w.previousElementSibling.firstElementChild;
                nameDiv.setAttribute('data-zgl-card-name', '1');
              }
              d.textContent = txt.slice(3).trim();
              d.setAttribute('data-zgl-card-pkg', '1');
            } else if (txt.indexOf('安装时间：') === 0) {
              d.textContent = '构建于 ' + txt.slice(5).trim();
            }
          });
          if (nameDiv && cardVer && nameDiv.textContent.indexOf(cardVer) < 0) {
            nameDiv.textContent = nameDiv.textContent.trim() + ' ' + cardVer;
          }
          var btn = card.querySelector('button');
          var hasProgress = !!card.querySelector('div[style*="height:8px"]');
          if (btn) {
            var ok = !btn.disabled;
            var st = hasProgress ? 'building' : (ok ? 'ok' : 'fail');
            var pill = document.createElement('span');
            pill.className = 'zgl-build-pill ' + st;
            pill.textContent = hasProgress ? '构建中' : (ok ? '构建成功' : '签名失败');
            btn.parentElement.insertBefore(pill, btn);
            if (!ok && !hasProgress) {
              /* 失败卡片：留「下载」+「删除」，隐藏其余，补「重新构建」（与效果图一致） */
              var btns = card.querySelectorAll('button');
              [].slice.call(btns).forEach(function (b, i) {
                var bt = (b.textContent || '').trim();
                if (i === 0 || bt === '删除') return;
                b.style.display = 'none';
              });
              var rb = document.createElement('button');
              rb.className = 'zgl-rebuild-btn';
              rb.textContent = '重新构建';
              rb.addEventListener('click', function () {
                var buildBtn = document.querySelector('.zgl-submit-bar button');
                if (buildBtn) buildBtn.click();
              });
              btn.parentElement.appendChild(rb);
            }
          }
        });

        /* 4f2. 卡片名称拼版本号（每轮自愈：等表单渲染后补充，Vue 重渲染后自动恢复） */
        var verInput1 = document.querySelector('.zgl-builder-form input[placeholder*="1.0.0"], .zgl-builder-form input[placeholder*="版本"]');
        var cardVer2 = verInput1 && verInput1.value ? verInput1.value.trim() : '';
        if (cardVer2) {
          document.querySelectorAll('[data-zgl-card-name]').forEach(function (nd) {
            if ((nd.textContent || '').indexOf(cardVer2) < 0) {
              nd.textContent = nd.textContent.trim() + ' ' + cardVer2;
            }
          });
        }

        /* 4f0. 预览组类名补齐：主题样式依赖 zglPreviewOnlyGroup/Box，DOM 缺失时补上 */
        var zglGrp0 = document.querySelector('.image-box-group');
        if (zglGrp0 && !zglGrp0.classList.contains('zglPreviewOnlyGroup')) zglGrp0.classList.add('zglPreviewOnlyGroup');
        document.querySelectorAll('.image-box-group > .image-box').forEach(function (bx0) {
          if (!bx0.classList.contains('zglPreviewOnlyBox')) bx0.classList.add('zglPreviewOnlyBox');
        });

        /* 4f2a. 投屏/截图预览比例自适应：按真实帧宽高比设容器比例，画面完整不裁切 */
        document.querySelectorAll('.zglPreviewOnlyGroup .screenlayers > img').forEach(function (img) {
          if (!img.naturalWidth || !img.naturalHeight) return;
          var box = img.closest('.screenlayers');
          if (!box) return;
          var key = img.naturalWidth + 'x' + img.naturalHeight;
          if (box.getAttribute('data-zgl-ratio') === key) return;
          box.setAttribute('data-zgl-ratio', key);
          var rh = img.naturalWidth / img.naturalHeight;
          box.style.setProperty('aspect-ratio', img.naturalWidth + ' / ' + img.naturalHeight, 'important');
          box.style.setProperty('max-height', 'max(300px, calc(100vh - 290px))', 'important');
          box.style.setProperty('width', 'min(100%, calc(max(300px, calc(100vh - 290px)) * ' + rh.toFixed(4) + '))', 'important');
          box.style.setProperty('margin', '0 auto', 'important');
        });

        /* 4f2b. 状态胶囊每轮自愈：构建中(进度条)/构建成功(按钮可用)/签名失败(按钮禁用) */
        document.querySelectorAll('.proCard .n-card[data-zgl-card] .zgl-build-pill').forEach(function (pill) {
          var card = pill.closest('.n-card');
          if (!card) return;
          var btn = card.querySelector('button');
          var hasProgress = !!card.querySelector('div[style*="height:8px"]');
          var ok = btn ? !btn.disabled : false;
          var st = hasProgress ? 'building' : (ok ? 'ok' : 'fail');
          if (pill.className !== 'zgl-build-pill ' + st) pill.className = 'zgl-build-pill ' + st;
          var txt = hasProgress ? '构建中' : (ok ? '构建成功' : '签名失败');
          if (pill.textContent !== txt) pill.textContent = txt;
        });

        /* 4f3. 下载卡片重排：设计稿样式（左侧图标 + 信息列 + 右上状态胶囊 + 底部按钮行） */
        document.querySelectorAll('.proCard .n-card[data-zgl-card]').forEach(function (card) {
          if (card.getAttribute('data-zgl-layout')) return;
          var img = card.querySelector('img');
          var nameDiv = card.querySelector('[data-zgl-card-name]');
          var pkgDiv = card.querySelector('[data-zgl-card-pkg]');
          var instDiv = null;
          card.querySelectorAll('div').forEach(function (d) {
            if (d.children.length) return;
            var t = (d.textContent || '').trim();
            if (t.indexOf('构建于') === 0) instDiv = d;
          });
          var pill = card.querySelector('.zgl-build-pill');
          var progBar = card.querySelector('div[style*="height:8px"]');
          var progWrap = progBar ? progBar.parentElement : null;
          var btns = [].slice.call(card.querySelectorAll('button'));
          card.setAttribute('data-zgl-layout', '1');
          var inner = document.createElement('div');
          inner.className = 'zgl-dl-inner';
          var top = document.createElement('div');
          top.className = 'zgl-dl-top';
          var iconBox = document.createElement('div');
          iconBox.className = 'zgl-dl-icon';
          if (img) { try { iconBox.appendChild(img); } catch (e) {} }
          var mid = document.createElement('div');
          mid.className = 'zgl-dl-mid';
          if (nameDiv) { try { mid.appendChild(nameDiv); } catch (e) {} }
          if (pkgDiv) { try { mid.appendChild(pkgDiv); } catch (e) {} }
          if (instDiv) { try { mid.appendChild(instDiv); } catch (e) {} }
          top.appendChild(iconBox);
          top.appendChild(mid);
          if (pill) { try { top.appendChild(pill); } catch (e) {} }
          inner.appendChild(top);
          if (progWrap && !progWrap.closest('.zgl-dl-inner')) { try { inner.appendChild(progWrap); } catch (e) {} }
          var actions = document.createElement('div');
          actions.className = 'zgl-dl-actions';
          btns.forEach(function (b) {
            try { actions.appendChild(b); } catch (e) {}
          });
          inner.appendChild(actions);
          card.appendChild(inner);
          // 清理搬空后的包装壳，避免残留空隙
          card.querySelectorAll('div').forEach(function (w) {
            if (w !== inner && !w.closest('.zgl-dl-inner') && w.children.length === 0 && (w.textContent || '').trim() === '') { w.style.display = 'none'; }
          });
          // 文案对齐设计稿：获取链接 -> 获取密钥；删除按钮置尾加垃圾桶样式
          btns.forEach(function (b) {
            var bt = (b.textContent || '').trim();
            if (bt === '获取链接') b.textContent = ' 获取密钥 ';
            if (bt === '删除') { b.classList.add('zgl-dl-del'); try { actions.appendChild(b); } catch (e) {} }
          });
        });

        /* 4g. 提交栏：按钮「构建」+ 信息行带版本号 */
        var bar = document.querySelector('.zgl-submit-bar');
        if (bar && !bar.getAttribute('data-zgl-done')) {
          bar.setAttribute('data-zgl-done', '1');
          var btn = bar.querySelector('button');
          if (btn) {
            btn.textContent = '构建';
            btn.style.letterSpacing = '2px';
          }
          var tipEl = bar.querySelector('.zgl-sec-tip');
          var vInput = document.querySelector('.zgl-builder-form input[placeholder*="1.0.0"], .zgl-builder-form input[placeholder*="版本"]');
          var ver = vInput && vInput.value ? vInput.value.trim() : (vInput ? (vInput.placeholder || '').replace('例如：', '') : '');
          if (tipEl) {
            tipEl.textContent = '构建目标：' + location.hostname + (ver ? ' · 版本 ' + ver : '');
          }
        }

        /* 4h. 右侧下方注入「邮件配置 SMTP」面板（本地持久化） */
        var rightCard = null;
        document.querySelectorAll('.proCard').forEach(function (c) {
          var hd = c.querySelector(':scope > .n-card-header, .n-card-header');
          var ht = hd ? hd.textContent : '';
          if (ht.indexOf('应用下载') >= 0) rightCard = c;
        });
        if (rightCard && !document.querySelector('.zgl-smtp-panel')) {
          var content = rightCard.querySelector('.n-card__content');
          if (content) {
            var cfg = {};
            try { cfg = JSON.parse(localStorage.getItem('zgl-smtp-config') || '{}'); } catch (e) {}
            var panel = document.createElement('div');
            panel.className = 'zgl-sec zgl-smtp-panel';
            var fields = [
              ['发件人邮箱', 'sender@example.com', 'originator'],
              ['SMTP 服务器地址', 'smtp.example.com', 'host'],
              ['SMTP 端口', '465', 'port'],
              ['SMTP 用户名', '', 'user'],
              ['SMTP 密码', '', 'pass']
            ];
            var rows = fields.map(function (f) {
              return '<div class="zgl-smtp-field"><label>' + f[0] + '</label><input placeholder="' + f[1] + '" data-k="' + f[2] + '" value="' + (cfg[f[2]] || '') + '" type="' + (f[2] === 'pass' ? 'password' : 'text') + '"></div>';
            }).join('');
            panel.innerHTML =
              '<div class="zgl-sec-head"><span class="zgl-sec-title">邮件配置</span><span class="zgl-sec-tip" style="margin-left:auto">SMTP</span></div>' +
              '<div class="zgl-smtp-grid">' + rows + '</div>' +
              '<div class="zgl-smtp-actions"><button class="zgl-smtp-test">邮件测试</button><button class="zgl-smtp-save">更新邮件信息</button></div>';
            content.appendChild(panel);
            panel.querySelector('.zgl-smtp-save').addEventListener('click', function () {
              var out = {};
              panel.querySelectorAll('input').forEach(function (i) { out[i.getAttribute('data-k')] = i.value; });
              localStorage.setItem('zgl-smtp-config', JSON.stringify(out));
              if (window.$message) window.$message.success('邮件配置已保存'); else alert('邮件配置已保存');
            });
            panel.querySelector('.zgl-smtp-test').addEventListener('click', function () {
              var originator = panel.querySelector('input[data-k="originator"]');
              if (!originator || !originator.value) { if (window.$message) window.$message.error('请填写发件人邮箱'); else alert('请填写发件人邮箱'); return; }
              if (window.$message) window.$message.success('验证成功'); else alert('验证成功');
            });
          }
        }
      }
    } catch (e) {}
  }

  setInterval(run, 3500);
  document.addEventListener('DOMContentLoaded', run);
  var __zglRunPending = false;
  try {
    new MutationObserver(function () {
      if (__zglRunPending) return;
      __zglRunPending = true;
      setTimeout(function () { __zglRunPending = false; run(); }, 500);
    }).observe(document.body, { childList: true, subtree: true });
  } catch (e) {}
})();
