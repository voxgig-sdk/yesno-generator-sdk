<?php
declare(strict_types=1);

// YesnoGenerator SDK utility: result_body

class YesnoGeneratorResultBody
{
    public static function call(YesnoGeneratorContext $ctx): ?YesnoGeneratorResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
