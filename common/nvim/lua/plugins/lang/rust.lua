return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								buildScripts = {
									enable = true,
								},
							},
							checkOnSave = true,
							check = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
						},
					},
				},
			},
		},
	},

	-- conform.nvim for Rust formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt", lsp_format = "fallback" },
			},
		},
	},
}
