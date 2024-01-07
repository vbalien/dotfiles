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
set.clipboard = "unnamedplus"
set.mouse = "a"
set.completeopt = "menu,menuone,noselect"
set.background = "dark"

set.guifont = "Terminess Nerd Font:h10"

if vim.loop.os_uname().sysname == "Windows_NT" then -- use powershell on windows
	set.shell = "pwsh.exe -NoLogo"
end
