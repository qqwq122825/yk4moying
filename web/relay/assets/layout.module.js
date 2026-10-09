var y = (v, u, s) => new Promise((_, p) => {
    var a = r => {
            try {
                m(s.next(r))
            } catch (l) {
                p(l)
            }
        },
        x = r => {
            try {
                m(s.throw(r))
            } catch (l) {
                p(l)
            }
        },
        m = r => r.done ? _(r.value) : Promise.resolve(r.value).then(a, x);
    m((s = s.apply(v, u)).next())
});
import {
    d as b,
    o as U,
    c as E,
    a as t,
    r as R,
    u as z,
    b as B,
    e as I,
    f as O,
    g as k,
    t as L,
    h as o,
    w as n,
    _ as j,
    i as S,
    j as T,
    s as h,
    C as A,
    k as M,
    l as q,
    A as D,
    m as K,
    N as P,
    n as V,
    p as H,
    q as Y,
    B as F,
    v as G
} from "./core.vendor.js";
import {
    w as $
} from "./site.config.js";
import {
    L as J
} from "./vendor.chunk.js";
const Q = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 512 512"
    },
    W = t("path", {
        d: "M336 208v-95a80 80 0 0 0-160 0v95",
        fill: "none",
        stroke: "currentColor",
        "stroke-linecap": "round",
        "stroke-linejoin": "round",
        "stroke-width": "32"
    }, null, -1),
    X = t("rect", {
        x: "96",
        y: "208",
        width: "320",
        height: "272",
        rx: "48",
        ry: "48",
        fill: "none",
        stroke: "currentColor",
        "stroke-linecap": "round",
        "stroke-linejoin": "round",
        "stroke-width": "32"
    }, null, -1),
    Z = [W, X],
    ee = b({
        name: "LockClosedOutline",
        render: function(u, s) {
            return U(), E("svg", Q, Z)
        }
    }),
    oe = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 512 512"
    },
    te = t("path", {
        d: "M344 144c-3.92 52.87-44 96-88 96s-84.15-43.12-88-96c-4-55 35-96 88-96s92 42 88 96z",
        fill: "none",
        stroke: "currentColor",
        "stroke-linecap": "round",
        "stroke-linejoin": "round",
        "stroke-width": "32"
    }, null, -1),
    se = t("path", {
        d: "M256 304c-87 0-175.3 48-191.64 138.6C62.39 453.52 68.57 464 80 464h352c11.44 0 17.62-10.48 15.65-21.4C431.3 352 343 304 256 304z",
        fill: "none",
        stroke: "currentColor",
        "stroke-miterlimit": "10",
        "stroke-width": "32"
    }, null, -1),
    ne = [te, se],
    re = b({
        name: "PersonOutline",
        render: function(u, s) {
            return U(), E("svg", oe, ne)
        }
    }),
    ae = {
        class: "view-account"
    },
    le = {
        class: "view-account-container"
    },
    ie = {
        class: "view-account-top"
    },
    ce = {
        class: "view-account-top-logo"
    },
    ue = ["src"],
    de = {
        class: "view-account-top-desc",
        style: {
            "font-size": "22px",
            "font-weight": "600",
            "color": "#333",
            "letter-spacing": "1px"
        }
    },
    _e = {
        class: "view-account-form"
    },
    pe = {
        class: "flex justify-between"
    },
    me = {
        class: "flex-initial"
    },
    fe = b({
        __name: "index",
        setup(v) {
            const u = R(),
                s = z(),
                _ = R(!1),
                p = R(!0),
                a = B({
                    username: "",
                    password: "",
                    captcha: "",
                    isCaptcha: !0
                }),
                captchaImg = R(""),
                x = {
                    username: {
                        required: !0,
                        message: "请输入用户名",
                        trigger: "blur"
                    },
                    password: {
                        required: !0,
                        message: "请输入密码",
                        trigger: "blur"
                    }
                },
                m = I(),
                r = O();

            function loadCaptcha() {
                fetch("/api/Captcha.php?t=" + Date.now()).then(function(r){return r.json()}).then(function(d){
                    if(d.code===200 && d.image) captchaImg.value = d.image;
                }).catch(function(){});
            }
            loadCaptcha();

            const l = N => y(this, null, function*() {
                    N.preventDefault(), u.value.validate(e => y(this, null, function*() {
                        var f;
                        if (e) s.error("请填写完整信息");
                        else {
                            if (!a.captcha || a.captcha.length < 4) { s.error("请输入验证码"); return; }
                            const {
                                username: g,
                                password: d
                            } = a;
                            s.loading("登录中..."), _.value = !0;
                            try {
                                const i = yield J(g, d, a.captcha);
                                if (s.destroyAll(), i && i.code === "SUCCESS") {
                                    const c = i.result;
                                    h.set(A, c.usrname), h.set(M, c.userid), h.set(q, c.email), h.set(D, c.token), h.set(K, c.authorty);
                                    const C = decodeURIComponent(((f = r.query) == null ? void 0 : f.redirect) || "/dashboard/home");
                                    window.location.href = C
                                } else { s.error(i.message || "登录失败"); a.captcha = ""; loadCaptcha(); }
                            } catch (i) {
                                s.error("登录请求失败，请稍后重试"); a.captcha = ""; loadCaptcha();
                            } finally {
                                _.value = !1
                            }
                        }
                    }))
                });
            return (N, e) => {
                const f = P,
                    g = V,
                    d = H,
                    i = Y,
                    c = F,
                    C = j;
                return U(), E("div", ae, [e[6] || (e[6] = t("div", {
                    class: "view-account-header"
                }, null, -1)), t("div", le, [t("div", ie, [t("div", ce, [t("img", {
                    src: k($).loginImage,
                    alt: ""
                }, null, 8, ue)]), t("div", de, L(k($).loginDesc || "中国龙C2安卓远控"), 1)]), t("div", _e, [o(C, {
                    ref_key: "formRef",
                    ref: u,
                    "label-placement": "left",
                    size: "large",
                    model: a,
                    rules: x
                }, {
                    default: n(() => [o(d, {
                        path: "username"
                    }, {
                        default: n(() => [o(g, {
                            value: a.username,
                            "onUpdate:value": e[0] || (e[0] = w => a.username = w),
                            placeholder: "请输入用户名",
                            onKeyup: S(l, ["enter"])
                        }, {
                            prefix: n(() => [o(f, {
                                size: "18",
                                color: "#808695"
                            }, {
                                default: n(() => [o(k(re))]),
                                _: 1
                            })]),
                            _: 1
                        }, 8, ["value"])]),
                        _: 1
                    }), o(d, {
                        path: "password"
                    }, {
                        default: n(() => [o(g, {
                            value: a.password,
                            "onUpdate:value": e[1] || (e[1] = w => a.password = w),
                            type: "password",
                            showPasswordOn: "click",
                            placeholder: "请输入密码",
                            onKeyup: S(l, ["enter"])
                        }, {
                            prefix: n(() => [o(f, {
                                size: "18",
                                color: "#808695"
                            }, {
                                default: n(() => [o(k(ee))]),
                                _: 1
                            })]),
                            _: 1
                        }, 8, ["value"])]),
                        _: 1
                    }), o(d, null, {
                        default: n(() => [t("div", { style: "display:flex;align-items:center;gap:8px;" }, [
                            o(g, {
                                value: a.captcha,
                                "onUpdate:value": e[2] || (e[2] = w => a.captcha = w),
                                placeholder: "请输入验证码",
                                style: "flex:1;",
                                onKeyup: S(l, ["enter"])
                            }, null, 8, ["value"]),
                            t("img", {
                                src: captchaImg.value,
                                alt: "验证码",
                                style: "height:34px;border-radius:4px;cursor:pointer;border:1px solid #e0e0e0;",
                                onClick: loadCaptcha,
                                title: "点击刷新验证码"
                            }, null, 8, ["src"])
                        ])]),
                        _: 1
                    }), o(d, {
                        class: "default-color"
                    }, {
                        default: n(() => [t("div", pe, [t("div", me, [o(i, {
                            checked: p.value,
                            "onUpdate:checked": e[3] || (e[3] = w => p.value = w)
                        }, {
                            default: n(() => e[4] || (e[4] = [T("自动登录")])),
                            _: 1
                        }, 8, ["checked"])])])]),
                        _: 1
                    }), o(d, null, {
                        default: n(() => [o(c, {
                            type: "primary",
                            onClick: l,
                            size: "large",
                            loading: _.value,
                            block: ""
                        }, {
                            default: n(() => e[5] || (e[5] = [T(" 登录 ")])),
                            _: 1
                        }, 8, ["loading"])]),
                        _: 1
                    })]),
                    _: 1
                }, 8, ["model"])])])])
            }
        }
    }),
    ke = G(fe, [
        ["__scopeId", "data-v-7de6931f"]
    ]);
export {
    ke as
    default
};
