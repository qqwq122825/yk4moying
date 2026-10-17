#!/usr/bin/env python3
"""Regression checks for account-scoped A-package payload selection."""
import os
import tempfile
import unittest

os.environ.setdefault('REFC2_STORE', os.path.join(tempfile.gettempdir(), 'yk4-ab-isolation-test.json'))

from server import api_impl as api


class ABAccountIsolationTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        api._BUILD_DEST_DIR = self.tmp.name
        for build_id in ('adminb', 'admin_for_alice', 'aliceb', 'legacyb'):
            with open(os.path.join(self.tmp.name, build_id + '.apk'), 'wb') as fh:
                fh.write(b'apk')
        api.S['builds'] = [
            self.build('adminb', 'admin', 'admin', 100),
            self.build('admin_for_alice', 'admin', 'alice', 300),
            self.build('aliceb', 'alice', 'alice', 400),
            self.build('legacyb', '', '', 500),
        ]

    def tearDown(self):
        self.tmp.cleanup()

    @staticmethod
    def build(build_id, owner, recipient, ts):
        row = {
            'id': build_id,
            'owner': owner,
            'ts': ts,
            'status': 'done',
            'apkPath': '/dl/%s.apk' % build_id,
            'appName': build_id,
            'templateSnapshot': {'kind': 'screenagent'},
        }
        if recipient:
            row['recipient'] = {'account': recipient}
        return row

    def test_latest_b_matches_actor_and_recipient(self):
        admin = api._latest_payload_build('admin', 'admin')
        alice = api._latest_payload_build('alice', 'alice')
        self.assertEqual(admin['buildId'], 'adminb')
        self.assertEqual(admin['owner'], 'admin')
        self.assertEqual(admin['recipientAccount'], 'admin')
        self.assertEqual(alice['buildId'], 'aliceb')

    def test_cross_account_and_legacy_rows_fail_closed(self):
        self.assertIsNone(api._latest_payload_build('bob', 'bob'))
        self.assertIsNone(api._latest_payload_build('', 'admin'))
        self.assertIsNone(api._latest_payload_build('admin', ''))


if __name__ == '__main__':
    unittest.main()
