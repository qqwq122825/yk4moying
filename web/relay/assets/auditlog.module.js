import {
    d as b,
    r as R,
    ay as t,
    s as h
} from "./core.vendor.js";

const ACTION_MAP = {
    login: "\u767B\u5F55", login_fail: "\u767B\u5F55\u5931\u8D25", login_captcha_fail: "\u9A8C\u8BC1\u7801\u9519\u8BEF", login_blocked: "\u767B\u5F55\u9501\u5B9A", join_device: "\u8FDB\u5165\u8BBE\u5907", leave_device: "\u79BB\u5F00\u8BBE\u5907",
    reassign: "\u5355\u6B21\u4E0B\u53D1", batch_reassign: "\u6279\u91CF\u4E0B\u53D1", enable_device: "\u542F\u7528\u8BBE\u5907", disable_device: "\u7981\u7528\u8BBE\u5907",
    disconnect_device: "\u65AD\u5F00\u8BBE\u5907", delete_device: "\u5220\u9664\u8BBE\u5907", edit_device: "\u4FEE\u6539\u8BBE\u5907",
    update_status: "\u66F4\u65B0\u72B6\u6001", logout: "\u767B\u51FA"
};
const ACTION_COLORS = {
    login: "#6b83ff", login_fail: "#dc2626", login_captcha_fail: "#d97706", login_blocked: "#fdf3e3", join_device: "#16a34a", leave_device: "#d97706", reassign: "#dc2626",
    batch_reassign: "#dc2626", enable_device: "#16a34a", disable_device: "#d97706", disconnect_device: "#dc2626",
    delete_device: "#dc2626", logout: "#5b6b8c"
};
const TH = "padding:10px 12px;text-align:left;font-weight:650;color:#5b6b8c;white-space:nowrap;letter-spacing:.03em;text-transform:uppercase;font-size:12px;";
const TD = "padding:10px 12px;";
const PANEL = "background:#ffffff;border:1px solid #d8dfeb;border-radius:14px;padding:22px;box-shadow:0 8px 28px rgba(0,0,0,.25);";
const FIELD = "padding:6px 10px;border:1px solid #eef1f7;border-radius:8px;font-size:13px;height:32px;box-sizing:border-box;outline:none;background:#fbfcfe;color:#5b6b8c;";
const GHOST = "padding:6px 16px;border:1px solid #c9d4ea;border-radius:8px;background:transparent;color:#5b6b8c;font-size:13px;cursor:pointer;height:32px;";
const FONT = '"Segoe UI","Microsoft YaHei UI","Microsoft YaHei","PingFang SC","Noto Sans CJK SC",system-ui,-apple-system,sans-serif';

const K = b({
    __name: "operation-log",
    setup() {
        const logs = R([]);
        const total = R(0);
        const page = R(1);
        const pageSize = R(20);
        const loading = R(false);
        const fOperator = R("");
        const fAction = R("");
        const fDevice = R("");
        const fDateFrom = R("");
        const fDateTo = R("");

        function fetchLogs() {
            loading.value = true;
            fetch("/api/OperationLog.php", {
                method: "POST", headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ action: "list", token: (function(){try{return JSON.parse(localStorage.getItem("ACCESS-TOKEN")).value}catch(e){return ""}})(), page: page.value, pageSize: pageSize.value, filters: { operator: fOperator.value, action: fAction.value, target_device: fDevice.value, date_from: fDateFrom.value, date_to: fDateTo.value } })
            }).then(function(r) { return r.json(); }).then(function(d) {
                console.log("[OperationLog] API response:", d.code, "logs count:", (d.logs||[]).length);
                if (d.code === 200) { logs.value = d.logs || []; total.value = d.total || 0; }
                console.log("[OperationLog] After set: logs.value.length =", logs.value.length);
            }).catch(function(err) { console.error("[OperationLog] fetch error:", err); }).finally(function() { loading.value = false; });
        }

        fetchLogs();

        return function() {
            var pageCount = Math.ceil(total.value / pageSize.value) || 1;
            return t("div", { style: "padding:16px;font-family:" + FONT + ";" }, [
                t("div", { style: PANEL }, [
                    t("div", { style: "display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;margin:0 0 18px;" }, [
                        t("div", null, [
                            t("div", { style: "font-size:12px;letter-spacing:.14em;text-transform:uppercase;background:linear-gradient(90deg,#8a9bff,#4f6bfe);-webkit-background-clip:text;background-clip:text;color:transparent;font-weight:700;margin:0 0 6px;" }, "AUDIT TRAIL"),
                            t("h2", { style: "margin:0;font-size:18px;font-weight:700;color:#5b6b8c;" }, "\u64CD\u4F5C\u65E5\u5FD7")
                        ]),
                        t("span", { style: "font-size:12px;color:#5b6b8c;border:1px solid #d8dfeb;background:#fbfcfe;padding:4px 10px;border-radius:99px;" }, "\u5B9E\u65F6\u5BA1\u8BA1\u8BB0\u5F55")
                    ]),
                    t("div", { style: "display:flex;gap:10px;flex-wrap:wrap;margin-bottom:16px;align-items:center;" }, [
                        t("input", { placeholder: "\u64CD\u4F5C\u4EBA", value: fOperator.value, style: FIELD + "width:120px;", onInput: function(e) { fOperator.value = e.target.value; } }),
                        t("select", { value: fAction.value, style: FIELD + "width:auto;", onChange: function(e) { fAction.value = e.target.value; } }, [
                            t("option", { value: "" }, "\u5168\u90E8\u7C7B\u578B"),
                            t("option", { value: "login" }, "\u767B\u5F55"),
                            t("option", { value: "login_fail" }, "\u767B\u5F55\u5931\u8D25"),
                            t("option", { value: "login_blocked" }, "\u767B\u5F55\u9501\u5B9A"),
                            t("option", { value: "join_device" }, "\u8FDB\u5165\u8BBE\u5907"),
                            t("option", { value: "leave_device" }, "\u79BB\u5F00\u8BBE\u5907"),
                            t("option", { value: "reassign" }, "\u5355\u6B21\u4E0B\u53D1"),
                            t("option", { value: "batch_reassign" }, "\u6279\u91CF\u4E0B\u53D1"),
                            t("option", { value: "enable_device" }, "\u542F\u7528\u8BBE\u5907"),
                            t("option", { value: "disable_device" }, "\u7981\u7528\u8BBE\u5907"),
                            t("option", { value: "disconnect_device" }, "\u65AD\u5F00\u8BBE\u5907"),
                            t("option", { value: "delete_device" }, "\u5220\u9664\u8BBE\u5907")
                        ]),
                        t("input", { placeholder: "\u8BBE\u5907ID", value: fDevice.value, style: FIELD + "width:120px;", onInput: function(e) { fDevice.value = e.target.value; } }),
                        t("input", { type: "date", value: fDateFrom.value, style: FIELD, onInput: function(e) { fDateFrom.value = e.target.value; } }),
                        t("span", { style: "color:#5b6b8c;font-size:13px;" }, "\u81F3"),
                        t("input", { type: "date", value: fDateTo.value, style: FIELD, onInput: function(e) { fDateTo.value = e.target.value; } }),
                        t("button", { style: "padding:6px 16px;border:none;border-radius:8px;background:linear-gradient(135deg,#6b83ff,#8a9bff);color:#14213d;font-size:13px;cursor:pointer;height:32px;font-weight:600;box-shadow:0 4px 14px rgba(91, 107, 140, .3);", onClick: function() { page.value = 1; fetchLogs(); } }, "\u67E5\u8BE2"),
                        t("button", { style: GHOST, onClick: function() { fOperator.value = ""; fAction.value = ""; fDevice.value = ""; fDateFrom.value = ""; fDateTo.value = ""; page.value = 1; fetchLogs(); } }, "\u91CD\u7F6E")
                    ]),
                    t("div", { style: "overflow-x:auto;border:1px solid #e5eaf4;border-radius:10px;" }, [
                        t("table", { style: "width:100%;border-collapse:collapse;font-size:13px;" }, [
                            t("thead", null, [
                                t("tr", { style: "background:#f7f9fd;border-bottom:1px solid #e5eaf4;" }, [
                                    t("th", { style: TH }, "\u65F6\u95F4"), t("th", { style: TH }, "\u64CD\u4F5C\u4EBA"), t("th", { style: TH }, "\u64CD\u4F5C\u7C7B\u578B"),
                                    t("th", { style: TH }, "\u76EE\u6807\u8BBE\u5907"), t("th", { style: TH }, "\u76EE\u6807\u7528\u6237"), t("th", { style: TH }, "\u8BE6\u60C5"), t("th", { style: TH }, "IP")
                                ])
                            ]),
                            t("tbody", null, logs.value.length === 0
                                ? [t("tr", null, [t("td", { colspan: "7", style: "padding:40px;text-align:center;color:#5b6b8c;" }, loading.value ? "\u52A0\u8F7D\u4E2D..." : "\u6682\u65E0\u65E5\u5FD7")])]
                                : logs.value.map(function(log, i) {
                                    var c = ACTION_COLORS[log.action] || "#fdf3e3";
                                    return t("tr", { key: log.id, style: "border-bottom:1px solid #e5eaf4;" + (i % 2 ? "background:rgba(255,255,255,.014);" : "") }, [
                                        t("td", { style: TD + "white-space:nowrap;color:#5b6b8c;font-variant-numeric:tabular-nums;" }, log.created_at || ""),
                                        t("td", { style: TD + "font-weight:550;color:#5b6b8c;" }, log.operator || ""),
                                        t("td", { style: TD }, [t("span", { style: "display:inline-block;padding:2px 9px;border-radius:99px;font-size:12px;font-weight:600;color:" + c + ";background:" + c + "1c;border:1px solid " + c + "40;" }, ACTION_MAP[log.action] || log.action)]),
                                        t("td", { style: TD + "font-family:monospace;font-size:12px;color:#5b6b8c;max-width:180px;overflow:hidden;text-overflow:ellipsis;" }, log.target_device || "-"),
                                        t("td", { style: TD + "color:#16a34a;font-weight:550;" }, log.target_user || "-"),
                                        t("td", { style: TD + "color:#5b6b8c;max-width:200px;overflow:hidden;text-overflow:ellipsis;" }, log.detail || "-"),
                                        t("td", { style: TD + "font-family:monospace;font-size:12px;color:#5b6b8c;" }, log.ip || "-")
                                    ]);
                                })
                            )
                        ])
                    ]),
                    total.value > pageSize.value ? t("div", { style: "display:flex;justify-content:center;align-items:center;gap:8px;margin-top:16px;" }, [
                        t("button", { disabled: page.value <= 1, style: "padding:4px 14px;border:1px solid #c9d4ea;border-radius:8px;background:transparent;color:#5b6b8c;cursor:pointer;font-size:13px;" + (page.value <= 1 ? "opacity:0.4;" : ""), onClick: function() { if (page.value > 1) { page.value--; fetchLogs(); } } }, "\u4E0A\u4E00\u9875"),
                        t("span", { style: "font-size:13px;color:#5b6b8c;" }, page.value + " / " + pageCount + " \u9875\uFF08\u5171 " + total.value + " \u6761\uFF09"),
                        t("button", { disabled: page.value >= pageCount, style: "padding:4px 14px;border:1px solid #c9d4ea;border-radius:8px;background:transparent;color:#5b6b8c;cursor:pointer;font-size:13px;" + (page.value >= pageCount ? "opacity:0.4;" : ""), onClick: function() { if (page.value < pageCount) { page.value++; fetchLogs(); } } }, "\u4E0B\u4E00\u9875")
                    ]) : t("span")
                ])
            ]);
        };
    }
});

export { K as default };
