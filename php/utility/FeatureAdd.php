<?php
declare(strict_types=1);

// YesnoGenerator SDK utility: feature_add

class YesnoGeneratorFeatureAdd
{
    public static function call(YesnoGeneratorContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
