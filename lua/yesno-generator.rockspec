package = "voxgig-sdk-yesno-generator"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/yesno-generator-sdk.git"
}
description = {
  summary = "YesnoGenerator SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["yesno-generator_sdk"] = "yesno-generator_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
