<?php
declare(strict_types=1);

// YesnoGenerator SDK utility: result_headers

class YesnoGeneratorResultHeaders
{
    public static function call(YesnoGeneratorContext $ctx): ?YesnoGeneratorResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
