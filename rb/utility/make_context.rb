# YesnoGenerator SDK utility: make_context
require_relative '../core/context'
module YesnoGeneratorUtilities
  MakeContext = ->(ctxmap, basectx) {
    YesnoGeneratorContext.new(ctxmap, basectx)
  }
end
