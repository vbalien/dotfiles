return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		lazy = false, -- treesitter doesn't support lazy loading
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
		},
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	{
		"hiphish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},
}
