#!/usr/bin/env python3
"""Regression checks for A-package visibility of its embedded B package."""
import json
from pathlib import Path
import tempfile
import unittest

from server.source_builder import BuildError, patch_installer


class InstallerPackageVisibilityTest(unittest.TestCase):
    def _project(self, manifest):
        tmp = tempfile.TemporaryDirectory()
        root = Path(tmp.name)
        (root / 'AndroidManifest.xml').write_text(manifest, encoding='utf-8')
        return tmp, root

    def test_current_placeholder_is_replaced_with_payload_package(self):
        tmp, root = self._project(
            '<manifest><queries><package android:name="__PAYLOAD_PACKAGE_NAME__"/>'
            '</queries></manifest>'
        )
        self.addCleanup(tmp.cleanup)
        payload = root / 'b.apk'
        payload.write_bytes(b'payload')
        cfg = patch_installer(str(root), {
            'payload_path': str(payload),
            'payload_package': 'com.example.latestb',
            'payload_name': '测试',
            'payload_build_id': 'b123',
        })
        manifest = (root / 'AndroidManifest.xml').read_text(encoding='utf-8')
        self.assertIn('android:name="com.example.latestb"', manifest)
        self.assertNotIn('__PAYLOAD_PACKAGE_NAME__', manifest)
        self.assertEqual(cfg['payloadPackageName'], 'com.example.latestb')
        saved = json.loads((root / 'assets' / 'installer_config.json').read_text())
        self.assertEqual(saved['payloadPackageName'], 'com.example.latestb')

    def test_legacy_hard_coded_package_is_still_replaced(self):
        tmp, root = self._project(
            '<manifest><queries><package android:name="org.boundarylab.screenagent"/>'
            '</queries></manifest>'
        )
        self.addCleanup(tmp.cleanup)
        patch_installer(str(root), {'payload_package': 'com.example.latestb'})
        self.assertIn('com.example.latestb',
                      (root / 'AndroidManifest.xml').read_text(encoding='utf-8'))

    def test_missing_queries_target_fails_closed(self):
        tmp, root = self._project('<manifest><application/></manifest>')
        self.addCleanup(tmp.cleanup)
        with self.assertRaisesRegex(BuildError, 'queries'):
            patch_installer(str(root), {'payload_package': 'com.example.latestb'})


if __name__ == '__main__':
    unittest.main()
