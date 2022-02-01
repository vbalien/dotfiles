require "plugins"
require "core.keymaps"
require "core.lsp"
require "yarn-pnp"

local set = vim.o

set.smartindent = true
set.autoindent = true
set.cindent = true
set.backspace = "indent,eol,start"
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.nu = true
set.ruler = true
set.title = true
set.hlsearch = true
set.cursorline = true
set.termguicolors = true
set.clipboard = "unnamed,unnamedplus"
set.mouse = "a"
set.exrc = true
set.secure = true
set.completeopt = "menu,menuone,noselect"

vim.g.dracula_transparent_bg = true
vim.cmd [[
syntax enable
autocmd BufNewFile,BufRead .eslintrc,.prettierrc,.parcelrc set filetype=json
colorscheme dracula
]]

local local_vimrc = vim.fn.getcwd() .. "/.nvimrc"
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd("source " .. local_vimrc)
end
