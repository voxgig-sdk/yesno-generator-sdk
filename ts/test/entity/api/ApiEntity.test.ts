

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { YesnoGeneratorSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('ApiEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when YESNO_GENERATOR_TEST_LIVE=TRUE.
  afterEach(liveDelay('YESNO_GENERATOR_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = YesnoGeneratorSDK.test()
    const ent = testsdk.Api()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.YESNO_GENERATOR_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'api.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"answer","req":true,"short":"The answer: 'yes' or 'no'","type":"`$STRING`","index$":0},{"active":true,"name":"forced","req":true,"short":"Indicates whether the answer was forced via query parameter","type":"`$BOOLEAN`","index$":1},{"active":true,"format":"uri","name":"image","req":true,"short":"URL of a GIF image corresponding to the answer","type":"`$STRING`","index$":2}],"name":"api","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"force","orig":"force","reqd":false,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /api","json":"{\"operationId\":\"getYesNoAnswer\",\"parameters\":[{\"description\":\"Force a specific answer ('yes' or 'no')\",\"in\":\"query\",\"name\":\"force\",\"required\":false,\"schema\":{\"enum\":[\"yes\",\"no\"],\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"answer\":\"no\",\"forced\":false,\"image\":\"https://yesno.wtf/assets/no/24-159febcfd655625c38c147b65e5be565.gif\"},\"schema\":{\"properties\":{\"answer\":{\"description\":\"The answer: 'yes' or 'no'\",\"enum\":[\"yes\",\"no\"],\"type\":\"string\"},\"forced\":{\"description\":\"Indicates whether the answer was forced via query parameter\",\"type\":\"boolean\"},\"image\":{\"description\":\"URL of a GIF image corresponding to the answer\",\"format\":\"uri\",\"type\":\"string\"}},\"required\":[\"answer\",\"forced\",\"image\"],\"type\":\"object\"}}},\"description\":\"Successful response with yes/no answer\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/api","segments":[{"lit":"api"}],"select":{"exist":["force"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"api","name__orig":"api","Name":"Api","name_":"api","name-":"api","NAME":"API","index$":0}, {"active":true,"entity":"api","key$":"BasicApiFlow","kind":"basic","name":"BasicApiFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"api_ref01","srcdatavar":"api_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-api_ref01"}}],"index$":0}]}, 'Api')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let api_ref01_data = Object.values(setup.data.existing.api)[0] as any

    // LOAD
    const api_ref01_ent = client.Api()
    const api_ref01_match_dt0: any = {}
    const api_ref01_data_dt0 = (await api_ref01_ent.load(api_ref01_match_dt0)).data()
    assert(null != api_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/api/ApiTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = YesnoGeneratorSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['api01','api02','api03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'YESNO_GENERATOR_TEST_API_ENTID': idmap,
    'YESNO_GENERATOR_TEST_LIVE': 'FALSE',
    'YESNO_GENERATOR_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['YESNO_GENERATOR_TEST_API_ENTID']

  const live = 'TRUE' === env.YESNO_GENERATOR_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['YESNO_GENERATOR_TEST_API_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new YesnoGeneratorSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.YESNO_GENERATOR_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
