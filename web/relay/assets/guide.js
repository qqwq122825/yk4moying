(function() {
  'use strict';

  var GUIDE_KEY = 'zgl_guide_done_v1';
  var BUTTON_ID = 'zgl-guide-btn';
  var checkInterval = null;
  var guideBtn = null;

  function isDeviceListPage() {
    return !!document.querySelector('.table-toolbar');
  }

  function isBuildPage() {
    return !!document.querySelector('.app-list-wrap');
  }

  function getColumnSettingEl() {
    var icons = document.querySelectorAll('.table-toolbar-right-icon');
    for (var i = 0; i < icons.length; i++) {
      if (icons[i].querySelector('.cursor-pointer.table-toolbar-right-icon') ||
          icons[i].closest('.cursor-pointer.table-toolbar-right-icon')) {
        return icons[i];
      }
    }
    return icons.length > 0 ? icons[icons.length - 1] : null;
  }

  function getToolbarRight() {
    return document.querySelector('.table-toolbar-right');
  }

  function getStripedIcon() {
    var icons = document.querySelectorAll('.table-toolbar-right-icon');
    return icons.length > 0 ? icons[0] : null;
  }

  function getRefreshIcon() {
    var icons = document.querySelectorAll('.table-toolbar-right-icon');
    return icons.length > 1 ? icons[1] : null;
  }

  function getTableEl() {
    return document.querySelector('.s-table') || document.querySelector('.n-data-table');
  }

  function getToolbarLeft() {
    return document.querySelector('.table-toolbar-left');
  }

  function getDriver() {
    if (typeof window.driver === 'undefined' && typeof driver === 'undefined') return null;
    return (window.driver && window.driver.js) ? window.driver.js.driver : null;
  }

  function startBuildGuide() {
    var Driver = getDriver();
    if (!Driver) return;

    var steps = [];

    // Tab 切换区
    var tabHeader = document.querySelector('.app-list-tab-header');
    if (tabHeader) {
      steps.push({
        element: tabHeader,
        popover: {
          title: '功能切换',
          description: '在「应用下载」和「应用生成」之间切换。下载页查看已构建的应用，生成页创建新应用。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 应用下载 tab
    var tabs = document.querySelectorAll('.app-tab-item');
    if (tabs.length >= 1) {
      steps.push({
        element: tabs[0],
        popover: {
          title: '应用下载',
          description: '点击进入已构建应用列表。可以下载 APK、获取下载链接、生成二维码分享给用户安装。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 应用生成 tab
    if (tabs.length >= 2) {
      steps.push({
        element: tabs[1],
        popover: {
          title: '应用生成',
          description: '点击进入应用构建页面。填写应用信息后点击构建，系统会自动生成定制 APK。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 如果当前在应用生成页面，引导表单字段
    var generateTab = document.querySelector('.app-generate-tab');
    if (generateTab) {
      var formItems = generateTab.querySelectorAll('.n-form-item');
      if (formItems.length > 0) {
        steps.push({
          element: formItems[0],
          popover: {
            title: '上线名称',
            description: '给这次构建起个名字，方便在下载列表中识别，例如"客户A专用版"。',
            side: 'bottom',
            align: 'start'
          }
        });
      }
      if (formItems.length > 1) {
        steps.push({
          element: formItems[1],
          popover: {
            title: '应用信息',
            description: '设置应用名称（安装后手机上显示的名字）和应用图标。',
            side: 'bottom',
            align: 'start'
          }
        });
      }
      // 找到构建按钮
      var buildBtns = generateTab.querySelectorAll('.n-button');
      for (var i = 0; i < buildBtns.length; i++) {
        if (buildBtns[i].textContent.trim().indexOf('构建') !== -1 ||
            buildBtns[i].textContent.trim().indexOf('生成') !== -1) {
          steps.push({
            element: buildBtns[i],
            popover: {
              title: '开始构建',
              description: '填写完所有信息后点击此按钮开始构建 APK。构建需要几分钟，完成后可在「应用下载」页面下载。',
              side: 'top',
              align: 'center'
            }
          });
          break;
        }
      }
    }

    // 如果当前在应用下载页面，引导卡片操作
    var cards = document.querySelectorAll('.n-card');
    var appCard = null;
    for (var ci = 0; ci < cards.length; ci++) {
      if (cards[ci].querySelector('.n-button')) {
        appCard = cards[ci];
        break;
      }
    }
    if (appCard && !generateTab) {
      steps.push({
        element: appCard,
        popover: {
          title: '应用卡片',
          description: '每个卡片代表一个已构建的应用。可以下载 APK 文件、获取分享链接、生成二维码，或删除不需要的应用。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    if (steps.length === 0) return;

    var d = Driver({
      showProgress: true,
      animate: true,
      overlayColor: 'rgba(0,0,0,0.5)',
      stagePadding: 8,
      stageRadius: 8,
      popoverClass: 'zgl-guide-popover',
      nextBtnText: '下一步',
      prevBtnText: '上一步',
      doneBtnText: '完成',
      progressText: '{{current}} / {{total}}',
      steps: steps,
      onDestroyed: function() {
        try { localStorage.setItem(GUIDE_KEY + '_build', '1'); } catch(e) {}
      }
    });

    d.drive();
  }

  function startGuide() {
    var Driver = getDriver();
    if (!Driver) return;

    var steps = [];

    // 搜索表单区域
    var formEl = document.querySelector('.n-form');
    if (formEl) {
      steps.push({
        element: formEl,
        popover: {
          title: '搜索与筛选',
          description: '在这里输入条件可以快速查找设备。支持按账号、归属、备注、国家、型号等多维度筛选。',
          side: 'bottom',
          align: 'start'
        }
      });
    }

    // 账号搜索框（第一个输入框，godfather 才有）
    var formItems = document.querySelectorAll('.n-form-item');
    for (var fi = 0; fi < formItems.length; fi++) {
      var labelEl = formItems[fi].querySelector('.n-form-item-label__text');
      if (labelEl && labelEl.textContent.trim() === '账号') {
        steps.push({
          element: formItems[fi],
          popover: {
            title: '账号搜索（重要）',
            description: '注意：这里必须输入用户的邮箱地址来搜索，不是用户名！例如输入 user@example.com 来查找该账号下的所有设备。',
            side: 'bottom',
            align: 'start'
          }
        });
        break;
      }
    }

    // 查询和重置按钮
    var submitBtn = null;
    var btns = document.querySelectorAll('.n-button');
    for (var bi = 0; bi < btns.length; bi++) {
      var btnText = btns[bi].textContent.trim();
      if (btnText === '查询') { submitBtn = btns[bi]; break; }
    }
    if (submitBtn) {
      steps.push({
        element: submitBtn.closest('.n-form-item') || submitBtn,
        popover: {
          title: '查询与重置',
          description: '填写筛选条件后点击「查询」搜索设备，点击「重置」清空所有筛选条件恢复默认列表。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 分页信息
    var paginationEl = document.querySelector('.n-data-table__pagination') || document.querySelector('.n-pagination');
    if (paginationEl) {
      steps.push({
        element: paginationEl,
        popover: {
          title: '在线信息',
          description: '这里显示当前在线设备的总数和分页信息，可以切换每页显示数量和快速跳页。',
          side: 'top',
          align: 'center'
        }
      });
    }

    // 表格
    var tableEl = getTableEl();
    if (tableEl) {
      steps.push({
        element: tableEl,
        popover: {
          title: '设备数据表',
          description: '点击任意设备行可以进入设备详情页面，进行远程操作。',
          side: 'top',
          align: 'center'
        }
      });
    }

    // 斑马纹
    var stripedIcon = getStripedIcon();
    if (stripedIcon) {
      steps.push({
        element: stripedIcon,
        popover: {
          title: '斑马纹',
          description: '开启后表格行会交替显示颜色，方便阅读。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 刷新
    var refreshIcon = getRefreshIcon();
    if (refreshIcon) {
      steps.push({
        element: refreshIcon,
        popover: {
          title: '刷新',
          description: '点击可以手动刷新设备列表数据。',
          side: 'bottom',
          align: 'center'
        }
      });
    }

    // 列设置
    var columnBtn = getColumnSettingEl();
    if (columnBtn) {
      steps.push({
        element: columnBtn,
        popover: {
          title: '列设置',
          description: '这里可以设置筛选您想查看的信息！可以拖拽排序、固定列到左侧或右侧。',
          side: 'bottom',
          align: 'end'
        }
      });
    }

    if (steps.length === 0) return;

    var d = Driver({
      showProgress: true,
      animate: true,
      overlayColor: 'rgba(0,0,0,0.5)',
      stagePadding: 8,
      stageRadius: 8,
      popoverClass: 'zgl-guide-popover',
      nextBtnText: '下一步',
      prevBtnText: '上一步',
      doneBtnText: '完成',
      progressText: '{{current}} / {{total}}',
      steps: steps,
      onDestroyed: function() {
        try { localStorage.setItem(GUIDE_KEY + '_device', '1'); } catch(e) {}
      }
    });

    d.drive();
  }

  var _currentGuideCallback = null;

  function createGuideButton(callback) {
    _currentGuideCallback = callback;
    if (document.getElementById(BUTTON_ID)) {
      // 按钮已存在，只更新回调和文字
      var existing = document.getElementById(BUTTON_ID);
      existing.textContent = isBuildPage() ? '构建使用说明' : '设备查看使用说明';
      return;
    }
    guideBtn = document.createElement('div');
    guideBtn.id = BUTTON_ID;
    guideBtn.textContent = isBuildPage() ? '构建使用说明' : '设备查看使用说明';
    guideBtn.title = '点击查看新手引导';
    guideBtn.style.cssText = [
      'position:fixed', 'right:20px', 'bottom:80px', 'z-index:999',
      'padding:8px 16px', 'border-radius:0',
      'background:#fff', 'color:#333', 'font-size:13px', 'font-weight:500',
      'display:flex', 'align-items:center', 'justify-content:center',
      'cursor:pointer', 'box-shadow:none',
      'border:1px solid #d9d9d9',
      'transition:all 0.2s ease', 'user-select:none',
      'white-space:nowrap'
    ].join(';');
    guideBtn.addEventListener('mouseenter', function() {
      guideBtn.style.background = '#f5f5f5';
    });
    guideBtn.addEventListener('mouseleave', function() {
      guideBtn.style.background = '#fff';
    });
    guideBtn.addEventListener('click', function() {
      if (_currentGuideCallback) _currentGuideCallback();
    });
    document.body.appendChild(guideBtn);
  }

  function removeGuideButton() {
    var btn = document.getElementById(BUTTON_ID);
    if (btn) btn.remove();
    guideBtn = null;
  }

  function checkPage() {
    if (isDeviceListPage()) {
      createGuideButton(startGuide);
      if (!localStorage.getItem(GUIDE_KEY + '_device')) {
        setTimeout(function() {
          if (isDeviceListPage()) startGuide();
        }, 1500);
      }
    } else if (isBuildPage()) {
      createGuideButton(startBuildGuide);
      if (!localStorage.getItem(GUIDE_KEY + '_build')) {
        setTimeout(function() {
          if (isBuildPage()) startBuildGuide();
        }, 1500);
      }
    } else {
      removeGuideButton();
    }
  }

  function init() {
    checkInterval = setInterval(checkPage, 2000);
    setTimeout(checkPage, 1000);
  }

  if (document.readyState === 'complete' || document.readyState === 'interactive') {
    setTimeout(init, 500);
  } else {
    document.addEventListener('DOMContentLoaded', function() { setTimeout(init, 500); });
  }
})();
