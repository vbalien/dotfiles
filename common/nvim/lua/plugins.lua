local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-tsserver',
        'coc-html',
        'coc-css',
        'coc-prettier',
        'coc-deno',
        'coc-yaml',
        'coc-markdownlint'
      }
      vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')
    end
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require("bufferline").setup{
      options = {
        diagnostics = "coc",
        separator_style = "thin",
        show_close_icon = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center"
          },
          {
            filetype = "minimap",
            text = "Minimap",
            highlight = "Directory",
            text_align = "center"
          }
        }
      }
    } end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require'lualine'.setup {
      options = {
        theme = 'dracula',
        section_separators = '',
        component_separators = ''
      }
    } end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup{
        auto_close = true,
        view = {
          side = 'right',
          width = 35,
          mappings = {
            list = {
              { key = "<Tab>", cb = ':NvimTreeToggle<cr>' },
            }
          }
        }
      }
      vim.g.nvim_tree_quit_on_open = 1
    end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            }
          }
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "dropdown",
          },
          current_buffer_fuzzy_find = {
            theme = "dropdown",
          }
        }
      }
    end
  }

  use {
    'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_char='│'
      vim.g.indentLine_color_gui='gray'
    end
  }

  use {
    'Raimondi/delimitMate',
    config = function()
      vim.g.delimitMate_expand_cr = 1
    end
  }

  use {
    'preservim/nerdcommenter',
    config = function()
      vim.g.NERDAltDelims_java = 1
    end
  }

  use {
    'karb94/neoscroll.nvim',
    config = function ()
      vim.cmd('highlight ScrollView ctermbg=159 guibg=LightCyan')
      require('neoscroll').setup({
          mappings = {'<C-u>', '<C-d>',
                      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        })
    end
  }

  use {
    'dstein64/nvim-scrollview'
  }

  use {'dracula/vim', as = 'dracula'}
  use 'mhinz/vim-startify'
  use 'wakatime/vim-wakatime'
  use 'airblade/vim-gitgutter'
  use 'sheerun/vim-polyglot'
  use 'pantharshit00/vim-prisma'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
