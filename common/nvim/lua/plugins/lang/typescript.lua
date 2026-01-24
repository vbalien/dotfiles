return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "typescript-language-server", "eslint-lsp", "eslint_d" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {
					single_file_support = false,
				},
				eslint = {
					settings = {
						workingDirectories = { mode = "auto" },
					},
				},
			},
		},
	},

	-- ESLint fix + Prettier via conform
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "eslint_d", "prettierd", stop_after_first = false },
				typescript = { "eslint_d", "prettierd", stop_after_first = false },
				javascriptreact = { "eslint_d", "prettierd", stop_after_first = false },
				typescriptreact = { "eslint_d", "prettierd", stop_after_first = false },
			},
		},
	},
}
