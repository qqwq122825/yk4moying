import { d as defineComponent, r as ref, t as toDisplayString, h, aM as onMounted, s as storage } from "./core.vendor.js";

function compact(items) { return items.filter(function(item) { return item != null; }); }
function icon(name, size) {
    var px = size || 16;
    return h("i", { "data-lucide": name, style: "width:" + px + "px;height:" + px + "px;flex:0 0 auto;" });
}
function refreshIcons() {
    setTimeout(function() {
        try { if (window.lucide && window.lucide.createIcons) window.lucide.createIcons(); } catch (_) {}
    }, 0);
}

const PAGE_CSS = `@keyframes am-spin{to{transform:rotate(360deg)}}
@keyframes am-live-pulse{0%,100%{box-shadow:0 0 0 4px rgba(107, 131, 255,.15),0 0 14px rgba(107, 131, 255,.6)}50%{box-shadow:0 0 0 6px rgba(107, 131, 255,.05),0 0 20px rgba(107, 131, 255,.3)}}
#app .am-page, html body .am-page{min-height: 100vh !important;background: radial-gradient(ellipse 46% 36% at 12% 6%, rgba(79, 107, 254,.07), transparent 60%),radial-gradient(ellipse 40% 34% at 92% 88%, rgba(107, 131, 255,.05), transparent 60%),linear-gradient(rgba(79, 107, 254,.03) 1px, transparent 1px),linear-gradient(90deg, rgba(79, 107, 254,.03) 1px, transparent 1px),linear-gradient(180deg, #eef1f8, #e8edf5 60%, #eef1f8) !important;background-size:auto,auto,44px 44px,44px 44px,auto !important;background-attachment: fixed !important;color: #14213d !important;font-family: v-sans,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif !important;letter-spacing:0;-webkit-font-smoothing: antialiased !important}
html body .am-page .am-shell{width: 100% !important;margin: 0 !important;padding: 26px 24px 48px !important;box-sizing:border-box}
html body .am-page .am-hero{display: flex !important;align-items: flex-start !important;justify-content: space-between !important;gap: 24px !important;margin-bottom:20px}
html body .am-page .am-eyebrow{display: flex !important;align-items: center !important;gap: 8px !important;color: #4f6bfe !important;font-size: 12px !important;font-weight: 700 !important;letter-spacing: 3px !important;margin-bottom:8px;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
html body .am-page .am-live-dot{width: 8px !important;height: 8px !important;border-radius: 50% !important;background: #6b83ff !important;animation:am-live-pulse 1.8s ease infinite}
html body .am-page .am-title{font-size: 24px !important;line-height: 1.25 !important;font-weight: 800 !important;margin: 0 !important;color: #14213d !important;letter-spacing:.3px}
html body .am-page .am-subtitle{font-size: 13px !important;line-height: 1.6 !important;color: #5b6b8c !important;margin:8px 0 0}
html body .am-page .am-hero-actions{display: flex !important;align-items: center !important;gap: 10px !important;flex:0 0 auto}
html body .am-page .am-btn{height: 38px !important;border: 1px solid #e5eaf4 !important;border-radius: 10px !important;background: #ffffff !important;color: #5b6b8c !important;padding: 0 14px !important;font: 600 13px/1 inherit !important;display: inline-flex !important;align-items: center !important;justify-content: center !important;gap: 7px !important;cursor: pointer !important;transition: border-color .16s,background .16s,color .16s,box-shadow .16s,transform .16s !important;white-space:nowrap}
html body .am-page .am-btn:hover{background: #f7f9fd !important;border-color: #c9d4ea !important;color: #14213d !important;transform:translateY(-1px)}
html body .am-page .am-btn-primary{background: linear-gradient(90deg,#3b5bf0,#6b83ff) !important;border: none !important;color: #ffffff !important;font-weight: 800 !important;box-shadow:0 8px 24px rgba(79, 107, 254,.35)}
html body .am-page .am-btn-primary:hover{filter: brightness(1.1) !important;color:#ffffff}
html body .am-page .am-btn-danger{background: linear-gradient(135deg,#dc2626,#b91c1c) !important;border: none !important;color: #14213d !important;box-shadow:0 6px 18px rgba(220, 38, 38,.3)}
html body .am-page .am-btn-danger:hover{filter: brightness(1.08) !important;color:#14213d}
html body .am-page .am-btn-icon{width: 38px !important;padding:0}
html body .am-page .am-stats{display: grid !important;grid-template-columns: repeat(4,minmax(0,1fr)) !important;gap: 12px !important;margin-bottom:20px}
html body .am-page .am-stat{min-height: 108px !important;text-align: left !important;background: #ffffff !important;border: 1px solid #e5eaf4 !important;border-radius: 14px !important;padding: 18px !important;display: flex !important;flex-direction: column !important;justify-content: space-between !important;cursor: pointer !important;transition:border-color .16s,box-shadow .16s,transform .16s;box-shadow:0 2px 10px rgba(20,33,61,.05)}
html body .am-page .am-stat:hover{border-color: #c9d4ea !important;box-shadow: 0 10px 28px rgba(20,33,61,.12) !important;transform:translateY(-2px)}
html body .am-page .am-stat-head{display: flex !important;align-items: center !important;justify-content: space-between !important;gap: 10px !important;color: #5b6b8c !important;font-size: 12px !important;font-weight: 700 !important;letter-spacing:1px}
html body .am-page .am-stat-icon{width: 34px !important;height: 34px !important;border-radius: 10px !important;display: flex !important;align-items: center !important;justify-content:center}
html body .am-page .am-stat-total .am-stat-icon{background: rgba(79, 107, 254,.14) !important;color:#4f6bfe}
html body .am-page .am-stat-admin .am-stat-icon{background: rgba(167,139,250,.16) !important;color:#a78bfa}
html body .am-page .am-stat-client .am-stat-icon{background: rgba(52,211,153,.14) !important;color:#16a34a}
html body .am-page .am-stat-warn .am-stat-icon{background: rgba(251,146,60,.16) !important;color:#fb923c}
html body .am-page .am-stat-value{font-size: 28px !important;line-height: 1 !important;font-weight: 800 !important;font-variant-numeric: tabular-nums !important;margin-top:10px;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
html body .am-page .am-stat-total .am-stat-value{color:#4f6bfe !important}
html body .am-page .am-stat-admin .am-stat-value{color:#6b83ff !important}
html body .am-page .am-stat-client .am-stat-value{color:#16a34a !important}
html body .am-page .am-stat-warn .am-stat-value{color:#d97706 !important}
html body .am-page .am-notice{border-radius: 10px !important;padding: 12px 14px !important;margin-bottom: 14px !important;display: flex !important;align-items: center !important;gap: 9px !important;font-size: 13px !important;font-weight:600}
html body .am-page .am-notice-ok{background: rgba(16,185,129,.12) !important;border: 1px solid rgba(52,211,153,.35) !important;color:#4ade80}
html body .am-page .am-notice-error{background: rgba(220, 38, 38,.1) !important;border: 1px solid rgba(220, 38, 38,.35) !important;color:#fb7185}
html body .am-page .am-create{background: #ffffff !important;border: 1px solid #e5eaf4 !important;border-radius: 14px !important;margin-bottom: 20px !important;overflow: hidden !important;box-shadow:0 2px 10px rgba(20,33,61,.05)}
html body .am-page .am-create-head{padding: 16px 20px !important;border-bottom: 1px solid #eef1f7 !important;display: flex !important;align-items: center !important;gap: 12px !important;background:#f7f9fd}
html body .am-page .am-create-title{font-size: 15px !important;font-weight: 800 !important;color: #14213d !important;letter-spacing:1px}
html body .am-page .am-create-copy{font-size: 12px !important;color: #5b6b8c !important;margin-top:3px}
html body .am-page .am-form-grid{display: grid !important;grid-template-columns: repeat(3,minmax(0,1fr)) !important;gap: 14px !important;padding:20px}
html body .am-page .am-field{display: flex !important;flex-direction: column !important;gap: 7px !important;min-width:0}
html body .am-page .am-label{font-size: 12px !important;font-weight: 600 !important;color: #99a5bf !important;letter-spacing:0 !important}
html body .am-page .am-input,html body .am-page .am-select{height: 40px !important;width: 100% !important;box-sizing: border-box !important;border: 1px solid #e5eaf4 !important;border-radius: 9px !important;background: #f7f9fd !important;color: #14213d !important;padding: 0 12px !important;font: 13px/1 inherit !important;color-scheme:light}
html body .am-page .am-input::placeholder{color:#7d93ac}
html body .am-page .am-input:focus,html body .am-page .am-select:focus{outline: none !important;border-color: #4f6bfe !important;box-shadow:0 0 0 3px rgba(79, 107, 254,.15)}
html body .am-page .am-select{cursor:pointer}
html body .am-page .am-form-submit .am-btn{width: 100% !important;justify-content: center !important}
html body .am-page .am-form-submit .am-label{visibility: hidden !important}
html body .am-page .am-page-smooth{-webkit-font-smoothing: antialiased !important;text-rendering: optimizeLegibility !important}
html body .am-page .am-workspace{background: #ffffff !important;border: 1px solid #e5eaf4 !important;border-radius: 14px !important;overflow: hidden !important;box-shadow:0 2px 10px rgba(20,33,61,.05)}
html body .am-page .am-toolbar{min-height: 62px !important;display: flex !important;align-items: center !important;justify-content: space-between !important;gap: 16px !important;padding: 12px 16px !important;border-bottom:1px solid rgba(79, 107, 254,.12)}
html body .am-page .am-tools-left,html body .am-page .am-tools-right{display: flex !important;align-items: center !important;gap: 10px !important;min-width:0}
html body .am-page .am-search{position: relative !important;min-width:280px}
html body .am-page .am-search svg{position: absolute !important;left: 12px !important;top: 13px !important;color: #4b5b7a !important;pointer-events:none}
html body .am-page .am-search .am-input{padding-left:36px}
html body .am-page .am-filter-label{font-size: 12.5px !important;font-weight: 700 !important;color: #3a4a6b !important;white-space: nowrap !important;letter-spacing:0 !important}
html body .am-page .am-filter{width: auto !important;min-width:112px}
html body .am-page .am-result{font-size: 12.5px !important;color: #3a4a6b !important;white-space:nowrap}
html body .am-page .am-result strong{color: #4f6bfe !important;font-weight:800}
html body .am-page .am-clear{border: 0 !important;background: transparent !important;color: #3a4a6b !important;font-size: 12.5px !important;font-weight: 700 !important;cursor: pointer !important;padding:8px}
html body .am-page .am-clear:hover{color:#4f6bfe}
html body .am-page .am-loading{width: 16px !important;height: 16px !important;border: 2px solid #d8dfeb !important;border-top-color: #4f6bfe !important;border-radius: 50% !important;animation:am-spin .65s linear infinite}
html body .am-page .am-table-wrap{overflow:auto}
html body .am-page .am-table{width: 100% !important;border-collapse: collapse !important;table-layout:auto}
html body .am-page .am-table .am-th{text-align: left !important;height: 42px !important;padding: 0 16px !important;background: #f7f9fd !important;color: #3a4a6b !important;font-size: 12.5px !important;font-weight: 700 !important;letter-spacing: .4px !important;white-space: nowrap !important;border-bottom:1px solid #e5eaf4}
html body .am-page .am-table .am-td{height: 64px !important;padding: 0 16px !important;color: #14213d !important;font-size: 13.5px !important;border-bottom: 1px solid #eef1f7 !important;vertical-align:middle}
html body .am-page .am-table tbody tr{transition:background .15s}
html body .am-page .am-table tbody tr:hover{background:#f5f7fb}
html body .am-page .am-table tbody tr:last-child .am-td{border-bottom:0}
html body .am-page .am-index{color: #3a4a6b !important;font-variant-numeric:tabular-nums;font-weight:600}
html body .am-page .am-person{display: flex !important;align-items: center !important;gap: 12px !important;min-width:160px}
html body .am-page .am-avatar{width: 38px !important;height: 38px !important;border-radius: 10px !important;background: rgba(79, 107, 254,.12) !important;border: 1px solid rgba(79, 107, 254,.4) !important;color: #6b83ff !important;display: flex !important;align-items: center !important;justify-content: center !important;font-size: 14px !important;font-weight: 800 !important;text-transform: uppercase !important;box-shadow:0 0 12px rgba(79, 107, 254,.15)}
html body .am-page .am-person-name{font-size: 14px !important;font-weight: 800 !important;color: #14213d !important;letter-spacing:.5px}
html body .am-page .am-person-id{font-size: 10px !important;color: #4b5b7a !important;margin-top: 3px !important;font-variant-numeric:tabular-nums}
html body .am-page .am-email{color: #3a4a6b !important;white-space:nowrap;font-weight:500}
html body .am-page .am-email-cell{display: flex !important;align-items: center !important;gap:8px}
html body .am-page .am-copy-icon{width: 26px !important;height: 26px !important;border: 1px solid #d8dfeb !important;border-radius: 7px !important;background: rgba(251, 252, 254,.8) !important;color: #4b5b7a !important;display: inline-flex !important;align-items: center !important;justify-content: center !important;cursor: pointer !important;padding: 0 !important;transition:all .15s}
html body .am-page .am-copy-icon:hover{border-color: #4f6bfe !important;color:#6b83ff}
html body .am-page .am-pill{display: inline-flex !important;align-items: center !important;gap: 6px !important;height: 28px !important;border-radius: 999px !important;padding: 0 12px !important;font-size: 13px !important;font-weight: 700 !important;white-space: nowrap !important;font-variant-numeric:tabular-nums}
html body .am-page .am-pill-active{background: #e7f7ee !important;border: 1px solid #cdeeda !important;color:#16a34a}
html body .am-page .am-pill-forever{background: #e7f6fd !important;border: 1px solid #c2e7f7 !important;color:#0ea5e9}
html body .am-page .am-pill-warning{background: #fef3e2 !important;border: 1px solid #fbe0b8 !important;color:#d97706}
html body .am-page .am-pill-expired{background: #fdeaea !important;border: 1px solid #f6caca !important;color:#dc2626}
html body .am-page .am-pill-dot{width: 7px !important;height: 7px !important;border-radius: 50% !important;display: inline-block !important;flex:0 0 auto;background: currentColor}
html body .am-page .am-badge{display: inline-flex !important;align-items: center !important;gap: 6px !important;height: 26px !important;border-radius: 999px !important;padding: 0 12px !important;font-size: 13px !important;font-weight: 700 !important;white-space:nowrap}
html body .am-page .am-badge-admin{background: #edf1ff !important;border: 1px solid #c9d4ea !important;color:#4f6bfe}
html body .am-page .am-badge-client{background: #f2f4f9 !important;border: 1px solid #e5eaf4 !important;color:#5b6b8c}
html body .am-page .am-badge-dot{width: 7px !important;height: 7px !important;border-radius: 50% !important;display: inline-block !important;flex:0 0 auto;background: currentColor}
html body .am-page .am-actions{display: flex !important;align-items: center !important;justify-content: flex-end !important;gap:6px}
html body .am-page .am-action{height: 32px !important;padding: 0 12px !important;font-size: 13px !important;font-weight: 600 !important;border-radius: 8px !important;border-color: #e5eaf4 !important;background:#ffffff !important;color:#3a4a6b !important}
html body .am-page .am-action:hover{border-color: #c9d4ea !important;color:#14213d}
html body .am-page .am-action.am-btn-primary{background: linear-gradient(135deg,#4f6bfe,#6b83ff) !important;border:none !important;color:#ffffff !important}
html body .am-page .am-action-icon{width: 30px !important;padding: 0 !important;background: #fdeaea !important;border-color: #f6caca !important;color:#dc2626 !important;display:inline-flex !important;align-items:center !important;justify-content:center}
html body .am-page .am-action-icon:hover{border-color: #dc2626 !important;color:#dc2626 !important;background:#fdeaea !important}
html body .am-page .am-acc{font-weight: 800 !important;letter-spacing:.5px}
html body .am-page .am-pass-row{display: flex !important;gap: 8px !important;min-width:0}
html body .am-page .am-pass-row .am-input{flex:1;min-width:0}
html body .am-page .am-gen{height: 40px !important;padding: 0 12px !important;font-size: 12px !important;color: #4f6bfe !important;border: 1px solid #e5eaf4 !important;background: #ffffff !important;white-space: nowrap !important}
html body .am-page .am-gen:hover{color:#14213d !important;border-color:#c9d4ea !important}
html body .am-page .am-pager{display: flex !important;align-items: center !important;justify-content: space-between !important;padding: 12px 16px !important;font-size: 13px !important;color: #5b6b8c !important;border-top: 1px solid #eef1f7 !important}
html body .am-page .am-pager-pages{display: flex !important;gap: 6px !important;align-items: center !important}
html body .am-page .am-pg{min-width: 29px !important;height: 29px !important;border-radius: 7px !important;border: 1px solid #e5eaf4 !important;background: #ffffff !important;display: inline-grid !important;place-items: center !important;cursor: pointer !important;color: #3a4a6b !important;font-size: 13px !important;padding:0 6px;font-family: inherit;font-weight:600}
html body .am-page .am-pg.on{background: linear-gradient(135deg,#4f6bfe,#6b83ff) !important;color: #ffffff !important;border-color: transparent !important;font-weight: 600}
html body .am-page .am-pg.dis{opacity:.45 !important;cursor: default !important}
html body .am-page .am-empty{min-height: 320px !important;display: flex !important;align-items: center !important;justify-content: center !important;text-align: center !important;padding: 30px !important;box-sizing:border-box}
html body .am-page .am-empty-icon{width: 56px !important;height: 56px !important;border-radius: 16px !important;margin: 0 auto 14px !important;background: rgba(79, 107, 254,.08) !important;border: 1px solid rgba(79, 107, 254,.3) !important;color: #6b83ff !important;display: flex !important;align-items: center !important;justify-content:center}
html body .am-page .am-empty-title{font-size: 15px !important;font-weight: 800 !important;color:#14213d}
html body .am-page .am-empty-copy{font-size: 12px !important;color: #5b6b8c !important;margin: 8px auto 18px !important;max-width: 340px !important;line-height:1.7}
html body .am-page .am-mobile-list{display:none}
html body .am-page .am-mobile-row{background: rgba(247, 249, 253,.82) !important;border: 1px solid rgba(79, 107, 254,.14) !important;border-radius: 14px !important;padding: 16px !important;margin-bottom:10px}
html body .am-page .am-mobile-head{display: flex !important;align-items: center !important;justify-content: space-between !important;gap:12px}
html body .am-page .am-mobile-meta{display: grid !important;grid-template-columns: 1fr 1fr !important;gap: 10px !important;margin:14px 0}
html body .am-page .am-mobile-k{font-size: 10px !important;color: #4b5b7a !important;margin-bottom: 4px !important;letter-spacing:1px}
html body .am-page .am-mobile-v{font-size: 12px !important;color: #14213d !important;white-space: nowrap !important;overflow: hidden !important;text-overflow:ellipsis}
html body .am-page .am-mobile-row .am-actions{justify-content: flex-start !important;display: grid !important;grid-template-columns:repeat(4,1fr)}
html body .am-page .am-modal-bg{position: fixed !important;inset: 0 !important;background: rgba(6,10,19,.66) !important;z-index: 1000 !important;display: flex !important;align-items: center !important;justify-content: center !important;padding: 20px !important;box-sizing: border-box !important;backdrop-filter:blur(3px)}
html body .am-page .am-modal{width: min(430px,100%) !important;background: rgba(247, 249, 253,.96) !important;border: 1px solid rgba(79, 107, 254,.22) !important;border-radius: 14px !important;box-shadow: 0 24px 70px rgba(0,0,0,.5) !important;overflow:hidden}
html body .am-page .am-modal-head{display: flex !important;align-items: flex-start !important;justify-content: space-between !important;gap: 16px !important;padding: 20px 20px 14px !important;border-bottom:1px solid rgba(79, 107, 254,.12)}
html body .am-page .am-modal-title{font-size: 16px !important;font-weight: 800 !important;color:#14213d}
html body .am-page .am-modal-copy{font-size: 12px !important;color: #5b6b8c !important;margin-top: 5px !important;line-height:1.5}
html body .am-page .am-modal-close{border: 1px solid #d8dfeb !important;background: rgba(251, 252, 254,.8) !important;color: #5b6b8c !important;width: 30px !important;height: 30px !important;border-radius: 8px !important;display: flex !important;align-items: center !important;justify-content: center !important;cursor: pointer !important;transition:all .15s}
html body .am-page .am-modal-close:hover{border-color: #4f6bfe !important;color:#6b83ff}
html body .am-page .am-modal-body{padding:6px 20px 20px}
html body .am-page .am-modal-actions{border-top: 1px solid rgba(79, 107, 254,.12) !important;padding: 14px 20px !important;display: flex !important;justify-content: flex-end !important;gap:9px}
html body .am-page .am-no-auth{height: 80vh !important;display: flex !important;align-items: center !important;justify-content: center !important;color: #5b6b8c !important;font-size:13px}
@media(max-width:1050px){html body .am-page .am-form-grid{grid-template-columns:repeat(2,minmax(0,1fr))}html body .am-page .am-form-grid .am-field:last-child{grid-column:span 2}html body .am-page .am-toolbar{align-items: flex-start !important;flex-direction:column}html body .am-page .am-tools-left,html body .am-page .am-tools-right{width:100%}html body .am-page .am-tools-right{justify-content:space-between}html body .am-page .am-search{flex:1}html body .am-page .am-action{width: 32px !important;padding: 0 !important;font-size:0}html body .am-page .am-action svg{width: 14px!important !important;height:14px!important}}
@media(max-width:760px){html body .am-page .am-shell{padding:18px 14px 36px}html body .am-page .am-hero{align-items: center !important;margin-bottom:18px}html body .am-page .am-title{font-size:21px}html body .am-page .am-subtitle{display:none}html body .am-page .am-hero-actions .am-btn-primary span{display:none}html body .am-page .am-hero-actions .am-btn-primary{width: 38px !important;padding:0}html body .am-page .am-stats{grid-template-columns: repeat(2,minmax(0,1fr)) !important;gap:10px}html body .am-page .am-stat{min-height: 94px !important;padding:14px}html body .am-page .am-stat-value{font-size:24px}html body .am-page .am-form-grid{grid-template-columns: 1fr !important;padding:16px}html body .am-page .am-form-grid .am-field:last-child{grid-column:auto}html body .am-page .am-form-actions{padding:0 16px 16px}html body .am-page .am-tools-left{flex-wrap:wrap}html body .am-page .am-search{width: 100% !important;flex-basis: 100% !important;min-width:0}html body .am-page .am-filter-label{display:none}html body .am-page .am-filter{flex: 1 !important;min-width:0}html body .am-page .am-table-wrap{display:none}html body .am-page .am-mobile-list{display:block}html body .am-page .am-mobile-row .am-action{width: auto !important;font-size: 11px !important;padding:0 7px}html body .am-page .am-empty{min-height:270px}}
@media(max-width:430px){html body .am-page .am-shell{padding-left: 10px !important;padding-right:10px}html body .am-page .am-eyebrow{font-size:11px}html body .am-page .am-title{font-size:19px}html body .am-page .am-stats{gap:6px}html body .am-page .am-stat{padding:12px}html body .am-page .am-stat-icon{width: 28px !important;height:28px}html body .am-page .am-stat-value{font-size:21px}html body .am-page .am-tools-right{align-items: flex-start !important;flex-direction:column}html body .am-page .am-result{padding-left:2px}html body .am-page .am-mobile-row .am-action{font-size:0}html body .am-page .am-mobile-row .am-action svg{width: 15px!important !important;height:15px!important}}
`;

const AccountManage = defineComponent({
    __name: "account-manage",
    setup() {
        const token = storage.get("ACCESS-TOKEN") || "";
        const currentUser = storage.get("CURRENT-USER") || "";
        const accounts = ref([]), loading = ref(false), message = ref({ text: "", type: "" });
        const searchKey = ref(""), roleFilter = ref("all"), statusFilter = ref("all");
        const showAddForm = ref(false), modalType = ref(""), modalUserId = ref(""), modalValue = ref("");
        const page = ref(1);
        const form = ref({ username: "", email: "", password: "", expire_date: "", authority: "clients" });

        function addMonthsSafe(date, months) { const d = new Date(date), target = d.getMonth() + months; d.setMonth(target); if (d.getMonth() !== ((target % 12) + 12) % 12) d.setDate(0); return d; }
        function setDefaultExpire() { form.value.expire_date = addMonthsSafe(new Date(), 1).toISOString().slice(0, 10); }
        function expiryStatus(dateStr) { if (!dateStr) return "expired"; var end = new Date(dateStr + (String(dateStr).length <= 10 ? "T23:59:59" : "")), days = (end - new Date()) / 86400000; if (days < 0) return "expired"; if (days <= 7) return "warning"; if (days > 3650) return "forever"; return "active"; }
        function expiryPill(account) {
            var status = expiryStatus(account.Expire);
            var label = "—";
            if (status === "expired") {
                label = "已到期";
            } else if (status === "forever") {
                label = "长期有效";
            } else {
                var end = new Date((account.Expire || "") + (String(account.Expire || "").length <= 10 ? "T23:59:59" : ""));
                var days = Math.ceil((end - new Date()) / 86400000);
                label = "剩 " + Math.max(days, 0) + " 天";
            }
            return h("span", { class: "am-pill am-pill-" + status }, [h("i", { class: "am-pill-dot" }), label]);
        }
        function copyEmail(account) {
            function done() { showMessage("邮箱已复制：" + (account.email || ""), "success"); }
            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(account.email || "").then(done, done);
            } else {
                try {
                    var t = document.createElement("textarea");
                    t.value = account.email || "";
                    document.body.appendChild(t);
                    t.select();
                    document.execCommand("copy");
                    document.body.removeChild(t);
                    done();
                } catch (_) { showMessage("复制失败", "error"); }
            }
        }
        function accountRole(account) { return account.authorty === "admin" ? "admin" : "clients"; }

        async function apiCall(body) {
            try { const response = await fetch("/api/EaodAccountManage.php", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(Object.assign({}, body, { token: token })) }); return await response.json(); }
            catch (_) { return { code: -1, msg: "网络错误，请稍后重试" }; }
        }
        async function loadAccounts() { loading.value = true; var result = await apiCall({ action: "list", search: "" }); if (result.code === 200) accounts.value = result.accounts || []; else showMessage(result.msg || "账号数据加载失败", "error"); loading.value = false; refreshIcons(); }
        async function addAccount() {
            var data = form.value;
            if (!data.username || !data.email || !data.password || !data.expire_date) { showMessage("请填写所有必填字段", "error"); return; }
            loading.value = true;
            var result = await apiCall({ action: "add", username: data.username, email: data.email, password: data.password, expire_date: data.expire_date, authority: data.authority });
            loading.value = false;
            if (result.code === 200) { showMessage(result.msg, "success"); form.value = { username: "", email: "", password: "", expire_date: "", authority: "clients" }; setDefaultExpire(); showAddForm.value = false; loadAccounts(); }
            else showMessage(result.msg || "创建失败", "error");
        }
        async function deleteAccount(uid, name) { if (!confirm("确定要删除账号 “" + name + "” 吗？")) return; loading.value = true; var result = await apiCall({ action: "delete", userid: uid }); loading.value = false; showMessage(result.msg, result.code === 200 ? "success" : "error"); if (result.code === 200) loadAccounts(); }
        async function modalSubmit() {
            if (!modalValue.value) { showMessage("请填写内容", "error"); return; }
            loading.value = true; var body = { userid: modalUserId.value };
            if (modalType.value === "renew") { body.action = "renew"; body.expire_date = modalValue.value; }
            else if (modalType.value === "password") { body.action = "update_password"; body.password = modalValue.value; }
            else if (modalType.value === "email") { body.action = "update_email"; body.email = modalValue.value; }
            var result = await apiCall(body); loading.value = false; showMessage(result.msg, result.code === 200 ? "success" : "error"); if (result.code === 200) { modalType.value = ""; loadAccounts(); }
        }
        function openModal(type, uid, value) { modalType.value = type; modalUserId.value = uid; modalValue.value = type === "renew" ? addMonthsSafe(new Date(value || new Date()), 1).toISOString().slice(0, 10) : value || ""; refreshIcons(); }
        function showMessage(text, type) { message.value = { text: text || "操作完成", type: type }; setTimeout(function() { message.value = { text: "", type: "" }; }, 3000); }
        function randomAccount() { var words = ["user", "client", "guest", "member"], domains = ["example.com", "test.com", "demo.com"], chars = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789", password = ""; for (var i = 0; i < 12; i++) password += chars[Math.floor(Math.random() * chars.length)]; var username = words[Math.floor(Math.random() * words.length)] + Math.floor(Math.random() * 9000 + 1000); form.value.username = username; form.value.email = username + "@" + domains[Math.floor(Math.random() * domains.length)]; form.value.password = password; }
        function resetFilters() { searchKey.value = ""; roleFilter.value = "all"; statusFilter.value = "all"; page.value = 1; }
        function toggleCreate() { showAddForm.value = !showAddForm.value; if (showAddForm.value) setDefaultExpire(); refreshIcons(); }
        function roleBadge(account) { var admin = accountRole(account) === "admin"; return h("span", { class: "am-badge " + (admin ? "am-badge-admin" : "am-badge-client") }, [h("i", { class: "am-badge-dot" }), admin ? "管理员" : "客户"]); }
        function actions(account) {
            var expired = expiryStatus(account.Expire) === "expired";
            return h("div", { class: "am-actions" }, [
                h("button", { class: "am-btn am-action" + (expired ? " am-btn-primary" : ""), title: "账号续期", onClick: function() { openModal("renew", account.userid, account.Expire); } }, [h("span", null, "续期")]),
                h("button", { class: "am-btn am-action", title: "修改密码", onClick: function() { openModal("password", account.userid, ""); } }, [h("span", null, "密码")]),
                h("button", { class: "am-btn am-action", title: "修改邮箱", onClick: function() { openModal("email", account.userid, account.email); } }, [h("span", null, "邮箱")]),
                h("button", { class: "am-btn am-action am-action-icon", title: "删除账号", onClick: function() { deleteAccount(account.userid, account.usrname); } }, [icon("trash-2", 14)])
            ]);
        }

        onMounted(function() {
            if (currentUser !== "admin") return;
            if (!document.getElementById("account-redesign-styles")) { var style = document.createElement("style"); style.id = "account-redesign-styles"; style.textContent = PAGE_CSS; document.head.appendChild(style); }
            setDefaultExpire(); loadAccounts(); refreshIcons();
        });

        return function() {
            if (currentUser !== "admin") return h("div", { class: "am-no-auth" }, "无权限访问");
            var counts = { admin: 0, clients: 0, warning: 0, expired: 0 };
            accounts.value.forEach(function(account) { counts[accountRole(account)]++; var status = expiryStatus(account.Expire); if (status === "warning") counts.warning++; if (status === "expired") counts.expired++; });
            var query = searchKey.value.trim().toLowerCase();
            var filtered = accounts.value.filter(function(account) { var roleOk = roleFilter.value === "all" || accountRole(account) === roleFilter.value, status = expiryStatus(account.Expire), statusOk = statusFilter.value === "all" || status === statusFilter.value, text = String(account.usrname || "") + " " + String(account.email || "") + " " + String(account.userid || ""); return roleOk && statusOk && (!query || text.toLowerCase().includes(query)); });
            var hasFilters = !!query || roleFilter.value !== "all" || statusFilter.value !== "all", content = [];

            if (message.value.text) content.push(h("div", { class: "am-notice " + (message.value.type === "success" ? "am-notice-ok" : "am-notice-error") }, [icon(message.value.type === "success" ? "circle-check" : "circle-alert", 16), toDisplayString(message.value.text)]));
            content.push(h("header", { class: "am-hero" }, [
                h("div", null, [h("div", { class: "am-eyebrow" }, [h("span", { class: "am-live-dot" }), "用户与权限中心"]), h("h1", { class: "am-title" }, "账号管理"), h("p", { class: "am-subtitle" }, "集中维护登录账号、访问角色与有效期")]),
                h("div", { class: "am-hero-actions" }, [h("button", { class: "am-btn am-btn-icon", title: "刷新账号", onClick: loadAccounts }, [loading.value ? h("span", { class: "am-loading" }) : icon("refresh-cw", 16)]), h("button", { class: "am-btn am-btn-primary", onClick: toggleCreate }, [icon(showAddForm.value ? "x" : "user-plus", 16), h("span", null, showAddForm.value ? "取消新增" : "新增账号")])])
            ]));
            content.push(h("section", { class: "am-stats", "aria-label": "账号概览" }, [
                h("button", { class: "am-stat am-stat-total", onClick: resetFilters }, [h("div", { class: "am-stat-head" }, ["账号总数", h("span", { class: "am-stat-icon" }, [icon("users", 16)])]), h("strong", { class: "am-stat-value" }, String(accounts.value.length))]),
                h("button", { class: "am-stat am-stat-admin", onClick: function() { roleFilter.value = "admin"; statusFilter.value = "all"; } }, [h("div", { class: "am-stat-head" }, ["管理员", h("span", { class: "am-stat-icon" }, [icon("shield-check", 16)])]), h("strong", { class: "am-stat-value" }, String(counts.admin))]),
                h("button", { class: "am-stat am-stat-client", onClick: function() { roleFilter.value = "clients"; statusFilter.value = "all"; } }, [h("div", { class: "am-stat-head" }, ["客户账号", h("span", { class: "am-stat-icon" }, [icon("contact", 16)])]), h("strong", { class: "am-stat-value" }, String(counts.clients))]),
                h("button", { class: "am-stat am-stat-warn", onClick: function() { statusFilter.value = "warning"; roleFilter.value = "all"; } }, [h("div", { class: "am-stat-head" }, ["即将到期", h("span", { class: "am-stat-icon" }, [icon("clock-3", 16)])]), h("strong", { class: "am-stat-value" }, String(counts.warning))])
            ]));

            if (showAddForm.value) content.push(h("section", { class: "am-create" }, [
                h("div", { class: "am-create-head" }, [h("span", { class: "am-stat-icon", style: "background:#edf2f7;color:#344054" }, [icon("user-plus", 16)]), h("div", null, [h("div", { class: "am-create-title" }, "新增账号"), h("div", { class: "am-create-copy" }, "支持随机生成初始密码")])]),
                h("div", { class: "am-form-grid" }, [
                    h("label", { class: "am-field" }, [h("span", { class: "am-label" }, "用户名 *"), h("input", { class: "am-input", placeholder: "例如 client1024", autocomplete: "off", value: form.value.username, onInput: function(e) { form.value.username = e.target.value; } })]),
                    h("label", { class: "am-field" }, [h("span", { class: "am-label" }, "邮箱 *"), h("input", { class: "am-input", type: "email", placeholder: "name@example.com", value: form.value.email, onInput: function(e) { form.value.email = e.target.value; } })]),
                    h("label", { class: "am-field" }, [h("span", { class: "am-label" }, "初始密码 *"), h("div", { class: "am-pass-row" }, [h("input", { class: "am-input", type: "text", placeholder: "输入初始密码", autocomplete: "new-password", value: form.value.password, onInput: function(e) { form.value.password = e.target.value; } }), h("button", { class: "am-btn am-gen", type: "button", title: "随机生成用户名/邮箱/密码", onClick: randomAccount }, "随机生成")])]),
                    h("label", { class: "am-field" }, [h("span", { class: "am-label" }, "到期日期 *"), h("input", { class: "am-input", type: "date", value: form.value.expire_date, onInput: function(e) { form.value.expire_date = e.target.value; } })]),
                    h("label", { class: "am-field" }, [h("span", { class: "am-label" }, "账号角色"), h("select", { class: "am-select", value: form.value.authority, onChange: function(e) { form.value.authority = e.target.value; } }, [h("option", { value: "clients" }, "客户"), h("option", { value: "admin" }, "管理员")])]),
                    h("div", { class: "am-field am-form-submit" }, [h("span", { class: "am-label" }, "\u00A0"), h("button", { class: "am-btn am-btn-primary", disabled: loading.value, onClick: addAccount }, [icon("check", 15), loading.value ? "创建中..." : "确认创建"])])
                ])
            ]));

            var perPage = 10;
            var totalPages = Math.max(1, Math.ceil(filtered.length / perPage));
            if (page.value > totalPages) page.value = totalPages;
            var pageRows = filtered.slice((page.value - 1) * perPage, page.value * perPage);
            var tableRows = pageRows.map(function(account, index) { var status = expiryStatus(account.Expire); return h("tr", { key: account.userid }, [
                h("td", { class: "am-td am-index" }, String((page.value - 1) * perPage + index + 1).padStart(2, "0")),
                h("td", { class: "am-td am-acc" }, account.usrname),
                h("td", { class: "am-td" }, [h("div", { class: "am-email-cell" }, [h("span", { class: "am-email" }, account.email || "—"), h("button", { class: "am-copy-icon", title: "复制邮箱", onClick: function() { copyEmail(account); } }, [icon("copy", 13)])])]), h("td", { class: "am-td" }, [expiryPill(account)]), h("td", { class: "am-td" }, [roleBadge(account)]), h("td", { class: "am-td" }, [actions(account)])
            ]); });
            var mobileRows = pageRows.map(function(account) { var status = expiryStatus(account.Expire); return h("article", { class: "am-mobile-row", key: "m-" + account.userid }, [
                h("div", { class: "am-mobile-head" }, [h("div", { class: "am-person" }, [h("span", { class: "am-avatar" }, String(account.usrname || "U").slice(0, 1)), h("div", null, [h("div", { class: "am-person-name" }, account.usrname), h("div", { class: "am-person-id" }, "ID " + account.userid)])]), roleBadge(account)]),
                h("div", { class: "am-mobile-meta" }, [h("div", null, [h("div", { class: "am-mobile-k" }, "邮箱"), h("div", { class: "am-mobile-v" }, account.email || "—")]), h("div", null, [h("div", { class: "am-mobile-k" }, "到期日期"), h("div", { class: "am-mobile-v" }, [expiryPill(account)])])]), actions(account)
            ]); });
            var empty = h("div", { class: "am-empty" }, [h("div", null, [h("div", { class: "am-empty-icon" }, [icon(hasFilters ? "search-x" : "users", 22)]), h("div", { class: "am-empty-title" }, hasFilters ? "没有匹配的账号" : "还没有账号"), h("div", { class: "am-empty-copy" }, hasFilters ? "换个关键词或清除筛选条件后再试。" : "创建第一个账号后，可在这里统一维护角色、密码和有效期。"), h("button", { class: "am-btn am-btn-primary", onClick: hasFilters ? resetFilters : toggleCreate }, [icon(hasFilters ? "rotate-ccw" : "user-plus", 15), hasFilters ? "清除筛选" : "创建账号"])])]);
            var pagerNodes = [];
            pagerNodes.push(h("button", { class: "am-pg" + (page.value <= 1 ? " dis" : ""), onClick: function() { if (page.value > 1) page.value = page.value - 1; } }, "‹"));
            for (var pi = 1; pi <= totalPages; pi++) {
                if (totalPages > 7 && pi > 2 && pi < totalPages - 1 && Math.abs(pi - page.value) > 1) {
                    if (pi === 3 || pi === totalPages - 2) pagerNodes.push(h("span", { class: "am-pg dis" }, "…"));
                    continue;
                }
                pagerNodes.push(h("button", { class: "am-pg" + (pi === page.value ? " on" : ""), onClick: (function(n) { return function() { page.value = n; }; })(pi) }, String(pi)));
            }
            pagerNodes.push(h("button", { class: "am-pg" + (page.value >= totalPages ? " dis" : ""), onClick: function() { if (page.value < totalPages) page.value = page.value + 1; } }, "›"));

            content.push(h("section", { class: "am-workspace" }, [
                h("div", { class: "am-toolbar" }, [
                    h("div", { class: "am-tools-left" }, [h("div", { class: "am-search" }, [icon("search", 16), h("input", { class: "am-input", placeholder: "搜索用户名、邮箱或账号 ID", value: searchKey.value, onInput: function(e) { searchKey.value = e.target.value; } })]), h("span", { class: "am-filter-label" }, "筛选"), h("select", { class: "am-select am-filter", value: roleFilter.value, onChange: function(e) { roleFilter.value = e.target.value; } }, [h("option", { value: "all" }, "全部角色"), h("option", { value: "admin" }, "管理员"), h("option", { value: "clients" }, "客户")]), h("select", { class: "am-select am-filter", value: statusFilter.value, onChange: function(e) { statusFilter.value = e.target.value; } }, [h("option", { value: "all" }, "全部状态"), h("option", { value: "active" }, "正常"), h("option", { value: "warning" }, "7 天内到期"), h("option", { value: "expired" }, "已到期")])]),
                    h("div", { class: "am-tools-right" }, compact([h("span", { class: "am-result" }, ["显示 ", h("strong", null, String(filtered.length)), " / " + accounts.value.length + " 个账号"]), hasFilters ? h("button", { class: "am-clear", onClick: resetFilters }, "清除筛选") : null, loading.value ? h("span", { class: "am-loading" }) : null]))
                ]),
                filtered.length === 0 && !loading.value ? empty : h("div", null, [h("div", { class: "am-table-wrap" }, [h("table", { class: "am-table" }, [h("thead", null, [h("tr", null, [h("th", { class: "am-th", style: "width:48px" }, "序号"), h("th", { class: "am-th" }, "账号"), h("th", { class: "am-th" }, "邮箱"), h("th", { class: "am-th" }, "到期日期"), h("th", { class: "am-th" }, "角色"), h("th", { class: "am-th", style: "text-align:right" }, "操作")])]), h("tbody", null, tableRows)])]), h("div", { class: "am-mobile-list" }, mobileRows), h("div", { class: "am-pager" }, [h("span", null, "共 " + filtered.length + " 条 · 每页 " + perPage + " 条"), h("div", { class: "am-pager-pages" }, pagerNodes)])])
            ]));

            if (modalType.value) {
                var modalData = { renew: { title: "账号续期", copy: "设置新的账号到期日期", label: "新到期日期", type: "date", placeholder: "" }, password: { title: "修改密码", copy: "更新后旧密码将立即失效", label: "新密码", type: "password", placeholder: "输入新的登录密码" }, email: { title: "修改邮箱", copy: "邮箱用于账号识别与联系", label: "新邮箱", type: "email", placeholder: "name@example.com" } }[modalType.value];
                content.push(h("div", { class: "am-modal-bg", onClick: function(e) { if (e.target === e.currentTarget) modalType.value = ""; } }, [h("div", { class: "am-modal", role: "dialog", "aria-modal": "true" }, [
                    h("div", { class: "am-modal-head" }, [h("div", null, [h("div", { class: "am-modal-title" }, modalData.title), h("div", { class: "am-modal-copy" }, modalData.copy)]), h("button", { class: "am-modal-close", title: "关闭", onClick: function() { modalType.value = ""; } }, [icon("x", 16)])]),
                    h("div", { class: "am-modal-body" }, [h("label", { class: "am-field" }, [h("span", { class: "am-label" }, modalData.label), h("input", { class: "am-input", type: modalData.type, placeholder: modalData.placeholder, value: modalValue.value, onInput: function(e) { modalValue.value = e.target.value; }, onKeyup: function(e) { if (e.key === "Enter") modalSubmit(); } })])]),
                    h("div", { class: "am-modal-actions" }, [h("button", { class: "am-btn", onClick: function() { modalType.value = ""; } }, "取消"), h("button", { class: "am-btn am-btn-primary", disabled: loading.value, onClick: modalSubmit }, [icon("check", 15), loading.value ? "处理中..." : "确认保存"])])
                ])]));
            }
            return h("div", { class: "am-page" }, [h("div", { class: "am-shell" }, content)]);
        };
    }
});

export { AccountManage as default };
