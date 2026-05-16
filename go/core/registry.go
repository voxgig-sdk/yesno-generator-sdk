package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewApiEntityFunc func(client *YesnoGeneratorSDK, entopts map[string]any) YesnoGeneratorEntity

