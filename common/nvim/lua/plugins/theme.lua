return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			default_integrations = true,
			integrations = {
				barbar = true,
				blink_cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				noice = true,
				mason = true,
				lsp_trouble = true,
				flash = true,
				native_lsp = { enabled = true },
				rainbow_delimiters = true,
				snacks = {
					enabled = true,
					indent_scope_color = "mauve",
				},
			},
		},
	},
}
