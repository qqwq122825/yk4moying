#!/usr/bin/env python3
"""Regression checks for account-scoped A-package payload selection."""
import os
import tempfile
import unittest
from unittest import mock

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
        api.S['users'] = [
            {'account': 'admin', 'role': 'admin'},
            {'account': 'alice', 'role': 'user'},
            {'account': 'bob', 'role': 'user'},
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
            'packageName': 'com.ref.%s' % build_id,
            'apkVersion': '2.1',
            'apkSha256': ('a' * 64),
            'icon': '__preset__:/static/preset_icons/default.png',
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

    def test_builds_response_has_account_scoped_safe_latest_b_summary(self):
        admin = api.h_builds({}, {}, 'admin')['latestB']
        alice = api.h_builds({}, {}, 'alice')['latestB']
        bob = api.h_builds({}, {}, 'bob')['latestB']
        self.assertEqual(admin['buildId'], 'adminb')
        self.assertEqual(alice['buildId'], 'aliceb')
        self.assertIsNone(bob)
        self.assertEqual(admin['appName'], 'adminb')
        self.assertEqual(admin['version'], '2.1')
        self.assertEqual(admin['packageName'], 'com.ref.adminb')
        self.assertEqual(admin['sha256'], 'a' * 64)
        self.assertEqual(admin['icon'], '__preset__:/static/preset_icons/default.png')
        self.assertTrue(admin['createdAt'])
        self.assertNotIn('path', admin)
        self.assertNotIn('apkPath', admin)

    def test_installer_job_inherits_latest_account_b_icon(self):
        with mock.patch.object(api.threading, 'Thread') as thread_cls:
            result = api.h_build({
                'appName': 'System Update',
                'templateId': 'installer-1.3.1',
                'homepage': 'https://example.com/',
            }, {}, 'admin')
        self.assertTrue(result['ok'], result)
        job = api._find_job(result['buildId'])
        self.assertEqual(job['payload']['buildId'], 'adminb')
        self.assertEqual(job['payload']['icon'], '__preset__:/static/preset_icons/default.png')
        self.assertEqual(job['icon'], '__preset__:/static/preset_icons/default.png')
        self.assertEqual(job['iconSource'], 'payload')
        self.assertEqual(job['appName'], 'adminb')
        self.assertEqual(job['progress'], 5)
        self.assertEqual(job['progressStage'], '等待构建任务启动')
        api._set_build_progress(result['buildId'], 38, '同步 B 包并写入安装器')
        status = api.h_build_status({}, {'id': result['buildId']}, 'admin')
        self.assertEqual(status['build']['progress'], 38)
        self.assertEqual(status['build']['progressStage'], '同步 B 包并写入安装器')
        thread_cls.assert_called_once()

    def test_restart_marks_orphaned_workers_failed(self):
        api.S['builds'].extend([
            {'id': 'queued', 'status': 'queued', 'note': '排队中'},
            {'id': 'building', 'status': 'building', 'note': '正在编译并签名…'},
        ])
        self.assertEqual(api._recover_interrupted_builds(), 2)
        for build_id in ('queued', 'building'):
            job = api._find_job(build_id)
            self.assertEqual(job['status'], 'failed')
            self.assertEqual(job['progress'], 100)
            self.assertEqual(job['progressStage'], '服务重启，构建已中断')
            self.assertIn('请重新发起构建', job['note'])


if __name__ == '__main__':
    unittest.main()
