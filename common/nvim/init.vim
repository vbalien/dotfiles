lua require('plugins')
source ~/.config/nvim/keybinding.vim

set smartindent
set autoindent
set cindent
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set nu
set ruler
set title
set hlsearch
set cursorline
set termguicolors
set clipboard=unnamed,unnamedplus
set mouse=a

syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
autocmd BufNewFile,BufRead .eslintrc,.prettierrc,.parcelrc set filetype=json

