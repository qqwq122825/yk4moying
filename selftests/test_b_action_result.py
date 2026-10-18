#!/usr/bin/env python3
"""Static protocol guard for B-package anti-uninstall acknowledgements."""

from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
SMALI_ROOT = ROOT / "apk-project/project/smali"


class BActionResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # macOS normalizes Unicode filenames while Linux/ext4 does not.  Locate
        # the obfuscated dispatcher by stable command literals instead of a
        # visually identical but normalization-sensitive filename.
        for candidate in SMALI_ROOT.rglob("*.smali"):
            source = candidate.read_text(encoding="utf-8", errors="ignore")
            if '"antiDeleteOn"' in source and '"antiDeleteOff"' in source:
                cls.dispatcher = candidate
                cls.source = source
                break
        else:
            raise AssertionError("B command dispatcher smali was not found")

    def test_action_result_payload_has_server_contract(self):
        method = re.search(
            r"\.method public final reportAntiDeleteResult\(Z\)V(?P<body>.*?)\.end method",
            self.source,
            re.S,
        )
        self.assertIsNotNone(method)
        body = method.group("body")
        for literal in (
            '"antiDeleteOn"',
            '"antiDeleteOff"',
            '"action"',
            '"success"',
            '"effect"',
            '"anti_uninstall"',
            '"deviceId"',
            '"action_result"',
        ):
            self.assertIn(literal, body)

    def test_both_preference_branches_acknowledge_applied_value(self):
        for label, value in (("pswitch_40", "0x1"), ("pswitch_3f", "0x0")):
            branch = re.search(
                rf":{label}(?P<body>.*?)(?=\n    :pswitch_|\n    :goto_5)",
                self.source,
                re.S,
            )
            self.assertIsNotNone(branch)
            self.assertIn(f"const/4 v5, {value}", branch.group("body"))
        apply_block = re.search(
            r":goto_5(?P<body>.*?goto/16 :goto_e)", self.source, re.S
        )
        self.assertIsNotNone(apply_block)
        body = apply_block.group("body")
        self.assertLess(body.index("->apply()V"), body.index("->reportAntiDeleteResult(Z)V"))

    def test_anti_delete_off_removes_the_real_device_admin(self):
        branch = re.search(
            r":pswitch_3f(?P<body>.*?)(?=\n    :pswitch_|\n    :goto_5)",
            self.source,
            re.S,
        )
        self.assertIsNotNone(branch)
        body = branch.group("body")
        self.assertIn("Landroid/app/admin/DevicePolicyManager;->isAdminActive", body)
        self.assertIn("Landroid/app/admin/DevicePolicyManager;->removeActiveAdmin", body)
        self.assertIn("Lcom/lite/cloudfinder/rda;", body)


if __name__ == "__main__":
    unittest.main(verbosity=2)
