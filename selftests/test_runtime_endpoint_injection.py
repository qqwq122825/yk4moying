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


if __name__ == '__main__':
    unittest.main()
