# YesnoGenerator SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

YesnoGeneratorUtility.registrar = ->(u) {
  u.clean = YesnoGeneratorUtilities::Clean
  u.done = YesnoGeneratorUtilities::Done
  u.make_error = YesnoGeneratorUtilities::MakeError
  u.feature_add = YesnoGeneratorUtilities::FeatureAdd
  u.feature_hook = YesnoGeneratorUtilities::FeatureHook
  u.feature_init = YesnoGeneratorUtilities::FeatureInit
  u.fetcher = YesnoGeneratorUtilities::Fetcher
  u.make_fetch_def = YesnoGeneratorUtilities::MakeFetchDef
  u.make_context = YesnoGeneratorUtilities::MakeContext
  u.make_options = YesnoGeneratorUtilities::MakeOptions
  u.make_request = YesnoGeneratorUtilities::MakeRequest
  u.make_response = YesnoGeneratorUtilities::MakeResponse
  u.make_result = YesnoGeneratorUtilities::MakeResult
  u.make_point = YesnoGeneratorUtilities::MakePoint
  u.make_spec = YesnoGeneratorUtilities::MakeSpec
  u.make_url = YesnoGeneratorUtilities::MakeUrl
  u.param = YesnoGeneratorUtilities::Param
  u.prepare_auth = YesnoGeneratorUtilities::PrepareAuth
  u.prepare_body = YesnoGeneratorUtilities::PrepareBody
  u.prepare_headers = YesnoGeneratorUtilities::PrepareHeaders
  u.prepare_method = YesnoGeneratorUtilities::PrepareMethod
  u.prepare_params = YesnoGeneratorUtilities::PrepareParams
  u.prepare_path = YesnoGeneratorUtilities::PreparePath
  u.prepare_query = YesnoGeneratorUtilities::PrepareQuery
  u.result_basic = YesnoGeneratorUtilities::ResultBasic
  u.result_body = YesnoGeneratorUtilities::ResultBody
  u.result_headers = YesnoGeneratorUtilities::ResultHeaders
  u.transform_request = YesnoGeneratorUtilities::TransformRequest
  u.transform_response = YesnoGeneratorUtilities::TransformResponse
}
