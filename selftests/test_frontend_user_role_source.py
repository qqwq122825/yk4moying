#!/usr/bin/env python3
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]


class FrontendUserRoleSourceTests(unittest.TestCase):
    def test_users_page_reads_role_from_authenticated_context(self):
        source = (ROOT / 'web/panel/assets/index-dvi-972c.js').read_text(encoding='utf-8')
        self.assertIn('qP=()=>{const{state:e}=Ot();return e.currentUser?.role||"client"}', source)
        self.assertNotIn('JSON.parse(atob(e.split(".")[1])).role', source)
        self.assertIn('qU=()=>{const{state:e}=Ot();return e.currentUser?.username||""}', source)
        self.assertNotIn('JSON.parse(atob(e.split(".")[1])).sub', source)
        self.assertIn('client:{label:"普通用户"', source)


if __name__ == '__main__':
    unittest.main()
