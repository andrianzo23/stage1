/*!
 * jquery.inputmask.bundle.js
 * https://github.com/RobinHerbots/Inputmask
 * Copyright (c) 2010 - 2017 Robin Herbots
 * Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
 * Version: 3.3.11
 */
"use strict"
! function(e) {
    function t(a) {
        if (n[a]) return n[a].exports;
        var i = n[a] = {
            i: a,
            l: !1,
            exports: {}
        };
        return e[a].call(i.exports, i, i.exports, t), i.l = !0, i.exports
    }
    var n = {};
    t.m = e, t.c = n, t.d = function(e, n, a) {
        t.o(e, n) || Object.defineProperty(e, n, {
            configurable: !1,
            enumerable: !0,
            get: a
        })
    }, t.n = function(e) {
        var n = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return t.d(n, "a", n), n
    }, t.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, t.p = "", t(t.s = 3)
}([function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(2)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e) {
        return e
    })
}, function(e, t, n) {
    "use strict";
    var a, i, r, o = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
        return typeof e
    } : function(e) {
        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
    };
    ! function(o) {
        i = [n(0), n(10), n(11)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t, n, a) {
        function i(t, n, o) {
            if (!(this instanceof i)) return new i(t, n, o);
            this.el = a, this.events = {}, this.maskset = a, this.refreshValue = !1, !0 !== o && (e.isPlainObject(t) ? n = t : (n = n || {}).alias = t, this.opts = e.extend(!0, {}, this.defaults, n), this.noMasksCache = n && n.definitions !== a, this.userOptions = n || {}, this.isRTL = this.opts.numericInput, r(this.opts.alias, n, this.opts))
        }

        function r(t, n, o) {
            var s = i.prototype.aliases[t];
            return s ? (s.alias && r(s.alias, a, o), e.extend(!0, o, s), e.extend(!0, o, n), !0) : (null === o.mask && (o.mask = t), !1)
        }

        function s(t, n) {
            function r(t, r, o) {
                var s = !1;
                if (null !== t && "" !== t || ((s = null !== o.regex) ? t = (t = o.regex).replace(/^(\^)(.*)(\$)$/, "$2") : (s = !0, t = ".*")), 1 === t.length && !1 === o.greedy && 0 !== o.repeat && (o.placeholder = ""), o.repeat > 0 || "*" === o.repeat || "+" === o.repeat) {
                    var l = "*" === o.repeat ? 0 : "+" === o.repeat ? 1 : o.repeat;
                    t = o.groupmarker.start + t + o.groupmarker.end + o.quantifiermarker.start + l + "," + o.repeat + o.quantifiermarker.end
                }
                var c, u = s ? "regex_" + o.regex : o.numericInput ? t.split("").reverse().join("") : t;
                return i.prototype.masksCache[u] === a || !0 === n ? (c = {
                    mask: t,
                    maskToken: i.prototype.analyseMask(t, s, o),
                    validPositions: {},
                    _buffer: a,
                    buffer: a,
                    tests: {},
                    metadata: r,
                    maskLength: a
                }, !0 !== n && (i.prototype.masksCache[u] = c, c = e.extend(!0, {}, i.prototype.masksCache[u]))) : c = e.extend(!0, {}, i.prototype.masksCache[u]), c
            }
            if (e.isFunction(t.mask) && (t.mask = t.mask(t)), e.isArray(t.mask)) {
                if (t.mask.length > 1) {
                    t.keepStatic = null === t.keepStatic || t.keepStatic;
                    var o = t.groupmarker.start;
                    return e.each(t.numericInput ? t.mask.reverse() : t.mask, function(n, i) {
                        o.length > 1 && (o += t.groupmarker.end + t.alternatormarker + t.groupmarker.start), i.mask === a || e.isFunction(i.mask) ? o += i : o += i.mask
                    }), o += t.groupmarker.end, r(o, t.mask, t)
                }
                t.mask = t.mask.pop()
            }
            return t.mask && t.mask.mask !== a && !e.isFunction(t.mask.mask) ? r(t.mask.mask, t.mask, t) : r(t.mask, t.mask, t)
        }

        function l(r, s, c) {
            function m(e, t, n) {
                t = t || 0;
                var i, r, o, s = [],
                    l = 0,
                    u = v();
                do {
                    !0 === e && h().validPositions[l] ? (r = (o = h().validPositions[l]).match, i = o.locator.slice(), s.push(!0 === n ? o.input : !1 === n ? r.nativeDef : I(l, r))) : (r = (o = b(l, i, l - 1)).match, i = o.locator.slice(), (!1 === c.jitMasking || l < u || "number" == typeof c.jitMasking && isFinite(c.jitMasking) && c.jitMasking > l) && s.push(!1 === n ? r.nativeDef : I(l, r))), l++
                } while ((Q === a || l < Q) && (null !== r.fn || "" !== r.def) || t > l);
                return "" === s[s.length - 1] && s.pop(), h().maskLength = l + 1, s
            }

            function h() {
                return s
            }

            function g(e) {
                var t = h();
                t.buffer = a, !0 !== e && (t.validPositions = {}, t.p = 0)
            }

            function v(e, t, n) {
                var i = -1,
                    r = -1,
                    o = n || h().validPositions;
                e === a && (e = -1);
                for (var s in o) {
                    var l = parseInt(s);
                    o[l] && (t || !0 !== o[l].generatedInput) && (l <= e && (i = l), l >= e && (r = l))
                }
                return -1 !== i && e - i > 1 || r < e ? i : r
            }

            function y(t, n, i, r) {
                var o, s = t,
                    l = e.extend(!0, {}, h().validPositions),
                    u = !1;
                for (h().p = t, o = n - 1; o >= s; o--) h().validPositions[o] !== a && (!0 !== i && (!h().validPositions[o].match.optionality && function(e) {
                    var t = h().validPositions[e];
                    if (t !== a && null === t.match.fn) {
                        var n = h().validPositions[e - 1],
                            i = h().validPositions[e + 1];
                        return n !== a && i !== a
                    }
                    return !1
                }(o) || !1 === c.canClearPosition(h(), o, v(), r, c)) || delete h().validPositions[o]);
                for (g(!0), o = s + 1; o <= v();) {
                    for (; h().validPositions[s] !== a;) s++;
                    if (o < s && (o = s + 1), h().validPositions[o] === a && M(o)) o++;
                    else {
                        var p = b(o);
                        !1 === u && l[s] && l[s].match.def === p.match.def ? (h().validPositions[s] = e.extend(!0, {}, l[s]), h().validPositions[s].input = p.input, delete h().validPositions[o], o++) : P(s, p.match.def) ? !1 !== R(s, p.input || I(o), !0) && (delete h().validPositions[o], o++, u = !0) : M(o) || (o++, s--), s++
                    }
                }
                g(!0)
            }

            function k(e, t) {
                for (var n, i = e, r = v(), o = h().validPositions[r] || S(0)[0], s = o.alternation !== a ? o.locator[o.alternation].toString().split(",") : [], l = 0; l < i.length && (!((n = i[l]).match && (c.greedy && !0 !== n.match.optionalQuantifier || (!1 === n.match.optionality || !1 === n.match.newBlockMarker) && !0 !== n.match.optionalQuantifier) && (o.alternation === a || o.alternation !== n.alternation || n.locator[o.alternation] !== a && O(n.locator[o.alternation].toString().split(","), s))) || !0 === t && (null !== n.match.fn || /[0-9a-bA-Z]/.test(n.match.def))); l++);
                return n
            }

            function b(e, t, n) {
                return h().validPositions[e] || k(S(e, t ? t.slice() : t, n))
            }

            function x(e) {
                return h().validPositions[e] ? h().validPositions[e] : S(e)[0]
            }

            function P(e, t) {
                for (var n = !1, a = S(e), i = 0; i < a.length; i++)
                    if (a[i].match && a[i].match.def === t) {
                        n = !0;
                        break
                    } return n
            }

            function S(t, n, i) {
                function r(n, i, o, l) {
                    function p(o, l, g) {
                        function v(t, n) {
                            var a = 0 === e.inArray(t, n.matches);
                            return a || e.each(n.matches, function(e, i) {
                                if (!0 === i.isQuantifier && (a = v(t, n.matches[e - 1]))) return !1
                            }), a
                        }

                        function y(t, n, i) {
                            var r, o;
                            if (h().validPositions[t - 1] && i && h().tests[t])
                                for (var s = h().validPositions[t - 1].locator, l = h().tests[t][0].locator, c = 0; c < i; c++)
                                    if (s[c] !== l[c]) return s.slice(i + 1);
                            return (h().tests[t] || h().validPositions[t]) && e.each(h().tests[t] || [h().validPositions[t]], function(e, t) {
                                var s = i !== a ? i : t.alternation,
                                    l = t.locator[s] !== a ? t.locator[s].toString().indexOf(n) : -1;
                                (o === a || l < o) && -1 !== l && (r = t, o = l)
                            }), r ? r.locator.slice((i !== a ? i : r.alternation) + 1) : i !== a ? y(t, n) : a
                        }
                        if (u > 1e4) throw "Inputmask: There is probably an error in your mask definition or in the code. Create an issue on github with an example of the mask you are using. " + h().mask;
                        if (u === t && o.matches === a) return f.push({
                            match: o,
                            locator: l.reverse(),
                            cd: m
                        }), !0;
                        if (o.matches !== a) {
                            if (o.isGroup && g !== o) {
                                if (o = p(n.matches[e.inArray(o, n.matches) + 1], l)) return !0
                            } else if (o.isOptional) {
                                var k = o;
                                if (o = r(o, i, l, g)) {
                                    if (s = f[f.length - 1].match, !v(s, k)) return !0;
                                    d = !0, u = t
                                }
                            } else if (o.isAlternator) {
                                var b, x = o,
                                    P = [],
                                    S = f.slice(),
                                    w = l.length,
                                    A = i.length > 0 ? i.shift() : -1;
                                if (-1 === A || "string" == typeof A) {
                                    var E, C = u,
                                        O = i.slice(),
                                        R = [];
                                    if ("string" == typeof A) R = A.split(",");
                                    else
                                        for (E = 0; E < x.matches.length; E++) R.push(E);
                                    for (var M = 0; M < R.length; M++) {
                                        if (E = parseInt(R[M]), f = [], i = y(u, E, w) || O.slice(), !0 !== (o = p(x.matches[E] || n.matches[E], [E].concat(l), g) || o) && o !== a && R[R.length - 1] < x.matches.length) {
                                            var _ = e.inArray(o, n.matches) + 1;
                                            n.matches.length > _ && (o = p(n.matches[_], [_].concat(l.slice(1, l.length)), g)) && (R.push(_.toString()), e.each(f, function(e, t) {
                                                t.alternation = l.length - 1
                                            }))
                                        }
                                        b = f.slice(), u = C, f = [];
                                        for (var D = 0; D < b.length; D++) {
                                            var j = b[D],
                                                N = !1;
                                            j.alternation = j.alternation || w;
                                            for (var I = 0; I < P.length; I++) {
                                                var F = P[I];
                                                if ("string" != typeof A || -1 !== e.inArray(j.locator[j.alternation].toString(), R)) {
                                                    if (function(e, t) {
                                                            return e.match.nativeDef === t.match.nativeDef || e.match.def === t.match.nativeDef || e.match.nativeDef === t.match.def
                                                        }(j, F)) {
                                                        N = !0, j.alternation === F.alternation && -1 === F.locator[F.alternation].toString().indexOf(j.locator[j.alternation]) && (F.locator[F.alternation] = F.locator[F.alternation] + "," + j.locator[j.alternation], F.alternation = j.alternation), j.match.nativeDef === F.match.def && (j.locator[j.alternation] = F.locator[F.alternation], P.splice(P.indexOf(F), 1, j));
                                                        break
                                                    }
                                                    if (j.match.def === F.match.def) {
                                                        N = !1;
                                                        break
                                                    }
                                                    if (function(e, n) {
                                                            return null === e.match.fn && null !== n.match.fn && n.match.fn.test(e.match.def, h(), t, !1, c, !1)
                                                        }(j, F) || function(e, n) {
                                                            return null !== e.match.fn && null !== n.match.fn && n.match.fn.test(e.match.def.replace(/[\[\]]/g, ""), h(), t, !1, c, !1)
                                                        }(j, F)) {
                                                        j.alternation === F.alternation && -1 === j.locator[j.alternation].toString().indexOf(F.locator[F.alternation].toString().split("")[0]) && (j.na = j.na || j.locator[j.alternation].toString(), -1 === j.na.indexOf(j.locator[j.alternation].toString().split("")[0]) && (j.na = j.na + "," + j.locator[F.alternation].toString().split("")[0]), N = !0, j.locator[j.alternation] = F.locator[F.alternation].toString().split("")[0] + "," + j.locator[j.alternation], P.splice(P.indexOf(F), 0, j));
                                                        break
                                                    }
                                                }
                                            }
                                            N || P.push(j)
                                        }
                                    }
                                    "string" == typeof A && (P = e.map(P, function(t, n) {
                                        if (isFinite(n)) {
                                            var i = t.alternation,
                                                r = t.locator[i].toString().split(",");
                                            t.locator[i] = a, t.alternation = a;
                                            for (var o = 0; o < r.length; o++) - 1 !== e.inArray(r[o], R) && (t.locator[i] !== a ? (t.locator[i] += ",", t.locator[i] += r[o]) : t.locator[i] = parseInt(r[o]), t.alternation = i);
                                            if (t.locator[i] !== a) return t
                                        }
                                    })), f = S.concat(P), u = t, d = f.length > 0, o = P.length > 0, i = O.slice()
                                } else o = p(x.matches[A] || n.matches[A], [A].concat(l), g);
                                if (o) return !0
                            } else if (o.isQuantifier && g !== n.matches[e.inArray(o, n.matches) - 1])
                                for (var T = o, G = i.length > 0 ? i.shift() : 0; G < (isNaN(T.quantifier.max) ? G + 1 : T.quantifier.max) && u <= t; G++) {
                                    var B = n.matches[e.inArray(T, n.matches) - 1];
                                    if (o = p(B, [G].concat(l), B)) {
                                        if (s = f[f.length - 1].match, s.optionalQuantifier = G > T.quantifier.min - 1, v(s, B)) {
                                            if (G > T.quantifier.min - 1) {
                                                d = !0, u = t;
                                                break
                                            }
                                            return !0
                                        }
                                        return !0
                                    }
                                } else if (o = r(o, i, l, g)) return !0
                        } else u++
                    }
                    for (var g = i.length > 0 ? i.shift() : 0; g < n.matches.length; g++)
                        if (!0 !== n.matches[g].isQuantifier) {
                            var v = p(n.matches[g], [g].concat(o), l);
                            if (v && u === t) return v;
                            if (u > t) break
                        }
                }

                function o(e) {
                    if (c.keepStatic && t > 0 && e.length > 1 + ("" === e[e.length - 1].match.def ? 1 : 0) && !0 !== e[0].match.optionality && !0 !== e[0].match.optionalQuantifier && null === e[0].match.fn && !/[0-9a-bA-Z]/.test(e[0].match.def)) {
                        if (h().validPositions[t - 1] === a) return [k(e)];
                        if (h().validPositions[t - 1].alternation === e[0].alternation) return [k(e)];
                        if (h().validPositions[t - 1]) return [k(e)]
                    }
                    return e
                }
                var s, l = h().maskToken,
                    u = n ? i : 0,
                    p = n ? n.slice() : [0],
                    f = [],
                    d = !1,
                    m = n ? n.join("") : "";
                if (t > -1) {
                    if (n === a) {
                        for (var g, v = t - 1;
                            (g = h().validPositions[v] || h().tests[v]) === a && v > -1;) v--;
                        g !== a && v > -1 && (p = function(t) {
                            var n = [];
                            return e.isArray(t) || (t = [t]), t.length > 0 && (t[0].alternation === a ? 0 === (n = k(t.slice()).locator.slice()).length && (n = t[0].locator.slice()) : e.each(t, function(e, t) {
                                if ("" !== t.def)
                                    if (0 === n.length) n = t.locator.slice();
                                    else
                                        for (var a = 0; a < n.length; a++) t.locator[a] && -1 === n[a].toString().indexOf(t.locator[a]) && (n[a] += "," + t.locator[a])
                            })), n
                        }(g), m = p.join(""), u = v)
                    }
                    if (h().tests[t] && h().tests[t][0].cd === m) return o(h().tests[t]);
                    for (var y = p.shift(); y < l.length && !(r(l[y], p, [y]) && u === t || u > t); y++);
                }
                return (0 === f.length || d) && f.push({
                    match: {
                        fn: null,
                        cardinality: 0,
                        optionality: !0,
                        casing: null,
                        def: "",
                        placeholder: ""
                    },
                    locator: [],
                    cd: m
                }), n !== a && h().tests[t] ? o(e.extend(!0, [], f)) : (h().tests[t] = e.extend(!0, [], f), o(h().tests[t]))
            }

            function w() {
                return h()._buffer === a && (h()._buffer = m(!1, 1), h().buffer === a && (h().buffer = h()._buffer.slice())), h()._buffer
            }

            function A(e) {
                return h().buffer !== a && !0 !== e || (h().buffer = m(!0, v(), !0)), h().buffer
            }

            function E(e, t, n) {
                var i, r;
                if (!0 === e) g(), e = 0, t = n.length;
                else
                    for (i = e; i < t; i++) delete h().validPositions[i];
                for (r = e, i = e; i < t; i++)
                    if (g(!0), n[i] !== c.skipOptionalPartCharacter) {
                        var o = R(r, n[i], !0, !0);
                        !1 !== o && (g(!0), r = o.caret !== a ? o.caret : o.pos + 1)
                    }
            }

            function C(t, n, a) {
                switch (c.casing || n.casing) {
                    case "upper":
                        t = t.toUpperCase();
                        break;
                    case "lower":
                        t = t.toLowerCase();
                        break;
                    case "title":
                        var r = h().validPositions[a - 1];
                        t = 0 === a || r && r.input === String.fromCharCode(i.keyCode.SPACE) ? t.toUpperCase() : t.toLowerCase();
                        break;
                    default:
                        if (e.isFunction(c.casing)) {
                            var o = Array.prototype.slice.call(arguments);
                            o.push(h().validPositions), t = c.casing.apply(this, o)
                        }
                }
                return t
            }

            function O(t, n, i) {
                for (var r, o = c.greedy ? n : n.slice(0, 1), s = !1, l = i !== a ? i.split(",") : [], u = 0; u < l.length; u++) - 1 !== (r = t.indexOf(l[u])) && t.splice(r, 1);
                for (var p = 0; p < t.length; p++)
                    if (-1 !== e.inArray(t[p], o)) {
                        s = !0;
                        break
                    } return s
            }

            function R(t, n, r, o, s, l) {
                function u(e) {
                    var t = Z ? e.begin - e.end > 1 || e.begin - e.end == 1 : e.end - e.begin > 1 || e.end - e.begin == 1;
                    return t && 0 === e.begin && e.end === h().maskLength ? "full" : t
                }

                function p(n, i, r) {
                    var s = !1;
                    return e.each(S(n), function(l, p) {
                        for (var d = p.match, m = i ? 1 : 0, k = "", b = d.cardinality; b > m; b--) k += j(n - (b - 1));
                        if (i && (k += i), A(!0), !1 !== (s = null != d.fn ? d.fn.test(k, h(), n, r, c, u(t)) : (i === d.def || i === c.skipOptionalPartCharacter) && "" !== d.def && {
                                c: I(n, d, !0) || d.def,
                                pos: n
                            })) {
                            var x = s.c !== a ? s.c : i;
                            x = x === c.skipOptionalPartCharacter && null === d.fn ? I(n, d, !0) || d.def : x;
                            var P = n,
                                S = A();
                            if (s.remove !== a && (e.isArray(s.remove) || (s.remove = [s.remove]), e.each(s.remove.sort(function(e, t) {
                                    return t - e
                                }), function(e, t) {
                                    y(t, t + 1, !0)
                                })), s.insert !== a && (e.isArray(s.insert) || (s.insert = [s.insert]), e.each(s.insert.sort(function(e, t) {
                                    return e - t
                                }), function(e, t) {
                                    R(t.pos, t.c, !0, o)
                                })), s.refreshFromBuffer) {
                                var w = s.refreshFromBuffer;
                                if (E(!0 === w ? w : w.start, w.end, S), s.pos === a && s.c === a) return s.pos = v(), !1;
                                if ((P = s.pos !== a ? s.pos : n) !== n) return s = e.extend(s, R(P, x, !0, o)), !1
                            } else if (!0 !== s && s.pos !== a && s.pos !== n && (P = s.pos, E(n, P, A().slice()), P !== n)) return s = e.extend(s, R(P, x, !0)), !1;
                            return (!0 === s || s.pos !== a || s.c !== a) && (l > 0 && g(!0), f(P, e.extend({}, p, {
                                input: C(x, d, P)
                            }), o, u(t)) || (s = !1), !1)
                        }
                    }), s
                }

                function f(t, n, i, r) {
                    if (r || c.insertMode && h().validPositions[t] !== a && i === a) {
                        var o, s = e.extend(!0, {}, h().validPositions),
                            l = v(a, !0);
                        for (o = t; o <= l; o++) delete h().validPositions[o];
                        h().validPositions[t] = e.extend(!0, {}, n);
                        var u, p = !0,
                            f = h().validPositions,
                            m = !1,
                            y = h().maskLength;
                        for (o = u = t; o <= l; o++) {
                            var k = s[o];
                            if (k !== a)
                                for (var b = u; b < h().maskLength && (null === k.match.fn && f[o] && (!0 === f[o].match.optionalQuantifier || !0 === f[o].match.optionality) || null != k.match.fn);) {
                                    if (b++, !1 === m && s[b] && s[b].match.def === k.match.def) h().validPositions[b] = e.extend(!0, {}, s[b]), h().validPositions[b].input = k.input, d(b), u = b, p = !0;
                                    else if (P(b, k.match.def)) {
                                        var x = R(b, k.input, !0, !0);
                                        p = !1 !== x, u = x.caret || x.insert ? v() : b, m = !0
                                    } else if (!(p = !0 === k.generatedInput) && b >= h().maskLength - 1) break;
                                    if (h().maskLength < y && (h().maskLength = y), p) break
                                }
                            if (!p) break
                        }
                        if (!p) return h().validPositions = e.extend(!0, {}, s), g(!0), !1
                    } else h().validPositions[t] = e.extend(!0, {}, n);
                    return g(!0), !0
                }

                function d(t) {
                    for (var n = t - 1; n > -1 && !h().validPositions[n]; n--);
                    var i, r;
                    for (n++; n < t; n++) h().validPositions[n] === a && (!1 === c.jitMasking || c.jitMasking > n) && ("" === (r = S(n, b(n - 1).locator, n - 1).slice())[r.length - 1].match.def && r.pop(), (i = k(r)) && (i.match.def === c.radixPointDefinitionSymbol || !M(n, !0) || e.inArray(c.radixPoint, A()) < n && i.match.fn && i.match.fn.test(I(n), h(), n, !1, c)) && !1 !== (x = p(n, I(n, i.match, !0) || (null == i.match.fn ? i.match.def : "" !== I(n) ? I(n) : A()[n]), !0)) && (h().validPositions[x.pos || n].generatedInput = !0))
                }
                r = !0 === r;
                var m = t;
                t.begin !== a && (m = Z && !u(t) ? t.end : t.begin);
                var x = !0,
                    w = e.extend(!0, {}, h().validPositions);
                if (e.isFunction(c.preValidation) && !r && !0 !== o && !0 !== l && (x = c.preValidation(A(), m, n, u(t), c)), !0 === x) {
                    if (d(m), u(t) && (V(a, i.keyCode.DELETE, t, !0, !0), m = h().p), m < h().maskLength && (Q === a || m < Q) && (x = p(m, n, r), (!r || !0 === o) && !1 === x && !0 !== l)) {
                        var D = h().validPositions[m];
                        if (!D || null !== D.match.fn || D.match.def !== n && n !== c.skipOptionalPartCharacter) {
                            if ((c.insertMode || h().validPositions[_(m)] === a) && !M(m, !0))
                                for (var N = m + 1, F = _(m); N <= F; N++)
                                    if (!1 !== (x = p(N, n, r))) {
                                        ! function(t, n) {
                                            var i = h().validPositions[n];
                                            if (i)
                                                for (var r = i.locator, o = r.length, s = t; s < n; s++)
                                                    if (h().validPositions[s] === a && !M(s, !0)) {
                                                        var l = S(s).slice(),
                                                            c = k(l, !0),
                                                            u = -1;
                                                        "" === l[l.length - 1].match.def && l.pop(), e.each(l, function(e, t) {
                                                            for (var n = 0; n < o; n++) {
                                                                if (t.locator[n] === a || !O(t.locator[n].toString().split(","), r[n].toString().split(","), t.na)) {
                                                                    var i = r[n],
                                                                        s = c.locator[n],
                                                                        l = t.locator[n];
                                                                    i - s > Math.abs(i - l) && (c = t);
                                                                    break
                                                                }
                                                                u < n && (u = n, c = t)
                                                            }
                                                        }), (c = e.extend({}, c, {
                                                            input: I(s, c.match, !0) || c.match.def
                                                        })).generatedInput = !0, f(s, c, !0), h().validPositions[n] = a, p(n, i.input, !0)
                                                    }
                                        }(m, x.pos !== a ? x.pos : N), m = N;
                                        break
                                    }
                        } else x = {
                            caret: _(m)
                        }
                    }!1 === x && c.keepStatic && !r && !0 !== s && (x = function(t, n, i) {
                        var r, s, l, u, p, f, d, m, y = e.extend(!0, {}, h().validPositions),
                            k = !1,
                            b = v();
                        for (u = h().validPositions[b]; b >= 0; b--)
                            if ((l = h().validPositions[b]) && l.alternation !== a) {
                                if (r = b, s = h().validPositions[r].alternation, u.locator[l.alternation] !== l.locator[l.alternation]) break;
                                u = l
                            } if (s !== a) {
                            m = parseInt(r);
                            var x = u.locator[u.alternation || s] !== a ? u.locator[u.alternation || s] : d[0];
                            x.length > 0 && (x = x.split(",")[0]);
                            var P = h().validPositions[m],
                                w = h().validPositions[m - 1];
                            e.each(S(m, w ? w.locator : a, m - 1), function(r, l) {
                                d = l.locator[s] ? l.locator[s].toString().split(",") : [];
                                for (var u = 0; u < d.length; u++) {
                                    var b = [],
                                        S = 0,
                                        w = 0,
                                        A = !1;
                                    if (x < d[u] && (l.na === a || -1 === e.inArray(d[u], l.na.split(",")) || -1 === e.inArray(x.toString(), d))) {
                                        h().validPositions[m] = e.extend(!0, {}, l);
                                        var E = h().validPositions[m].locator;
                                        for (h().validPositions[m].locator[s] = parseInt(d[u]), null == l.match.fn ? (P.input !== l.match.def && (A = !0, !0 !== P.generatedInput && b.push(P.input)), w++, h().validPositions[m].generatedInput = !/[0-9a-bA-Z]/.test(l.match.def), h().validPositions[m].input = l.match.def) : h().validPositions[m].input = P.input, p = m + 1; p < v(a, !0) + 1; p++)(f = h().validPositions[p]) && !0 !== f.generatedInput && /[0-9a-bA-Z]/.test(f.input) ? b.push(f.input) : p < t && S++, delete h().validPositions[p];
                                        for (A && b[0] === l.match.def && b.shift(), g(!0), k = !0; b.length > 0;) {
                                            var C = b.shift();
                                            if (C !== c.skipOptionalPartCharacter && !(k = R(v(a, !0) + 1, C, !1, o, !0))) break
                                        }
                                        if (k) {
                                            h().validPositions[m].locator = E;
                                            var O = v(t) + 1;
                                            for (p = m + 1; p < v() + 1; p++)((f = h().validPositions[p]) === a || null == f.match.fn) && p < t + (w - S) && w++;
                                            k = R((t += w - S) > O ? O : t, n, i, o, !0)
                                        }
                                        if (k) return !1;
                                        g(), h().validPositions = e.extend(!0, {}, y)
                                    }
                                }
                            })
                        }
                        return k
                    }(m, n, r)), !0 === x && (x = {
                        pos: m
                    })
                }
                if (e.isFunction(c.postValidation) && !1 !== x && !r && !0 !== o && !0 !== l) {
                    var T = c.postValidation(A(!0), x, c);
                    if (T.refreshFromBuffer && T.buffer) {
                        var G = T.refreshFromBuffer;
                        E(!0 === G ? G : G.start, G.end, T.buffer)
                    }
                    x = !0 === T ? x : T
                }
                return x && x.pos === a && (x.pos = m), !1 !== x && !0 !== l || (g(!0), h().validPositions = e.extend(!0, {}, w)), x
            }

            function M(e, t) {
                var n = b(e).match;
                if ("" === n.def && (n = x(e).match), null != n.fn) return n.fn;
                if (!0 !== t && e > -1) {
                    var a = S(e);
                    return a.length > 1 + ("" === a[a.length - 1].match.def ? 1 : 0)
                }
                return !1
            }

            function _(e, t) {
                var n = h().maskLength;
                if (e >= n) return n;
                var a = e;
                for (S(n + 1).length > 1 && (m(!0, n + 1, !0), n = h().maskLength); ++a < n && (!0 === t && (!0 !== x(a).match.newBlockMarker || !M(a)) || !0 !== t && !M(a)););
                return a
            }

            function D(e, t) {
                var n, a = e;
                if (a <= 0) return 0;
                for (; --a > 0 && (!0 === t && !0 !== x(a).match.newBlockMarker || !0 !== t && !M(a) && ((n = S(a)).length < 2 || 2 === n.length && "" === n[1].match.def)););
                return a
            }

            function j(e) {
                return h().validPositions[e] === a ? I(e) : h().validPositions[e].input
            }

            function N(t, n, i, r, o) {
                if (r && e.isFunction(c.onBeforeWrite)) {
                    var s = c.onBeforeWrite.call(W, r, n, i, c);
                    if (s) {
                        if (s.refreshFromBuffer) {
                            var l = s.refreshFromBuffer;
                            E(!0 === l ? l : l.start, l.end, s.buffer || n), n = A(!0)
                        }
                        i !== a && (i = s.caret !== a ? s.caret : i)
                    }
                }
                t !== a && (t.inputmask._valueSet(n.join("")), i === a || r !== a && "blur" === r.type ? H(t, i, 0 === n.length) : d && r && "input" === r.type ? setTimeout(function() {
                    G(t, i)
                }, 0) : G(t, i), !0 === o && (X = !0, e(t).trigger("input")))
            }

            function I(t, n, i) {
                if ((n = n || x(t).match).placeholder !== a || !0 === i) return e.isFunction(n.placeholder) ? n.placeholder(c) : n.placeholder;
                if (null === n.fn) {
                    if (t > -1 && h().validPositions[t] === a) {
                        var r, o = S(t),
                            s = [];
                        if (o.length > 1 + ("" === o[o.length - 1].match.def ? 1 : 0))
                            for (var l = 0; l < o.length; l++)
                                if (!0 !== o[l].match.optionality && !0 !== o[l].match.optionalQuantifier && (null === o[l].match.fn || r === a || !1 !== o[l].match.fn.test(r.match.def, h(), t, !0, c)) && (s.push(o[l]), null === o[l].match.fn && (r = o[l]), s.length > 1 && /[0-9a-bA-Z]/.test(s[0].match.def))) return c.placeholder.charAt(t % c.placeholder.length)
                    }
                    return n.def
                }
                return c.placeholder.charAt(t % c.placeholder.length)
            }

            function F(t, r, o, s, l) {
                function u(e, t) {
                    return -1 !== w().slice(e, _(e)).join("").indexOf(t) && !M(e) && x(e).match.nativeDef === t.charAt(t.length - 1)
                }
                var p = s.slice(),
                    f = "",
                    d = -1,
                    m = a;
                if (g(), o || !0 === c.autoUnmask) d = _(d);
                else {
                    var y = w().slice(0, _(-1)).join(""),
                        k = p.join("").match(new RegExp("^" + i.escapeRegex(y), "g"));
                    k && k.length > 0 && (p.splice(0, k.length * y.length), d = _(d))
                }
                if (-1 === d ? (h().p = _(d), d = 0) : h().p = d, e.each(p, function(n, i) {
                        if (i !== a)
                            if (h().validPositions[n] === a && p[n] === I(n) && M(n, !0) && !1 === R(n, p[n], !0, a, a, !0)) h().p++;
                            else {
                                var r = new e.Event("_checkval");
                                r.which = i.charCodeAt(0), f += i;
                                var s = v(a, !0),
                                    l = h().validPositions[s],
                                    y = b(s + 1, l ? l.locator.slice() : a, s);
                                if (!u(d, f) || o || c.autoUnmask) {
                                    var k = o ? n : null == y.match.fn && y.match.optionality && s + 1 < h().p ? s + 1 : h().p;
                                    m = ae.keypressEvent.call(t, r, !0, !1, o, k), d = k + 1, f = ""
                                } else m = ae.keypressEvent.call(t, r, !0, !1, !0, s + 1);
                                if (!1 !== m && !o && e.isFunction(c.onBeforeWrite)) {
                                    var x = m;
                                    if (m = c.onBeforeWrite.call(W, r, A(), m.forwardPosition, c), (m = e.extend(x, m)) && m.refreshFromBuffer) {
                                        var P = m.refreshFromBuffer;
                                        E(!0 === P ? P : P.start, P.end, m.buffer), g(!0), m.caret && (h().p = m.caret, m.forwardPosition = m.caret)
                                    }
                                }
                            }
                    }), r) {
                    var P = a;
                    n.activeElement === t && m && (P = c.numericInput ? D(m.forwardPosition) : m.forwardPosition), N(t, A(), P, l || new e.Event("checkval"), l && "input" === l.type)
                }
            }

            function T(t) {
                if (t) {
                    if (t.inputmask === a) return t.value;
                    t.inputmask && t.inputmask.refreshValue && ae.setValueEvent.call(t)
                }
                var n = [],
                    i = h().validPositions;
                for (var r in i) i[r].match && null != i[r].match.fn && n.push(i[r].input);
                var o = 0 === n.length ? "" : (Z ? n.reverse() : n).join("");
                if (e.isFunction(c.onUnMask)) {
                    var s = (Z ? A().slice().reverse() : A()).join("");
                    o = c.onUnMask.call(W, s, o, c)
                }
                return o
            }

            function G(e, i, r, o) {
                function s(e) {
                    return !0 === o || !Z || "number" != typeof e || c.greedy && "" === c.placeholder || (e = A().join("").length - e), e
                }
                var l;
                if (i === a) return e.setSelectionRange ? (i = e.selectionStart, r = e.selectionEnd) : t.getSelection ? (l = t.getSelection().getRangeAt(0)).commonAncestorContainer.parentNode !== e && l.commonAncestorContainer !== e || (i = l.startOffset, r = l.endOffset) : n.selection && n.selection.createRange && (r = (i = 0 - (l = n.selection.createRange()).duplicate().moveStart("character", -e.inputmask._valueGet().length)) + l.text.length), {
                    begin: s(i),
                    end: s(r)
                };
                if (i.begin !== a && (r = i.end, i = i.begin), "number" == typeof i) {
                    i = s(i), r = "number" == typeof(r = s(r)) ? r : i;
                    var p = parseInt(((e.ownerDocument.defaultView || t).getComputedStyle ? (e.ownerDocument.defaultView || t).getComputedStyle(e, null) : e.currentStyle).fontSize) * r;
                    if (e.scrollLeft = p > e.scrollWidth ? p : 0, u || !1 !== c.insertMode || i !== r || r++, e.setSelectionRange) e.selectionStart = i, e.selectionEnd = r;
                    else if (t.getSelection) {
                        if (l = n.createRange(), e.firstChild === a || null === e.firstChild) {
                            var f = n.createTextNode("");
                            e.appendChild(f)
                        }
                        l.setStart(e.firstChild, i < e.inputmask._valueGet().length ? i : e.inputmask._valueGet().length), l.setEnd(e.firstChild, r < e.inputmask._valueGet().length ? r : e.inputmask._valueGet().length), l.collapse(!0);
                        var d = t.getSelection();
                        d.removeAllRanges(), d.addRange(l)
                    } else e.createTextRange && ((l = e.createTextRange()).collapse(!0), l.moveEnd("character", r), l.moveStart("character", i), l.select());
                    H(e, {
                        begin: i,
                        end: r
                    })
                }
            }

            function B(t) {
                var n, i, r = A(),
                    o = r.length,
                    s = v(),
                    l = {},
                    c = h().validPositions[s],
                    u = c !== a ? c.locator.slice() : a;
                for (n = s + 1; n < r.length; n++) u = (i = b(n, u, n - 1)).locator.slice(), l[n] = e.extend(!0, {}, i);
                var p = c && c.alternation !== a ? c.locator[c.alternation] : a;
                for (n = o - 1; n > s && (((i = l[n]).match.optionality || i.match.optionalQuantifier && i.match.newBlockMarker || p && (p !== l[n].locator[c.alternation] && null != i.match.fn || null === i.match.fn && i.locator[c.alternation] && O(i.locator[c.alternation].toString().split(","), p.toString().split(",")) && "" !== S(n)[0].def)) && r[n] === I(n, i.match)); n--) o--;
                return t ? {
                    l: o,
                    def: l[o] ? l[o].match : a
                } : o
            }

            function L(e) {
                for (var t, n = B(), i = e.length, r = h().validPositions[v()]; n < i && !M(n, !0) && (t = r !== a ? b(n, r.locator.slice(""), r) : x(n)) && !0 !== t.match.optionality && (!0 !== t.match.optionalQuantifier && !0 !== t.match.newBlockMarker || n + 1 === i && "" === (r !== a ? b(n + 1, r.locator.slice(""), r) : x(n + 1)).match.def);) n++;
                for (;
                    (t = h().validPositions[n - 1]) && t && t.match.optionality && t.input === c.skipOptionalPartCharacter;) n--;
                return e.splice(n), e
            }

            function U(t) {
                if (e.isFunction(c.isComplete)) return c.isComplete(t, c);
                if ("*" === c.repeat) return a;
                var n = !1,
                    i = B(!0),
                    r = D(i.l);
                if (i.def === a || i.def.newBlockMarker || i.def.optionality || i.def.optionalQuantifier) {
                    n = !0;
                    for (var o = 0; o <= r; o++) {
                        var s = b(o).match;
                        if (null !== s.fn && h().validPositions[o] === a && !0 !== s.optionality && !0 !== s.optionalQuantifier || null === s.fn && t[o] !== I(o, s)) {
                            n = !1;
                            break
                        }
                    }
                }
                return n
            }

            function V(t, n, r, o, s) {
                if ((c.numericInput || Z) && (n === i.keyCode.BACKSPACE ? n = i.keyCode.DELETE : n === i.keyCode.DELETE && (n = i.keyCode.BACKSPACE), Z)) {
                    var l = r.end;
                    r.end = r.begin, r.begin = l
                }
                n === i.keyCode.BACKSPACE && (r.end - r.begin < 1 || !1 === c.insertMode) ? (r.begin = D(r.begin), h().validPositions[r.begin] !== a && h().validPositions[r.begin].input === c.groupSeparator && r.begin--) : n === i.keyCode.DELETE && r.begin === r.end && (r.end = M(r.end, !0) && h().validPositions[r.end] && h().validPositions[r.end].input !== c.radixPoint ? r.end + 1 : _(r.end) + 1, h().validPositions[r.begin] !== a && h().validPositions[r.begin].input === c.groupSeparator && r.end++), y(r.begin, r.end, !1, o), !0 !== o && function() {
                    if (c.keepStatic) {
                        for (var n = [], i = v(-1, !0), r = e.extend(!0, {}, h().validPositions), o = h().validPositions[i]; i >= 0; i--) {
                            var s = h().validPositions[i];
                            if (s) {
                                if (!0 !== s.generatedInput && /[0-9a-bA-Z]/.test(s.input) && n.push(s.input), delete h().validPositions[i], s.alternation !== a && s.locator[s.alternation] !== o.locator[s.alternation]) break;
                                o = s
                            }
                        }
                        if (i > -1)
                            for (h().p = _(v(-1, !0)); n.length > 0;) {
                                var l = new e.Event("keypress");
                                l.which = n.pop().charCodeAt(0), ae.keypressEvent.call(t, l, !0, !1, !1, h().p)
                            } else h().validPositions = e.extend(!0, {}, r)
                    }
                }();
                var u = v(r.begin, !0);
                if (u < r.begin) h().p = _(u);
                else if (!0 !== o && (h().p = r.begin, !0 !== s))
                    for (; h().p < u && h().validPositions[h().p] === a;) h().p++
            }

            function K(a) {
                function i(e) {
                    var t, i = n.createElement("span");
                    for (var o in r) isNaN(o) && -1 !== o.indexOf("font") && (i.style[o] = r[o]);
                    i.style.textTransform = r.textTransform, i.style.letterSpacing = r.letterSpacing, i.style.position = "absolute", i.style.height = "auto", i.style.width = "auto", i.style.visibility = "hidden", i.style.whiteSpace = "nowrap", n.body.appendChild(i);
                    var s, l = a.inputmask._valueGet(),
                        c = 0;
                    for (t = 0, s = l.length; t <= s; t++) {
                        if (i.innerHTML += l.charAt(t) || "_", i.offsetWidth >= e) {
                            var u = e - c,
                                p = i.offsetWidth - e;
                            i.innerHTML = l.charAt(t), t = (u -= i.offsetWidth / 3) < p ? t - 1 : t;
                            break
                        }
                        c = i.offsetWidth
                    }
                    return n.body.removeChild(i), t
                }
                var r = (a.ownerDocument.defaultView || t).getComputedStyle(a, null),
                    o = n.createElement("div");
                o.style.width = r.width, o.style.textAlign = r.textAlign, ($ = n.createElement("div")).className = "im-colormask", a.parentNode.insertBefore($, a), a.parentNode.removeChild(a), $.appendChild(o), $.appendChild(a), a.style.left = o.offsetLeft + "px", e(a).on("click", function(e) {
                    return G(a, i(e.clientX)), ae.clickEvent.call(a, [e])
                }), e(a).on("keydown", function(e) {
                    e.shiftKey || !1 === c.insertMode || setTimeout(function() {
                        H(a)
                    }, 0)
                })
            }

            function H(e, t, i) {
                function r() {
                    f || null !== s.fn && l.input !== a ? f && (null !== s.fn && l.input !== a || "" === s.def) && (f = !1, p += "</span>") : (f = !0, p += "<span class='im-static'>")
                }

                function o(a) {
                    !0 !== a && d !== t.begin || n.activeElement !== e || (p += "<span class='im-caret' style='border-right-width: 1px;border-right-style: solid;'></span>")
                }
                var s, l, u, p = "",
                    f = !1,
                    d = 0;
                if ($ !== a) {
                    var m = A();
                    if (t === a ? t = G(e) : t.begin === a && (t = {
                            begin: t,
                            end: t
                        }), !0 !== i) {
                        var g = v();
                        do {
                            o(), h().validPositions[d] ? (l = h().validPositions[d], s = l.match, u = l.locator.slice(), r(), p += m[d]) : (l = b(d, u, d - 1), s = l.match, u = l.locator.slice(), (!1 === c.jitMasking || d < g || "number" == typeof c.jitMasking && isFinite(c.jitMasking) && c.jitMasking > d) && (r(), p += I(d, s))), d++
                        } while ((Q === a || d < Q) && (null !== s.fn || "" !== s.def) || g > d || f); - 1 === p.indexOf("im-caret") && o(!0), f && r()
                    }
                    var y = $.getElementsByTagName("div")[0];
                    y.innerHTML = p, e.inputmask.positionColorMask(e, y)
                }
            }
            s = s || this.maskset, c = c || this.opts;
            var z, q, Q, $, W = this,
                Y = this.el,
                Z = this.isRTL,
                J = !1,
                X = !1,
                ee = !1,
                te = !1,
                ne = {
                    on: function(t, n, r) {
                        var o = function(t) {
                            if (this.inputmask === a && "FORM" !== this.nodeName) {
                                var n = e.data(this, "_inputmask_opts");
                                n ? new i(n).mask(this) : ne.off(this)
                            } else {
                                if ("setvalue" === t.type || "FORM" === this.nodeName || !(this.disabled || this.readOnly && !("keydown" === t.type && t.ctrlKey && 67 === t.keyCode || !1 === c.tabThrough && t.keyCode === i.keyCode.TAB))) {
                                    switch (t.type) {
                                        case "input":
                                            if (!0 === X) return X = !1, t.preventDefault();
                                            break;
                                        case "keydown":
                                            J = !1, X = !1;
                                            break;
                                        case "keypress":
                                            if (!0 === J) return t.preventDefault();
                                            J = !0;
                                            break;
                                        case "click":
                                            if (p || f) {
                                                var o = this,
                                                    s = arguments;
                                                return setTimeout(function() {
                                                    r.apply(o, s)
                                                }, 0), !1
                                            }
                                    }
                                    var l = r.apply(this, arguments);
                                    return !1 === l && (t.preventDefault(), t.stopPropagation()), l
                                }
                                t.preventDefault()
                            }
                        };
                        t.inputmask.events[n] = t.inputmask.events[n] || [], t.inputmask.events[n].push(o), -1 !== e.inArray(n, ["submit", "reset"]) ? null !== t.form && e(t.form).on(n, o) : e(t).on(n, o)
                    },
                    off: function(t, n) {
                        if (t.inputmask && t.inputmask.events) {
                            var a;
                            n ? (a = [])[n] = t.inputmask.events[n] : a = t.inputmask.events, e.each(a, function(n, a) {
                                for (; a.length > 0;) {
                                    var i = a.pop(); - 1 !== e.inArray(n, ["submit", "reset"]) ? null !== t.form && e(t.form).off(n, i) : e(t).off(n, i)
                                }
                                delete t.inputmask.events[n]
                            })
                        }
                    }
                },
                ae = {
                    keydownEvent: function(t) {
                        var a = this,
                            r = e(a),
                            o = t.keyCode,
                            s = G(a);
                        if (o === i.keyCode.BACKSPACE || o === i.keyCode.DELETE || f && o === i.keyCode.BACKSPACE_SAFARI || t.ctrlKey && o === i.keyCode.X && ! function(e) {
                                var t = n.createElement("input"),
                                    a = "on" + e,
                                    i = a in t;
                                return i || (t.setAttribute(a, "return;"), i = "function" == typeof t[a]), t = null, i
                            }("cut")) t.preventDefault(), V(a, o, s), N(a, A(!0), h().p, t, a.inputmask._valueGet() !== A().join("")), a.inputmask._valueGet() === w().join("") ? r.trigger("cleared") : !0 === U(A()) && r.trigger("complete");
                        else if (o === i.keyCode.END || o === i.keyCode.PAGE_DOWN) {
                            t.preventDefault();
                            var l = _(v());
                            c.insertMode || l !== h().maskLength || t.shiftKey || l--, G(a, t.shiftKey ? s.begin : l, l, !0)
                        } else o === i.keyCode.HOME && !t.shiftKey || o === i.keyCode.PAGE_UP ? (t.preventDefault(), G(a, 0, t.shiftKey ? s.begin : 0, !0)) : (c.undoOnEscape && o === i.keyCode.ESCAPE || 90 === o && t.ctrlKey) && !0 !== t.altKey ? (F(a, !0, !1, z.split("")), r.trigger("click")) : o !== i.keyCode.INSERT || t.shiftKey || t.ctrlKey ? !0 === c.tabThrough && o === i.keyCode.TAB ? (!0 === t.shiftKey ? (null === x(s.begin).match.fn && (s.begin = _(s.begin)), s.end = D(s.begin, !0), s.begin = D(s.end, !0)) : (s.begin = _(s.begin, !0), s.end = _(s.begin, !0), s.end < h().maskLength && s.end--), s.begin < h().maskLength && (t.preventDefault(), G(a, s.begin, s.end))) : t.shiftKey || !1 === c.insertMode && (o === i.keyCode.RIGHT ? setTimeout(function() {
                            var e = G(a);
                            G(a, e.begin)
                        }, 0) : o === i.keyCode.LEFT && setTimeout(function() {
                            var e = G(a);
                            G(a, Z ? e.begin + 1 : e.begin - 1)
                        }, 0)) : (c.insertMode = !c.insertMode, G(a, c.insertMode || s.begin !== h().maskLength ? s.begin : s.begin - 1));
                        c.onKeyDown.call(this, t, A(), G(a).begin, c), ee = -1 !== e.inArray(o, c.ignorables)
                    },
                    keypressEvent: function(t, n, r, o, s) {
                        var l = this,
                            u = e(l),
                            p = t.which || t.charCode || t.keyCode;
                        if (!(!0 === n || t.ctrlKey && t.altKey) && (t.ctrlKey || t.metaKey || ee)) return p === i.keyCode.ENTER && z !== A().join("") && (z = A().join(""), setTimeout(function() {
                            u.trigger("change")
                        }, 0)), !0;
                        if (p) {
                            46 === p && !1 === t.shiftKey && "" !== c.radixPoint && (p = c.radixPoint.charCodeAt(0));
                            var f, d = n ? {
                                    begin: s,
                                    end: s
                                } : G(l),
                                m = String.fromCharCode(p);
                            h().writeOutBuffer = !0;
                            var v = R(d, m, o);
                            if (!1 !== v && (g(!0), f = v.caret !== a ? v.caret : n ? v.pos + 1 : _(v.pos), h().p = f), !1 !== r && (setTimeout(function() {
                                    c.onKeyValidation.call(l, p, v, c)
                                }, 0), h().writeOutBuffer && !1 !== v)) {
                                var y = A();
                                N(l, y, c.numericInput && v.caret === a ? D(f) : f, t, !0 !== n), !0 !== n && setTimeout(function() {
                                    !0 === U(y) && u.trigger("complete")
                                }, 0)
                            }
                            if (t.preventDefault(), n) return !1 !== v && (v.forwardPosition = f), v
                        }
                    },
                    pasteEvent: function(n) {
                        var a, i = this,
                            r = n.originalEvent || n,
                            o = e(i),
                            s = i.inputmask._valueGet(!0),
                            l = G(i);
                        Z && (a = l.end, l.end = l.begin, l.begin = a);
                        var u = s.substr(0, l.begin),
                            p = s.substr(l.end, s.length);
                        if (u === (Z ? w().reverse() : w()).slice(0, l.begin).join("") && (u = ""), p === (Z ? w().reverse() : w()).slice(l.end).join("") && (p = ""), Z && (a = u, u = p, p = a), t.clipboardData && t.clipboardData.getData) s = u + t.clipboardData.getData("Text") + p;
                        else {
                            if (!r.clipboardData || !r.clipboardData.getData) return !0;
                            s = u + r.clipboardData.getData("text/plain") + p
                        }
                        var f = s;
                        if (e.isFunction(c.onBeforePaste)) {
                            if (!1 === (f = c.onBeforePaste.call(W, s, c))) return n.preventDefault();
                            f || (f = s)
                        }
                        return F(i, !1, !1, Z ? f.split("").reverse() : f.toString().split("")), N(i, A(), _(v()), n, z !== A().join("")), !0 === U(A()) && o.trigger("complete"), n.preventDefault()
                    },
                    inputFallBackEvent: function(t) {
                        var n = this,
                            a = n.inputmask._valueGet();
                        if (A().join("") !== a) {
                            var r = G(n);
                            if (!1 === function(t, n, a) {
                                    if ("." === n.charAt(a.begin - 1) && "" !== c.radixPoint && ((n = n.split(""))[a.begin - 1] = c.radixPoint.charAt(0), n = n.join("")), n.charAt(a.begin - 1) === c.radixPoint && n.length > A().length) {
                                        var i = new e.Event("keypress");
                                        return i.which = c.radixPoint.charCodeAt(0), ae.keypressEvent.call(t, i, !0, !0, !1, a.begin - 1), !1
                                    }
                                }(n, a, r)) return !1;
                            if (a = a.replace(new RegExp("(" + i.escapeRegex(w().join("")) + ")*"), ""), !1 === function(t, n, a) {
                                    if (p) {
                                        var i = n.replace(A().join(""), "");
                                        if (1 === i.length) {
                                            var r = new e.Event("keypress");
                                            return r.which = i.charCodeAt(0), ae.keypressEvent.call(t, r, !0, !0, !1, h().validPositions[a.begin - 1] ? a.begin : a.begin - 1), !1
                                        }
                                    }
                                }(n, a, r)) return !1;
                            r.begin > a.length && (G(n, a.length), r = G(n));
                            var o = A().join(""),
                                s = a.substr(0, r.begin),
                                l = a.substr(r.begin),
                                u = o.substr(0, r.begin),
                                f = o.substr(r.begin),
                                d = r,
                                m = "",
                                g = !1;
                            if (s !== u) {
                                d.begin = 0;
                                for (var v = (g = s.length >= u.length) ? s.length : u.length, y = 0; s.charAt(y) === u.charAt(y) && y < v; y++) d.begin++;
                                g && (m += s.slice(d.begin, d.end))
                            }
                            l !== f && (l.length > f.length ? g && (d.end = d.begin) : l.length < f.length ? d.end += f.length - l.length : l.charAt(0) !== f.charAt(0) && d.end++), N(n, A(), d), m.length > 0 ? e.each(m.split(""), function(t, a) {
                                var i = new e.Event("keypress");
                                i.which = a.charCodeAt(0), ee = !1, ae.keypressEvent.call(n, i)
                            }) : (d.begin === d.end - 1 && G(n, D(d.begin + 1), d.end), t.keyCode = i.keyCode.DELETE, ae.keydownEvent.call(n, t)), t.preventDefault()
                        }
                    },
                    setValueEvent: function(t) {
                        this.inputmask.refreshValue = !1;
                        var n = this,
                            a = n.inputmask._valueGet(!0);
                        e.isFunction(c.onBeforeMask) && (a = c.onBeforeMask.call(W, a, c) || a), a = a.split(""), F(n, !0, !1, Z ? a.reverse() : a), z = A().join(""), (c.clearMaskOnLostFocus || c.clearIncomplete) && n.inputmask._valueGet() === w().join("") && n.inputmask._valueSet("")
                    },
                    focusEvent: function(e) {
                        var t = this,
                            n = t.inputmask._valueGet();
                        c.showMaskOnFocus && (!c.showMaskOnHover || c.showMaskOnHover && "" === n) && (t.inputmask._valueGet() !== A().join("") ? N(t, A(), _(v())) : !1 === te && G(t, _(v()))), !0 === c.positionCaretOnTab && !1 === te && "" !== n && (N(t, A(), G(t)), ae.clickEvent.apply(t, [e, !0])), z = A().join("")
                    },
                    mouseleaveEvent: function(e) {
                        var t = this;
                        if (te = !1, c.clearMaskOnLostFocus && n.activeElement !== t) {
                            var a = A().slice(),
                                i = t.inputmask._valueGet();
                            i !== t.getAttribute("placeholder") && "" !== i && (-1 === v() && i === w().join("") ? a = [] : L(a), N(t, a))
                        }
                    },
                    clickEvent: function(t, i) {
                        function r(t) {
                            if ("" !== c.radixPoint) {
                                var n = h().validPositions;
                                if (n[t] === a || n[t].input === I(t)) {
                                    if (t < _(-1)) return !0;
                                    var i = e.inArray(c.radixPoint, A());
                                    if (-1 !== i) {
                                        for (var r in n)
                                            if (i < r && n[r].input !== I(r)) return !1;
                                        return !0
                                    }
                                }
                            }
                            return !1
                        }
                        var o = this;
                        setTimeout(function() {
                            if (n.activeElement === o) {
                                var e = G(o);
                                if (i && (Z ? e.end = e.begin : e.begin = e.end), e.begin === e.end) switch (c.positionCaretOnClick) {
                                    case "none":
                                        break;
                                    case "radixFocus":
                                        if (r(e.begin)) {
                                            var t = A().join("").indexOf(c.radixPoint);
                                            G(o, c.numericInput ? _(t) : t);
                                            break
                                        }
                                        default:
                                            var s = e.begin,
                                                l = v(s, !0),
                                                u = _(l);
                                            if (s < u) G(o, M(s, !0) || M(s - 1, !0) ? s : _(s));
                                            else {
                                                var p = h().validPositions[l],
                                                    f = b(u, p ? p.match.locator : a, p),
                                                    d = I(u, f.match);
                                                if ("" !== d && A()[u] !== d && !0 !== f.match.optionalQuantifier && !0 !== f.match.newBlockMarker || !M(u, !0) && f.match.def === d) {
                                                    var m = _(u);
                                                    (s >= m || s === u) && (u = m)
                                                }
                                                G(o, u)
                                            }
                                }
                            }
                        }, 0)
                    },
                    dblclickEvent: function(e) {
                        var t = this;
                        setTimeout(function() {
                            G(t, 0, _(v()))
                        }, 0)
                    },
                    cutEvent: function(a) {
                        var r = this,
                            o = e(r),
                            s = G(r),
                            l = a.originalEvent || a,
                            c = t.clipboardData || l.clipboardData,
                            u = Z ? A().slice(s.end, s.begin) : A().slice(s.begin, s.end);
                        c.setData("text", Z ? u.reverse().join("") : u.join("")), n.execCommand && n.execCommand("copy"), V(r, i.keyCode.DELETE, s), N(r, A(), h().p, a, z !== A().join("")), r.inputmask._valueGet() === w().join("") && o.trigger("cleared")
                    },
                    blurEvent: function(t) {
                        var n = e(this),
                            i = this;
                        if (i.inputmask) {
                            var r = i.inputmask._valueGet(),
                                o = A().slice();
                            "" !== r && (c.clearMaskOnLostFocus && (-1 === v() && r === w().join("") ? o = [] : L(o)), !1 === U(o) && (setTimeout(function() {
                                n.trigger("incomplete")
                            }, 0), c.clearIncomplete && (g(), o = c.clearMaskOnLostFocus ? [] : w().slice())), N(i, o, a, t)), z !== A().join("") && (z = o.join(""), n.trigger("change"))
                        }
                    },
                    mouseenterEvent: function(e) {
                        var t = this;
                        te = !0, n.activeElement !== t && c.showMaskOnHover && t.inputmask._valueGet() !== A().join("") && N(t, A())
                    },
                    submitEvent: function(e) {
                        z !== A().join("") && q.trigger("change"), c.clearMaskOnLostFocus && -1 === v() && Y.inputmask._valueGet && Y.inputmask._valueGet() === w().join("") && Y.inputmask._valueSet(""), c.removeMaskOnSubmit && (Y.inputmask._valueSet(Y.inputmask.unmaskedvalue(), !0), setTimeout(function() {
                            N(Y, A())
                        }, 0))
                    },
                    resetEvent: function(e) {
                        Y.inputmask.refreshValue = !0, setTimeout(function() {
                            q.trigger("setvalue")
                        }, 0)
                    }
                };
            i.prototype.positionColorMask = function(e, t) {
                e.style.left = t.offsetLeft + "px"
            };
            var ie;
            if (r !== a) switch (r.action) {
                case "isComplete":
                    return Y = r.el, U(A());
                case "unmaskedvalue":
                    return Y !== a && r.value === a || (ie = r.value, ie = (e.isFunction(c.onBeforeMask) ? c.onBeforeMask.call(W, ie, c) || ie : ie).split(""), F(a, !1, !1, Z ? ie.reverse() : ie), e.isFunction(c.onBeforeWrite) && c.onBeforeWrite.call(W, a, A(), 0, c)), T(Y);
                case "mask":
                    ! function(t) {
                        ne.off(t);
                        var i = function(t, i) {
                            var r = t.getAttribute("type"),
                                s = "INPUT" === t.tagName && -1 !== e.inArray(r, i.supportsInputType) || t.isContentEditable || "TEXTAREA" === t.tagName;
                            if (!s)
                                if ("INPUT" === t.tagName) {
                                    var l = n.createElement("input");
                                    l.setAttribute("type", r), s = "text" === l.type, l = null
                                } else s = "partial";
                            return !1 !== s ? function(t) {
                                function r() {
                                    return this.inputmask ? this.inputmask.opts.autoUnmask ? this.inputmask.unmaskedvalue() : -1 !== v() || !0 !== i.nullable ? n.activeElement === this && i.clearMaskOnLostFocus ? (Z ? L(A().slice()).reverse() : L(A().slice())).join("") : l.call(this) : "" : l.call(this)
                                }

                                function s(t) {
                                    c.call(this, t), this.inputmask && e(this).trigger("setvalue")
                                }
                                var l, c;
                                if (!t.inputmask.__valueGet) {
                                    if (!0 !== i.noValuePatching) {
                                        if (Object.getOwnPropertyDescriptor) {
                                            "function" != typeof Object.getPrototypeOf && (Object.getPrototypeOf = "object" === o("test".__proto__) ? function(e) {
                                                return e.__proto__
                                            } : function(e) {
                                                return e.constructor.prototype
                                            });
                                            var u = Object.getPrototypeOf ? Object.getOwnPropertyDescriptor(Object.getPrototypeOf(t), "value") : a;
                                            u && u.get && u.set ? (l = u.get, c = u.set, Object.defineProperty(t, "value", {
                                                get: r,
                                                set: s,
                                                configurable: !0
                                            })) : "INPUT" !== t.tagName && (l = function() {
                                                return this.textContent
                                            }, c = function(e) {
                                                this.textContent = e
                                            }, Object.defineProperty(t, "value", {
                                                get: r,
                                                set: s,
                                                configurable: !0
                                            }))
                                        } else n.__lookupGetter__ && t.__lookupGetter__("value") && (l = t.__lookupGetter__("value"), c = t.__lookupSetter__("value"), t.__defineGetter__("value", r), t.__defineSetter__("value", s));
                                        t.inputmask.__valueGet = l, t.inputmask.__valueSet = c
                                    }
                                    t.inputmask._valueGet = function(e) {
                                        return Z && !0 !== e ? l.call(this.el).split("").reverse().join("") : l.call(this.el)
                                    }, t.inputmask._valueSet = function(e, t) {
                                        c.call(this.el, null === e || e === a ? "" : !0 !== t && Z ? e.split("").reverse().join("") : e)
                                    }, l === a && (l = function() {
                                        return this.value
                                    }, c = function(e) {
                                        this.value = e
                                    }, function(t) {
                                        if (e.valHooks && (e.valHooks[t] === a || !0 !== e.valHooks[t].inputmaskpatch)) {
                                            var n = e.valHooks[t] && e.valHooks[t].get ? e.valHooks[t].get : function(e) {
                                                    return e.value
                                                },
                                                r = e.valHooks[t] && e.valHooks[t].set ? e.valHooks[t].set : function(e, t) {
                                                    return e.value = t, e
                                                };
                                            e.valHooks[t] = {
                                                get: function(e) {
                                                    if (e.inputmask) {
                                                        if (e.inputmask.opts.autoUnmask) return e.inputmask.unmaskedvalue();
                                                        var t = n(e);
                                                        return -1 !== v(a, a, e.inputmask.maskset.validPositions) || !0 !== i.nullable ? t : ""
                                                    }
                                                    return n(e)
                                                },
                                                set: function(t, n) {
                                                    var a, i = e(t);
                                                    return a = r(t, n), t.inputmask && i.trigger("setvalue"), a
                                                },
                                                inputmaskpatch: !0
                                            }
                                        }
                                    }(t.type), function(t) {
                                        ne.on(t, "mouseenter", function(t) {
                                            var n = e(this);
                                            this.inputmask._valueGet() !== A().join("") && n.trigger("setvalue")
                                        })
                                    }(t))
                                }
                            }(t) : t.inputmask = a, s
                        }(t, c);
                        if (!1 !== i && (Y = t, q = e(Y), -1 === (Q = Y !== a ? Y.maxLength : a) && (Q = a), !0 === c.colorMask && K(Y), d && (Y.hasOwnProperty("inputmode") && (Y.inputmode = c.inputmode, Y.setAttribute("inputmode", c.inputmode)), "rtfm" === c.androidHack && (!0 !== c.colorMask && K(Y), Y.type = "password")), !0 === i && (ne.on(Y, "submit", ae.submitEvent), ne.on(Y, "reset", ae.resetEvent), ne.on(Y, "mouseenter", ae.mouseenterEvent), ne.on(Y, "blur", ae.blurEvent), ne.on(Y, "focus", ae.focusEvent), ne.on(Y, "mouseleave", ae.mouseleaveEvent), !0 !== c.colorMask && ne.on(Y, "click", ae.clickEvent), ne.on(Y, "dblclick", ae.dblclickEvent), ne.on(Y, "paste", ae.pasteEvent), ne.on(Y, "dragdrop", ae.pasteEvent), ne.on(Y, "drop", ae.pasteEvent), ne.on(Y, "cut", ae.cutEvent), ne.on(Y, "complete", c.oncomplete), ne.on(Y, "incomplete", c.onincomplete), ne.on(Y, "cleared", c.oncleared), d || !0 === c.inputEventOnly ? Y.removeAttribute("maxLength") : (ne.on(Y, "keydown", ae.keydownEvent), ne.on(Y, "keypress", ae.keypressEvent)), ne.on(Y, "compositionstart", e.noop), ne.on(Y, "compositionupdate", e.noop), ne.on(Y, "compositionend", e.noop), ne.on(Y, "keyup", e.noop), ne.on(Y, "input", ae.inputFallBackEvent), ne.on(Y, "beforeinput", e.noop)), ne.on(Y, "setvalue", ae.setValueEvent), z = w().join(""), "" !== Y.inputmask._valueGet(!0) || !1 === c.clearMaskOnLostFocus || n.activeElement === Y)) {
                            var r = e.isFunction(c.onBeforeMask) ? c.onBeforeMask.call(W, Y.inputmask._valueGet(!0), c) || Y.inputmask._valueGet(!0) : Y.inputmask._valueGet(!0);
                            "" !== r && F(Y, !0, !1, Z ? r.split("").reverse() : r.split(""));
                            var s = A().slice();
                            z = s.join(""), !1 === U(s) && c.clearIncomplete && g(), c.clearMaskOnLostFocus && n.activeElement !== Y && (-1 === v() ? s = [] : L(s)), N(Y, s), n.activeElement === Y && G(Y, _(v()))
                        }
                    }(Y);
                    break;
                case "format":
                    return ie = (e.isFunction(c.onBeforeMask) ? c.onBeforeMask.call(W, r.value, c) || r.value : r.value).split(""), F(a, !0, !1, Z ? ie.reverse() : ie), r.metadata ? {
                        value: Z ? A().slice().reverse().join("") : A().join(""),
                        metadata: l.call(this, {
                            action: "getmetadata"
                        }, s, c)
                    } : Z ? A().slice().reverse().join("") : A().join("");
                case "isValid":
                    r.value ? (ie = r.value.split(""), F(a, !0, !0, Z ? ie.reverse() : ie)) : r.value = A().join("");
                    for (var re = A(), oe = B(), se = re.length - 1; se > oe && !M(se); se--);
                    return re.splice(oe, se + 1 - oe), U(re) && r.value === A().join("");
                case "getemptymask":
                    return w().join("");
                case "remove":
                    if (Y && Y.inputmask) {
                        q = e(Y), Y.inputmask._valueSet(c.autoUnmask ? T(Y) : Y.inputmask._valueGet(!0)), ne.off(Y);
                        Object.getOwnPropertyDescriptor && Object.getPrototypeOf ? Object.getOwnPropertyDescriptor(Object.getPrototypeOf(Y), "value") && Y.inputmask.__valueGet && Object.defineProperty(Y, "value", {
                            get: Y.inputmask.__valueGet,
                            set: Y.inputmask.__valueSet,
                            configurable: !0
                        }) : n.__lookupGetter__ && Y.__lookupGetter__("value") && Y.inputmask.__valueGet && (Y.__defineGetter__("value", Y.inputmask.__valueGet), Y.__defineSetter__("value", Y.inputmask.__valueSet)), Y.inputmask = a
                    }
                    return Y;
                case "getmetadata":
                    if (e.isArray(s.metadata)) {
                        var le = m(!0, 0, !1).join("");
                        return e.each(s.metadata, function(e, t) {
                            if (t.mask === le) return le = t, !1
                        }), le
                    }
                    return s.metadata
            }
        }
        var c = navigator.userAgent,
            u = /mobile/i.test(c),
            p = /iemobile/i.test(c),
            f = /iphone/i.test(c) && !p,
            d = /android/i.test(c) && !p;
        return i.prototype = {
            dataAttribute: "data-inputmask",
            defaults: {
                placeholder: "_",
                optionalmarker: {
                    start: "[",
                    end: "]"
                },
                quantifiermarker: {
                    start: "{",
                    end: "}"
                },
                groupmarker: {
                    start: "(",
                    end: ")"
                },
                alternatormarker: "|",
                escapeChar: "\\",
                mask: null,
                regex: null,
                oncomplete: e.noop,
                onincomplete: e.noop,
                oncleared: e.noop,
                repeat: 0,
                greedy: !0,
                autoUnmask: !1,
                removeMaskOnSubmit: !1,
                clearMaskOnLostFocus: !0,
                insertMode: !0,
                clearIncomplete: !1,
                alias: null,
                onKeyDown: e.noop,
                onBeforeMask: null,
                onBeforePaste: function(t, n) {
                    return e.isFunction(n.onBeforeMask) ? n.onBeforeMask.call(this, t, n) : t
                },
                onBeforeWrite: null,
                onUnMask: null,
                showMaskOnFocus: !0,
                showMaskOnHover: !0,
                onKeyValidation: e.noop,
                skipOptionalPartCharacter: " ",
                numericInput: !1,
                rightAlign: !1,
                undoOnEscape: !0,
                radixPoint: "",
                radixPointDefinitionSymbol: a,
                groupSeparator: "",
                keepStatic: null,
                positionCaretOnTab: !0,
                tabThrough: !1,
                supportsInputType: ["text", "tel", "password"],
                ignorables: [8, 9, 13, 19, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 93, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 0, 229],
                isComplete: null,
                canClearPosition: e.noop,
                preValidation: null,
                postValidation: null,
                staticDefinitionSymbol: a,
                jitMasking: !1,
                nullable: !0,
                inputEventOnly: !1,
                noValuePatching: !1,
                positionCaretOnClick: "lvp",
                casing: null,
                inputmode: "verbatim",
                colorMask: !1,
                androidHack: !1,
                importDataAttributes: !0
            },
            definitions: {
                9: {
                    validator: "[0-9１-９]",
                    cardinality: 1,
                    definitionSymbol: "*"
                },
                a: {
                    validator: "[A-Za-zА-яЁёÀ-ÿµ]",
                    cardinality: 1,
                    definitionSymbol: "*"
                },
                "*": {
                    validator: "[0-9１-９A-Za-zА-яЁёÀ-ÿµ]",
                    cardinality: 1
                }
            },
            aliases: {},
            masksCache: {},
            mask: function(o) {
                function c(n, i, o, s) {
                    if (!0 === i.importDataAttributes) {
                        var l, c, u, p, f = function(e, i) {
                                null !== (i = i !== a ? i : n.getAttribute(s + "-" + e)) && ("string" == typeof i && (0 === e.indexOf("on") ? i = t[i] : "false" === i ? i = !1 : "true" === i && (i = !0)), o[e] = i)
                            },
                            d = n.getAttribute(s);
                        if (d && "" !== d && (d = d.replace(new RegExp("'", "g"), '"'), c = JSON.parse("{" + d + "}")), c) {
                            u = a;
                            for (p in c)
                                if ("alias" === p.toLowerCase()) {
                                    u = c[p];
                                    break
                                }
                        }
                        f("alias", u), o.alias && r(o.alias, o, i);
                        for (l in i) {
                            if (c) {
                                u = a;
                                for (p in c)
                                    if (p.toLowerCase() === l.toLowerCase()) {
                                        u = c[p];
                                        break
                                    }
                            }
                            f(l, u)
                        }
                    }
                    return e.extend(!0, i, o), ("rtl" === n.dir || i.rightAlign) && (n.style.textAlign = "right"), ("rtl" === n.dir || i.numericInput) && (n.dir = "ltr", n.removeAttribute("dir"), i.isRTL = !0), i
                }
                var u = this;
                return "string" == typeof o && (o = n.getElementById(o) || n.querySelectorAll(o)), o = o.nodeName ? [o] : o, e.each(o, function(t, n) {
                    var r = e.extend(!0, {}, u.opts);
                    c(n, r, e.extend(!0, {}, u.userOptions), u.dataAttribute);
                    var o = s(r, u.noMasksCache);
                    o !== a && (n.inputmask !== a && (n.inputmask.opts.autoUnmask = !0, n.inputmask.remove()), n.inputmask = new i(a, a, !0), n.inputmask.opts = r, n.inputmask.noMasksCache = u.noMasksCache, n.inputmask.userOptions = e.extend(!0, {}, u.userOptions), n.inputmask.isRTL = r.isRTL || r.numericInput, n.inputmask.el = n, n.inputmask.maskset = o, e.data(n, "_inputmask_opts", r), l.call(n.inputmask, {
                        action: "mask"
                    }))
                }), o && o[0] ? o[0].inputmask || this : this
            },
            option: function(t, n) {
                return "string" == typeof t ? this.opts[t] : "object" === (void 0 === t ? "undefined" : o(t)) ? (e.extend(this.userOptions, t), this.el && !0 !== n && this.mask(this.el), this) : void 0
            },
            unmaskedvalue: function(e) {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "unmaskedvalue",
                    value: e
                })
            },
            remove: function() {
                return l.call(this, {
                    action: "remove"
                })
            },
            getemptymask: function() {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "getemptymask"
                })
            },
            hasMaskedValue: function() {
                return !this.opts.autoUnmask
            },
            isComplete: function() {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "isComplete"
                })
            },
            getmetadata: function() {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "getmetadata"
                })
            },
            isValid: function(e) {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "isValid",
                    value: e
                })
            },
            format: function(e, t) {
                return this.maskset = this.maskset || s(this.opts, this.noMasksCache), l.call(this, {
                    action: "format",
                    value: e,
                    metadata: t
                })
            },
            analyseMask: function(t, n, r) {
                function o(e, t, n, a) {
                    this.matches = [], this.openGroup = e || !1, this.alternatorGroup = !1, this.isGroup = e || !1, this.isOptional = t || !1, this.isQuantifier = n || !1, this.isAlternator = a || !1, this.quantifier = {
                        min: 1,
                        max: 1
                    }
                }

                function s(t, o, s) {
                    s = s !== a ? s : t.matches.length;
                    var l = t.matches[s - 1];
                    if (n) 0 === o.indexOf("[") || b && /\\d|\\s|\\w]/i.test(o) || "." === o ? t.matches.splice(s++, 0, {
                        fn: new RegExp(o, r.casing ? "i" : ""),
                        cardinality: 1,
                        optionality: t.isOptional,
                        newBlockMarker: l === a || l.def !== o,
                        casing: null,
                        def: o,
                        placeholder: a,
                        nativeDef: o
                    }) : (b && (o = o[o.length - 1]), e.each(o.split(""), function(e, n) {
                        l = t.matches[s - 1], t.matches.splice(s++, 0, {
                            fn: null,
                            cardinality: 0,
                            optionality: t.isOptional,
                            newBlockMarker: l === a || l.def !== n && null !== l.fn,
                            casing: null,
                            def: r.staticDefinitionSymbol || n,
                            placeholder: r.staticDefinitionSymbol !== a ? n : a,
                            nativeDef: n
                        })
                    })), b = !1;
                    else {
                        var c = (r.definitions ? r.definitions[o] : a) || i.prototype.definitions[o];
                        if (c && !b) {
                            for (var u = c.prevalidator, p = u ? u.length : 0, f = 1; f < c.cardinality; f++) {
                                var d = p >= f ? u[f - 1] : [],
                                    m = d.validator,
                                    h = d.cardinality;
                                t.matches.splice(s++, 0, {
                                    fn: m ? "string" == typeof m ? new RegExp(m, r.casing ? "i" : "") : new function() {
                                        this.test = m
                                    } : new RegExp("."),
                                    cardinality: h || 1,
                                    optionality: t.isOptional,
                                    newBlockMarker: l === a || l.def !== (c.definitionSymbol || o),
                                    casing: c.casing,
                                    def: c.definitionSymbol || o,
                                    placeholder: c.placeholder,
                                    nativeDef: o
                                }), l = t.matches[s - 1]
                            }
                            t.matches.splice(s++, 0, {
                                fn: c.validator ? "string" == typeof c.validator ? new RegExp(c.validator, r.casing ? "i" : "") : new function() {
                                    this.test = c.validator
                                } : new RegExp("."),
                                cardinality: c.cardinality,
                                optionality: t.isOptional,
                                newBlockMarker: l === a || l.def !== (c.definitionSymbol || o),
                                casing: c.casing,
                                def: c.definitionSymbol || o,
                                placeholder: c.placeholder,
                                nativeDef: o
                            })
                        } else t.matches.splice(s++, 0, {
                            fn: null,
                            cardinality: 0,
                            optionality: t.isOptional,
                            newBlockMarker: l === a || l.def !== o && null !== l.fn,
                            casing: null,
                            def: r.staticDefinitionSymbol || o,
                            placeholder: r.staticDefinitionSymbol !== a ? o : a,
                            nativeDef: o
                        }), b = !1
                    }
                }

                function l(t) {
                    t && t.matches && e.each(t.matches, function(e, i) {
                        var o = t.matches[e + 1];
                        (o === a || o.matches === a || !1 === o.isQuantifier) && i && i.isGroup && (i.isGroup = !1, n || (s(i, r.groupmarker.start, 0), !0 !== i.openGroup && s(i, r.groupmarker.end))), l(i)
                    })
                }

                function c() {
                    if (P.length > 0) {
                        if (m = P[P.length - 1], s(m, f), m.isAlternator) {
                            h = P.pop();
                            for (var e = 0; e < h.matches.length; e++) h.matches[e].isGroup = !1;
                            P.length > 0 ? (m = P[P.length - 1]).matches.push(h) : x.matches.push(h)
                        }
                    } else s(x, f)
                }

                function u(e) {
                    e.matches = e.matches.reverse();
                    for (var t in e.matches)
                        if (e.matches.hasOwnProperty(t)) {
                            var n = parseInt(t);
                            if (e.matches[t].isQuantifier && e.matches[n + 1] && e.matches[n + 1].isGroup) {
                                var i = e.matches[t];
                                e.matches.splice(t, 1), e.matches.splice(n + 1, 0, i)
                            }
                            e.matches[t].matches !== a ? e.matches[t] = u(e.matches[t]) : e.matches[t] = function(e) {
                                return e === r.optionalmarker.start ? e = r.optionalmarker.end : e === r.optionalmarker.end ? e = r.optionalmarker.start : e === r.groupmarker.start ? e = r.groupmarker.end : e === r.groupmarker.end && (e = r.groupmarker.start), e
                            }(e.matches[t])
                        } return e
                }
                var p, f, d, m, h, g, v, y = /(?:[?*+]|\{[0-9\+\*]+(?:,[0-9\+\*]*)?\})|[^.?*+^${[]()|\\]+|./g,
                    k = /\[\^?]?(?:[^\\\]]+|\\[\S\s]?)*]?|\\(?:0(?:[0-3][0-7]{0,2}|[4-7][0-7]?)?|[1-9][0-9]*|x[0-9A-Fa-f]{2}|u[0-9A-Fa-f]{4}|c[A-Za-z]|[\S\s]?)|\((?:\?[:=!]?)?|(?:[?*+]|\{[0-9]+(?:,[0-9]*)?\})\??|[^.?*+^${[()|\\]+|./g,
                    b = !1,
                    x = new o,
                    P = [],
                    S = [];
                for (n && (r.optionalmarker.start = a, r.optionalmarker.end = a); p = n ? k.exec(t) : y.exec(t);) {
                    if (f = p[0], n) switch (f.charAt(0)) {
                        case "?":
                            f = "{0,1}";
                            break;
                        case "+":
                        case "*":
                            f = "{" + f + "}"
                    }
                    if (b) c();
                    else switch (f.charAt(0)) {
                        case r.escapeChar:
                            b = !0, n && c();
                            break;
                        case r.optionalmarker.end:
                        case r.groupmarker.end:
                            if (d = P.pop(), d.openGroup = !1, d !== a)
                                if (P.length > 0) {
                                    if ((m = P[P.length - 1]).matches.push(d), m.isAlternator) {
                                        h = P.pop();
                                        for (var w = 0; w < h.matches.length; w++) h.matches[w].isGroup = !1, h.matches[w].alternatorGroup = !1;
                                        P.length > 0 ? (m = P[P.length - 1]).matches.push(h) : x.matches.push(h)
                                    }
                                } else x.matches.push(d);
                            else c();
                            break;
                        case r.optionalmarker.start:
                            P.push(new o(!1, !0));
                            break;
                        case r.groupmarker.start:
                            P.push(new o(!0));
                            break;
                        case r.quantifiermarker.start:
                            var A = new o(!1, !1, !0),
                                E = (f = f.replace(/[{}]/g, "")).split(","),
                                C = isNaN(E[0]) ? E[0] : parseInt(E[0]),
                                O = 1 === E.length ? C : isNaN(E[1]) ? E[1] : parseInt(E[1]);
                            if ("*" !== O && "+" !== O || (C = "*" === O ? 0 : 1), A.quantifier = {
                                    min: C,
                                    max: O
                                }, P.length > 0) {
                                var R = P[P.length - 1].matches;
                                (p = R.pop()).isGroup || ((v = new o(!0)).matches.push(p), p = v), R.push(p), R.push(A)
                            } else(p = x.matches.pop()).isGroup || (n && null === p.fn && "." === p.def && (p.fn = new RegExp(p.def, r.casing ? "i" : "")), (v = new o(!0)).matches.push(p), p = v), x.matches.push(p), x.matches.push(A);
                            break;
                        case r.alternatormarker:
                            if (P.length > 0) {
                                var M = (m = P[P.length - 1]).matches[m.matches.length - 1];
                                g = m.openGroup && (M.matches === a || !1 === M.isGroup && !1 === M.isAlternator) ? P.pop() : m.matches.pop()
                            } else g = x.matches.pop();
                            if (g.isAlternator) P.push(g);
                            else if (g.alternatorGroup ? (h = P.pop(), g.alternatorGroup = !1) : h = new o(!1, !1, !1, !0), h.matches.push(g), P.push(h), g.openGroup) {
                                g.openGroup = !1;
                                var _ = new o(!0);
                                _.alternatorGroup = !0, P.push(_)
                            }
                            break;
                        default:
                            c()
                    }
                }
                for (; P.length > 0;) d = P.pop(), x.matches.push(d);
                return x.matches.length > 0 && (l(x), S.push(x)), (r.numericInput || r.isRTL) && u(S[0]), S
            }
        }, i.extendDefaults = function(t) {
            e.extend(!0, i.prototype.defaults, t)
        }, i.extendDefinitions = function(t) {
            e.extend(!0, i.prototype.definitions, t)
        }, i.extendAliases = function(t) {
            e.extend(!0, i.prototype.aliases, t)
        }, i.format = function(e, t, n) {
            return i(t).format(e, n)
        }, i.unmask = function(e, t) {
            return i(t).unmaskedvalue(e)
        }, i.isValid = function(e, t) {
            return i(t).isValid(e)
        }, i.remove = function(t) {
            e.each(t, function(e, t) {
                t.inputmask && t.inputmask.remove()
            })
        }, i.escapeRegex = function(e) {
            var t = ["/", ".", "*", "+", "?", "|", "(", ")", "[", "]", "{", "}", "\\", "$", "^"];
            return e.replace(new RegExp("(\\" + t.join("|\\") + ")", "gim"), "\\$1")
        }, i.keyCode = {
            ALT: 18,
            BACKSPACE: 8,
            BACKSPACE_SAFARI: 127,
            CAPS_LOCK: 20,
            COMMA: 188,
            COMMAND: 91,
            COMMAND_LEFT: 91,
            COMMAND_RIGHT: 93,
            CONTROL: 17,
            DELETE: 46,
            DOWN: 40,
            END: 35,
            ENTER: 13,
            ESCAPE: 27,
            HOME: 36,
            INSERT: 45,
            LEFT: 37,
            MENU: 93,
            NUMPAD_ADD: 107,
            NUMPAD_DECIMAL: 110,
            NUMPAD_DIVIDE: 111,
            NUMPAD_ENTER: 108,
            NUMPAD_MULTIPLY: 106,
            NUMPAD_SUBTRACT: 109,
            PAGE_DOWN: 34,
            PAGE_UP: 33,
            PERIOD: 190,
            RIGHT: 39,
            SHIFT: 16,
            SPACE: 32,
            TAB: 9,
            UP: 38,
            WINDOWS: 91,
            X: 88
        }, i
    })
}, function(e, t) {
    e.exports = jQuery
}, function(e, t, n) {
    "use strict";

    function a(e) {
        return e && e.__esModule ? e : {
            default: e
        }
    }
    n(4), n(9), n(12), n(13), n(14), n(15);
    var i = a(n(1)),
        r = a(n(0)),
        o = a(n(2));
    r.default === o.default && n(16), window.Inputmask = i.default
}, function(e, t, n) {
    var a = n(5);
    "string" == typeof a && (a = [
        [e.i, a, ""]
    ]);
    var i = {
        hmr: !0
    };
    i.transform = void 0;
    n(7)(a, i);
    a.locals && (e.exports = a.locals)
}, function(e, t, n) {
    (e.exports = n(6)(void 0)).push([e.i, "span.im-caret {\r\n    -webkit-animation: 1s blink step-end infinite;\r\n    animation: 1s blink step-end infinite;\r\n}\r\n\r\n@keyframes blink {\r\n    from, to {\r\n        border-right-color: black;\r\n    }\r\n    50% {\r\n        border-right-color: transparent;\r\n    }\r\n}\r\n\r\n@-webkit-keyframes blink {\r\n    from, to {\r\n        border-right-color: black;\r\n    }\r\n    50% {\r\n        border-right-color: transparent;\r\n    }\r\n}\r\n\r\nspan.im-static {\r\n    color: grey;\r\n}\r\n\r\ndiv.im-colormask {\r\n    display: inline-block;\r\n    border-style: inset;\r\n    border-width: 2px;\r\n    -webkit-appearance: textfield;\r\n    -moz-appearance: textfield;\r\n    appearance: textfield;\r\n}\r\n\r\ndiv.im-colormask > input {\r\n    position: absolute;\r\n    display: inline-block;\r\n    background-color: transparent;\r\n    color: transparent;\r\n    -webkit-appearance: caret;\r\n    -moz-appearance: caret;\r\n    appearance: caret;\r\n    border-style: none;\r\n    left: 0; /*calculated*/\r\n}\r\n\r\ndiv.im-colormask > input:focus {\r\n    outline: none;\r\n}\r\n\r\ndiv.im-colormask > input::-moz-selection{\r\n    background: none;\r\n}\r\n\r\ndiv.im-colormask > input::selection{\r\n    background: none;\r\n}\r\ndiv.im-colormask > input::-moz-selection{\r\n    background: none;\r\n}\r\n\r\ndiv.im-colormask > div {\r\n    color: black;\r\n    display: inline-block;\r\n    width: 100px; /*calculated*/\r\n}", ""])
}, function(e, t) {
    function n(e, t) {
        var n = e[1] || "",
            i = e[3];
        if (!i) return n;
        if (t && "function" == typeof btoa) {
            var r = a(i),
                o = i.sources.map(function(e) {
                    return "/*# sourceURL=" + i.sourceRoot + e + " */"
                });
            return [n].concat(o).concat([r]).join("\n")
        }
        return [n].join("\n")
    }

    function a(e) {
        return "/*# " + ("sourceMappingURL=data:application/json;charset=utf-8;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(e))))) + " */"
    }
    e.exports = function(e) {
        var t = [];
        return t.toString = function() {
            return this.map(function(t) {
                var a = n(t, e);
                return t[2] ? "@media " + t[2] + "{" + a + "}" : a
            }).join("")
        }, t.i = function(e, n) {
            "string" == typeof e && (e = [
                [null, e, ""]
            ]);
            for (var a = {}, i = 0; i < this.length; i++) {
                var r = this[i][0];
                "number" == typeof r && (a[r] = !0)
            }
            for (i = 0; i < e.length; i++) {
                var o = e[i];
                "number" == typeof o[0] && a[o[0]] || (n && !o[2] ? o[2] = n : n && (o[2] = "(" + o[2] + ") and (" + n + ")"), t.push(o))
            }
        }, t
    }
}, function(e, t, n) {
    function a(e, t) {
        for (var n = 0; n < e.length; n++) {
            var a = e[n],
                i = m[a.id];
            if (i) {
                i.refs++;
                for (o = 0; o < i.parts.length; o++) i.parts[o](a.parts[o]);
                for (; o < a.parts.length; o++) i.parts.push(u(a.parts[o], t))
            } else {
                for (var r = [], o = 0; o < a.parts.length; o++) r.push(u(a.parts[o], t));
                m[a.id] = {
                    id: a.id,
                    refs: 1,
                    parts: r
                }
            }
        }
    }

    function i(e, t) {
        for (var n = [], a = {}, i = 0; i < e.length; i++) {
            var r = e[i],
                o = t.base ? r[0] + t.base : r[0],
                s = {
                    css: r[1],
                    media: r[2],
                    sourceMap: r[3]
                };
            a[o] ? a[o].parts.push(s) : n.push(a[o] = {
                id: o,
                parts: [s]
            })
        }
        return n
    }

    function r(e, t) {
        var n = g(e.insertInto);
        if (!n) throw new Error("Couldn't find a style target. This probably means that the value for the 'insertInto' parameter is invalid.");
        var a = k[k.length - 1];
        if ("top" === e.insertAt) a ? a.nextSibling ? n.insertBefore(t, a.nextSibling) : n.appendChild(t) : n.insertBefore(t, n.firstChild), k.push(t);
        else if ("bottom" === e.insertAt) n.appendChild(t);
        else {
            if ("object" != typeof e.insertAt || !e.insertAt.before) throw new Error("[Style Loader]\n\n Invalid value for parameter 'insertAt' ('options.insertAt') found.\n Must be 'top', 'bottom', or Object.\n (https://github.com/webpack-contrib/style-loader#insertat)\n");
            var i = g(e.insertInto + " " + e.insertAt.before);
            n.insertBefore(t, i)
        }
    }

    function o(e) {
        if (null === e.parentNode) return !1;
        e.parentNode.removeChild(e);
        var t = k.indexOf(e);
        t >= 0 && k.splice(t, 1)
    }

    function s(e) {
        var t = document.createElement("style");
        return e.attrs.type = "text/css", c(t, e.attrs), r(e, t), t
    }

    function l(e) {
        var t = document.createElement("link");
        return e.attrs.type = "text/css", e.attrs.rel = "stylesheet", c(t, e.attrs), r(e, t), t
    }

    function c(e, t) {
        Object.keys(t).forEach(function(n) {
            e.setAttribute(n, t[n])
        })
    }

    function u(e, t) {
        var n, a, i, r;
        if (t.transform && e.css) {
            if (!(r = t.transform(e.css))) return function() {};
            e.css = r
        }
        if (t.singleton) {
            var c = y++;
            n = v || (v = s(t)), a = p.bind(null, n, c, !1), i = p.bind(null, n, c, !0)
        } else e.sourceMap && "function" == typeof URL && "function" == typeof URL.createObjectURL && "function" == typeof URL.revokeObjectURL && "function" == typeof Blob && "function" == typeof btoa ? (n = l(t), a = d.bind(null, n, t), i = function() {
            o(n), n.href && URL.revokeObjectURL(n.href)
        }) : (n = s(t), a = f.bind(null, n), i = function() {
            o(n)
        });
        return a(e),
            function(t) {
                if (t) {
                    if (t.css === e.css && t.media === e.media && t.sourceMap === e.sourceMap) return;
                    a(e = t)
                } else i()
            }
    }

    function p(e, t, n, a) {
        var i = n ? "" : a.css;
        if (e.styleSheet) e.styleSheet.cssText = x(t, i);
        else {
            var r = document.createTextNode(i),
                o = e.childNodes;
            o[t] && e.removeChild(o[t]), o.length ? e.insertBefore(r, o[t]) : e.appendChild(r)
        }
    }

    function f(e, t) {
        var n = t.css,
            a = t.media;
        if (a && e.setAttribute("media", a), e.styleSheet) e.styleSheet.cssText = n;
        else {
            for (; e.firstChild;) e.removeChild(e.firstChild);
            e.appendChild(document.createTextNode(n))
        }
    }

    function d(e, t, n) {
        var a = n.css,
            i = n.sourceMap,
            r = void 0 === t.convertToAbsoluteUrls && i;
        (t.convertToAbsoluteUrls || r) && (a = b(a)), i && (a += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(i)))) + " */");
        var o = new Blob([a], {
                type: "text/css"
            }),
            s = e.href;
        e.href = URL.createObjectURL(o), s && URL.revokeObjectURL(s)
    }
    var m = {},
        h = function(e) {
            var t;
            return function() {
                return void 0 === t && (t = e.apply(this, arguments)), t
            }
        }(function() {
            return window && document && document.all && !window.atob
        }),
        g = function(e) {
            var t = {};
            return function(n) {
                if (void 0 === t[n]) {
                    var a = e.call(this, n);
                    if (a instanceof window.HTMLIFrameElement) try {
                        a = a.contentDocument.head
                    } catch (e) {
                        a = null
                    }
                    t[n] = a
                }
                return t[n]
            }
        }(function(e) {
            return document.querySelector(e)
        }),
        v = null,
        y = 0,
        k = [],
        b = n(8);
    e.exports = function(e, t) {
        if ("undefined" != typeof DEBUG && DEBUG && "object" != typeof document) throw new Error("The style-loader cannot be used in a non-browser environment");
        (t = t || {}).attrs = "object" == typeof t.attrs ? t.attrs : {}, t.singleton || (t.singleton = h()), t.insertInto || (t.insertInto = "head"), t.insertAt || (t.insertAt = "bottom");
        var n = i(e, t);
        return a(n, t),
            function(e) {
                for (var r = [], o = 0; o < n.length; o++) {
                    var s = n[o];
                    (l = m[s.id]).refs--, r.push(l)
                }
                e && a(i(e, t), t);
                for (o = 0; o < r.length; o++) {
                    var l = r[o];
                    if (0 === l.refs) {
                        for (var c = 0; c < l.parts.length; c++) l.parts[c]();
                        delete m[l.id]
                    }
                }
            }
    };
    var x = function() {
        var e = [];
        return function(t, n) {
            return e[t] = n, e.filter(Boolean).join("\n")
        }
    }()
}, function(e, t) {
    e.exports = function(e) {
        var t = "undefined" != typeof window && window.location;
        if (!t) throw new Error("fixUrls requires window.location");
        if (!e || "string" != typeof e) return e;
        var n = t.protocol + "//" + t.host,
            a = n + t.pathname.replace(/\/[^\/]*$/, "/");
        return e.replace(/url\s*\(((?:[^)(]|\((?:[^)(]+|\([^)(]*\))*\))*)\)/gi, function(e, t) {
            var i = t.trim().replace(/^"(.*)"$/, function(e, t) {
                return t
            }).replace(/^'(.*)'$/, function(e, t) {
                return t
            });
            if (/^(#|data:|http:\/\/|https:\/\/|file:\/\/\/)/i.test(i)) return e;
            var r;
            return r = 0 === i.indexOf("//") ? i : 0 === i.indexOf("/") ? n + i : a + i.replace(/^\.\//, ""), "url(" + JSON.stringify(r) + ")"
        })
    }
}, function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(0), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t) {
        function n(e) {
            return isNaN(e) || 29 === new Date(e, 2, 0).getDate()
        }
        return t.extendAliases({
            "dd/mm/yyyy": {
                mask: "1/2/y",
                placeholder: "dd/mm/yyyy",
                regex: {
                    val1pre: new RegExp("[0-3]"),
                    val1: new RegExp("0[1-9]|[12][0-9]|3[01]"),
                    val2pre: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|[12][0-9]|3[01])" + n + "[01])")
                    },
                    val2: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|[12][0-9])" + n + "(0[1-9]|1[012]))|(30" + n + "(0[13-9]|1[012]))|(31" + n + "(0[13578]|1[02]))")
                    }
                },
                leapday: "29/02/",
                separator: "/",
                yearrange: {
                    minyear: 1900,
                    maxyear: 2099
                },
                isInYearRange: function(e, t, n) {
                    if (isNaN(e)) return !1;
                    var a = parseInt(e.concat(t.toString().slice(e.length))),
                        i = parseInt(e.concat(n.toString().slice(e.length)));
                    return !isNaN(a) && (t <= a && a <= n) || !isNaN(i) && (t <= i && i <= n)
                },
                determinebaseyear: function(e, t, n) {
                    var a = (new Date).getFullYear();
                    if (e > a) return e;
                    if (t < a) {
                        for (var i = t.toString().slice(0, 2), r = t.toString().slice(2, 4); t < i + n;) i--;
                        var o = i + r;
                        return e > o ? e : o
                    }
                    if (e <= a && a <= t) {
                        for (var s = a.toString().slice(0, 2); t < s + n;) s--;
                        var l = s + n;
                        return l < e ? e : l
                    }
                    return a
                },
                onKeyDown: function(n, a, i, r) {
                    var o = e(this);
                    if (n.ctrlKey && n.keyCode === t.keyCode.RIGHT) {
                        var s = new Date;
                        o.val(s.getDate().toString() + (s.getMonth() + 1).toString() + s.getFullYear().toString()), o.trigger("setvalue")
                    }
                },
                getFrontValue: function(e, t, n) {
                    for (var a = 0, i = 0, r = 0; r < e.length && "2" !== e.charAt(r); r++) {
                        var o = n.definitions[e.charAt(r)];
                        o ? (a += i, i = o.cardinality) : i++
                    }
                    return t.join("").substr(a, i)
                },
                postValidation: function(e, t, a) {
                    var i, r, o = e.join("");
                    return 0 === a.mask.indexOf("y") ? (r = o.substr(0, 4), i = o.substring(4, 10)) : (r = o.substring(6, 10), i = o.substr(0, 6)), t && (i !== a.leapday || n(r))
                },
                definitions: {
                    1: {
                        validator: function(e, t, n, a, i) {
                            var r = i.regex.val1.test(e);
                            return a || r || e.charAt(1) !== i.separator && -1 === "-./".indexOf(e.charAt(1)) || !(r = i.regex.val1.test("0" + e.charAt(0))) ? r : (t.buffer[n - 1] = "0", {
                                refreshFromBuffer: {
                                    start: n - 1,
                                    end: n
                                },
                                pos: n,
                                c: e.charAt(0)
                            })
                        },
                        cardinality: 2,
                        prevalidator: [{
                            validator: function(e, t, n, a, i) {
                                var r = e;
                                isNaN(t.buffer[n + 1]) || (r += t.buffer[n + 1]);
                                var o = 1 === r.length ? i.regex.val1pre.test(r) : i.regex.val1.test(r);
                                if (o && t.validPositions[n] && (i.regex.val2(i.separator).test(e + t.validPositions[n].input) || (t.validPositions[n].input = "0" === e ? "1" : "0")), !a && !o) {
                                    if (o = i.regex.val1.test(e + "0")) return t.buffer[n] = e, t.buffer[++n] = "0", {
                                        pos: n,
                                        c: "0"
                                    };
                                    if (o = i.regex.val1.test("0" + e)) return t.buffer[n] = "0", n++, {
                                        pos: n
                                    }
                                }
                                return o
                            },
                            cardinality: 1
                        }]
                    },
                    2: {
                        validator: function(e, t, n, a, i) {
                            var r = i.getFrontValue(t.mask, t.buffer, i); - 1 !== r.indexOf(i.placeholder[0]) && (r = "01" + i.separator);
                            var o = i.regex.val2(i.separator).test(r + e);
                            return a || o || e.charAt(1) !== i.separator && -1 === "-./".indexOf(e.charAt(1)) || !(o = i.regex.val2(i.separator).test(r + "0" + e.charAt(0))) ? o : (t.buffer[n - 1] = "0", {
                                refreshFromBuffer: {
                                    start: n - 1,
                                    end: n
                                },
                                pos: n,
                                c: e.charAt(0)
                            })
                        },
                        cardinality: 2,
                        prevalidator: [{
                            validator: function(e, t, n, a, i) {
                                isNaN(t.buffer[n + 1]) || (e += t.buffer[n + 1]);
                                var r = i.getFrontValue(t.mask, t.buffer, i); - 1 !== r.indexOf(i.placeholder[0]) && (r = "01" + i.separator);
                                var o = 1 === e.length ? i.regex.val2pre(i.separator).test(r + e) : i.regex.val2(i.separator).test(r + e);
                                return o && t.validPositions[n] && (i.regex.val2(i.separator).test(e + t.validPositions[n].input) || (t.validPositions[n].input = "0" === e ? "1" : "0")), a || o || !(o = i.regex.val2(i.separator).test(r + "0" + e)) ? o : (t.buffer[n] = "0", n++, {
                                    pos: n
                                })
                            },
                            cardinality: 1
                        }]
                    },
                    y: {
                        validator: function(e, t, n, a, i) {
                            return i.isInYearRange(e, i.yearrange.minyear, i.yearrange.maxyear)
                        },
                        cardinality: 4,
                        prevalidator: [{
                            validator: function(e, t, n, a, i) {
                                var r = i.isInYearRange(e, i.yearrange.minyear, i.yearrange.maxyear);
                                if (!a && !r) {
                                    var o = i.determinebaseyear(i.yearrange.minyear, i.yearrange.maxyear, e + "0").toString().slice(0, 1);
                                    if (r = i.isInYearRange(o + e, i.yearrange.minyear, i.yearrange.maxyear)) return t.buffer[n++] = o.charAt(0), {
                                        pos: n
                                    };
                                    if (o = i.determinebaseyear(i.yearrange.minyear, i.yearrange.maxyear, e + "0").toString().slice(0, 2), r = i.isInYearRange(o + e, i.yearrange.minyear, i.yearrange.maxyear)) return t.buffer[n++] = o.charAt(0), t.buffer[n++] = o.charAt(1), {
                                        pos: n
                                    }
                                }
                                return r
                            },
                            cardinality: 1
                        }, {
                            validator: function(e, t, n, a, i) {
                                var r = i.isInYearRange(e, i.yearrange.minyear, i.yearrange.maxyear);
                                if (!a && !r) {
                                    var o = i.determinebaseyear(i.yearrange.minyear, i.yearrange.maxyear, e).toString().slice(0, 2);
                                    if (r = i.isInYearRange(e[0] + o[1] + e[1], i.yearrange.minyear, i.yearrange.maxyear)) return t.buffer[n++] = o.charAt(1), {
                                        pos: n
                                    };
                                    if (o = i.determinebaseyear(i.yearrange.minyear, i.yearrange.maxyear, e).toString().slice(0, 2), r = i.isInYearRange(o + e, i.yearrange.minyear, i.yearrange.maxyear)) return t.buffer[n - 1] = o.charAt(0), t.buffer[n++] = o.charAt(1), t.buffer[n++] = e.charAt(0), {
                                        refreshFromBuffer: {
                                            start: n - 3,
                                            end: n
                                        },
                                        pos: n
                                    }
                                }
                                return r
                            },
                            cardinality: 2
                        }, {
                            validator: function(e, t, n, a, i) {
                                return i.isInYearRange(e, i.yearrange.minyear, i.yearrange.maxyear)
                            },
                            cardinality: 3
                        }]
                    }
                },
                insertMode: !1,
                autoUnmask: !1
            },
            "mm/dd/yyyy": {
                placeholder: "mm/dd/yyyy",
                alias: "dd/mm/yyyy",
                regex: {
                    val2pre: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[13-9]|1[012])" + n + "[0-3])|(02" + n + "[0-2])")
                    },
                    val2: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|1[012])" + n + "(0[1-9]|[12][0-9]))|((0[13-9]|1[012])" + n + "30)|((0[13578]|1[02])" + n + "31)")
                    },
                    val1pre: new RegExp("[01]"),
                    val1: new RegExp("0[1-9]|1[012]")
                },
                leapday: "02/29/",
                onKeyDown: function(n, a, i, r) {
                    var o = e(this);
                    if (n.ctrlKey && n.keyCode === t.keyCode.RIGHT) {
                        var s = new Date;
                        o.val((s.getMonth() + 1).toString() + s.getDate().toString() + s.getFullYear().toString()), o.trigger("setvalue")
                    }
                }
            },
            "yyyy/mm/dd": {
                mask: "y/1/2",
                placeholder: "yyyy/mm/dd",
                alias: "mm/dd/yyyy",
                leapday: "/02/29",
                onKeyDown: function(n, a, i, r) {
                    var o = e(this);
                    if (n.ctrlKey && n.keyCode === t.keyCode.RIGHT) {
                        var s = new Date;
                        o.val(s.getFullYear().toString() + (s.getMonth() + 1).toString() + s.getDate().toString()), o.trigger("setvalue")
                    }
                }
            },
            "dd.mm.yyyy": {
                mask: "1.2.y",
                placeholder: "dd.mm.yyyy",
                leapday: "29.02.",
                separator: ".",
                alias: "dd/mm/yyyy"
            },
            "dd-mm-yyyy": {
                mask: "1-2-y",
                placeholder: "dd-mm-yyyy",
                leapday: "29-02-",
                separator: "-",
                alias: "dd/mm/yyyy"
            },
            "mm.dd.yyyy": {
                mask: "1.2.y",
                placeholder: "mm.dd.yyyy",
                leapday: "02.29.",
                separator: ".",
                alias: "mm/dd/yyyy"
            },
            "mm-dd-yyyy": {
                mask: "1-2-y",
                placeholder: "mm-dd-yyyy",
                leapday: "02-29-",
                separator: "-",
                alias: "mm/dd/yyyy"
            },
            "yyyy.mm.dd": {
                mask: "y.1.2",
                placeholder: "yyyy.mm.dd",
                leapday: ".02.29",
                separator: ".",
                alias: "yyyy/mm/dd"
            },
            "yyyy-mm-dd": {
                mask: "y-1-2",
                placeholder: "yyyy-mm-dd",
                leapday: "-02-29",
                separator: "-",
                alias: "yyyy/mm/dd"
            },
            datetime: {
                mask: "1/2/y h:s",
                placeholder: "dd/mm/yyyy hh:mm",
                alias: "dd/mm/yyyy",
                regex: {
                    hrspre: new RegExp("[012]"),
                    hrs24: new RegExp("2[0-4]|1[3-9]"),
                    hrs: new RegExp("[01][0-9]|2[0-4]"),
                    ampm: new RegExp("^[a|p|A|P][m|M]"),
                    mspre: new RegExp("[0-5]"),
                    ms: new RegExp("[0-5][0-9]")
                },
                timeseparator: ":",
                hourFormat: "24",
                definitions: {
                    h: {
                        validator: function(e, t, n, a, i) {
                            if ("24" === i.hourFormat && 24 === parseInt(e, 10)) return t.buffer[n - 1] = "0", t.buffer[n] = "0", {
                                refreshFromBuffer: {
                                    start: n - 1,
                                    end: n
                                },
                                c: "0"
                            };
                            var r = i.regex.hrs.test(e);
                            if (!a && !r && (e.charAt(1) === i.timeseparator || -1 !== "-.:".indexOf(e.charAt(1))) && (r = i.regex.hrs.test("0" + e.charAt(0)))) return t.buffer[n - 1] = "0", t.buffer[n] = e.charAt(0), n++, {
                                refreshFromBuffer: {
                                    start: n - 2,
                                    end: n
                                },
                                pos: n,
                                c: i.timeseparator
                            };
                            if (r && "24" !== i.hourFormat && i.regex.hrs24.test(e)) {
                                var o = parseInt(e, 10);
                                return 24 === o ? (t.buffer[n + 5] = "a", t.buffer[n + 6] = "m") : (t.buffer[n + 5] = "p", t.buffer[n + 6] = "m"), (o -= 12) < 10 ? (t.buffer[n] = o.toString(), t.buffer[n - 1] = "0") : (t.buffer[n] = o.toString().charAt(1), t.buffer[n - 1] = o.toString().charAt(0)), {
                                    refreshFromBuffer: {
                                        start: n - 1,
                                        end: n + 6
                                    },
                                    c: t.buffer[n]
                                }
                            }
                            return r
                        },
                        cardinality: 2,
                        prevalidator: [{
                            validator: function(e, t, n, a, i) {
                                var r = i.regex.hrspre.test(e);
                                return a || r || !(r = i.regex.hrs.test("0" + e)) ? r : (t.buffer[n] = "0", n++, {
                                    pos: n
                                })
                            },
                            cardinality: 1
                        }]
                    },
                    s: {
                        validator: "[0-5][0-9]",
                        cardinality: 2,
                        prevalidator: [{
                            validator: function(e, t, n, a, i) {
                                var r = i.regex.mspre.test(e);
                                return a || r || !(r = i.regex.ms.test("0" + e)) ? r : (t.buffer[n] = "0", n++, {
                                    pos: n
                                })
                            },
                            cardinality: 1
                        }]
                    },
                    t: {
                        validator: function(e, t, n, a, i) {
                            return i.regex.ampm.test(e + "m")
                        },
                        casing: "lower",
                        cardinality: 1
                    }
                },
                insertMode: !1,
                autoUnmask: !1
            },
            datetime12: {
                mask: "1/2/y h:s t\\m",
                placeholder: "dd/mm/yyyy hh:mm xm",
                alias: "datetime",
                hourFormat: "12"
            },
            "mm/dd/yyyy hh:mm xm": {
                mask: "1/2/y h:s t\\m",
                placeholder: "mm/dd/yyyy hh:mm xm",
                alias: "datetime12",
                regex: {
                    val2pre: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[13-9]|1[012])" + n + "[0-3])|(02" + n + "[0-2])")
                    },
                    val2: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|1[012])" + n + "(0[1-9]|[12][0-9]))|((0[13-9]|1[012])" + n + "30)|((0[13578]|1[02])" + n + "31)")
                    },
                    val1pre: new RegExp("[01]"),
                    val1: new RegExp("0[1-9]|1[012]")
                },
                leapday: "02/29/",
                onKeyDown: function(n, a, i, r) {
                    var o = e(this);
                    if (n.ctrlKey && n.keyCode === t.keyCode.RIGHT) {
                        var s = new Date;
                        o.val((s.getMonth() + 1).toString() + s.getDate().toString() + s.getFullYear().toString()), o.trigger("setvalue")
                    }
                }
            },
            "hh:mm t": {
                mask: "h:s t\\m",
                placeholder: "hh:mm xm",
                alias: "datetime",
                hourFormat: "12"
            },
            "h:s t": {
                mask: "h:s t\\m",
                placeholder: "hh:mm xm",
                alias: "datetime",
                hourFormat: "12"
            },
            "hh:mm:ss": {
                mask: "h:s:s",
                placeholder: "hh:mm:ss",
                alias: "datetime",
                autoUnmask: !1
            },
            "hh:mm": {
                mask: "h:s",
                placeholder: "hh:mm",
                alias: "datetime",
                autoUnmask: !1
            },
            date: {
                alias: "dd/mm/yyyy"
            },
            "mm/yyyy": {
                mask: "1/y",
                placeholder: "mm/yyyy",
                leapday: "donotuse",
                separator: "/",
                alias: "mm/dd/yyyy"
            },
            shamsi: {
                regex: {
                    val2pre: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|1[012])" + n + "[0-3])")
                    },
                    val2: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|1[012])" + n + "(0[1-9]|[12][0-9]))|((0[1-9]|1[012])" + n + "30)|((0[1-6])" + n + "31)")
                    },
                    val1pre: new RegExp("[01]"),
                    val1: new RegExp("0[1-9]|1[012]")
                },
                yearrange: {
                    minyear: 1300,
                    maxyear: 1499
                },
                mask: "y/1/2",
                leapday: "/12/30",
                placeholder: "yyyy/mm/dd",
                alias: "mm/dd/yyyy",
                clearIncomplete: !0
            },
            "yyyy-mm-dd hh:mm:ss": {
                mask: "y-1-2 h:s:s",
                placeholder: "yyyy-mm-dd hh:mm:ss",
                alias: "datetime",
                separator: "-",
                leapday: "-02-29",
                regex: {
                    val2pre: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[13-9]|1[012])" + n + "[0-3])|(02" + n + "[0-2])")
                    },
                    val2: function(e) {
                        var n = t.escapeRegex.call(this, e);
                        return new RegExp("((0[1-9]|1[012])" + n + "(0[1-9]|[12][0-9]))|((0[13-9]|1[012])" + n + "30)|((0[13578]|1[02])" + n + "31)")
                    },
                    val1pre: new RegExp("[01]"),
                    val1: new RegExp("0[1-9]|1[012]")
                },
                onKeyDown: function(e, t, n, a) {}
            }
        }), t
    })
}, function(e, t, n) {
    "use strict";
    var a;
    "function" == typeof Symbol && Symbol.iterator;
    void 0 !== (a = function() {
        return window
    }.call(t, n, t, e)) && (e.exports = a)
}, function(e, t, n) {
    "use strict";
    var a;
    "function" == typeof Symbol && Symbol.iterator;
    void 0 !== (a = function() {
        return document
    }.call(t, n, t, e)) && (e.exports = a)
}, function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(0), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t) {
        return t.extendDefinitions({
            A: {
                validator: "[A-Za-zА-яЁёÀ-ÿµ]",
                cardinality: 1,
                casing: "upper"
            },
            "&": {
                validator: "[0-9A-Za-zА-яЁёÀ-ÿµ]",
                cardinality: 1,
                casing: "upper"
            },
            "#": {
                validator: "[0-9A-Fa-f]",
                cardinality: 1,
                casing: "upper"
            }
        }), t.extendAliases({
            url: {
                definitions: {
                    i: {
                        validator: ".",
                        cardinality: 1
                    }
                },
                mask: "(\\http://)|(\\http\\s://)|(ftp://)|(ftp\\s://)i{+}",
                insertMode: !1,
                autoUnmask: !1,
                inputmode: "url"
            },
            ip: {
                mask: "i[i[i]].i[i[i]].i[i[i]].i[i[i]]",
                definitions: {
                    i: {
                        validator: function(e, t, n, a, i) {
                            return n - 1 > -1 && "." !== t.buffer[n - 1] ? (e = t.buffer[n - 1] + e, e = n - 2 > -1 && "." !== t.buffer[n - 2] ? t.buffer[n - 2] + e : "0" + e) : e = "00" + e, new RegExp("25[0-5]|2[0-4][0-9]|[01][0-9][0-9]").test(e)
                        },
                        cardinality: 1
                    }
                },
                onUnMask: function(e, t, n) {
                    return e
                },
                inputmode: "numeric"
            },
            email: {
                mask: "*{1,64}[.*{1,64}][.*{1,64}][.*{1,63}]@-{1,63}.-{1,63}[.-{1,63}][.-{1,63}]",
                greedy: !1,
                onBeforePaste: function(e, t) {
                    return (e = e.toLowerCase()).replace("mailto:", "")
                },
                definitions: {
                    "*": {
                        validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~-]",
                        cardinality: 1,
                        casing: "lower"
                    },
                    "-": {
                        validator: "[0-9A-Za-z-]",
                        cardinality: 1,
                        casing: "lower"
                    }
                },
                onUnMask: function(e, t, n) {
                    return e
                },
                inputmode: "email"
            },
            mac: {
                mask: "##:##:##:##:##:##"
            },
            vin: {
                mask: "V{13}9{4}",
                definitions: {
                    V: {
                        validator: "[A-HJ-NPR-Za-hj-npr-z\\d]",
                        cardinality: 1,
                        casing: "upper"
                    }
                },
                clearIncomplete: !0,
                autoUnmask: !0
            }
        }), t
    })
}, function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(0), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t, n) {
        function a(e, n) {
            for (var a = "", i = 0; i < e.length; i++) t.prototype.definitions[e.charAt(i)] || n.definitions[e.charAt(i)] || n.optionalmarker.start === e.charAt(i) || n.optionalmarker.end === e.charAt(i) || n.quantifiermarker.start === e.charAt(i) || n.quantifiermarker.end === e.charAt(i) || n.groupmarker.start === e.charAt(i) || n.groupmarker.end === e.charAt(i) || n.alternatormarker === e.charAt(i) ? a += "\\" + e.charAt(i) : a += e.charAt(i);
            return a
        }
        return t.extendAliases({
            numeric: {
                mask: function(e) {
                    if (0 !== e.repeat && isNaN(e.integerDigits) && (e.integerDigits = e.repeat), e.repeat = 0, e.groupSeparator === e.radixPoint && ("." === e.radixPoint ? e.groupSeparator = "," : "," === e.radixPoint ? e.groupSeparator = "." : e.groupSeparator = ""), " " === e.groupSeparator && (e.skipOptionalPartCharacter = n), e.autoGroup = e.autoGroup && "" !== e.groupSeparator, e.autoGroup && ("string" == typeof e.groupSize && isFinite(e.groupSize) && (e.groupSize = parseInt(e.groupSize)), isFinite(e.integerDigits))) {
                        var t = Math.floor(e.integerDigits / e.groupSize),
                            i = e.integerDigits % e.groupSize;
                        e.integerDigits = parseInt(e.integerDigits) + (0 === i ? t - 1 : t), e.integerDigits < 1 && (e.integerDigits = "*")
                    }
                    e.placeholder.length > 1 && (e.placeholder = e.placeholder.charAt(0)), "radixFocus" === e.positionCaretOnClick && "" === e.placeholder && !1 === e.integerOptional && (e.positionCaretOnClick = "lvp"), e.definitions[";"] = e.definitions["~"], e.definitions[";"].definitionSymbol = "~", !0 === e.numericInput && (e.positionCaretOnClick = "radixFocus" === e.positionCaretOnClick ? "lvp" : e.positionCaretOnClick, e.digitsOptional = !1, isNaN(e.digits) && (e.digits = 2), e.decimalProtect = !1);
                    var r = "[+]";
                    if (r += a(e.prefix, e), !0 === e.integerOptional ? r += "~{1," + e.integerDigits + "}" : r += "~{" + e.integerDigits + "}", e.digits !== n) {
                        e.radixPointDefinitionSymbol = e.decimalProtect ? ":" : e.radixPoint;
                        var o = e.digits.toString().split(",");
                        isFinite(o[0] && o[1] && isFinite(o[1])) ? r += e.radixPointDefinitionSymbol + ";{" + e.digits + "}" : (isNaN(e.digits) || parseInt(e.digits) > 0) && (e.digitsOptional ? r += "[" + e.radixPointDefinitionSymbol + ";{1," + e.digits + "}]" : r += e.radixPointDefinitionSymbol + ";{" + e.digits + "}")
                    }
                    return r += a(e.suffix, e), r += "[-]", e.greedy = !1, r
                },
                placeholder: "",
                greedy: !1,
                digits: "*",
                digitsOptional: !0,
                enforceDigitsOnBlur: !1,
                radixPoint: ".",
                positionCaretOnClick: "radixFocus",
                groupSize: 3,
                groupSeparator: "",
                autoGroup: !1,
                allowMinus: !0,
                negationSymbol: {
                    front: "-",
                    back: ""
                },
                integerDigits: "+",
                integerOptional: !0,
                prefix: "",
                suffix: "",
                rightAlign: !0,
                decimalProtect: !0,
                min: null,
                max: null,
                step: 1,
                insertMode: !0,
                autoUnmask: !1,
                unmaskAsNumber: !1,
                inputmode: "numeric",
                preValidation: function(t, a, i, r, o) {
                    if ("-" === i || i === o.negationSymbol.front) return !0 === o.allowMinus && (o.isNegative = o.isNegative === n || !o.isNegative, "" === t.join("") || {
                        caret: a,
                        dopost: !0
                    });
                    if (!1 === r && i === o.radixPoint && o.digits !== n && (isNaN(o.digits) || parseInt(o.digits) > 0)) {
                        var s = e.inArray(o.radixPoint, t);
                        if (-1 !== s) return !0 === o.numericInput ? a === s : {
                            caret: s + 1
                        }
                    }
                    return !0
                },
                postValidation: function(a, i, r) {
                    var o = r.suffix.split(""),
                        s = r.prefix.split("");
                    if (i.pos === n && i.caret !== n && !0 !== i.dopost) return i;
                    var l = i.caret !== n ? i.caret : i.pos,
                        c = a.slice();
                    r.numericInput && (l = c.length - l - 1, c = c.reverse());
                    var u = c[l];
                    if (u === r.groupSeparator && (u = c[l += 1]), l === c.length - r.suffix.length - 1 && u === r.radixPoint) return i;
                    u !== n && u !== r.radixPoint && u !== r.negationSymbol.front && u !== r.negationSymbol.back && (c[l] = "?", r.prefix.length > 0 && l >= (!1 === r.isNegative ? 1 : 0) && l < r.prefix.length - 1 + (!1 === r.isNegative ? 1 : 0) ? s[l - (!1 === r.isNegative ? 1 : 0)] = "?" : r.suffix.length > 0 && l >= c.length - r.suffix.length - (!1 === r.isNegative ? 1 : 0) && (o[l - (c.length - r.suffix.length - (!1 === r.isNegative ? 1 : 0))] = "?")), s = s.join(""), o = o.join("");
                    var p = c.join("").replace(s, "");
                    if (p = p.replace(o, ""), p = p.replace(new RegExp(t.escapeRegex(r.groupSeparator), "g"), ""), p = p.replace(new RegExp("[-" + t.escapeRegex(r.negationSymbol.front) + "]", "g"), ""), p = p.replace(new RegExp(t.escapeRegex(r.negationSymbol.back) + "$"), ""), isNaN(r.placeholder) && (p = p.replace(new RegExp(t.escapeRegex(r.placeholder), "g"), "")), p.length > 1 && 1 !== p.indexOf(r.radixPoint) && ("0" === u && (p = p.replace(/^\?/g, "")), p = p.replace(/^0/g, "")), p.charAt(0) === r.radixPoint && "" !== r.radixPoint && !0 !== r.numericInput && (p = "0" + p), "" !== p) {
                        if (p = p.split(""), (!r.digitsOptional || r.enforceDigitsOnBlur && "blur" === i.event) && isFinite(r.digits)) {
                            var f = e.inArray(r.radixPoint, p),
                                d = e.inArray(r.radixPoint, c); - 1 === f && (p.push(r.radixPoint), f = p.length - 1);
                            for (var m = 1; m <= r.digits; m++) r.digitsOptional && (!r.enforceDigitsOnBlur || "blur" !== i.event) || p[f + m] !== n && p[f + m] !== r.placeholder.charAt(0) ? -1 !== d && c[d + m] !== n && (p[f + m] = p[f + m] || c[d + m]) : p[f + m] = i.placeholder || r.placeholder.charAt(0)
                        }
                        if (!0 !== r.autoGroup || "" === r.groupSeparator || u === r.radixPoint && i.pos === n && !i.dopost) p = p.join("");
                        else {
                            var h = p[p.length - 1] === r.radixPoint && i.c === r.radixPoint;
                            p = t(function(e, t) {
                                var n = "";
                                if (n += "(" + t.groupSeparator + "*{" + t.groupSize + "}){*}", "" !== t.radixPoint) {
                                    var a = e.join("").split(t.radixPoint);
                                    a[1] && (n += t.radixPoint + "*{" + a[1].match(/^\d*\??\d*/)[0].length + "}")
                                }
                                return n
                            }(p, r), {
                                numericInput: !0,
                                jitMasking: !0,
                                definitions: {
                                    "*": {
                                        validator: "[0-9?]",
                                        cardinality: 1
                                    }
                                }
                            }).format(p.join("")), h && (p += r.radixPoint), p.charAt(0) === r.groupSeparator && p.substr(1)
                        }
                    }
                    if (r.isNegative && "blur" === i.event && (r.isNegative = "0" !== p), p = s + p, p += o, r.isNegative && (p = r.negationSymbol.front + p, p += r.negationSymbol.back), p = p.split(""), u !== n)
                        if (u !== r.radixPoint && u !== r.negationSymbol.front && u !== r.negationSymbol.back)(l = e.inArray("?", p)) > -1 ? p[l] = u : l = i.caret || 0;
                        else if (u === r.radixPoint || u === r.negationSymbol.front || u === r.negationSymbol.back) {
                        var g = e.inArray(u, p); - 1 !== g && (l = g)
                    }
                    r.numericInput && (l = p.length - l - 1, p = p.reverse());
                    var v = {
                        caret: u === n || i.pos !== n ? l + (r.numericInput ? -1 : 1) : l,
                        buffer: p,
                        refreshFromBuffer: i.dopost || a.join("") !== p.join("")
                    };
                    return v.refreshFromBuffer ? v : i
                },
                onBeforeWrite: function(a, i, r, o) {
                    if (a) switch (a.type) {
                        case "keydown":
                            return o.postValidation(i, {
                                caret: r,
                                dopost: !0
                            }, o);
                        case "blur":
                        case "checkval":
                            var s;
                            if (function(e) {
                                    e.parseMinMaxOptions === n && (null !== e.min && (e.min = e.min.toString().replace(new RegExp(t.escapeRegex(e.groupSeparator), "g"), ""), "," === e.radixPoint && (e.min = e.min.replace(e.radixPoint, ".")), e.min = isFinite(e.min) ? parseFloat(e.min) : NaN, isNaN(e.min) && (e.min = Number.MIN_VALUE)), null !== e.max && (e.max = e.max.toString().replace(new RegExp(t.escapeRegex(e.groupSeparator), "g"), ""), "," === e.radixPoint && (e.max = e.max.replace(e.radixPoint, ".")), e.max = isFinite(e.max) ? parseFloat(e.max) : NaN, isNaN(e.max) && (e.max = Number.MAX_VALUE)), e.parseMinMaxOptions = "done")
                                }(o), null !== o.min || null !== o.max) {
                                if (s = o.onUnMask(i.join(""), n, e.extend({}, o, {
                                        unmaskAsNumber: !0
                                    })), null !== o.min && s < o.min) return o.isNegative = o.min < 0, o.postValidation(o.min.toString().replace(".", o.radixPoint).split(""), {
                                    caret: r,
                                    dopost: !0,
                                    placeholder: "0"
                                }, o);
                                if (null !== o.max && s > o.max) return o.isNegative = o.max < 0, o.postValidation(o.max.toString().replace(".", o.radixPoint).split(""), {
                                    caret: r,
                                    dopost: !0,
                                    placeholder: "0"
                                }, o)
                            }
                            return o.postValidation(i, {
                                caret: r,
                                placeholder: "0",
                                event: "blur"
                            }, o);
                        case "_checkval":
                            return {
                                caret: r
                            }
                    }
                },
                regex: {
                    integerPart: function(e, n) {
                        return n ? new RegExp("[" + t.escapeRegex(e.negationSymbol.front) + "+]?") : new RegExp("[" + t.escapeRegex(e.negationSymbol.front) + "+]?\\d+")
                    },
                    integerNPart: function(e) {
                        return new RegExp("[\\d" + t.escapeRegex(e.groupSeparator) + t.escapeRegex(e.placeholder.charAt(0)) + "]+")
                    }
                },
                definitions: {
                    "~": {
                        validator: function(e, a, i, r, o, s) {
                            var l = r ? new RegExp("[0-9" + t.escapeRegex(o.groupSeparator) + "]").test(e) : new RegExp("[0-9]").test(e);
                            if (!0 === l) {
                                if (!0 !== o.numericInput && a.validPositions[i] !== n && "~" === a.validPositions[i].match.def && !s) {
                                    var c = a.buffer.join(""),
                                        u = (c = (c = c.replace(new RegExp("[-" + t.escapeRegex(o.negationSymbol.front) + "]", "g"), "")).replace(new RegExp(t.escapeRegex(o.negationSymbol.back) + "$"), "")).split(o.radixPoint);
                                    u.length > 1 && (u[1] = u[1].replace(/0/g, o.placeholder.charAt(0))), "0" === u[0] && (u[0] = u[0].replace(/0/g, o.placeholder.charAt(0))), c = u[0] + o.radixPoint + u[1] || "";
                                    var p = a._buffer.join("");
                                    for (c === o.radixPoint && (c = p); null === c.match(t.escapeRegex(p) + "$");) p = p.slice(1);
                                    l = (c = (c = c.replace(p, "")).split(""))[i] === n ? {
                                        pos: i,
                                        remove: i
                                    } : {
                                        pos: i
                                    }
                                }
                            } else r || e !== o.radixPoint || a.validPositions[i - 1] !== n || (a.buffer[i] = "0", l = {
                                pos: i + 1
                            });
                            return l
                        },
                        cardinality: 1
                    },
                    "+": {
                        validator: function(e, t, n, a, i) {
                            return i.allowMinus && ("-" === e || e === i.negationSymbol.front)
                        },
                        cardinality: 1,
                        placeholder: ""
                    },
                    "-": {
                        validator: function(e, t, n, a, i) {
                            return i.allowMinus && e === i.negationSymbol.back
                        },
                        cardinality: 1,
                        placeholder: ""
                    },
                    ":": {
                        validator: function(e, n, a, i, r) {
                            var o = "[" + t.escapeRegex(r.radixPoint) + "]",
                                s = new RegExp(o).test(e);
                            return s && n.validPositions[a] && n.validPositions[a].match.placeholder === r.radixPoint && (s = {
                                caret: a + 1
                            }), s
                        },
                        cardinality: 1,
                        placeholder: function(e) {
                            return e.radixPoint
                        }
                    }
                },
                onUnMask: function(e, n, a) {
                    if ("" === n && !0 === a.nullable) return n;
                    var i = e.replace(a.prefix, "");
                    return i = i.replace(a.suffix, ""), i = i.replace(new RegExp(t.escapeRegex(a.groupSeparator), "g"), ""), "" !== a.placeholder.charAt(0) && (i = i.replace(new RegExp(a.placeholder.charAt(0), "g"), "0")), a.unmaskAsNumber ? ("" !== a.radixPoint && -1 !== i.indexOf(a.radixPoint) && (i = i.replace(t.escapeRegex.call(this, a.radixPoint), ".")), i = i.replace(new RegExp("^" + t.escapeRegex(a.negationSymbol.front)), "-"), i = i.replace(new RegExp(t.escapeRegex(a.negationSymbol.back) + "$"), ""), Number(i)) : i
                },
                isComplete: function(e, n) {
                    var a = e.join("");
                    if (e.slice().join("") !== a) return !1;
                    var i = a.replace(n.prefix, "");
                    return i = i.replace(n.suffix, ""), i = i.replace(new RegExp(t.escapeRegex(n.groupSeparator), "g"), ""), "," === n.radixPoint && (i = i.replace(t.escapeRegex(n.radixPoint), ".")), isFinite(i)
                },
                onBeforeMask: function(e, a) {
                    if (a.isNegative = n, e = e.toString().charAt(e.length - 1) === a.radixPoint ? e.toString().substr(0, e.length - 1) : e.toString(), "" !== a.radixPoint && isFinite(e)) {
                        var i = e.split("."),
                            r = "" !== a.groupSeparator ? parseInt(a.groupSize) : 0;
                        2 === i.length && (i[0].length > r || i[1].length > r || i[0].length <= r && i[1].length < r) && (e = e.replace(".", a.radixPoint))
                    }
                    var o = e.match(/,/g),
                        s = e.match(/\./g);
                    if (e = s && o ? s.length > o.length ? (e = e.replace(/\./g, "")).replace(",", a.radixPoint) : o.length > s.length ? (e = e.replace(/,/g, "")).replace(".", a.radixPoint) : e.indexOf(".") < e.indexOf(",") ? e.replace(/\./g, "") : e.replace(/,/g, "") : e.replace(new RegExp(t.escapeRegex(a.groupSeparator), "g"), ""), 0 === a.digits && (-1 !== e.indexOf(".") ? e = e.substring(0, e.indexOf(".")) : -1 !== e.indexOf(",") && (e = e.substring(0, e.indexOf(",")))), "" !== a.radixPoint && isFinite(a.digits) && -1 !== e.indexOf(a.radixPoint)) {
                        var l = e.split(a.radixPoint)[1].match(new RegExp("\\d*"))[0];
                        if (parseInt(a.digits) < l.toString().length) {
                            var c = Math.pow(10, parseInt(a.digits));
                            e = e.replace(t.escapeRegex(a.radixPoint), "."), e = (e = Math.round(parseFloat(e) * c) / c).toString().replace(".", a.radixPoint)
                        }
                    }
                    return e
                },
                canClearPosition: function(e, t, n, a, i) {
                    var r = e.validPositions[t],
                        o = r.input !== i.radixPoint || null !== e.validPositions[t].match.fn && !1 === i.decimalProtect || r.input === i.radixPoint && e.validPositions[t + 1] && null === e.validPositions[t + 1].match.fn || isFinite(r.input) || t === n || r.input === i.groupSeparator || r.input === i.negationSymbol.front || r.input === i.negationSymbol.back;
                    return !o || "+" !== r.match.nativeDef && "-" !== r.match.nativeDef || (i.isNegative = !1), o
                },
                onKeyDown: function(n, a, i, r) {
                    var o = e(this);
                    if (n.ctrlKey) switch (n.keyCode) {
                        case t.keyCode.UP:
                            o.val(parseFloat(this.inputmask.unmaskedvalue()) + parseInt(r.step)), o.trigger("setvalue");
                            break;
                        case t.keyCode.DOWN:
                            o.val(parseFloat(this.inputmask.unmaskedvalue()) - parseInt(r.step)), o.trigger("setvalue")
                    }
                }
            },
            currency: {
                prefix: "$ ",
                groupSeparator: ",",
                alias: "numeric",
                placeholder: "0",
                autoGroup: !0,
                digits: 2,
                digitsOptional: !1,
                clearMaskOnLostFocus: !1
            },
            decimal: {
                alias: "numeric"
            },
            integer: {
                alias: "numeric",
                digits: 0,
                radixPoint: ""
            },
            percentage: {
                alias: "numeric",
                digits: 2,
                digitsOptional: !0,
                radixPoint: ".",
                placeholder: "0",
                autoGroup: !1,
                min: 0,
                max: 100,
                suffix: " %",
                allowMinus: !1
            }
        }), t
    })
}, function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(0), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t) {
        function n(e, t) {
            var n = (e.mask || e).replace(/#/g, "9").replace(/\)/, "9").replace(/[+()#-]/g, ""),
                a = (t.mask || t).replace(/#/g, "9").replace(/\)/, "9").replace(/[+()#-]/g, ""),
                i = (e.mask || e).split("#")[0],
                r = (t.mask || t).split("#")[0];
            return 0 === r.indexOf(i) ? -1 : 0 === i.indexOf(r) ? 1 : n.localeCompare(a)
        }
        var a = t.prototype.analyseMask;
        return t.prototype.analyseMask = function(t, n, i) {
            function r(e, n, a) {
                n = n || "", a = a || s, "" !== n && (a[n] = {});
                for (var i = "", o = a[n] || a, l = e.length - 1; l >= 0; l--) o[i = (t = e[l].mask || e[l]).substr(0, 1)] = o[i] || [], o[i].unshift(t.substr(1)), e.splice(l, 1);
                for (var c in o) o[c].length > 500 && r(o[c].slice(), c, o)
            }

            function o(t) {
                var n = "",
                    a = [];
                for (var r in t) e.isArray(t[r]) ? 1 === t[r].length ? a.push(r + t[r]) : a.push(r + i.groupmarker.start + t[r].join(i.groupmarker.end + i.alternatormarker + i.groupmarker.start) + i.groupmarker.end) : a.push(r + o(t[r]));
                return 1 === a.length ? n += a[0] : n += i.groupmarker.start + a.join(i.groupmarker.end + i.alternatormarker + i.groupmarker.start) + i.groupmarker.end, n
            }
            var s = {};
            return i.phoneCodes && (i.phoneCodes && i.phoneCodes.length > 1e3 && (r((t = t.substr(1, t.length - 2)).split(i.groupmarker.end + i.alternatormarker + i.groupmarker.start)), t = o(s)), t = t.replace(/9/g, "\\9")), a.call(this, t, n, i)
        }, t.extendAliases({
            abstractphone: {
                groupmarker: {
                    start: "<",
                    end: ">"
                },
                countrycode: "",
                phoneCodes: [],
                mask: function(e) {
                    return e.definitions = {
                        "#": t.prototype.definitions[9]
                    }, e.phoneCodes.sort(n)
                },
                keepStatic: !0,
                onBeforeMask: function(e, t) {
                    var n = e.replace(/^0{1,2}/, "").replace(/[\s]/g, "");
                    return (n.indexOf(t.countrycode) > 1 || -1 === n.indexOf(t.countrycode)) && (n = "+" + t.countrycode + n), n
                },
                onUnMask: function(e, t, n) {
                    return e.replace(/[()#-]/g, "")
                },
                inputmode: "tel"
            }
        }), t
    })
}, function(e, t, n) {
    "use strict";
    var a, i, r;
    "function" == typeof Symbol && Symbol.iterator;
    ! function(o) {
        i = [n(0), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t) {
        return t.extendAliases({
            Regex: {
                mask: "r",
                greedy: !1,
                repeat: "*",
                regex: null,
                regexTokens: null,
                tokenizer: /\[\^?]?(?:[^\\\]]+|\\[\S\s]?)*]?|\\(?:0(?:[0-3][0-7]{0,2}|[4-7][0-7]?)?|[1-9][0-9]*|x[0-9A-Fa-f]{2}|u[0-9A-Fa-f]{4}|c[A-Za-z]|[\S\s]?)|\((?:\?[:=!]?)?|(?:[?*+]|\{[0-9]+(?:,[0-9]*)?\})\??|[^.?*+^${[()|\\]+|./g,
                quantifierFilter: /[0-9]+[^,]/,
                isComplete: function(e, t) {
                    return new RegExp(t.regex, t.casing ? "i" : "").test(e.join(""))
                },
                definitions: {
                    r: {
                        validator: function(t, n, a, i, r) {
                            function o(e, t) {
                                this.matches = [], this.isGroup = e || !1, this.isQuantifier = t || !1, this.quantifier = {
                                    min: 1,
                                    max: 1
                                }, this.repeaterPart = void 0
                            }

                            function s(t, n) {
                                var a = !1;
                                n && (p += "(", d++);
                                for (var i = 0; i < t.matches.length; i++) {
                                    var o = t.matches[i];
                                    if (!0 === o.isGroup) a = s(o, !0);
                                    else if (!0 === o.isQuantifier) {
                                        var c = e.inArray(o, t.matches),
                                            u = t.matches[c - 1],
                                            f = p;
                                        if (isNaN(o.quantifier.max)) {
                                            for (; o.repeaterPart && o.repeaterPart !== p && o.repeaterPart.length > p.length && !(a = s(u, !0)););
                                            (a = a || s(u, !0)) && (o.repeaterPart = p), p = f + o.quantifier.max
                                        } else {
                                            for (var m = 0, h = o.quantifier.max - 1; m < h && !(a = s(u, !0)); m++);
                                            p = f + "{" + o.quantifier.min + "," + o.quantifier.max + "}"
                                        }
                                    } else if (void 0 !== o.matches)
                                        for (var g = 0; g < o.length && !(a = s(o[g], n)); g++);
                                    else {
                                        var v;
                                        if ("[" == o.charAt(0)) {
                                            v = p, v += o;
                                            for (b = 0; b < d; b++) v += ")";
                                            a = (x = new RegExp("^(" + v + ")$", r.casing ? "i" : "")).test(l)
                                        } else
                                            for (var y = 0, k = o.length; y < k; y++)
                                                if ("\\" !== o.charAt(y)) {
                                                    v = p, v = (v += o.substr(0, y + 1)).replace(/\|$/, "");
                                                    for (var b = 0; b < d; b++) v += ")";
                                                    var x = new RegExp("^(" + v + ")$", r.casing ? "i" : "");
                                                    if (a = x.test(l)) break
                                                } p += o
                                    }
                                    if (a) break
                                }
                                return n && (p += ")", d--), a
                            }
                            var l, c, u = n.buffer.slice(),
                                p = "",
                                f = !1,
                                d = 0;
                            null === r.regexTokens && function() {
                                var e, t, n = new o,
                                    a = [];
                                for (r.regexTokens = []; e = r.tokenizer.exec(r.regex);) switch ((t = e[0]).charAt(0)) {
                                    case "(":
                                        a.push(new o(!0));
                                        break;
                                    case ")":
                                        c = a.pop(), a.length > 0 ? a[a.length - 1].matches.push(c) : n.matches.push(c);
                                        break;
                                    case "{":
                                    case "+":
                                    case "*":
                                        var i = new o(!1, !0),
                                            s = (t = t.replace(/[{}]/g, "")).split(","),
                                            l = isNaN(s[0]) ? s[0] : parseInt(s[0]),
                                            u = 1 === s.length ? l : isNaN(s[1]) ? s[1] : parseInt(s[1]);
                                        if (i.quantifier = {
                                                min: l,
                                                max: u
                                            }, a.length > 0) {
                                            var p = a[a.length - 1].matches;
                                            (e = p.pop()).isGroup || ((c = new o(!0)).matches.push(e), e = c), p.push(e), p.push(i)
                                        } else(e = n.matches.pop()).isGroup || ((c = new o(!0)).matches.push(e), e = c), n.matches.push(e), n.matches.push(i);
                                        break;
                                    default:
                                        a.length > 0 ? a[a.length - 1].matches.push(t) : n.matches.push(t)
                                }
                                n.matches.length > 0 && r.regexTokens.push(n)
                            }(), u.splice(a, 0, t), l = u.join("");
                            for (var m = 0; m < r.regexTokens.length; m++) {
                                var h = r.regexTokens[m];
                                if (f = s(h, h.isGroup)) break
                            }
                            return f
                        },
                        cardinality: 1
                    }
                }
            }
        }), t
    })
}, function(e, t, n) {
    "use strict";
    var a, i, r, o = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
        return typeof e
    } : function(e) {
        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
    };
    ! function(o) {
        i = [n(2), n(1)], void 0 !== (r = "function" == typeof(a = o) ? a.apply(t, i) : a) && (e.exports = r)
    }(function(e, t) {
        return void 0 === e.fn.inputmask && (e.fn.inputmask = function(n, a) {
            var i, r = this[0];
            if (void 0 === a && (a = {}), "string" == typeof n) switch (n) {
                case "unmaskedvalue":
                    return r && r.inputmask ? r.inputmask.unmaskedvalue() : e(r).val();
                case "remove":
                    return this.each(function() {
                        this.inputmask && this.inputmask.remove()
                    });
                case "getemptymask":
                    return r && r.inputmask ? r.inputmask.getemptymask() : "";
                case "hasMaskedValue":
                    return !(!r || !r.inputmask) && r.inputmask.hasMaskedValue();
                case "isComplete":
                    return !r || !r.inputmask || r.inputmask.isComplete();
                case "getmetadata":
                    return r && r.inputmask ? r.inputmask.getmetadata() : void 0;
                case "setvalue":
                    e(r).val(a), r && void 0 === r.inputmask && e(r).triggerHandler("setvalue");
                    break;
                case "option":
                    if ("string" != typeof a) return this.each(function() {
                        if (void 0 !== this.inputmask) return this.inputmask.option(a)
                    });
                    if (r && void 0 !== r.inputmask) return r.inputmask.option(a);
                    break;
                default:
                    return a.alias = n, i = new t(a), this.each(function() {
                        i.mask(this)
                    })
            } else {
                if ("object" == (void 0 === n ? "undefined" : o(n))) return i = new t(n), void 0 === n.mask && void 0 === n.alias ? this.each(function() {
                    if (void 0 !== this.inputmask) return this.inputmask.option(n);
                    i.mask(this)
                }) : this.each(function() {
                    i.mask(this)
                });
                if (void 0 === n) return this.each(function() {
                    (i = new t(a)).mask(this)
                })
            }
        }), e.fn.inputmask
    })
}]);
