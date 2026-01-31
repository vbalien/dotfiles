return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "python", "toml" })
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "pyright", "ruff" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					settings = {
						pyright = {
							disableOrganizeImports = true, -- ruff handles import sorting
						},
						python = {
							analysis = {
								typeCheckingMode = "basic",
								diagnosticSeverityOverrides = {
									reportUnusedImport = "none", -- ruff handles this
								},
							},
						},
					},
				},
				ruff = {},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "ruff_organize_imports", "ruff_format" },
			},
		},
	},
}
