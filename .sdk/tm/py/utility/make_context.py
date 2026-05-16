# YesnoGenerator SDK utility: make_context

from core.context import YesnoGeneratorContext


def make_context_util(ctxmap, basectx):
    return YesnoGeneratorContext(ctxmap, basectx)
