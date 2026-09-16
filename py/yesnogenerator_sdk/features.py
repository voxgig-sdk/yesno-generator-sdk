# YesnoGenerator SDK feature factory

from yesnogenerator_sdk.feature.base_feature import YesnoGeneratorBaseFeature
from yesnogenerator_sdk.feature.ratelimit_feature import YesnoGeneratorRatelimitFeature
from yesnogenerator_sdk.feature.retry_feature import YesnoGeneratorRetryFeature
from yesnogenerator_sdk.feature.test_feature import YesnoGeneratorTestFeature
from yesnogenerator_sdk.feature.timeout_feature import YesnoGeneratorTimeoutFeature


_FEATURES = {
    "base": lambda: YesnoGeneratorBaseFeature(),
    "ratelimit": lambda: YesnoGeneratorRatelimitFeature(),
    "retry": lambda: YesnoGeneratorRetryFeature(),
    "test": lambda: YesnoGeneratorTestFeature(),
    "timeout": lambda: YesnoGeneratorTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
