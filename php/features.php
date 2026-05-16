<?php
declare(strict_types=1);

// YesnoGenerator SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class YesnoGeneratorFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new YesnoGeneratorBaseFeature();
            case "test":
                return new YesnoGeneratorTestFeature();
            default:
                return new YesnoGeneratorBaseFeature();
        }
    }
}
