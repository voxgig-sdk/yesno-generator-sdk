<?php
declare(strict_types=1);

// YesnoGenerator SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

YesnoGeneratorUtility::setRegistrar(function (YesnoGeneratorUtility $u): void {
    $u->clean = [YesnoGeneratorClean::class, 'call'];
    $u->done = [YesnoGeneratorDone::class, 'call'];
    $u->make_error = [YesnoGeneratorMakeError::class, 'call'];
    $u->feature_add = [YesnoGeneratorFeatureAdd::class, 'call'];
    $u->feature_hook = [YesnoGeneratorFeatureHook::class, 'call'];
    $u->feature_init = [YesnoGeneratorFeatureInit::class, 'call'];
    $u->fetcher = [YesnoGeneratorFetcher::class, 'call'];
    $u->make_fetch_def = [YesnoGeneratorMakeFetchDef::class, 'call'];
    $u->make_context = [YesnoGeneratorMakeContext::class, 'call'];
    $u->make_options = [YesnoGeneratorMakeOptions::class, 'call'];
    $u->make_request = [YesnoGeneratorMakeRequest::class, 'call'];
    $u->make_response = [YesnoGeneratorMakeResponse::class, 'call'];
    $u->make_result = [YesnoGeneratorMakeResult::class, 'call'];
    $u->make_point = [YesnoGeneratorMakePoint::class, 'call'];
    $u->make_spec = [YesnoGeneratorMakeSpec::class, 'call'];
    $u->make_url = [YesnoGeneratorMakeUrl::class, 'call'];
    $u->param = [YesnoGeneratorParam::class, 'call'];
    $u->prepare_auth = [YesnoGeneratorPrepareAuth::class, 'call'];
    $u->prepare_body = [YesnoGeneratorPrepareBody::class, 'call'];
    $u->prepare_headers = [YesnoGeneratorPrepareHeaders::class, 'call'];
    $u->prepare_method = [YesnoGeneratorPrepareMethod::class, 'call'];
    $u->prepare_params = [YesnoGeneratorPrepareParams::class, 'call'];
    $u->prepare_path = [YesnoGeneratorPreparePath::class, 'call'];
    $u->prepare_query = [YesnoGeneratorPrepareQuery::class, 'call'];
    $u->result_basic = [YesnoGeneratorResultBasic::class, 'call'];
    $u->result_body = [YesnoGeneratorResultBody::class, 'call'];
    $u->result_headers = [YesnoGeneratorResultHeaders::class, 'call'];
    $u->transform_request = [YesnoGeneratorTransformRequest::class, 'call'];
    $u->transform_response = [YesnoGeneratorTransformResponse::class, 'call'];
});
