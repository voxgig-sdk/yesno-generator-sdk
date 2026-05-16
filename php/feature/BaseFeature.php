<?php
declare(strict_types=1);

// YesnoGenerator SDK base feature

class YesnoGeneratorBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(YesnoGeneratorContext $ctx, array $options): void {}
    public function PostConstruct(YesnoGeneratorContext $ctx): void {}
    public function PostConstructEntity(YesnoGeneratorContext $ctx): void {}
    public function SetData(YesnoGeneratorContext $ctx): void {}
    public function GetData(YesnoGeneratorContext $ctx): void {}
    public function GetMatch(YesnoGeneratorContext $ctx): void {}
    public function SetMatch(YesnoGeneratorContext $ctx): void {}
    public function PrePoint(YesnoGeneratorContext $ctx): void {}
    public function PreSpec(YesnoGeneratorContext $ctx): void {}
    public function PreRequest(YesnoGeneratorContext $ctx): void {}
    public function PreResponse(YesnoGeneratorContext $ctx): void {}
    public function PreResult(YesnoGeneratorContext $ctx): void {}
    public function PreDone(YesnoGeneratorContext $ctx): void {}
    public function PreUnexpected(YesnoGeneratorContext $ctx): void {}
}
