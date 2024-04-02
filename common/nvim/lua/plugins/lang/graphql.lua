return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "graphql" })
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			table.insert(opts.ensure_installed, "graphql-language-service-cli")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				graphql = {},
			},
		},
	},
}
