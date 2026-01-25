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

-- SSH 환경에서 OSC 52 사용
if vim.env.SSH_TTY then
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
	}
end
set.mouse = "a"
set.completeopt = "menu,menuone,noselect"
set.background = "dark"
set.updatetime = 250 -- CursorHold 대기 시간 (ms)

set.guifont = "Terminess Nerd Font:h10"

if vim.uv.os_uname().sysname == "Windows_NT" then -- use powershell on windows
	set.shell = "pwsh.exe -NoLogo"
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "single",
		source = true,
	},
})

-- 커서 멈추면 자동으로 diagnostic float 표시
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})
