import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
class ContractTests(unittest.TestCase):
    def test_ecr_immutability(self):
        self.assertIn('image_tag_mutability = "IMMUTABLE"',(ROOT/'modules/ecr/main.tf').read_text())
    def test_ecr_scan(self):
        self.assertIn('scan_on_push = true',(ROOT/'modules/ecr/main.tf').read_text())
    def test_no_credentials_in_example(self):
        data='\n'.join(p.read_text() for p in (ROOT/'live').rglob('*.tf'))
        self.assertNotIn('access_key =',data)
        self.assertNotIn('secret_key =',data)
