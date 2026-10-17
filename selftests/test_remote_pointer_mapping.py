from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
BUNDLES = (
    ROOT / "web/panel/assets/index-dvi-972c.js",
    ROOT / "materials/moying/panel_bundle_current.js",
)


class RemotePointerMappingTests(unittest.TestCase):
    def test_pointer_coordinates_use_frame_native_dimensions(self):
        for bundle in BUNDLES:
            source = bundle.read_text(encoding="utf-8")
            self.assertIn(
                "const c=r.naturalWidth,d=r.naturalHeight",
                source,
                msg=str(bundle),
            )
            self.assertNotIn(
                "const c=3*r.naturalWidth,d=3*r.naturalHeight",
                source,
                msg=str(bundle),
            )


if __name__ == "__main__":
    unittest.main()
