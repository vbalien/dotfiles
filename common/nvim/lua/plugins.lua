local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  
]]

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end
return require("packer").startup(function() -- If you want devicons
  local use = require("packer").use
  use "wbthomason/packer.nvim"

  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").opts)
    end,
  }

  use "neovim/nvim-lspconfig"

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match "%s"
            == nil
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),

        experimental = {
          ghost_text = true,
        },
      }
    end,
  }
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load()
      require("luasnip").filetype_extend("typescript", { "javascript" })
      require("luasnip").filetype_extend(
        "typescriptreact",
        { "javascriptreact" }
      )
    end,
  }
  use "saadparwaiz1/cmp_luasnip"
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        floating_window = false,
      }
    end,
  }
  use "rafamadriz/friendly-snippets"
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
      )
    end,
  }

  use {
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
    config = function()
      require("lualine").setup {
        options = {
          theme = "dracula-nvim",
          section_separators = "",
          component_separators = "",
        },
      }
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        auto_close = true,
        view = {
          side = "right",
          width = 35,
          mappings = {
            list = {
              {
                key = "<Tab>",
                cb = ":NvimTreeToggle<cr>",
              },
            },
          },
        },
        git = {
          enable = true,
          ignore = false,
        },
      }
      vim.g.nvim_tree_quit_on_open = 1
    end,
    requires = "kyazdani42/nvim-web-devicons",
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      local actions = require "telescope.actions"
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".yarn", ".git" },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            hidden = true,
          },
          live_grep = {
            theme = "dropdown",
            hidden = true,
          },
          current_buffer_fuzzy_find = { theme = "dropdown" },
          lsp_code_actions = {
            theme = "cursor",
            hidden = true,
          },
        },
      }
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd [[
        highlight IndentBlanklineChar guifg=gray guibg=none gui=nocombine
        highlight IndentBlanklineSpaceChar guifg=none guibg=none gui=nocombine
        highlight IndentBlanklineSpaceCharBlankline guifg=none guibg=none gui=nocombine
        highlight IndentBlanklineContextChar guifg=#4B5263 guibg=#4B5263 gui=nocombine
        highlight IndentBlanklineContextStart guifg=none guibg=#4B5263 gui=nocombine
      ]]
      vim.opt.list = true

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }

  use {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDAltDelims_java = 1
    end,
  }

  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      }
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "maintained",
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      }
    end,
  }

  use "Mofiqul/dracula.nvim"

  use {
    "dstein64/nvim-scrollview",
    config = function()
      vim.cmd "highlight ScrollView ctermbg=159 guibg=LightCyan"
    end,
  }
  use "wakatime/vim-wakatime"
  use "airblade/vim-gitgutter"
  use "pantharshit00/vim-prisma"
  use "styled-components/vim-styled-components"
  use "lbrayner/vim-rzip"
  use "ckipp01/stylua-nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
