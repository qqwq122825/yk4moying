#!/usr/bin/env python3
"""Regression checks for automatic backend-domain recognition in the builder."""
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / 'web' / 'panel' / 'assets' / 'index-dvi-972c.js'
INDEX = ROOT / 'web' / 'panel' / 'index.html'


class FrontendDomainAutoTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bundle = BUNDLE.read_text(encoding='utf-8')
        cls.index = INDEX.read_text(encoding='utf-8')

    def test_domain_defaults_to_current_panel_origin(self):
        self.assertIn('[U,V]=(0,b.useState)(()=>window.location.origin)', self.bundle)
        self.assertEqual(self.bundle.count('U.trim()||window.location.origin'), 2)

    def test_ui_explains_and_can_repeat_detection(self):
        self.assertIn('后台域名（自动识别）', self.bundle)
        self.assertIn('已自动识别当前面板域名；域名变化后刷新页面会自动更新', self.bundle)
        self.assertIn('onClick:()=>V(window.location.origin)', self.bundle)
        self.assertIn('children:"重新识别"', self.bundle)

    def test_cache_marker_delivers_new_bundle(self):
        self.assertIn('index-dvi-972c.js?v=build-card-progress-20261018', self.index)


if __name__ == '__main__':
    unittest.main()
