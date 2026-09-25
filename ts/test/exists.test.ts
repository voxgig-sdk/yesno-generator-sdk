
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { YesnoGeneratorSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = YesnoGeneratorSDK.test()
    equal(testsdk instanceof YesnoGeneratorSDK, true,
      'YesnoGeneratorSDK.test() must return a client synchronously')
  })

})
