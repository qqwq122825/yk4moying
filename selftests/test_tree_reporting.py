import base64
import gzip
import unittest

from server import refc2


class TreeReportingTests(unittest.TestCase):
    def test_decodes_gzipped_xml_tree_envelope(self):
        xml = (
            '<hierarchy rotation="0">'
            '<node text="设置" content-desc="设置标题" '
            'resource-id="com.android.settings:id/title" '
            'class="android.widget.TextView" package="com.android.settings" '
            'clickable="true" scrollable="false" checked="false" password="false" '
            'bounds="[24,120][240,188]"/>'
            '</hierarchy>'
        )
        envelope = {
            'w': 1080,
            'h': 2400,
            'pkg': 'capture',
            'zip': base64.b64encode(gzip.compress(xml.encode())).decode(),
        }
        tree = refc2._decode_tree_payload(envelope)
        self.assertEqual(tree['pkg'], 'com.android.settings')
        self.assertEqual(tree['nodes'][0]['text'], '设置')
        self.assertEqual(tree['nodes'][0]['desc'], '设置标题')
        self.assertEqual(tree['nodes'][0]['bounds'], [24, 120, 240, 188])
        self.assertTrue(tree['nodes'][0]['clickable'])

    def test_ut_requests_accessibility_tree_and_adb_route_requests_adb_tree(self):
        self.assertEqual(refc2._tree_request_action('/api/ut/ws'), 'capture')
        self.assertEqual(refc2._tree_request_action('/api/adb-tree/ws'), 'adbUiTree')


if __name__ == '__main__':
    unittest.main()
