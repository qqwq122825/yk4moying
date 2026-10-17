#!/usr/bin/env python3
"""Regression checks for the latest account-scoped B-package summary in A builder."""
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / 'web' / 'panel' / 'assets' / 'index-dvi-972c.js'
INDEX = ROOT / 'web' / 'panel' / 'index.html'


class FrontendLatestBSummaryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bundle = BUNDLE.read_text(encoding='utf-8')
        cls.index = INDEX.read_text(encoding='utf-8')

    def test_api_summary_is_stored_after_refresh(self):
        self.assertIn('[latestB,setLatestB]=(0,b.useState)(null)', self.bundle)
        self.assertIn('setLatestB(data.latestB||null)', self.bundle)

    def test_a_card_displays_latest_b_details_and_empty_state(self):
        for text in (
            '将携带 B 包',
            '还没有可用 B 包',
            'latestB.appName',
            'latestB.packageName',
            'latestB.sha256',
            '构建 A 包时自动同步 B 包图标',
            '#f3f8ff',
        ):
            self.assertIn(text, self.bundle)

    def test_cache_marker_delivers_latest_bundle(self):
        self.assertIn('index-dvi-972c.js?v=app-autosync-v8-20261018', self.index)


if __name__ == '__main__':
    unittest.main()
