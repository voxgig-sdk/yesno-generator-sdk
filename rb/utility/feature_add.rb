# YesnoGenerator SDK utility: feature_add
module YesnoGeneratorUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
