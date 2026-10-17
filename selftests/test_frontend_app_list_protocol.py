#!/usr/bin/env python3
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / "web/panel/assets/index-dvi-972c.js"


class FrontendAppListProtocolTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bundle = BUNDLE.read_text(encoding="utf-8")

    def test_apps_view_requests_launcher_app_list(self):
        if 'VN(t,"iconList",{},c)' not in self.bundle:
            self.fail("apps view does not request iconList")
        if 'VN(t,"walletList",{},c)' in self.bundle:
            self.fail("apps view still requests walletList")

    def test_websocket_accepts_icon_list_response(self):
        if '/appList|iconList|fetchIcon|walletList/i' not in self.bundle:
            self.fail("websocket handler does not accept iconList")

    def test_apps_view_auto_refreshes_without_manual_click(self):
        self.assertIn('"apps"!==o)return;let e=!0;const n=()=>', self.bundle)
        self.assertIn('setInterval(n,12e4)', self.bundle)
        self.assertIn('Promise.resolve(ke()).finally(()=>{e&&x(!1)})', self.bundle)
        self.assertIn('document.addEventListener("visibilitychange",i)', self.bundle)
        self.assertIn('自动同步', self.bundle)
        self.assertIn('onFetch:()=>{x(!0),VN(t,"iconList",{},c),Promise.resolve(ke()).finally(()=>x(!1))}', self.bundle)
        self.assertIn('立即更新', self.bundle)


if __name__ == "__main__":
    unittest.main()
