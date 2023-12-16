return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "typescript" })
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			table.insert(opts.ensure_installed, "typescript-language-server")
			-- table.insert(opts.ensure_installed, "deno")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tsserver = {
					single_file_support = false,
				},
				-- denols = {},
			},
		},
		setup = {
			tsserver = function(_, opts)
				local nvim_lsp = require("nvim_lsp")
				opts.root_dir = nvim_lsp.util.root_pattern("package.json")
				return false
			end,

			-- denols = function(_, opts)
			-- 	local nvim_lsp = require("nvim_lsp")
			-- 	opts.denols.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")
			-- 	return false
			-- end,
		},
	},

	{
		"lukas-reineke/lsp-format.nvim",
		opts = {
			typescript = {
				exclude = { "tsserver" },
			},
		},
	},
}
