#!/usr/bin/env python3
import unittest
from unittest import mock

from server import api_impl, refc2


class DeviceAppCacheTests(unittest.TestCase):
    def setUp(self):
        self.old_cache = api_impl.S.get('cache')
        api_impl.S['cache'] = {}

    def tearDown(self):
        api_impl.S['cache'] = self.old_cache

    def test_icon_list_reply_is_available_after_page_refresh(self):
        payload = {'data': [
            {'pkg': 'com.example.one', 'name': 'One'},
            {'pkg': 'com.example.two', 'name': 'Two'},
        ]}
        rec = {}
        with mock.patch.object(api_impl, 'save') as save:
            self.assertTrue(refc2._cache_device_dataset(
                rec, 'device-1', 'iconList', payload))
            save.assert_called_once()

        out = api_impl.h_device_cache({}, {'deviceId': 'device-1'}, 'mtx')
        self.assertTrue(out['ok'])
        self.assertEqual(out['cache']['apps']['action'], 'iconList')
        self.assertEqual(out['cache']['apps']['data'], payload)
        self.assertEqual(len(out['cache']['apps']['data']['data']), 2)

    def test_unchanged_periodic_reply_does_not_rewrite_store(self):
        payload = {'data': [{'pkg': 'com.example.one', 'name': 'One'}]}
        with mock.patch.object(api_impl, 'save') as save:
            self.assertTrue(api_impl.cache_device_payload(
                'device-1', 'apps', 'iconList', payload, 100))
            self.assertFalse(api_impl.cache_device_payload(
                'device-1', 'apps', 'iconList', payload, 200))
            save.assert_called_once()
        cached = api_impl.S['cache']['device-1']['apps']
        self.assertEqual(cached['updatedAt'], 100)
        self.assertEqual(cached['checkedAt'], 200)


if __name__ == '__main__':
    unittest.main()
