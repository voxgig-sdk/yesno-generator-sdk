-- YesnoGenerator SDK error

local YesnoGeneratorError = {}
YesnoGeneratorError.__index = YesnoGeneratorError


function YesnoGeneratorError.new(code, msg, ctx)
  local self = setmetatable({}, YesnoGeneratorError)
  self.is_sdk_error = true
  self.sdk = "YesnoGenerator"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function YesnoGeneratorError:error()
  return self.msg
end


function YesnoGeneratorError:__tostring()
  return self.msg
end


return YesnoGeneratorError
