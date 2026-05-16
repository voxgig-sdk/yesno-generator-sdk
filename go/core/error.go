package core

type YesnoGeneratorError struct {
	IsYesnoGeneratorError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewYesnoGeneratorError(code string, msg string, ctx *Context) *YesnoGeneratorError {
	return &YesnoGeneratorError{
		IsYesnoGeneratorError: true,
		Sdk:              "YesnoGenerator",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *YesnoGeneratorError) Error() string {
	return e.Msg
}
