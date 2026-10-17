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


if __name__ == "__main__":
    unittest.main()
