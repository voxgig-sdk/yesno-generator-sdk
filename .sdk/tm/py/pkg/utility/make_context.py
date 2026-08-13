# YesnoGenerator SDK utility: make_context

from projectname_sdk.core.context import YesnoGeneratorContext


def make_context_util(ctxmap, basectx):
    return YesnoGeneratorContext(ctxmap, basectx)
