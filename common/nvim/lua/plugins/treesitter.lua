return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync" },
		opts = {
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		},
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
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
		"hiphish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},
}
