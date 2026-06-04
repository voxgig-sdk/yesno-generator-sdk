# YesnoGenerator SDK

Random yes/no/maybe answers with matching GIFs for tongue-in-cheek decision making

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About YesNo Generator

[yesno.wtf](https://yesno.wtf) is a small novelty API that answers any question with a random `yes`, `no`, or (rarely) `maybe`, along with a matching animated GIF. It was built by Mo, Martin and Michi and is described on the homepage as a "foolproof" decision maker.

What you get from the API:
- A single `GET /api` endpoint returning JSON.
- `answer` — the string `yes`, `no`, or `maybe`.
- `forced` — boolean indicating whether the answer was pinned via the `force` query parameter.
- `image` — URL of a GIF that matches the answer.
- Optional `force` query parameter (`yes`, `no`, or `maybe`) to lock the response.

Operational notes: no authentication, CORS is enabled, and the service is publicly catalogued as healthy with sub-200 ms typical responses. A `maybe` is returned roughly once every 10,000 requests as a novelty feature.

## Try it

**TypeScript**
```bash
npm install yesno-generator
```

**Python**
```bash
pip install yesno-generator-sdk
```

**PHP**
```bash
composer require voxgig/yesno-generator-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/yesno-generator-sdk/go
```

**Ruby**
```bash
gem install yesno-generator-sdk
```

**Lua**
```bash
luarocks install yesno-generator-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { YesnoGeneratorSDK } from 'yesno-generator'

const client = new YesnoGeneratorSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o yesno-generator-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "yesno-generator": {
      "command": "/abs/path/to/yesno-generator-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Api** | The single random-answer resource exposed at `GET /api`, returning `answer`, `forced`, and `image` fields. | `/api` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from yesnogenerator_sdk import YesnoGeneratorSDK

client = YesnoGeneratorSDK({})


# Load a specific api
api, err = client.Api(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'yesnogenerator_sdk.php';

$client = new YesnoGeneratorSDK([]);


// Load a specific api
[$api, $err] = $client->Api(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/yesno-generator-sdk/go"

client := sdk.NewYesnoGeneratorSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "YesnoGenerator_sdk"

client = YesnoGeneratorSDK.new({})


# Load a specific api
api, err = client.Api(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("yesno-generator_sdk")

local client = sdk.new({})


-- Load a specific api
local api, err = client:Api(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = YesnoGeneratorSDK.test()
const result = await client.Api().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = YesnoGeneratorSDK.test(None, None)
result, err = client.Api(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = YesnoGeneratorSDK::test(null, null);
[$result, $err] = $client->Api(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Api(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = YesnoGeneratorSDK.test(nil, nil)
result, err = client.Api(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Api(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the YesNo Generator

- Upstream: [https://yesno.wtf](https://yesno.wtf)
- API docs: [https://yesno.wtf/api](https://yesno.wtf/api)

- No licence terms are published on the API page or homepage.
- No API key or authentication is required.
- Response GIFs are hosted by yesno.wtf; check before redistributing them.
- Treat as a best-effort hobby service with no SLA.

---

Generated from the YesNo Generator OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
