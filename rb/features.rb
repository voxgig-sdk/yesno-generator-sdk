# YesnoGenerator SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module YesnoGeneratorFeatures
  def self.make_feature(name)
    case name
    when "base"
      YesnoGeneratorBaseFeature.new
    when "test"
      YesnoGeneratorTestFeature.new
    else
      YesnoGeneratorBaseFeature.new
    end
  end
end
