local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local enabled = {
	"lazy.nvim",
	"Comment.nvim",
	"nvim-autopairs",
}

local opts = {
	defaults = {
		lazy = true,
		cond = function(plugin)
			if vim.g.vscode then
				return vim.tbl_contains(enabled, plugin.name)
			else
				return true
			end
		end,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
	spec = {
		{
			import = "plugins",
		},
		{
			import = "plugins.lang",
		},
	},
}

-- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec
require("lazy").setup(opts)
