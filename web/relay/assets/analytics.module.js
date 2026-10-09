import {
    d as b,
    r as R,
    ay as t,
    s as h
} from "./core.vendor.js";

var TH = "padding:10px 12px;text-align:left;font-weight:650;color:#5b6b8c;white-space:nowrap;letter-spacing:.03em;text-transform:uppercase;font-size:12px;";
var TD = "padding:10px 12px;";
var PANEL = "background:#ffffff;border:1px solid #d8dfeb;border-radius:14px;padding:22px;box-shadow:0 8px 28px rgba(0,0,0,.25);";
var FONT = '"Segoe UI","Microsoft YaHei UI","Microsoft YaHei","PingFang SC","Noto Sans CJK SC",system-ui,-apple-system,sans-serif';

var K = b({
    __name: "sub-stats",
    setup() {
        var data = R(null);
        var loading = R(true);
        var expanded = R("");

        function fetchStats() {
            loading.value = true;
            fetch("/api/SubAccountStats.php", {
                method: "POST", headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ token: (function(){try{return JSON.parse(localStorage.getItem("ACCESS-TOKEN")).value}catch(e){return ""}})() })
            }).then(function(r) { return r.json(); }).then(function(d) {
                if (d.code === 200) data.value = d;
            }).catch(function() {}).finally(function() { loading.value = false; });
        }

        function _card(label, value, color, glow) {
            return t("div", { style: "background:#fbfcfe;border:1px solid #d8dfeb;border-radius:12px;padding:16px;text-align:left;position:relative;overflow:hidden;transition:border-color .2s,box-shadow .2s;" }, [
                t("div", { style: "position:absolute;inset:0 auto 0 0;width:3px;background:" + color + ";box-shadow:0 0 12px " + (glow || color) + "66;" }),
                t("div", { style: "font-size:26px;font-weight:700;color:" + color + ";margin-bottom:4px;font-variant-numeric:tabular-nums;" }, value != null ? String(value) : "-"),
                t("div", { style: "font-size:12px;color:#5b6b8c;letter-spacing:.05em;" }, label)
            ]);
        }

        fetchStats();

        return function() {
            var d = data.value;
            var s = d ? d.summary : null;
            var accounts = d ? (d.accounts || []) : [];

            if (loading.value) {
                return t("div", { style: "padding:16px;" }, [t("div", { style: PANEL + "text-align:center;color:#5b6b8c;" }, "\u52A0\u8F7D\u4E2D...")]);
            }
            if (!s) {
                return t("div", { style: "padding:16px;" }, [t("div", { style: PANEL + "text-align:center;color:#dc2626;" }, "\u52A0\u8F7D\u5931\u8D25\uFF0C\u8BF7\u5237\u65B0")]);
            }

            var rows = [];
            for (var i = 0; i < accounts.length; i++) {
                var acc = accounts[i];
                var isExp = expanded.value === acc.usrname;
                rows.push(t("tr", { key: acc.usrname, style: "border-bottom:1px solid #e5eaf4;" + (i % 2 ? "background:rgba(255,255,255,.014);" : "") }, [
                    t("td", { style: TD + "font-weight:650;color:#5b6b8c;" }, acc.usrname),
                    t("td", { style: TD + "color:#5b6b8c;" }, acc.email || "-"),
                    t("td", { style: TD }, [t("span", { style: "padding:2px 9px;border-radius:99px;font-size:12px;background:" + (acc.authority === "admin" ? "rgba(91, 107, 140, .14)" : "rgba(52,211,153,.14)") + ";color:" + (acc.authority === "admin" ? "#fdf3e3" : "#16a34a") + ";font-weight:600;border:1px solid " + (acc.authority === "admin" ? "rgba(91, 107, 140, .35)" : "rgba(52,211,153,.35)") + ";" }, acc.authority === "admin" ? "\u7BA1\u7406\u5458" : "\u5BA2\u6237")]),
                    t("td", { style: TD + "color:#5b6b8c;font-variant-numeric:tabular-nums;" }, acc.expire || "-"),
                    t("td", { style: TD + "font-weight:650;color:#6b83ff;font-variant-numeric:tabular-nums;" }, String(acc.total_devices)),
                    t("td", { style: TD + "font-weight:550;color:" + (acc.online_count > 0 ? "#16a34a" : "#5b6b8c") + ";" }, String(acc.online_count)),
                    t("td", { style: TD + "font-weight:550;color:#dc2626;" }, String(acc.reassigned_from_gf)),
                    t("td", { style: TD + "color:#5b6b8c;white-space:nowrap;" }, acc.last_active || "-"),
                    t("td", { style: TD }, [t("button", { style: "padding:4px 12px;border:1px solid #c9d4ea;border-radius:8px;background:transparent;font-size:12px;cursor:pointer;color:#5b6b8c;", onClick: function() { var u = acc.usrname; expanded.value = expanded.value === u ? "" : u; } }, isExp ? "\u6536\u8D77" : "\u8BBE\u5907\u5217\u8868")])
                ]));
                if (isExp) {
                    var devs = acc.devices || [];
                    if (devs.length > 0) {
                        var devRows = [];
                        for (var j = 0; j < devs.length; j++) {
                            var dv = devs[j];
                            devRows.push(t("tr", { key: dv.phone_id, style: "border-bottom:1px solid #e5eaf4;" }, [
                                t("td", { style: "padding:6px 8px;font-family:monospace;font-size:11px;color:#5b6b8c;" }, dv.phone_id || ""),
                                t("td", { style: "padding:6px 8px;color:#5b6b8c;" }, dv.phone_name || "-"),
                                t("td", { style: "padding:6px 8px;color:#5b6b8c;" }, dv.model || "-"),
                                t("td", { style: "padding:6px 8px;color:#5b6b8c;" }, dv.country || "-"),
                                t("td", { style: "padding:6px 8px;color:#5b6b8c;" }, dv.install_date || "-"),
                                t("td", { style: "padding:6px 8px;" }, [t("span", { style: "display:inline-block;width:8px;height:8px;border-radius:50%;background:" + (dv.isonline === "1" ? "#16a34a" : "#b6c2d4") + ";box-shadow:0 0 6px " + (dv.isonline === "1" ? "rgba(52,211,153,.6)" : "transparent") + ";" })]),
                                t("td", { style: "padding:6px 8px;color:#5b6b8c;white-space:nowrap;" }, dv.last_ping || "-")
                            ]));
                        }
                        rows.push(t("tr", { key: acc.usrname + "_d" }, [t("td", { colspan: "9", style: "padding:0 12px 12px 40px;background:rgba(91, 107, 140, .03);" }, [
                            t("table", { style: "width:100%;border-collapse:collapse;font-size:12px;margin-top:8px;" }, [
                                t("thead", null, [t("tr", { style: "border-bottom:1px solid #e5eaf4;" }, [
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u8BBE\u5907ID"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u5907\u6CE8"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u578B\u53F7"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u56FD\u5BB6"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u5B89\u88C5\u65E5\u671F"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u5728\u7EBF"),
                                    t("th", { style: "padding:6px 8px;text-align:left;color:#5b6b8c;font-weight:550;" }, "\u6700\u540E\u5FC3\u8DF3")
                                ])]),
                                t("tbody", null, devRows)
                            ])
                        ])]));
                    } else {
                        rows.push(t("tr", { key: acc.usrname + "_e" }, [t("td", { colspan: "9", style: "padding:12px 40px;background:rgba(91, 107, 140, .03);color:#5b6b8c;font-size:12px;" }, "\u8BE5\u8D26\u53F7\u6682\u65E0\u8BBE\u5907")]));
                    }
                }
            }

            return t("div", { style: "padding:16px;font-family:" + FONT + ";" }, [
                t("div", { style: PANEL }, [
                    t("div", { style: "display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;margin:0 0 20px;" }, [
                        t("div", null, [
                            t("div", { style: "font-size:12px;letter-spacing:.14em;text-transform:uppercase;background:linear-gradient(90deg,#8a9bff,#4f6bfe);-webkit-background-clip:text;background-clip:text;color:transparent;font-weight:700;margin:0 0 6px;" }, "SUB ACCOUNTS"),
                            t("h2", { style: "margin:0;font-size:18px;font-weight:700;color:#5b6b8c;" }, "\u5B50\u53F7\u7EDF\u8BA1")
                        ]),
                        t("button", { style: "padding:6px 16px;border:1px solid #c9d4ea;border-radius:8px;background:transparent;color:#5b6b8c;font-size:13px;cursor:pointer;", onClick: function() { fetchStats(); } }, "\u5237\u65B0\u6570\u636E")
                    ]),
                    t("div", { style: "display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:12px;margin-bottom:24px;" }, [
                        _card("\u5B50\u8D26\u53F7\u603B\u6570", s.sub_account_count, "#8a9bff", "#6b83ff"),
                        _card("\u8BBE\u5907\u603B\u6570", s.total_devices, "#16a34a"),
                        _card("\u4E3B\u8D26\u53F7\u8BBE\u5907", s.gf_devices, "#d97706"),
                        _card("\u5B50\u8D26\u53F7\u8BBE\u5907", s.sub_devices, "#4f6bfe"),
                        _card("\u5DF2\u4E0B\u53D1\u603B\u6570", s.total_reassigned, "#dc2626")
                    ]),
                    t("div", { style: "overflow-x:auto;border:1px solid #e5eaf4;border-radius:10px;" }, [
                        t("table", { style: "width:100%;border-collapse:collapse;font-size:13px;" }, [
                            t("thead", null, [t("tr", { style: "background:#f7f9fd;border-bottom:1px solid #e5eaf4;" }, [
                                t("th", { style: TH }, "\u5B50\u8D26\u53F7"), t("th", { style: TH }, "\u90AE\u7BB1"), t("th", { style: TH }, "\u6743\u9650"),
                                t("th", { style: TH }, "\u5230\u671F"), t("th", { style: TH }, "\u8BBE\u5907\u603B\u6570"), t("th", { style: TH }, "\u5728\u7EBF\u6570"),
                                t("th", { style: TH }, "\u4E0B\u53D1\u6570"), t("th", { style: TH }, "\u6700\u8FD1\u6D3B\u8DC3"), t("th", { style: TH }, "\u64CD\u4F5C")
                            ])]),
                            t("tbody", null, rows.length > 0 ? rows : [t("tr", null, [t("td", { colspan: "9", style: "padding:40px;text-align:center;color:#5b6b8c;" }, "\u6682\u65E0\u5B50\u8D26\u53F7")])])
                        ])
                    ])
                ])
            ]);
        };
    }
});

export { K as default };
