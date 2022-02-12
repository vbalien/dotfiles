local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local lspconfig = require "lspconfig"

local function on_attach(client)
  if client.name ~= "efm" then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
        augroup Format
          au! * <buffer>
          au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 3000)
        augroup END
      ]]
  end
end

local servers = {
  "eslint",
  "tsserver",
  "efm",
  "sumneko_lua",
  "vimls",
  "jsonls",
}

local enhance_server_opts = {
  ["efm"] = function(opts)
    local eslint = {
      rootMarkers = { ".eslintrc", "package.json" },
      lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
      lintIgnoreExitCode = true,
      lintStdin = true,
      lintFormats = { "%f:%l:%c: %m" },
      formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
      formatStdin = true,
    }
    local prettier = {
      rootMarkers = { ".prettierrc", "package.json" },
      formatCommand = 'prettierd "${INPUT}"',
      formatStdin = true,
    }
    local stylua = {
      rootMarkers = { "stylua.toml" },
      formatCommand = "stylua -s -",
      formatStdin = true,
    }
    local languages = {
      lua = { stylua },
      css = { prettier },
      html = { prettier },
      javascript = { prettier, eslint },
      javascriptreact = { prettier, eslint },
      json = { prettier },
      markdown = { prettier },
      scss = { prettier },
      typescript = { prettier, eslint },
      typescriptreact = { prettier, eslint },
      yaml = { prettier },
    }

    opts.root_dir = lspconfig.util.root_pattern { ".git/" }
    opts.init_options = { documentFormatting = true }
    opts.settings = {
      languages = languages,
    }
    opts.filetypes = vim.tbl_keys(languages)
  end,

  ["eslint"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern { ".git/" }
    opts.settings = {
      packageManager = "yarn",
      workingDirectory = { mode = "location" },
    }
  end,

  ["tsserver"] = function(opts)
    opts.root_dir = lspconfig.util.root_pattern { ".git/" }
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
