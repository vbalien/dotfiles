local util = require("util")
local nnoremap = util.nnoremap
local inoremap = util.inoremap
local vnoremap = util.vnoremap
local borderchars = util.borderchars

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
-- Telescope
----------------
nnoremap("<Leader>p", function() -- find files
	return require("telescope.builtin").find_files({
		borderchars = borderchars({}),
	})
end, {
	silent = true,
})
nnoremap("<Leader>o", function() -- find files with grep
	return require("telescope.builtin").live_grep({
		borderchars = borderchars({}),
	})
end, {
	silent = true,
})
nnoremap("<Leader>f", function() -- find in current buffer
	return require("telescope.builtin").current_buffer_fuzzy_find({
		borderchars = borderchars({}),
	})
end, {
	silent = true,
})
nnoremap("<Leader><S-a>", function() -- select buffer
	return require("telescope.builtin").buffers({
		previewer = false,
		path_display = { "shorten" },
		borderchars = borderchars({}),
	})
end, {
	silent = true,
})
nnoremap("<Space>ca", function() -- select code action
	return vim.lsp.buf.code_action({})
end, {
	silent = true,
})
nnoremap("gd", function() -- go definition
	return require("telescope.builtin").lsp_definitions({
		borderchars = borderchars({ right_preview = true }),
	})
end, {
	silent = true,
})
nnoremap("<Leader><S-o>", function() -- manage projects
	return require("telescope").extensions.project.project({})
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
