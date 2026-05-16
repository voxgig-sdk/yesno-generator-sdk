# YesnoGenerator SDK exists test

require "minitest/autorun"
require_relative "../YesnoGenerator_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = YesnoGeneratorSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
