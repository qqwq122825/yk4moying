#!/usr/bin/env python3
import copy
import os
import unittest

from server import api_impl


class UserRoleHierarchyTests(unittest.TestCase):
    def setUp(self):
        self.users = copy.deepcopy(api_impl.S['users'])
        self.save = api_impl.save
        self.db = api_impl.db
        api_impl.save = lambda: None
        api_impl.db = lambda: None
        self.operator = os.environ.get('REFC2_USER')
        os.environ['REFC2_USER'] = 'root'
        api_impl.S['users'] = [
            {'username': 'root', 'role': 'client', 'childUsers': []},
            {'username': 'manager', 'role': 'agent', 'parent': 'root',
             'maxClients': 1, 'expireAt': '2099-12-31 23:59:59', 'childUsers': []},
        ]

    def tearDown(self):
        api_impl.S['users'] = self.users
        api_impl.save = self.save
        api_impl.db = self.db
        if self.operator is None:
            os.environ.pop('REFC2_USER', None)
        else:
            os.environ['REFC2_USER'] = self.operator

    def test_operator_is_repaired_to_super_admin(self):
        me = api_impl.h_me({}, {}, 'root')
        self.assertEqual(me['role'], 'admin')

    def test_super_admin_can_create_manager_with_quota_and_expiry(self):
        out = api_impl.h_users_add({
            'username': 'manager2', 'password': '123456', 'role': 'agent',
            'maxClients': 3, 'expireDays': 30,
        }, {}, 'root')
        self.assertTrue(out['ok'])
        self.assertEqual(out['user']['role'], 'agent')
        self.assertEqual(out['user']['maxClients'], 3)
        self.assertTrue(out['user']['expireAt'])
        self.assertEqual(out['user']['parent'], 'root')

    def test_manager_can_only_create_clients_within_quota(self):
        denied = api_impl.h_users_add({
            'username': 'nested-admin', 'password': '123456', 'role': 'agent',
            'expireDays': 30,
        }, {}, 'manager')
        self.assertFalse(denied['ok'])

        created = api_impl.h_users_add({
            'username': 'client1', 'password': '123456', 'role': 'client',
            'expireDays': 30,
        }, {}, 'manager')
        self.assertTrue(created['ok'])
        self.assertEqual(created['user']['parent'], 'manager')

        over_quota = api_impl.h_users_add({
            'username': 'client2', 'password': '123456', 'role': 'client',
            'expireDays': 30,
        }, {}, 'manager')
        self.assertFalse(over_quota['ok'])
        self.assertIn('配额', over_quota['error'])

    def test_manager_list_is_scoped_to_self_and_direct_clients(self):
        api_impl.S['users'].extend([
            {'username': 'mine', 'role': 'client', 'parent': 'manager', 'childUsers': []},
            {'username': 'other', 'role': 'client', 'parent': 'someone-else', 'childUsers': []},
        ])
        rows = api_impl.h_users({}, {}, 'manager')['users']
        self.assertEqual({row['username'] for row in rows}, {'manager', 'mine'})


if __name__ == '__main__':
    unittest.main()
