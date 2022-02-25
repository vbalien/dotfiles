local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local lspconfig = require "lspconfig"

local function on_attach(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local servers = {
  "eslint",
  "tsserver",
  "sumneko_lua",
  "vimls",
  "jsonls",
  "denols",
}

local enhance_server_opts = {
  ["eslint"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern { ".git/" }
    opts.settings = {
      packageManager = "yarn",
      workingDirectory = { mode = "location" },
    }
  end,

  ["tsserver"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern { "package.json" }
  end,

  ["denols"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern { "deno.jsonc", "deno.json" }
  end,

  ["sumneko_lua"] = function(opts)
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    opts.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end,

  ["jsonls"] = function(opts)
    opts.settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig*.json" },
            url = "https://json.schemastore.org/tsconfig.json",
          },
          {
            fileMatch = { "prettierrc.json" },
            url = "https://json.schemastore.org/prettierrc.json",
          },
        },
      },
    }
  end,
}

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if enhance_server_opts[lsp] then
    enhance_server_opts[lsp](opts)
  end

  lspconfig[lsp].setup(opts)
end

vim.diagnostic.config { virtual_text = false }
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
