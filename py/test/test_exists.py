# ProjectName SDK exists test

import pytest
from yesnogenerator_sdk import YesnoGeneratorSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = YesnoGeneratorSDK.test(None, None)
        assert testsdk is not None
