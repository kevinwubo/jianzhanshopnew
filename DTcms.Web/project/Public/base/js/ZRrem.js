!
function(e) {
    function t() {
        var t = n.clientWidth,
        i = "}"; ! navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i) && t > 750 && (t = 750, i = ";max-width:" + t + "px;margin-right:auto!important;margin-left:auto!important;}"),
        e.rem = t / 10,
        /ZTE U930_TD/.test(navigator.userAgent) && (e.rem = 1.13 * e.rem),
        /Android\s+4\.4\.4;\s+M351\s/.test(navigator.userAgent) && (e.rem = e.rem / 1.05),
        /Android\s+5\.0\.1;\s+MX4\s/.test(navigator.userAgent) && (e.rem = 1.06382 * e.rem),
        /Android\s+4\.2\.2;[\s\w-;]+Coolpad\s8297[\s\w\S;]+UCBS/.test(navigator.userAgent) && (e.rem = .908 * e.rem),
        r.innerHTML = "html{font-size:" + e.rem + "px!important;}body{font-size:" + 12 * (t / 320) + "px" + i
    }
    var n = document.documentElement,
    r = document.createElement("style");
    n.firstElementChild.appendChild(r),
    e.addEventListener("resize",
    function() {
        t()
    },
    !1),
    e.addEventListener("pageshow",
    function(e) {
        e.persisted && t()
    },
    !1),
    t()
} (window);