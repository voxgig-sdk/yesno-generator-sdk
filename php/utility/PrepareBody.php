<?php
declare(strict_types=1);

// YesnoGenerator SDK utility: prepare_body

class YesnoGeneratorPrepareBody
{
    public static function call(YesnoGeneratorContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
