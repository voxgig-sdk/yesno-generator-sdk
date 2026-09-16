# YesnoGenerator SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module YesnoGeneratorFeatures
  def self.make_feature(name)
    case name
    when "base"
      YesnoGeneratorBaseFeature.new
    when "ratelimit"
      YesnoGeneratorRatelimitFeature.new
    when "retry"
      YesnoGeneratorRetryFeature.new
    when "test"
      YesnoGeneratorTestFeature.new
    when "timeout"
      YesnoGeneratorTimeoutFeature.new
    else
      YesnoGeneratorBaseFeature.new
    end
  end
end
