# YesnoGenerator SDK feature factory

from feature.base_feature import YesnoGeneratorBaseFeature
from feature.test_feature import YesnoGeneratorTestFeature


def _make_feature(name):
    features = {
        "base": lambda: YesnoGeneratorBaseFeature(),
        "test": lambda: YesnoGeneratorTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
