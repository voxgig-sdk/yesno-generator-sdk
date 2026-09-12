# YesnoGenerator SDK configuration

module YesnoGeneratorConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "YesnoGenerator",
        "slug" => "yesno-generator",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://yesno.wtf",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "api" => {},
        },
      },
      "entity" => {
        "api" => {
          "fields" => [
            {
              "name" => "answer",
              "req" => true,
              "short" => "The answer: 'yes' or 'no'",
              "type" => "`$STRING`",
            },
            {
              "name" => "forced",
              "req" => true,
              "short" => "Indicates whether the answer was forced via query parameter",
              "type" => "`$BOOLEAN`",
            },
            {
              "format" => "uri",
              "name" => "image",
              "req" => true,
              "short" => "URL of a GIF image corresponding to the answer",
              "type" => "`$STRING`",
            },
          ],
          "name" => "api",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "force",
                        "orig" => "force",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "force",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    YesnoGeneratorFeatures.make_feature(name)
  end
end
