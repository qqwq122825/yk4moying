#!/usr/bin/env python3
import os
import sys
import unittest
from unittest import mock

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'server'))
import refc2


class DummyRequest:
    def __init__(self, body):
        self.body = body

    async def json(self):
        return self.body


class CommandParamsTest(unittest.IsolatedAsyncioTestCase):
    async def _call(self, body):
        with mock.patch.object(refc2, '_auth', return_value=True), \
             mock.patch.object(refc2, 'send_command', new_callable=mock.AsyncMock,
                               return_value=True) as send:
            response = await refc2.api_command(DummyRequest(body))
            self.assertEqual(response.status, 200)
            return send

    async def test_react_panel_params_reach_device_data(self):
        send = await self._call({
            'deviceId': 'phone', 'action': 'clickPoint',
            'params': {'x': 540, 'y': 1200},
        })
        send.assert_awaited_once_with('phone', 'clickPoint', {'x': 540, 'y': 1200})

    async def test_legacy_data_keeps_precedence(self):
        send = await self._call({
            'deviceId': 'phone', 'action': 'gestureB',
            'data': {'gesture': [{'flag': 'down', 'x': 1, 'y': 2}]},
            'params': {'ignored': True},
        })
        send.assert_awaited_once_with(
            'phone', 'gestureB', {'gesture': [{'flag': 'down', 'x': 1, 'y': 2}]})


if __name__ == '__main__':
    unittest.main()
