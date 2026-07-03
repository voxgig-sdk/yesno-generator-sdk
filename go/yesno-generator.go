package voxgigyesnogeneratorsdk

import (
	"github.com/voxgig-sdk/yesno-generator-sdk/go/core"
	"github.com/voxgig-sdk/yesno-generator-sdk/go/entity"
	"github.com/voxgig-sdk/yesno-generator-sdk/go/feature"
	_ "github.com/voxgig-sdk/yesno-generator-sdk/go/utility"
)

// Type aliases preserve external API.
type YesnoGeneratorSDK = core.YesnoGeneratorSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type YesnoGeneratorEntity = core.YesnoGeneratorEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type YesnoGeneratorError = core.YesnoGeneratorError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewApiEntityFunc = func(client *core.YesnoGeneratorSDK, entopts map[string]any) core.YesnoGeneratorEntity {
		return entity.NewApiEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewYesnoGeneratorSDK = core.NewYesnoGeneratorSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewYesnoGeneratorSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *YesnoGeneratorSDK  { return NewYesnoGeneratorSDK(nil) }
func Test() *YesnoGeneratorSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
