#!/usr/bin/env python3
from pathlib import Path
import sys
import unittest
from unittest import mock


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "server"))
import api_impl


class InjectAdminPermissionsTest(unittest.TestCase):
    def _response_for(self, role):
        with mock.patch.object(api_impl, "db", return_value=None), \
             mock.patch.object(
                 api_impl,
                 "ensure_actor_profile",
                 return_value={"username": "tester", "role": role},
             ):
            return api_impl.h_inject_list({}, {}, "tester")

    def test_admin_can_edit_inject_settings(self):
        response = self._response_for("admin")
        self.assertIs(response.get("canEdit"), True)
        self.assertIs(response.get("isAdmin"), True)

    def test_member_is_read_only(self):
        response = self._response_for("user")
        self.assertIs(response.get("canEdit"), False)
        self.assertIs(response.get("isAdmin"), False)


if __name__ == "__main__":
    unittest.main()
