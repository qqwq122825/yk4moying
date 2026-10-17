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
        self.assertIn('[domain,setDomain]=(0,b.useState)(()=>window.location.origin)', self.bundle)
        self.assertEqual(self.bundle.count('domain.trim()||window.location.origin'), 2)

    def test_ui_explains_and_can_repeat_detection(self):
        self.assertIn('后台域名', self.bundle)
        self.assertIn('placeholder:window.location.origin', self.bundle)

    def test_cache_marker_delivers_new_bundle(self):
        self.assertIn('index-dvi-972c.js?v=app-autosync-v8-20261018', self.index)


if __name__ == '__main__':
    unittest.main()
