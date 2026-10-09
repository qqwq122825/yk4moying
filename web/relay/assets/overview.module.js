import {
    d as defineComponent,
    o as openBlock,
    c as createElementBlock,
    a as createElementVNode,
    aM as onMounted,
    aP as onUnmounted,
    e as useRouter,
    s as storage
} from "./core.vendor.js";

const ICONS = {
    devices: '<svg viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="4" width="18" height="13" rx="2"/><path d="M8 21h8M12 17v4"/></svg>',
    online: '<svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="8"/><path d="m8 12 2.5 2.5L16 9"/></svg>',
    offline: '<svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="8"/><path d="m9 9 6 6m0-6-6 6"/></svg>',
    account: '<svg viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="8" r="3"/><path d="M5 20c.8-3.2 3.1-5 7-5s6.2 1.8 7 5"/></svg>',
    builder: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M14 4 20 10 10 20H4v-6L14 4Z"/><path d="m12 6 6 6M7 17h.01"/></svg>',
    arrow: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M5 12h14M13 6l6 6-6 6"/></svg>',
    bell: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M18 9a6 6 0 0 0-12 0c0 7-3 7-3 9h18c0-2-3-2-3-9M10 21h4"/></svg>',
    activity: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M4 12h3l2-7 4 14 2-7h5"/></svg>',
    shield: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3l7 3v5c0 4.5-3 8-7 10-4-2-7-5.5-7-10V6l7-3Z"/></svg>',
    gear: '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 1 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 1 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33h.01a1.65 1.65 0 0 0 1-1.51V3a2 2 0 1 1 4 0v.09a1.65 1.65 0 0 0 1 1.51h.01a1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82v.01a1.65 1.65 0 0 0 1.51 1H21a2 2 0 1 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>'
};

const esc = value => String(value == null ? "" : value).replace(/[&<>\"']/g, ch => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
}[ch]));

const STYLE = `
/* ═══ 净白简约 · 仪表盘（与 preview-zgl/dashboard.html 1:1 对齐） ═══ */
.zgl-page{min-height:100vh;background:#f2f4f9;color:#14213d;font-family:"Segoe UI","Microsoft YaHei UI","Microsoft YaHei","PingFang SC","Noto Sans CJK SC",system-ui,-apple-system,BlinkMacSystemFont,sans-serif;padding:2px 4px 40px;box-sizing:border-box}
.zgl-header{max-width:1240px;margin:6px auto 20px;display:flex;align-items:flex-end;justify-content:space-between;gap:18px;flex-wrap:wrap}
.zgl-eyebrow{font-size:11.5px;letter-spacing:3px;text-transform:uppercase;color:#4f6bfe;font-weight:700;margin-bottom:8px;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
.zgl-header h1{font-size:24px;line-height:1.2;margin:0 0 8px;font-weight:800;letter-spacing:.3px;color:#14213d}
.zgl-header p{margin:0;color:#99a5bf;font-size:13px}
.zgl-header-meta{display:flex;align-items:center;gap:14px;margin-left:auto;color:#99a5bf;font-size:12.5px}
.zgl-live{display:inline-flex;align-items:center;gap:7px;color:#16a34a;background:#e7f7ee;border:1px solid #cdeeda;border-radius:999px;padding:5px 12px;font-size:12px;font-weight:600;white-space:nowrap}
.zgl-live i{width:7px;height:7px;border-radius:50%;background:#16a34a;animation:zglPulse2 1.8s infinite}@keyframes zglPulse2{0%,100%{opacity:1}50%{opacity:.3}}
.zgl-date{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12.5px;color:#99a5bf}
.zgl-main{max-width:1240px;margin:0 auto}
.zgl-stat-grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:14px;margin-bottom:16px}
.zgl-stat,.zgl-panel{background:#ffffff;border:1px solid #e5eaf4;border-radius:14px;box-shadow:0 2px 10px rgba(20,33,61,.05)}
.zgl-stat{padding:15px 18px;position:relative;overflow:hidden;border-top:3px solid #4f6bfe;transition:transform .18s,border-color .18s}
.zgl-stat:hover{transform:translateY(-2px)}
.zgl-stat.online{border-top-color:#16a34a}
.zgl-stat.offline{border-top-color:#94a3b8}
.zgl-stat.perms{border-top-color:#f59e0b}
.zgl-stat-top{display:flex;align-items:center;justify-content:space-between;color:#5b6b8c;font-size:12.5px}
.zgl-stat strong{display:block;font-size:30px;line-height:1;margin:14px 0 8px;letter-spacing:0;color:#14213d;font-variant-numeric:tabular-nums;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
.zgl-stat.total strong{color:#4f6bfe}
.zgl-stat.online strong{color:#16a34a}
.zgl-stat.offline strong{color:#64748b}
.zgl-stat.perms strong{color:#f59e0b}
.zgl-stat small{color:#99a5bf;font-size:11.5px}
.zgl-content-grid{display:grid;grid-template-columns:1.05fr .95fr;gap:16px;margin-bottom:16px}
.zgl-panel{padding:0;overflow:hidden}
.zgl-panel-head{display:flex;align-items:center;gap:9px;justify-content:space-between;padding:14px 18px;border-bottom:1px solid #e5eaf4;font-weight:600;font-size:14px;color:#14213d}
.zgl-panel-head h2{margin:0;font-size:14px;font-weight:600;color:#14213d}
.zgl-panel-mark{font-size:10px;letter-spacing:2px;color:#99a5bf;font-weight:400}
.zgl-panel-body{padding:16px 18px}
.zgl-entry-list{display:flex;flex-direction:column;gap:10px}
.zgl-entry{width:100%;border:1px solid #e5eaf4;background:#f7f9fd;border-radius:9px;padding:13px 15px;display:flex;align-items:center;gap:12px;text-align:left;color:#14213d;cursor:pointer;transition:all .18s;font:inherit}
.zgl-entry:hover{border-color:#c9d4ea;background:#f2f5fc;transform:translateX(3px)}
.zgl-entry>svg{width:16px;height:16px;margin-left:auto;color:#99a5bf;flex:none}
.zgl-entry-icon{width:36px;height:36px;border-radius:10px;display:grid;place-items:center;flex:none}
.zgl-entry-icon.blue{background:#edf1ff;color:#4f6bfe}
.zgl-entry-icon.purple{background:#f3efff;color:#7c6cf6}
.zgl-entry-icon.orange{background:#fff1e6;color:#fb923c}
.zgl-entry-icon svg,.zgl-panel-head>svg,.zgl-permission svg{width:18px;height:18px;fill:none;stroke:currentColor;stroke-width:1.7;stroke-linecap:round;stroke-linejoin:round}
.zgl-entry b{font-size:13.5px;font-weight:600;display:block;margin-bottom:3px;color:#14213d}
.zgl-entry small{font-size:11.5px;color:#99a5bf}
.zgl-distribution-body{display:flex;gap:22px;align-items:center;flex-wrap:wrap}
.zgl-ring{width:118px;height:118px;border-radius:50%;display:grid;place-items:center;background:conic-gradient(#16a34a 0 0%,#e5eaf4 0 100%);position:relative;flex:none}
.zgl-ring:before{content:"";position:absolute;inset:12px;border-radius:50%;background:#ffffff}
#app .zgl-page .zgl-ring{background:conic-gradient(#16a34a 0 var(--zgl-ring-pct,0%),#e5eaf4 var(--zgl-ring-pct,0%) 100%) !important}
#app .zgl-page .zgl-ring:before{background:#ffffff !important}
.zgl-ring>div{position:relative;text-align:center}
.zgl-ring strong{display:block;font-size:22px;color:#14213d;font-variant-numeric:tabular-nums;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
.zgl-ring small{font-size:11px;color:#99a5bf}
.zgl-bars{flex:1;min-width:150px;display:flex;flex-direction:column;gap:12px}
.zgl-bar-row{display:flex;align-items:center;gap:10px;font-size:12.5px;color:#5b6b8c}
.zgl-bar-row i{width:9px;height:9px;border-radius:3px;flex:none}
.zgl-bar-row .zgl-bar{flex:1;height:9px;border-radius:5px;background:#e5eaf4;overflow:hidden}
.zgl-bar-row .zgl-bar b{display:block;height:100%;border-radius:5px;transition:width .35s}
.zgl-bar-row .zgl-bar-v{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12px;min-width:38px;text-align:right;color:#14213d}
/* ═══ 三栏底区 ═══ */
.zgl-loc-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-bottom:16px}
.zgl-loc-sum{display:flex;gap:26px;margin-bottom:16px}
.zgl-loc-sum .k{font-size:26px;font-weight:800;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;line-height:1}
.zgl-loc-sum .k b{background:linear-gradient(135deg,#6b83ff 0%,#4458f0 100%);-webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent}
.zgl-loc-sum .t{font-size:11.5px;color:#99a5bf;margin-top:5px}
.zgl-location-row{display:flex;align-items:center;gap:10px;padding:8px 0;border-bottom:1px dashed #e5eaf4;font-size:13px;color:#14213d}
.zgl-location-row:last-child{border-bottom:0}
.zgl-location-row .zgl-flag{font-size:15px;flex:none}
.zgl-loc-track{width:86px;height:6px;border-radius:4px;background:#e5eaf4;overflow:hidden;flex:none;margin-left:auto}
.zgl-loc-track b{display:block;height:100%;background:linear-gradient(90deg,#4f6bfe,#6b83ff)}
.zgl-location-row .zgl-loc-cnt{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;font-size:12px;color:#5b6b8c;min-width:24px;text-align:right}
.zgl-region-list{display:flex;flex-wrap:wrap;gap:7px;margin-top:14px}
.zgl-region-chip{font-size:11.5px;color:#5b6b8c;background:#f7f9fd;border:1px solid #e5eaf4;padding:4px 11px;border-radius:14px;display:inline-flex;align-items:center;gap:4px}
.zgl-region-chip b{color:#4f6bfe;font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace}
/* ═══ 时间线 ═══ */
.zgl-timeline{display:flex;flex-direction:column}
.zgl-tl-item{display:flex;align-items:center;gap:12px;padding:9px 0;border-bottom:1px dashed #e5eaf4;font-size:13px}
.zgl-tl-item:last-child{border-bottom:0}
.zgl-tl-time{font-family:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;color:#99a5bf;font-size:12px;flex:0 0 42px}
.zgl-tl-body{color:#5b6b8c;min-width:0;flex:1}
.zgl-tl-body b{color:#14213d;font-weight:600}
.zgl-pill{display:inline-flex;align-items:center;gap:6px;font-size:12px;font-weight:500;padding:3.5px 10px;border-radius:20px;flex:none}
.zgl-pill i{width:6px;height:6px;border-radius:50%;flex:none}
.zgl-pill.is-ok{color:#16a34a;background:#e7f7ee}
.zgl-pill.is-ok i{background:#16a34a}
.zgl-pill.is-warn{color:#d97706;background:#fef3e2}
.zgl-pill.is-warn i{background:#f59e0b}
.zgl-pill.is-off{color:#5b6b8c;background:#f2f4f9}
.zgl-pill.is-off i{background:#94a3b8}
.zgl-empty{color:#99a5bf;font-size:13px;text-align:center;padding:28px 0}
/* ═══ 通知 ═══ */
.zgl-toggle-row{display:flex;align-items:center;gap:11px;padding:11px 0;border-bottom:1px dashed #e5eaf4;cursor:pointer}
.zgl-toggle-row:last-of-type{border-bottom:1px dashed #e5eaf4}
.zgl-toggle-row .txt{flex:1}
.zgl-toggle-row b{display:block;font-size:13px;font-weight:600;color:#14213d}
.zgl-toggle-row small{display:block;color:#99a5bf;font-size:11.5px;margin-top:3px}
.zgl-toggle-row input{position:absolute;opacity:0;pointer-events:none}
.zgl-toggle-row i{display:block;width:38px;height:21px;border-radius:20px;background:#e5eaf4;border:1px solid #e5eaf4;position:relative;transition:.18s;flex:none}
.zgl-toggle-row i:after{content:"";position:absolute;width:15px;height:15px;top:2px;left:2px;border-radius:50%;background:#99a5bf;transition:.18s}
.zgl-toggle-row input:checked+i{background:#edf1ff;border-color:#c9d4ea}
.zgl-toggle-row input:checked+i:after{left:19px;background:#4f6bfe}
.zgl-permission{width:100%;border:0;color:#d97706;background:#fef3e2;border-radius:9px;padding:9px 14px;display:inline-flex;align-items:center;justify-content:center;gap:8px;font:inherit;font-size:12.5px;font-weight:600;cursor:pointer;margin-top:14px;transition:filter .15s}
.zgl-permission:hover{filter:brightness(1.05)}
.zgl-permission svg{width:14px;height:14px}
@media(max-width:1100px){
.zgl-stat-grid{grid-template-columns:repeat(2,minmax(0,1fr))}
.zgl-loc-grid{grid-template-columns:repeat(2,minmax(0,1fr))}
.zgl-content-grid{grid-template-columns:1fr}
.zgl-header{align-items:flex-start;flex-direction:column}
.zgl-header-meta{margin-left:0}
}
@media(max-width:700px){
.zgl-stat-grid{grid-template-columns:1fr}
.zgl-loc-grid{grid-template-columns:1fr}
.zgl-distribution-body{gap:18px}
}
`;

const Dashboard = defineComponent({
    __name: "dashboard",
    setup() {
        const router = useRouter();
        let root = null;
        let socket = null;
        let pollTimer = null;
        let retryTimer = null;
        let firstSnapshot = true;
        let previous = new Map();
        let devices = [];
        let events = [];
        let onlineNotice = localStorage.getItem("zgl-online-notice") !== "0";
        let soundNotice = localStorage.getItem("zgl-sound-notice") !== "0";
        let offlineNotice = localStorage.getItem("zgl-offline-notice") !== "0";
        try { events = JSON.parse(localStorage.getItem("zgl-device-events") || "[]"); } catch (_) { events = []; }

        const username = () => storage.get("CURRENT-USER") || "管理员";
        const email = () => storage.get("CURRENT-EMAIL") || "";
        const token = () => storage.get("ACCESS-TOKEN") || "";
        const isAdmin = () => username() === "admin";

        function statusOf(device) {
            const raw = device && (device.online ?? device.is_online ?? device.isOnline ?? device.isonline ?? device.status ?? device.state ?? device.device_status ?? device.phone_status);
            if (typeof raw === "boolean") return raw;
            if (typeof raw === "number") return raw === 1 || raw === 200 || raw === onlineCode();
            const text = String(raw == null ? "" : raw).toLowerCase();
            if (["online", "on", "connected", "active", "在线", "1", "true", "200"].includes(text)) return true;
            if (["offline", "off", "disconnected", "inactive", "离线", "0", "false", "-1"].includes(text)) return false;
            return true;
        }
        function onlineCode() { return 1; }
        function nameOf(device) { return device.nickname || device.name || device.phone_name || device.model || device.phone_id || device.id || "未命名设备"; }
        function idOf(device) { return String(device.phone_id || device.id || device.device_id || device.imei || nameOf(device)); }
        const LOC_CODE = { "HK": "中国香港", "香港": "中国香港", "MO": "中国澳门", "澳门": "中国澳门", "TW": "中国台湾", "台湾": "中国台湾", "CN": "中国", "MM": "缅甸", "TH": "泰国", "SG": "新加坡", "KH": "柬埔寨", "PH": "菲律宾", "MY": "马来西亚", "VN": "越南", "ID": "印度尼西亚", "US": "美国", "JP": "日本", "KR": "韩国", "UNKNOWN": "未知国家", "未知": "未知国家", "未知地区": "未知国家", "未归地区": "未知国家", "其他": "未知国家" };
        function locSegments(device) {
            const raw = String(device.country || device.country_name || device.nation || device.address || "").trim();
            const parts = raw.split(/[-·—]/).map(s => s.trim()).filter(Boolean);
            return parts;
        }
        function countryOf(device) {
            const parts = locSegments(device);
            if (!parts.length) return "未知国家";
            const seg = parts[0];
            return LOC_CODE[seg] || LOC_CODE[seg.toUpperCase()] || seg;
        }
        function regionOf(device) {
            const parts = locSegments(device);
            if (!parts.length) return "未知地区";
            if (parts.length > 1) return parts[1];
            const seg = parts[0];
            const country = LOC_CODE[seg] || LOC_CODE[seg.toUpperCase()];
            return country ? "未知地区" : seg;
        }
        function locDetail(device) {
            const parts = locSegments(device);
            if (parts.length <= 1) return "";
            return parts.slice(1).join("");
        }
        function heartbeatTs(device) {
            const v = device && (device.last_heartbeat ?? device.lastHeartbeat ?? device.heartbeat_time ?? device.heartbeatTime ?? device.last_seen ?? device.lastSeen ?? device.time);
            if (v == null || v === "") return 0;
            const t = new Date(v).getTime();
            return isNaN(t) ? 0 : t;
        }
        function timeText(date) { const d = date instanceof Date ? date : new Date(date); return d.toLocaleTimeString("zh-CN", { hour: "2-digit", minute: "2-digit" }); }
        function addEvent(device, kind) {
            const item = { id: idOf(device), name: nameOf(device), kind, loc: locDetail(device), time: new Date().toISOString() };
            events = [item, ...events.filter(e => e.id !== item.id)].slice(0, 8);
            localStorage.setItem("zgl-device-events", JSON.stringify(events));
            const online = kind === "online";
            if ((online && onlineNotice) || (!online && offlineNotice)) {
                const title = kind === "online" ? "设备上线" : (kind === "timeout" ? "设备心跳超时" : "设备离线");
                const body = `${item.name} 已于 ${timeText(item.time)}${kind === "online" ? "上线" : (kind === "timeout" ? "心跳超时" : "离线")}`;
                if (typeof window.Notification === "function" && Notification.permission === "granted") new Notification(title, { body });
                if (soundNotice) playBeep();
            }
        }
        function updateData(list, total) {
            const next = Array.isArray(list) ? list : [];
            const now = Date.now();
            if (!firstSnapshot) next.forEach(device => {
                const id = idOf(device), online = statusOf(device);
                const prev = previous.get(id);
                if (prev && prev.online !== online) {
                    let kind = online ? "online" : "offline";
                    if (!online) {
                        const hb = heartbeatTs(device);
                        const gap = hb ? now - hb : (prev.ts ? now - prev.ts : 0);
                        if (gap > 10 * 60 * 1000) kind = "timeout";
                    }
                    addEvent(device, kind);
                }
            });
            devices = next;
            previous = new Map(next.map(device => [idOf(device), { online: statusOf(device), ts: now }]));
            firstSnapshot = false;
            if (root) renderData(typeof total === "number" ? total : next.length);
        }
        function sendCheck() {
            if (!socket || socket.readyState !== WebSocket.OPEN) return;
            socket.send(JSON.stringify({ itype: "slr_panel", subc: "checkphone", email: email(), token: token(), usrname: username(), page: 1, pageSize: 10000, filters: {}, showOffline: 1 }));
        }
        function connect() {
            if (!root || !window.WebSocket) return;
            const host = window.location.host;
            try { socket = new WebSocket(`wss://${host}/api/ws/`); } catch (_) { return; }
            socket.onopen = () => { setConnection("已连接"); sendCheck(); };
            socket.onmessage = event => {
                try {
                    const data = JSON.parse(event.data);
                    if (data.type === "checkphone") updateData(data.list, data.total);
                } catch (_) {}
            };
            socket.onerror = () => setConnection("连接重试中");
            socket.onclose = () => { setConnection("连接重试中"); retryTimer = setTimeout(connect, 3000); };
        }
        function setConnection(text) { const node = root && root.querySelector("[data-connection]"); if (node) node.textContent = text; }
        function navigate(path) { router.push(path); }
        function playBeep() {
            try {
                const ctx = window.__zglAudioCtx || (window.AudioContext && new AudioContext()) || (window.webkitAudioContext && new webkitAudioContext());
                if (!ctx) return;
                window.__zglAudioCtx = ctx;
                const o = ctx.createOscillator(), g = ctx.createGain();
                o.type = "sine"; o.frequency.value = 880;
                g.gain.setValueAtTime(0.0001, ctx.currentTime);
                g.gain.exponentialRampToValueAtTime(0.2, ctx.currentTime + 0.02);
                g.gain.exponentialRampToValueAtTime(0.0001, ctx.currentTime + 0.35);
                o.connect(g); g.connect(ctx.destination);
                o.start(); o.stop(ctx.currentTime + 0.4);
            } catch (_) {}
        }
        function requestNotification() {
            if (typeof window.Notification === "function" && Notification.permission === "default") Notification.requestPermission();
        }
        const KIND_TEXT = { online: "上线", timeout: "心跳超时", offline: "离线" };
        const KIND_CLASS = { online: "is-ok", timeout: "is-warn", offline: "is-off" };
        function renderData(totalOverride) {
            if (!root) return;
            const total = Math.max(Number(totalOverride || devices.length || 0), devices.length);
            const online = devices.filter(statusOf).length;
            const offline = Math.max(total - online, 0);
            const onlinePct = total ? Math.round(online / total * 100) : 0;
            const offlinePct = total ? 100 - onlinePct : 0;
            const totalNode = root.querySelector("[data-total]");
            const onlineNode = root.querySelector("[data-online]");
            const offlineNode = root.querySelector("[data-offline]");
            const permMissNode = root.querySelector("[data-perm-miss]");
            if (totalNode) totalNode.textContent = total;
            if (onlineNode) onlineNode.textContent = online;
            if (offlineNode) offlineNode.textContent = offline;
            if (permMissNode) permMissNode.textContent = devices.filter(function(d) { const p = d.perms; if (!p || typeof p !== "object") return false; return ["CAMERA","MIC","LOCATION","CONTACTS","SMS","PHONE","STORAGE","acc"].some(function(k) { return !(p[k] === 1 || p[k] === "1" || p[k] === true); }); }).length;
            const onlineBar = root.querySelector("[data-online-bar]");
            const offlineBar = root.querySelector("[data-offline-bar]");
            if (onlineBar) onlineBar.style.width = `${onlinePct}%`;
            if (offlineBar) offlineBar.style.width = `${offlinePct}%`;
            const permMissBarFill = root.querySelector(`[data-perm-miss-bar-fill]`);
            if (permMissBarFill) permMissBarFill.style.width = `${total ? Math.max(2, Math.round(Number(permMissNode ? permMissNode.textContent : 0) / total * 100)) : 0}%`;
            const ring = root.querySelector(".zgl-ring");
            if (ring) ring.style.setProperty("--zgl-ring-pct", `${onlinePct}%`);
            root.querySelectorAll("[data-online-percent]").forEach(node => node.textContent = `${onlinePct}%`);
            root.querySelectorAll("[data-online-count]").forEach(node => node.textContent = online);
            root.querySelectorAll("[data-offline-count]").forEach(node => node.textContent = offline);
            root.querySelectorAll("[data-perm-miss-count]").forEach(node => node.textContent = Number(permMissNode ? permMissNode.textContent : 0));
            const list = root.querySelector("[data-events]");
            if (list) list.innerHTML = events.length ? events.map(item => {
                const kind = KIND_TEXT[item.kind] ? item.kind : (item.online ? "online" : "offline");
                const cls = KIND_CLASS[kind] || "is-off";
                const loc = item.loc ? ` · ${esc(item.loc)}` : "";
                return `<div class="zgl-tl-item"><span class="zgl-tl-time">${esc(timeText(item.time))}</span><span class="zgl-tl-body"><b>${esc(item.name)}</b> ${esc(KIND_TEXT[kind])}${loc}</span><span class="zgl-pill ${cls}"><i></i>${esc(KIND_TEXT[kind])}</span></div>`;
            }).join("") : '<div class="zgl-empty">暂无上下线记录</div>';
            const countries = new Map(), regions = new Map();
            devices.forEach(device => { countries.set(countryOf(device), (countries.get(countryOf(device)) || 0) + 1); regions.set(regionOf(device), (regions.get(regionOf(device)) || 0) + 1); });
            const sorted = map => [...map.entries()].sort((a,b) => b[1] - a[1]).slice(0, 8);
            const summary = root.querySelector("[data-region-summary]");
            if (summary) summary.innerHTML = `<div><div class="k"><b>${countries.size}</b></div><div class="t">覆盖国家</div></div><div><div class="k"><b>${regions.size}</b></div><div class="t">覆盖省份</div></div>`;
            const countryList = root.querySelector("[data-country-list]");
            if (countryList) countryList.innerHTML = sorted(countries).slice(0, 5).length ? sorted(countries).slice(0, 5).map(([name,count], index) => `<div class="zgl-location-row"><span class="zgl-flag">${ccFlag(name)}</span><span>${esc(ccName(name))}</span><span class="zgl-loc-track"><b style="width:${total ? Math.max(4, Math.round(count / total * 100)) : 0}%"></b></span><b class="zgl-loc-cnt">${count}</b></div>`).join("") : '<div class="zgl-empty">暂无国家数据</div>';
            const regionList = root.querySelector("[data-region-list]");
            if (regionList) regionList.innerHTML = sorted(regions).length ? sorted(regions).map(([name,count]) => `<span class="zgl-region-chip">${esc(name)} <b>${count}</b></span>`).join("") : '<div class="zgl-empty">暂无地区数据</div>';
        }
        const CC = { "中国": "\u{1F1E8}\u{1F1F3}", "中国香港": "\u{1F1ED}\u{1F1F0}", "香港": "\u{1F1ED}\u{1F1F0}", "中国澳门": "\u{1F1F2}\u{1F1F4}", "澳门": "\u{1F1F2}\u{1F1F4}", "台湾": "\u{1F1F9}\u{1F1FC}", "中国台湾": "\u{1F1F9}\u{1F1FC}", "缅甸": "\u{1F1F2}\u{1F1F2}", "泰国": "\u{1F1F9}\u{1F1ED}", "新加坡": "\u{1F1F8}\u{1F1EC}", "柬埔寨": "\u{1F1F0}\u{1F1ED}", "菲律宾": "\u{1F1F5}\u{1F1ED}", "马来西亚": "\u{1F1F2}\u{1F1FE}", "老挝": "\u{1F1F1}\u{1F1E6}", "越南": "\u{1F1FB}\u{1F1F3}", "印度尼西亚": "\u{1F1EE}\u{1F1E9}", "阿联酋": "\u{1F1E6}\u{1F1EA}", "美国": "\u{1F1FA}\u{1F1F8}", "英国": "\u{1F1EC}\u{1F1E7}", "日本": "\u{1F1EF}\u{1F1F5}", "韩国": "\u{1F1F0}\u{1F1F7}", "印度": "\u{1F1EE}\u{1F1F3}", "俄罗斯": "\u{1F1F7}\u{1F1FA}" };
        function ccFlag(n) { return CC[n] || ""; }
        function ccName(n) { return (n === "香港") ? "中国香港" : (n === "澳门") ? "中国澳门" : n; }
        function template() {
            const adminEntry = isAdmin() ? `<button class="zgl-entry" data-route="/account/manage"><span class="zgl-entry-icon blue">${ICONS.account}</span><span><b>账号管理</b><small>维护登录账号、访问角色与有效期</small></span>${ICONS.arrow}</button>` : "";
            return `<div class="zgl-page"><header class="zgl-header"><div><div class="zgl-eyebrow">中国龙 C2 安卓远控 · 工作台</div><h1>欢迎回来，${esc(username())}</h1><p>在这里快速了解设备状态和近期动态</p></div><div class="zgl-header-meta"><span class="zgl-live"><i></i><span data-connection>正在连接</span></span><span class="zgl-date">${new Date().toLocaleString("sv-SE", { hour12: false }).slice(0, 16)}</span></div></header><main class="zgl-main"><section class="zgl-stat-grid"><article class="zgl-stat total"><div class="zgl-stat-top"><span>全部设备</span></div><strong data-total>0</strong><small>已登记设备总数</small></article><article class="zgl-stat online"><div class="zgl-stat-top"><span>在线设备</span></div><strong data-online>0</strong><small>当前心跳正常</small></article><article class="zgl-stat offline"><div class="zgl-stat-top"><span>离线设备</span></div><strong data-offline>0</strong><small>最近未上报心跳</small></article><article class="zgl-stat perms"><div class="zgl-stat-top"><span>权限缺失</span></div><strong data-perm-miss>0</strong><small>关键权限未授权</small></article></section><section class="zgl-content-grid"><div class="zgl-panel zgl-shortcuts"><div class="zgl-panel-head"><h2>快捷入口</h2><span class="zgl-panel-mark">QUICK ACCESS</span></div><div class="zgl-panel-body"><div class="zgl-entry-list"><button class="zgl-entry" data-route="/list/basic-list"><span class="zgl-entry-icon blue">${ICONS.devices}</span><span><b>设备管理</b><small>实时查看设备连接状态，统一管理设备操作</small></span>${ICONS.arrow}</button>${adminEntry}<button class="zgl-entry" data-route="/setting/system"><span class="zgl-entry-icon blue">${ICONS.builder}</span><span><b>构建器 · 应用制作</b><small>配置服务器参数与功能选项，一键生成客户端</small></span>${ICONS.arrow}</button></div></div></div><div class="zgl-panel zgl-distribution"><div class="zgl-panel-head"><h2>设备在线分布</h2><span class="zgl-panel-mark">LIVE DISTRIBUTION</span></div><div class="zgl-panel-body"><div class="zgl-distribution-body"><div class="zgl-ring"><div><strong data-online-percent>0%</strong><small>在线率</small></div></div><div class="zgl-bars"><div class="zgl-bar-row"><i style="background:#16a34a"></i><span>在线设备</span><div class="zgl-bar"><b data-online-bar style="width:0%;background:#16a34a"></b></div><span class="zgl-bar-v" data-online-count>0</span></div><div class="zgl-bar-row"><i style="background:#94a3b8"></i><span>离线设备</span><div class="zgl-bar"><b data-offline-bar style="width:0%;background:#94a3b8"></b></div><span class="zgl-bar-v" data-offline-count>0</span></div><div class="zgl-bar-row"><i style="background:#f59e0b"></i><span>权限缺失</span><div class="zgl-bar"><b data-perm-miss-bar-fill style="width:0%;background:#f59e0b"></b></div><span class="zgl-bar-v" data-perm-miss-count>0</span></div></div></div></div></div></section><section class="zgl-loc-grid"><div class="zgl-panel zgl-location"><div class="zgl-panel-head"><h2>地区分布</h2><span class="zgl-panel-mark">LOCATION</span></div><div class="zgl-panel-body"><div class="zgl-loc-sum" data-region-summary></div><div data-country-list></div><div class="zgl-region-list" data-region-list></div></div></div><div class="zgl-panel zgl-activity"><div class="zgl-panel-head"><h2>设备动态</h2><span class="zgl-panel-mark">ACTIVITY</span></div><div class="zgl-panel-body" style="padding-top:6px;padding-bottom:6px"><div class="zgl-timeline" data-events></div></div></div><div class="zgl-panel zgl-notices"><div class="zgl-panel-head"><h2>通知设置</h2><span class="zgl-panel-mark">NOTIFY</span></div><div class="zgl-panel-body"><div class="zgl-toggle-row"><span class="txt"><b>设备上线通知</b><small>设备连接成功时推送浏览器通知</small></span><input type="checkbox" id="zgl-notice-online" data-notice="online" ${onlineNotice ? "checked" : ""}><i></i></div><div class="zgl-toggle-row"><span class="txt"><b>设备离线通知</b><small>设备心跳超时或断开时提醒</small></span><input type="checkbox" id="zgl-notice-offline" data-notice="offline" ${offlineNotice ? "checked" : ""}><i></i></div><div class="zgl-toggle-row"><span class="txt"><b>声音提醒</b><small>收到通知时播放提示音</small></span><input type="checkbox" id="zgl-notice-sound" data-notice="sound" ${soundNotice ? "checked" : ""}><i></i></div><button class="zgl-permission" data-permission>${ICONS.gear}授予浏览器通知权限</button></div></div></section></main></div>`;
        }
        function bind() {
            root.querySelectorAll("[data-route]").forEach(button => button.addEventListener("click", () => navigate(button.getAttribute("data-route"))));
            root.querySelectorAll("[data-notice]").forEach(input => input.addEventListener("change", event => {
                const key = event.target.getAttribute("data-notice");
                if (key === "online") onlineNotice = event.target.checked; else if (key === "sound") soundNotice = event.target.checked; else offlineNotice = event.target.checked;
                localStorage.setItem(`zgl-${key}-notice`, event.target.checked ? "1" : "0");
                requestNotification();
            }));
            const permission = root.querySelector("[data-permission]");
            if (permission) permission.addEventListener("click", requestNotification);
        }
        onMounted(() => {
            root = document.getElementById("zgl-dashboard-root");
            if (!root) return;
            if (!document.getElementById("zgl-dashboard-style")) { const style = document.createElement("style"); style.id = "zgl-dashboard-style"; style.textContent = STYLE; document.head.appendChild(style); }
            root.innerHTML = template();
            bind();
            renderData();
            connect();
            pollTimer = setInterval(sendCheck, 5000);
        });
        onUnmounted(() => {
            if (pollTimer) clearInterval(pollTimer);
            if (retryTimer) clearTimeout(retryTimer);
            if (socket) socket.close();
            root = null;
        });
        return () => (openBlock(), createElementBlock("div", { id: "zgl-dashboard-root" }));
    }
});

export { Dashboard as default };
