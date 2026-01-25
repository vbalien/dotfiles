local util = require("util")
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local vnoremap = util.vnoremap
local tnoremap = util.tnoremap

----------------
-- Terminal window navigation
----------------
tnoremap("<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
tnoremap("<C-w>j", "<C-\\><C-n><C-w>j", { silent = true })
tnoremap("<C-w>k", "<C-\\><C-n><C-w>k", { silent = true })
tnoremap("<C-w>l", "<C-\\><C-n><C-w>l", { silent = true })

----------------
-- Nvim tree
----------------
if not vim.g.vscode then
	nnoremap("<Tab>", function() -- toggle tree
		local api = require("nvim-tree.api")
		return api.tree.toggle({
			focus = true,
			find_file = true,
		})
	end, {
		silent = true,
	})
end

----------------
-- LSP
----------------
if not vim.g.vscode then
	nnoremap("K", function() -- show document
		vim.lsp.buf.hover()
	end, {
		silent = true,
	})
else
	nnoremap("K", function() -- show document
		require("vscode-neovim").call("editor.action.showHover")
	end, {
		silent = true,
	})
end

----------------
-- Code action
----------------
nnoremap("<Space>ca", function() -- select code action
	return vim.lsp.buf.code_action({})
end, {
	silent = true,
})

----------------
-- Icon picker
----------------
nnoremap("<Leader><S-i>", "<cmd>PickEverything<cr>", {
	silent = true,
})
inoremap("<Leader><S-i>", "<cmd>PickEverythingInsert<cr>", {
	silent = true,
})

inoremap("<C-c>", "<Esc>", {
	silent = true,
})

----------------
-- Mouse
----------------
nnoremap("<MiddleMouse>", "<Nop>", {
	silent = true,
})
vnoremap("<MiddleMouse>", "<Nop>", {
	silent = true,
})
inoremap("<MiddleMouse>", "<Nop>", {
	silent = true,
})
nnoremap("<2-MiddleMouse>", "<Nop>", {
	silent = true,
})
vnoremap("<2-MiddleMouse>", "<Nop>", {
	silent = true,
})
inoremap("<2-MiddleMouse>", "<Nop>", {
	silent = true,
})
nnoremap("<3-MiddleMouse>", "<Nop>", {
	silent = true,
})
vnoremap("<3-MiddleMouse>", "<Nop>", {
	silent = true,
})
inoremap("<3-MiddleMouse>", "<Nop>", {
	silent = true,
})
nnoremap("<4-MiddleMouse>", "<Nop>", {
	silent = true,
})
vnoremap("<4-MiddleMouse>", "<Nop>", {
	silent = true,
})
inoremap("<4-MiddleMouse>", "<Nop>", {
	silent = true,
})

