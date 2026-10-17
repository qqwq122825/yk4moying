#!/usr/bin/env python3
import json
import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'protocol'))
import binary_proto as bp


class BinaryProtocolTest(unittest.TestCase):
    def test_exact_apk_five_byte_header(self):
        payload = b'\xff\xd8\xffscreen'
        packet = bp.pack(bp.T_SCREEN, payload)
        self.assertEqual(packet[:5], b'\x01\x00\x00\x00\t')
        self.assertEqual(bp.parse(packet)['payload'], payload)

    def test_multiple_frames_per_ws_message(self):
        hello = json.dumps({'deviceId': 'dev', 'apkId': 10020}, separators=(',', ':')).encode()
        raw = bp.pack(bp.T_HELLO, hello) + bp.pack(bp.T_THUMB, b'jpg')
        frames, error = bp.parse_many(raw)
        self.assertIsNone(error)
        self.assertEqual([f['type'] for f in frames], [bp.T_HELLO, bp.T_THUMB])

    def test_rejects_truncated_payload(self):
        frames, error = bp.parse_many(b'\x01\x00\x00\x00\x05abc')
        self.assertEqual(frames, [])
        self.assertEqual(error, 'truncated_payload')


if __name__ == '__main__':
    unittest.main()
