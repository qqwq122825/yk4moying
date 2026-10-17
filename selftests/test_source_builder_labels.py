#!/usr/bin/env python3
"""Regression checks for app/accessibility label synchronization."""
from pathlib import Path
import tempfile
import unittest

from server.source_builder import patch_app_name


class SourceBuilderLabelTest(unittest.TestCase):
    def _project(self, strings):
        tmp = tempfile.TemporaryDirectory()
        values = Path(tmp.name) / 'res' / 'values'
        values.mkdir(parents=True)
        (values / 'strings.xml').write_text(strings, encoding='utf-8')
        return tmp, values / 'strings.xml'

    def test_b_package_syncs_accessibility_label_to_app_name(self):
        tmp, path = self._project(
            '<resources><string name="app_name">KISSLY</string>'
            '<string name="acc_name">KISSLY</string></resources>'
        )
        self.addCleanup(tmp.cleanup)
        patch_app_name(tmp.name, '测试 & 工具')
        xml = path.read_text(encoding='utf-8')
        self.assertIn('<string name="app_name">测试 &amp; 工具</string>', xml)
        self.assertIn('<string name="acc_name">测试 &amp; 工具</string>', xml)

    def test_template_without_accessibility_label_remains_supported(self):
        tmp, path = self._project(
            '<resources><string name="app_name">Installer</string></resources>'
        )
        self.addCleanup(tmp.cleanup)
        patch_app_name(tmp.name, '安装器')
        self.assertIn('<string name="app_name">安装器</string>', path.read_text(encoding='utf-8'))


if __name__ == '__main__':
    unittest.main()
