<?php
declare(strict_types=1);

// YesnoGenerator SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class YesnoGeneratorMakeContext
{
    public static function call(array $ctxmap, ?YesnoGeneratorContext $basectx): YesnoGeneratorContext
    {
        return new YesnoGeneratorContext($ctxmap, $basectx);
    }
}
