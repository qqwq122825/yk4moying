#!/usr/bin/env python3
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
JS = (ROOT / 'web/panel/assets/index-dvi-972c.js').read_text(encoding='utf-8')
CSS = (ROOT / 'web/panel/assets/index-DTncntn-.css').read_text(encoding='utf-8')
HTML = (ROOT / 'web/panel/index.html').read_text(encoding='utf-8')

class FrontendDevicePolicyUITest(unittest.TestCase):
    def test_quick_panel_explains_policy_and_commands(self):
        self.assertIn('应用卸载保护', JS)
        self.assertIn('开启卸载保护', JS)
        self.assertIn('关闭卸载保护', JS)
        self.assertIn('antiDeleteOn', JS)
        self.assertIn('antiDeleteOff', JS)
        self.assertIn('当前：开启', JS)
        self.assertIn('当前：关闭', JS)
        self.assertIn('antiUninstallStatus', JS)
        self.assertIn('aria-pressed', JS)

    def test_policy_controls_use_compact_standard_buttons(self):
        self.assertNotIn('policy:!0', JS)
        self.assertNotIn('ctrl-side-policy-copy', JS)
        self.assertNotIn('.ctrl-side-btn.is-policy', CSS)
        self.assertIn('.ctrl-side-btn.is-active-on', CSS)
        self.assertIn('.ctrl-side-btn.is-active-off', CSS)
        self.assertIn('.ctrl-side-btn.is-active', CSS)
        self.assertIn('device-policy-status-v3-20261018', HTML)

if __name__ == '__main__':
    unittest.main()
