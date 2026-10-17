#!/usr/bin/env python3
"""Regression checks for the live accessibility reader's lock-pattern overlay."""

from pathlib import Path
import subprocess


BUNDLE = Path(__file__).resolve().parents[1] / "web/panel/assets/index-dvi-972c.js"


def main() -> None:
    source = BUNDLE.read_text(encoding="utf-8")
    assert "function __yk4PatternGridCandidate" in source
    assert "if(e.some(r))return e" not in source
    assert "e.syntheticPattern=!0" in source
    assert 'e.cls="LockPatternView"' in source
    assert "||c&&u.length" in source
    assert 'children:"九宫格"' in source
    assert "for(let a=0;a<3;a++)for(let s=0;s<3;s++)" in source
    helper = source[source.index("function __yk4PatternGridCandidate") : source.index("function mT")]
    probe = helper + r'''
const dims={w:1080,h:2400};
const fallback=[
  {b:[0,0,10,10],txt:"",cls:"PatternDecorator"},
  {b:[100,800,900,1600],txt:"",cls:"android.view.View"},
  {b:[320,1900,760,2020],txt:"紧急呼叫",cls:"android.widget.Button"}
];
__yk4RestorePatternGrid(fallback,dims,"capture");
if(!fallback[1].syntheticPattern || fallback[1].cls!=="LockPatternView") throw new Error("fallback grid was not promoted");
const actual=[{b:[120,760,960,1600],txt:"",cls:"com.android.internal.widget.LockPatternView"}];
__yk4RestorePatternGrid(actual,dims,"com.android.systemui");
if(!actual[0].syntheticPattern) throw new Error("real grid was not marked");
const pin=[{b:[100,800,900,1600],txt:"",cls:"android.view.View"},{b:[100,200,900,300],txt:"输入数字密码",cls:"android.widget.TextView"}];
__yk4RestorePatternGrid(pin,dims,"com.android.systemui");
if(pin.some(n=>n.syntheticPattern)) throw new Error("PIN screen was misclassified");
console.log("PASS: candidate promotion covers missing package metadata and ignores PIN screens");
'''
    completed = subprocess.run(
        ["node", "-e", probe], check=True, capture_output=True, text=True
    )
    print(completed.stdout.strip())
    print("PASS: robust synthetic 1-9 lock-pattern grid is enabled")


if __name__ == "__main__":
    main()
