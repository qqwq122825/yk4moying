import base64
import gzip
import unittest
import zlib

from server import refc2


class TreeReportingTests(unittest.TestCase):
    def _xml(self):
        return (
            '<hierarchy rotation="0">'
            '<node text="设置" content-desc="设置标题" '
            'resource-id="com.android.settings:id/title" '
            'class="android.widget.TextView" package="com.android.settings" '
            'clickable="true" scrollable="false" checked="false" password="false" '
            'bounds="[24,120][240,188]"/>'
            '</hierarchy>'
        )

    def _assert_tree(self, compressed):
        envelope = {
            'w': 1080,
            'h': 2400,
            'pkg': 'capture',
            'zip': base64.b64encode(compressed).decode(),
        }
        tree = refc2._decode_tree_payload(envelope)
        self.assertEqual(tree['pkg'], 'com.android.settings')
        self.assertEqual(tree['nodes'][0]['text'], '设置')
        self.assertEqual(tree['nodes'][0]['desc'], '设置标题')
        self.assertEqual(tree['nodes'][0]['bounds'], [24, 120, 240, 188])
        self.assertTrue(tree['nodes'][0]['clickable'])

    def test_decodes_client_raw_deflate_xml_tree_envelope(self):
        compressor = zlib.compressobj(level=1, wbits=-zlib.MAX_WBITS)
        compressed = compressor.compress(self._xml().encode()) + compressor.flush()
        self._assert_tree(compressed)

    def test_decodes_legacy_gzip_xml_tree_envelope(self):
        self._assert_tree(gzip.compress(self._xml().encode()))

    def test_ut_requests_accessibility_tree_and_adb_route_requests_adb_tree(self):
        self.assertEqual(refc2._tree_request_action('/api/ut/ws'), 'capture')
        self.assertEqual(refc2._tree_request_action('/api/adb-tree/ws'), 'adbUiTree')


if __name__ == '__main__':
    unittest.main()
