return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "c_sharp" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				omnisharp = {
					enable_editorconfig_support = true,
					analyze_open_documents_only = true,
					enable_roslyn_analyzers = true,
					enable_import_completion = true,
					organize_imports_on_format = true,
				},
			},
		},
	},

	-- conform.nvim for C# formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				cs = { "csharpier", lsp_format = "fallback" },
			},
		},
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "csharpier" })
		end,
	},
}
