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
        self.assertIn('setLatestB(e.latestB||null)', self.bundle)

    def test_a_card_displays_latest_b_details_and_empty_state(self):
        for text in (
            '当前将内置的 B 包',
            '已按当前账号自动匹配最新成功构建',
            '已锁定',
            '还没有可用 B 包',
            '构建时间',
            '构建 ID',
            '文件大小',
            'SHA-256：',
            'latestB.appName',
            'latestB.version',
            'latestB.packageName',
            'latestB.sha256',
            '2px solid #4f6df5',
        ):
            self.assertIn(text, self.bundle)

    def test_cache_marker_delivers_latest_bundle(self):
        self.assertIn('index-dvi-972c.js?v=build-history-v2-20261018', self.index)


if __name__ == '__main__':
    unittest.main()
