#!/usr/bin/env python3
"""Regression checks for the compact, account-aware build-history cards."""
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / 'web' / 'panel' / 'assets' / 'index-dvi-972c.js'


class FrontendBuildHistoryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        bundle = BUNDLE.read_text(encoding='utf-8')
        start = bundle.index('children:"构建历史"')
        end = bundle.index('var SN=', start)
        cls.history = bundle[start:end]

    def test_latest_b_is_highlighted_in_history(self):
        self.assertIn('latestB.buildId===e.buildId||latestB.id===e.id', self.history)
        self.assertIn('最新 B 包（A 包将携带）', self.history)
        self.assertIn('2px solid #4f6df5', self.history)

    def test_history_has_compact_labeled_metadata(self):
        for text in (
            'gridTemplateColumns:"84px minmax(0,1fr)"',
            '构建 ID',
            '账号 / 时间',
            '文件大小',
            '下载 APK',
        ):
            self.assertIn(text, self.history)

    def test_each_history_record_has_one_delete_control(self):
        self.assertEqual(self.history.count('children:"删除"'), 1)
        self.assertIn('确定删除此构建记录及关联文件？', self.history)


if __name__ == '__main__':
    unittest.main()
