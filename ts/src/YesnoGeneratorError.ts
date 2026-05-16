
import { Context } from './Context'


class YesnoGeneratorError extends Error {

  isYesnoGeneratorError = true

  sdk = 'YesnoGenerator'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  YesnoGeneratorError
}

