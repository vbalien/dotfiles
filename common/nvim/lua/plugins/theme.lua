return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",

			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				noice = true,
				mason = true,
				lsp_trouble = true,
				illuminate = {
					enabled = true,
					lsp = true,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "mauve",
					colored_indent_levels = false,
				},
			},
		},
	},

	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	lazy = true,
	-- 	config = function()
	-- 		local colors = require("dracula").colors()
	-- 		vim.g.dracula_transparent_bg = true
	-- 		highlight("CursorLineNr", { guifg = colors.fg, gui = "bold" })
	-- 		highlight("LineNr", { guifg = colors.comment, guibg = colors.menu })
	-- 	end,
	-- },

	-- {
	-- 	"folke/noice.nvim",
	-- 	optional = true,
	-- 	opts = function()
	-- 		local colors = require("dracula").colors()
	-- 		highlight("NoiceLspProgressTitle", { guifg = colors.purple })
	-- 	end,
	-- },

	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	optional = true,
	-- 	opts = function()
	-- 		local colors = require("dracula").colors()
	-- 		highlight("SignColumn", { guifg = colors.menu })
	-- 		highlight("GitSignsAdd", { guifg = colors.green, guibg = colors.menu })
	-- 		highlight("GitSignsDelete", { guifg = colors.red, guibg = colors.menu })
	-- 		highlight("GitSignsChange", { guifg = colors.yellow, guibg = colors.menu })
	-- 	end,
	-- },

	-- {
	-- 	"dstein64/nvim-scrollview",
	-- 	optional = true,
	-- 	opts = function()
	-- 		local colors = require("dracula").colors()
	-- 		highlight("ScrollView", { guibg = colors.white })
	-- 	end,
	-- },

	-- {
	-- 	"RRethy/vim-illuminate",
	-- 	optional = true,
	-- 	opts = function()
	-- 		local colors = require("dracula").colors()
	-- 		highlight("IlluminatedWordText", { guibg = colors.selection })
	-- 		highlight("IlluminatedWordRead", { guibg = colors.selection })
	-- 		highlight("IlluminatedWordWrite", { guibg = colors.selection })
	-- 	end,
	-- },
}
