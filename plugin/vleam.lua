local configs = require 'lspconfig.configs'
if not configs.vleam then
  configs.vleam = {
    default_config = {
      cmd = { "vleam", "lsp" },
      filetypes = { 'vue' },
      root_dir = require "lspconfig.util".root_pattern("package.json", "gleam.toml"),
      settings = {},
    };
  }
end

local conform = require("conform")
local conform_util = require("conform.util")

if not conform.formatters.vleam then
  conform.formatters.vleam = {
    stdin = true,
    command = conform_util.from_node_modules("vleam"),
    args = { "format", "--stdin"},
  }
end
